# 以下のコードは関係ある部分のみの抜粋

# ① select_all のインターフェースが実装されている箇所

module ActiveRecord
  module ConnectionAdapters
    class AbstractAdapter
      include DatabaseStatements
    end
  end
end

module ActiveRecord
  module ConnectionAdapters
    module DatabaseStatements

      def select_all(arel, name = nil, binds = [], preparable: nil)
        arel = arel_from_relation(arel)
        sql, binds = to_sql_and_binds(arel, binds)

        if preparable.nil?
          preparable = prepared_statements ? visitor.preparable : false
        end

        if prepared_statements && preparable
          select_prepared(sql, name, binds)
        else
          select(sql, name, binds)
        end
      end
    end
  end
end

# ①終わり

# ② MySQLでselect_all メソッドが実装されている箇所

module ActiveRecord
  module ConnectionAdapters
    class AbstractMysqlAdapter < AbstractAdapter
    end
  end
end

module ActiveRecord
  module ConnectionAdapters
    class Mysql2Adapter < AbstractMysqlAdapter
      include MySQL::DatabaseStatements
    end
  end
end

module ActiveRecord
  module ConnectionAdapters
    module MySQL
      module DatabaseStatements
        def select_all(*, **)
          result = if ExplainRegistry.collect? && prepared_statements
                     unprepared_statement { super }
                   else
                     super
                   end
          @connection.abandon_results!
          result
        end
      end
    end
  end
end

# ② 終わり

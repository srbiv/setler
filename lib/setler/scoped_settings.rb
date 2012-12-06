module Setler
  class ScopedSettings < Settings
    def self.for_thing(object, scopename)
      self.table_name = scopename
      @setler_active_record_class = eval(scopename.to_s.camelize)

      @object = object
      self
    end

    def self.thing_scoped
      @setler_active_record_class.where(thing_type: @object.class.base_class.to_s, thing_id: @object.id)
    end

  end
end

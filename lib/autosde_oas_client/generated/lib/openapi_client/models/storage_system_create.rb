=begin
#Site Manager API

#Site Manager API

The version of the OpenAPI document: 1.0.0
Contact: autosde@il.ibm.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

require 'date'

module OpenapiClient
  # TODO add description
  class StorageSystemCreate
    # auto_add_pools
    attr_accessor :auto_add_pools

    # auto_setup
    attr_accessor :auto_setup

    # chap_name
    attr_accessor :chap_name

    # chap_secret
    attr_accessor :chap_secret

    # component_state
    attr_accessor :component_state

    attr_accessor :iqn

    # management_ip
    attr_accessor :management_ip

    # name
    attr_accessor :name

    # password
    attr_accessor :password

    # port_type
    attr_accessor :port_type

    # secondary_ip
    attr_accessor :secondary_ip

    # storage_array
    attr_accessor :storage_array

    # storage_driver
    attr_accessor :storage_driver

    # storage_family
    attr_accessor :storage_family

    attr_accessor :system_type

    # user
    attr_accessor :user

    # wwpn
    attr_accessor :wwpn

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'auto_add_pools' => :'auto_add_pools',
        :'auto_setup' => :'auto_setup',
        :'chap_name' => :'chap_name',
        :'chap_secret' => :'chap_secret',
        :'component_state' => :'component_state',
        :'iqn' => :'iqn',
        :'management_ip' => :'management_ip',
        :'name' => :'name',
        :'password' => :'password',
        :'port_type' => :'port_type',
        :'secondary_ip' => :'secondary_ip',
        :'storage_array' => :'storage_array',
        :'storage_driver' => :'storage_driver',
        :'storage_family' => :'storage_family',
        :'system_type' => :'system_type',
        :'user' => :'user',
        :'wwpn' => :'wwpn'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'auto_add_pools' => :'Boolean',
        :'auto_setup' => :'Boolean',
        :'chap_name' => :'String',
        :'chap_secret' => :'String',
        :'component_state' => :'String',
        :'iqn' => :'String',
        :'management_ip' => :'String',
        :'name' => :'String',
        :'password' => :'String',
        :'port_type' => :'String',
        :'secondary_ip' => :'String',
        :'storage_array' => :'String',
        :'storage_driver' => :'String',
        :'storage_family' => :'String',
        :'system_type' => :'SystemType',
        :'user' => :'String',
        :'wwpn' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `OpenapiClient::StorageSystemCreate` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `OpenapiClient::StorageSystemCreate`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'auto_add_pools')
        self.auto_add_pools = attributes[:'auto_add_pools']
      else
        self.auto_add_pools = false
      end

      if attributes.key?(:'auto_setup')
        self.auto_setup = attributes[:'auto_setup']
      else
        self.auto_setup = false
      end

      if attributes.key?(:'chap_name')
        self.chap_name = attributes[:'chap_name']
      end

      if attributes.key?(:'chap_secret')
        self.chap_secret = attributes[:'chap_secret']
      end

      if attributes.key?(:'component_state')
        self.component_state = attributes[:'component_state']
      end

      if attributes.key?(:'iqn')
        self.iqn = attributes[:'iqn']
      end

      if attributes.key?(:'management_ip')
        self.management_ip = attributes[:'management_ip']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'password')
        self.password = attributes[:'password']
      end

      if attributes.key?(:'port_type')
        self.port_type = attributes[:'port_type']
      end

      if attributes.key?(:'secondary_ip')
        self.secondary_ip = attributes[:'secondary_ip']
      end

      if attributes.key?(:'storage_array')
        self.storage_array = attributes[:'storage_array']
      end

      if attributes.key?(:'storage_driver')
        self.storage_driver = attributes[:'storage_driver']
      end

      if attributes.key?(:'storage_family')
        self.storage_family = attributes[:'storage_family']
      end

      if attributes.key?(:'system_type')
        self.system_type = attributes[:'system_type']
      end

      if attributes.key?(:'user')
        self.user = attributes[:'user']
      end

      if attributes.key?(:'wwpn')
        self.wwpn = attributes[:'wwpn']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@component_state.nil? && @component_state.to_s.length > 32
        invalid_properties.push('invalid value for "component_state", the character length must be smaller than or equal to 32.')
      end

      if !@name.nil? && @name.to_s.length > 15
        invalid_properties.push('invalid value for "name", the character length must be smaller than or equal to 15.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      component_state_validator = EnumAttributeValidator.new('String', ["PENDING_CREATION", "CREATED", "DELETED", "PENDING_DELETION", "MODIFICATION", "PENDING_MODIFICATION"])
      return false unless component_state_validator.valid?(@component_state)
      return false if !@component_state.nil? && @component_state.to_s.length > 32
      return false if !@name.nil? && @name.to_s.length > 15
      port_type_validator = EnumAttributeValidator.new('String', ["ISCSI", "FC", "NVMeFC"])
      return false unless port_type_validator.valid?(@port_type)
      storage_family_validator = EnumAttributeValidator.new('String', ["", "ontap_7mode", "ontap_cluster"])
      return false unless storage_family_validator.valid?(@storage_family)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] component_state Object to be assigned
    def component_state=(component_state)
      validator = EnumAttributeValidator.new('String', ["PENDING_CREATION", "CREATED", "DELETED", "PENDING_DELETION", "MODIFICATION", "PENDING_MODIFICATION"])
      unless validator.valid?(component_state)
        fail ArgumentError, "invalid value for \"component_state\", must be one of #{validator.allowable_values}."
      end
      @component_state = component_state
    end

    # Custom attribute writer method with validation
    # @param [Object] name Value to be assigned
    def name=(name)
      if !name.nil? && name.to_s.length > 15
        fail ArgumentError, 'invalid value for "name", the character length must be smaller than or equal to 15.'
      end

      @name = name
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] port_type Object to be assigned
    def port_type=(port_type)
      validator = EnumAttributeValidator.new('String', ["ISCSI", "FC", "NVMeFC"])
      unless validator.valid?(port_type)
        fail ArgumentError, "invalid value for \"port_type\", must be one of #{validator.allowable_values}."
      end
      @port_type = port_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] storage_family Object to be assigned
    def storage_family=(storage_family)
      validator = EnumAttributeValidator.new('String', ["", "ontap_7mode", "ontap_cluster"])
      unless validator.valid?(storage_family)
        fail ArgumentError, "invalid value for \"storage_family\", must be one of #{validator.allowable_values}."
      end
      @storage_family = storage_family
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          auto_add_pools == o.auto_add_pools &&
          auto_setup == o.auto_setup &&
          chap_name == o.chap_name &&
          chap_secret == o.chap_secret &&
          component_state == o.component_state &&
          iqn == o.iqn &&
          management_ip == o.management_ip &&
          name == o.name &&
          password == o.password &&
          port_type == o.port_type &&
          secondary_ip == o.secondary_ip &&
          storage_array == o.storage_array &&
          storage_driver == o.storage_driver &&
          storage_family == o.storage_family &&
          system_type == o.system_type &&
          user == o.user &&
          wwpn == o.wwpn
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [auto_add_pools, auto_setup, chap_name, chap_secret, component_state, iqn, management_ip, name, password, port_type, secondary_ip, storage_array, storage_driver, storage_family, system_type, user, wwpn].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        OpenapiClient.const_get(type).build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end
        
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
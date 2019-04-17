#--
# Ruby Whois
#
# An intelligent pure Ruby WHOIS client and parser.
#
# Copyright (c) 2009-2018 Simone Carletti <weppos@weppos.net>
#++


require_relative 'base'
require 'whois/scanners/whois.nic.ir.rb'

module Whois
  class Parsers

    #
    # = whois.nic.ir parser
    #
    # Parser for the whois.nic.ir server.
    #
    # NOTE: This parser is just a stub and provides only a few basic methods
    # to check for domain availability and get domain status.
    # Please consider to contribute implementing missing methods.
    # See WhoisNicIt parser for an explanation of all available methods
    # and examples.
    #
    class WhoisNicIr < Base
      include Scanners::Scannable

      self.scanner = Scanners::WhoisNicIr


      property_supported :available? do
        !!(content_for_scanner =~ /%ERROR:101: no entries found/)
      end

      property_supported :registered? do
        !available?
      end

      property_supported :phone do
        node('phone')
      end
    end

  end

end

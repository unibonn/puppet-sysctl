require 'puppet/provider/parsedfile'

sysctlconf = "/etc/sysctl.conf"

Puppet::Type.type(:sysctl).provide(:parsed,
                                   :parent => Puppet::Provider::ParsedFile,
                                   :default_target => sysctlconf,
                                   :filetype => :flat
                                   ) do

    confine :exists => sysctlconf
    text_line :comment, :match => /^#/;
    text_line :blank, :match => /^\s*$/;

    record_line :parsed, :fields => %w{name wert}, :joiner => ' = ', :separator => /\s*=\s*/

end

defmodule RouterControls.IpTables do
  import RouterControls.OsCommand

  def unmark_mac(mac) do
    os_cmd("iptables", ["-t", "mangle", "-I", "internet", "1", "-m", "mac", "--mac-source", mac, "-j", "RETURN"])
  end

  def mark_mac(mac) do
    os_cmd("iptables", ["-t", "mangle", "-I", "internet", "1", "-m", "mac", "--mac-source", mac, "-j", "MARK", "--set-mark", "99"])
  end
end

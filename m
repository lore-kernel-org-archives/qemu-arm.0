Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp812811lfp;
        Mon, 20 Jan 2020 15:55:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqy9s8EHz482jGsnUMds/ZL3mX19EvdwrLAQjtPKx79QNH8auLIk0s1PFEqJI/BYEDhjVD92
X-Received: by 2002:a17:906:7006:: with SMTP id n6mr1813424ejj.1.1579564504923;
        Mon, 20 Jan 2020 15:55:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579564504; cv=none;
        d=google.com; s=arc-20160816;
        b=XYhOH3DVxedMZOsgCJF2qUsBQavB70ojFPtA6oZuOBUBxg9jKLAaCNt5n4CkdDVyEN
         VnfujiQuBHw3LcvrJX9jSKetgrnX2vc8UEwqHo8H3aNcBFO6aGAv6caHTANSYtKuKNab
         34/s0Ekpt2zy9QrVE1lVwMTnbybcJfPIWEoInxTAXNS57Ex17YzA8RSqAm7ayA2L3X+O
         h4VZ6Yus6szO2wgDZKpGE81LLDGrsAXYh3cu9KHgOS8M8gLXZftM7U8nP0Y89Wwg+bZA
         QvgpXCz+bVOuWXI1NizCn7H6V9WQ+VlpPGv6HJGph5tTicS8+YDbkTQfGct2cRiVAqHF
         gG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mHOBTTcVp9EP98oXfsYEhgEPBD3nh+UXg7LeIFUoJ4Q=;
        b=HZEp4KIhmceZNppFwU8XBwMIR8nvHYgVZhizYhgwCMHlkMOR2jXk+zpGNfF/MFWCIK
         1PBLxwWeXM2/kURWtMtyTIrEJ5ns9CWNio2Ehnhg0S9jZLJfenaUe4pcqYr29AVyx3gd
         LHvTodMnn9tC6JCE7uk6DthqbhHnMftmnhhPYR2m0avU0HQJo3wEI1hL4e+4idlLqU7l
         eXrZtYjaNHz1ivJZaHH5MN1fNd3qTAbfTWrY90hfElMrd06K2iHwbfIXW+nuB5Kugd0f
         vNDkOc+mIF57Z9auBnvv6gePVVWnIlkdRftuiT/DcPacgPObzUrckOG6oryyxSUce85C
         sbkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TJNplbe2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si23884347edr.114.2020.01.20.15.55.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 15:55:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TJNplbe2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itgsp-0004qA-O5
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 18:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35773)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1itgq2-0000qA-Ms
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 18:52:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1itgq1-0007Y9-Hy
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 18:52:10 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40815)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1itgpz-0007Wo-0t; Mon, 20 Jan 2020 18:52:07 -0500
Received: by mail-wm1-x336.google.com with SMTP id t14so1130336wmi.5;
 Mon, 20 Jan 2020 15:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mHOBTTcVp9EP98oXfsYEhgEPBD3nh+UXg7LeIFUoJ4Q=;
 b=TJNplbe2btvc0+SuQm0uMKluglrZPDz6clmgWyWIp/0bj2pml6R1qYMYimlABEC8vu
 bpUC3OBQO/Q75PBKmo61h9fxw5fh394PQKFJZqiMt7khYTAEYuzaFMJsZTuGo4cVHUxB
 +nXTQm3RciCbTdUDE8E0UQVstb2xpcnsD1XWyQUuIZYda4Mi9i0ZhS/DuJJ3iTKryt5U
 LN/8Qtck4j7/Cld47VdJkLPsrE8WgvNU3P1h6F0cfD19/n8YNKy1Mm6sIgPeV/XnJwZE
 NSW5JMugdg2Jn9LIA+NBXRpiPk3YlRTn9rM1d4S7mvhD+9WDIC/6ieaTcYCercEB3aSk
 5HmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mHOBTTcVp9EP98oXfsYEhgEPBD3nh+UXg7LeIFUoJ4Q=;
 b=Bw1jX+dmIWEeq1PYGPVToyHIlMN4ZXm/1XLpj9AiWl9h+Gl6xTHE907Bz60sFfAyt9
 PG+q2Vco5Ibqu4Rxm7zqSpqmL7LQNPo3MD9OF7phggw04SlTZaRt2uTWFraXsC7RY/rM
 taDwOKjPbfuVkgGbf6Lq3VAvhgyqVKN9kYXdmGfQe0iqL+NjiTiFPS7Rguq+NrqgHnPx
 AuWujcVWuHtip4STsfKCC4vC9l1tfsSG3ljIzYXTwP/9YqJxJ6TOltLZnRJ7rFea+g1f
 IU1mC6jeEQwxnM/iZBxrot6XsvG91uJmUrdi/6gNKlocfMLjEaSw94CyF5xm3Th1gqQB
 eP+A==
X-Gm-Message-State: APjAAAX2c57bHnXxM/k4KU6smJ8YbHRBWoicQWCQL7sOTAH0B51hhdQT
 H5jRD6Sa8rr0XriiDnv2cBlumot9
X-Received: by 2002:a1c:5419:: with SMTP id i25mr1229047wmb.150.1579564325471; 
 Mon, 20 Jan 2020 15:52:05 -0800 (PST)
Received: from x1w.redhat.com (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id d8sm48655269wrx.71.2020.01.20.15.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 15:52:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/7] Acceptance tests: Extract _console_interaction()
Date: Tue, 21 Jan 2020 00:51:54 +0100
Message-Id: <20200120235159.18510-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200120235159.18510-1-f4bug@amsat.org>
References: <20200120235159.18510-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::336
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V9l/fj6+BjS0

Since we are going to re-use the code shared between
wait_for_console_pattern() and exec_command_and_wait_for_pattern(),
extract the common part into a local function.

Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/avocado_qemu/__init__.py | 31 +++++++++++++----------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 6618ea67c1..0a50fcf2be 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -55,19 +55,14 @@ def pick_default_qemu_bin(arch=None):
         return qemu_bin_from_src_dir_path
 
 
-def wait_for_console_pattern(test, success_message, failure_message=None):
-    """
-    Waits for messages to appear on the console, while logging the content
-
-    :param test: an Avocado test containing a VM that will have its console
-                 read and probed for a success or failure message
-    :type test: :class:`avocado_qemu.Test`
-    :param success_message: if this message appears, test succeeds
-    :param failure_message: if this message appears, test fails
-    """
+def _console_interaction(test, success_message, failure_message,
+                         send_string):
     console = test.vm.console_socket.makefile()
     console_logger = logging.getLogger('console')
     while True:
+        if send_string:
+            test.vm.console_socket.sendall(send_string.encode())
+            send_string = None # send only once
         msg = console.readline().strip()
         if not msg:
             continue
@@ -79,6 +74,17 @@ def wait_for_console_pattern(test, success_message, failure_message=None):
             fail = 'Failure message found in console: %s' % failure_message
             test.fail(fail)
 
+def wait_for_console_pattern(test, success_message, failure_message=None):
+    """
+    Waits for messages to appear on the console, while logging the content
+
+    :param test: an Avocado test containing a VM that will have its console
+                 read and probed for a success or failure message
+    :type test: :class:`avocado_qemu.Test`
+    :param success_message: if this message appears, test succeeds
+    :param failure_message: if this message appears, test fails
+    """
+    _console_interaction(test, success_message, failure_message, None)
 
 def exec_command_and_wait_for_pattern(test, command,
                                       success_message, failure_message=None):
@@ -94,10 +100,7 @@ def exec_command_and_wait_for_pattern(test, command,
     :param success_message: if this message appears, test succeeds
     :param failure_message: if this message appears, test fails
     """
-    command += '\r'
-    test.vm.console_socket.sendall(command.encode())
-    wait_for_console_pattern(test, success_message, failure_message)
-
+    _console_interaction(test, success_message, failure_message, command + '\r')
 
 class Test(avocado.Test):
     def _get_unique_tag_val(self, tag_name):
-- 
2.21.1


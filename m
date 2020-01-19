Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp969996lff;
        Sat, 18 Jan 2020 16:51:29 -0800 (PST)
X-Received: by 2002:a1c:f218:: with SMTP id s24mr12275584wmc.128.1579395089739;
        Sat, 18 Jan 2020 16:51:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579395089; cv=none;
        d=google.com; s=arc-20160816;
        b=zC8OyaFyF2sI2FXgfoGHgQO7jsJD7+cVCRVcBU2xWXua25xiNx/i/BDQaooZrLjMCw
         IRlVmWTk7e7j7Ch3MIFYqZxz6jBP6q3P7qsQyv/vGj3BmE6OlqhPd9jwKXjQp6Mg2rWl
         DrfvebbijHCuUJ145zUwcB8Jq8y3H9PWsqhy+H7PD22qyaNC0t1cf8u/6AOn14VmRMVO
         zqksBMYDKYEWetrZAqHiuGwlOF++b8/Is4eJao+debUZWumsj0Xx4bDim5aIDULwwmED
         jiuP3VGfPOJHwH56nfKTMpxqU791VhDkOuXcjUCLSfeld/LWjc7DwEa49YWiAzkSuLJk
         IOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=L8aTerMeWcsMXP4TJC7rS1Fx5gyQ/tHzqzZUZvCWPPA=;
        b=M461UD1AfrJNuD8eH5vmS1lERKBwCGFHkkvzK7h320fM3r2qfrha7QHHg12TzmxAYf
         sGoRnuhzsTLFtcmFynvZgBXaHmPEwsk2y+TLRYQq/kQjYZX5xFmuy1/FBKJT5RiKFsRk
         Ijfhy4h9HiXuJ9V2KqPh7OpM+v44ngq9AoqIQdSQhMkb+EWPuo3eOsajHHK3oSAI/BHb
         goGECqzM9MrB7XXJlZ78t1Zmo/TLBESQLHrzZPZLalkggS5tkMlGsGw6/OaXqkYDvUjA
         RaWk8JW2bNyRcppK6wQVzpJiWSbbxwoyRxQsXo2pC/xjWzXjbyqMEQlmN71N7kUlZXLN
         wmIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=EpVnW+p1;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n2sor6402166wmk.0.2020.01.18.16.51.29
        (Google Transport Security);
        Sat, 18 Jan 2020 16:51:29 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=EpVnW+p1;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L8aTerMeWcsMXP4TJC7rS1Fx5gyQ/tHzqzZUZvCWPPA=;
        b=EpVnW+p1pvtHulH/HfG35ccOR6YyIg7+MQpftC+toClCRsAN2mZL3u6Jz4IhS78jOH
         PXoywau3TvxAf0uU1ziz/Fwn12zt4zAjZsknt7cyz1EbYGyxQvLdyoSw7WMzYwaentGO
         qeNU4q/4yAhOQ+3CQ3G3kQ8vGyhqAnsc7+HODXm9t3rZmBZoESqFrx8TF5FURy5tMnzH
         tldexQYyJuLlv/f3K+OLcFIqYhLrVmp9jOgi7qcfDhyUIYaDMqhZJS13iNeD/VFMsANN
         1F899QBSGU1ETpu1LV5jcC7n/uC4dhX7/jkp33wRGOw3rhF0egc9zkXCSkpRhLuCuAow
         vpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L8aTerMeWcsMXP4TJC7rS1Fx5gyQ/tHzqzZUZvCWPPA=;
        b=kmmvFyS0nktT8cVsa3h9ano6zGuXoCxPpL9Ubny4SNanqCISlcsmnL0L3eAxaXwzxw
         Qw+S5yElM1I7/GVpzJL3gnZ57dQYsZUObxoat2Xk7IgDTob1np0/ZF8QMzvRLXvBhYrr
         59Y4dLMwgw0Wtai8rA7JjPBaeG8zV2bBN+8nA9ay+0FolH7Wtlo7+58pKCpSUXsb8Grn
         uATJ7lMxHevQ2o2uiu7NZlxLS18WmUZmFg3mvO0gzoC2iLA3Npuv4cKf0PX1w/v+zCsl
         32So+4wbFije41qjdEFS27NITlxc0kKivRwHDQpAnVeZoAnVwk4S8r1N0YO2mRU+GL60
         BUdA==
X-Gm-Message-State: APjAAAWSkAbbQvsiyutYL05LywppBDTxCFi9w10xAKnZO6V7rNxopUzX
	ovoT9f8TrFMcoilvIlAK01kVkwYB+YU=
X-Google-Smtp-Source: APXvYqyI1hqwTBLcORj3dcLFwrp8knVbcJs89umOzr7P4oDwGrq2IMLaf5GUOXsqOy2t+y/AAcSbVg==
X-Received: by 2002:a7b:c946:: with SMTP id i6mr11963402wml.28.1579395089446;
        Sat, 18 Jan 2020 16:51:29 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id h2sm41763568wrv.66.2020.01.18.16.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 16:51:29 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	philmd@redhat.com,
	b.galvani@gmail.com,
	jasowang@redhat.com,
	alex.bennee@linaro.org,
	imammedo@redhat.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PATCH v4 18/20] Acceptance tests: Add interrupt_interactive_console_until_pattern()
Date: Sun, 19 Jan 2020 01:51:00 +0100
Message-Id: <20200119005102.3847-19-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200119005102.3847-1-nieklinnenbank@gmail.com>
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: voG5vrFkQvh/

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We need a function to interrupt interactive consoles.

Example: Interrupt U-Boot to set different environment values.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 32 +++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 0a50fcf2be..d4358eb431 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -56,13 +56,15 @@ def pick_default_qemu_bin(arch=None):
 
 
 def _console_interaction(test, success_message, failure_message,
-                         send_string):
+                         send_string, keep_sending=False):
+    assert not keep_sending or send_string
     console = test.vm.console_socket.makefile()
     console_logger = logging.getLogger('console')
     while True:
         if send_string:
             test.vm.console_socket.sendall(send_string.encode())
-            send_string = None # send only once
+            if not keep_sending:
+                send_string = None # send only once
         msg = console.readline().strip()
         if not msg:
             continue
@@ -74,6 +76,32 @@ def _console_interaction(test, success_message, failure_message,
             fail = 'Failure message found in console: %s' % failure_message
             test.fail(fail)
 
+def interrupt_interactive_console_until_pattern(test, success_message,
+                                                failure_message=None,
+                                                interrupt_string='\r'):
+    """
+    Keep sending a string to interrupt a console prompt, while logging the
+    console output. Typical use case is to break a boot loader prompt, such:
+
+        Press a key within 5 seconds to interrupt boot process.
+        5
+        4
+        3
+        2
+        1
+        Booting default image...
+
+    :param test: an Avocado test containing a VM that will have its console
+                 read and probed for a success or failure message
+    :type test: :class:`avocado_qemu.Test`
+    :param success_message: if this message appears, test succeeds
+    :param failure_message: if this message appears, test fails
+    :param interrupt_string: a string to send to the console before trying
+                             to read a new line
+    """
+    _console_interaction(test, success_message, failure_message,
+                         interrupt_string, True)
+
 def wait_for_console_pattern(test, success_message, failure_message=None):
     """
     Waits for messages to appear on the console, while logging the content
-- 
2.17.1

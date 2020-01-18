Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp742590lff;
        Sat, 18 Jan 2020 11:16:28 -0800 (PST)
X-Received: by 2002:a1c:1f56:: with SMTP id f83mr10856868wmf.93.1579374988765;
        Sat, 18 Jan 2020 11:16:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579374988; cv=none;
        d=google.com; s=arc-20160816;
        b=XHG0aH0V04+LTed7a3tFKbd3T0pKxKbuHvLal4ZquW5Q7VMrLV9cDTGkOqU4udvVd+
         oEfrfiCeMFjIZvGM2e6lbXW0r0eYJtBm4sqH/SQlKskmY3gbBb3KZm/ecoEf4A1GaWUP
         aGxpeSH/6ByZvfWMSq92NurG6aMeRDVGA/xQqgfgN3sHRTw79Le8WE5k5abWRf1yVW2S
         CRKb7fS03423BUeDKDuxV6bW2FlxjjbiQzj/0tEfTFZQq48jfJBbzhlajYq1nLaFyhaY
         +zFE+ptoHsLkL5F1SCtV28gxjIJG/HbyLGeQTO64YSHRBqAu1N+DMMUH2bpSodD49AsK
         ON9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=vxrD2JWpr3rTdsCECp/XxWuqHq2ybHJ1OCxK1G7l1i0=;
        b=Y5i7yHsF84P37vj4IPmdKRyamPwNEBNoRPQHfKWTvetaUQkjMMB6ceO3kLyOD3YAn0
         3XxQ+Boo8P22eX30STVzWeXJa9cQmYGqqymsfXAouxM3XnNGS3ymvNFMiRAtn7hT8NX/
         /WIj9yKQwgbMwnFJu2Jj5Pgu7t9Xr5w8+fXOFIQyEipttcHEF6lYxPXfzFxChAFltYhe
         agYCzUUOcLZyMZVcOKKtZtCz93e0Gv96MEUiyJjqe/st8Do2JTTIaz+xU4Mzn/IDv6Ma
         Hy5Mvicm5Bhj9E6geOnBXdDswZnKvomR6yq2NtdcB9nhOzbfLj/mWsBhtu3gO27yhFue
         MNWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=fopJ2RMd;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l9sor13164666wrq.58.2020.01.18.11.16.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 18 Jan 2020 11:16:28 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=fopJ2RMd;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vxrD2JWpr3rTdsCECp/XxWuqHq2ybHJ1OCxK1G7l1i0=;
        b=fopJ2RMd4xZA+wdP2LQ0A4+gSyiffnivy43ZXTloTRSgdIKG59gtwW06QiwMtnlUmq
         cI9AZv7GZfDVKSs/7JgKvLpto0dkmPiPt9WOgL96gkiPnqpfK26W7Z09iHExhvsOWZ4T
         umOli1/tHHIJ9DuaQOopk8gDkXOWm/7iIDM1AydGmrSg4lltm5HPsF7Zowwdr4hQ4AW2
         cVfOwhsGBNcbqZMExllNs9qnD5yNcsl1/Zt8MXQFJz4aEbDCib4r1M60ctiIVZwRN3xJ
         W7tCydiv/Mjc98ErcKn6WMt9ixC3zbUIU2WxvajPpgAq02cbHhXhncD73wXMP1V/ldGx
         +Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=vxrD2JWpr3rTdsCECp/XxWuqHq2ybHJ1OCxK1G7l1i0=;
        b=U7v0lKwQsOpQj3pqTMAuD/Gq8YvPVE3Fe+WSlDuTx7Gw/OyqKK+oVkJsH11RS7FiKC
         M7KC+gYVCvHpZ9PJ5xFdVWFCpup7sHpGdutDGhcpytZCS+MdGdGNhDmtHvZqVO5EZod4
         8vukffYgJly/vhF1Ws905T5t2K7h7lylH9CA42ks/bn7uZqJXaCFh4T199QAZocTl/yS
         8Iq1xgbQh2aBLAjhKRS5F950DlPT6kHGTiFXydVdpbnXEvX8ymeD9w/s6AFxKMtqxhjc
         wFFyF3/LfURPwqMv7HhsltHUoNe1M7KD+knGwneggRh2CPV5b/BdW1G8LIK+FCpdikul
         wojg==
X-Gm-Message-State: APjAAAUV4cz7Ag4py05jmfPdRto9KD/tCgRnwh1MiHpW9Xc3H5UQX1FE
	+sWS/P7b3plbzXK8Kfu0876aqImg
X-Google-Smtp-Source: APXvYqzgr85uVMKa56MUfTDgG9FJNJZKYbzwpuDOJELm6p0HEiDkFNMbN3UF3NCanvB0u52zzNYASQ==
X-Received: by 2002:adf:f244:: with SMTP id b4mr9448075wrp.88.1579374988476;
        Sat, 18 Jan 2020 11:16:28 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id z11sm41339690wrt.82.2020.01.18.11.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 11:16:27 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 2/4] Acceptance tests: Add interrupt_interactive_console_until_pattern()
Date: Sat, 18 Jan 2020 20:16:21 +0100
Message-Id: <20200118191623.32549-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200118191623.32549-1-f4bug@amsat.org>
References: <20200118191623.32549-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: zjGBiSz3pGo7

We need a function to interrupt interactive consoles.

Example: Interrupt U-Boot to set different environment values.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.21.1

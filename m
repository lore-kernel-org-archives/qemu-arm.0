Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp742570lff;
        Sat, 18 Jan 2020 11:16:27 -0800 (PST)
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr10909737wma.89.1579374987232;
        Sat, 18 Jan 2020 11:16:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579374987; cv=none;
        d=google.com; s=arc-20160816;
        b=ZUDlb49XQtqj6vANI2zu5W69SjpsHvQxFjBomEohcrW+fPtoEEa1TFxZVpzBPJkRzV
         hwadVoHC+ieh2LZxnR7IlJXM3H6jRJZ3LWfWUzC0pjXV89OztZgLdhrB5v2h1liQ5Sbr
         bSBY2KaiaJs0EtHZiCNwvIT4kdHVBYmxE85iJAmDPSxvcB9Jaei6ZaSxy4Yq2ohGr6L5
         2MLkX17Vf81F9grGeuEgexeUWwK9BZ3mSGjrWh9mQgjvxoT+nOLxWAhILwDUYkxcq0DD
         PRyVSUoymBF1IqAe/CESJY+tRPFTGrskIkiohSczduqGOnFlCY7LoLhNf/zNJXlhfrK3
         v8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=K+cZ6I/QpgXaxA05OKDA44Z96Grs/O31aTUTE91bprM=;
        b=xfXzqQEeeuhrqp1mIjUm2vFQSXaek40FWmOt+g9xibiTcOtHqP/cW+VDj4WwIlcepo
         cvg1bI+Y7gOIwwT/cs55CyF2VsKOn/o2RllCKH56+6Y0A0QWXQkZeN5ZOGqrzKEidd38
         5rQ9cIGZa31ZbcgLz8Dbh8SqESwzjAq3+xWdeeGtBRYPPIIXPa2nQk2u/qoiUUH7E7nG
         rZ5sjOyIc86gNnSeskJZsLEFsRlaAGebMCbHHKqeOC4eZjK7FyVxlE/kuEq5BK5C5qPH
         deaRXvQs37K8FFMOyv72HwuQLSPa12pIyJHdpInMDOtd5wB/WrMM4n+f5YRGkcgHDNb7
         mOBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fan+f77n;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g14sor6159750wmk.19.2020.01.18.11.16.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 18 Jan 2020 11:16:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fan+f77n;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K+cZ6I/QpgXaxA05OKDA44Z96Grs/O31aTUTE91bprM=;
        b=Fan+f77nzTO2u4vl+CbNzzt6b8TfqkQkLOn49CElsLYfX3g0Q1D3GL4hkCgBsKJCz+
         dKRXP570N+OmEUOlOoSitVlsdwPBk2HYxUrFa+KoNk8nA3SOTeSPmW7osXYopPja2fXr
         pM48WxWwKWrSL+1juokIsR5GZNkzfRdcrpb84mGE1sC3U5GA0fJOCd2iai6/g0d9LhKS
         skbX9QCHPcJ9bkuO4EdC+lCZS2M/2+mRQQn+vtBkOf87AOSo7Y1Gza4VNnyCvFJR7qss
         hFlc44tlIND9u7J4xBqL5ZJRbI1pFxzWnyDrQA9MaISV3vLMI+fmDXFBzWQ/3pUUuhXX
         k+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=K+cZ6I/QpgXaxA05OKDA44Z96Grs/O31aTUTE91bprM=;
        b=LftzQMQAHSwD/CcO4QGsLMO0/1SZAq1rlAh4v/6GrWU0iScVXCnSqm8/QoqlkXKIic
         WIcCzorqZ/bTVI2WVlFKg2SJ3PpclRGrA+xWUV0gES0uN8iIyxmVT+jkbzvwTexs9r2K
         JbQd+dS6BLzvxutFc3hmgluNEEiOaGAj86ak9j042fCNU9UDK+0xLswlxB4GVgkrmdnB
         FgnjEHV2R2zE98lF5c3WVcGdnKMjRvlisx+p3Hd+mDoZqPiUU7LIC48tXaJlHkcxng4i
         OaS0Oak5bPa+JcQrYZChLjMwYyHaU8BlkndgDSWpmifoWT9KMwFGg2eBl/fElicQMj+6
         Lhbg==
X-Gm-Message-State: APjAAAVELHNUcr1dL3u5L24Kx03XC8k9hCAphVSedez6NapTIFOuB+b1
	KOi4g7neb61GNWo6jIHMCgw=
X-Google-Smtp-Source: APXvYqyoSRprmjZR7Gibuqtr+8P7ZS5CeGu8n/nSb06P6XoKX20MrnbivQMxnNp5PJMm4dhIkEK2HQ==
X-Received: by 2002:a05:600c:2959:: with SMTP id n25mr7665791wmd.185.1579374987022;
        Sat, 18 Jan 2020 11:16:27 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id z11sm41339690wrt.82.2020.01.18.11.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 11:16:26 -0800 (PST)
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
Subject: [PATCH 1/4] Acceptance tests: Extract _console_interaction()
Date: Sat, 18 Jan 2020 20:16:20 +0100
Message-Id: <20200118191623.32549-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200118191623.32549-1-f4bug@amsat.org>
References: <20200118191623.32549-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 7PjrMo5le8/f

Since we are going to re-use the code shared between
wait_for_console_pattern() and exec_command_and_wait_for_pattern(),
extract the common part into a local function.

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

Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp969990lff;
        Sat, 18 Jan 2020 16:51:29 -0800 (PST)
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr10814210wrr.421.1579395089088;
        Sat, 18 Jan 2020 16:51:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579395089; cv=none;
        d=google.com; s=arc-20160816;
        b=TCiYJCbGrdX89Xhf4c08B7wTuGnDKvQWHySs1Vak+et+Q28mlYg27Pkr4r4EF6jD7Q
         nodnnyAdUOCuH251YQj7S58dgDUgYfkF8CfXC5JjEt2vQ57FwQAOQFxqC/JwReh0pyQ4
         ifsuo1dsmMssnW4EaWpIjNmi9Jvju9EgfsTSj0pr21GmVCm+C1dzqovkCp/AEL2jazxo
         H9WqjLG/3HKGrIQwBujDt1z65iRPwtPnpLOEqwyNx11kGhMFYPHB6e/Yhx5IbkhMwxWW
         MV/RywWkj2NniD4jqf2GOkRLQCvAjANzQqzns1fO+puAlPO8ZAVsfSnseCL1KTFI0ZRi
         ukeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ySTKs9tAs68j06j0Ef+8j/MLezzl+CwbmdUNKgUrBaM=;
        b=zwDCNo8k5szXx/hyFrENzuFyiZAHNvVM6mmMjQOoP0dsxglhcHusD/v9c4/UOCsbxu
         IeT+IIepca30Yv4st1y5q2V800QJLH/Qo0EomiXJv6xSkgCqN8XgetkAlwd0TTNck2I0
         zOEPY20ZyNd56NLk0aLJBYm6IQFUs2Kbt3O9gk2RK+eKTAnBq5GThsN8u2+U6OcLLsqQ
         vIQv3XIdCnNXZCNBGZUHlByYiZh7+PeBQEhK9vhpC6dsO38NzbG8c0nUspi8w5MCv9ZL
         ImKyVJeYZau9+I5eUco3bwGeSSm5O09wEo3+PcsvsAYrzizJdZfQ8+XMIcb9PDL7oXGS
         pZ4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nMSZsmYT;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x9sor13005935wrl.44.2020.01.18.16.51.28
        (Google Transport Security);
        Sat, 18 Jan 2020 16:51:29 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nMSZsmYT;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ySTKs9tAs68j06j0Ef+8j/MLezzl+CwbmdUNKgUrBaM=;
        b=nMSZsmYTAHyA6JnaupSLr5kU/FO7EbHwb5VwlT7mOjeX+HVq3Nf6vzHINgBugHrib0
         OoKjewcNjzANxkoNkaHIm6Pe948mlhTZZeZN9SfKsVfR7L/T0Y9rqS8Sq+sqfmOUJbb1
         6rctgJQ3R+WCRmDVtx+AlUBQpu+FtsUliBHMz59TpcklYgj6uvsKl/N8WWxIow2bDXzx
         XplQMiRz+kEe5ioqvpKM6TR5cY4vP1qYrMv2aQrRjbxBQik7UbZhPCZLoPJq1mLIlkAp
         WM6INQomlO406LaUm1RKIsoHn668M9Ung2SsHUEeNylJU63uH7pJ1QMmTFOimfGCI0q0
         RtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ySTKs9tAs68j06j0Ef+8j/MLezzl+CwbmdUNKgUrBaM=;
        b=sqkoUZPz7kxw0huCTYfIDF4Xe8nbjF2pMNZclIBn0JV7CznnYutkXY52xx5LieeG2R
         VfELEixJntTcqKO9gBySIuJdCyffBJVelHEXlr47ONVqGu1+QGsxOzkVjKXI4fDx+/ne
         N9fvg9X/ly8GF6hDM5HXeGTQ0zsUHB6fjn+4YEz65g84Vna6BvsH+BC/3+OPE1e4hzdx
         q9UviL1pSDEKdC83sCsLBLcaiIJDI7K38ZJRiIBNLCokeYMxsmKeE0j3pWQbMW/7Oh14
         O5HlGLWSIU9Y0eTivq1XQx4bqnr+7zDvfozk2y0JzV9+xoMEOQsVlVZwFL6HKaG9ycYW
         Yrxw==
X-Gm-Message-State: APjAAAV97KObjuXHKUtlIFH5T5tJASI3PAAMp/QOvABp5tQ26tb0mpv2
	/9RXSQ0zdTBmFeOuzXfncFc=
X-Google-Smtp-Source: APXvYqw/qdZBSc6Mn1g0Vj+ttp0yC8fXZ6vruHXfGDUF0JNFzASxgwNDKPhITKJs5FlZiS4GLXp72g==
X-Received: by 2002:a5d:6b47:: with SMTP id x7mr11090966wrw.277.1579395088706;
        Sat, 18 Jan 2020 16:51:28 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id h2sm41763568wrv.66.2020.01.18.16.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 16:51:28 -0800 (PST)
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
Subject: [PATCH v4 17/20] Acceptance tests: Extract _console_interaction()
Date: Sun, 19 Jan 2020 01:50:59 +0100
Message-Id: <20200119005102.3847-18-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200119005102.3847-1-nieklinnenbank@gmail.com>
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ho7sT3sysv+K

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Since we are going to re-use the code shared between
wait_for_console_pattern() and exec_command_and_wait_for_pattern(),
extract the common part into a local function.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
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
2.17.1

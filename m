Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2682717ejm;
        Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682328173; x=1684920173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPLhtaZltjDsm0+7czRR+umbyKr+Au9dGft4aGwUTwE=;
        b=JINczLzorryr1mK2BH3fpR1gApIw8GzNALXrpymsuVON0Gn4Zjj4FV45bHu6JVcEmi
         1ZpejeXyznctGAtmf2FOlGGJLZyT1TCAAZxsPjc8L8tkaK4KtgDdLj2zLpQD+x4bj5HY
         4yKizdrwwPEYSLAl+FY144Tqyt8pE1Y3GhnTvjVwvtPWg75sqw4HawGm0uCMEniBMFDr
         ubeaNkmgUaNUn7WHgMj08albaZmnvRdMKQyPOX2hWdNPKMRA7hisfQLIlUmCED7XAQK1
         xdxp6/HL3E9zvtOeYEIriGhrxsjRCpckN+8ZC0I6J3qGNOhtq2ywInkOD/GlDaJh1zrK
         5crA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682328173; x=1684920173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPLhtaZltjDsm0+7czRR+umbyKr+Au9dGft4aGwUTwE=;
        b=Jd3IrfRLjCUNWB2vrjcSPQjSR6Ibgmq6PKf84KV2Jb4LbrePiX+LEqmrwf8teVZ+Ks
         g+iexbnQyzRXt5RV0L3zYctj/Kny4cHGZticeVHmJWoh612zKsK76DXk4TO8uW9EFSS0
         PFhIMOAxTpC6/NFiO7gvq3uLh71pwj/Anfq84WHP3RqfAIDXxJoALSRFTLPJ3PYH1zYa
         H6gDBB25ONzW/BScZW/C3ctJuWy7837/L/uL2Yooc9ElJaip51OZXCqugxCXQCqifjyj
         dw0AMO5ASqu19ExYa5lr0uTlfyFYCaI4MJmFi/HSg5o+xd/cx0YKHigFcn01KK3k2asi
         f28w==
X-Google-Smtp-Source: AKy350bDxB1lpbxb5x0yEXdw01e/iJnvIdahsWC5PAqCtzU4LykOO70XZ1dVmHVQZcQGmzPIwEWuOw==
X-Received: by 2002:a7b:cb96:0:b0:3f0:7e15:f8fc with SMTP id m22-20020a7bcb96000000b003f07e15f8fcmr7214993wmi.14.1682328173070;
        Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id eo9-20020a05600c82c900b003f0ad8d1c69sm8698363wmb.25.2023.04.24.02.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5C14C1FFC0;
	Mon, 24 Apr 2023 10:22:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Markus Armbruster <armbru@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	David Hildenbrand <david@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-s390x@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 08/18] tests/avocado: Make ssh_command_output_contains() globally available
Date: Mon, 24 Apr 2023 10:22:39 +0100
Message-Id: <20230424092249.58552-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zQaPiW6bAoii

From: Thomas Huth <thuth@redhat.com>

This function will be useful in other tests, too, so move it to the
core LinuxSSHMixIn class.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230421110345.1294131-2-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/avocado_qemu/__init__.py | 8 ++++++++
 tests/avocado/linux_ssh_mips_malta.py  | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index cb71f50db9..6788837e1b 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -431,6 +431,14 @@ def ssh_command(self, command):
                          f'Guest command failed: {command}')
         return stdout_lines, stderr_lines
 
+    def ssh_command_output_contains(self, cmd, exp):
+        stdout, _ = self.ssh_command(cmd)
+        for line in stdout:
+            if exp in line:
+                break
+        else:
+            self.fail('"%s" output does not contain "%s"' % (cmd, exp))
+
 class LinuxDistro:
     """Represents a Linux distribution
 
diff --git a/tests/avocado/linux_ssh_mips_malta.py b/tests/avocado/linux_ssh_mips_malta.py
index 0179d8a6ca..d9bb525ad9 100644
--- a/tests/avocado/linux_ssh_mips_malta.py
+++ b/tests/avocado/linux_ssh_mips_malta.py
@@ -101,14 +101,6 @@ def shutdown_via_ssh(self):
         self.ssh_disconnect_vm()
         wait_for_console_pattern(self, 'Power down', 'Oops')
 
-    def ssh_command_output_contains(self, cmd, exp):
-        stdout, _ = self.ssh_command(cmd)
-        for line in stdout:
-            if exp in line:
-                break
-        else:
-            self.fail('"%s" output does not contain "%s"' % (cmd, exp))
-
     def run_common_commands(self, wordsize):
         self.ssh_command_output_contains(
             'cat /proc/cpuinfo',
-- 
2.39.2

Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp517125njc;
        Fri, 19 Jul 2024 08:13:14 -0700 (PDT)
X-Received: by 2002:a2e:a7d0:0:b0:2ee:87ef:825b with SMTP id 38308e7fff4ca-2ef1684299emr453091fa.40.1721401994580;
        Fri, 19 Jul 2024 08:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721401994; cv=none;
        d=google.com; s=arc-20160816;
        b=b3keJ5Hr0kdRWTWCuYXBAvGZyk3qgzBfDfjMeKq+R56gBczLgTFF/hAYCxYgdoh1dX
         ddJIshOAU+7PDzwremhLuEnwWMb7NccEFASOHzUb+tKMW9wpvV8XmEM2e9mbjdfyxsA6
         4Kvd8sE9LX0kpLkgun+I2RTLC7O5QohhgJKlYVkmbkuyRIgukzzBZH31Urjno8yV+oPl
         1fLpBg7nXPXzHlx7nxJxAftcJY1wvTOHUyvB26bCQkp4qZ9lDu/H1jZXfPibue/XtWmQ
         MFQsmZTXzd9bsjaQcT7dK7Gbzcwnus7d9O0UCAlXaujSMvdTwEOOksZzXzlaEwuhT783
         OB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=gZJPW/lvXGtYKm7JzNSmEVgcUOEegBQAD673Jp3vZ2I=;
        fh=TEln4GInrhiXG7jDr+whY2yv3pGWSGfSOjeSmHoSLO0=;
        b=iDunkFQqhc9Rzjls6C9d8CsgXAOEEabCcm5MPx6Nw9TK+KVAGzeRjpAoI2/If3K4Wt
         3o/J1LM54LGG3mC9qr86rRmwC+o8Gheso9D3YDM7VL3QnOkNW266xo0xRgLXqtzwRfMd
         k5g40zvP9fkB8sYB1iK2Nl+tIACxSS8LeCapMmSBuvWawEe0USswfLCiY6oU3Xw225uy
         UiHZQqWHzNnQkMjoHarT9t1pfl293VfYQKdmjrliBq1SnVbFf0ROsa5GWQ7Nk05P2XIM
         w2Kzu0QPtxtPAs8q3iBQfVubQxYBWbSxoocyehzV/y69IuS4vfIulLPjiczfS/pPXuGV
         5aAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J6GcJHFR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-368786705d8sor484354f8f.1.2024.07.19.08.13.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 08:13:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J6GcJHFR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721401994; x=1722006794; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gZJPW/lvXGtYKm7JzNSmEVgcUOEegBQAD673Jp3vZ2I=;
        b=J6GcJHFRghuVWGfL25YtjAzlTpS4tgEhDhAWpsvK6DPF+jSMlMPSkuQZ60/Ac5f6zp
         XKE4QEiuIuaO0qpXlzUNsmeEl6EkHM7XlUDt+NVDjGc1dX3x7F46CAe0I4Synz2ULdW1
         /aGjSLZp/bc2h2U9qGlBsDTcxeRRx+YaDo+sMY+ZQ1mzT7wHlDX3TOWGGJ8p4wYWys66
         gdWmcErA2zf7Y41tn+24BlvULgxx9UDx8bDBRtT5yP8zdafO6igoWKQUFivu/RScIo3k
         BxFCIMkDNs2jf630BDlSMrS5M0fj1KLwwQs6kEfqGPzoxj2bh/pefzYD/2RcJWsz/jsJ
         fUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721401994; x=1722006794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZJPW/lvXGtYKm7JzNSmEVgcUOEegBQAD673Jp3vZ2I=;
        b=tF7OLl8zbT8Vr2bZxLVgN0c7PeXwZCCNr57HQBsuHKMa3vpcZXNQiiXbPNDeL2Espf
         7FO9PoePBKt5R94KBTCuOUWkWorA/mm11VHwAXkxCwjwwPntLuYuLabslnQ3gtKett8x
         uGCeuM50ZPwW3Cs1HddflJE1EaVt8aFBbcyMMwKyaOdn+DaryGRZzNgr5LQS/wvMRvhT
         STlxhSYfWVFrcVUFZfkx+34NRSaeGNJP4y2Uy8F7o/N36ArHCcm4px17NJCw3u8b3Hp9
         zHot7AFIx9jKzkmsv1kIZF+xp1gLErGKx3TYWRoOYoVsPRoF1leCkVq93gmYgBFIJKcV
         hUNw==
X-Gm-Message-State: AOJu0Yyto+ykHCJANzg4v0Uda5S1oJtqimOuN6CerwqbWw7EGx/nHxvG
	FrZFGcPEA2EmVyE4huzgcDacVmOdUSMwQVFZh0P7K5iVK/Hhsw79rcQxRFoOqJNAPaGiaQrUs2Q
	kYcM=
X-Google-Smtp-Source: AGHT+IESeXH/Mh0Ju9h79sZHOOcqzY9meTEXV8chKrcyDp9BhTXOoy81d7jNHDyeSrG6KxrFTxZZqw==
X-Received: by 2002:adf:eb46:0:b0:35f:2030:d42c with SMTP id ffacd0b85a97d-36831608a1cmr5276461f8f.17.1721401993942;
        Fri, 19 Jul 2024 08:13:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687868b26dsm1830017f8f.34.2024.07.19.08.13.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 08:13:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH] tests/avocado: Move common Avocado tags to class
Date: Fri, 19 Jul 2024 17:13:10 +0200
Message-ID: <20240719151310.45927-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: c8MYAsMijUts

When Avocado tags apply to all tests in a class,
we can define them once in the class: they will
be applied to all test methods.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/boot_linux.py           |  2 +-
 tests/avocado/boot_xen.py             | 17 +----------------
 tests/avocado/machine_aarch64_virt.py | 10 ++++------
 3 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index cdce4cbcba..df6cf209ef 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -64,12 +64,12 @@ def test_pc_q35_kvm(self):
 class BootLinuxAarch64(LinuxTest):
     """
     :avocado: tags=arch:aarch64
-    :avocado: tags=machine:virt
     """
     timeout = 720
 
     def test_virt_kvm(self):
         """
+        :avocado: tags=machine:virt
         :avocado: tags=accel:kvm
         :avocado: tags=cpu:host
         """
diff --git a/tests/avocado/boot_xen.py b/tests/avocado/boot_xen.py
index fc2faeedb5..93bfb0c161 100644
--- a/tests/avocado/boot_xen.py
+++ b/tests/avocado/boot_xen.py
@@ -61,8 +61,6 @@ def launch_xen(self, xen_path):
 
 
 class BootXen(BootXenBase):
-
-    def test_arm64_xen_411_and_dom0(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=accel:tcg
@@ -70,6 +68,7 @@ def test_arm64_xen_411_and_dom0(self):
         :avocado: tags=machine:virt
         """
 
+    def test_arm64_xen_411_and_dom0(self):
         # archive of file from https://deb.debian.org/debian/pool/main/x/xen/
         xen_url = ('https://fileserver.linaro.org/s/JSsewXGZ6mqxPr5/'
                    'download?path=%2F&files='
@@ -81,13 +80,6 @@ def test_arm64_xen_411_and_dom0(self):
         self.launch_xen(xen_path)
 
     def test_arm64_xen_414_and_dom0(self):
-        """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a57
-        :avocado: tags=machine:virt
-        """
-
         # archive of file from https://deb.debian.org/debian/pool/main/x/xen/
         xen_url = ('https://fileserver.linaro.org/s/JSsewXGZ6mqxPr5/'
                    'download?path=%2F&files='
@@ -99,13 +91,6 @@ def test_arm64_xen_414_and_dom0(self):
         self.launch_xen(xen_path)
 
     def test_arm64_xen_415_and_dom0(self):
-        """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a57
-        :avocado: tags=machine:virt
-        """
-
         xen_url = ('https://fileserver.linaro.org/'
                    's/JSsewXGZ6mqxPr5/download'
                    '?path=%2F&files=xen-upstream-4.15-unstable.deb')
diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
index a90dc6ff4b..0ef6df4b0d 100644
--- a/tests/avocado/machine_aarch64_virt.py
+++ b/tests/avocado/machine_aarch64_virt.py
@@ -20,6 +20,10 @@
 from avocado.utils.path import find_command
 
 class Aarch64VirtMachine(QemuSystemTest):
+    """
+    :avocado: tags=arch:aarch64
+    :avocado: tags=machine:virt
+    """
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
     timeout = 360
 
@@ -33,8 +37,6 @@ def wait_for_console_pattern(self, success_message, vm=None):
     # Other test profiles should use more minimal boots
     def test_alpine_virt_tcg_gic_max(self):
         """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=machine:virt
         :avocado: tags=accel:tcg
         """
         iso_url = ('https://dl-cdn.alpinelinux.org/'
@@ -129,8 +131,6 @@ def common_aarch64_virt(self, machine):
 
     def test_aarch64_virt_gicv3(self):
         """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=machine:virt
         :avocado: tags=accel:tcg
         :avocado: tags=cpu:max
         """
@@ -138,8 +138,6 @@ def test_aarch64_virt_gicv3(self):
 
     def test_aarch64_virt_gicv2(self):
         """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=machine:virt
         :avocado: tags=accel:tcg
         :avocado: tags=cpu:max
         """
-- 
2.41.0

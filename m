Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp616776njc;
        Fri, 19 Jul 2024 11:10:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXprqeSvEki7MAhcj0F/T5UfixmhmCNVAwSnOud7/grLNxaMIoa19+qa2hdw5+nrU7MVdVcMO8PEKr8eE8eSc2FVdLAaS/E
X-Received: by 2002:a05:600c:4f4e:b0:427:b995:5bd0 with SMTP id 5b1f17b1804b1-427daa61cbfmr1902425e9.23.1721412651901;
        Fri, 19 Jul 2024 11:10:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412651; cv=none;
        d=google.com; s=arc-20160816;
        b=m65aeMQCB4CCGRhL87OLnZsk/ehoxgB+qGx3Wdvdn/YnU93veg60Ln3HA0cw9GVDgc
         dqvDMY4yBXmhWkhWzPA2+d151NmEmDG1+S1ZjMVg+9fdtQLaiukessZ4TGKtzLfRVnqX
         myDN4BSFqYTNOkBdsqVr35X+aPdPdYmwe9gxJ++WsYccZclJrcJ6w3mJk9csLJqWeXUE
         hCHciR241krFRz5Jlcn32IqOQGA3mP4R0ZyvkhNdhA1sSLtSe+jO2RrVdOoppKRzchsB
         RXZka8SuVX/zTshkBptaVosfSAaBfKEAT+WbUA8CX8/AqQhCx6+ld2mF1Odp755z/ShF
         u6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YFJ4F+v2FoWmOAeJ1TmNHGk/Gzzzixlx237F5Z9Ojzw=;
        fh=Zl43S8nG/ftQ0E0BEzhBzxM3MyYmUo+LwV7t3swqN/o=;
        b=n49MWYznJ3nPVZgrJlE/QtHSAIWznRg8qgBVsVQHDCRrcKR2X2ZfL+jr7QmlcP3AmD
         x6mxxuX1BNMG5R2jclx6/yqgP5jLNZ46/r+67ZZ5fbiPmCtJWGXydpP8zyPDLp79F9kQ
         t2cNQ2vTXSQ96EvXEtcZD8SM2nfrdrokkMmnfhz2Z0xnKAycFoin8mocBIVzCHd3Vs3V
         KNsQRWiZdMGFuGWk5uvQcyPzEfH6DguVbHk8iFj2L9mIFt2Nya/ZtYBr+30J8La1tlYV
         4uSXImXHe1OFmnhncxLOfyex+DMDfY48jgy2MfT0+cHpUtbxcM0gSvijIn+wBAT2LAoQ
         JBTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VcTT2Ju3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d6ffb728sor6079495e9.8.2024.07.19.11.10.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:10:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VcTT2Ju3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412651; x=1722017451; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFJ4F+v2FoWmOAeJ1TmNHGk/Gzzzixlx237F5Z9Ojzw=;
        b=VcTT2Ju3+Sz4kuxg4ATal8nwjBX0MaMDceAPVv/MmQPMdwFUKpYjXe7vW8Q9OTH+Rl
         dBw+AB15BCAXcTgDYHcwMqjcBQx98t2BX8L49rcAMC0Yrxj62p0FEuSs0v4eKIbNKqcn
         5r0MvLcdW1Ppu868CWyZn6qJQkPLmIPBBW0zvPJ46Hpjk5KUh+YezIW2WDUQOt3F/joO
         4JorfZpBGCyeKLxPGNC/aYqjHYmYxMit3S7nMNGH95GvLUyiuVdo+9Fwdzi5+YvFVvcp
         2ZDjd97roym62e608yBSlrInqVXXF7OFL0KtoZW6lIEDAYLBpz6C3rQbez6slLkJohYM
         DeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412651; x=1722017451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFJ4F+v2FoWmOAeJ1TmNHGk/Gzzzixlx237F5Z9Ojzw=;
        b=X10dnRwmB52l3+LaBVwRWjxKH9syulBS97HLr48IlCA1mpir5XPfvxGr+yN0DqcUaC
         RXGRmpxFzUSvHMwzcCxbx20V55AXDOTzUNIR+ZO6jOKiAHjg93pTIabJZ675QrAdFddB
         CxwNnhtNaCrlXW8JzG+w3LOSKKNxGuDBajHry2p+P8OatdOs6KL8xaRAKoj4IVJtDxsF
         pIAWyrEzDy4dEIUAQC85xyiBCQ7DHq/8b9D9gFMNA1gnVmou4wwaMdVNOGMSdcul8q6g
         dlKl80G408d6fG9wPNl4k1ZTaHBAEBQM123nwmMc6VbJa+zMIaaBYL1jqh6mMuR2lK3i
         /5Wg==
X-Forwarded-Encrypted: i=1; AJvYcCW25NyAy8u6+oJ0JUokIi8Aiv4W7WhjwS7o76R/CvUX5KBzMnutU/hbM6Xypv27TMfkDyCt2L/PH7BV94NlKHFh+rt0Fq4p
X-Gm-Message-State: AOJu0YzpDYPODyx2vi5MB6nk/JXnwJJyHRzU/tMnBflApyQV/N6Eg0Wp
	m3MTmV8QZA2bpZZ+9JP/lMgiNa/f5JYJq1WERjJWBHNHjGoD0NOCiWlWeYL8h6AQoA==
X-Google-Smtp-Source: AGHT+IH8QQ3Q4WzhoLEmQnEVMenANYdfPsvxyv35s5ulBbkJX0659zA6WiSRoL8P2FAn1uN8VFvWUA==
X-Received: by 2002:a05:600c:1d96:b0:426:5ee3:728b with SMTP id 5b1f17b1804b1-427daa28651mr1991465e9.13.1721412651427;
        Fri, 19 Jul 2024 11:10:51 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a3c0fasm61914525e9.7.2024.07.19.11.10.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:10:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Tong Ho <tong.ho@amd.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 01/16] tests/avocado: Add 'device:pl011' tag to tests exercising PL011 UART
Date: Fri, 19 Jul 2024 20:10:26 +0200
Message-ID: <20240719181041.49545-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1cOvnSt1Cd9C

Add the 'device:pl011' tag to various tests using the
PL011 UART, so we can run them all at once using:

  $ make check-avocado AVOCADO_TAGS='device:pl011'

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/boot_linux.py              | 1 +
 tests/avocado/boot_linux_console.py      | 2 ++
 tests/avocado/boot_xen.py                | 1 +
 tests/avocado/machine_aarch64_sbsaref.py | 1 +
 tests/avocado/machine_aarch64_virt.py    | 1 +
 tests/avocado/smmu.py                    | 1 +
 tests/avocado/tuxrun_baselines.py        | 5 +++++
 7 files changed, 12 insertions(+)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index df6cf209ef..6717f452eb 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -70,6 +70,7 @@ class BootLinuxAarch64(LinuxTest):
     def test_virt_kvm(self):
         """
         :avocado: tags=machine:virt
+        :avocado: tags=device:pl011
         :avocado: tags=accel:kvm
         :avocado: tags=cpu:host
         """
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index c35fc5e9ba..f595324979 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -362,6 +362,7 @@ def test_arm_virt(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:virt
+        :avocado: tags=device:pl011
         :avocado: tags=accel:tcg
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
@@ -1380,6 +1381,7 @@ def test_arm_vexpressa9(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:vexpress-a9
+        :avocado: tags=device:pl011
         """
         tar_hash = '32b7677ce8b6f1471fb0059865f451169934245b'
         self.vm.add_args('-dtb', self.workdir + '/day16/vexpress-v2p-ca9.dtb')
diff --git a/tests/avocado/boot_xen.py b/tests/avocado/boot_xen.py
index 93bfb0c161..c4c01afa76 100644
--- a/tests/avocado/boot_xen.py
+++ b/tests/avocado/boot_xen.py
@@ -66,6 +66,7 @@ class BootXen(BootXenBase):
         :avocado: tags=accel:tcg
         :avocado: tags=cpu:cortex-a57
         :avocado: tags=machine:virt
+        :avocado: tags=device:pl011
         """
 
     def test_arm64_xen_411_and_dom0(self):
diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index e920bbf08c..f04ac2b11c 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -20,6 +20,7 @@ class Aarch64SbsarefMachine(QemuSystemTest):
     """
     :avocado: tags=arch:aarch64
     :avocado: tags=machine:sbsa-ref
+    :avocado: tags=device:pl011
     :avocado: tags=accel:tcg
 
     As firmware runs at a higher privilege level than the hypervisor we
diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
index 0ef6df4b0d..2d586c8459 100644
--- a/tests/avocado/machine_aarch64_virt.py
+++ b/tests/avocado/machine_aarch64_virt.py
@@ -23,6 +23,7 @@ class Aarch64VirtMachine(QemuSystemTest):
     """
     :avocado: tags=arch:aarch64
     :avocado: tags=machine:virt
+    :avocado: tags=device:pl011
     """
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
     timeout = 360
diff --git a/tests/avocado/smmu.py b/tests/avocado/smmu.py
index 4ebfa7128c..4b265e2435 100644
--- a/tests/avocado/smmu.py
+++ b/tests/avocado/smmu.py
@@ -21,6 +21,7 @@ class SMMU(LinuxTest):
     :avocado: tags=arch:aarch64
     :avocado: tags=machine:virt
     :avocado: tags=distro:fedora
+    :avocado: tags=device:pl011
     :avocado: tags=smmu
     :avocado: tags=flaky
     """
diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index 736e4aa289..98ab40bbb5 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -254,6 +254,7 @@ def test_arm64(self):
         :avocado: tags=arch:aarch64
         :avocado: tags=cpu:cortex-a57
         :avocado: tags=machine:virt
+        :avocado: tags=device:pl011
         :avocado: tags=tuxboot:arm64
         :avocado: tags=console:ttyAMA0
         :avocado: tags=shutdown:nowait
@@ -270,6 +271,7 @@ def test_arm64be(self):
         :avocado: tags=cpu:cortex-a57
         :avocado: tags=endian:big
         :avocado: tags=machine:virt
+        :avocado: tags=device:pl011
         :avocado: tags=tuxboot:arm64be
         :avocado: tags=console:ttyAMA0
         :avocado: tags=shutdown:nowait
@@ -285,6 +287,7 @@ def test_armv5(self):
         :avocado: tags=arch:arm
         :avocado: tags=cpu:arm926
         :avocado: tags=machine:versatilepb
+        :avocado: tags=device:pl011
         :avocado: tags=tuxboot:armv5
         :avocado: tags=image:zImage
         :avocado: tags=console:ttyAMA0
@@ -306,6 +309,7 @@ def test_armv7(self):
         :avocado: tags=arch:arm
         :avocado: tags=cpu:cortex-a15
         :avocado: tags=machine:virt
+        :avocado: tags=device:pl011
         :avocado: tags=tuxboot:armv7
         :avocado: tags=image:zImage
         :avocado: tags=console:ttyAMA0
@@ -324,6 +328,7 @@ def test_armv7be(self):
         :avocado: tags=cpu:cortex-a15
         :avocado: tags=endian:big
         :avocado: tags=machine:virt
+        :avocado: tags=device:pl011
         :avocado: tags=tuxboot:armv7be
         :avocado: tags=image:zImage
         :avocado: tags=console:ttyAMA0
-- 
2.41.0

Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1788955ejc;
        Wed, 27 Sep 2023 05:00:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3bjxzTjcDlK2uqNRr6IXsvhK5L1chpznO4UkPDkkNBEASP0jgkhL7ibYGQ7xIZ8YquZQi
X-Received: by 2002:a5d:5281:0:b0:321:685f:e0a7 with SMTP id c1-20020a5d5281000000b00321685fe0a7mr1449407wrv.3.1695816059265;
        Wed, 27 Sep 2023 05:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695816059; cv=none;
        d=google.com; s=arc-20160816;
        b=JftDF9jnbLfJopSHczxNj/KlIxggopgMp2a+ItT7c4jvxxYtz3IwEwe0QaG6qtgDi9
         9jMi6jJjfWWGWC+Vjn2sPzx05+xRP3iHPiNkwxFm0AxRHuhykM9f0W3Vk5eBJ8SJCnWU
         iWstd4pxgMMqPGJb5abL84JbPcYOgJCDApX4/oxkkRdNuDByVSn8R93xhFlLrYpfFcKr
         5BDfI3OS079b1D4V8FU285toBTrSyzGcE5eTN+fkOwCx/8p/dOJTx0FbhviX25GI8mUY
         e7Gt0zLxw839yfB6g2tJ9XT51z+GHVmSDHdQvh2bvWaMI6fBIfIK/kQ3AeYPM/7f9+B9
         U91g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=DYj28DNQcusd/JOp7quVXdRz/bYodBeoWpZeT+D+0Ds=;
        fh=a9pXnRicFU9JFo/ksBX40ryG6nFk9S4SZtN74pEc6GU=;
        b=OH5cndCPe0t8pya+6LR77N1phx+LszJK4U9kzCDvWBGURrxedeVh4QGonrhhiodZvj
         PGN5z4YrmywAvZFNVbmEF9BtRJVSjQZG+dpmqzjxfaQsDcLz6nzsgHU4lfWQi2an6+pl
         D+5413p2ijFKnnEv2ZtzEgOPnuKzCnzY3XTH0xxM7cC/87C1vn7RRNQLogOUP3B92nxX
         jmArJQPp9JHe1XypQjZdR0ceSFTniahcc8h1k5EaMA7+rHAfTw9tz5FrO/A6daTcKhq7
         dHAWW0O8BsfGHvTN7mQcIENktn65LQV7FU4snUnfsc5UiYoRSk19JZZXtvVUmOwxCgNB
         ejWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from muminek.juszkiewicz.com.pl (muminek.juszkiewicz.com.pl. [213.251.184.221])
        by mx.google.com with ESMTPS id k4-20020adfe8c4000000b0032339dd93a8si1738735wrn.1062.2023.09.27.05.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:00:59 -0700 (PDT)
Received-SPF: softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) client-ip=213.251.184.221;
Authentication-Results: mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 1695326073E;
	Wed, 27 Sep 2023 14:00:58 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 2KDpVB5o_f1B; Wed, 27 Sep 2023 14:00:56 +0200 (CEST)
Received: from applejack.lan (83.11.3.58.ipv4.supernova.orange.pl [83.11.3.58])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6570226073B;
	Wed, 27 Sep 2023 14:00:55 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 1/1] tests/avocado: update firmware to enable OpenBSD test on sbsa-ref
Date: Wed, 27 Sep 2023 14:00:50 +0200
Message-ID: <20230927120050.210187-2-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230927120050.210187-1-marcin.juszkiewicz@linaro.org>
References: <20230927120050.210187-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: fuFIUmmBFuZG

Update prebuilt firmware images:
- Neoverse V1/N2 cpu support
- non-secure EL2 virtual timer
- XHCI controller in DSDT

With those changes we can now run OpenBSD as part of sbsa-ref tests.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 68 ++++++++++++++++++++----
 1 file changed, 58 insertions(+), 10 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index a794245e7e..2d683d4f6a 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -28,33 +28,33 @@ def fetch_firmware(self):
         """
         Flash volumes generated using:
 
-        - Fedora GNU Toolchain version 13.1.1 20230511 (Red Hat 13.1.1-2)
+        - Fedora GNU Toolchain version 13.2.1 20230728 (Red Hat 13.2.1-1)
 
         - Trusted Firmware-A
-          https://github.com/ARM-software/arm-trusted-firmware/tree/c0d8ee38
+          https://github.com/ARM-software/arm-trusted-firmware/tree/7c3ff62d
 
         - Tianocore EDK II
           https://github.com/tianocore/edk2/tree/0f9283429dd4
-          https://github.com/tianocore/edk2-non-osi/tree/f0bb00937ad6
-          https://github.com/tianocore/edk2-platforms/tree/7880b92e2a04
+          https://github.com/tianocore/edk2/tree/ad1c0394b177
+          https://github.com/tianocore/edk2-platforms/tree/d03a60523a60
         """
 
         # Secure BootRom (TF-A code)
         fs0_xz_url = (
-            "https://fileserver.linaro.org/s/HrYMCjP7MEccjRP/"
+            "https://fileserver.linaro.org/s/rE43RJyTfxPtBkc/"
             "download/SBSA_FLASH0.fd.xz"
         )
-        fs0_xz_hash = "447eff64a90b84ce47703c6ec41fbfc25befaaea"
+        fs0_xz_hash = "cdb8e4ffdaaa79292b7b465693f9e5fae6b7062d"
         tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
         archive.extract(tar_xz_path, self.workdir)
         fs0_path = os.path.join(self.workdir, "SBSA_FLASH0.fd")
 
         # Non-secure rom (UEFI and EFI variables)
         fs1_xz_url = (
-            "https://fileserver.linaro.org/s/t8foNnMPz74DZZy/"
+            "https://fileserver.linaro.org/s/AGWPDXbcqJTKS4R/"
             "download/SBSA_FLASH1.fd.xz"
         )
-        fs1_xz_hash = "13a9a262953787c7fc5a9155dfaa26e703631e02"
+        fs1_xz_hash = "411155ae6984334714dff08d5d628178e790c875"
         tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash)
         archive.extract(tar_xz_path, self.workdir)
         fs1_path = os.path.join(self.workdir, "SBSA_FLASH1.fd")
@@ -144,7 +144,7 @@ def test_sbsaref_alpine_linux_cortex_a57(self):
 
     def test_sbsaref_alpine_linux_neoverse_n1(self):
         """
-        :avocado: tags=cpu:max
+        :avocado: tags=cpu:neoverse-n1
         """
         self.boot_alpine_linux("neoverse-n1")
 
@@ -152,4 +152,52 @@ def test_sbsaref_alpine_linux_max(self):
         """
         :avocado: tags=cpu:max
         """
-        self.boot_alpine_linux("max,pauth-impdef=on")
+        self.boot_alpine_linux("max")
+
+
+    # This tests the whole boot chain from EFI to Userspace
+    # We only boot a whole OS for the current top level CPU and GIC
+    # Other test profiles should use more minimal boots
+    def boot_openbsd73(self, cpu):
+        self.fetch_firmware()
+
+        img_url = (
+            "https://cdn.openbsd.org/pub/OpenBSD/7.3/arm64/miniroot73.img"
+        )
+
+        img_hash = "7fc2c75401d6f01fbfa25f4953f72ad7d7c18650056d30755c44b9c129b707e5"
+        img_path = self.fetch_asset(img_url, algorithm="sha256", asset_hash=img_hash)
+
+        self.vm.set_console()
+        self.vm.add_args(
+            "-cpu",
+            cpu,
+            "-drive",
+            f"file={img_path},format=raw",
+            "-device",
+            "virtio-rng-pci,rng=rng0",
+            "-object",
+            "rng-random,id=rng0,filename=/dev/urandom",
+        )
+
+        self.vm.launch()
+        wait_for_console_pattern(self, "Welcome to the OpenBSD/arm64 7.3 installation program.")
+
+    def test_sbsaref_openbsd73_cortex_a57(self):
+        """
+        :avocado: tags=cpu:cortex-a57
+        """
+        self.boot_openbsd73("cortex-a57")
+
+    def test_sbsaref_openbsd73_neoverse_n1(self):
+        """
+        :avocado: tags=cpu:neoverse-n1
+        """
+        self.boot_openbsd73("neoverse-n1")
+
+    def test_sbsaref_openbsd73_max(self):
+        """
+        :avocado: tags=cpu:max
+        """
+        self.boot_openbsd73("max")
+
-- 
2.41.0

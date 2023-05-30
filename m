Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2255055ejb;
        Tue, 30 May 2023 08:22:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6hm+icdf90yjb/WgGs1lRohU7ewk7OVdO85o9WZwYKKI1aCD5iWxznHkvuxej5uVO19SP8
X-Received: by 2002:a5d:4808:0:b0:306:3284:824f with SMTP id l8-20020a5d4808000000b003063284824fmr2013983wrq.8.1685460173158;
        Tue, 30 May 2023 08:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685460173; cv=none;
        d=google.com; s=arc-20160816;
        b=BbKtaZvdmGD3nY8sagrW76rZrqOP25iZF+YI9ttR8SojmUePgPK0cxt5OAOb6Uvp/F
         6mNR7hNTWHY/lHaH2zZAjXTT500uR6hoJ5rpDC9ojGJpW4u+LDyHM4I5Qn/4OjGcbgSV
         foTE0JX6Ln6XRQ5ex7OIwQA4ozcRKPHir5M1/Xls/TFAX/VH+i+n6gtVIJfC1GGpOxuE
         EqEVCrEkYqqwepFyMQblab9XRX1Rjg2Ik1TprCp/0wZ1wC2ZppNAls3sbLl+lVmQ9iza
         Izinf9UYe79DmzKI2RCQ1SfqW0UxPBrSDbopRxAPFVp5tblp9sA1NU+piVvMqT4HeIxW
         SGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=B5jrfqVNzivwpORp23yX5Kte9NN/laeiXYDsblUtuW8=;
        b=Cv2hKH0inNuLnhOBiz0WnvwDPDW2eq5gQdbbxYGZ9T+9pql6PkZ5r7n04xpSYXx+ly
         t23Xhy2eRicAvxKQWLOjIGWjuiY1TZPJoJtK+SXi5Ih5DbSWb3TDpwmEMU8RmXqXvI19
         Dk+vKzNaDds5aKr1G++pPjslL5yl9jThKrSHaXHs9ldFoBkuws53mgN0op7oelFggCED
         bJekncmgL6wfMgaQrMcGQRSYY3wNsweWm94w24yV2/v5N482lyazLKtSk2yc+Lk5SqJc
         jQyQRom73D1EgtRymyreXlJ9ZT3YM56d3izr0mg2QH8cQDSaylT7MCw4Xmqb5q0YAbDw
         Fmhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from muminek.juszkiewicz.com.pl (muminek.juszkiewicz.com.pl. [213.251.184.221])
        by mx.google.com with ESMTPS id v6-20020a5d5906000000b0030aeb35ee96si1459427wrd.1014.2023.05.30.08.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 08:22:53 -0700 (PDT)
Received-SPF: softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) client-ip=213.251.184.221;
Authentication-Results: mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id B800A2602B4;
	Tue, 30 May 2023 17:22:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
	by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JvwwKVhfywJH; Tue, 30 May 2023 17:22:49 +0200 (CEST)
Received: from applejack.lan (83.21.93.182.ipv4.supernova.orange.pl [83.21.93.182])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6BE84260172;
	Tue, 30 May 2023 17:22:48 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/1] tests/avocado: update firmware to enable sbsa-ref/max
Date: Tue, 30 May 2023 17:22:40 +0200
Message-Id: <20230530152240.79160-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: jVphDyJVK+ua

Update prebuilt firmware images to have TF-A with FEAT_FGT support
enabled. This allowed us to enable test for "max" cpu in sbsa-ref
machine.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index 0a79fa7ab6..35f8042416 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -29,23 +29,23 @@ def fetch_firmware(self):
         """
         Flash volumes generated using:
 
-        - Fedora GNU Toolchain version 12.2.1 20220819 (Red Hat Cross 12.2.1-2)
+        - Fedora GNU Toolchain version 13.1.1 20230511 (Red Hat 13.1.1-2)
 
         - Trusted Firmware-A
-          https://github.com/ARM-software/arm-trusted-firmware/tree/5fdb2e54
+          https://github.com/ARM-software/arm-trusted-firmware/tree/c0d8ee38
 
         - Tianocore EDK II
-          https://github.com/tianocore/edk2/tree/494127613b
-          https://github.com/tianocore/edk2-non-osi/tree/41876073
-          https://github.com/tianocore/edk2-platforms/tree/8efa4f42
+          https://github.com/tianocore/edk2/tree/0f9283429dd4
+          https://github.com/tianocore/edk2-non-osi/tree/f0bb00937ad6
+          https://github.com/tianocore/edk2-platforms/tree/7880b92e2a04
         """
 
         # Secure BootRom (TF-A code)
         fs0_xz_url = (
-            "https://fileserver.linaro.org/s/ATnSmq6k8SoXgbH/"
+            "https://fileserver.linaro.org/s/HrYMCjP7MEccjRP/"
             "download/SBSA_FLASH0.fd.xz"
         )
-        fs0_xz_hash = "a210a09692bcbe0a3743ffd0df44e80e0c7ad8ab"
+        fs0_xz_hash = "447eff64a90b84ce47703c6ec41fbfc25befaaea"
         tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
         archive.extract(tar_xz_path, self.workdir)
         fs0_path = os.path.join(self.workdir, "SBSA_FLASH0.fd")
@@ -93,15 +93,15 @@ def test_sbsaref_edk2_firmware(self):
 
         # AP Trusted ROM
         wait_for_console_pattern(self, "Booting Trusted Firmware")
-        wait_for_console_pattern(self, "BL1: v2.8(release):v2.8")
+        wait_for_console_pattern(self, "BL1: v2.9(release):v2.9")
         wait_for_console_pattern(self, "BL1: Booting BL2")
 
         # Trusted Boot Firmware
-        wait_for_console_pattern(self, "BL2: v2.8(release)")
+        wait_for_console_pattern(self, "BL2: v2.9(release)")
         wait_for_console_pattern(self, "Booting BL31")
 
         # EL3 Runtime Software
-        wait_for_console_pattern(self, "BL31: v2.8(release)")
+        wait_for_console_pattern(self, "BL31: v2.9(release)")
 
         # Non-trusted Firmware
         wait_for_console_pattern(self, "UEFI firmware (version 1.0")
@@ -150,7 +150,7 @@ def test_sbsaref_alpine_linux_neoverse_n1(self):
         """
         self.boot_alpine_linux("neoverse-n1")
 
-    @skip("requires TF-A update to handle FEAT_FGT")
+    @skipUnless(os.getenv("AVOCADO_TIMEOUT_EXPECTED"), "Test might timeout")
     def test_sbsaref_alpine_linux_max(self):
         """
         :avocado: tags=cpu:max
-- 
2.40.1

Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1158997ejb;
        Fri, 15 Sep 2023 04:35:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgorx1KPUoFWDNZISrJZ27cj4jV6wwcs5TugoRPs9bmtnPZ72BiYCekUiFxk7YfAAV6jO5
X-Received: by 2002:a1c:4b19:0:b0:402:f500:fcee with SMTP id y25-20020a1c4b19000000b00402f500fceemr1393920wma.0.1694777738751;
        Fri, 15 Sep 2023 04:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694777738; cv=none;
        d=google.com; s=arc-20160816;
        b=iKyuZ2ZPIYxF0CeYiC8LgNvQlHrB34nJqaTOyP2s1XQE6fQLiV3BxV3VsoyMob+KfT
         P058G8lhzJtQ4mj/t8zNBKOxMhviWtDkirObHhj2ZAN2o0DpCkHnrd6zrvcP5cx6qXwq
         AW7gsipNx3yCEBI2CdpGhIH+XmDPXxgB5FQwA71d0BA8mREFErlnVAlWUkayEITA+FzR
         aAwrys3HZJw/uWv4owSemSgHYGQA+7nmDI98RMoWyw7/TTzyGu4DF+Nnp+d+A5OJQFfV
         v4ldCOL/raP6Md46Rew3Qbwu5mEGEwyG2g3dOubPvoFm80wTbQ4YEJKtvPbt3JXSBGS8
         2e3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=HkWooFHaYypP4gCMoSxapGiP+oxah8gOeOdFXTBesVQ=;
        fh=nBQC8RKhcNgHvLowYwRt+HD5dMieoPG2LYmodBm1YrM=;
        b=NFK5mxlj6yTTsOzdi3VAPFluCYz6hK55JWcB4wvPW8OH2Mm7cNwMTYiIGAE1IALkSJ
         Wn5FO0AyjtvjdIKd7VjEOc4hd/l31h2I6oj/yU/hTbwRlILp5Z0MZEA68CJzCtNGQoJv
         gUYT2zQbQAKuOuD2/X0UmW2VeAmrnfKFu3ctGBSFqS8+MPBYH9KabFpG+ni9PUrs14TZ
         AuFf+kAL1qnVSIvVcl/o8v4uDMsbwfGcfe+C/l/Y3bhALrXiadyaPp3wI6TeXSr4lvPc
         pXz1eNHM9OsOifOweZ47WDx5PmAwy+z9ROaqCadoozkCsab/XcdUaNIEJzyH14sHqKB8
         EMPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from muminek.juszkiewicz.com.pl (muminek.juszkiewicz.com.pl. [213.251.184.221])
        by mx.google.com with ESMTPS id v13-20020a5d4a4d000000b0031fa315b312si1541227wrs.718.2023.09.15.04.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 04:35:38 -0700 (PDT)
Received-SPF: softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) client-ip=213.251.184.221;
Authentication-Results: mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 5B67E260AD2;
	Fri, 15 Sep 2023 13:35:37 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id OMqY2rgLSjH3; Fri, 15 Sep 2023 13:35:35 +0200 (CEST)
Received: from applejack.lan (83.21.94.247.ipv4.supernova.orange.pl [83.21.94.247])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 8A27626000D;
	Fri, 15 Sep 2023 13:35:34 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/1] tests/avocado: update firmware to enable sbsa-ref/neoverse-v1
Date: Fri, 15 Sep 2023 13:35:19 +0200
Message-ID: <20230915113519.269290-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EfQ0chDhfdsu

Update prebuilt firmware images to have TF-A with Neoverse V1 support enabled.
This allowed us to enable test for this cpu in sbsa-ref machine.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 25 ++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index a794245e7e..b39f5566d7 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -28,33 +28,32 @@ def fetch_firmware(self):
         """
         Flash volumes generated using:
 
-        - Fedora GNU Toolchain version 13.1.1 20230511 (Red Hat 13.1.1-2)
+        - Fedora GNU Toolchain version 13.2.1 20230728 (Red Hat 13.2.1-1)
 
         - Trusted Firmware-A
-          https://github.com/ARM-software/arm-trusted-firmware/tree/c0d8ee38
+          https://github.com/ARM-software/arm-trusted-firmware/tree/cc933e1d
 
         - Tianocore EDK II
-          https://github.com/tianocore/edk2/tree/0f9283429dd4
-          https://github.com/tianocore/edk2-non-osi/tree/f0bb00937ad6
-          https://github.com/tianocore/edk2-platforms/tree/7880b92e2a04
+          https://github.com/tianocore/edk2/tree/29cce3356aec
+          https://github.com/tianocore/edk2-platforms/tree/fc22c0e69709
         """
 
         # Secure BootRom (TF-A code)
         fs0_xz_url = (
-            "https://fileserver.linaro.org/s/HrYMCjP7MEccjRP/"
+            "https://fileserver.linaro.org/s/g4C3WzJzNBES2p2/"
             "download/SBSA_FLASH0.fd.xz"
         )
-        fs0_xz_hash = "447eff64a90b84ce47703c6ec41fbfc25befaaea"
+        fs0_xz_hash = "374738599f7ba38c22924b2075ec5355c2b24a47"
         tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
         archive.extract(tar_xz_path, self.workdir)
         fs0_path = os.path.join(self.workdir, "SBSA_FLASH0.fd")
 
         # Non-secure rom (UEFI and EFI variables)
         fs1_xz_url = (
-            "https://fileserver.linaro.org/s/t8foNnMPz74DZZy/"
+            "https://fileserver.linaro.org/s/scJRninsAFTwEct/"
             "download/SBSA_FLASH1.fd.xz"
         )
-        fs1_xz_hash = "13a9a262953787c7fc5a9155dfaa26e703631e02"
+        fs1_xz_hash = "5d3f156ebd6c6374da2121e15c7c8f4ed0351dcc"
         tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash)
         archive.extract(tar_xz_path, self.workdir)
         fs1_path = os.path.join(self.workdir, "SBSA_FLASH1.fd")
@@ -144,10 +143,16 @@ def test_sbsaref_alpine_linux_cortex_a57(self):
 
     def test_sbsaref_alpine_linux_neoverse_n1(self):
         """
-        :avocado: tags=cpu:max
+        :avocado: tags=cpu:neoverse-n1
         """
         self.boot_alpine_linux("neoverse-n1")
 
+    def test_sbsaref_alpine_linux_neoverse_v1(self):
+        """
+        :avocado: tags=cpu:neoverse-v1
+        """
+        self.boot_alpine_linux("neoverse-v1,pauth-impdef=on")
+
     def test_sbsaref_alpine_linux_max(self):
         """
         :avocado: tags=cpu:max
-- 
2.41.0

Received: by 2002:a17:907:1751:b0:a52:4db9:938b with SMTP id lf17csp1293432ejc;
        Mon, 15 Apr 2024 08:19:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4DcuQ6C6vZfiOcVAwLpGAZC2XRSXh9klGr9hqJXz7BIs/Ovqj7p4XWEP9E3zXhq6gqmgYlDz2xs38E5e06af4uExaIOGa
X-Google-Smtp-Source: AGHT+IGZkKMmGrjZBuobfaUdEhTW9ZKUYdMmvojniAzHIBIM/BJRSnFbK/MGnYo0GjKIQntM+leI
X-Received: by 2002:a05:6122:91d:b0:4d3:31fc:4839 with SMTP id j29-20020a056122091d00b004d331fc4839mr6782163vka.2.1713194358139;
        Mon, 15 Apr 2024 08:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713194358; cv=none;
        d=google.com; s=arc-20160816;
        b=a8FUuD0Yx0kmbpQngyAPOkfSXBfSx9vOeAVCMu93Kc5ZL1Eu7m4ZOHevdzEZLrv9d+
         VX3SYQIAtvNGts5XVO3l+/Ey59HCRYcBOye9faD++MsQBnImpQWJr56T4ocaSmQWSid8
         dX170uImMVqLb2zPoKg1JFQv2EwXBwtMI5eyYFU1NDwPb9F3KRmxrgL/yPPySg/OGJuM
         FFUuvpwFi9V3I2/T2Dv4r5J69MyYOfhbHI1CLPsOnFlMZXzMUo5WlmHc4iRp9IMg+MFJ
         keedlH1vXeFtyfiDIFw87n1WtG8TWaQI0RFP15D8Z+tJQHLrLOWV5l6qdOv98LtWhflp
         E/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ym3EZJbJl0gm6jPMdSsVldV1r8b8PwCAMdNAgUyaFS8=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=G4G8majSrfKB6yK9pQOTi+4jTDFcdZLQatrWx+dQAhBW1nnavjeETDpBZb28j/bq+1
         BcEaDVo4uVuTanIxskCdgYDnW7KdgQC6W2idq/RzXP8BCbdhJ+OTs74jRRi8hiNI+gyw
         Nmcbim669oTn2yGBtlUu91GJieXw0mk7PGiB9dayZLnjeNiLVwDmQHzSM4t6i57OfQSS
         F+9Hi/WY4rzzRm+dNmwx9qqCf6/14+6ycns1dNf+2swbMi146SRa7ErMQE+UCyIiUYAx
         X5fJzW6jljJTL8zQpIKv+Zk1avHhvG+2cYtRTSW/j7H2w70LwYtJtFas9kgCddViArtT
         QVag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qsan/hta";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6-20020ac5cda6000000b004dccb51dd65si335969vka.32.2024.04.15.08.19.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Apr 2024 08:19:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qsan/hta";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwO6f-00023D-On; Mon, 15 Apr 2024 11:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rwO6d-00020x-3W
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 11:18:51 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rwO6a-0006f7-PD
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 11:18:50 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4187481e3feso4352465e9.1
 for <qemu-arm@nongnu.org>; Mon, 15 Apr 2024 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713194327; x=1713799127; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ym3EZJbJl0gm6jPMdSsVldV1r8b8PwCAMdNAgUyaFS8=;
 b=Qsan/htadBB4kZFjCbj23cbWN2JCoy29EW0md+NxcPvaQDMycUcJl6wZVe72ua6V9G
 6yHXGviP2LMMqg+2B9tclX0VFHNrS2GrXTNlTCLWZgkqQ8erGGCeIcE/XBnweGgWp3os
 3jzXLsBQUfE6Y53un7N3Mp6237TlOteU6e31Kz/CyluaMIB2U/X1oLIjYg3n9Pr8iUQu
 oM59U3haGVmyvgaOopVt6zptDYrEB1B2fJHGCjXwFYQPfPFcZv0N+mBsa0TtdGR18VKE
 jRI94+ETdraB0+9ryUBIks4Db92Da2hVJO/RCIODwjNO+gA42N5+ls9k2UAIgAstCHpk
 XmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713194327; x=1713799127;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ym3EZJbJl0gm6jPMdSsVldV1r8b8PwCAMdNAgUyaFS8=;
 b=rYll7tcXVldjEMzWm8Ov7ao1UpSv7+0TXxczUyWLcSauWEqHN5AcBTLfo7AVnqPphm
 LJSavAXBq6q3WRlnDb4NtmDGgOgyQcPpvj9z3pFfqRazyZdeXt5iJa4ZAiRwG+y85L2M
 Lhv1yLbZ7RXbSmics5AoqNp/ciK+AhNQDqkQABLMvbbXHpLFDTW8kUGtwJT1LA6d7p4j
 xZcDMsHFAnZ4K1vejP1j/PyQG4PPjTjIAgWUDdXINL/UVRSShiHXDVHzirn1GfkPp6fX
 dwCbE9zmTkQEz4uHVsNwn4KZTmAazRz/O4yd2aj+j/LP2Q+ZplFa9XCEf2lNeLiJz+vc
 /4Dw==
X-Gm-Message-State: AOJu0YzJWBv6FkzJ/wX6KrKlzvnr4keyUqLTWwgEJ21kpNa4DWEGv5w7
 8o6NVFoJ6pT36UiihAe+xOGV2j9ANFxYRU5taKVc9nLZ1HxlSI/lvuyNvC+Yu5lC1EDUf2KGg8C
 b
X-Received: by 2002:a5d:457c:0:b0:343:6b09:7551 with SMTP id
 a28-20020a5d457c000000b003436b097551mr5954148wrc.38.1713194326989; 
 Mon, 15 Apr 2024 08:18:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a5d4045000000b00346ceb9e060sm11546672wrp.103.2024.04.15.08.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 08:18:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] tests/avocado: update sunxi kernel from armbian to 6.6.16
Date: Mon, 15 Apr 2024 16:18:45 +0100
Message-Id: <20240415151845.1564201-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WUh9zyVFsPst

The Linux kernel 5.10.16 binary for sunxi has been removed from
apt.armbian.com. This means that the avocado tests for these machines
will be skipped (status CANCEL) if the old binary isn't present in
the avocado cache.

Update to 6.6.16, in the same way we did in commit e384db41d8661
when we moved to 5.10.16 in 2021.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2284
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
At this point in the release cycle I don't think I really want
to put this into 9.0, though I could just about squeeze it in.

cc'ing stable as an FYI -- since the tests fall back to the
CANCEL status this doesn't break CI, so it's not a requirement
to backport to any stable branches. But it would probably be
preferable to get the coverage back on the stable branches so
we can detect if we get something wrong on a backport of a
patch that affects these machines.
---
 tests/avocado/boot_linux_console.py | 70 ++++++++++++++---------------
 tests/avocado/replay_kernel.py      |  8 ++--
 2 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 989b65111c0..d0ab5aaa83a 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -646,12 +646,12 @@ def test_arm_cubieboard_initrd(self):
         :avocado: tags=accel:tcg
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
-        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
+                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
+        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-5.10.16-sunxi')
-        dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
+                                            '/boot/vmlinuz-6.6.16-current-sunxi')
+        dtb_path = '/usr/lib/linux-image-6.6.16-current-sunxi/sun4i-a10-cubieboard.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
@@ -690,12 +690,12 @@ def test_arm_cubieboard_sata(self):
         :avocado: tags=accel:tcg
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
-        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
+                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
+        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-5.10.16-sunxi')
-        dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
+                                            '/boot/vmlinuz-6.6.16-current-sunxi')
+        dtb_path = '/usr/lib/linux-image-6.6.16-current-sunxi/sun4i-a10-cubieboard.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         rootfs_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
@@ -872,13 +872,13 @@ def test_arm_bpim2u(self):
         :avocado: tags=machine:bpim2u
         :avocado: tags=accel:tcg
         """
-        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.10.16-sunxi/'
-                   'linux-image-current-sunxi_21.02.2_armhf.deb')
-        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
+        deb_url = ('https://apt.armbian.com/pool/main/l/'
+                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
+        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-5.10.16-sunxi')
-        dtb_path = ('/usr/lib/linux-image-current-sunxi/'
+                                            '/boot/vmlinuz-6.6.16-current-sunxi')
+        dtb_path = ('/usr/lib/linux-image-6.6.16-current-sunxi/'
                     'sun8i-r40-bananapi-m2-ultra.dtb')
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
 
@@ -899,13 +899,13 @@ def test_arm_bpim2u_initrd(self):
         :avocado: tags=accel:tcg
         :avocado: tags=machine:bpim2u
         """
-        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.10.16-sunxi/'
-                   'linux-image-current-sunxi_21.02.2_armhf.deb')
-        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
+        deb_url = ('https://apt.armbian.com/pool/main/l/'
+                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
+        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-5.10.16-sunxi')
-        dtb_path = ('/usr/lib/linux-image-current-sunxi/'
+                                            '/boot/vmlinuz-6.6.16-current-sunxi')
+        dtb_path = ('/usr/lib/linux-image-6.6.16-current-sunxi/'
                     'sun8i-r40-bananapi-m2-ultra.dtb')
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
@@ -946,13 +946,13 @@ def test_arm_bpim2u_gmac(self):
         """
         self.require_netdev('user')
 
-        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.10.16-sunxi/'
-                   'linux-image-current-sunxi_21.02.2_armhf.deb')
-        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
+        deb_url = ('https://apt.armbian.com/pool/main/l/'
+                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
+        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-5.10.16-sunxi')
-        dtb_path = ('/usr/lib/linux-image-current-sunxi/'
+                                            '/boot/vmlinuz-6.6.16-current-sunxi')
+        dtb_path = ('/usr/lib/linux-image-6.6.16-current-sunxi/'
                     'sun8i-r40-bananapi-m2-ultra.dtb')
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
@@ -1049,12 +1049,12 @@ def test_arm_orangepi(self):
         :avocado: tags=accel:tcg
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
-        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
+                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
+        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-5.10.16-sunxi')
-        dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
+                                            '/boot/vmlinuz-6.6.16-current-sunxi')
+        dtb_path = '/usr/lib/linux-image-6.6.16-current-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
 
         self.vm.set_console()
@@ -1075,12 +1075,12 @@ def test_arm_orangepi_initrd(self):
         :avocado: tags=machine:orangepi-pc
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
-        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
+                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
+        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-5.10.16-sunxi')
-        dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
+                                            '/boot/vmlinuz-6.6.16-current-sunxi')
+        dtb_path = '/usr/lib/linux-image-6.6.16-current-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
@@ -1121,12 +1121,12 @@ def test_arm_orangepi_sd(self):
         self.require_netdev('user')
 
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
-        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
+                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
+        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-5.10.16-sunxi')
-        dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
+                                            '/boot/vmlinuz-6.6.16-current-sunxi')
+        dtb_path = '/usr/lib/linux-image-6.6.16-current-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
                       'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index 10d99403a4c..0474f7b7c8e 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -203,12 +203,12 @@ def test_arm_cubieboard_initrd(self):
         :avocado: tags=machine:cubieboard
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
-        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
+                   'linux-6.6.16/linux-image-current-sunxi_24.2.1_armhf__6.6.16-Seb3e-D6b4a-P2359-Ce96bHfe66-HK01ba-V014b-B067e-R448a.deb')
+        deb_hash = 'f7c3c8c5432f765445dc6e7eab02f3bbe668256b'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-5.10.16-sunxi')
-        dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
+                                            '/boot/vmlinuz-6.6.16-current-sunxi')
+        dtb_path = '/usr/lib/linux-image-6.6.16-current-sunxi/sun4i-a10-cubieboard.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
-- 
2.34.1


Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp830540lfg;
        Wed, 10 Mar 2021 12:02:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTVj8f2D6ccid2+agyL5EjFStKc1Fsv7VYFqlz1aYpvoY1r69pfMHbnc4OHrBa7Kb8EORy
X-Received: by 2002:a1f:9d8c:: with SMTP id g134mr2900095vke.20.1615406567898;
        Wed, 10 Mar 2021 12:02:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615406567; cv=none;
        d=google.com; s=arc-20160816;
        b=gpQREz5C13jpDjts2QKwmIOOZVpLv0Bo9GDvdz1VYVhE/V039+Hroi+x6P+W2Jo1MQ
         oe/tfEaQWAUOnZHzVocW+Otf5174Z2tz+q+oi6iEbS3thS0GfMk5ybXZvfBJm5dDYO9Z
         NIS0oUCvrDdxIXp5ztnvGVgxeqxVuRU7WfNdY4WxOnzeX0uDjVx4d7QrZEry0krkV5KD
         sQNIyl0V6XDPKpNpdLRNz55Jm1WU94FZcUJPdwdYfjOxg1D9LQwhp7AxQUJW/fne0sor
         e4kwNAp1tXsjYpMKKoSeJKRxSOtTiP+xAwitHGrrGG9MYNr50fkOWwUkr1T/PmI7lb+m
         Qa0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GElvY6lQEKWnWHpKoAsaZHwYXhujdV8DzzBoh9QrUks=;
        b=l0B5QlrulfXzSxUiOOVnf9ygtUexzLCOsHa9BEQIQrxSj2WEAsP618jNXvEEo3MmvH
         mxw8Qhqralq2CjTrvbYjFZG0+eyhP/niqqOSiGvmYLOr+TM/lAox16UOJG4adClKs+iD
         Tz16vuVd2IEYb0869baYmqTI1k0w8jS/2cJIoZkX7iKDBCcnnc3BVmeyCY7njUIkrRCI
         33cLQwIChAl+HUCq6nqRE5uRMKD4tRjWTFjHOQudJXvFxGwCGoxunDYKnGcEcCtKl2Ep
         9vHB49g6YIa/7iifElGqdt7z+MF8Q3M5QAdNbrN1GnpGjHVeorYp2gXeg/gzVXutWU6g
         5ABQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="X/A8f7io";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si75535vsn.188.2021.03.10.12.02.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 12:02:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="X/A8f7io";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lK52c-0001lI-O2
	for alex.bennee@linaro.org; Wed, 10 Mar 2021 15:02:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lK4yj-0006SE-1r; Wed, 10 Mar 2021 14:58:45 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lK4yd-0001ei-CX; Wed, 10 Mar 2021 14:58:44 -0500
Received: by mail-ej1-x62b.google.com with SMTP id p7so29837000eju.6;
 Wed, 10 Mar 2021 11:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GElvY6lQEKWnWHpKoAsaZHwYXhujdV8DzzBoh9QrUks=;
 b=X/A8f7iodhx1eosJXsPDPyAzkEdUa/LHw6zRUedY5KSdorGxGJY3xaN1nAlw1vwBaw
 Xuo3gidvoukZnhtF69kV6oh/c5lHZ4a9CqDL+REEYnIp2amuQfLghH1pux8A/4obXiN1
 +OIkqstmShJmBYvYTHcHTY92LKUPmkb4ryMoCyqaxugq0q5r0bnBVg2Lkm8KwLtZw31Q
 ZBxYDqi2u+FjzprfMMrga5dekIeqpJn2g+s1SCByTam0wQ+poYqHoaQu4guBUUkHaYX8
 sCe7GCtm4+Ot5yVsyK3M6JqcLshNtY2r6l8GvrlTUCCEZWl0IBHQ87Px6cKYGpyXmxBQ
 CwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GElvY6lQEKWnWHpKoAsaZHwYXhujdV8DzzBoh9QrUks=;
 b=X1u5hFs+88d/gxFu/h6SKAex7ehrvLGeVocKjPqcF+mjbKMg147x+Ow26pyKBxpobb
 HjSf698Nl87GDpUUSF+YUolK4fODKoTuPIK7ut1iCDf/ekBkC6p9KA+eMlLuRehesJx6
 wcw0jaVXLTC314lhbGWjzwCQ3ktKOYOyRyRylMXNoUMmGNFKver2xtL++jTldhvkSRvk
 GEOg3NDLKszCGRwSyGcXSu6jU8OEvWJ7jgjqpP4TQHtpQADnUQXxsGwweHGvJKZU+wEi
 prAIycJdClq2bSLCc1QFbx2iHGOn2Z7cuaIoaZPaBr0PN013ULOZDzBBEIQP+qU2lp6v
 sy6A==
X-Gm-Message-State: AOAM53319b40yWaiJJsaTP9x53CQ3VhhpoO4RIFlYnR9bqjKogRiHOjw
 zesAqA2lfE4k3J/4EpwgJumoyb79pxrAWQ==
X-Received: by 2002:a17:907:7683:: with SMTP id
 jv3mr118520ejc.450.1615406317820; 
 Wed, 10 Mar 2021 11:58:37 -0800 (PST)
Received: from tuf.home (2a02-a456-6be8-1-d8ed-76d3-94d3-2909.fixed6.kpn.net.
 [2a02:a456:6be8:1:d8ed:76d3:94d3:2909])
 by smtp.gmail.com with ESMTPSA id h13sm133570edz.71.2021.03.10.11.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 11:58:37 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/5] tests/acceptance: update sunxi kernel from armbian to
 5.10.16
Date: Wed, 10 Mar 2021 20:58:19 +0100
Message-Id: <20210310195820.21950-5-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310195820.21950-1-nieklinnenbank@gmail.com>
References: <20210310195820.21950-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 wrampazz@redhat.com, f4bug@amsat.org, b.galvani@gmail.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Pavel.Dovgaluk@ispras.ru, crosa@redhat.com,
 Willian Rampazzo <willianr@redhat.com>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V2e5q/abWVZP

The linux kernel 4.20.7 binary for sunxi has been removed from apt.armbian.com:

  $ ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes avocado --show=app,console run -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
  Fetching asset from tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
  ...
  (1/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
    CANCEL: Missing asset https://apt.armbian.com/pool/main/l/linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb (0.55 s)

This commit updates the sunxi kernel to 5.10.16 for the acceptance
tests of the orangepi-pc and cubieboard machines.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 40 +++++++++++++-------------
 tests/acceptance/replay_kernel.py      |  8 +++---
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 4a7a6830ca..04a8b23352 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -515,12 +515,12 @@ def test_arm_cubieboard_initrd(self):
         :avocado: tags=machine:cubieboard
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
+        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
-        dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
+                                            '/boot/vmlinuz-5.10.16-sunxi')
+        dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
@@ -557,12 +557,12 @@ def test_arm_cubieboard_sata(self):
         :avocado: tags=machine:cubieboard
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
+        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
-        dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
+                                            '/boot/vmlinuz-5.10.16-sunxi')
+        dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         rootfs_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
@@ -686,12 +686,12 @@ def test_arm_orangepi(self):
         :avocado: tags=machine:orangepi-pc
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
+        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
-        dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
+                                            '/boot/vmlinuz-5.10.16-sunxi')
+        dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
 
         self.vm.set_console()
@@ -713,12 +713,12 @@ def test_arm_orangepi_initrd(self):
         :avocado: tags=machine:orangepi-pc
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
+        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
-        dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
+                                            '/boot/vmlinuz-5.10.16-sunxi')
+        dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
@@ -758,12 +758,12 @@ def test_arm_orangepi_sd(self):
         :avocado: tags=device:sd
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
+        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
-        dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
+                                            '/boot/vmlinuz-5.10.16-sunxi')
+        dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
                       'kci-2019.02/armel/base/rootfs.ext2.xz')
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index c1cb862468..8c68caae31 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -185,12 +185,12 @@ def test_arm_cubieboard_initrd(self):
         :avocado: tags=machine:cubieboard
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+                   'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
+        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
-        dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
+                                            '/boot/vmlinuz-5.10.16-sunxi')
+        dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
-- 
2.25.1


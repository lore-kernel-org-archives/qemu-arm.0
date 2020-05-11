Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp541518lfb;
        Mon, 11 May 2020 13:54:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypJUe86g4FJ+FcQjyO73wDkY3Qi4OQ0TlJPwFvtPPxSEj+zcUn0NcWHxmVkkYUZmXSraSvrx
X-Received: by 2002:ad4:4dc8:: with SMTP id cw8mr18268660qvb.83.1589230458627;
        Mon, 11 May 2020 13:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589230458; cv=none;
        d=google.com; s=arc-20160816;
        b=T0N/Ap2GdXT7rhojNSqxsr0Jb2tX3EKZpvMbyAc7mZkHQpevGk88GxgpxGxwZIkqcy
         RF+kWSRe2qlriX2tw9Dlb6e79az7dPoublFnGGv7138+6eBdATkuF8H4zf18ElWVhOo1
         9ahRNKnZcPHtb3671r2uWCqToawhdhTIy2GR93oKXGvTDK4by6tEFQXKVm+S+LJkpqPX
         a8RyNZVAup3lUCxZMTpPLRmaNIBqk49rNUv2w1MvOjEpX0RkD7lH4uXtSG0/AgsYEfIZ
         siI1qIqjYYXZdR9ODpzRLOh/C/UArM2QdYRaJR67H1pcdAhaEGOodUllUuVcWoFDnPTE
         0PFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ApfKdlbM1fYSPPea3LqjcLYgAh8qqScfosbbY+F3O8c=;
        b=GqLwhi5uuh1nCYdKuoauD/wmikP0EqP0zyfEJCkeife3rKi2g673ZPieDZFXcb/1vA
         rhRYmSJN7OQtTso6TVekCQcX9w3Lg98hE6hLuyW2ZRgfH0I5wFeFIX2+zNDiNT6e1HLF
         ij3x8ZSvycuTEiChLZFTamqp4nOwmzaRzadElq41eVF2OGvrIffDlVcGyUTSS5I+X0+q
         2miYzuPxOgM3xuTrvsMrYO3fcEyk3tqADhB8eh0tHF9p3dgflz80/k5z1ORgk763+Z6w
         6Wh+Ecf/ll9cxmYjAyPiA7bjkx+8MUYEyrBoh4XAZNb0YAoqL5tGM69B7XWaeAJOIAJc
         LCWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aDKB71U5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19si6631743qvv.46.2020.05.11.13.54.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 13:54:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aDKB71U5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYFRK-0001UA-1L
	for alex.bennee@linaro.org; Mon, 11 May 2020 16:54:18 -0400
Received: from [2001:470:142:3::10] (port=35520 helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYFQg-0001QQ-4T
 for qemu-arm@nongnu.org; Mon, 11 May 2020 16:53:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22135
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYFQC-0005N0-O8
 for qemu-arm@nongnu.org; Mon, 11 May 2020 16:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589230373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ApfKdlbM1fYSPPea3LqjcLYgAh8qqScfosbbY+F3O8c=;
 b=aDKB71U5kDVXXM0UdUi0aMu2UtDHZZbG88eAqXS62499VFCeA7hOMRl/0Ik60FY1MJJMt+
 ZaPzMAULEO2XVggIMEldATmPx+Fp4f/hiAi0oh4/xzyfm6GVCTqdC11aCGb4X+gM6DsyWy
 lnz8wiwynr2fVJcGRe6jdPhvsoIuxUc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-vH_fxPTiMYmzrbgW-58Ihw-1; Mon, 11 May 2020 16:52:51 -0400
X-MC-Unique: vH_fxPTiMYmzrbgW-58Ihw-1
Received: by mail-wr1-f72.google.com with SMTP id r11so5801707wrx.21
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 13:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ApfKdlbM1fYSPPea3LqjcLYgAh8qqScfosbbY+F3O8c=;
 b=tRNwlpyTJnc4Jh9H5tvxlU29kGDaCGjivnnmMC6+dYp9CKtGui+FHNj/lmgYe+8fpc
 iQMC43HgkNlgge0MqAonmb5C4dN6nvj0WhMJKL2puzJuIfKoARTxkS+5DZEOy/bzuWvy
 c0OpDdgRrSauShZnSOPQVwwQQ4eHPT7kRtfdIsWB0srCtYO0ZpCq80YxYeyLJw5oZ5wE
 uDSIknuDZ4anujf2sM2eU/NUB+dLaOksGuspP9rLtIy2jwr+f9LxYYyq3tt6H5sjvNi1
 zzizfhO3RWsnMjc/eW3TuViwIEpBF39plfaAsIgJkMqd45jD7o2NVhL/bIwA+Gwsd3Gm
 SwKw==
X-Gm-Message-State: AGi0PuZhNfWFo0BSvCez9M2p043y2/gLrBfob8rWXE205S/dRKwDOXmr
 VHMZlXRJIHzg/8JqMn/j6yikyw47ttff+83jG+B5a66drMQcrN1K+YFTgQpL4WL1T9VaaRiQY/I
 SHafWuKx4HxNT
X-Received: by 2002:a05:600c:2284:: with SMTP id
 4mr31952888wmf.97.1589230370222; 
 Mon, 11 May 2020 13:52:50 -0700 (PDT)
X-Received: by 2002:a05:600c:2284:: with SMTP id
 4mr31952847wmf.97.1589230369854; 
 Mon, 11 May 2020 13:52:49 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id k5sm18146092wrx.16.2020.05.11.13.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 13:52:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw: Use QEMU_IS_ALIGNED() on parallel flash block size
Date: Mon, 11 May 2020 22:52:46 +0200
Message-Id: <20200511205246.24621-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 02:55:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 T_DKIM_INVALID=0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FVViJOcy3Kv1

Use the QEMU_IS_ALIGNED() macro to verify the flash block size
is properly aligned. It is quicker to process when reviewing.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/sbsa-ref.c       | 2 +-
 hw/arm/virt.c           | 2 +-
 hw/block/pflash_cfi01.c | 2 +-
 hw/block/pflash_cfi02.c | 2 +-
 hw/i386/pc_sysfw.c      | 2 +-
 hw/riscv/virt.c         | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 8409ba853d..b379e4a76a 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -241,7 +241,7 @@ static void sbsa_flash_map1(PFlashCFI01 *flash,
 {
     DeviceState *dev = DEVICE(flash);
 
-    assert(size % SBSA_FLASH_SECTOR_SIZE == 0);
+    assert(QEMU_IS_ALIGNED(size, SBSA_FLASH_SECTOR_SIZE));
     assert(size / SBSA_FLASH_SECTOR_SIZE <= UINT32_MAX);
     qdev_prop_set_uint32(dev, "num-blocks", size / SBSA_FLASH_SECTOR_SIZE);
     qdev_init_nofail(dev);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 634db0cfe9..0a99fddb3d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -978,7 +978,7 @@ static void virt_flash_map1(PFlashCFI01 *flash,
 {
     DeviceState *dev = DEVICE(flash);
 
-    assert(size % VIRT_FLASH_SECTOR_SIZE == 0);
+    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
     assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
     qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
     qdev_init_nofail(dev);
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index f586bac269..11922c0f96 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -964,7 +964,7 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
     if (blk) {
         qdev_prop_set_drive(dev, "drive", blk, &error_abort);
     }
-    assert(size % sector_len == 0);
+    assert(QEMU_IS_ALIGNED(size, sector_len));
     qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
     qdev_prop_set_uint64(dev, "sector-length", sector_len);
     qdev_prop_set_uint8(dev, "width", bank_width);
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index c6b6f2d082..895f7daee3 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -1003,7 +1003,7 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
     if (blk) {
         qdev_prop_set_drive(dev, "drive", blk, &error_abort);
     }
-    assert(size % sector_len == 0);
+    assert(QEMU_IS_ALIGNED(size, sector_len));
     qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
     qdev_prop_set_uint32(dev, "sector-length", sector_len);
     qdev_prop_set_uint8(dev, "width", width);
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index f5f3f466b0..fad41f0e73 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -168,7 +168,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
                          blk_name(blk), strerror(-size));
             exit(1);
         }
-        if (size == 0 || size % FLASH_SECTOR_SIZE != 0) {
+        if (size == 0 || !QEMU_IS_ALIGNED(size, FLASH_SECTOR_SIZE)) {
             error_report("system firmware block device %s has invalid size "
                          "%" PRId64,
                          blk_name(blk), size);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index daae3ebdbb..71481d59c2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -112,7 +112,7 @@ static void virt_flash_map1(PFlashCFI01 *flash,
 {
     DeviceState *dev = DEVICE(flash);
 
-    assert(size % VIRT_FLASH_SECTOR_SIZE == 0);
+    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
     assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
     qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
     qdev_init_nofail(dev);
-- 
2.21.3


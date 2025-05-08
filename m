Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp148738njb;
        Wed, 7 May 2025 19:15:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV96jD5unNkqwC2Mc1dvsu/nBo/mtGrXYvyIjWRelVskgH5XLFh8Yb57BBEMe8z9QEKZ9hwpfOeNLFrOA==@linaro.org
X-Google-Smtp-Source: AGHT+IE6bVTzFuGScxSm+B4Ga4K0R4uRc2DXJgXA+CUqK+h/WIFyAZFjLJ7OO4S+6C0V5rdq2WyP
X-Received: by 2002:a05:6214:27e5:b0:6f5:106a:270e with SMTP id 6a1803df08f44-6f54c4ac0a7mr22310346d6.44.1746670554018;
        Wed, 07 May 2025 19:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746670554; cv=none;
        d=google.com; s=arc-20240605;
        b=kIeqMO+GThkNbx71PCxTIcQttTaXKEhtz9/HPh3nvm/0SZbVZqciVLroHJdpng+EhZ
         5ZIqtsNVc+CzjJ9CUsTZtOjZR68MZMu0uyexbL/FqaOJOe9QuS9iHt8aZmwXlzYRQvOs
         gXwTScV41qOo+WvuVa1MsAar1RnaVG9LF/+X69CwuPWErTN85xH3IpdtNGmLXQd2vKVE
         p42fMD4JdUUD75VPj35QeK9aaD42i88+NHEBi1UYOJxfZGpd4CJXNPwjhR7Jk8s7avaB
         8iPnOkQp+f1vOUHCdD81rZb1UUucymYB7CCTKKTTyZl/TZAX82raRBwB+B37+/ujXFi3
         w49w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=6biUSIsPzsQyImSoRkB97aDVQZkOBWG2G0BZKEhAFWg=;
        fh=HugXKZ7beB7CEvMPab+vVO5D+G3QU70LBXlcBzjMNR8=;
        b=XI6VPDF6afbOX75+m1THsVH56B3YRYYWVZkdZ994Utts3guzG0s6L+QJHCM1T5CsTN
         ySrFib5+RtdfdLp/KU08roUqSzjrPMlQE/VIrH1GI8hB8DiBHriG5bMWPLyh97/XH+TF
         voe0Rr6ZA4ifxyZPQGEODJBoYZrlPJAjadaRoL4IxKndLJkkxJIrd5eSLxfrYSMzGDLv
         Xk+m1EkI1116uPooYlVowIGPKfi4sAJ0OrVmQGkFyEuJaeMEnJi7pLPNesnI43n5s/52
         5zKR1cmWbbInPLig8/WFjVMG2WmcQhYPg4aTdWYJVxu1PQ8eVoByVXZ5oOl9x9eEEtFn
         SGBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nSfjoEM0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f542627ba4si33930546d6.72.2025.05.07.19.15.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 May 2025 19:15:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nSfjoEM0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCqnF-0002pG-BW; Wed, 07 May 2025 22:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <timlee660101@gmail.com>)
 id 1uCqnE-0002os-K8; Wed, 07 May 2025 22:15:24 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <timlee660101@gmail.com>)
 id 1uCqnC-0003i7-PI; Wed, 07 May 2025 22:15:24 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-22e730c05ddso5165625ad.2; 
 Wed, 07 May 2025 19:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746670521; x=1747275321; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6biUSIsPzsQyImSoRkB97aDVQZkOBWG2G0BZKEhAFWg=;
 b=nSfjoEM0dtRP0sAHBF5hMG8u9BtjpvoxAFR0CgUNDUpvgNNjheb/ANEgnx3WILLvi4
 l4jUTPxhftINd0/wa/z794Bh0RY3UjaDbOcLrApzUiddvf/qH0bc8BWBFk7edqdPgSSU
 DWtTpKiAlqzzAJf1Q9IKYFg7I3g9qyRHMyRbqHm5z4pCfBRteFHNGU7L/YGFsKPl9BsW
 55pXwGglUkokXg5AdL57sptmX8kAgc3ZW+ktHmDszDO7l0XOMQmj3zOvufwh0Ka/JsOt
 nFvZDdA2DI0URlURllzJZccIDwqn0clrsbuMzRKQlWnw8gYtwSECbE4j/MwvicsJpQvM
 /CKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746670521; x=1747275321;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6biUSIsPzsQyImSoRkB97aDVQZkOBWG2G0BZKEhAFWg=;
 b=EpH1VcRSBBkXG0MA2st7/j6XzbbLgKt3HdG2M0iRFzmyyJ/TpbzfUMvbG+4Rigte/t
 PckhmIra0ofYN8I6K756DHwPIbUCeAG+GM1mOQ2NkB60l4OH0otFC2NvJvXQl2xBVTeN
 NFzbCNXvkSYlsJUaX9u0Agg1+HFGkRQm+uHRcY/1KLsFNhcv+n1cL00pIKIy1nE6+tZ/
 77QPoeCUacLjIVv3xK/XQP29DuuzWtcWytsxmcENY+xKTN/OO8mQlD3ZluyDIt85H28Y
 X0OsJNA+HzAy2oqhzd6K38r0fLc6kpxYVkieGSJV4Md0DfrsFqorWV5MPnnX3GIihyaF
 n/MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxwdzdgx/NGI/gj9pM2Gwl7ahImMLXKka37TObz52lELQ05KSvknWDIB0jkscjMdZJSTew21qXL/SA@nongnu.org
X-Gm-Message-State: AOJu0YymVX8D5SPgIU/H2GYQVxOXhOgF2p+WuHtxOLGhrVrUY22EzT/8
 2e2eTQKKf+Hn+2q24OHYmE+cVGUj3i8af+bIPQ5H4ObWCcGDxs3y
X-Gm-Gg: ASbGncvIvQkQTANt3OH6A7qD1qkElr586OZIw4ATXVaFf1k5kxhmAJF0jaodshIEXtl
 0aAhMSWKSfQC6nz9DWD487RX6iOd8u4ItIye+5uOy5R2d/QtCEHQvu6Q43n+D8J44T2C3Qtyclq
 9ekne+m0l3E37s5OnNGNRSYmOnC3uExoeEmiyr+EK0pAvfzGzkNDyQCe1aNCsD112PtiwOHUJzs
 ksmrqw0kFUnuILxdMlyDR18DymjbAbq4yg5ArJObfaZ+pJyqfuMMFBtnE5z955KdMOIy3qb8VY5
 kts3etr2+W1g7aPAS2ZpO1lvkAYYdN1SUcvuLsfSfet4zob7QQCpSUskQYLKIEfFMMFcz1k91wD
 QIqVzqYjj
X-Received: by 2002:a17:902:f60e:b0:223:33cb:335f with SMTP id
 d9443c01a7336-22e8560cf20mr22737035ad.3.1746670520821; 
 Wed, 07 May 2025 19:15:20 -0700 (PDT)
Received: from hcdev-d520mt.. (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e150eae2asm101692795ad.39.2025.05.07.19.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 19:15:20 -0700 (PDT)
From: Tim Lee <timlee660101@gmail.com>
To: peter.maydell@linaro.org, wuhaotsh@google.com, kfting@nuvoton.com,
 chli30@nuvoton.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Tim Lee <timlee660101@gmail.com>
Subject: [v2] hw/arm/npcm8xx_boards: Add auto zero flash image and device part
 number
Date: Thu,  8 May 2025 10:15:10 +0800
Message-Id: <20250508021510.2959328-1-timlee660101@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=timlee660101@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mOXJt9/mp6GV

Fix flash device part number to `mx66l1g45g` according image-bmc run on npcm8xx
evb board (SPIFlash...SF: Detected mx66l1g45g, total 128 MiB)

And add auto zero flash image size to resolve error below after executing
`./qemu-system-aarch64 -machine npcm845-evb -drive file=image-bmc`

Error message:
qemu-system-aarch64: mx66l1g45g device '/machine/unattached/device[73]'
requires 134217728 bytes, mtd0 block backend provides 67108864 bytes

Tested:
Build passes and runs ./qemu-system-aarch64 -machine npcm845-evb normally

Signed-off-by: Tim Lee <timlee660101@gmail.com>
---
Changes since v1:
- Add a statement that checks whether the storage is writable

 hw/arm/npcm8xx_boards.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/arm/npcm8xx_boards.c b/hw/arm/npcm8xx_boards.c
index 3fb8478e72..79295a586c 100644
--- a/hw/arm/npcm8xx_boards.c
+++ b/hw/arm/npcm8xx_boards.c
@@ -27,6 +27,7 @@
 #include "qemu/error-report.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
+#include "system/block-backend.h"
 
 #define NPCM845_EVB_POWER_ON_STRAPS 0x000017ff
 
@@ -59,10 +60,26 @@ static void npcm8xx_connect_flash(NPCM7xxFIUState *fiu, int cs_no,
 {
     DeviceState *flash;
     qemu_irq flash_cs;
+    BlockBackend *blk;
+    BlockDriverState *bs;
+    uint64_t blk_size, perm, shared_perm;
 
     flash = qdev_new(flash_type);
     if (dinfo) {
         qdev_prop_set_drive(flash, "drive", blk_by_legacy_dinfo(dinfo));
+        blk = blk_by_legacy_dinfo(dinfo);
+        bs = blk_bs(blk);
+        blk_size = blk_getlength(blk);
+
+        if (!bdrv_is_read_only(bs)) {
+            if (blk_size < fiu->flash_size) {
+                blk_get_perm(blk, &perm, &shared_perm);
+                blk_set_perm(blk, BLK_PERM_ALL, BLK_PERM_ALL, &error_abort);
+                blk_truncate(blk, fiu->flash_size, true, PREALLOC_MODE_OFF,
+                             BDRV_REQ_ZERO_WRITE, &error_abort);
+                blk_set_perm(blk, perm, shared_perm, &error_abort);
+            }
+        }
     }
     qdev_realize_and_unref(flash, BUS(fiu->spi), &error_fatal);
 
@@ -194,7 +211,8 @@ static void npcm845_evb_init(MachineState *machine)
     qdev_realize(DEVICE(soc), NULL, &error_fatal);
 
     npcm8xx_load_bootrom(machine, soc);
-    npcm8xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
+    npcm8xx_connect_flash(&soc->fiu[0], 0, "mx66l1g45g",
+                          drive_get(IF_MTD, 0, 0));
     npcm845_evb_i2c_init(soc);
     npcm845_evb_fan_init(NPCM8XX_MACHINE(machine), soc);
     npcm8xx_load_kernel(machine, soc);
-- 
2.34.1


Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp889772lfg;
        Thu, 25 Mar 2021 17:32:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxvbSRLzcbb2Y4dglWy4iGR+SctMZV0HTnw3aS0CDh55LoAUqy37nmP2FmVxLMaMnI+gOG
X-Received: by 2002:a6b:7501:: with SMTP id l1mr8295926ioh.92.1616718775868;
        Thu, 25 Mar 2021 17:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616718775; cv=none;
        d=google.com; s=arc-20160816;
        b=RDIFGhybWfrrawswvFTHhW3mkNgNKcoyxzacd8gK+5F0ZY/UD2+tI6zlHeeZTQSbLr
         0Gf9ZGlSKTGwKOVjVXNOHgO8raLeXR77Opl37NWN1Swzcl5zPWnA0Cjd1TYm+jIRZLHE
         dBi+0ccLD6XHNNRS674PqvTux3oVyhKnlQkU5rb8IF573IdNKoPfpNJOmld1IsauefE3
         7FN1R+0aBdH1hzObTdP/RDgcjJlLxIxJX2/Co9ZxVWQTTTuW6tQZs41h4Dpa3Os94Yf1
         //8WVM7cKH8y6CvdwMDt2ME7P0TgkY8ALFmUPtAxfv5PpGo7ySSgWZYSzEkjsvZnUN5n
         JbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FPkR6E5eYDSt/dTQyU/+Z12pNzndsaiabWlUEgFNTyo=;
        b=yb2jb+F8No1qNK8kpG0rsod8V4xJTD+hb+VpPBrPDZvNC8mRy/nniw50MKF7W2lsXl
         /8ZqbA1OupDRyMUVZa40gu8AYTPqUnEpfxlXVitz8QEr9cznoGc67Qln+OcagBpWtR2a
         Qc8XJuQDAzxg1ac1EKmGhzYAqO3Jl9xfm6cWixo1OoA7NSE60Spf1ILLkmeAQDuTahgY
         8wN5pj1q8MoWDZPZ/If9EIHENUclh5WuBDustOJrn6OOfE9r9YWPx0MHXiOMK7p9OSQ6
         NzXpVWUtT8y0CP+R3JVUaIE9GMTE1oILYxULzEV7uLdwf28Qa3j4C5ZtTDKWTsZQPXAx
         CJlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XG7b71J6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14si5197031iln.31.2021.03.25.17.32.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 17:32:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XG7b71J6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPaPH-0006k2-6h
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 20:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKS-0002VP-Ry; Thu, 25 Mar 2021 20:27:56 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKQ-00045i-1n; Thu, 25 Mar 2021 20:27:56 -0400
Received: by mail-wr1-x430.google.com with SMTP id e18so4021888wrt.6;
 Thu, 25 Mar 2021 17:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FPkR6E5eYDSt/dTQyU/+Z12pNzndsaiabWlUEgFNTyo=;
 b=XG7b71J6Lu5jA5w+dCTkl2zhZguh7iKxEIeIOn3DUL4n1zI86Hn6x2aAc8exNt5jjd
 hGQn2/jPbN8OZbFpiPv0iOQhrBz2dqhJUUimQmfzjB9LU9eXlNGA/QhsjVd0LUTrt2e1
 7AbJOBBY/IZrPtP8Za+jx3TOpM5ot51mYIcHM5NdOSTFqjCQHHlA1l1YGC9TIAvTJK7p
 2ihJwDotxJmvGOaLeSCOMVveWpCIdBtkgrQZxV/ehos/Co/7pOdHRvEgTyS/tzBJZlis
 UnHD6YcKXbNmHItqMc22/ZavWI1CzjtgRR5XY1RGY4iE/Ifu3cCrR553QXCTnvn97hi3
 QePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FPkR6E5eYDSt/dTQyU/+Z12pNzndsaiabWlUEgFNTyo=;
 b=FP/bwebG3WYXUYJqmWBiYPBGX06t4NGPqjZGNvmzI+JLQRjpflQkvCypX8QlFdxt+h
 6dW2u02jkPpmxkJUDgoCLq0Uv/2UD27VstNDdH7WzkK5Ds+WW+WaJseRAaYPGMX0ubWQ
 7WrrEwwnL3zth2Ul5V/6YPh3LHxC4nlmVC+Tqbiu4780/z1BPOfFXBgEJkBoxFFyK0Th
 kwTfGzi0pvUA3LyEl707Woo9heX/YI0qSbhv4a1VxJwWtx05dvEx8bdBb3Hn9ZAQzRS3
 qyhmixU5zcAzwpOSiAJErhYxc4uXTbgnNmdFzqHX2qMkBVJNYawt3CtUugRrLFMGSrIi
 NaEw==
X-Gm-Message-State: AOAM532Zqfp6Ouo16XG5Vrhep/Nr9jCmdauMylbCQ9dIiCr6wv+Qq0Q5
 5ywP7RY8X6YLVSVMzsKEsyVHvwnxp3sL6Q==
X-Received: by 2002:a5d:56d0:: with SMTP id m16mr11631592wrw.355.1616718471500; 
 Thu, 25 Mar 2021 17:27:51 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c6sm9121200wri.32.2021.03.25.17.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:27:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 04/10] hw/arm/digic: Open-code pflash_cfi02_register()
 call
Date: Fri, 26 Mar 2021 01:27:22 +0100
Message-Id: <20210326002728.1069834-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326002728.1069834-1-f4bug@amsat.org>
References: <20210326002728.1069834-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oT8Fk1A6ya1K

To be able to manually map the flash region on the main memory
(in the next commit), first expand the pflash_cfi02_register
in place.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/digic_boards.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 6cdc1d83fca..fc4a671b2e1 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -31,6 +31,8 @@
 #include "hw/boards.h"
 #include "exec/address-spaces.h"
 #include "qemu/error-report.h"
+#include "hw/qdev-properties.h"
+#include "hw/misc/aliased_region.h"
 #include "hw/arm/digic.h"
 #include "hw/block/flash.h"
 #include "hw/loader.h"
@@ -120,12 +122,25 @@ static void digic4_add_k8p3215uqb_rom(DigicState *s, hwaddr addr,
 #define FLASH_K8P3215UQB_SIZE (4 * 1024 * 1024)
 #define FLASH_K8P3215UQB_SECTOR_SIZE (64 * 1024)
 
-    pflash_cfi02_register(addr, "pflash", FLASH_K8P3215UQB_SIZE,
-                          NULL, FLASH_K8P3215UQB_SECTOR_SIZE,
-                          DIGIC4_ROM_MAX_SIZE / FLASH_K8P3215UQB_SIZE,
-                          4,
-                          0x00EC, 0x007E, 0x0003, 0x0001,
-                          0x0555, 0x2aa, 0);
+    DeviceState *dev = qdev_new(TYPE_PFLASH_CFI02);
+
+    qdev_prop_set_uint32(dev, "num-blocks",
+                         FLASH_K8P3215UQB_SIZE / FLASH_K8P3215UQB_SECTOR_SIZE);
+    qdev_prop_set_uint32(dev, "sector-length", FLASH_K8P3215UQB_SECTOR_SIZE);
+    qdev_prop_set_uint8(dev, "width", 4); /* 32-bit */
+    qdev_prop_set_uint8(dev, "mappings",
+                        DIGIC4_ROM_MAX_SIZE / FLASH_K8P3215UQB_SIZE);
+    qdev_prop_set_uint8(dev, "big-endian", 0);
+    qdev_prop_set_uint16(dev, "id0", 0x00ec);
+    qdev_prop_set_uint16(dev, "id1", 0x007e);
+    qdev_prop_set_uint16(dev, "id2", 0x0003);
+    qdev_prop_set_uint16(dev, "id3", 0x0001);
+    qdev_prop_set_uint16(dev, "unlock-addr0", 0x0555);
+    qdev_prop_set_uint16(dev, "unlock-addr1", 0x2aa);
+    qdev_prop_set_string(dev, "name", "pflash");
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
 
     digic_load_rom(s, addr, FLASH_K8P3215UQB_SIZE, filename);
 }
-- 
2.26.2


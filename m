Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp612143njb;
        Thu, 17 Oct 2024 22:33:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWmKdJ1Zgfl8rx+eyizpz3Of59PYtOFfVdsXciMt26QHoDkl83Veo72+J08BYSFjAtq6cl23b5U4URpA==@linaro.org
X-Google-Smtp-Source: AGHT+IEPSyb6TSSG38Ahcs3w97PiISvKSrbJX6zbqxq5p2IJY96j4gFDEbIQrqUWeLQ/gJ6ur9KS
X-Received: by 2002:a05:6214:3289:b0:6cb:cd05:cddd with SMTP id 6a1803df08f44-6cde154de07mr18569546d6.26.1729229607609;
        Thu, 17 Oct 2024 22:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729229607; cv=none;
        d=google.com; s=arc-20240605;
        b=UhoIEvPhmuAjhokBQb/P+VJm/5sVR2ym8lZj0SHaw6na6Z3UzzVjuGSdPPuyUsAK4M
         eqAxWtV5Jl3Rc2BW0EUBp35r9aJFHWrsoM3KT4U489XnSJlCltfFvBFGuDihj1DVOOuM
         pRIMuonfQwXFbCaveI2VFBfPcz3lOCSPIilVsAk7s8uvKMS8il/hjiEEAgIkImwvLRh6
         APOzTLO7aWQ4DqOeZSG9io3wIf/MHSZII5imdNEo9Pb7HcV/nR6ACKv7e0XbEE7lIZ0q
         JZjccPcCr45+Muz1hmetfmNeTkdOznwGuRf4N+eJfc92BlGslZ2BQeP+FHLmGKz/7fD+
         Oqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=YIzSH9BW8HhWP+WMgZ4Z9PH0w3fyO1924G5cm3wLq2w=;
        fh=RVX+uUL/oYxgKlLpNyiQfzI75/ka+93kXvmeIy2Oap4=;
        b=YLF6OwWg2DrxV5BLn8v5SF7ptuWil+65ghDOKSw7PqXG4fnNogk7AOf/enFdaTdD2x
         clACdiiaReJh39RfNl0mXqdJ3Dv4t8GlVcwht+y0sb0Z0ogvqXH1GfPHYDI+c5mxEb9D
         ApUUx0PTkA3uRIQmBS4titYz5j1u49HZTHq4P0gxdA8A7wH1aiauvALQ5/j05fIWLE5h
         vaqN/SaDTUD0ycpeAKVtDWXCGXuWmkmSAg2tns1aliiXftSCGOFISS5Ml+4IocdJOkgN
         W6OiLGeZUwVJflYJ+j911xDQ0VDuhnI9Z3Z6t6+t998bRflXbSL23c0MznmVPo8BG/9d
         PiKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cde111fccdsi9869256d6.40.2024.10.17.22.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 22:33:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1faH-0008Gk-IH; Fri, 18 Oct 2024 01:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1faF-0008Fk-A3; Fri, 18 Oct 2024 01:31:31 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1faC-00089Y-6F; Fri, 18 Oct 2024 01:31:30 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 18 Oct
 2024 13:31:13 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 18 Oct 2024 13:31:13 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>, "open list:Block layer
 core" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 02/16] hw/block:m25p80: Fix coding style
Date: Fri, 18 Oct 2024 13:30:58 +0800
Message-ID: <20241018053112.1886173-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
References: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GfgcTjbPp+AC

Fix coding style issues from checkpatch.pl

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/block/m25p80.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index f7123f9e68..3f55b8f385 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -61,7 +61,8 @@ typedef struct FlashPartInfo {
      */
     uint8_t id[SPI_NOR_MAX_ID_LEN];
     uint8_t id_len;
-    /* there is confusion between manufacturers as to what a sector is. In this
+    /*
+     * there is confusion between manufacturers as to what a sector is. In this
      * device model, a "sector" is the size that is erased by the ERASE_SECTOR
      * command (opcode 0xd8).
      */
@@ -168,7 +169,7 @@ typedef struct FlashPartInfo {
 /*
  * Spansion read mode command length in bytes,
  * the mode is currently not supported.
-*/
+ */
 
 #define SPANSION_CONTINUOUS_READ_MODE_CMD_LEN 1
 #define WINBOND_CONTINUOUS_READ_MODE_CMD_LEN 1
@@ -189,7 +190,8 @@ static const FlashPartInfo known_devices[] = {
 
     { INFO("at45db081d",  0x1f2500,      0,  64 << 10,  16, ER_4K) },
 
-    /* Atmel EEPROMS - it is assumed, that don't care bit in command
+    /*
+     * Atmel EEPROMS - it is assumed, that don't care bit in command
      * is set to 0. Block protection is not supported.
      */
     { INFO("at25128a-nonjedec", 0x0,     0,         1, 131072, EEPROM) },
@@ -275,10 +277,13 @@ static const FlashPartInfo known_devices[] = {
     { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
     { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
     { INFO_STACKED("mt25qu01g", 0x20bb21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
-    { INFO_STACKED("mt25ql02g", 0x20ba22, 0x1040, 64 << 10, 4096, ER_4K | ER_32K, 2) },
-    { INFO_STACKED("mt25qu02g", 0x20bb22, 0x1040, 64 << 10, 4096, ER_4K | ER_32K, 2) },
+    { INFO_STACKED("mt25ql02g", 0x20ba22, 0x1040, 64 << 10, 4096,
+                   ER_4K | ER_32K, 2) },
+    { INFO_STACKED("mt25qu02g", 0x20bb22, 0x1040, 64 << 10, 4096,
+                   ER_4K | ER_32K, 2) },
 
-    /* Spansion -- single (large) sector size only, at least
+    /*
+     * Spansion -- single (large) sector size only, at least
      * for the chips listed here (without boot sectors).
      */
     { INFO("s25sl032p",   0x010215, 0x4d00,  64 << 10,  64, ER_4K) },
@@ -549,7 +554,8 @@ static void blk_sync_complete(void *opaque, int ret)
     qemu_iovec_destroy(iov);
     g_free(iov);
 
-    /* do nothing. Masters do not directly interact with the backing store,
+    /*
+     * do nothing. Masters do not directly interact with the backing store,
      * only the working copy so no mutexing required.
      */
 }
@@ -1843,7 +1849,7 @@ static void m25p80_register_types(void)
 
     type_register_static(&m25p80_info);
     for (i = 0; i < ARRAY_SIZE(known_devices); ++i) {
-        TypeInfo ti = {
+        const TypeInfo ti = {
             .name       = known_devices[i].part_name,
             .parent     = TYPE_M25P80,
             .class_init = m25p80_class_init,
-- 
2.34.1


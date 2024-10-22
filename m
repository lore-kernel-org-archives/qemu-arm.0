Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2942867njb;
        Tue, 22 Oct 2024 02:42:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWin9VmVkd7Pn2k3aNr8rNUuNXhG613524XsEa/51y+QLZq5ESlCjM7y5HPvuD3FqrNd7k0X5gfy9hCJA==@linaro.org
X-Google-Smtp-Source: AGHT+IFbsBvhCaqCExDarjrXXungFNntF3LJxptidldabC7d+NdnEC8Joa0HCdykW4oRop7erNEp
X-Received: by 2002:a05:620a:4095:b0:7b1:461c:5244 with SMTP id af79cd13be357-7b157b6465emr2145753485a.25.1729590152548;
        Tue, 22 Oct 2024 02:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729590152; cv=none;
        d=google.com; s=arc-20240605;
        b=jYUVixr5GvsNSt+I417n+csCeSq3xF0TGr0aXGQuxBYAz6nFxfe5P5LXiPSNN5cZcT
         9APfioLcU1rZB1SDolTA4SXu9yMT2hABhRWVyv0BHAxWnNCPSBvV8D2HOucRaifJCBFE
         82M3mc8vf0XPXZIiGRoQ/cuPuahfULbNdwTptx1oYQcL8oIYQtH4NlqOaYos60gnM3YB
         pmPbPcb+qYqYTL4F+2lLXKMyfPT6pgdYNaRzEUrNq8b65bS1dwA+kUUj4QCrvc74wgSk
         udUSo3X//OrZkPD08vSZqfCalU3V7yQI+U//YBGBgJ2+qr8AyVus4UxWxJp7YpMAoKCv
         6x/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=dmG8xmmABw+4IvLX7DtIERjyyKrXlhA9GmCyZKauRbc=;
        fh=tJ6TeM8XDKi6I9LERy0ves/+1WFn5YJhFzDAan5mwNk=;
        b=VlHgk1+sbeDKqtBQAwVVnowsMlfchMOwy2M+4/o5YoBhg+oXuZ5ZBUY9evY96iruV7
         J4xc2vHT4eTeVoi3ya6puk+a+D7ebOBIv3Lmzds7fMLvv3L+qn61cWYLyuAlEyCivAY1
         BtfDCyzjh+jHNxx1KWnAUnHluqYYt2/cwJGM+pSC6594vgrTs14yYGB/NCQOqGgwzM8X
         j9OsrJw3gVu5GLIts3NqxqbnQhqjvEswNNLLTTgqRYE+PQDEUqTG9C+9Yh7iiNaeoHXr
         3yHplDPNpkBrTcnl1BrwYvz2wurfKLZoR1KNhLcm+tGURJNnTUULuFE+HeDiH78Qjwxe
         e7FA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce008f581asi62153306d6.181.2024.10.22.02.42.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 02:42:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3BOh-0002s5-Qu; Tue, 22 Oct 2024 05:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BOO-0002o4-M1; Tue, 22 Oct 2024 05:41:33 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BON-00015E-3J; Tue, 22 Oct 2024 05:41:32 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 22 Oct
 2024 17:41:11 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 22 Oct 2024 17:41:11 +0800
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
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v2 02/18] hw/block:m25p80: Fix coding style
Date: Tue, 22 Oct 2024 17:40:54 +0800
Message-ID: <20241022094110.1574011-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
References: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: vLI5a5vS9VS3

Fix coding style issues from checkpatch.pl

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
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


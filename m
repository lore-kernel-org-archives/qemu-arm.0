Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1109381ejb;
        Thu, 16 Feb 2023 19:44:06 -0800 (PST)
X-Google-Smtp-Source: AK7set8z+NizeT3kae9i1JJKnKlrTWDEm1MvCnpb8yHxA07ip/ROy6qIymuU0Qwc4MULC+ne7b4Z
X-Received: by 2002:a05:622a:1487:b0:3bb:88e2:7625 with SMTP id t7-20020a05622a148700b003bb88e27625mr14824404qtx.24.1676605446703;
        Thu, 16 Feb 2023 19:44:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676605446; cv=none;
        d=google.com; s=arc-20160816;
        b=Ec3tDRmrjOp/OCFEvrGjRVMCyJhni4NgTgev8O6YvFKilTm11PXlEruOg3D5/WaaWz
         TF2uMyL5Flg6HJOT2nIFwOM/RNGix3u+tM/TdTfFDW12KPY9oJjcgvAe89ij/qZew2H/
         lWSC5u9Wxiz+tDxJKoKNeOpxigzmEnwFz7X7+l9fWvXgVgXM2A3Z5r0Wv7PJ1lKwyX73
         CY1zPxCh3BMP6VUDATgUycuxGztIfN3Nx0vegpxVlAS1smEyu1FX0LQh3n7NrXJSsBF+
         Zf9uEyL/Amt+zBq2Bc1Opn9ZlsXZIcrJ8tVqMwoVTHmSjPuHi+zaXdyIe3m4QvCy8uCR
         m2Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=OP/Aaoth54IJnjgx0bNTPEQpOZNwWUzZas8kSSj0IYw=;
        b=k8kwMbJstZbNYwaDPp/BIGfR8QRDbiVqU3hDAqX8lKTlEaWzSG+cQ5aNByO9JlwjgY
         DH6tskYfUPjnzSFe1Tu3yipbKVp9LO1VjB7MTDzUDEDNu8l6aSuu2xNuGsMyFviZfyHN
         HdKtIuAd9jAU0wJ+Pf08NX4vd27UTAwzWC059gzqVSLyVe82IYpBuuZ1uhZTR8/J56/J
         fR7nsKHVF7z1Af9uNv6XhZHIL+tc8lYibw7d3SKgIEEe4LyAd1nM7J29kEF5TaBMTB5c
         CZfRAb5o70M2gXbhWLz/ELuR/oSjpBTexj9TbX/+Hj4XpcSX/juqoldANmuVNCCXuZJg
         qEHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15-20020a05622a000f00b003b69e89c572si1057967qtw.576.2023.02.16.19.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 19:44:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSreY-0005Yv-Qq; Thu, 16 Feb 2023 22:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pSreX-0005YK-Il; Thu, 16 Feb 2023 22:43:17 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pSreV-0007B1-CT; Thu, 16 Feb 2023 22:43:17 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id BFF2411F104;
 Fri, 17 Feb 2023 03:43:13 +0000 (UTC)
From: ~ssinprem <ssinprem@git.sr.ht>
Date: Fri, 17 Feb 2023 09:59:53 +0700
Subject: [PATCH qemu v3 2/2] aspeed/fuji : correct the eeprom size
Message-ID: <167660539263.10409.9736070122710923479-2@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <167660539263.10409.9736070122710923479-0@git.sr.ht>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: qemu-stable@nongnu.org, ssinprem@celestica.com, ssumet@celestica.com,
 srikanth@celestica.com, kgengan@celestica.com, clg@kaod.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: ~ssinprem <ssinprem@celestica.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: E537z1HkUbtr

From: Sittisak Sinprem <ssinprem@celestica.com>

Device 24C64 the size is 64 kilobits = 8kilobyte
Device 24C02 the size is 2 kilobits = 256byte

Signed-off-by: Sittisak Sinprem <ssinprem@celestica.com>
---
 hw/arm/aspeed.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 27dda58338..40f6076b44 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -840,42 +840,46 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
 
-    at24c_eeprom_init(i2c[19], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[20], 0x50, 2 * KiB);
-    at24c_eeprom_init(i2c[22], 0x52, 2 * KiB);
+    /*
+    * EEPROM 24c64 size is 64Kbits or 8 Kbytes
+    *        24c02 size is 2Kbits or 256 bytes
+    */
+    at24c_eeprom_init(i2c[19], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[20], 0x50, 256);
+    at24c_eeprom_init(i2c[22], 0x52, 256);
 
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
     i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
 
-    at24c_eeprom_init(i2c[8], 0x51, 64 * KiB);
+    at24c_eeprom_init(i2c[8], 0x51, 8 * KiB);
     i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
 
     i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
-    at24c_eeprom_init(i2c[50], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[50], 0x52, 8 * KiB);
     i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
     i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
 
     i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
     i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
 
-    at24c_eeprom_init(i2c[65], 0x53, 64 * KiB);
+    at24c_eeprom_init(i2c[65], 0x53, 8 * KiB);
     i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
     i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
-    at24c_eeprom_init(i2c[68], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[69], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[70], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[71], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[68], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[69], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[70], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[71], 0x52, 8 * KiB);
 
-    at24c_eeprom_init(i2c[73], 0x53, 64 * KiB);
+    at24c_eeprom_init(i2c[73], 0x53, 8 * KiB);
     i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
     i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
-    at24c_eeprom_init(i2c[76], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[77], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[78], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[79], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[28], 0x50, 2 * KiB);
+    at24c_eeprom_init(i2c[76], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[77], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[78], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[79], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[28], 0x50, 256);
 
     for (int i = 0; i < 8; i++) {
         at24c_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
-- 
2.34.6

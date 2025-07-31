Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B2DC87FD2
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:50:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhb8l-0008JV-2W; Thu, 31 Jul 2025 17:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhapN-0001A9-4Q
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:28:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhapL-0007vY-6M
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:28:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b7848df30cso1463352f8f.0
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753997317; x=1754602117; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWBEps/IHV7G68SkGN78QP86K/TyIINFKInszR+1c2o=;
 b=ebP6tiO3DCPWhK3zfDIkjAx1NVyv/gK+Kr/A6bHbsG1pQbshgbKkN7e1KDaI9657IE
 Bf2L9Gb5//z2LgBv5RgAGBYWlbPOgYdwgHUiQyFq0c2BalSuMHc5wIRiNPXcZCyH6Yc3
 7XH670+7oVrxA4KmEACxd9viJ/b0jWlhL36q46Mxd72KzVYsmnyP/QTo75rmZ9jhkX+l
 84gTdAoavOEJw1i7IIICXu0xiY5R2X3SeqULydLX3XCIp34awFIGVb+MVJ+7oJa01gQX
 u2fpU47MT5lEkZAjqvw4EzkQRW4Yks9w273B4I26+t6TfXuAVBn6R3dEOmcI5c9hP2PR
 Xbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753997317; x=1754602117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oWBEps/IHV7G68SkGN78QP86K/TyIINFKInszR+1c2o=;
 b=I4yJcPOpkbj61Io58QpI6+YevwHBx4H0eXG06C2fU3hwvjihajWAi2maEEwu8ogI4n
 lhzMkPf6uAyK/jJL9wtmgemz/0vmAJt87yFeJXDNtQq+2oYHMp1qxrfcucgFarhi7TQi
 24+aL7j7r38A5I7yPamO2baKiqqVHDGVpEs+JfhQBZfSjHhQkbjlikVQXfk1zhuMa+rN
 BTeSLbkodOPWj2uReEmD0tlRaAFas9YyDGXaj+t+H1a3l937Vkgea5qfNUgmC7OHWZPV
 dzvHiNr1Bygz20A69ZeH75C0JKn0sj5W0Ztu4MagOCzGUkgUZLJzIGXhdmxuqHhb1ZTA
 1bwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbpK5qTzjKTqQvZ8oSVA4L12+hOzJMyVanjHNkz5hFje8veAeIHurNJhESkjKpMrNhf7nt8+li+w==@nongnu.org
X-Gm-Message-State: AOJu0YzrzoSfSdwIApbqNdBN7K6Zqdip+RdJ9LCOQQPxg5AI0uKSV2Ai
 MGCyWTMjYU2peNmaAiFueIC35uM+znDycC1zVXsIlN43gLvScyptuDWkYChERX5tevo=
X-Gm-Gg: ASbGncuvLFC6TrU81B60xnyQ2l5mN6eSnIoff0dyJFU9KoyxNEmjHuj3HzronLTL1HT
 y2ElsY6uDN+nYQqxpCb7daNNd7g1tKZBcbxW/EbG0aX1FJdGdBi3ldwblf4rrBzZLTzbTf4vtlq
 BIo42X5yAj5VaTeWgsnvY9ytTK1Pgy3RVkAhgUkXxDnt+IM0Qh9zKuq7bOP6qcR+eR/IDuPNn3H
 hy1CXO2/LegivmHZ1eOH2GvZxylW4RGRDGRAh+Hbgcl0P3oQ9woeVlwjEbMAGL6MGZYT+ELIh04
 NngGkzgvXG6JI3N8nYxYnU2W5IB61QO4H9461vjD5CEEbt6D85aHDPEtIz5ufEC/Xzr7EIxRMLu
 FSE2RKs9NXwqOIeK4ed5uEZT6LuGBzjnLRb2kXChOLfvD4ntzAnEn7DQHbMwAdESHuU8+rYhc
X-Google-Smtp-Source: AGHT+IFjFXvvqb59RVjZVs8PSLccxOE6ccsUXrudgefeE44V5UyNFjtIJexdbtBY1GGye27mxbtnug==
X-Received: by 2002:a05:6000:2004:b0:3b7:882c:778 with SMTP id
 ffacd0b85a97d-3b79d4e38b5mr2767800f8f.17.1753997317444; 
 Thu, 31 Jul 2025 14:28:37 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c467994sm3569009f8f.50.2025.07.31.14.28.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Jul 2025 14:28:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Weiwei Li <liwei1518@gmail.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 05/11] hw/sd/sdcard: Implement SPI R2 return value
Date: Thu, 31 Jul 2025 23:28:00 +0200
Message-ID: <20250731212807.2706-6-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250731212807.2706-1-philmd@linaro.org>
References: <20250731212807.2706-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In SPI mode, R2 is a 2-byte value.
Implement in spi_response_r2_make() and
return SPI R2 in the SEND_STATUS commands.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 775616c3ae8 ("Partial SD card SPI mode support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c     | 36 +++++++++++++++++++++++++++++++++---
 hw/sd/ssi-sd.c |  3 ---
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index f7c231d9f30..078bc5ef091 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -61,6 +61,7 @@
 typedef enum {
     sd_r0 = 0,    /* no response */
     sd_r1,        /* normal response command */
+    spi_r2,       /* STATUS */
     sd_r2_i,      /* CID register */
     sd_r2_s,      /* CSD register */
     sd_r3,        /* OCR register */
@@ -247,6 +248,7 @@ static const char *sd_response_name(sd_rsp_type_t rsp)
     static const char *response_name[] = {
         [sd_r0]     = "RESP#0 (no response)",
         [sd_r1]     = "RESP#1 (normal cmd)",
+        [spi_r2]    = "RESP#2 (STATUS reg)",
         [sd_r2_i]   = "RESP#2 (CID reg)",
         [sd_r2_s]   = "RESP#2 (CSD reg)",
         [sd_r3]     = "RESP#3 (OCR reg)",
@@ -757,6 +759,24 @@ static size_t sd_response_r1_make(SDState *sd, uint8_t *response, size_t respsz)
     return rsplen;
 }
 
+static size_t spi_response_r2_make(SDState *sd, uint8_t *resp, size_t respsz)
+{
+    sd_response_r1_make(sd, resp, respsz);
+
+    assert(respsz >= 2);
+    resp[1]  = FIELD_EX32(sd->card_status, CSR, CARD_IS_LOCKED) << 0;
+    resp[1] |= (FIELD_EX32(sd->card_status, CSR, LOCK_UNLOCK_FAILED)
+                || FIELD_EX32(sd->card_status, CSR, WP_ERASE_SKIP)) << 1;
+    resp[1] |= FIELD_EX32(sd->card_status, CSR, ERROR) << 2;
+    resp[1] |= FIELD_EX32(sd->card_status, CSR, CC_ERROR) << 3;
+    resp[1] |= FIELD_EX32(sd->card_status, CSR, CARD_ECC_FAILED) << 4;
+    resp[1] |= FIELD_EX32(sd->card_status, CSR, WP_VIOLATION) << 5;
+    resp[1] |= FIELD_EX32(sd->card_status, CSR, ERASE_PARAM) << 6;
+    resp[1] |= FIELD_EX32(sd->card_status, CSR, OUT_OF_RANGE) << 7;
+
+    return 2;
+}
+
 static size_t sd_response_r3_make(SDState *sd, uint8_t *response, size_t respsz)
 {
     size_t rsplen = 4;
@@ -1633,7 +1653,7 @@ static sd_rsp_type_t sd_cmd_SEND_STATUS(SDState *sd, SDRequest req)
     }
 
     if (sd_is_spi(sd)) {
-        return sd_r2_s;
+        return spi_r2;
     }
 
     return sd_req_rca_same(sd, req) ? sd_r1 : sd_r0;
@@ -1947,8 +1967,14 @@ static sd_rsp_type_t sd_acmd_SET_BUS_WIDTH(SDState *sd, SDRequest req)
 /* ACMD13 */
 static sd_rsp_type_t sd_acmd_SD_STATUS(SDState *sd, SDRequest req)
 {
-    return sd_cmd_to_sendingdata(sd, req, 0,
-                                 sd->sd_status, sizeof(sd->sd_status));
+    sd_rsp_type_t rsp;
+
+    rsp = sd_cmd_to_sendingdata(sd, req, 0,
+                                sd->sd_status, sizeof(sd->sd_status));
+    if (sd_is_spi(sd) && rsp != sd_illegal) {
+        return spi_r2;
+    }
+    return rsp;
 }
 
 /* ACMD22 */
@@ -2251,6 +2277,10 @@ send_response:
         rsplen = sd_response_r1_make(sd, response, respsz);
         break;
 
+    case spi_r2:
+        rsplen = spi_response_r2_make(sd, response, respsz);
+        break;
+
     case sd_r2_i:
         assert(respsz >= 16);
         memcpy(response, sd->cid, sizeof(sd->cid));
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 79b6d34a489..ace155186cf 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -158,9 +158,6 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
                                          longresp, sizeof(longresp));
             DPRINTF("CMD%d arg 0x%08x = %d\n", s->cmd, request.arg, s->arglen);
             assert(s->arglen > 0);
-                /* CMD13 returns a 2-byte statuse work. Other commands
-                   only return the first byte.  */
-                s->arglen = (s->cmd == 13) ? 2 : 1;
             memcpy(s->response, longresp, s->arglen);
 
             /* handle R1b (busy signal) */
-- 
2.49.0



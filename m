Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC0AC87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:48:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhb8J-0007hz-1s; Thu, 31 Jul 2025 17:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhapD-0000Yd-D3
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:28:31 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhapA-0007te-9x
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:28:31 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b783d851e6so187704f8f.0
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753997306; x=1754602106; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3YPXddK5v6Xqtrub7LpqRKl+Wnp2Pnfr2Y1mDvAIzEY=;
 b=guikIQ796S6Q8ndeZxADvDj0htenmATMken99Mucg0v+Stbqxk/3znVEpqW5ODP42n
 xm7c6TZ1lEeWArjI46/U1/vHrYVEOe/U+Wg6+wF+E9nu1RzYXMbMkO5khQ+RAM1AWukb
 JCPRVD+oBxXuSXXk1TRJ4GKY2pHLm0NRp7RFrfTOd0QcOUOaQvkg+FnsSIKL5VBYM0fu
 5xo8qQuWItrmCW4R7fZruMDcBzJyy1lUX0tV/7Kl5ztulWx8OxuGMj57fX0pjiTfF1P2
 7+AfyHCwX8FdeRUgL1nIGTfTd/NRI6gW3fpGjjxpJlOARz4FvPN659TaqP3EzVovcJO1
 mzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753997306; x=1754602106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3YPXddK5v6Xqtrub7LpqRKl+Wnp2Pnfr2Y1mDvAIzEY=;
 b=aaDGsTWHaNzA5s+7gp9+fhv7+F1E3URaSN2E+kY6j+RR9d8AYeNQLThzQm25nq1Jnk
 mia+mOhpCv7IKxTcYCUF0vcL6+1d9yKIxEXwGtpki/bZ21mmw9MYMdnjgp+lfE4toWM8
 UZ9BrU/qT6WCdkTtmBDP5sMNOTIOZ4KDpnw7llpbgJgUsC51jESja1yqxoPM+HG9ve7O
 GiO6LW3rq25jr37T+qzTbxWdQCkUWgrCcboRx/9XffGt191TRJXzPubxXXekpQsAYOA5
 kBG4hUp2/3qj5V0WGuoAQvvUzSW9HIpiM9lIHaSuYKohYQcLmrQpfGc3+qAcvTbRKmAi
 /biA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWULv2QUdHq1LjwIwHvIgvn/UGufXeJTo/wZ86H+fE2pHoANkkudZ308tRRjiOfXbY6USZok3o+sw==@nongnu.org
X-Gm-Message-State: AOJu0Yz19++liJGr8lh7fuuTHJ8LsorWkYaeg9c6ZPKk/9sc59SLc0cn
 STDmaKdaqSV+V2SQusDR/M/u++2gP81w4XPsa81Sps7TLO+fu91fBpirojR24PTBR/I=
X-Gm-Gg: ASbGnctkmD2jhREsP4bQJIi8cP30DAmpruQI/AYwq1zNck8IkYipK9QWEv3Ed06Z7r3
 1MLs9cC5qDdMYKec/uzrL6/GKo/fthP6lRNtffF4I52r/xQX+IskMHEGC42TgFOPwPBDrZ1UniJ
 KjmQcXL/wmY6+x5Pbf4HywftzJMZRU0yPnRteLEVt2rM6A0DhgP5oyryAKwHNVsm/EjBXDHsz/u
 P2g3GFgQl8vDl9y6o10GU9koLvS0K0h0wZYQlckHTZpxhjQi6Hab8KucO8kffbqkzdGgay1sPjK
 l3R3EiYThwPi2GAaxwMsnBaX0TlGuAEA0+8OlGX84oVmSbRS5jinWUwBtLWcgSP4BgcsN+t0HbV
 XWwj1gEU43udxgWBrgAoug9oe5YHwOxmr+8gEYNiHQagk19mS9+3MCnUum1VUPmqHmpODRxdL8m
 pCzRWeBks=
X-Google-Smtp-Source: AGHT+IGI/zApcUREjex3r/KFRt72ym9B43x474plpmVmVHVsNwAXFaOO3Mt4foWnSu7ahDM6LVfaiw==
X-Received: by 2002:adf:e9ca:0:b0:3a4:ef70:e0e1 with SMTP id
 ffacd0b85a97d-3b795022391mr6020703f8f.55.1753997306488; 
 Thu, 31 Jul 2025 14:28:26 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abec8sm3742066f8f.8.2025.07.31.14.28.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Jul 2025 14:28:26 -0700 (PDT)
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
Subject: [PATCH-for-10.1 03/11] hw/sd/sdcard: Propagate response size to
 sd_response_r*_make()
Date: Thu, 31 Jul 2025 23:27:58 +0200
Message-ID: <20250731212807.2706-4-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250731212807.2706-1-philmd@linaro.org>
References: <20250731212807.2706-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

All sd_response_r*_make() fill the @response buffer. Now that
sd_do_command() knows the buffer size, propagate it to the
response fillers and assert for any overflow.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 1d88aee38d5..22bdb4ca3ab 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -729,34 +729,52 @@ static int sd_req_crc_validate(SDRequest *req)
     return sd_crc7(buffer, 5) != req->crc;  /* TODO */
 }
 
-static void sd_response_r1_make(SDState *sd, uint8_t *response)
+static size_t sd_response_r1_make(SDState *sd, uint8_t *response, size_t respsz)
 {
+    size_t rsplen = 4;
+
+    assert(respsz >= 4);
     stl_be_p(response, sd->card_status);
 
     /* Clear the "clear on read" status bits */
     sd->card_status &= ~CARD_STATUS_C;
+
+    return rsplen;
 }
 
-static void sd_response_r3_make(SDState *sd, uint8_t *response)
+static size_t sd_response_r3_make(SDState *sd, uint8_t *response, size_t respsz)
 {
+    size_t rsplen = 4;
+
+    assert(respsz >= rsplen);
     stl_be_p(response, sd->ocr & ACMD41_R3_MASK);
+
+    return rsplen;
 }
 
-static void sd_response_r6_make(SDState *sd, uint8_t *response)
+static size_t sd_response_r6_make(SDState *sd, uint8_t *response, size_t respsz)
 {
     uint16_t status;
 
+    assert(respsz >= 4);
     status = ((sd->card_status >> 8) & 0xc000) |
              ((sd->card_status >> 6) & 0x2000) |
               (sd->card_status & 0x1fff);
     sd->card_status &= ~(CARD_STATUS_C & 0xc81fff);
     stw_be_p(response + 0, sd->rca);
     stw_be_p(response + 2, status);
+
+    return 4;
 }
 
-static void sd_response_r7_make(SDState *sd, uint8_t *response)
+static size_t sd_response_r7_make(SDState *sd, uint8_t *response, size_t respsz)
 {
+    size_t rsplen = 4;
+
+    assert(respsz >= rsplen);
     stl_be_p(response, sd->vhs);
+
+    return rsplen;
 }
 
 static uint32_t sd_blk_len(SDState *sd)
@@ -2207,33 +2225,31 @@ send_response:
     switch (rtype) {
     case sd_r1:
     case sd_r1b:
-        sd_response_r1_make(sd, response);
-        rsplen = 4;
+        rsplen = sd_response_r1_make(sd, response, respsz);
         break;
 
     case sd_r2_i:
+        assert(respsz >= 16);
         memcpy(response, sd->cid, sizeof(sd->cid));
         rsplen = 16;
         break;
 
     case sd_r2_s:
+        assert(respsz >= 16);
         memcpy(response, sd->csd, sizeof(sd->csd));
         rsplen = 16;
         break;
 
     case sd_r3:
-        sd_response_r3_make(sd, response);
-        rsplen = 4;
+        rsplen = sd_response_r3_make(sd, response, respsz);
         break;
 
     case sd_r6:
-        sd_response_r6_make(sd, response);
-        rsplen = 4;
+        rsplen = sd_response_r6_make(sd, response, respsz);
         break;
 
     case sd_r7:
-        sd_response_r7_make(sd, response);
-        rsplen = 4;
+        rsplen = sd_response_r7_make(sd, response, respsz);
         break;
 
     case sd_r0:
-- 
2.49.0



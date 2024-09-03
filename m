Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1600155njf;
        Tue, 3 Sep 2024 14:53:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcUGNvIRbnj6aCe/4ifO0LG4LKybQxjHOZE5uOY7k34am5kvCJ16+R9rG++RfxKqDMMEvJttyy//tEJg==@linaro.org
X-Google-Smtp-Source: AGHT+IHoSxuaTWoDvHfBVEbn/9V7TvCwo1JUSdjKb3xf8aFrwupNy7L6PHoJ8Wfr8whoLtly5Bsu
X-Received: by 2002:a05:690c:c93:b0:6ad:5dde:bd39 with SMTP id 00721157ae682-6d40fc0e6b7mr141799357b3.39.1725400407266;
        Tue, 03 Sep 2024 14:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725400407; cv=none;
        d=google.com; s=arc-20160816;
        b=PtkIS4JxvxUbYPnoOqga2ZIHfouc//oM/hjjP21ReimoaHfsN/SylR1z9cD3RS9bXl
         kfPB2BoULeqwLfoX+qCH6QE0Wq78Qh/kkWO7tfzoS0+z5bd849XLVPWYPlLo6Ng7rUvj
         8ks/j30vshZeGlRCpj/vPSZqaMu/ydvR0RDXMRa57hZjVOLvRzdUXhqjHzWRsClZl1V3
         g0TEpZ/clkENd7Mlsv/NikSkW1RjkAkCU3YtiZk/cBESSLnmWDtkjeZydB6UmiBFVfQi
         vNv9QRhq0S4eN+cSseTKoeXpouTI9zxD9EAZNSwHonkxc/Eb8v8RV531HwCRn7+6PbcA
         IGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=PFoSPik66t3P04q3BhIghhGuPh2Gj4nrJCiedrufNLE=;
        fh=DX0HOVXWZ+cEO+gCwxKnopyngyvXNYUEYSto0SvfKuo=;
        b=l8sLjItfmjoUVa4ElecN/qIiRc157vUK8sVP5p4pKcBsTXz6ljXkaDUEoR2pvASAlm
         bZJDGFaIgu9340Kg8vsFZoWSeA7K+wfk139tRs+nWWki1jOPk9jQmVByHIobjFyH5pL8
         BHX2SijpMf3bVpdHKOF0elDHVXu47oBU7BsZagDPVlBzUl4VOl8DNR8PlVgFKsO6HvrK
         na+fPkrbScHPqWyMDWD6MNN5vqNcMvB3Vu5dLUxozMuRXSjlNAHbmrcOS5LPZDcEcw8u
         8g01L2ZZmpEKhuqeViSe7ujNjYDmeaQuNhjprMZwWeuf2BkQooYEDVS/cfSOVvMLhRj4
         h7AQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a9ZihmVf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c340dae826si133983316d6.471.2024.09.03.14.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 14:53:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a9ZihmVf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slbSd-00058P-Eg; Tue, 03 Sep 2024 17:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slbSc-00057o-JJ
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 17:53:14 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slbSa-0003lb-VM
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 17:53:14 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-374d29ad8a7so97312f8f.2
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 14:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725400391; x=1726005191; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PFoSPik66t3P04q3BhIghhGuPh2Gj4nrJCiedrufNLE=;
 b=a9ZihmVfLRTF6XwtnbPKDMbGnbfa3eNYqyWlSD6C7C+67+G16Tv3vTGA/WulliDic3
 rFsPBJmClQt1Y0U1nzSbzbS5g6Lk6j2Md02c7XKsQvBCM4VfSHyPJ9L01VqyQj5au+z7
 mA5VeqtLx67ZK+BJHe5kuYcO+MxOWeggiFP/5s6TWZV0wcBTyw7NBStMvnrU0rsE4yc8
 yDq+ffXzef/1t3P+mGuCDYWxSQ6ByTQ5eLoqOKIgKFWCRWE3FCvHTGojQdBKwCihz8/z
 lTprS8GXqu7ZpeJYxhRg6O+REFM4C1UVVVtECF2xrZSIttIyEoUp08sJDgfpmIHnfvd2
 fDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725400391; x=1726005191;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PFoSPik66t3P04q3BhIghhGuPh2Gj4nrJCiedrufNLE=;
 b=QOSJIA+jiN5JuOZVTOg/YIsBKy7rSSl9M2AUFRBIM108Qtw10hWAZRVfH8ZwZ5kly4
 LB7n+ls3tcf2YrchjhiSVOkXf1f6+Y9kFrcbNfyjoiAmTfOCSv6vuvWGZbRudOex3IJT
 HOl2/O/e3lODLmEvgqp1B+UXeVz67EUNGQVaMKxSXVd623ZfY2zFS47j4wOKnFS2lBnI
 ahoxSq6IpGpJ/pqRtjAVILtkWUSB1MR9eaxsX7YYLoplaxrlF8kYJypeAE+4kLvnElab
 lyq8SehvOL+kNJzlbwRUOSbLw06PgLQAyWJ7q7/AqFEzVVcrzcd6ztqUPj9CRmG/SLKV
 rg5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKa8aCJSEbvzX1qpgCkBJoRIDbIDJ2mnYoV8XLaD7Gg/YYIE/Yj/pLmYlESvL1zoaHmqK4P3Cp1Q==@nongnu.org
X-Gm-Message-State: AOJu0Yxeklrg5gPOXhHH1AtQKOcsb5xaM9sJLONkkqvVQQ4pJXKNFQuH
 OQ8QPPOg0s62CwL1CVX+sW0dFQZfT0ZB3cAXUhZVORqnb1WPCGC5J3ApCAkzqzo=
X-Received: by 2002:adf:fb42:0:b0:374:c318:2188 with SMTP id
 ffacd0b85a97d-37770c702b7mr184223f8f.42.1725400390981; 
 Tue, 03 Sep 2024 14:53:10 -0700 (PDT)
Received: from localhost.localdomain ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c96a88ebsm7271259f8f.108.2024.09.03.14.53.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Sep 2024 14:53:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/arm/omap1: Remove unused omap_uwire_attach() method
Date: Tue,  3 Sep 2024 23:53:09 +0200
Message-ID: <20240903215309.32111-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: GT/isER1H9RK

The recently removed 'cheetah' machine was the single user
of the omap_uwire_attach() method. Remove it altogether with
the uWireSlave structure. Replace the send/receive callbacks
by Unimplemented logging.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Based-on: <20240903160751.4100218-1-peter.maydell@linaro.org>
---
 include/hw/arm/omap.h |  8 --------
 hw/arm/omap1.c        | 29 ++++++++---------------------
 2 files changed, 8 insertions(+), 29 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index cf5f0219a2..e1b6a7cdd9 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -490,15 +490,7 @@ qemu_irq *omap_mpuio_in_get(struct omap_mpuio_s *s);
 void omap_mpuio_out_set(struct omap_mpuio_s *s, int line, qemu_irq handler);
 void omap_mpuio_key(struct omap_mpuio_s *s, int row, int col, int down);
 
-typedef struct uWireSlave {
-    uint16_t (*receive)(void *opaque);
-    void (*send)(void *opaque, uint16_t data);
-    void *opaque;
-} uWireSlave;
-
 struct omap_uwire_s;
-void omap_uwire_attach(struct omap_uwire_s *s,
-                uWireSlave *slave, int chipselect);
 
 struct I2SCodec {
     void *opaque;
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 86ee336e59..25030c7e40 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -2170,29 +2170,27 @@ struct omap_uwire_s {
     uint16_t rxbuf;
     uint16_t control;
     uint16_t setup[5];
-
-    uWireSlave *chip[4];
 };
 
 static void omap_uwire_transfer_start(struct omap_uwire_s *s)
 {
     int chipselect = (s->control >> 10) & 3;		/* INDEX */
-    uWireSlave *slave = s->chip[chipselect];
 
     if ((s->control >> 5) & 0x1f) {			/* NB_BITS_WR */
-        if (s->control & (1 << 12))			/* CS_CMD */
-            if (slave && slave->send)
-                slave->send(slave->opaque,
-                                s->txbuf >> (16 - ((s->control >> 5) & 0x1f)));
+        if (s->control & (1 << 12)) {       /* CS_CMD */
+            qemu_log_mask(LOG_UNIMP, "uWireSlave TX CS:%d data:0x%04x\n",
+                          chipselect,
+                          s->txbuf >> (16 - ((s->control >> 5) & 0x1f)));
+        }
         s->control &= ~(1 << 14);			/* CSRB */
         /* TODO: depending on s->setup[4] bits [1:0] assert an IRQ or
          * a DRQ.  When is the level IRQ supposed to be reset?  */
     }
 
     if ((s->control >> 0) & 0x1f) {			/* NB_BITS_RD */
-        if (s->control & (1 << 12))			/* CS_CMD */
-            if (slave && slave->receive)
-                s->rxbuf = slave->receive(slave->opaque);
+        if (s->control & (1 << 12)) {       /* CS_CMD */
+            qemu_log_mask(LOG_UNIMP, "uWireSlave RX CS:%d\n", chipselect);
+        }
         s->control |= 1 << 15;				/* RDRB */
         /* TODO: depending on s->setup[4] bits [1:0] assert an IRQ or
          * a DRQ.  When is the level IRQ supposed to be reset?  */
@@ -2321,17 +2319,6 @@ static struct omap_uwire_s *omap_uwire_init(MemoryRegion *system_memory,
     return s;
 }
 
-void omap_uwire_attach(struct omap_uwire_s *s,
-                uWireSlave *slave, int chipselect)
-{
-    if (chipselect < 0 || chipselect > 3) {
-        error_report("%s: Bad chipselect %i", __func__, chipselect);
-        exit(-1);
-    }
-
-    s->chip[chipselect] = slave;
-}
-
 /* Pseudonoise Pulse-Width Light Modulator */
 struct omap_pwl_s {
     MemoryRegion iomem;
-- 
2.45.2


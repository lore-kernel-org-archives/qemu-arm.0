Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1501754njf;
        Tue, 3 Sep 2024 09:12:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcS0FNxoEjWuKECwm4wqmv5J4C2JJMtdlsVD7p2U7fe7NaQHCQfnTAehFduN/D3+RtZO2T0Nf1LCDxxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFyKIdULscVexU5mXcBNvBtF/yUDsgDWLzIEzz9kK1UDaEA8iZSefHAvlugXf0jW3zmxCZH
X-Received: by 2002:a05:6122:3684:b0:4f6:b302:5c50 with SMTP id 71dfb90a1353d-500841f7e51mr9061124e0c.0.1725379975961;
        Tue, 03 Sep 2024 09:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725379975; cv=none;
        d=google.com; s=arc-20160816;
        b=FqSc6xZ6VuSuzytuHoBJ4XVyxynxf/W4dtNGbDQxmYsUIBgq6WmKyaYr/9aLo1eQOr
         akjuq4uDiL8/BI+te2ikdOm0TKf+P+O2tigSiOprrNOLu/rFlvSaD5Ehqua0OEbe05kA
         5aWeIruuOHr3sNKl3E4hLrJXtpmmntxKF68lx1g8M4SGlnG/cZLS2OZEylxnj6CZE2aA
         Y2fBoEa618EBAcIFGNlefKZdJaQUTU6MRilG0OEfs7xv3aVUxUwarMcDSw8jF23d9Sg6
         kXiPVU23duayqaer0IAr5L+3IHsHd4oZ0vf9pEU0EQkhaM+xKUUyvtx49HCGiRZHp6qm
         g7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IBK9++lIy858o9BthLOcMzwPW6V+cbfDg3AQGuNzNcc=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=KsYbLmxIuJleC/zLEbtegaXaGZESal/fw4OF7vbqBhJSN48NCVAQzJXEq0YsVZ20NZ
         dM1Dx575lpJIsxM470mStG+azMTw3FZerYHk5DBqSEO/bQYhFJVVg0kpTq+tebE0mrhC
         FdNhsHvSoKrgYkPmLfOqui4E4wgK9hVKB6RfCPEiDajE10oqCipaOhKrbeU3j1nzZWGq
         FG0EgbF1NL23PpXDujcqZ4MAXdktfPi3S4REUuGMkRNU+VOvPhoNzugInTqXBaSYoQSS
         JVjgEX7zeeWWmWMOR4DDuK/Brsy/2t/uLE0OU+49EQAUnQi4EXCxL3u9Itgak9DKWSY9
         W8MA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bjSavRns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5007123df15si3234101e0c.63.2024.09.03.09.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:12:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bjSavRns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slW5Z-0001Pu-Ou; Tue, 03 Sep 2024 12:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW5V-0000vz-83
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:09:01 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW5S-0002wL-9m
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:09:00 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42c828c8863so20608775e9.3
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379737; x=1725984537; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IBK9++lIy858o9BthLOcMzwPW6V+cbfDg3AQGuNzNcc=;
 b=bjSavRnshSYnAfN3nC0375JCL/icIHQwCE4mWDi0Ad46/dlS3vn/13W8V2zmdbs8L0
 QUht5t6VLLXJgI7MDQkzmlKzoB64K3khgm43ZSWSAz9v9rRU4sJDSczlkvuXzBh9mVyd
 D4ZGW3KimYckpdpO2W7af2f/RuvYv/Mofyrqn4BOuBHcCn653LsqGoJVZZ8+CZIICLlu
 GZqZqFqDLeOTtpsPwaogY/24sYhggZho/723x/SeEXDcxdD3J25CUmwTa8cbv7Mwq4OD
 LFHX0vPcac8XvhZbYBWkQjtIYqum1qGgdFyLSMvh4yvDRDTwE0D/eVhIg0xVDG0Cmrl0
 4XjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379737; x=1725984537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IBK9++lIy858o9BthLOcMzwPW6V+cbfDg3AQGuNzNcc=;
 b=pvE3VdeSAigT9QZuW3a44ZdweildDAtB1U+0viQh5OXMUoBLwrUS+LCa1Emo/fVcu5
 NFCOglbhlinwfUviUn2ktXzO1OfjiZmJxmmiRm4AZXV69zuim8YJrKBQWi0rQi0GcMOO
 wOOBibsfmsL08/HvJa69MRhHpBko06Kf7fShWNjbbwQ2R2aLF7f0pwC9ZRzJo4MbSsyR
 +Vs5TaT0O3ex6+a1jjVy2+NATbLRf7uOGktldoJ+mYmTdPGS8rVPw31qQcBiR5FEQPMP
 ewdV2lfBBj0uPIV9rvF1NXAdEgaL9MmThX/RF1R2Y/tT2UEh5xLBLCYfAOwx8/6YChjJ
 31ww==
X-Gm-Message-State: AOJu0Ywfkk/7y3pojMzC4BH2gVpZaOC1agixhl1w3S4I0Qcrntt/t7Wr
 y46WgcnBuFXgxyl7MjP0mYshVskJnkhU1TF/Zuqu8BnhW3RL0a9AIBTWff6rqSMgMbnl2PczNk8
 I
X-Received: by 2002:a05:600c:154d:b0:429:cc03:6450 with SMTP id
 5b1f17b1804b1-42bd731ee10mr90000435e9.7.1725379736719; 
 Tue, 03 Sep 2024 09:08:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm175123065e9.18.2024.09.03.09.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 09:08:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-9.2 41/53] hw/sd: Remove omap2_mmc device
Date: Tue,  3 Sep 2024 17:07:39 +0100
Message-Id: <20240903160751.4100218-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903160751.4100218-1-peter.maydell@linaro.org>
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: jKirro4VKCGI

Remove the OMAP2 specific code from omap_mmc.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/omap.h |  5 ----
 hw/sd/omap_mmc.c      | 63 -------------------------------------------
 2 files changed, 68 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 67bb83dff5d..b0bd1e6f540 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -797,12 +797,7 @@ struct omap_mmc_s *omap_mmc_init(hwaddr base,
                 MemoryRegion *sysmem,
                 BlockBackend *blk,
                 qemu_irq irq, qemu_irq dma[], omap_clk clk);
-struct omap_mmc_s *omap2_mmc_init(struct omap_target_agent_s *ta,
-                BlockBackend *blk, qemu_irq irq, qemu_irq dma[],
-                omap_clk fclk, omap_clk iclk);
 void omap_mmc_reset(struct omap_mmc_s *s);
-void omap_mmc_handlers(struct omap_mmc_s *s, qemu_irq ro, qemu_irq cover);
-void omap_mmc_enable(struct omap_mmc_s *s, int enable);
 
 /* omap_i2c.c */
 I2CBus *omap_i2c_bus(DeviceState *omap_i2c);
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index edd3cf2a1eb..91e9a3f1c6a 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -573,24 +573,6 @@ static const MemoryRegionOps omap_mmc_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void omap_mmc_cover_cb(void *opaque, int line, int level)
-{
-    struct omap_mmc_s *host = opaque;
-
-    if (!host->cdet_state && level) {
-        host->status |= 0x0002;
-        omap_mmc_interrupts_update(host);
-        if (host->cdet_wakeup) {
-            /* TODO: Assert wake-up */
-        }
-    }
-
-    if (host->cdet_state != level) {
-        qemu_set_irq(host->coverswitch, level);
-        host->cdet_state = level;
-    }
-}
-
 struct omap_mmc_s *omap_mmc_init(hwaddr base,
                 MemoryRegion *sysmem,
                 BlockBackend *blk,
@@ -617,48 +599,3 @@ struct omap_mmc_s *omap_mmc_init(hwaddr base,
 
     return s;
 }
-
-struct omap_mmc_s *omap2_mmc_init(struct omap_target_agent_s *ta,
-                BlockBackend *blk, qemu_irq irq, qemu_irq dma[],
-                omap_clk fclk, omap_clk iclk)
-{
-    struct omap_mmc_s *s = g_new0(struct omap_mmc_s, 1);
-
-    s->irq = irq;
-    s->dma = dma;
-    s->clk = fclk;
-    s->lines = 4;
-    s->rev = 2;
-
-    memory_region_init_io(&s->iomem, NULL, &omap_mmc_ops, s, "omap.mmc",
-                          omap_l4_region_size(ta, 0));
-    omap_l4_attach(ta, 0, &s->iomem);
-
-    /* Instantiate the storage */
-    s->card = sd_init(blk, false);
-    if (s->card == NULL) {
-        exit(1);
-    }
-
-    s->cdet = qemu_allocate_irq(omap_mmc_cover_cb, s, 0);
-    sd_set_cb(s->card, NULL, s->cdet);
-
-    omap_mmc_reset(s);
-
-    return s;
-}
-
-void omap_mmc_handlers(struct omap_mmc_s *s, qemu_irq ro, qemu_irq cover)
-{
-    if (s->cdet) {
-        sd_set_cb(s->card, ro, s->cdet);
-        s->coverswitch = cover;
-        qemu_set_irq(cover, s->cdet_state);
-    } else
-        sd_set_cb(s->card, ro, cover);
-}
-
-void omap_mmc_enable(struct omap_mmc_s *s, int enable)
-{
-    sd_enable(s->card, enable);
-}
-- 
2.34.1


Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1501741njf;
        Tue, 3 Sep 2024 09:12:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSSB4A6JYhLSXshSYxHIqKkU9AZ1Y93wWhYCIV7WDqay+INhjzJl0dtQ7JDJLrfZ8h5GkejKgoE4h3hQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF3XNJYJB0U1zZ6RBrB4PMALjT6Lm1aeQLZpPSl7hj276RjfTuZP6B1NZCm63YzNQOHmbeU
X-Received: by 2002:a05:6808:2f1a:b0:3e0:3ff:807c with SMTP id 5614622812f47-3e003ff84fbmr10835576b6e.41.1725379973849;
        Tue, 03 Sep 2024 09:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725379973; cv=none;
        d=google.com; s=arc-20160816;
        b=Fq9ijA9Deo1/PO8FgnlgjFuMWBPQ6Xov/nU9Ya3+vDK67ZYOwHfP4vM4+ONbEsFnRH
         y5uwCkKkna7D9sOUa8sjNusyscV4r6FFAxD9vanEphVeSGULIXFk8Ojfq6HtWsNzZbPW
         u7xC4XB343lwEHveICJwQczFeOZl31Lv+U6dog413PW1jY5hVn2b3xBv9/Vku2h1XeLh
         QAgf3SziEsyQB0Cz9D7CLAfnQTy24B5zbDFwJwUCdy2zvpnsuiYdgoTeJ/01wjCMx/2O
         n0nRFCmc3pwKYGtE7spFZkV6DqqT+QKgSl6eeLMRmeCpblEXskWzvY6LPFOHUDSeDZpI
         +PJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XSUXLx8RymjZoH3CUxgDuuHRurRfQuokj7VlT6LUHv4=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=NbE4O07zp+W1FHD+HsfTG7oYYomFQtCJXFLE1lyQxVADa/xnav5k/QjrwvZma/o/oR
         6KBgbYtVtFbMBOnJlVCoP90s0hy+8FxffMAGr1zRkF5iS8XRL4lFB6ZcxQc+0DvP0o4z
         GB0Pqe/DjsrRmy0gBQpvxUPAJ0fksAAkfIfEZhhm0B9rky8/Rc/8kP9v1h6rv0VulsMh
         uGipu54Wr/QG5SG0PtNJix5wD1cIU97oytbZGcp6nDnALSyPmF9wwJCnllvakeBQ3KHy
         rqFa+dRvHjGsAboOfNvTeFwHqT2+riqJOC04rVur50Dy74Dx26SPQjVJfZjEqi8ES403
         W4tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rTL7waw7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-49a5f4fae5dsi2735635137.287.2024.09.03.09.12.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:12:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rTL7waw7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slW5d-0001kY-Uv; Tue, 03 Sep 2024 12:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW5c-0001bo-Db
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:09:08 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW5Z-0002zE-Rx
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:09:07 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42bb4f8a4bfso30263715e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 09:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379744; x=1725984544; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XSUXLx8RymjZoH3CUxgDuuHRurRfQuokj7VlT6LUHv4=;
 b=rTL7waw7sFmpNRf9INKP5bxBEcy9CAA5ggb0MpdAS+tMjg1oQY00hP8T6riRZTs9sc
 3XwYUJc9eIRtI652Te0Fjfgv7ofQLTWW81SL0/DJxsbjVyEY8e2gpZuf1QkmUfbu8QBo
 ePQfUnY5qLEDd3jG8Uarj8s1llJ7bW11ZSnzHTNEWbBbwC6W7cRQuSrRcSE3V+gWPsb7
 icANAlpjbEQMSa9b7V4yiCfuUHXaqGlpK+1F8XM1eaBjK45RRRTAAQKOYkUkOxSWOU87
 Ce86kh6+gKZiOViIMc6fqEGu6HYFWpsFyMUzNP5xoh0i7pEG3BclCZTOgcEgCtyydJ57
 b/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379744; x=1725984544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XSUXLx8RymjZoH3CUxgDuuHRurRfQuokj7VlT6LUHv4=;
 b=U9n/xiokNjCKBtoO0U6vn+OeBkmQXLkhkDZUXd7v0urVdcgRGPB0y2/N8/6/vwlaRY
 DaH8t3wJOj3d1CrG1wJTlJB+roVime6+Jzyx7dNPc32ZapUMPNj65NpWmfxIS1fgyMCb
 9w68OqjC3eTg3GP9cCWw+Zw/u4MJ7wzU8kqVHnJ5+AHi7dJwRWW+IoX6N/HTCycqwX9p
 nglAoUPxelNgfnUKe6pw4k8X4cYTwc3Kaik8oDqOuD1OKDGtO+FU2a9F5J81oBwUrLjw
 aMaHYfCdrZ5WXwdHRVTpb7CYegkA4CXFqNrQO+0Q5lNjIlUcVh9hR2vBMgQlIoK7Haeh
 H9qA==
X-Gm-Message-State: AOJu0Yw1EdjbxnMGMdsMQKRKxyLiaxan+cFigOorFSbyvWemEq9FBWUj
 RNLCZaAC/tXwpfYXftwTdyg4ElTkon3u++UX5eILCk1PjjO+FzAs212aymXbHQd5jFAA2pPJ1Gv
 W
X-Received: by 2002:a05:600c:3510:b0:429:ea2e:36e1 with SMTP id
 5b1f17b1804b1-42bb4caa0c2mr106323075e9.13.1725379744333; 
 Tue, 03 Sep 2024 09:09:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm175123065e9.18.2024.09.03.09.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 09:09:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-9.2 47/53] hw/ssi: Remove omap_mcspi
Date: Tue,  3 Sep 2024 17:07:45 +0100
Message-Id: <20240903160751.4100218-48-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903160751.4100218-1-peter.maydell@linaro.org>
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: mO3PSnRXxCj6

The omap_mcspi device is used only in the OMAP2 SoC, which we
are removing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/omap.h |  11 --
 hw/ssi/omap_spi.c     | 380 ------------------------------------------
 hw/ssi/meson.build    |   1 -
 3 files changed, 392 deletions(-)
 delete mode 100644 hw/ssi/omap_spi.c

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 982341d0079..118874d8775 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -698,15 +698,6 @@ struct omap_uwire_s;
 void omap_uwire_attach(struct omap_uwire_s *s,
                 uWireSlave *slave, int chipselect);
 
-/* OMAP2 spi */
-struct omap_mcspi_s;
-struct omap_mcspi_s *omap_mcspi_init(struct omap_target_agent_s *ta, int chnum,
-                qemu_irq irq, qemu_irq *drq, omap_clk fclk, omap_clk iclk);
-void omap_mcspi_attach(struct omap_mcspi_s *s,
-                uint32_t (*txrx)(void *opaque, uint32_t, int), void *opaque,
-                int chipselect);
-void omap_mcspi_reset(struct omap_mcspi_s *s);
-
 struct I2SCodec {
     void *opaque;
 
@@ -923,8 +914,6 @@ struct omap_mpu_state_s {
     /* OMAP2-only peripherals */
     struct omap_l4_s *l4;
 
-    struct omap_mcspi_s *mcspi[2];
-
     struct omap_dss_s *dss;
 };
 
diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c
deleted file mode 100644
index 8f85c3e3918..00000000000
--- a/hw/ssi/omap_spi.c
+++ /dev/null
@@ -1,380 +0,0 @@
-/*
- * TI OMAP processor's Multichannel SPI emulation.
- *
- * Copyright (C) 2007-2009 Nokia Corporation
- *
- * Original code for OMAP2 by Andrzej Zaborowski <andrew@openedhand.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 or
- * (at your option) any later version of the License.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- */
-
-#include "qemu/osdep.h"
-#include "qemu/log.h"
-#include "hw/hw.h"
-#include "hw/irq.h"
-#include "hw/arm/omap.h"
-
-/* Multichannel SPI */
-struct omap_mcspi_s {
-    MemoryRegion iomem;
-    qemu_irq irq;
-    int chnum;
-
-    uint32_t sysconfig;
-    uint32_t systest;
-    uint32_t irqst;
-    uint32_t irqen;
-    uint32_t wken;
-    uint32_t control;
-
-    struct omap_mcspi_ch_s {
-        qemu_irq txdrq;
-        qemu_irq rxdrq;
-        uint32_t (*txrx)(void *opaque, uint32_t, int);
-        void *opaque;
-
-        uint32_t tx;
-        uint32_t rx;
-
-        uint32_t config;
-        uint32_t status;
-        uint32_t control;
-    } ch[4];
-};
-
-static inline void omap_mcspi_interrupt_update(struct omap_mcspi_s *s)
-{
-    qemu_set_irq(s->irq, s->irqst & s->irqen);
-}
-
-static inline void omap_mcspi_dmarequest_update(struct omap_mcspi_ch_s *ch)
-{
-    qemu_set_irq(ch->txdrq,
-                    (ch->control & 1) &&		/* EN */
-                    (ch->config & (1 << 14)) &&		/* DMAW */
-                    (ch->status & (1 << 1)) &&		/* TXS */
-                    ((ch->config >> 12) & 3) != 1);	/* TRM */
-    qemu_set_irq(ch->rxdrq,
-                    (ch->control & 1) &&		/* EN */
-                    (ch->config & (1 << 15)) &&		/* DMAW */
-                    (ch->status & (1 << 0)) &&		/* RXS */
-                    ((ch->config >> 12) & 3) != 2);	/* TRM */
-}
-
-static void omap_mcspi_transfer_run(struct omap_mcspi_s *s, int chnum)
-{
-    struct omap_mcspi_ch_s *ch = s->ch + chnum;
-
-    if (!(ch->control & 1))				/* EN */
-        return;
-    if ((ch->status & (1 << 0)) &&			/* RXS */
-                    ((ch->config >> 12) & 3) != 2 &&	/* TRM */
-                    !(ch->config & (1 << 19)))		/* TURBO */
-        goto intr_update;
-    if ((ch->status & (1 << 1)) &&			/* TXS */
-                    ((ch->config >> 12) & 3) != 1)	/* TRM */
-        goto intr_update;
-
-    if (!(s->control & 1) ||				/* SINGLE */
-                    (ch->config & (1 << 20))) {		/* FORCE */
-        if (ch->txrx)
-            ch->rx = ch->txrx(ch->opaque, ch->tx,	/* WL */
-                            1 + (0x1f & (ch->config >> 7)));
-    }
-
-    ch->tx = 0;
-    ch->status |= 1 << 2;				/* EOT */
-    ch->status |= 1 << 1;				/* TXS */
-    if (((ch->config >> 12) & 3) != 2)			/* TRM */
-        ch->status |= 1 << 0;				/* RXS */
-
-intr_update:
-    if ((ch->status & (1 << 0)) &&			/* RXS */
-                    ((ch->config >> 12) & 3) != 2 &&	/* TRM */
-                    !(ch->config & (1 << 19)))		/* TURBO */
-        s->irqst |= 1 << (2 + 4 * chnum);		/* RX_FULL */
-    if ((ch->status & (1 << 1)) &&			/* TXS */
-                    ((ch->config >> 12) & 3) != 1)	/* TRM */
-        s->irqst |= 1 << (0 + 4 * chnum);		/* TX_EMPTY */
-    omap_mcspi_interrupt_update(s);
-    omap_mcspi_dmarequest_update(ch);
-}
-
-void omap_mcspi_reset(struct omap_mcspi_s *s)
-{
-    int ch;
-
-    s->sysconfig = 0;
-    s->systest = 0;
-    s->irqst = 0;
-    s->irqen = 0;
-    s->wken = 0;
-    s->control = 4;
-
-    for (ch = 0; ch < 4; ch ++) {
-        s->ch[ch].config = 0x060000;
-        s->ch[ch].status = 2;				/* TXS */
-        s->ch[ch].control = 0;
-
-        omap_mcspi_dmarequest_update(s->ch + ch);
-    }
-
-    omap_mcspi_interrupt_update(s);
-}
-
-static uint64_t omap_mcspi_read(void *opaque, hwaddr addr, unsigned size)
-{
-    struct omap_mcspi_s *s = opaque;
-    int ch = 0;
-    uint32_t ret;
-
-    if (size != 4) {
-        return omap_badwidth_read32(opaque, addr);
-    }
-
-    switch (addr) {
-    case 0x00:	/* MCSPI_REVISION */
-        return 0x91;
-
-    case 0x10:	/* MCSPI_SYSCONFIG */
-        return s->sysconfig;
-
-    case 0x14:	/* MCSPI_SYSSTATUS */
-        return 1;					/* RESETDONE */
-
-    case 0x18:	/* MCSPI_IRQSTATUS */
-        return s->irqst;
-
-    case 0x1c:	/* MCSPI_IRQENABLE */
-        return s->irqen;
-
-    case 0x20:	/* MCSPI_WAKEUPENABLE */
-        return s->wken;
-
-    case 0x24:	/* MCSPI_SYST */
-        return s->systest;
-
-    case 0x28:	/* MCSPI_MODULCTRL */
-        return s->control;
-
-    case 0x68: ch ++;
-        /* fall through */
-    case 0x54: ch ++;
-        /* fall through */
-    case 0x40: ch ++;
-        /* fall through */
-    case 0x2c:	/* MCSPI_CHCONF */
-        return s->ch[ch].config;
-
-    case 0x6c: ch ++;
-        /* fall through */
-    case 0x58: ch ++;
-        /* fall through */
-    case 0x44: ch ++;
-        /* fall through */
-    case 0x30:	/* MCSPI_CHSTAT */
-        return s->ch[ch].status;
-
-    case 0x70: ch ++;
-        /* fall through */
-    case 0x5c: ch ++;
-        /* fall through */
-    case 0x48: ch ++;
-        /* fall through */
-    case 0x34:	/* MCSPI_CHCTRL */
-        return s->ch[ch].control;
-
-    case 0x74: ch ++;
-        /* fall through */
-    case 0x60: ch ++;
-        /* fall through */
-    case 0x4c: ch ++;
-        /* fall through */
-    case 0x38:	/* MCSPI_TX */
-        return s->ch[ch].tx;
-
-    case 0x78: ch ++;
-        /* fall through */
-    case 0x64: ch ++;
-        /* fall through */
-    case 0x50: ch ++;
-        /* fall through */
-    case 0x3c:	/* MCSPI_RX */
-        s->ch[ch].status &= ~(1 << 0);			/* RXS */
-        ret = s->ch[ch].rx;
-        omap_mcspi_transfer_run(s, ch);
-        return ret;
-    }
-
-    OMAP_BAD_REG(addr);
-    return 0;
-}
-
-static void omap_mcspi_write(void *opaque, hwaddr addr,
-                             uint64_t value, unsigned size)
-{
-    struct omap_mcspi_s *s = opaque;
-    int ch = 0;
-
-    if (size != 4) {
-        omap_badwidth_write32(opaque, addr, value);
-        return;
-    }
-
-    switch (addr) {
-    case 0x00:	/* MCSPI_REVISION */
-    case 0x14:	/* MCSPI_SYSSTATUS */
-    case 0x30:	/* MCSPI_CHSTAT0 */
-    case 0x3c:	/* MCSPI_RX0 */
-    case 0x44:	/* MCSPI_CHSTAT1 */
-    case 0x50:	/* MCSPI_RX1 */
-    case 0x58:	/* MCSPI_CHSTAT2 */
-    case 0x64:	/* MCSPI_RX2 */
-    case 0x6c:	/* MCSPI_CHSTAT3 */
-    case 0x78:	/* MCSPI_RX3 */
-        OMAP_RO_REG(addr);
-        return;
-
-    case 0x10:	/* MCSPI_SYSCONFIG */
-        if (value & (1 << 1))				/* SOFTRESET */
-            omap_mcspi_reset(s);
-        s->sysconfig = value & 0x31d;
-        break;
-
-    case 0x18:	/* MCSPI_IRQSTATUS */
-        if (!((s->control & (1 << 3)) && (s->systest & (1 << 11)))) {
-            s->irqst &= ~value;
-            omap_mcspi_interrupt_update(s);
-        }
-        break;
-
-    case 0x1c:	/* MCSPI_IRQENABLE */
-        s->irqen = value & 0x1777f;
-        omap_mcspi_interrupt_update(s);
-        break;
-
-    case 0x20:	/* MCSPI_WAKEUPENABLE */
-        s->wken = value & 1;
-        break;
-
-    case 0x24:	/* MCSPI_SYST */
-        if (s->control & (1 << 3))			/* SYSTEM_TEST */
-            if (value & (1 << 11)) {			/* SSB */
-                s->irqst |= 0x1777f;
-                omap_mcspi_interrupt_update(s);
-            }
-        s->systest = value & 0xfff;
-        break;
-
-    case 0x28:	/* MCSPI_MODULCTRL */
-        if (value & (1 << 3))				/* SYSTEM_TEST */
-            if (s->systest & (1 << 11)) {		/* SSB */
-                s->irqst |= 0x1777f;
-                omap_mcspi_interrupt_update(s);
-            }
-        s->control = value & 0xf;
-        break;
-
-    case 0x68: ch ++;
-        /* fall through */
-    case 0x54: ch ++;
-        /* fall through */
-    case 0x40: ch ++;
-        /* fall through */
-    case 0x2c:	/* MCSPI_CHCONF */
-        if ((value ^ s->ch[ch].config) & (3 << 14))	/* DMAR | DMAW */
-            omap_mcspi_dmarequest_update(s->ch + ch);
-        if (((value >> 12) & 3) == 3) { /* TRM */
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid TRM value (3)\n",
-                          __func__);
-        }
-        if (((value >> 7) & 0x1f) < 3) { /* WL */
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "%s: invalid WL value (%" PRIx64 ")\n",
-                          __func__, (value >> 7) & 0x1f);
-        }
-        s->ch[ch].config = value & 0x7fffff;
-        break;
-
-    case 0x70: ch ++;
-        /* fall through */
-    case 0x5c: ch ++;
-        /* fall through */
-    case 0x48: ch ++;
-        /* fall through */
-    case 0x34:	/* MCSPI_CHCTRL */
-        if (value & ~s->ch[ch].control & 1) {		/* EN */
-            s->ch[ch].control |= 1;
-            omap_mcspi_transfer_run(s, ch);
-        } else
-            s->ch[ch].control = value & 1;
-        break;
-
-    case 0x74: ch ++;
-        /* fall through */
-    case 0x60: ch ++;
-        /* fall through */
-    case 0x4c: ch ++;
-        /* fall through */
-    case 0x38:	/* MCSPI_TX */
-        s->ch[ch].tx = value;
-        s->ch[ch].status &= ~(1 << 1);			/* TXS */
-        omap_mcspi_transfer_run(s, ch);
-        break;
-
-    default:
-        OMAP_BAD_REG(addr);
-        return;
-    }
-}
-
-static const MemoryRegionOps omap_mcspi_ops = {
-    .read = omap_mcspi_read,
-    .write = omap_mcspi_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-struct omap_mcspi_s *omap_mcspi_init(struct omap_target_agent_s *ta, int chnum,
-                qemu_irq irq, qemu_irq *drq, omap_clk fclk, omap_clk iclk)
-{
-    struct omap_mcspi_s *s = g_new0(struct omap_mcspi_s, 1);
-    struct omap_mcspi_ch_s *ch = s->ch;
-
-    s->irq = irq;
-    s->chnum = chnum;
-    while (chnum --) {
-        ch->txdrq = *drq ++;
-        ch->rxdrq = *drq ++;
-        ch ++;
-    }
-    omap_mcspi_reset(s);
-
-    memory_region_init_io(&s->iomem, NULL, &omap_mcspi_ops, s, "omap.mcspi",
-                          omap_l4_region_size(ta, 0));
-    omap_l4_attach(ta, 0, &s->iomem);
-
-    return s;
-}
-
-void omap_mcspi_attach(struct omap_mcspi_s *s,
-                uint32_t (*txrx)(void *opaque, uint32_t, int), void *opaque,
-                int chipselect)
-{
-    if (chipselect < 0 || chipselect >= s->chnum)
-        hw_error("%s: Bad chipselect %i\n", __func__, chipselect);
-
-    s->ch[chipselect].txrx = txrx;
-    s->ch[chipselect].opaque = opaque;
-}
diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
index b7ad7fca3b3..23cd425ab00 100644
--- a/hw/ssi/meson.build
+++ b/hw/ssi/meson.build
@@ -9,7 +9,6 @@ system_ss.add(when: 'CONFIG_XILINX_SPI', if_true: files('xilinx_spi.c'))
 system_ss.add(when: 'CONFIG_XILINX_SPIPS', if_true: files('xilinx_spips.c'))
 system_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-ospi.c'))
 system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_spi.c'))
-system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_spi.c'))
 system_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_spi_host.c'))
 system_ss.add(when: 'CONFIG_BCM2835_SPI', if_true: files('bcm2835_spi.c'))
 system_ss.add(when: 'CONFIG_PNV_SPI', if_true: files('pnv_spi.c'))
-- 
2.34.1


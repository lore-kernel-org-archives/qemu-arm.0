Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1500956njf;
        Tue, 3 Sep 2024 09:10:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdyIgBqGHN+gEIl6DyHBa5tmckaSB/1JEZahzxk1A5LdP5Ovhjd2hg4HBUVIVSMddYxoHSI5RRqGUdUA==@linaro.org
X-Google-Smtp-Source: AGHT+IGiawnKv5gtY2qPNhl2J1wYA0IlS0vUNWxVTdDf7tNZkglHgK8aeshypKk0Q2Dpy0VITUDR
X-Received: by 2002:a05:6871:588:b0:254:bd24:de83 with SMTP id 586e51a60fabf-277d03a4fb5mr13718245fac.12.1725379856976;
        Tue, 03 Sep 2024 09:10:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725379856; cv=none;
        d=google.com; s=arc-20160816;
        b=SzOlVXE+WsGDt8VUvw3ByE6q7ksDciO2nXaWgxjJP91oJJNJDjRFI9wGqTEjzzWANV
         S1UYtEGn+g3v/GTfEyIfsSFkLH8udKAkIPOEqzrNs37aFGp8eKtrBi7xBFWHGaM9Fg+A
         xPG/1m5tIYXCE7kecZ/kvWROmmDUcLVPAb7BT4lIBRvjMdastC83h7J6kDpIfSQG0PjS
         Nd8054/kmtIjpSm4/Bc426sx2gPsBjgg6nbUrk/7TJd0+k1JFOEWRF74sXvJMV0qSzCy
         j2q94KSTFboCVS+F61yoZpmGLE+Jx2FWjE9lmc0U64EQex3+px9tQsBmJASdq7xt8ab9
         ouhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rsXW0JF6X/xi7x8gKFRCe8P3bN45l5T9xPBZQ2rRvTk=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=OfmGU8UwR0svyEUBx3CPB8HHNCn1+tjKRSYzimGezkrJqhTa7yeQRTluAUK0Kz5hXQ
         LLUBbTafMhSSDJM2pnAtXu05M5sWxx+7/4pca9AO+DlPnuCIiHaCOzIMrjsqKG0z4XyD
         7Z2xo4mFiyrYhxiKuXpO1kmosuNN+sxZ2XNbMpSxtTsXpAS+nbld5ZbX4j69TXQX+p2F
         fEb5aYTqHq+hsotZd2VygRiCr1YVzef28xtiHYXO8IaXuUpvTK7d0QFfKQ5P3sQI1XCs
         QaDifMBzrJ0AGm45ur/wuiQob6fCkPq2dO4hggz/206iKytDg/VQU1yAH11peycEFC83
         pOCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oWbYUwax;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-49a5f59ab10si3221538137.719.2024.09.03.09.10.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:10:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oWbYUwax;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slW5k-0002TM-AW; Tue, 03 Sep 2024 12:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW5i-0002Fc-9M
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:09:14 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW5e-00030r-Ck
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:09:13 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-374bb08d011so2257132f8f.3
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 09:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379748; x=1725984548; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rsXW0JF6X/xi7x8gKFRCe8P3bN45l5T9xPBZQ2rRvTk=;
 b=oWbYUwaxq2vnZffICWstqd4eW0u+mo1Jrn29noR4uBGgaxxDvAL9Rfs6IgT8BKdVdy
 ygsdArhHIhMz0tPACaFGsf2bQOgcKItLM5oMPOcUiWGwYLfnKzZ7yue5Atz1Qm8KOLkw
 oSe+ueuda3w2+rpQQ1wfMJNUSWmg0gMZareXPt6HINEkRESC8AFwR7hY7wyyZq8fkXp5
 kR2BVOo2dGyW66KnurT1dFLFaTzhLC7GS+o+fnLheXOW+8+iKXkqb4o0+iduhMfhGTRQ
 lJRfYRpMDUAxqTNUChw7Lm1CRHmhaNmXdxQfzVRl4FC2ViANVaQzXJ2mTCGehklhsN7z
 nbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379748; x=1725984548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rsXW0JF6X/xi7x8gKFRCe8P3bN45l5T9xPBZQ2rRvTk=;
 b=GcQnFibIotQUIP/SmwKXkNSEOGosRV25Kq0SjyyFegS8bqUt3fjbIaRRAse67qYbMR
 TSlI/n8529NoUEvzsi3sKzpAZoYn5+ZJQqs2tw8P9O8zoEXXfoUNcNtJDjUxgfCMPO8h
 DbeTU1BtRBpxWj4lixyR1vMAsOFPy9PjLAXxN6HrbWCuPc+TMdk2jiPhXj4strp1Jynv
 4/YPkLUdu5Rah5X+bcW9n8JEd2hDhut8gBdgaZYUKibJ7gG90PCO0vfsXUxbQyb4lAYv
 EQ6kJISlDBjtr/lsJv4zysqZEKTeBEjqIiONAQCQOqOTDfOj6/PKbA0EgqvlzAVuodfs
 R4vQ==
X-Gm-Message-State: AOJu0Yw6rzBB+jLVzUTId+RAFFduj5VLTlmvq3yFcb7oRsf9DXTsF0KK
 1ZCbR9hh3g5qqekzES6LZxlhhlZ2SPr4XAC/nJkGF4FGEg8ufbOF5EBPP59PrMpVmb00v2ZwtVF
 9
X-Received: by 2002:a5d:53c1:0:b0:368:117c:84fd with SMTP id
 ffacd0b85a97d-374c945548fmr4796965f8f.3.1725379748371; 
 Tue, 03 Sep 2024 09:09:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm175123065e9.18.2024.09.03.09.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 09:09:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-9.2 52/53] hw/dma: Remove omap_dma4 device
Date: Tue,  3 Sep 2024 17:07:50 +0100
Message-Id: <20240903160751.4100218-53-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903160751.4100218-1-peter.maydell@linaro.org>
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: dMms/ZN0rSjN

The omap_dma4 device was only used in the OMAP2 SoC, which has
been removed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/omap.h |   1 -
 hw/dma/omap_dma.c     | 451 +-----------------------------------------
 2 files changed, 3 insertions(+), 449 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index f82b820d4d8..3f9860070b9 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -421,7 +421,6 @@ enum omap_dma_model {
     omap_dma_3_0,
     omap_dma_3_1,
     omap_dma_3_2,
-    omap_dma_4,
 };
 
 struct soc_dma_s;
diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index 77797a67b52..9a8c3c34a07 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -686,10 +686,7 @@ void omap_dma_reset(struct soc_dma_s *dma)
     struct omap_dma_s *s = dma->opaque;
 
     soc_dma_reset(s->dma);
-    if (s->model < omap_dma_4)
-        s->gcr = 0x0004;
-    else
-        s->gcr = 0x00010010;
+    s->gcr = 0x0004;
     s->ocp = 0x00000000;
     memset(&s->irqstat, 0, sizeof(s->irqstat));
     memset(&s->irqen, 0, sizeof(s->irqen));
@@ -697,8 +694,7 @@ void omap_dma_reset(struct soc_dma_s *dma)
     s->lcd_ch.condition = 0;
     s->lcd_ch.interrupts = 0;
     s->lcd_ch.dual = 0;
-    if (s->model < omap_dma_4)
-        omap_dma_enable_3_1_mapping(s);
+    omap_dma_enable_3_1_mapping(s);
     for (i = 0; i < s->chans; i ++) {
         s->ch[i].suspend = 0;
         s->ch[i].prefetch = 0;
@@ -721,10 +717,7 @@ void omap_dma_reset(struct soc_dma_s *dma)
         s->ch[i].repeat = 0;
         s->ch[i].auto_init = 0;
         s->ch[i].link_enabled = 0;
-        if (s->model < omap_dma_4)
-            s->ch[i].interrupts = 0x0003;
-        else
-            s->ch[i].interrupts = 0x0000;
+        s->ch[i].interrupts = 0x0003;
         s->ch[i].status = 0;
         s->ch[i].cstatus = 0;
         s->ch[i].active = 0;
@@ -1587,7 +1580,6 @@ static void omap_dma_setcaps(struct omap_dma_s *s)
     case omap_dma_3_1:
         break;
     case omap_dma_3_2:
-    case omap_dma_4:
         /* XXX Only available for sDMA */
         s->caps[0] =
                 (1 << 19) |	/* Constant Fill Capability */
@@ -1678,443 +1670,6 @@ struct soc_dma_s *omap_dma_init(hwaddr base, qemu_irq *irqs,
     return s->dma;
 }
 
-static void omap_dma_interrupts_4_update(struct omap_dma_s *s)
-{
-    struct omap_dma_channel_s *ch = s->ch;
-    uint32_t bmp, bit;
-
-    for (bmp = 0, bit = 1; bit; ch ++, bit <<= 1)
-        if (ch->status) {
-            bmp |= bit;
-            ch->cstatus |= ch->status;
-            ch->status = 0;
-        }
-    if ((s->irqstat[0] |= s->irqen[0] & bmp))
-        qemu_irq_raise(s->irq[0]);
-    if ((s->irqstat[1] |= s->irqen[1] & bmp))
-        qemu_irq_raise(s->irq[1]);
-    if ((s->irqstat[2] |= s->irqen[2] & bmp))
-        qemu_irq_raise(s->irq[2]);
-    if ((s->irqstat[3] |= s->irqen[3] & bmp))
-        qemu_irq_raise(s->irq[3]);
-}
-
-static uint64_t omap_dma4_read(void *opaque, hwaddr addr,
-                               unsigned size)
-{
-    struct omap_dma_s *s = opaque;
-    int irqn = 0, chnum;
-    struct omap_dma_channel_s *ch;
-
-    if (size == 1) {
-        return omap_badwidth_read16(opaque, addr);
-    }
-
-    switch (addr) {
-    case 0x00:	/* DMA4_REVISION */
-        return 0x40;
-
-    case 0x14:	/* DMA4_IRQSTATUS_L3 */
-        irqn ++;
-        /* fall through */
-    case 0x10:	/* DMA4_IRQSTATUS_L2 */
-        irqn ++;
-        /* fall through */
-    case 0x0c:	/* DMA4_IRQSTATUS_L1 */
-        irqn ++;
-        /* fall through */
-    case 0x08:	/* DMA4_IRQSTATUS_L0 */
-        return s->irqstat[irqn];
-
-    case 0x24:	/* DMA4_IRQENABLE_L3 */
-        irqn ++;
-        /* fall through */
-    case 0x20:	/* DMA4_IRQENABLE_L2 */
-        irqn ++;
-        /* fall through */
-    case 0x1c:	/* DMA4_IRQENABLE_L1 */
-        irqn ++;
-        /* fall through */
-    case 0x18:	/* DMA4_IRQENABLE_L0 */
-        return s->irqen[irqn];
-
-    case 0x28:	/* DMA4_SYSSTATUS */
-        return 1;						/* RESETDONE */
-
-    case 0x2c:	/* DMA4_OCP_SYSCONFIG */
-        return s->ocp;
-
-    case 0x64:	/* DMA4_CAPS_0 */
-        return s->caps[0];
-    case 0x6c:	/* DMA4_CAPS_2 */
-        return s->caps[2];
-    case 0x70:	/* DMA4_CAPS_3 */
-        return s->caps[3];
-    case 0x74:	/* DMA4_CAPS_4 */
-        return s->caps[4];
-
-    case 0x78:	/* DMA4_GCR */
-        return s->gcr;
-
-    case 0x80 ... 0xfff:
-        addr -= 0x80;
-        chnum = addr / 0x60;
-        ch = s->ch + chnum;
-        addr -= chnum * 0x60;
-        break;
-
-    default:
-        OMAP_BAD_REG(addr);
-        return 0;
-    }
-
-    /* Per-channel registers */
-    switch (addr) {
-    case 0x00:	/* DMA4_CCR */
-        return (ch->buf_disable << 25) |
-                (ch->src_sync << 24) |
-                (ch->prefetch << 23) |
-                ((ch->sync & 0x60) << 14) |
-                (ch->bs << 18) |
-                (ch->transparent_copy << 17) |
-                (ch->constant_fill << 16) |
-                (ch->mode[1] << 14) |
-                (ch->mode[0] << 12) |
-                (0 << 10) | (0 << 9) |
-                (ch->suspend << 8) |
-                (ch->enable << 7) |
-                (ch->priority << 6) |
-                (ch->fs << 5) | (ch->sync & 0x1f);
-
-    case 0x04:	/* DMA4_CLNK_CTRL */
-        return (ch->link_enabled << 15) | ch->link_next_ch;
-
-    case 0x08:	/* DMA4_CICR */
-        return ch->interrupts;
-
-    case 0x0c:	/* DMA4_CSR */
-        return ch->cstatus;
-
-    case 0x10:	/* DMA4_CSDP */
-        return (ch->endian[0] << 21) |
-                (ch->endian_lock[0] << 20) |
-                (ch->endian[1] << 19) |
-                (ch->endian_lock[1] << 18) |
-                (ch->write_mode << 16) |
-                (ch->burst[1] << 14) |
-                (ch->pack[1] << 13) |
-                (ch->translate[1] << 9) |
-                (ch->burst[0] << 7) |
-                (ch->pack[0] << 6) |
-                (ch->translate[0] << 2) |
-                (ch->data_type >> 1);
-
-    case 0x14:	/* DMA4_CEN */
-        return ch->elements;
-
-    case 0x18:	/* DMA4_CFN */
-        return ch->frames;
-
-    case 0x1c:	/* DMA4_CSSA */
-        return ch->addr[0];
-
-    case 0x20:	/* DMA4_CDSA */
-        return ch->addr[1];
-
-    case 0x24:	/* DMA4_CSEI */
-        return ch->element_index[0];
-
-    case 0x28:	/* DMA4_CSFI */
-        return ch->frame_index[0];
-
-    case 0x2c:	/* DMA4_CDEI */
-        return ch->element_index[1];
-
-    case 0x30:	/* DMA4_CDFI */
-        return ch->frame_index[1];
-
-    case 0x34:	/* DMA4_CSAC */
-        return ch->active_set.src & 0xffff;
-
-    case 0x38:	/* DMA4_CDAC */
-        return ch->active_set.dest & 0xffff;
-
-    case 0x3c:	/* DMA4_CCEN */
-        return ch->active_set.element;
-
-    case 0x40:	/* DMA4_CCFN */
-        return ch->active_set.frame;
-
-    case 0x44:	/* DMA4_COLOR */
-        /* XXX only in sDMA */
-        return ch->color;
-
-    default:
-        OMAP_BAD_REG(addr);
-        return 0;
-    }
-}
-
-static void omap_dma4_write(void *opaque, hwaddr addr,
-                            uint64_t value, unsigned size)
-{
-    struct omap_dma_s *s = opaque;
-    int chnum, irqn = 0;
-    struct omap_dma_channel_s *ch;
-
-    if (size == 1) {
-        omap_badwidth_write16(opaque, addr, value);
-        return;
-    }
-
-    switch (addr) {
-    case 0x14:	/* DMA4_IRQSTATUS_L3 */
-        irqn ++;
-        /* fall through */
-    case 0x10:	/* DMA4_IRQSTATUS_L2 */
-        irqn ++;
-        /* fall through */
-    case 0x0c:	/* DMA4_IRQSTATUS_L1 */
-        irqn ++;
-        /* fall through */
-    case 0x08:	/* DMA4_IRQSTATUS_L0 */
-        s->irqstat[irqn] &= ~value;
-        if (!s->irqstat[irqn])
-            qemu_irq_lower(s->irq[irqn]);
-        return;
-
-    case 0x24:	/* DMA4_IRQENABLE_L3 */
-        irqn ++;
-        /* fall through */
-    case 0x20:	/* DMA4_IRQENABLE_L2 */
-        irqn ++;
-        /* fall through */
-    case 0x1c:	/* DMA4_IRQENABLE_L1 */
-        irqn ++;
-        /* fall through */
-    case 0x18:	/* DMA4_IRQENABLE_L0 */
-        s->irqen[irqn] = value;
-        return;
-
-    case 0x2c:	/* DMA4_OCP_SYSCONFIG */
-        if (value & 2)						/* SOFTRESET */
-            omap_dma_reset(s->dma);
-        s->ocp = value & 0x3321;
-        if (((s->ocp >> 12) & 3) == 3) { /* MIDLEMODE */
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid DMA power mode\n",
-                          __func__);
-        }
-        return;
-
-    case 0x78:	/* DMA4_GCR */
-        s->gcr = value & 0x00ff00ff;
-        if ((value & 0xff) == 0x00) { /* MAX_CHANNEL_FIFO_DEPTH */
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: wrong FIFO depth in GCR\n",
-                          __func__);
-        }
-        return;
-
-    case 0x80 ... 0xfff:
-        addr -= 0x80;
-        chnum = addr / 0x60;
-        ch = s->ch + chnum;
-        addr -= chnum * 0x60;
-        break;
-
-    case 0x00:	/* DMA4_REVISION */
-    case 0x28:	/* DMA4_SYSSTATUS */
-    case 0x64:	/* DMA4_CAPS_0 */
-    case 0x6c:	/* DMA4_CAPS_2 */
-    case 0x70:	/* DMA4_CAPS_3 */
-    case 0x74:	/* DMA4_CAPS_4 */
-        OMAP_RO_REG(addr);
-        return;
-
-    default:
-        OMAP_BAD_REG(addr);
-        return;
-    }
-
-    /* Per-channel registers */
-    switch (addr) {
-    case 0x00:	/* DMA4_CCR */
-        ch->buf_disable = (value >> 25) & 1;
-        ch->src_sync = (value >> 24) & 1;	/* XXX For CamDMA must be 1 */
-        if (ch->buf_disable && !ch->src_sync) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "%s: Buffering disable is not allowed in "
-                          "destination synchronised mode\n", __func__);
-        }
-        ch->prefetch = (value >> 23) & 1;
-        ch->bs = (value >> 18) & 1;
-        ch->transparent_copy = (value >> 17) & 1;
-        ch->constant_fill = (value >> 16) & 1;
-        ch->mode[1] = (omap_dma_addressing_t) ((value & 0xc000) >> 14);
-        ch->mode[0] = (omap_dma_addressing_t) ((value & 0x3000) >> 12);
-        ch->suspend = (value & 0x0100) >> 8;
-        ch->priority = (value & 0x0040) >> 6;
-        ch->fs = (value & 0x0020) >> 5;
-        if (ch->fs && ch->bs && ch->mode[0] && ch->mode[1]) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "%s: For a packet transfer at least one port "
-                          "must be constant-addressed\n", __func__);
-        }
-        ch->sync = (value & 0x001f) | ((value >> 14) & 0x0060);
-        /* XXX must be 0x01 for CamDMA */
-
-        if (value & 0x0080)
-            omap_dma_enable_channel(s, ch);
-        else
-            omap_dma_disable_channel(s, ch);
-
-        break;
-
-    case 0x04:	/* DMA4_CLNK_CTRL */
-        ch->link_enabled = (value >> 15) & 0x1;
-        ch->link_next_ch = value & 0x1f;
-        break;
-
-    case 0x08:	/* DMA4_CICR */
-        ch->interrupts = value & 0x09be;
-        break;
-
-    case 0x0c:	/* DMA4_CSR */
-        ch->cstatus &= ~value;
-        break;
-
-    case 0x10:	/* DMA4_CSDP */
-        ch->endian[0] =(value >> 21) & 1;
-        ch->endian_lock[0] =(value >> 20) & 1;
-        ch->endian[1] =(value >> 19) & 1;
-        ch->endian_lock[1] =(value >> 18) & 1;
-        if (ch->endian[0] != ch->endian[1]) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "%s: DMA endianness conversion enable attempt\n",
-                          __func__);
-        }
-        ch->write_mode = (value >> 16) & 3;
-        ch->burst[1] = (value & 0xc000) >> 14;
-        ch->pack[1] = (value & 0x2000) >> 13;
-        ch->translate[1] = (value & 0x1e00) >> 9;
-        ch->burst[0] = (value & 0x0180) >> 7;
-        ch->pack[0] = (value & 0x0040) >> 6;
-        ch->translate[0] = (value & 0x003c) >> 2;
-        if (ch->translate[0] | ch->translate[1]) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "%s: bad MReqAddressTranslate sideband signal\n",
-                          __func__);
-        }
-        ch->data_type = 1 << (value & 3);
-        if ((value & 3) == 3) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "%s: bad data_type for DMA channel\n", __func__);
-            ch->data_type >>= 1;
-        }
-        break;
-
-    case 0x14:	/* DMA4_CEN */
-        ch->set_update = 1;
-        ch->elements = value & 0xffffff;
-        break;
-
-    case 0x18:	/* DMA4_CFN */
-        ch->frames = value & 0xffff;
-        ch->set_update = 1;
-        break;
-
-    case 0x1c:	/* DMA4_CSSA */
-        ch->addr[0] = (hwaddr) (uint32_t) value;
-        ch->set_update = 1;
-        break;
-
-    case 0x20:	/* DMA4_CDSA */
-        ch->addr[1] = (hwaddr) (uint32_t) value;
-        ch->set_update = 1;
-        break;
-
-    case 0x24:	/* DMA4_CSEI */
-        ch->element_index[0] = (int16_t) value;
-        ch->set_update = 1;
-        break;
-
-    case 0x28:	/* DMA4_CSFI */
-        ch->frame_index[0] = (int32_t) value;
-        ch->set_update = 1;
-        break;
-
-    case 0x2c:	/* DMA4_CDEI */
-        ch->element_index[1] = (int16_t) value;
-        ch->set_update = 1;
-        break;
-
-    case 0x30:	/* DMA4_CDFI */
-        ch->frame_index[1] = (int32_t) value;
-        ch->set_update = 1;
-        break;
-
-    case 0x44:	/* DMA4_COLOR */
-        /* XXX only in sDMA */
-        ch->color = value;
-        break;
-
-    case 0x34:	/* DMA4_CSAC */
-    case 0x38:	/* DMA4_CDAC */
-    case 0x3c:	/* DMA4_CCEN */
-    case 0x40:	/* DMA4_CCFN */
-        OMAP_RO_REG(addr);
-        break;
-
-    default:
-        OMAP_BAD_REG(addr);
-    }
-}
-
-static const MemoryRegionOps omap_dma4_ops = {
-    .read = omap_dma4_read,
-    .write = omap_dma4_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-struct soc_dma_s *omap_dma4_init(hwaddr base, qemu_irq *irqs,
-                MemoryRegion *sysmem,
-                struct omap_mpu_state_s *mpu, int fifo,
-                int chans, omap_clk iclk, omap_clk fclk)
-{
-    int i;
-    struct omap_dma_s *s = g_new0(struct omap_dma_s, 1);
-
-    s->model = omap_dma_4;
-    s->chans = chans;
-    s->mpu = mpu;
-    s->clk = fclk;
-
-    s->dma = soc_dma_init(s->chans);
-    s->dma->freq = omap_clk_getrate(fclk);
-    s->dma->transfer_fn = omap_dma_transfer_generic;
-    s->dma->setup_fn = omap_dma_transfer_setup;
-    s->dma->drq = qemu_allocate_irqs(omap_dma_request, s, 64);
-    s->dma->opaque = s;
-    for (i = 0; i < s->chans; i ++) {
-        s->ch[i].dma = &s->dma->ch[i];
-        s->dma->ch[i].opaque = &s->ch[i];
-    }
-
-    memcpy(&s->irq, irqs, sizeof(s->irq));
-    s->intr_update = omap_dma_interrupts_4_update;
-
-    omap_dma_setcaps(s);
-    omap_clk_adduser(s->clk, qemu_allocate_irq(omap_dma_clk_update, s, 0));
-    omap_dma_reset(s->dma);
-    omap_dma_clk_update(s, 0, !!s->dma->freq);
-
-    memory_region_init_io(&s->iomem, NULL, &omap_dma4_ops, s, "omap.dma4", 0x1000);
-    memory_region_add_subregion(sysmem, base, &s->iomem);
-
-    mpu->drq = s->dma->drq;
-
-    return s->dma;
-}
-
 struct omap_dma_lcd_channel_s *omap_dma_get_lcdch(struct soc_dma_s *dma)
 {
     struct omap_dma_s *s = dma->opaque;
-- 
2.34.1


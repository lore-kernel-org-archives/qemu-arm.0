Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1502022njf;
        Tue, 3 Sep 2024 09:13:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3W02Z83oErXo34rXo6uR5ALsSpm/2RCatjM70/9j40zDPrgp/DWp5lliuGsgNjGQoSrAunHaMiM2e5A==@linaro.org
X-Google-Smtp-Source: AGHT+IFEXskRkUy/P6lXTCaNOH7hCLWPu4fB8DPctUTzFCrYxudbTCGzjbzdmCytTT1cGeAv1Fdx
X-Received: by 2002:a05:6214:319d:b0:6c5:1316:8a37 with SMTP id 6a1803df08f44-6c513168b1bmr15487136d6.17.1725380017719;
        Tue, 03 Sep 2024 09:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725380017; cv=none;
        d=google.com; s=arc-20160816;
        b=Z6rvV2OHRptcgJ+1eoZ+B06Il9DwOeFtWMEa3nFOHGrUX77bhHtogBRPCV+K07gpus
         pLM45pfFSopV3LNQc8A9HD5D86aSWxoQozWgcUCYEwCA7tKj7lcRcoTYDqekY8v64d/B
         OKVBDmCIfhXga4MANrLUdOAugED/CGbZd1s0ziks93PD4WugDWNjh4c3Lj7PTHdfk3h8
         Ut6fTU0LKg3AFFeew7CL3EW3OC9NKF2CCUfMSgXT0czDleh+BPo4GiC5ue6ZcS9GNhHi
         uvjxfHd8obQ7ZsIPaHACT0QT9hjx+fQPPPsl8cEn8sgt+YGK/uOHsmjn7H+lJahv4cAv
         xSGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DBc/bJy+JM7lDQDRwxqLPG14xFZM1slW+0SGy2bjs2k=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=dSrHzYBqsyr5VNyOTlBpHsXCbrF7qZa0C6BV8PKEHb2hsiIUPgHFRLk2zCcFrQJ6uW
         UHm5aohKlxmLMjYDLmbDXbc1UcVZ3wRGFhzYfY1nQR0sftLdP8cqpiYHQP/BUV1awt3B
         n0Sy/9BCI8J0LTZVeVSGc1roeLoDWd4Lr199iNplhOo9bUcpHVJ6YM6bpqTKdjlRR9gh
         55tpE1NeLAJfOnzocjyXiYehZjtkZaXIGZSrW86XXs9CqexynsIwyRrh8IinpaqkXR/m
         iqZRGnOh2pbnT9ObCgmAzOsCOggEx013P89mIIk4xgxcDJy9O7pT0r3NuOx5ED97EAJM
         Nd4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kab+6SPq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c340bff474si135932556d6.171.2024.09.03.09.13.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:13:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kab+6SPq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slW5Z-0001OS-EF; Tue, 03 Sep 2024 12:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW5U-0000s6-Qy
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:09:00 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW5P-0002vl-V9
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:09:00 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso62214575e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 09:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379734; x=1725984534; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DBc/bJy+JM7lDQDRwxqLPG14xFZM1slW+0SGy2bjs2k=;
 b=Kab+6SPql0RnCcKZUjgmSa0mDb/ukAGx/SNmovemAAX4uadp3IYPiTNOFtL+ymMtQF
 JHvHWTIZnCxHe7OqoTWLgnOxA3RtZoqk62xv0IUPXqVSoYENLRtadgyr1V+dT/Y8FKkC
 AszI+YDfIe7+iEOli7+uBRAGUay54urn+Fw3+uPEe84J9dris+ifq4D2Iw0z1jeGBB3z
 YqYTTzjknCpd4lSoUTjyZeC60DDzgRcwBNlhMln6C5swVkMN2m7arpyMIa8UlLl0ndsa
 y7AL2dbntX6A8y0SExc9B3wBxDUDQpATmvDiSslxo55+KQMvzHwNPW+/Bu23COvEdzlH
 Wgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379734; x=1725984534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DBc/bJy+JM7lDQDRwxqLPG14xFZM1slW+0SGy2bjs2k=;
 b=TUyn3aALcVvi5s+NojdZr4Y8xUtBo6nE49Wp9Ry7NKk/UJ1Sq06dl30Q0iVAsabnS3
 U+yQLv0kCZzYWq8Ig5XlF9+cWePzTVSFPgs2DxLyrtQ66KDJNrr9oDVFqHl6+jd8Sxxt
 IJvtKRTb5nZE8vvDccTYbMGJRynnsZE2KNgGfhxZ+IVmn35Yx/C8p68Dz5URz9pJ7EVN
 J8VP4tx4lyrr1wEqBrhdn0+jPUq4lw8HAvJ+p025KFjqFhsK31xP8frU+H4zLtkGCTb5
 aMjNIBVHA1ZAXpwVgL4KTagSrqJgaWxqQwfBGV2iebPBrw/zzOgopEguH6Q2A84hu7L+
 pNUg==
X-Gm-Message-State: AOJu0Yx+4WT7DlRm8HjbhwkS1ROrnx76hHi//k0bpS9e9SFVnSomK/Nl
 yvqlzGI8dH3LVJBFFvB+FbIWLhBpJEqmphJzXZb2gL/iafJbn+kUxjX7x7V15FpJvX8Bc37XA6S
 a
X-Received: by 2002:a05:600c:4586:b0:426:61fc:fc1a with SMTP id
 5b1f17b1804b1-42bb01ae2a7mr162606245e9.3.1725379734319; 
 Tue, 03 Sep 2024 09:08:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm175123065e9.18.2024.09.03.09.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 09:08:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-9.2 40/53] hw/intc: Remove omap2-intc device
Date: Tue,  3 Sep 2024 17:07:38 +0100
Message-Id: <20240903160751.4100218-41-peter.maydell@linaro.org>
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
X-TUID: N+mr+f5GniCx

Remove the OMAP2 specific code from omap_intc.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/omap_intc.c | 276 --------------------------------------------
 1 file changed, 276 deletions(-)

diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
index 435c47600fc..c14b22d3819 100644
--- a/hw/intc/omap_intc.c
+++ b/hw/intc/omap_intc.c
@@ -50,8 +50,6 @@ struct OMAPIntcState {
     int level_only;
     uint32_t size;
 
-    uint8_t revision;
-
     /* state */
     uint32_t new_agr[2];
     int sir_intr[2];
@@ -133,26 +131,6 @@ static void omap_set_intr(void *opaque, int irq, int req)
     }
 }
 
-/* Simplified version with no edge detection */
-static void omap_set_intr_noedge(void *opaque, int irq, int req)
-{
-    OMAPIntcState *ih = opaque;
-    uint32_t rise;
-
-    struct omap_intr_handler_bank_s *bank = &ih->bank[irq >> 5];
-    int n = irq & 31;
-
-    if (req) {
-        rise = ~bank->inputs & (1 << n);
-        if (rise) {
-            bank->irqs |= bank->inputs |= rise;
-            omap_inth_update(ih, 0);
-            omap_inth_update(ih, 1);
-        }
-    } else
-        bank->irqs = (bank->inputs &= ~(1 << n)) | bank->swi;
-}
-
 static uint64_t omap_inth_read(void *opaque, hwaddr addr,
                                unsigned size)
 {
@@ -420,259 +398,6 @@ static const TypeInfo omap_intc_info = {
     .class_init    = omap_intc_class_init,
 };
 
-static uint64_t omap2_inth_read(void *opaque, hwaddr addr,
-                                unsigned size)
-{
-    OMAPIntcState *s = opaque;
-    int offset = addr;
-    int bank_no, line_no;
-    struct omap_intr_handler_bank_s *bank = NULL;
-
-    if ((offset & 0xf80) == 0x80) {
-        bank_no = (offset & 0x60) >> 5;
-        if (bank_no < s->nbanks) {
-            offset &= ~0x60;
-            bank = &s->bank[bank_no];
-        } else {
-            OMAP_BAD_REG(addr);
-            return 0;
-        }
-    }
-
-    switch (offset) {
-    case 0x00:	/* INTC_REVISION */
-        return s->revision;
-
-    case 0x10:	/* INTC_SYSCONFIG */
-        return (s->autoidle >> 2) & 1;
-
-    case 0x14:	/* INTC_SYSSTATUS */
-        return 1;						/* RESETDONE */
-
-    case 0x40:	/* INTC_SIR_IRQ */
-        return s->sir_intr[0];
-
-    case 0x44:	/* INTC_SIR_FIQ */
-        return s->sir_intr[1];
-
-    case 0x48:	/* INTC_CONTROL */
-        return (!s->mask) << 2;					/* GLOBALMASK */
-
-    case 0x4c:	/* INTC_PROTECTION */
-        return 0;
-
-    case 0x50:	/* INTC_IDLE */
-        return s->autoidle & 3;
-
-    /* Per-bank registers */
-    case 0x80:	/* INTC_ITR */
-        return bank->inputs;
-
-    case 0x84:	/* INTC_MIR */
-        return bank->mask;
-
-    case 0x88:	/* INTC_MIR_CLEAR */
-    case 0x8c:	/* INTC_MIR_SET */
-        return 0;
-
-    case 0x90:	/* INTC_ISR_SET */
-        return bank->swi;
-
-    case 0x94:	/* INTC_ISR_CLEAR */
-        return 0;
-
-    case 0x98:	/* INTC_PENDING_IRQ */
-        return bank->irqs & ~bank->mask & ~bank->fiq;
-
-    case 0x9c:	/* INTC_PENDING_FIQ */
-        return bank->irqs & ~bank->mask & bank->fiq;
-
-    /* Per-line registers */
-    case 0x100 ... 0x300:	/* INTC_ILR */
-        bank_no = (offset - 0x100) >> 7;
-        if (bank_no > s->nbanks)
-            break;
-        bank = &s->bank[bank_no];
-        line_no = (offset & 0x7f) >> 2;
-        return (bank->priority[line_no] << 2) |
-                ((bank->fiq >> line_no) & 1);
-    }
-    OMAP_BAD_REG(addr);
-    return 0;
-}
-
-static void omap2_inth_write(void *opaque, hwaddr addr,
-                             uint64_t value, unsigned size)
-{
-    OMAPIntcState *s = opaque;
-    int offset = addr;
-    int bank_no, line_no;
-    struct omap_intr_handler_bank_s *bank = NULL;
-
-    if ((offset & 0xf80) == 0x80) {
-        bank_no = (offset & 0x60) >> 5;
-        if (bank_no < s->nbanks) {
-            offset &= ~0x60;
-            bank = &s->bank[bank_no];
-        } else {
-            OMAP_BAD_REG(addr);
-            return;
-        }
-    }
-
-    switch (offset) {
-    case 0x10:	/* INTC_SYSCONFIG */
-        s->autoidle &= 4;
-        s->autoidle |= (value & 1) << 2;
-        if (value & 2) {                                        /* SOFTRESET */
-            omap_inth_reset(DEVICE(s));
-        }
-        return;
-
-    case 0x48:	/* INTC_CONTROL */
-        s->mask = (value & 4) ? 0 : ~0;				/* GLOBALMASK */
-        if (value & 2) {					/* NEWFIQAGR */
-            qemu_set_irq(s->parent_intr[1], 0);
-            s->new_agr[1] = ~0;
-            omap_inth_update(s, 1);
-        }
-        if (value & 1) {					/* NEWIRQAGR */
-            qemu_set_irq(s->parent_intr[0], 0);
-            s->new_agr[0] = ~0;
-            omap_inth_update(s, 0);
-        }
-        return;
-
-    case 0x4c:	/* INTC_PROTECTION */
-        /* TODO: Make a bitmap (or sizeof(char)map) of access privileges
-         * for every register, see Chapter 3 and 4 for privileged mode.  */
-        if (value & 1)
-            fprintf(stderr, "%s: protection mode enable attempt\n",
-                            __func__);
-        return;
-
-    case 0x50:	/* INTC_IDLE */
-        s->autoidle &= ~3;
-        s->autoidle |= value & 3;
-        return;
-
-    /* Per-bank registers */
-    case 0x84:	/* INTC_MIR */
-        bank->mask = value;
-        omap_inth_update(s, 0);
-        omap_inth_update(s, 1);
-        return;
-
-    case 0x88:	/* INTC_MIR_CLEAR */
-        bank->mask &= ~value;
-        omap_inth_update(s, 0);
-        omap_inth_update(s, 1);
-        return;
-
-    case 0x8c:	/* INTC_MIR_SET */
-        bank->mask |= value;
-        return;
-
-    case 0x90:	/* INTC_ISR_SET */
-        bank->irqs |= bank->swi |= value;
-        omap_inth_update(s, 0);
-        omap_inth_update(s, 1);
-        return;
-
-    case 0x94:	/* INTC_ISR_CLEAR */
-        bank->swi &= ~value;
-        bank->irqs = bank->swi & bank->inputs;
-        return;
-
-    /* Per-line registers */
-    case 0x100 ... 0x300:	/* INTC_ILR */
-        bank_no = (offset - 0x100) >> 7;
-        if (bank_no > s->nbanks)
-            break;
-        bank = &s->bank[bank_no];
-        line_no = (offset & 0x7f) >> 2;
-        bank->priority[line_no] = (value >> 2) & 0x3f;
-        bank->fiq &= ~(1 << line_no);
-        bank->fiq |= (value & 1) << line_no;
-        return;
-
-    case 0x00:	/* INTC_REVISION */
-    case 0x14:	/* INTC_SYSSTATUS */
-    case 0x40:	/* INTC_SIR_IRQ */
-    case 0x44:	/* INTC_SIR_FIQ */
-    case 0x80:	/* INTC_ITR */
-    case 0x98:	/* INTC_PENDING_IRQ */
-    case 0x9c:	/* INTC_PENDING_FIQ */
-        OMAP_RO_REG(addr);
-        return;
-    }
-    OMAP_BAD_REG(addr);
-}
-
-static const MemoryRegionOps omap2_inth_mem_ops = {
-    .read = omap2_inth_read,
-    .write = omap2_inth_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-};
-
-static void omap2_intc_init(Object *obj)
-{
-    DeviceState *dev = DEVICE(obj);
-    OMAPIntcState *s = OMAP_INTC(obj);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-
-    s->level_only = 1;
-    s->nbanks = 3;
-    sysbus_init_irq(sbd, &s->parent_intr[0]);
-    sysbus_init_irq(sbd, &s->parent_intr[1]);
-    qdev_init_gpio_in(dev, omap_set_intr_noedge, s->nbanks * 32);
-    memory_region_init_io(&s->mmio, obj, &omap2_inth_mem_ops, s,
-                          "omap2-intc", 0x1000);
-    sysbus_init_mmio(sbd, &s->mmio);
-}
-
-static void omap2_intc_realize(DeviceState *dev, Error **errp)
-{
-    OMAPIntcState *s = OMAP_INTC(dev);
-
-    if (!s->iclk) {
-        error_setg(errp, "omap2-intc: iclk not connected");
-        return;
-    }
-    if (!s->fclk) {
-        error_setg(errp, "omap2-intc: fclk not connected");
-        return;
-    }
-}
-
-static Property omap2_intc_properties[] = {
-    DEFINE_PROP_UINT8("revision", OMAPIntcState,
-    revision, 0x21),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void omap2_intc_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->reset = omap_inth_reset;
-    device_class_set_props(dc, omap2_intc_properties);
-    /* Reason: pointer property "iclk", "fclk" */
-    dc->user_creatable = false;
-    dc->realize = omap2_intc_realize;
-}
-
-static const TypeInfo omap2_intc_info = {
-    .name          = "omap2-intc",
-    .parent        = TYPE_OMAP_INTC,
-    .instance_init = omap2_intc_init,
-    .class_init    = omap2_intc_class_init,
-};
-
 static const TypeInfo omap_intc_type_info = {
     .name          = TYPE_OMAP_INTC,
     .parent        = TYPE_SYS_BUS_DEVICE,
@@ -684,7 +409,6 @@ static void omap_intc_register_types(void)
 {
     type_register_static(&omap_intc_type_info);
     type_register_static(&omap_intc_info);
-    type_register_static(&omap2_intc_info);
 }
 
 type_init(omap_intc_register_types)
-- 
2.34.1


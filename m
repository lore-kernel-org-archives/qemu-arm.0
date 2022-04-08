Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp401542lfq;
        Fri, 8 Apr 2022 07:42:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgBtFkaegIymYPoDGOJ/R2jHj1l7YGaz2c8WIzJmDCzrMpma9LjgvDAPlXJZcCEQ5foefv
X-Received: by 2002:a0d:fa81:0:b0:2d6:faee:cbc4 with SMTP id k123-20020a0dfa81000000b002d6faeecbc4mr15908836ywf.388.1649428939925;
        Fri, 08 Apr 2022 07:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649428939; cv=none;
        d=google.com; s=arc-20160816;
        b=gQqhtUqMLknv6zs6fqDnd3s3jjnWixZmNtuWAj3mZc41U36K4YytTJaCpJJJ8tCeVv
         UERYj2VnBPc6+ySZSOIhGFX7waTA0v8C5R4qKI/PEyv1SGoyy5/WO06SCX0o8nx7nvSX
         wvOcWWUOYa44ZIra3s3XOPg9/l4qA6+8nDeCxkMl2KIzyu9H6CVv+XLA+oy2aaPVyTqW
         LHIPxbN1xbuFooY/ZCigXypc3YyNXYLIS847f/chpaPDB8Z2JKe8YD//qd2hb648NQZB
         TZMMFAQoy+jxdiXrYKFbFKJYX3fNzpCe9MzXIXTA1pIDzVK6m8IbDjkNInNtV8P2Tb5W
         OpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wpIByKslkvTJxYsYScwOMJpdk5pjHsxRK95xfG0789k=;
        b=Ydz0Igfifcp4NDS6QI/ob0fGW66v/k+VfLWXGTs42KXarD8glP4+yH8SUhGjVLsfdj
         Q1oYCqLuGYMIkVuN3YAmwiagGjqZp1mLvub50qd++k45ecjQTmOGMmdSlM8TpORaVzwg
         TCcGXx1F+NaWF52EzGHMT1L8YRmSFPZ461GbTZ+3VgsVmTDHei3P3b7z6zMxcCHNfMbk
         vBMLOf1Ip5HR07fKoMeG9t5tJN8TQmb48vL+6WNrFuHCY6gYeM0uLy4e5gIEU4Y0QFjN
         xCfqwP4iBPzcdvw6kZWKOdSV4lC5WVVjCBOgLwS5eD7bBJKs/y1yZF0BbHFpZJsEmmzB
         EiiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=URmm8zLv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 207-20020a8117d8000000b002eb44d0b2ffsi503161ywx.151.2022.04.08.07.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:42:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=URmm8zLv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpoZ-0001Ch-AW
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPW-0007AQ-UP
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:26 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPU-0002Qr-DS
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id u3so13093592wrg.3
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wpIByKslkvTJxYsYScwOMJpdk5pjHsxRK95xfG0789k=;
 b=URmm8zLvhnhaNtRBq6dMCHm2MZzdbzqw0qTKFcHyJXcz5TRGwmsSk1utsj0KclXTy/
 HAFJpTN8ZKJ+u7+nUVP6HbNFzZ6TNkn9xCnf4tSlktwAvP5JdJndKaV0+/KoRqil9Xp/
 f0j54EvbTcwk/MmUFMyIj7AEiYyv0OoeH1uz0b6r3qwm2iN0EVCmkVCQyrrRMohGHqUb
 ar8JndPEGS8icEs4lpl9KPQsGAZcwpQOyhhJCFu3kq2gXml/IXdK/UiJnbceLHzaxeUq
 V9WNT6FGlunCk7dp/aw6M07vMdFLtkG+apuYDiNeUoYSdayQ5RaYErEXY6CcSEh6GBSk
 I9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wpIByKslkvTJxYsYScwOMJpdk5pjHsxRK95xfG0789k=;
 b=nsDwG5XNcdFZdAYZqfD9H8fq0908RzXDyk5OM3swrstoHFwinEkUhA1xM14+bRzhvN
 dWAeQzH/W/PM+jACqyyGvV7zaYJvD8wfgJydrhstsjliFmjQF82vd9xnNp7R2ZnStTEG
 yJq+AjV/MGlQJiEIZWtiLCzbJS68Dd7eyZb130HXhm+L5GsTQvud8vkYiO8xMFyFK58h
 97A8G/Bu8vPiPBmwt3BYupDHYD1Q5WCVB0+YSP1C8QQDWHSyIaS0744PINgynk+1XfZV
 7LeXZ957BfCNOuOvSTZs1MrYENK7aSXrPr6NJ8z/agzoFfPwSk9VfyyIGYV0pZERwdPw
 0opw==
X-Gm-Message-State: AOAM5313+TcFNtu/JkZS8VQhZTPdNpL+n9e6Cj+qHG0cFr3W530NURsy
 XKOkRmxIbMKuNySWd2B4FRrFTOmxNxEHCA==
X-Received: by 2002:a05:6000:12c6:b0:206:100e:16f2 with SMTP id
 l6-20020a05600012c600b00206100e16f2mr14733206wrx.644.1649427381955; 
 Fri, 08 Apr 2022 07:16:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 31/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_process_vlpi()
Date: Fri,  8 Apr 2022 15:15:40 +0100
Message-Id: <20220408141550.1271295-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ILAHYAW+whru

Implement the function gicv3_redist_process_vlpi(), which was left as
just a stub earlier.  This function deals with being handed a VLPI by
the ITS.  It must set the bit in the pending table.  If the vCPU is
currently resident we must recalculate the highest priority pending
vLPI; otherwise we may need to ring a "doorbell" interrupt to let the
hypervisor know it might want to reschedule the vCPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 48 ++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 64e5d96ac36..be36978b45c 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -60,6 +60,19 @@ static uint32_t gicr_read_bitmap_reg(GICv3CPUState *cs, MemTxAttrs attrs,
     return reg;
 }
 
+static bool vcpu_resident(GICv3CPUState *cs, uint64_t vptaddr)
+{
+    /*
+     * Return true if a vCPU is resident, which is defined by
+     * whether the GICR_VPENDBASER register is marked VALID and
+     * has the right virtual pending table address.
+     */
+    if (!FIELD_EX64(cs->gicr_vpendbaser, GICR_VPENDBASER, VALID)) {
+        return false;
+    }
+    return vptaddr == (cs->gicr_vpendbaser & R_GICR_VPENDBASER_PHYADDR_MASK);
+}
+
 /**
  * update_for_one_lpi: Update pending information if this LPI is better
  *
@@ -1004,10 +1017,37 @@ void gicv3_redist_vlpi_pending(GICv3CPUState *cs, int irq, int level)
 void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
                                int doorbell, int level)
 {
-    /*
-     * The redistributor handling for being handed a VLPI by the ITS
-     * will be added in a subsequent commit.
-     */
+    bool bit_changed;
+    bool resident = vcpu_resident(cs, vptaddr);
+    uint64_t ctbase;
+
+    if (resident) {
+        uint32_t idbits = FIELD_EX64(cs->gicr_vpropbaser, GICR_VPROPBASER, IDBITS);
+        if (irq >= (1ULL << (idbits + 1))) {
+            return;
+        }
+    }
+
+    bit_changed = set_pending_table_bit(cs, vptaddr, irq, level);
+    if (resident && bit_changed) {
+        if (level) {
+            /* Check whether this vLPI is now the best */
+            ctbase = cs->gicr_vpropbaser & R_GICR_VPROPBASER_PHYADDR_MASK;
+            update_for_one_lpi(cs, irq, ctbase, true, &cs->hppvlpi);
+            gicv3_cpuif_virt_irq_fiq_update(cs);
+        } else {
+            /* Only need to recalculate if this was previously the best vLPI */
+            if (irq == cs->hppvlpi.irq) {
+                gicv3_redist_update_vlpi(cs);
+            }
+        }
+    }
+
+    if (!resident && level && doorbell != INTID_SPURIOUS &&
+        (cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS)) {
+        /* vCPU is not currently resident: ring the doorbell */
+        gicv3_redist_process_lpi(cs, doorbell, 1);
+    }
 }
 
 void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
-- 
2.25.1


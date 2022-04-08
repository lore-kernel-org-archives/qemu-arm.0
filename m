Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp401548lfq;
        Fri, 8 Apr 2022 07:42:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrkskkZ+eB+IAtvHYlIQ+be2PuyqKTgWNBA6orvBdc78w3emJfYwZ2PZE27il5M+uKlKGq
X-Received: by 2002:a81:19c9:0:b0:2eb:defe:d93f with SMTP id 192-20020a8119c9000000b002ebdefed93fmr3701946ywz.113.1649428940639;
        Fri, 08 Apr 2022 07:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649428940; cv=none;
        d=google.com; s=arc-20160816;
        b=jyyQiRsgWvJKkpOLS5UHyWrNnqTsWDepjna64L/+ZDJ0udrTNqGz2dx37yWZUFty9Q
         P7MYo+fwl6JoPCIjSXTQDCAhVG9Q6fmcx7TVXtUY2wic/UuHy1rf+mRHYJ+HTLS/GVfx
         73Gwjc0TI1rv0WlDqTd03rU9fdid8/TXBZBKF1nZK6X4L0w7u53GRqPj3g5c7HB0a8O3
         +7RdPvw9/xzdJnZiOKJyTQ85aV2ekbKDhIiU+Gv0rbtNtIztUVOltN1P46KkJ+DVcDPh
         zHZ8hQ4/vU42GU6dFjsCRYYMQIf2NXVccf77mjw/1/hKBCePBdYg3+ULevDzF1m5on4d
         u5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=v/FccBwulgnorLUec58TR8669DB+itEmBYjarGh6iH8=;
        b=n6vur3w7RnoZMV+AIh3/VGyoyrGMJG6pGp8Jg30WvJuJhpvZI0BkLUxHqTfD4djgQq
         o/Jok7QOvhL66Dn1DhbQ4yblXFg16rBXDwDg4MWMbzDYfbhSsm2k7LfnZWFOpECOxEfq
         zFKEgl5LS4AqjDbPXyZkolpOfcvbVQB9aCfZB9YQMoHXIrNFedQhvNA7sv/0GJnVg50B
         bSVSrDF9sTOwpN90YqDvXrbQywpfL7oo2CQ9Qm+riI7SD5MF2KYvq/MIlp3LaDWr6R7E
         fQ8VL9xM9zHBXBohnjAJcqGmxfBwN/mOo7kHe5m9MPgjv7uhu6XA8J4TXSbJRbR506WF
         wB8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TqXwTRoP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u83-20020a817956000000b002eb3105075csi558958ywc.206.2022.04.08.07.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:42:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TqXwTRoP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpoa-0001Gz-1n
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPW-0007A9-PY
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:26 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPU-0002RB-Fk
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:26 -0400
Received: by mail-wr1-x435.google.com with SMTP id d3so13060100wrb.7
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/FccBwulgnorLUec58TR8669DB+itEmBYjarGh6iH8=;
 b=TqXwTRoPFKLw3dKaLev7l5kgVKISqmN/ga+0Oo/gLzQ0ssEXvdAlK8QgXn8kjjd9oX
 HM0RzlZIYT1XfEQZ4WXdm22B8VXGjfFxMBhbepcdpaFgLA5TJ5j5jFe2z7kAEbBoHhna
 TaXXPmY5BSj/kCbXhJIPjbK/dI5cg8gJA2rTplXiG/lmb4ALcOTfOGhBrNW7nGhvBXg4
 KypwN0Ru3Ps3YmIrLUyR0oqb4s6vX8xClAwmW4V1PHtwo7lAo+F1PSa1U0LXPG46IEul
 cRtd5FQow0iBuD86i/hBlNqxhmwvBWlysT0BHEixJQNBUCBJyVniHeN6mycuB7491HJ9
 tinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v/FccBwulgnorLUec58TR8669DB+itEmBYjarGh6iH8=;
 b=MHy0hmeGfm1rxHozZf+F8oOHO6RLqfHQNpyJW2vcLg9MpQTHbRX9I8wdLlYp6OuOzr
 EvlrIeMhc8TEp+9/52Euw2BeKhEyST5N96Bn0R7Ndt/NsONLPMoCMbD6zSqqTyTt0Ek7
 zgGNkOstF7eeUVcio1lmam4O1ycxBYIaZcKeHHW9tL6JkmiQ1EszwNGaKZlH0jjHctZB
 lh6S49GsSUkQ9as2Bzf2Fj4pVs5uivSY6BjAfytFTNStuds/05kXnEwPSAjlr+xYOgM6
 gIak8a8OtfWq7xw5l9gw5X1bSzA/wrqDridRhZKzzq08w5R6K9dDUVAwEwnxRf8WguSF
 7q1Q==
X-Gm-Message-State: AOAM533R1nZ0f7P6N9XIlA1DSEMm96KaGoQXfCxnQHHeyqzP5qsL60ON
 oA21CVadYhtv4OzQhTEOp5ixs3vDR7rQQQ==
X-Received: by 2002:a05:6000:1866:b0:204:cce:c89e with SMTP id
 d6-20020a056000186600b002040ccec89emr16012577wri.601.1649427382757; 
 Fri, 08 Apr 2022 07:16:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 32/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_vlpi_pending()
Date: Fri,  8 Apr 2022 15:15:41 +0100
Message-Id: <20220408141550.1271295-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: dagMfM/W6bcZ

Implement the function gicv3_redist_vlpi_pending(), which was
previously left as a stub.  This is the function that is called by
the CPU interface when it changes the state of a vLPI.  It's similar
to gicv3_redist_process_vlpi(), but we know that the vCPU is
definitely resident on the redistributor and the irq is in range, so
it is a bit simpler.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index be36978b45c..eadf5e8265e 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -1009,9 +1009,28 @@ void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest)
 void gicv3_redist_vlpi_pending(GICv3CPUState *cs, int irq, int level)
 {
     /*
-     * The redistributor handling for changing the pending state
-     * of a vLPI will be added in a subsequent commit.
+     * Change the pending state of the specified vLPI.
+     * Unlike gicv3_redist_process_vlpi(), we know here that the
+     * vCPU is definitely resident on this redistributor, and that
+     * the irq is in range.
      */
+    uint64_t vptbase, ctbase;
+
+    vptbase = FIELD_EX64(cs->gicr_vpendbaser, GICR_VPENDBASER, PHYADDR) << 16;
+
+    if (set_pending_table_bit(cs, vptbase, irq, level)) {
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
 }
 
 void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
-- 
2.25.1


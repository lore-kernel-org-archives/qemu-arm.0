Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C7BCA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:49:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY8d-0007tN-En; Tue, 13 Oct 2026 04:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4O-0000zW-Ha
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4M-0008EK-HK
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:12 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a021c809e3so26442605e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880869; x=1792485669; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=ajLhckcu3c2igWxUB3Vhg4b0TdY9O1nDNXhQTb9MzSE=;
 b=QQg/Iko93jcSaAKZhc72naJI+YAA3/Bc5/aG3fvSuFPHZPVPLaF0WzFAkPZq6d/sZK
 ibdBBB/lam2QaFLO+u0eRt2BHWeIrkeFnYtFW77YRU/I5rjd0hVCAKkUW8q/LcSSjKpG
 O79Kmm0U9QGt5W9suTc2qzzLjn08LCMermbR269mEABoM5VSt0jrSserMYj+KWHoSz/0
 F587BQ69LWWgvD08AHDJTx5aMB/2kVLMf/jFJLixgnxd7T7L9z313JNyAVsGDi44feSi
 fVUNl3uGqAR1n21j+7d4QoKaV8YHjszGXsoKOY2qeAeeKaNcDFFluKcjbBbptmiLRZ2M
 6ZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880869; x=1792485669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=ajLhckcu3c2igWxUB3Vhg4b0TdY9O1nDNXhQTb9MzSE=;
 b=tbMYz6+U3dArtFpJrXak1TUoTOk+wrtA2iOpe9TH2ESUzIfLZiPG/1RHQhI9UcaLba
 fRY8iBkr6J+Oks0ZNcc+gocjyq08XkuHq9Vw7f94neENmtpr2P0NsRGkeWmUYO+xw90T
 9tVHhRzMLFmoJJJmld1KGwUTlTbURSAjOK3ynAOE9+U/E1UMWDp/8dTNkAV46WTWZDPy
 mI57OKguzbqig2H+W4AJg4PXkOVMy2q4uQA4Q5+sUMAHXu5o5K9gZyxg/XZbnqUaWfP4
 2sT77BM4Vm6L6lASYCbv0R1d2PPnE+rH6MejFM5jlwJ/5Atx9A3wADXi1ORgN+LCw8S6
 m2Tw==
X-Gm-Message-State: AFq9FYKzloMlscHsWF9M7ka3LdmE3G/hXzS00ukIyHAndK9ujfS1aCb8
 btx8465leOparshEtERNDN0piPf+ltDzUI+Z6W86YVuQQBDeV8DWLMdL4kTiXAr3LL9rW0LBDrT
 PQ2lAh68=
X-Gm-Gg: AYBFou0+ARCIP0oJqgW/z/xE3HDn6YkTeoXfNZYT82sK9wo4iMl/imi+qXUya6r9REC
 Q2N9Q/VJT4hJkQUqJ+sXgImjPow8JI2QR6gb85FkWRif3Q0fVQUJMyeiGyTMwZUWtcQ774qoErd
 gRCvu9+L3xLPM7fRrfXQ4muavW+vLr7gQNys0UAOT38fGKi7ao4W59sK1TDHIjKdMRJ+YjL7xlu
 IeWzVeyD/68o9TAsvqmtaAUG4OXzSVtO0YN9sHMIBffTcCMmJvRSivPr/5PlRInSHICex/X/LkQ
 V57mql+xv8sCTKy8u/qJr3SE3E6sSqdYZbZV2Gf5fU81urz7lQtqayB0uld8CKfONYfKFaPqE5W
 /KLYRJWvhQql/DI5dukLLFtdPqWBPVPzU8JTpma37AB26LxTplfQ73JemBkgKt5gYbGZCHwLRXb
 CTOFyWwPIBDKQUopblTx/7OTCvxsFl281fZZoTNGqeVimEa69PsGIR7bw1YJ/6C7OFFRJ/3tdWY
 kjKXlxYdALifLZgU79bDt+9WErzwAgri9kArqBw3ch6O7Jgi0yb2GbKBGz+gz0btLHfDU3dJa2o
 aew=
X-Received: by 2002:a05:600c:138a:b0:4a1:7bd4:d07d with SMTP id
 5b1f17b1804b1-4a18e4c85fdmr249993545e9.34.1791880868893; 
 Tue, 13 Oct 2026 01:41:08 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:41:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 72/86] hw/intc/arm_gicv5: Handle virtual=true for setting
 pending
Date: Tue, 13 Oct 2026 09:39:19 +0100
Message-ID: <20261013083933.1024405-73-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add virtual=true support to gicv5_set_pending(). This is similar
to the handling for set_priority and friends, except that the
Pending state is the one change a cpuif can make to an interrupt
that doesn't require a VPE for the VM to be resident on it.
Instead gicv5_set_pending() is passed the VM ID to operate on.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 1bb649cf4f1..c07122fe6e4 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -643,6 +643,7 @@ static const GICv5ISTConfig *ist_for_vint(GICv5 *s,
 DEF_SET_FIELD_FOR_IST(priority, uint8_t, PRIORITY)
 DEF_SET_FIELD_FOR_IST(enabled, bool, ENABLE)
 DEF_SET_FIELD_FOR_IST(handling, bool, HM)
+DEF_SET_FIELD_FOR_IST(pending, bool, PENDING)
 
 void gicv5_set_priority(GICv5Common *cs, uint32_t id, uint8_t priority,
                         GICv5Domain domain, GICv5IntType type, bool virtual,
@@ -761,8 +762,30 @@ void gicv5_set_pending(GICv5Common *cs, uint32_t id, bool pending,
     trace_gicv5_set_pending(domain_name[domain], inttype_name(type), virtual,
                             vm, id, pending);
     if (virtual) {
-        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_pending: tried to set "
-                      "pending state of a virtual interrupt\n");
+        /*
+         * SetPending is the one operation on an interrupt that a cpuif
+         * can do without having a VPE for the VM resident. Instead it
+         * passes us the VM ID to operate on, and we must look up the
+         * IST to use that way rather than with ist_for_vint().
+         */
+        GICv5VMTConfig *vmcfg = &s->vmt_config[domain];
+        const GICv5ISTConfig *cfg;
+        VMTE *vmte;
+
+        if (!gicv5_domain_has_virt(cs, domain) || !vmcfg->valid) {
+            return;
+        }
+
+        vmte = g_hash_table_lookup(vmcfg->vm_cache, GINT_TO_POINTER(vm));
+        if (!vmte) {
+            return;
+        }
+
+        cfg = type == GICV5_LPI ? &vmte->lpi_ist : &vmte->spi_ist;
+        if (!set_pending_for_ist(cs, cfg, id, pending, &iaffid)) {
+            return;
+        }
+        irs_recalc_vhppi(s, vmte, iaffid);
         return;
     }
 
@@ -770,15 +793,10 @@ void gicv5_set_pending(GICv5Common *cs, uint32_t id, bool pending,
     case GICV5_LPI:
     {
         const GICv5ISTConfig *cfg = &s->phys_lpi_config[domain];
-        L2_ISTE_Handle h;
-        uint32_t *l2_iste_p = get_l2_iste(cs, cfg, id, &h);
 
-        if (!l2_iste_p) {
+        if (!set_pending_for_ist(cs, cfg, id, pending, &iaffid)) {
             return;
         }
-        *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, PENDING, pending);
-        iaffid = FIELD_EX32(*l2_iste_p, L2_ISTE, IAFFID);
-        put_l2_iste(cs, cfg, &h);
         break;
     }
     case GICV5_SPI:
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F57CA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:47:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY9g-0002g0-Qg; Tue, 13 Oct 2026 04:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4V-0001Tj-9h
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:20 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4T-0008Gd-8y
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a1880e1bf1so24734835e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880876; x=1792485676; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=paR4cyu9/UC5Kuni++Tg3b64V5PivixNJ34pK01k3sw=;
 b=Bm54QZGo6r0vNmS73OZXjMQF1PPmn6RIkfPjgm3Lwkg49SuWDdoksCKwNuK0MWIvZn
 r7RfFLxeG9j8fxO0lMZW4sHson2yk2xajwrNnX+a8LcDoUdIVuS6pNsz1haUJqLOVnd3
 kPzmAtzWsGJM0PR0twrN19Ddp4hyaWF4nnVCl+DkwgkBr96J9QnZRKwEKbL4k8yWXwEO
 7KWCueh9DOKol0JDNPyAAucFLzrs4wuJkrlMLf+h+FQX9EthL62EYBm5XStgJshjdvX4
 FUziDM5JdWi6YUEgohasjndnTM8jJNpVIkuH6EjuQRFy/1mLRK9x6R/uSDWAe1kVSPt4
 mk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880876; x=1792485676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=paR4cyu9/UC5Kuni++Tg3b64V5PivixNJ34pK01k3sw=;
 b=UcSTOdo35KmxdjuKGNSBBvl/2Q1Swk9gXWF6qAmPN7dJbmDH/YyJsc+lcAngEfKMZH
 /6fJVSmVm5E09iro23PTMrc1TtEaWO95XtQC5PYI1+UZS8zwvTrf03Bw4DV6tvFGazqN
 6x+TQrC/R4mvFm/ZiGwf681W9YvjoNd0zBmRPVqNT4pSvNx6tZJbWVTNnLB1qAao8QRe
 hdXsFk7rfUqMR7wvPF/IxRjCIRkNhbvBsDYmTGuge18WhBp9G5zr2QKky/VDqlXoG2cD
 QTkGrruAEZ9hURNvQoBXLTywnnENFuwBOMHVS1b3BfqJZwKSQrL1YLQ17rVVMM1vnAb8
 pFLw==
X-Gm-Message-State: AFq9FYIsfJqvdYAeWL1E4IpUB+sELkfZmeIkvcNQ73MvzlugLIHeOrhv
 Vf1HoP1SPaMehPtRP16UPCzVL2l0XXnPoUEKq9wSyVQBKYEYZsaDedwrL8Ad79QFgu7JE0dHw1t
 zeqaHdgQ=
X-Gm-Gg: AYBFou3QctfsbQlUEsFTAAam511f6L9zjF5fFLfteqlcv9+dlT24DkbPIM4beDQ7xlW
 P8mw2YQWKAGIY5HN49TkYrSyRlgweer351lLWyvY1ziDzM0W68ZVbjwadMJyssDC+w6/w9UCucn
 E4n6bst+QwWDpYwQTOHh0WISfPAj8ibilUKoCR0B+K/AB8pjiq71ZIqn4TYyLR+SclMKnvkmoMa
 AsKINSFfNgLXzwPq4mlMdccdt1Qv/QswjtvDV9Iao8lUs3Tmq/gHZO6WcDKr1YjdlLAEMa+/cTc
 7kO2cc5T2T7oY3arhs8FX0FUZIotiyb/INC9E7zhWLKUaZ7Oq82YUA6ndx7r0F28tMK08cawQcG
 BJrXJrvqDPV0lnkcheTbGgHsYhvCj2z3FH0BjHsEsp4f5JBhVVL+CtKErLJ9qTUGdGITgBLeBSc
 HCyDXaNYZK8nTM3yzcvfRMcfTC771pGLAl7WTkqgls7esPcXMa+eU/jB9IUMB6OKk4iKeezsnlX
 N10Xgoj9bIPp0FnzsviKSf1bUu/Sm336i3a6tv3UyY/hLhGmasUOsecoklcdq3Mosnv0iOmwrTk
 5lU=
X-Received: by 2002:a05:600c:6099:b0:4a0:1feb:de6a with SMTP id
 5b1f17b1804b1-4a18e4e7a85mr223917615e9.30.1791880875728; 
 Tue, 13 Oct 2026 01:41:15 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:41:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 78/86] hw/intc/arm_gicv5: Recalculate vHPPIs on VIST and VPE
 mapping
Date: Tue, 13 Oct 2026 09:39:25 +0100
Message-ID: <20261013083933.1024405-79-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

If the guest maps or unmaps the vLPI or vSPI for a VM via
IRS_VMAP_VISTR, this affects the vHPPI for every VPE in that VM, so
we need to recalculate it.  Similarly, if the guest maps a VPE for a
VM via IRS_VMAP_VPER_WRITE, we need to calculate the initial vHPPI
for that VPE.

Add the calls to recalculate the vHPPI for these register writes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index b4dbe7ce3e7..199547abaed 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -613,6 +613,19 @@ static void irs_recalc_vhppi(GICv5 *s, VMTE *vmte, uint32_t iaffid)
     /* TODO: we may need to generate a doorbell interrupt. */
 }
 
+static void irs_recalc_all_vhppi_for_vm(GICv5 *s, VMTE *vmte)
+{
+    /* Recalculate the vHPPI for all VPEs in this VM */
+
+    for (uint32_t i = 0; i < (1 << vmte->vpe_id_bits); i++) {
+        VPE *vpe = &vmte->vpet[i];
+
+        if (vpe->valid) {
+            irs_recalc_vhppi(s, vmte, i);
+        }
+    }
+}
+
 static const GICv5ISTConfig *ist_for_vint(GICv5 *s,
                                           GICv5Common *cs,
                                           GICv5Domain domain,
@@ -2131,6 +2144,8 @@ static void irs_vmap_vistr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
     }
     return;
 
+    irs_recalc_all_vhppi_for_vm(s, vmte);
+
 txfail:
     /* Reportable with EC=0x0 if sw error reporting implemented */
     qemu_log_mask(LOG_GUEST_ERROR, "L2 VMTE update failed for VMID 0x%x at "
@@ -2228,6 +2243,8 @@ static void irs_vmap_vper_write(GICv5 *s, GICv5Domain domain, uint64_t value)
     init_vpe_from_vpete(&vmte->vpet[vpeid], vmte, vpete);
     trace_gicv5_irs_vmap_vper_write(domain_name[domain], vmte->vmid, vpeid);
 
+    irs_recalc_vhppi(s, vmte, vpeid);
+
     return;
 
 txfail:
-- 
2.43.0



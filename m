Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876E0CA5FD8
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 18:04:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viG5O-0007FE-AC; Tue, 20 Jan 2026 13:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viG4w-0006bE-QI
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 13:03:52 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viG4v-0000TG-Av
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 13:03:46 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42fbc305552so4117451f8f.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 10:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768932223; x=1769537023; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BF7xLPclhWg7q/XkOOlfgy3QCXWSt8lM7mLCvyOa55I=;
 b=JhfceZXn8d1kXLEK5gEuYfQIQH2lMYjmUMVr9p8AA2y0weOcesx/yAk5jSs3T8axqu
 moIy7yKUhsAJCJu6B+/Tq68XLUTT7KxgVL9Q335UQryeu4JQH6iHElyyslrjw8ArwSrD
 S9i4RdlaoCZtK6UmKgwrLCEO8NshsS56WGM4wBVrKxm9hUjwwiUQQIHj7RNUoaRB6H2O
 6HA+nGGfrDrgO9HylPzOHEZSVdFOa8YfQo6rSqWBX98FIjhT1jGm16Pj0D5+M55rUipa
 sTNZ95sR+tSvR83b3i0771HwMp9SCmqKibvCL1fjlNu/+MTSo9F0ESQzXjnYdCV+9aQL
 u1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768932223; x=1769537023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BF7xLPclhWg7q/XkOOlfgy3QCXWSt8lM7mLCvyOa55I=;
 b=MV309yrKqj2cI+tXe1b751RsdhE7rGAahXTuAazsH5mHfMV4U2ZJVjnfPUlF6Der5r
 aYOb5oqrRz29pbV57SnifszPrz1+N5C8kgOpUlWTMEFYv8OoWNnb+SCxsyEoHyJkrnjt
 UCqjD73DpGvXPXpnkbjwSRuxt2DKNHiBEW8isD02Or9LRvzdIVzNpkrtxcVxGrEdGWXa
 zqdDyUL3hZJodD+21EjMhI5IGUBFRR6k+0p21jw79j1xAED/xTFrsz1au7NGcwYv+0oo
 gH4uf4QFNxNs1ZwCWu4L7ohVfmwNBzbxXAIsq+GwX3OQNzSyGkRk1M9egJEOlBS4NBz+
 J0vg==
X-Gm-Message-State: AOJu0YzVIK+XZJQbzCrf3snchy7SwlPT3JTKo1IHPtb9dpTStp2EhSuI
 lXrAypqC7TVqGmPJGruPmsDPvk+iZwR5zasoNYiyGF9h08sWzsqvMPihKpSFW/7L3dXskWt4LxO
 ySSzg4mE=
X-Gm-Gg: AZuq6aITmj2DN5nWDpMLkm90qKcjZ7SMNER8B53H0A/aofBqN2+Erwapv9PIPOpV0y/
 ppyFvzcGuoV+gMl4WkqZ0i4ekBuHxwfHxhvJihqwoPqOe+J7hHoh1IhQ3Xy8FR+4rqtjs1DOfLt
 wItpHHA2KkVEKUcrf1ug4Lk91Zrp0KXf5azM4HaFu3gF+L1KJjJQHjCKOKGWxTnly53dI0qY9E0
 ODrcrXhJa57VlQcxZi3hr1j3JWgKRakaiuFEvMOp7hHI1kHY1SCWoVjRFY4Z8nxnE65mI9UaX/R
 Zan8YN6mNWbx49R8zZhxgE5OHP2LMNK2OurwD4+R5kMzu+kEEJTG2ViM9/4yq9P1sqftkjSAuJo
 ij/Weyu2/WyfLeqmb0Gz6jApa4pCBxRBD+f2Fq1fUCCvVe+zaEhsAL60OeU8XJQ9+sne2hVb7p+
 tMeKd2Evfh0Ah70bGI6A+62hVCCXs+Yj1tpAgw8mx6eQxxOwcmm1kG
X-Received: by 2002:adf:e884:0:b0:435:729a:eb6f with SMTP id
 ffacd0b85a97d-435729aeb94mr13832875f8f.19.1768932223189; 
 Tue, 20 Jan 2026 10:03:43 -0800 (PST)
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk.
 [81.2.115.146]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996cf58sm31310889f8f.22.2026.01.20.10.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 10:03:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [RFC PATCH 2/4] hw/arm/virt: Don't use vms->tcg_its in create_gic()
Date: Tue, 20 Jan 2026 18:03:37 +0000
Message-ID: <20260120180339.1416328-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120180339.1416328-1-peter.maydell@linaro.org>
References: <20260120180339.1416328-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

The create_gic() function needs to know whether the GIC
has a TCG ITS attached, as it should set the "sysmem" and
"has-lpi" properties of the GICv3 only in that case.
Currently it does this with
 (!kvm_irqchip_in_kernel() && vms->tcg_its)
which implicitly relies on knowing that the only case
where we aren't using a KVM GIC and we don't have an ITS
is where we suppressed the TCG ITS because of the
board-version-compatibility no_tcg_its setting.

We can avoid direct use of vms->tcg_its now that we
can identify what MSI controller we are using from the
vms->msi_controller field.

This means that the only use of vms->tcg_its is in
the logic in finalize_msi_controller().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b55297455f..a231aef268 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -851,7 +851,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                             redist_region_count);
 
         if (!kvm_irqchip_in_kernel()) {
-            if (vms->tcg_its) {
+            if (vms->msi_controller == VIRT_MSI_CTRL_ITS) {
                 object_property_set_link(OBJECT(vms->gic), "sysmem",
                                          OBJECT(mem), &error_fatal);
                 qdev_prop_set_bit(vms->gic, "has-lpi", true);
-- 
2.47.3



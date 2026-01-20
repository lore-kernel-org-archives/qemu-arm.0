Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA39ACA5FD7
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 18:04:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viG5D-0006zP-NI; Tue, 20 Jan 2026 13:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viG4y-0006bO-SJ
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 13:03:52 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viG4v-0000Tc-MP
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 13:03:47 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso3301258f8f.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 10:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768932224; x=1769537024; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRzT62H79hhfu62kmgyNxqbBArhK3Nz4ofwZjq+4f9M=;
 b=yaOWa+S8VlTzAJkrLD5RrzSVHGJF1tAUf4QKXkivO5JRvsP1NOZp+2zUhAxcFz6aDe
 FDnXObURFZp4f/04mL3V0V8OgTKOxDg3/ejh9W9JCZkoSowcfvOA4q0iruApNz619pvI
 6OPxS2bD4lE8P0PAISiK1PmwR060/ZCeX88xhphMyWEkIg7YKoCDrdieXU6QqwSueViP
 nxFarWrWqAgGcUlASV0vmpsjAxty3yRlOcCAZOgkU7iAZPqfhBrGYAMnwg3dFjXT0auL
 AdGMbAu06bpAM20KAOU0thbE2m5KQMjyFRu0+QDRYH3pmp7Fg2khjtFBriZsSjRPljee
 cSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768932224; x=1769537024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NRzT62H79hhfu62kmgyNxqbBArhK3Nz4ofwZjq+4f9M=;
 b=mOrZ/yBB4j90vHCz+ZJVyOlX98eN9NwXUODQQnYJfb+2f7Q4/Vnq4/omqfxbYWxEkh
 jf+vuzGnAHgM9mgdVtkEVC9AS56+hezRvfEYhC6zRjB0xtBuKjV0CWiyKYqYgxbtcZxT
 NifjCprnT/BIX+kNJMGRBVjRJf7daLdqbj+1jTo+bUul1mXF2O4T924m26GxgN2hJNh8
 fOf6TH6/yT/i7e+L8kAFppZEYjAbpMWa84s5GvTQaneyt6OSMOpASqT3Oc67Yl8b3BAb
 uuH5uSCV9/F8A/lhRMpznrKOH14ltwWx7/TcQOyg43Ljs2LIg95Wf3Yh8m3OnugwzZvr
 WrBg==
X-Gm-Message-State: AOJu0Yyx6p8ThsN7KDwwy42giFsHoeGnWY/rsxNI7cS4QIKWkr9FxB8a
 fmbFrWx9QFE1QcRvYCUnl0+ZnHS1B0vpZks7k5e8FReAeWgQ7+8JzDyzBxdzPhAbwMUOZfEVrXV
 Rnmp3Cq8=
X-Gm-Gg: AZuq6aLcmwyWoV/QLzrfeuAco1BZIZPKsMqJh9kAYjpgKIdaVoEiddLvSgyNYX6C45N
 +Y2qbrNXJJ2nvDyFXt/jkezG9POw5elrYdsGu431yj2bcuKycs9JBbt41JQZ8d7/fM7ekEimWPQ
 T5QfSBWk3EpAT3qamfF82pDR8ERifUeJE1VHG3d/Q+1njsZqhSQ+yo16JPl31TG4yQ44sLwh3vK
 PxNV5a6mP/nj8qUfbT/hTmpdJpdl29JJpJfYzR1s5vxzprRtmz/6GG+bLvxB5aMZXBOUDvx01xK
 5Pu1GT4qbl22cT4DYS+1nKn9xSLooxmgULkJn3zE4Y/U40q4u0U6ZrCW4YIxNrNgGlrjvN9M0ld
 CRvzPAYeFsJZpL+ytQZaz2qJfQ/4qGJwASqoZhMPzZ1p7ToasAuLGZK46T7NPtUspdRRPqLAr6D
 e1n/KN0YniD/Kjb2/eCLRjy0N11e3vu+RmBzHWLHaENk/fUjeyNeB/
X-Received: by 2002:a05:6000:186f:b0:432:c37c:d83b with SMTP id
 ffacd0b85a97d-43569994296mr21748670f8f.20.1768932224074; 
 Tue, 20 Jan 2026 10:03:44 -0800 (PST)
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk.
 [81.2.115.146]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996cf58sm31310889f8f.22.2026.01.20.10.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 10:03:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [RFC PATCH 3/4] hw/arm/virt: Drop VirtMachineState::tcg_its
Date: Tue, 20 Jan 2026 18:03:38 +0000
Message-ID: <20260120180339.1416328-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120180339.1416328-1-peter.maydell@linaro.org>
References: <20260120180339.1416328-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

We now use VirtMachineState::tcg_its only in the
finalize_msi_controller() function, and it is always the inverse of
the VirtMachineClass::no_tcg_its class field.  We can simplify to use
no_tcg_its and drop the VirtMachineState field entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c         | 6 +++---
 include/hw/arm/virt.h | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a231aef268..b65f571532 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2082,8 +2082,10 @@ static void finalize_msi_controller(VirtMachineState *vms)
      * the relevant user settings and compat data. Called
      * after finalizing the GIC version.
      */
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+
     if (vms->gic_version != VIRT_GIC_VERSION_2 && vms->its) {
-        if (!kvm_irqchip_in_kernel() && !vms->tcg_its) {
+        if (!kvm_irqchip_in_kernel() && vmc->no_tcg_its) {
             vms->msi_controller = VIRT_MSI_CTRL_NONE;
         } else {
             vms->msi_controller = VIRT_MSI_CTRL_ITS;
@@ -3511,8 +3513,6 @@ static void virt_instance_init(Object *obj)
 
     /* Default allows ITS instantiation */
     vms->its = true;
-    /* Allow ITS emulation if the machine version supports it */
-    vms->tcg_its = !vmc->no_tcg_its;
 
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 5907d41dbb..577b4b3362 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -147,7 +147,6 @@ struct VirtMachineState {
     bool highmem_mmio;
     bool highmem_redists;
     bool its;
-    bool tcg_its;
     bool virt;
     bool ras;
     bool mte;
-- 
2.47.3



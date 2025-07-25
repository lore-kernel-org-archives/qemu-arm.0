Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9BEC87FCA
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 20:25:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufOyf-0004i6-8a; Fri, 25 Jul 2025 16:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ufOsw-0006jL-QO
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 16:19:19 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ufOst-0000vu-S7
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 16:19:18 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-311e46d38ddso2263399a91.0
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 13:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753474754; x=1754079554; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TAokCfQUIO9o7V4gC6O0FLK0Lo5OjtX4UkdOojm8EZ0=;
 b=LQ1dz2slyx1trIZglK/fU75UpPkJed5Jn/CqibC1VW9MDTLFV4/HJodBrC168P8azq
 Rbxxm4mdW8Zup/k75sqUX225PXrs+2MVGh4cUuLyex9V11uITP1PB5FftxpOZAOW38N5
 Yd9YfXHjXbqnuWFqzdZ9ctYPypBnOICcP8osUgfL9nnK3EzuNybaQYdFmaYrA3gfTtiI
 RmRcnCPL/FpPtb56xDidXAI8eY6JEStIF4FjFEBLaRWiWGYYZXxIw9Q3PYeupOAOttDC
 j5P64XZVNTf3bNAld87ieCgaovB3rDxE50Oey0iR2dIU7Q4uhHPdn7FG3JkOwt1TFkmM
 qgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753474754; x=1754079554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TAokCfQUIO9o7V4gC6O0FLK0Lo5OjtX4UkdOojm8EZ0=;
 b=uVnxxI80FGc+dRIYehgmrsn4ot84oN/Ht2Mx1+cilGfaa+7x//IHpXpXqRLE1XvtKg
 jvyKG5A1dlOoQF424F4hOh/Kkg+I9l0iIqoW348MPa8BGt8sBU0u6m7CJrAunjZncYnU
 DhS2ORvzeUS18Hb/YIY5IYjynD62khe6dDPZ/+0jK0vOy4+y+fKayqC881rGu4g7BiLI
 Yo6VsURohbrQhJQthF21LeT51xdFdTJwH06UW7st4z9DcVf2flXnDL4pQNopWRrgdwvG
 i8q2XOz1nPidSKm3aCaIo0v2IF0R2TrkinhHSb+J4QqRuOO6kkuPLQVx+GvCGi907a7Y
 mu8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFGKuTb43dhi6KECuvx8foKmNz7hfu5KkikOyHr2wSKJF8A5X1ETc4oJoHnQcHRsq9iiHpExAHpw==@nongnu.org
X-Gm-Message-State: AOJu0YweWHillqsCSMha50p9jPbyziru7uP3V9+2G684yMAqPaTDQZwp
 shya8OUsDOc1FwvEMnizXiLnK6kmGOiyzmoUvaIHatyJJacQZbKw4ga9smZxDXuQGFs=
X-Gm-Gg: ASbGncvpzR91/GMf5ts9NPBV3qkMyofZLmeFm3RSV/lUB2euk1zO57XaqijmWe43cXb
 XmpwygLAxAOD24XsOnJSzTzE4Ia0QGDjx6Q+jmfyqZYDZ/QpA9WU0J+eW+fsdvTeBWdMx9stOPy
 bNJuSpnZPX6y5LMdYqT+DSQ5OSG5vmgdA/bcHSzBbHNXtiQiGMRQZfUWO2flVOUwvPl/FQioOHk
 j7HwRZhcQRvhgY3uajQjo9Pdt/R2LkvdqasXGwK3PCiR8M1cBpx6du/J1lo3wrWAicvKnRfvlSy
 GehqGTBSca1YqA6cjT99A55x96ks05iioEh+yUz7TyWVxagc4ohhSKkJqHzKZrCnfs0e1K0Ghlq
 p/K7cDWzJtgVC6eq7EQqLwg==
X-Google-Smtp-Source: AGHT+IECTy8x9YjZbo7TmhTsJRoAL1cHSGtMGvjh0Qpmux3uKuecq/d8eST6/Bi5L7ypcE4eQE458w==
X-Received: by 2002:a17:90b:35cb:b0:311:ed2:b758 with SMTP id
 98e67ed59e1d1-31e77a18514mr4405301a91.3.1753474754344; 
 Fri, 25 Jul 2025 13:19:14 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e6635f0a0sm4143309a91.24.2025.07.25.13.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 13:19:13 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 2/3] hw/arm/arm_gicv3_cpuif: move to hw/arm and compile only
 once
Date: Fri, 25 Jul 2025 13:19:05 -0700
Message-ID: <20250725201906.19533-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250725201906.19533-1-pierrick.bouvier@linaro.org>
References: <20250725201906.19533-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102b.google.com
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

This file needs definition of ARMCPU, and thus, belongs to hw/arm.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/{intc => arm}/arm_gicv3_cpuif.c |  2 +-
 hw/arm/meson.build                 |  1 +
 hw/arm/trace-events                | 62 ++++++++++++++++++++++++++++++
 hw/intc/meson.build                |  1 -
 hw/intc/trace-events               | 62 ------------------------------
 5 files changed, 64 insertions(+), 64 deletions(-)
 rename hw/{intc => arm}/arm_gicv3_cpuif.c (99%)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/arm/arm_gicv3_cpuif.c
similarity index 99%
rename from hw/intc/arm_gicv3_cpuif.c
rename to hw/arm/arm_gicv3_cpuif.c
index 4b4cf091570..a3564f2c53d 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/arm/arm_gicv3_cpuif.c
@@ -17,7 +17,7 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "trace.h"
-#include "gicv3_internal.h"
+#include "hw/intc/gicv3_internal.h"
 #include "hw/irq.h"
 #include "cpu.h"
 #include "target/arm/cpregs.h"
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 9f2eea474b4..25b6bb438a2 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -83,6 +83,7 @@ arm_common_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
 
 arm_common_ss.add(files('boot.c'))
 arm_common_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
+arm_common_ss.add(when: 'CONFIG_ARM_GICV3', if_true: files('arm_gicv3_cpuif.c'))
 
 hw_arch += {'arm': arm_ss}
 hw_common_arch += {'arm': arm_common_ss}
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index f3386bd7ae1..250ad116186 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -1,5 +1,67 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
+# arm_gicv3_cpuif.c
+gicv3_icc_pmr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_PMR read cpu 0x%x value 0x%" PRIx64
+gicv3_icc_pmr_write(uint32_t cpu, uint64_t val) "GICv3 ICC_PMR write cpu 0x%x value 0x%" PRIx64
+gicv3_icc_bpr_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_BPR%d read cpu 0x%x value 0x%" PRIx64
+gicv3_icc_bpr_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_BPR%d write cpu 0x%x value 0x%" PRIx64
+gicv3_icc_ap_read(int grp, int regno, uint32_t cpu, uint64_t val) "GICv3 ICC_AP%dR%d read cpu 0x%x value 0x%" PRIx64
+gicv3_icc_ap_write(int grp, int regno, uint32_t cpu, uint64_t val) "GICv3 ICC_AP%dR%d write cpu 0x%x value 0x%" PRIx64
+gicv3_icc_igrpen_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN%d read cpu 0x%x value 0x%" PRIx64
+gicv3_icc_igrpen_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN%d write cpu 0x%x value 0x%" PRIx64
+gicv3_icc_igrpen1_el3_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN1_EL3 read cpu 0x%x value 0x%" PRIx64
+gicv3_icc_igrpen1_el3_write(uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN1_EL3 write cpu 0x%x value 0x%" PRIx64
+gicv3_icc_ctlr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR read cpu 0x%x value 0x%" PRIx64
+gicv3_icc_ctlr_write(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR write cpu 0x%x value 0x%" PRIx64
+gicv3_icc_ctlr_el3_read(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR_EL3 read cpu 0x%x value 0x%" PRIx64
+gicv3_icc_ctlr_el3_write(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR_EL3 write cpu 0x%x value 0x%" PRIx64
+gicv3_cpuif_update(uint32_t cpuid, int irq, int grp, int prio) "GICv3 CPU i/f 0x%x HPPI update: irq %d group %d prio %d"
+gicv3_cpuif_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel) "GICv3 CPU i/f 0x%x HPPI update: setting FIQ %d IRQ %d"
+gicv3_icc_generate_sgi(uint32_t cpuid, int irq, int irm, uint32_t aff, uint32_t targetlist) "GICv3 CPU i/f 0x%x generating SGI %d IRM %d target affinity 0x%xxx targetlist 0x%x"
+gicv3_icc_iar0_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IAR0 read cpu 0x%x value 0x%" PRIx64
+gicv3_icc_iar1_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IAR1 read cpu 0x%x value 0x%" PRIx64
+gicv3_icc_nmiar1_read(uint32_t cpu, uint64_t val) "GICv3 ICC_NMIAR1 read cpu 0x%x value 0x%" PRIx64
+gicv3_icc_eoir_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_EOIR%d write cpu 0x%x value 0x%" PRIx64
+gicv3_icc_hppir0_read(uint32_t cpu, uint64_t val) "GICv3 ICC_HPPIR0 read cpu 0x%x value 0x%" PRIx64
+gicv3_icc_hppir1_read(uint32_t cpu, uint64_t val) "GICv3 ICC_HPPIR1 read cpu 0x%x value 0x%" PRIx64
+gicv3_icc_dir_write(uint32_t cpu, uint64_t val) "GICv3 ICC_DIR write cpu 0x%x value 0x%" PRIx64
+gicv3_icc_rpr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_RPR read cpu 0x%x value 0x%" PRIx64
+gicv3_ich_ap_read(int grp, int regno, uint32_t cpu, uint64_t val) "GICv3 ICH_AP%dR%d read cpu 0x%x value 0x%" PRIx64
+gicv3_ich_ap_write(int grp, int regno, uint32_t cpu, uint64_t val) "GICv3 ICH_AP%dR%d write cpu 0x%x value 0x%" PRIx64
+gicv3_ich_hcr_read(uint32_t cpu, uint64_t val) "GICv3 ICH_HCR_EL2 read cpu 0x%x value 0x%" PRIx64
+gicv3_ich_hcr_write(uint32_t cpu, uint64_t val) "GICv3 ICH_HCR_EL2 write cpu 0x%x value 0x%" PRIx64
+gicv3_ich_vmcr_read(uint32_t cpu, uint64_t val) "GICv3 ICH_VMCR_EL2 read cpu 0x%x value 0x%" PRIx64
+gicv3_ich_vmcr_write(uint32_t cpu, uint64_t val) "GICv3 ICH_VMCR_EL2 write cpu 0x%x value 0x%" PRIx64
+gicv3_ich_lr_read(int regno, uint32_t cpu, uint64_t val) "GICv3 ICH_LR%d_EL2 read cpu 0x%x value 0x%" PRIx64
+gicv3_ich_lr32_read(int regno, uint32_t cpu, uint32_t val) "GICv3 ICH_LR%d read cpu 0x%x value 0x%" PRIx32
+gicv3_ich_lrc_read(int regno, uint32_t cpu, uint32_t val) "GICv3 ICH_LRC%d read cpu 0x%x value 0x%" PRIx32
+gicv3_ich_lr_write(int regno, uint32_t cpu, uint64_t val) "GICv3 ICH_LR%d_EL2 write cpu 0x%x value 0x%" PRIx64
+gicv3_ich_lr32_write(int regno, uint32_t cpu, uint32_t val) "GICv3 ICH_LR%d write cpu 0x%x value 0x%" PRIx32
+gicv3_ich_lrc_write(int regno, uint32_t cpu, uint32_t val) "GICv3 ICH_LRC%d write cpu 0x%x value 0x%" PRIx32
+gicv3_ich_vtr_read(uint32_t cpu, uint64_t val) "GICv3 ICH_VTR read cpu 0x%x value 0x%" PRIx64
+gicv3_ich_misr_read(uint32_t cpu, uint64_t val) "GICv3 ICH_MISR read cpu 0x%x value 0x%" PRIx64
+gicv3_ich_eisr_read(uint32_t cpu, uint64_t val) "GICv3 ICH_EISR read cpu 0x%x value 0x%" PRIx64
+gicv3_ich_elrsr_read(uint32_t cpu, uint64_t val) "GICv3 ICH_ELRSR read cpu 0x%x value 0x%" PRIx64
+gicv3_icv_ap_read(int grp, int regno, uint32_t cpu, uint64_t val) "GICv3 ICV_AP%dR%d read cpu 0x%x value 0x%" PRIx64
+gicv3_icv_ap_write(int grp, int regno, uint32_t cpu, uint64_t val) "GICv3 ICV_AP%dR%d write cpu 0x%x value 0x%" PRIx64
+gicv3_icv_bpr_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_BPR%d read cpu 0x%x value 0x%" PRIx64
+gicv3_icv_bpr_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_BPR%d write cpu 0x%x value 0x%" PRIx64
+gicv3_icv_pmr_read(uint32_t cpu, uint64_t val) "GICv3 ICV_PMR read cpu 0x%x value 0x%" PRIx64
+gicv3_icv_pmr_write(uint32_t cpu, uint64_t val) "GICv3 ICV_PMR write cpu 0x%x value 0x%" PRIx64
+gicv3_icv_igrpen_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_IGRPEN%d read cpu 0x%x value 0x%" PRIx64
+gicv3_icv_igrpen_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_IGRPEN%d write cpu 0x%x value 0x%" PRIx64
+gicv3_icv_ctlr_read(uint32_t cpu, uint64_t val) "GICv3 ICV_CTLR read cpu 0x%x value 0x%" PRIx64
+gicv3_icv_ctlr_write(uint32_t cpu, uint64_t val) "GICv3 ICV_CTLR write cpu 0x%x value 0x%" PRIx64
+gicv3_icv_rpr_read(uint32_t cpu, uint64_t val) "GICv3 ICV_RPR read cpu 0x%x value 0x%" PRIx64
+gicv3_icv_hppir_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_HPPIR%d read cpu 0x%x value 0x%" PRIx64
+gicv3_icv_dir_write(uint32_t cpu, uint64_t val) "GICv3 ICV_DIR write cpu 0x%x value 0x%" PRIx64
+gicv3_icv_iar_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_IAR%d read cpu 0x%x value 0x%" PRIx64
+gicv3_icv_nmiar1_read(uint32_t cpu, uint64_t val) "GICv3 ICV_NMIAR1 read cpu 0x%x value 0x%" PRIx64
+gicv3_icv_eoir_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_EOIR%d write cpu 0x%x value 0x%" PRIx64
+gicv3_cpuif_virt_update(uint32_t cpuid, int idx, int hppvlpi, int grp, int prio) "GICv3 CPU i/f 0x%x virt HPPI update LR index %d HPPVLPI %d grp %d prio %d"
+gicv3_cpuif_virt_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel) "GICv3 CPU i/f 0x%x virt HPPI update: setting FIQ %d IRQ %d"
+gicv3_cpuif_virt_set_maint_irq(uint32_t cpuid, int maintlevel) "GICv3 CPU i/f 0x%x virt HPPI update: setting maintenance-irq %d"
+
 # omap1.c
 omap1_pwl_clocking_scheme(const char *scheme) "omap1 CLKM: clocking scheme set to %s"
 omap1_pwl_backlight(int output) "omap1 PWL: backlight now at %d/256"
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 4578c70dc45..22814893cbe 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -38,7 +38,6 @@ if config_all_devices.has_key('CONFIG_APIC') or \
 endif
 
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
-specific_ss.add(when: 'CONFIG_ARM_GICV3', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
 specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 018c609ca5e..4d6c886b794 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -110,68 +110,6 @@ gic_dist_write(int addr, unsigned int size, uint32_t val) "dist write at 0x%08x
 gic_lr_entry(int cpu, int entry, uint32_t val) "cpu %d: new lr entry %d: 0x%08" PRIx32
 gic_update_maintenance_irq(int cpu, int val) "cpu %d: maintenance = %d"
 
-# arm_gicv3_cpuif.c
-gicv3_icc_pmr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_PMR read cpu 0x%x value 0x%" PRIx64
-gicv3_icc_pmr_write(uint32_t cpu, uint64_t val) "GICv3 ICC_PMR write cpu 0x%x value 0x%" PRIx64
-gicv3_icc_bpr_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_BPR%d read cpu 0x%x value 0x%" PRIx64
-gicv3_icc_bpr_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_BPR%d write cpu 0x%x value 0x%" PRIx64
-gicv3_icc_ap_read(int grp, int regno, uint32_t cpu, uint64_t val) "GICv3 ICC_AP%dR%d read cpu 0x%x value 0x%" PRIx64
-gicv3_icc_ap_write(int grp, int regno, uint32_t cpu, uint64_t val) "GICv3 ICC_AP%dR%d write cpu 0x%x value 0x%" PRIx64
-gicv3_icc_igrpen_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN%d read cpu 0x%x value 0x%" PRIx64
-gicv3_icc_igrpen_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN%d write cpu 0x%x value 0x%" PRIx64
-gicv3_icc_igrpen1_el3_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN1_EL3 read cpu 0x%x value 0x%" PRIx64
-gicv3_icc_igrpen1_el3_write(uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN1_EL3 write cpu 0x%x value 0x%" PRIx64
-gicv3_icc_ctlr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR read cpu 0x%x value 0x%" PRIx64
-gicv3_icc_ctlr_write(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR write cpu 0x%x value 0x%" PRIx64
-gicv3_icc_ctlr_el3_read(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR_EL3 read cpu 0x%x value 0x%" PRIx64
-gicv3_icc_ctlr_el3_write(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR_EL3 write cpu 0x%x value 0x%" PRIx64
-gicv3_cpuif_update(uint32_t cpuid, int irq, int grp, int prio) "GICv3 CPU i/f 0x%x HPPI update: irq %d group %d prio %d"
-gicv3_cpuif_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel) "GICv3 CPU i/f 0x%x HPPI update: setting FIQ %d IRQ %d"
-gicv3_icc_generate_sgi(uint32_t cpuid, int irq, int irm, uint32_t aff, uint32_t targetlist) "GICv3 CPU i/f 0x%x generating SGI %d IRM %d target affinity 0x%xxx targetlist 0x%x"
-gicv3_icc_iar0_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IAR0 read cpu 0x%x value 0x%" PRIx64
-gicv3_icc_iar1_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IAR1 read cpu 0x%x value 0x%" PRIx64
-gicv3_icc_nmiar1_read(uint32_t cpu, uint64_t val) "GICv3 ICC_NMIAR1 read cpu 0x%x value 0x%" PRIx64
-gicv3_icc_eoir_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_EOIR%d write cpu 0x%x value 0x%" PRIx64
-gicv3_icc_hppir0_read(uint32_t cpu, uint64_t val) "GICv3 ICC_HPPIR0 read cpu 0x%x value 0x%" PRIx64
-gicv3_icc_hppir1_read(uint32_t cpu, uint64_t val) "GICv3 ICC_HPPIR1 read cpu 0x%x value 0x%" PRIx64
-gicv3_icc_dir_write(uint32_t cpu, uint64_t val) "GICv3 ICC_DIR write cpu 0x%x value 0x%" PRIx64
-gicv3_icc_rpr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_RPR read cpu 0x%x value 0x%" PRIx64
-gicv3_ich_ap_read(int grp, int regno, uint32_t cpu, uint64_t val) "GICv3 ICH_AP%dR%d read cpu 0x%x value 0x%" PRIx64
-gicv3_ich_ap_write(int grp, int regno, uint32_t cpu, uint64_t val) "GICv3 ICH_AP%dR%d write cpu 0x%x value 0x%" PRIx64
-gicv3_ich_hcr_read(uint32_t cpu, uint64_t val) "GICv3 ICH_HCR_EL2 read cpu 0x%x value 0x%" PRIx64
-gicv3_ich_hcr_write(uint32_t cpu, uint64_t val) "GICv3 ICH_HCR_EL2 write cpu 0x%x value 0x%" PRIx64
-gicv3_ich_vmcr_read(uint32_t cpu, uint64_t val) "GICv3 ICH_VMCR_EL2 read cpu 0x%x value 0x%" PRIx64
-gicv3_ich_vmcr_write(uint32_t cpu, uint64_t val) "GICv3 ICH_VMCR_EL2 write cpu 0x%x value 0x%" PRIx64
-gicv3_ich_lr_read(int regno, uint32_t cpu, uint64_t val) "GICv3 ICH_LR%d_EL2 read cpu 0x%x value 0x%" PRIx64
-gicv3_ich_lr32_read(int regno, uint32_t cpu, uint32_t val) "GICv3 ICH_LR%d read cpu 0x%x value 0x%" PRIx32
-gicv3_ich_lrc_read(int regno, uint32_t cpu, uint32_t val) "GICv3 ICH_LRC%d read cpu 0x%x value 0x%" PRIx32
-gicv3_ich_lr_write(int regno, uint32_t cpu, uint64_t val) "GICv3 ICH_LR%d_EL2 write cpu 0x%x value 0x%" PRIx64
-gicv3_ich_lr32_write(int regno, uint32_t cpu, uint32_t val) "GICv3 ICH_LR%d write cpu 0x%x value 0x%" PRIx32
-gicv3_ich_lrc_write(int regno, uint32_t cpu, uint32_t val) "GICv3 ICH_LRC%d write cpu 0x%x value 0x%" PRIx32
-gicv3_ich_vtr_read(uint32_t cpu, uint64_t val) "GICv3 ICH_VTR read cpu 0x%x value 0x%" PRIx64
-gicv3_ich_misr_read(uint32_t cpu, uint64_t val) "GICv3 ICH_MISR read cpu 0x%x value 0x%" PRIx64
-gicv3_ich_eisr_read(uint32_t cpu, uint64_t val) "GICv3 ICH_EISR read cpu 0x%x value 0x%" PRIx64
-gicv3_ich_elrsr_read(uint32_t cpu, uint64_t val) "GICv3 ICH_ELRSR read cpu 0x%x value 0x%" PRIx64
-gicv3_icv_ap_read(int grp, int regno, uint32_t cpu, uint64_t val) "GICv3 ICV_AP%dR%d read cpu 0x%x value 0x%" PRIx64
-gicv3_icv_ap_write(int grp, int regno, uint32_t cpu, uint64_t val) "GICv3 ICV_AP%dR%d write cpu 0x%x value 0x%" PRIx64
-gicv3_icv_bpr_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_BPR%d read cpu 0x%x value 0x%" PRIx64
-gicv3_icv_bpr_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_BPR%d write cpu 0x%x value 0x%" PRIx64
-gicv3_icv_pmr_read(uint32_t cpu, uint64_t val) "GICv3 ICV_PMR read cpu 0x%x value 0x%" PRIx64
-gicv3_icv_pmr_write(uint32_t cpu, uint64_t val) "GICv3 ICV_PMR write cpu 0x%x value 0x%" PRIx64
-gicv3_icv_igrpen_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_IGRPEN%d read cpu 0x%x value 0x%" PRIx64
-gicv3_icv_igrpen_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_IGRPEN%d write cpu 0x%x value 0x%" PRIx64
-gicv3_icv_ctlr_read(uint32_t cpu, uint64_t val) "GICv3 ICV_CTLR read cpu 0x%x value 0x%" PRIx64
-gicv3_icv_ctlr_write(uint32_t cpu, uint64_t val) "GICv3 ICV_CTLR write cpu 0x%x value 0x%" PRIx64
-gicv3_icv_rpr_read(uint32_t cpu, uint64_t val) "GICv3 ICV_RPR read cpu 0x%x value 0x%" PRIx64
-gicv3_icv_hppir_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_HPPIR%d read cpu 0x%x value 0x%" PRIx64
-gicv3_icv_dir_write(uint32_t cpu, uint64_t val) "GICv3 ICV_DIR write cpu 0x%x value 0x%" PRIx64
-gicv3_icv_iar_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_IAR%d read cpu 0x%x value 0x%" PRIx64
-gicv3_icv_nmiar1_read(uint32_t cpu, uint64_t val) "GICv3 ICV_NMIAR1 read cpu 0x%x value 0x%" PRIx64
-gicv3_icv_eoir_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_EOIR%d write cpu 0x%x value 0x%" PRIx64
-gicv3_cpuif_virt_update(uint32_t cpuid, int idx, int hppvlpi, int grp, int prio) "GICv3 CPU i/f 0x%x virt HPPI update LR index %d HPPVLPI %d grp %d prio %d"
-gicv3_cpuif_virt_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel) "GICv3 CPU i/f 0x%x virt HPPI update: setting FIQ %d IRQ %d"
-gicv3_cpuif_virt_set_maint_irq(uint32_t cpuid, int maintlevel) "GICv3 CPU i/f 0x%x virt HPPI update: setting maintenance-irq %d"
-
 # arm_gicv3_dist.c
 gicv3_dist_read(uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 distributor read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
 gicv3_dist_badread(uint64_t offset, unsigned size, bool secure) "GICv3 distributor read: offset 0x%" PRIx64 " size %u secure %d: error"
-- 
2.47.2



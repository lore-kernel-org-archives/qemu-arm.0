Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FA4FB44C2
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 07:09:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGAfH-0007tf-5j; Fri, 24 Apr 2026 03:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wGAfG-0007tQ-Kb
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 03:09:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wGAfE-0004j7-M1
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 03:09:26 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4891f625344so60668385e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 00:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777014563; x=1777619363; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SNjBaTm+GkQX1KRYwd9hO7lcbJHr/Ty+u2KIwQEmNLE=;
 b=ExHygnOs7gOh35PyOuj5kghfk5s/9zS2JKycuC5x20o4wZre3coazPWvJmFP1s6yJu
 XaSgaxkQFiyqN5h6euR+NsyTD7A4gGKLITv3cdA4C5pRr5XO1B8y9czzdGNa9Pp23iWB
 qKqQFCZxO042MYaFooG3lxkVeNegwtZ0r2EHRe1orLiorgmY6XfbptKl05AROgrFQtRk
 b+Jmg0kd1CedqX62yaJ4/hjlARgJCXILvZXMsF4RhvtVFt8LiFZsnWyzvlOYazfAIkYg
 JGFm9hwo6i31QcjaJ/KtT9hHrC/1UHhUxAyKwmLAI4dmjCHv57QeVt0G5tYkA8bxRlsl
 NA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777014563; x=1777619363;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SNjBaTm+GkQX1KRYwd9hO7lcbJHr/Ty+u2KIwQEmNLE=;
 b=Pp5AQ+FUSriUVZtnivJasMNbmVE2yJRfyEzYaUXefk/QXUkAG4W/k9G93H5kC4F09N
 x8zeQkzB9VmLeM4SplIgHfIx8oxGegyHRItN/C11magkezUquL71Wnj1+Vhs1jV88sHi
 9+fgFRF4kS7ffM+2OSAmiEMpld1+21p3dq03YtUGGd0Pq9zPI9iVUam+VAU6WPPOu0/h
 9WHnJBQohjEan1KxDFxT7w0pJ9sYt0WLBVIc5wNyp+4YgK4C1fdcXLJSErUzSMliP/zE
 dOOgW1TkUiF7abV9ksPaE8ow5mi894IP0/OjbbvdfBKL5QFciNudv6HQKMgkEglPww0Z
 twwA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ZCvcPrJCGSf97fbh8JbNL0D6oSwk5pAg+RIOCESW+xYpt1d2YjmvIO13P6rcSgfJPtr779W7kdQ==@nongnu.org
X-Gm-Message-State: AOJu0YzL59D32rnKI/yT1rcVPtUg69Xv7guOGLG73AHYbgVtxwD4zk/0
 crl6l7ZEohf/NXxhmKI4kwblV5nkOHd8xwpDbBvKGeMgFyzji3QOWZRYLTGQcU9RtZA=
X-Gm-Gg: AeBDieuELparIHKlUjBUq3sS6zkPnLkpu9k3IdCELxlTXUfJ4YJ5W+cs/WiWi3lE9P0
 nd5QkY7pGLrWnhABPxG7Vmr821AFzz1tIfpA9bduZWsBp7ZQ0uYSqIbN76337TKXnKOzFZcgn4l
 Pz0Xl4lInwZJBoSUan/tp+HjziFnAFstlavvRU6IuvjRc4I2kUOCIc5+JEThemfc/DFpQudl3LX
 PAV90f6J7St1bzwzhKAcy9kYI3DBc7Q/wjxjrYFLxFOgEPZx47fOSqQIslQrE4tkdJPV5BgJ3Nj
 TgGGxqlBlnvXxz3lxCo8uY9HIUN/CsX4/uQ1eucPQd5Ax3eASRheca1YkTOFLDaV3Qt6L62rnLF
 4gvflweRFYUvzoCRicARh9geaUUgHlPf2RILzN032y5XcRUSXWNfBDB3I5MuKjoqNloW9ESdqud
 dueACqw/2GU6/v7juwCjBYos2l4zy+riC5fzFfkMjuS4jyvb2tbGl5vbFzr4J5KOTH/qSi6AIx+
 ZIbDSjIGN9KYzX+pzcThH5xZ7CFrovWIwqa/1ShkIJQ4F2b0iwXhoxIhkLgFA==
X-Received: by 2002:a05:600d:4:b0:48a:65ab:8059 with SMTP id
 5b1f17b1804b1-48a65ab8180mr10211535e9.13.1777014563003; 
 Fri, 24 Apr 2026 00:09:23 -0700 (PDT)
Received: from meli-email.org (athedsl-338307.home.otenet.gr. [85.72.177.33])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc2cacsm57730337f8f.13.2026.04.24.00.09.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2026 00:09:22 -0700 (PDT)
Date: Fri, 24 Apr 2026 10:07:51 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: Re: [PATCH v20 05/15] hw/arm, target/arm: nested virtualisation on HVF
User-Agent: meli/0.8.13
References: <20260316130642.13246-1-mohamed@unpredictable.fr>
 <20260316130642.13246-6-mohamed@unpredictable.fr>
In-Reply-To: <20260316130642.13246-6-mohamed@unpredictable.fr>
Message-ID: <tdzl7l.1onr4604kkp2a@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x329.google.com
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

On Mon, 16 Mar 2026 15:06, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>---

Suggestion: change commit subject/message to something like "Add nested 
virt enabled checks"

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

> accel/hvf/hvf-all.c    |  5 +++++
> accel/stubs/hvf-stub.c | 10 ++++++++++
> hw/arm/virt.c          |  5 +++++
> include/system/hvf.h   |  5 +++++
> target/arm/hvf/hvf.c   | 42 ++++++++++++++++++++++++++++++++++++++++--
> 5 files changed, 65 insertions(+), 2 deletions(-)
>
>diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
>index add265e0c8..48c653630f 100644
>--- a/accel/hvf/hvf-all.c
>+++ b/accel/hvf/hvf-all.c
>@@ -24,6 +24,11 @@
> 
> bool hvf_allowed;
> bool hvf_kernel_irqchip;
>+bool hvf_nested_virt;
>+
>+void hvf_nested_virt_enable(bool nested_virt) {
>+    hvf_nested_virt = nested_virt;
>+}
> 
> const char *hvf_return_string(hv_return_t ret)
> {
>diff --git a/accel/stubs/hvf-stub.c b/accel/stubs/hvf-stub.c
>index 6bd08759ba..dc365c5307 100644
>--- a/accel/stubs/hvf-stub.c
>+++ b/accel/stubs/hvf-stub.c
>@@ -11,3 +11,13 @@
> 
> bool hvf_allowed;
> bool hvf_kernel_irqchip;
>+bool hvf_nested_virt;
>+
>+void hvf_nested_virt_enable(bool nested_virt) {
>+    /*
>+     * This is called unconditionally from hw/arm/virt.c
>+     * because we don't know if HVF is going to be used
>+     * as that step of initialisation happens later.
>+     * As such, do nothing here instead of marking as unreachable.
>+     */
>+}
>diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>index 7a6fad1094..90769936d0 100644
>--- a/hw/arm/virt.c
>+++ b/hw/arm/virt.c
>@@ -2661,6 +2661,11 @@ static void virt_set_virt(Object *obj, bool value, Error **errp)
>     VirtMachineState *vms = VIRT_MACHINE(obj);
> 
>     vms->virt = value;
>+    /*
>+     * At this point, HVF is not initialised yet.
>+     * However, it needs to know if nested virt is enabled at init time.
>+     */
>+    hvf_nested_virt_enable(value);
> }
> 
> static bool virt_get_highmem(Object *obj, Error **errp)
>diff --git a/include/system/hvf.h b/include/system/hvf.h
>index dc8da85979..a961df8b95 100644
>--- a/include/system/hvf.h
>+++ b/include/system/hvf.h
>@@ -28,11 +28,16 @@ extern bool hvf_allowed;
> #define hvf_enabled() (hvf_allowed)
> extern bool hvf_kernel_irqchip;
> #define hvf_irqchip_in_kernel()  (hvf_kernel_irqchip)
>+extern bool hvf_nested_virt;
>+#define hvf_nested_virt_enabled()  (hvf_nested_virt)
> #else /* !CONFIG_HVF_IS_POSSIBLE */
> #define hvf_enabled() 0
> #define hvf_irqchip_in_kernel() 0
>+#define hvf_nested_virt_enabled() 0
> #endif /* !CONFIG_HVF_IS_POSSIBLE */
> 
>+void hvf_nested_virt_enable(bool nested_virt);
>+
> #define TYPE_HVF_ACCEL ACCEL_CLASS_NAME("hvf")
> 
> typedef struct HVFState HVFState;
>diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
>index d431d96ba3..d6ef4488fa 100644
>--- a/target/arm/hvf/hvf.c
>+++ b/target/arm/hvf/hvf.c
>@@ -27,6 +27,7 @@
> #include "system/memory.h"
> #include "hw/core/boards.h"
> #include "hw/core/irq.h"
>+#include "hw/arm/virt.h"
> #include "qemu/main-loop.h"
> #include "system/cpus.h"
> #include "arm-powerctl.h"
>@@ -1103,6 +1104,10 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>                      (1ULL << ARM_FEATURE_PMU) |
>                      (1ULL << ARM_FEATURE_GENERIC_TIMER);
> 
>+    if (hvf_nested_virt_enabled()) {
>+        ahcf->features |= 1ULL << ARM_FEATURE_EL2;
>+    }
>+
>     for (i = 0; i < ARRAY_SIZE(regs); i++) {
>         r |= hv_vcpu_config_get_feature_reg(config, regs[i].reg,
>                                             &host_isar.idregs[regs[i].index]);
>@@ -1218,6 +1223,19 @@ void hvf_arch_vcpu_destroy(CPUState *cpu)
>     assert_hvf_ok(ret);
> }
> 
>+static bool hvf_arm_el2_supported(void)
>+{
>+    bool is_nested_virt_supported;
>+    if (__builtin_available(macOS 15.0, *)) {
>+        hv_return_t ret = hv_vm_config_get_el2_supported(&is_nested_virt_supported);
>+        assert_hvf_ok(ret);
>+    } else {
>+        return false;
>+    }
>+    return is_nested_virt_supported;
>+}
>+
>+
> hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range)
> {
>     hv_return_t ret;
>@@ -1229,6 +1247,20 @@ hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range)
>     }
>     chosen_ipa_bit_size = pa_range;
> 
>+    if (__builtin_available(macOS 15.0, *)) {
>+        if (hvf_nested_virt_enabled()) {
>+            if (!hvf_arm_el2_supported()) {
>+                error_report("Nested virtualization not supported on this system.");
>+                goto cleanup;
>+            }
>+            ret = hv_vm_config_set_el2_enabled(config, true);
>+            if (ret != HV_SUCCESS) {
>+                error_report("Failed to enable nested virtualization.");
>+                goto cleanup;
>+            }
>+        }
>+    }
>+
>     ret = hv_vm_create(config);
>     if (hvf_irqchip_in_kernel()) {
>         if (__builtin_available(macOS 15.0, *)) {
>@@ -1420,6 +1452,13 @@ static void hvf_psci_cpu_off(ARMCPU *arm_cpu)
>     assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
> }
> 
>+static int hvf_psci_get_target_el(void)
>+{
>+    if (hvf_nested_virt_enabled()) {
>+        return 2;
>+    }
>+    return 1;
>+}
> /*
>  * Handle a PSCI call.
>  *
>@@ -1441,7 +1480,6 @@ static bool hvf_handle_psci_call(CPUState *cpu, int *excp_ret)
>     CPUState *target_cpu_state;
>     ARMCPU *target_cpu;
>     target_ulong entry;
>-    int target_el = 1;
>     int32_t ret = 0;
> 
>     trace_arm_psci_call(param[0], param[1], param[2], param[3],
>@@ -1495,7 +1533,7 @@ static bool hvf_handle_psci_call(CPUState *cpu, int *excp_ret)
>         entry = param[2];
>         context_id = param[3];
>         ret = arm_set_cpu_on(mpidr, entry, context_id,
>-                             target_el, target_aarch64);
>+                             hvf_psci_get_target_el(), target_aarch64);
>         break;
>     case QEMU_PSCI_0_1_FN_CPU_OFF:
>     case QEMU_PSCI_0_2_FN_CPU_OFF:
>-- 
>2.50.1 (Apple Git-155)
>
>


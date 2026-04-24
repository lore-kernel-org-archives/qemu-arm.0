Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DBAFB44C2
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 07:05:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGAaa-0006r9-E0; Fri, 24 Apr 2026 03:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wGAaZ-0006qx-Gl
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 03:04:35 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wGAaS-0002Yu-4R
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 03:04:35 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43d0deb7ad5so6145473f8f.2
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 00:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777014266; x=1777619066; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VpsRaGZLZVp5OzXeYfhDIh5no9NeMTsH7wC/H5hgrag=;
 b=YjryQTPSFhk28rDlPE95DmEPoHcXLuRXdang8XtDGOPrgD8ljfsPtsCQtUScHcPUOP
 OGMA0sNVIdq+eVfEj1YeBfXSf2GaIuLZDwZid8oM4kgNxObHr+c13B7IhVT8WEIzxb6v
 h0aajobML6ykHYnS5H0h+lnLmc4E6UBZJvgSDy0uTJDdhMCjbYb3N54+h9L9VI1wtr33
 opnT/78FI7o035QH2mPc6j7Uu30VZD9SM8BfMQRdMv6ty1LG81EPH2njSXnAJxAUJld5
 EkkmUEOmOJNVGBkPuGtMapeWNRjV7HN9bJJefv1nIIjwDz4FDGLnpKmBrmO5ADlR5guy
 vmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777014266; x=1777619066;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VpsRaGZLZVp5OzXeYfhDIh5no9NeMTsH7wC/H5hgrag=;
 b=MH8ks/tbjG9OfyJPs0bYvwfp3I1BpGoGNC9vGjOUziTzndNwKVJfZo202ONPyA5ZbV
 xaOlj6uzvxZIQVcaB0YbP8TpFqNyvTo9M/5iMeM4ITutKcPogC4NT4tYc4E7YblZ3+eR
 ddhdEW7Jfa4ypU9ZT2NSlmcqw4y0x/6vIq0k81m0a+RQaEeLmXRWdFmOM1JodMY7nHVL
 Nee55pOC/EwC+SL+6W9peYR2a4R4uuhWa1Hw4bso3ygMq6PpNO4p9ethAicPx6CaVZkq
 gXpQzxA4LXf11oGrI/iQcdiPyUrWRr/1ipE+jlqd/EYrZRyOkDRRmJTzVZJ0gBm0jJQI
 wEVA==
X-Forwarded-Encrypted: i=1;
 AFNElJ80vaeyJquUChNkg5g2qiNRcZUZX57+/L6SC0K8Fmb4J7n80UOKu35oDKzN4EL2Uw479QfVVv+nbA==@nongnu.org
X-Gm-Message-State: AOJu0Yy/kkTufgUgCEsS97bDhqgn3nqUPJPapwtf5V3loX1gMWF5DkF4
 aN0R8k+8x+JAZvnMVy4Rq5gO19P+k2sANoZF1qVRes5DtUrrDekh965vS0FbBpmrlt8=
X-Gm-Gg: AeBDieviDFcbLv5HGZZVvwW/rrHCcReOEkN9ddEpUgS78ZQO9q0rQLvDsUvoxWmkELG
 eioWihv4P3dkYml+kshV2ZOaDp1PH8tqtLz9tn3xpBbeuAfWoEPFHn1wdB+sYOVJX14+0vf/Gql
 aifzcS9kBZRQPrHxuniaOPQewVy1lyAreVL+CLg9nC2+QAtOmOeUXN6hwx2lzxweGq8o1YOInJC
 xLWw7IL7LALRMDg5LhTkoicuTa3Bt//3ICSEPzH8m0cV8JOlONMoDitdsvELOxKajkdAR1qDj2B
 dQtnfYugWSIWrd5Gmr9UySRY5hRSwe5vbDkp5tyKVmaYNT9pNjWSzubp3TJhiTHT0SVjyzw2LFi
 GHgTzv9l4Busb2v+Ue3jV1ygAOjqQOFAPyqZFo+fWioQB/DrCaSRNCLWTJhF8Jrjj447b2RSGr+
 OuX32ei+9YMwy1diUbLvLwgnDq4TfN3w2WltEnKdCZrFJUeYyKStWN86dDGfPagxWifCWa4nRMx
 XXMj0OjOKFEjdhcCEhIKYno5e7jUScyvXjc3Dl9APN3GYKgzqEObWsWi+Ob9A==
X-Received: by 2002:a05:6000:4201:b0:43e:a72e:ec5a with SMTP id
 ffacd0b85a97d-43fe3dc62f3mr46867169f8f.20.1777014266041; 
 Fri, 24 Apr 2026 00:04:26 -0700 (PDT)
Received: from meli-email.org (athedsl-338307.home.otenet.gr. [85.72.177.33])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a174sm63826365f8f.18.2026.04.24.00.04.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2026 00:04:25 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:56:26 +0300
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
Subject: Re: [PATCH v20 02/15] hw/intc: arm_gicv3_hvf: save/restore Apple GIC
 state
User-Agent: meli/0.8.13
References: <20260316130642.13246-1-mohamed@unpredictable.fr>
 <20260316130642.13246-3-mohamed@unpredictable.fr>
In-Reply-To: <20260316130642.13246-3-mohamed@unpredictable.fr>
Message-ID: <tdzkzc.i0jgs6ineqnz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
>On HVF, some of the GIC state is in an opaque Apple-provided structure.
>
>Save/restore that state to be able to save/restore VMs that use the hardware GIC.
>
>Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/intc/arm_gicv3_common.c         |  1 +
> hw/intc/arm_gicv3_hvf.c            | 95 ++++++++++++++++++++++++++++--
> hw/intc/arm_gicv3_hvf_stub.c       | 25 ++++++++
> hw/intc/meson.build                |  1 +
> include/hw/intc/arm_gicv3_common.h |  3 +
> 5 files changed, 121 insertions(+), 4 deletions(-)
> create mode 100644 hw/intc/arm_gicv3_hvf_stub.c
>
>diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
>index 9200671c7a..9c3fb2f4bf 100644
>--- a/hw/intc/arm_gicv3_common.c
>+++ b/hw/intc/arm_gicv3_common.c
>@@ -305,6 +305,7 @@ static const VMStateDescription vmstate_gicv3 = {
>     .subsections = (const VMStateDescription * const []) {
>         &vmstate_gicv3_gicd_no_migration_shift_bug,
>         &vmstate_gicv3_gicd_nmi,
>+        &vmstate_gicv3_hvf,
>         NULL
>     }
> };
>diff --git a/hw/intc/arm_gicv3_hvf.c b/hw/intc/arm_gicv3_hvf.c
>index 55171a796b..18e5b3fe68 100644
>--- a/hw/intc/arm_gicv3_hvf.c
>+++ b/hw/intc/arm_gicv3_hvf.c
>@@ -13,6 +13,7 @@
> #include "qemu/error-report.h"
> #include "qemu/module.h"
> #include "system/runstate.h"
>+#include "migration/vmstate.h"
> #include "system/hvf.h"
> #include "system/hvf_int.h"
> #include "hvf_arm.h"
>@@ -34,8 +35,13 @@ struct HVFARMGICv3Class {
> 
> typedef struct HVFARMGICv3Class HVFARMGICv3Class;
> 
>-/* This is reusing the GICv3State typedef from ARM_GICV3_ITS_COMMON */
>-DECLARE_OBJ_CHECKERS(GICv3State, HVFARMGICv3Class,
>+typedef struct HVFGICv3State {
>+    GICv3State gicv3_state;
>+    uint32_t size;
>+    void *state;
>+} HVFGICv3State;
>+
>+DECLARE_OBJ_CHECKERS(HVFGICv3State, HVFARMGICv3Class,
>                      HVF_GICV3, TYPE_HVF_GICV3);
> 
> /*
>@@ -660,7 +666,7 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
> static void hvf_gicv3_realize(DeviceState *dev, Error **errp)
> {
>     ERRP_GUARD();
>-    GICv3State *s = HVF_GICV3(dev);
>+    GICv3State *s = (GICv3State *)HVF_GICV3(dev);

Nit:     GICv3State *s = &HVF_GICV3(dev)->gicv3_state;
reads better and is checked

>     HVFARMGICv3Class *kgc = HVF_GICV3_GET_CLASS(s);
>     int i;
> 
>@@ -707,6 +713,87 @@ static void hvf_gicv3_realize(DeviceState *dev, Error **errp)
>     }
> }
> 
>+/*
>+ * HVF doesn't have a way to save the RDIST pending tables
>+ * to guest memory, only to an opaque data structure.
>+ */
>+static bool gicv3_is_hvf(void *opaque)
>+{
>+    return hvf_enabled() && hvf_irqchip_in_kernel();
>+}
>+
>+static int hvf_gic_opaque_state_save(void *opaque)
>+{
>+    HVFGICv3State *gic = opaque;
>+    hv_gic_state_t gic_state;
>+    hv_return_t err;
>+    size_t size;
>+
>+    gic_state = hv_gic_state_create();
>+    if (gic_state == NULL) {
>+        error_report("hvf: vgic: failed to create hv_gic_state_create.");
>+        return 1;
>+    }
>+    err = hv_gic_state_get_size(gic_state, &size);
>+    gic->size = size;
>+    if (err != HV_SUCCESS) {
>+        error_report("hvf: vgic: failed to get GIC state size.");
>+        os_release(gic_state);
>+        return 1;
>+    }
>+    gic->state = g_malloc(gic->size);

nit: use g_malloc0

Otherwise 


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>


>+    err = hv_gic_state_get_data(gic_state, gic->state);
>+    if (err != HV_SUCCESS) {
>+        error_report("hvf: vgic: failed to get GIC state.");
>+        os_release(gic_state);
>+        return 1;
>+    }
>+
>+    os_release(gic_state);
>+    return 0;
>+}
>+
>+static int hvf_gic_opaque_state_free(void *opaque)
>+{
>+    HVFGICv3State *gic = opaque;
>+    free(gic->state);
>+    return 0;
>+}
>+
>+static int hvf_gic_opaque_state_restore(void *opaque, int version_id)
>+{
>+    HVFGICv3State *gic = opaque;
>+    hv_return_t err;
>+    if (!gic->size) {
>+        return 0;
>+    }
>+    err = hv_gic_set_state(gic->state, gic->size);
>+    if (err != HV_SUCCESS) {
>+        error_report("hvf: vgic: failed to restore GIC state.");
>+        return 1;
>+    }
>+    return 0;
>+}
>+
>+const VMStateDescription vmstate_gicv3_hvf = {
>+    .name = "arm_gicv3/hvf_gic_state",
>+    .version_id = 1,
>+    .minimum_version_id = 1,
>+    .needed = gicv3_is_hvf,
>+    .pre_save = hvf_gic_opaque_state_save,
>+    .post_save = hvf_gic_opaque_state_free,
>+    .post_load = hvf_gic_opaque_state_restore,
>+    .version_id = 1,
>+    .minimum_version_id = 1,
>+    .fields = (const VMStateField[]) {
>+        VMSTATE_UINT32(size, HVFGICv3State),
>+        VMSTATE_VBUFFER_ALLOC_UINT32(state,
>+                                     HVFGICv3State, 0, 0,
>+                                     size),
>+        VMSTATE_END_OF_LIST()
>+    },
>+};
>+
> static void hvf_gicv3_class_init(ObjectClass *klass, const void *data)
> {
>     DeviceClass *dc = DEVICE_CLASS(klass);
>@@ -726,7 +813,7 @@ static void hvf_gicv3_class_init(ObjectClass *klass, const void *data)
> static const TypeInfo hvf_arm_gicv3_info = {
>     .name = TYPE_HVF_GICV3,
>     .parent = TYPE_ARM_GICV3_COMMON,
>-    .instance_size = sizeof(GICv3State),
>+    .instance_size = sizeof(HVFGICv3State),
>     .class_init = hvf_gicv3_class_init,
>     .class_size = sizeof(HVFARMGICv3Class),
> };
>diff --git a/hw/intc/arm_gicv3_hvf_stub.c b/hw/intc/arm_gicv3_hvf_stub.c
>new file mode 100644
>index 0000000000..a587332c7c
>--- /dev/null
>+++ b/hw/intc/arm_gicv3_hvf_stub.c
>@@ -0,0 +1,25 @@
>+/* SPDX-License-Identifier: GPL-2.0-or-later */
>+/*
>+ * ARM Generic Interrupt Controller using HVF platform support stub
>+ *
>+ * Copyright (c) 2026 Mohamed Mediouni
>+ *
>+ */
>+#include "qemu/osdep.h"
>+#include "hw/intc/arm_gicv3_common.h"
>+#include "migration/vmstate.h"
>+#include "qemu/typedefs.h"
>+
>+static bool needed_never(void *opaque)
>+{
>+    return false;
>+}
>+
>+const VMStateDescription vmstate_gicv3_hvf = {
>+    .name = "arm_gicv3/hvf_gic_state",
>+    .version_id = 1,
>+    .minimum_version_id = 1,
>+    .needed = needed_never,
>+    .version_id = 1,
>+    .minimum_version_id = 1,
>+};
>diff --git a/hw/intc/meson.build b/hw/intc/meson.build
>index b7baf8a0f6..c6de2d9d00 100644
>--- a/hw/intc/meson.build
>+++ b/hw/intc/meson.build
>@@ -43,6 +43,7 @@ arm_common_ss.add(when: 'CONFIG_ARM_GICV3', if_true: files('arm_gicv3_cpuif.c'))
> specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
> specific_ss.add(when: ['CONFIG_WHPX', 'TARGET_AARCH64'], if_true: files('arm_gicv3_whpx.c'))
> specific_ss.add(when: ['CONFIG_HVF', 'CONFIG_ARM_GICV3'], if_true: files('arm_gicv3_hvf.c'))
>+specific_ss.add(when: ['CONFIG_HVF', 'CONFIG_ARM_GICV3'], if_false: files('arm_gicv3_hvf_stub.c'))
> specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
> arm_common_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
> specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
>diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
>index 9adcab0a0c..03ab3e8f2f 100644
>--- a/include/hw/intc/arm_gicv3_common.h
>+++ b/include/hw/intc/arm_gicv3_common.h
>@@ -339,4 +339,7 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
>  */
> const char *gicv3_class_name(void);
> 
>+/* HVF vGIC-specific state: stubbed out on a build with HVF disabled */
>+extern const VMStateDescription vmstate_gicv3_hvf;
>+
> #endif
>-- 
>2.50.1 (Apple Git-155)
>
>


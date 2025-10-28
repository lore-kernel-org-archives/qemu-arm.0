Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC878CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 12:00:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDiNC-0007Vf-Ls; Tue, 28 Oct 2025 08:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vDiN9-0007TD-8y
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 08:00:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vDiN2-0008TH-5C
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 08:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761652805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nLGh/KpF4YbWhww4oASN6sY+LtwjQb0a2V39oYVfBOc=;
 b=UUCEWxZ3hCOd50ZyiI8THSZrihaj1zOIPrz5eS4i0qksMnHfoph4jgzlM6i8ija1cXAsvw
 l3LY+1QOyyyZdj+mAhud0sV5DgjmOf3iMWtO72h5b/D24MgD2rluq36oWYCXd7GRANLwuK
 Gzgz3QdKzUOWEM+QhG6gX+KyFnJ3y74=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-k_HBjHDnNmSEni0PaRC6Qw-1; Tue, 28 Oct 2025 08:00:03 -0400
X-MC-Unique: k_HBjHDnNmSEni0PaRC6Qw-1
X-Mimecast-MFC-AGG-ID: k_HBjHDnNmSEni0PaRC6Qw_1761652802
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7a27837ead0so3869550b3a.3
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 05:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761652802; x=1762257602;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nLGh/KpF4YbWhww4oASN6sY+LtwjQb0a2V39oYVfBOc=;
 b=Q260Z/k82nyEvJ1b54ZeXBP+X08COUB6eKoxGmyMBWgxl6SHjCltmJT7m7qMbCGCOO
 039tblL4cCA+ep68yg9tid3T6IwoSeIIp21USD0LLj0IIaw850wuYu9XLxwUmY6yYtGu
 xTnHGL7g5dC/hVMUYP5lMCe0/RKeYKgidFWEgxRwkmx/L5/m/orTSMIwk8wJ8Cw67Ntq
 QGwzeN/d2PsP6K0X6O+HkF2o5i1wgyPlur02YgQtUBuC/LnJlQce4E9nN4vV1CA6My5b
 bLGgTtYu4mQNh5H8GFJpEwuX1hZ/+wr21Gkx8BLbx0hXBhD8M7zbInjbaltT8Ww1uU0e
 6GvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNTKM7qTS4aE8M0FJnGCUrahYzYmmwD6Kl4VK2wbP3XNIse1pALCLbTpXZNvnoebE/SqGkuTI/fQ==@nongnu.org
X-Gm-Message-State: AOJu0YzCypU8b3g5MsyNxaheawP+6g/nElUB03/1wSVC+se898UhbViA
 vomQr30OvJTT3Z1br65Wio/rVntmee7QQy8L3dL3CBX5+hkeWqwTh7FkgGTmxMiPMD6WGEWs6io
 Ze3j+hYiSqZoIWDdr61p8aXnCzvC7FiH4U7dvmcpaNZMissEytE705w==
X-Gm-Gg: ASbGncs0A/XF4+CHP7u0kegXkUfqXtz61o+7M9Icg9RiFPZkHBY66NLmZZqX2yKuqsf
 ENmDLKzVvXebYVKg4hDFSoU5baaKyTz7i1F4kDIJkGE7VsatKbMmR/VS9hpDog226DheBESQLKz
 FHTNlFIGLiTqHch6+1UkhpwQTwnBdYXReTkjJpxfBIziiPeHSrTqz8VfaXLSozSIUpzbLuwHnqO
 NTd9iF6L9TiM7gxAxjAhKMHoAFnUE3bH36XGhUmclfLcp6++eJUOSACW0rsXnXjNhWwtUAsStwi
 dfK3RbpBgBvrzS9+MLlujKnAu49lTbUb2gWsfzU26m5TVAopxp8pr6JfL35ZGYKH1O5oY/8FItS
 P04492kzbv8E7wr42CfK3Tw/9raGOChowb+x2z74=
X-Received: by 2002:a05:6a00:390b:b0:7a3:455e:3fa5 with SMTP id
 d2e1a72fcca58-7a441a6b2d6mr3763846b3a.0.1761652802138; 
 Tue, 28 Oct 2025 05:00:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7jLcl3BwUsZw2GZKIXUQprSTcb8XYlTMRUM+SeaCPvNbrqgHCfsF3c+OuxaLkZYgY1roLsw==
X-Received: by 2002:a05:6a00:390b:b0:7a3:455e:3fa5 with SMTP id
 d2e1a72fcca58-7a441a6b2d6mr3763802b3a.0.1761652801567; 
 Tue, 28 Oct 2025 05:00:01 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a41404d760sm11311555b3a.39.2025.10.28.04.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 05:00:01 -0700 (PDT)
Message-ID: <b892de03-dae9-4256-8219-7df9bc93b0bd@redhat.com>
Date: Tue, 28 Oct 2025 21:59:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V6 08/24] arm/virt, gicv3: Guard CPU interface access
 for admin disabled vCPUs
To: salil.mehta@opnsrc.net, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com
Cc: salil.mehta@huawei.com, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org, imammedo@redhat.com,
 armbru@redhat.com, andrew.jones@linux.dev, david@redhat.com,
 philmd@linaro.org, eric.auger@redhat.com, will@kernel.org, ardb@kernel.org,
 oliver.upton@linux.dev, pbonzini@redhat.com, rafael@kernel.org,
 borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 gustavo.romero@linaro.org, npiggin@gmail.com, harshpb@linux.ibm.com,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 gankulkarni@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, wangzhou1@hisilicon.com, linuxarm@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 shahuang@redhat.com, zhao1.liu@intel.com
References: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
 <20251001010127.3092631-9-salil.mehta@opnsrc.net>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251001010127.3092631-9-salil.mehta@opnsrc.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5D5wIHJ88X2tScAHnfeddMIwT-Z6RNUxukcqF0mRn3E_1761652802
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Salil,

On 10/1/25 11:01 AM, salil.mehta@opnsrc.net wrote:
> From: Salil Mehta <salil.mehta@huawei.com>
> 
> Per Arm GIC Architecture Specification (IHI0069H_b, §11.1), the CPU interface
> and its Processing Element (PE) share a power domain. If the PE is powered down
> or administratively disabled, the CPU interface must be quiescent or off, and
> any access is architecturally UNPREDICTABLE. Without explicit checks, QEMU may
> issue GICC register operations for vCPUs that are offline, removed, or
> otherwise unavailable—risking inconsistent state or undefined behavior in both
> TCG and KVM accelerators.
> 
> To address this, introduce a per-vCPU gicc_accessible flag that reflects the
> administrative enablement of the corresponding QOM vCPU in accordance with the
> policy. This is permissible when the GICC (GIC CPU Interface) is online-capable,
> meaning vCPUs can be brought online in the guest kernel after boot. The flag is
> set during GIC realization and used to skip VGIC register reads/writes, SGI
> generation, and CPU interface updates when the GICC is not accessible. This
> prevents unsafe operations and ensures compliance when managing administratively
> disabled but present vCPUs.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/core/qdev.c                     | 26 +++++++++++++++++
>   hw/intc/arm_gicv3_common.c         | 23 +++++++++++++++
>   hw/intc/arm_gicv3_cpuif.c          |  8 +++++
>   hw/intc/arm_gicv3_cpuif_common.c   | 47 ++++++++++++++++++++++++++++++
>   hw/intc/arm_gicv3_kvm.c            | 18 ++++++++++++
>   include/hw/intc/arm_gicv3_common.h | 24 +++++++++++++++
>   include/hw/qdev-core.h             | 24 +++++++++++++++
>   7 files changed, 170 insertions(+)
> 
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 5816abae39..8e9a4da6b5 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -326,6 +326,32 @@ bool qdev_disable(DeviceState *dev, BusState *bus, Error **errp)
>                                      errp);
>   }
>   
> +int qdev_get_admin_power_state(DeviceState *dev)
> +{
> +    DeviceClass *dc;
> +
> +    if (!dev) {
> +        return DEVICE_ADMIN_POWER_STATE_REMOVED;
> +    }
> +
> +    dc = DEVICE_GET_CLASS(dev);
> +    if (dc->admin_power_state_supported) {
> +        return object_property_get_enum(OBJECT(dev), "admin_power_state",
> +                                        "DeviceAdminPowerState", NULL);
> +    }
> +
> +    return DEVICE_ADMIN_POWER_STATE_ENABLED;
> +}
> +
> +bool qdev_check_enabled(DeviceState *dev)
> +{
> +   /*
> +    * if device supports power state transitions, check if it is not in
> +    * 'disabled' state.
> +    */
> +    return qdev_get_admin_power_state(dev) == DEVICE_ADMIN_POWER_STATE_ENABLED;
> +}
> +
>   bool qdev_machine_modified(void)
>   {
>       return qdev_hot_added || qdev_hot_removed;
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index f6a9f1c68b..f4428ad165 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -439,6 +439,29 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>           CPUState *cpu = machine_get_possible_cpu(i);
>           uint64_t cpu_affid;
>   
> +        /*
> +         * Ref: Arm Generic Interrupt Controller Architecture Specification
> +         * (GIC Architecture version 3 and version 4), IHI0069H_b,
> +         * Section 11.1: Power Management
> +         * https://developer.arm.com/documentation/ihi0069
> +         *
> +         * According to this specification, the CPU interface and the
> +         * Processing Element (PE) must reside in the same power domain.
> +         * Therefore, when a CPU/PE is powered off, its corresponding CPU
> +         * interface must also be in the off state or in a quiescent state—
> +         * depending on the state of the associated Redistributor.
> +         *
> +         * The Redistributor may reside in a separate power domain and may
> +         * remain powered even when the associated PE is turned off.
> +         *
> +         * Accessing the GIC CPU interface while the PE is powered down can
> +         * lead to UNPREDICTABLE behavior.
> +         *
> +         * Accordingly, the QOM object `GICv3CPUState` should be marked as
> +         * either accessible or inaccessible based on the power state of the
> +         * associated `CPUState` vCPU.
> +         */
> +        s->cpu[i].gicc_accessible = qdev_check_enabled(DEVICE(cpu));
>           s->cpu[i].cpu = cpu;
>           s->cpu[i].gic = s;
>           /* Store GICv3CPUState in CPUARMState gicv3state pointer */
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index a7904237ac..6430b2c649 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -1052,6 +1052,10 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
>       ARMCPU *cpu = ARM_CPU(cs->cpu);
>       CPUARMState *env = &cpu->env;
>   
> +    if (!gicv3_gicc_accessible(OBJECT(cs->gic), CPU(cpu)->cpu_index)) {
> +        return;
> +    }
> +
>       g_assert(bql_locked());
>   
>       trace_gicv3_cpuif_update(gicv3_redist_affid(cs), cs->hppi.irq,
> @@ -2036,6 +2040,10 @@ static void icc_generate_sgi(CPUARMState *env, GICv3CPUState *cs,
>       for (i = 0; i < s->num_cpu; i++) {
>           GICv3CPUState *ocs = &s->cpu[i];
>   
> +        if (!gicv3_gicc_accessible(OBJECT(s), i)) {
> +            continue;
> +        }
> +
>           if (irm) {
>               /* IRM == 1 : route to all CPUs except self */
>               if (cs == ocs) {
> diff --git a/hw/intc/arm_gicv3_cpuif_common.c b/hw/intc/arm_gicv3_cpuif_common.c
> index f9a9b2d8a3..8f9a5b6fa2 100644
> --- a/hw/intc/arm_gicv3_cpuif_common.c
> +++ b/hw/intc/arm_gicv3_cpuif_common.c
> @@ -12,6 +12,9 @@
>   #include "qemu/osdep.h"
>   #include "gicv3_internal.h"
>   #include "cpu.h"
> +#include "qemu/log.h"
> +#include "monitor/monitor.h"
> +#include "qapi/visitor.h"
>   
>   void gicv3_set_gicv3state(CPUState *cpu, GICv3CPUState *s)
>   {
> @@ -21,6 +24,41 @@ void gicv3_set_gicv3state(CPUState *cpu, GICv3CPUState *s)
>       env->gicv3state = (void *)s;
>   };
>   
> +static void
> +gicv3_get_gicc_accessibility(Object *obj, Visitor *v, const char *name,
> +                             void *opaque, Error **errp)
> +{
> +    GICv3CPUState *cs = (GICv3CPUState *)opaque;
> +    bool value = cs->gicc_accessible;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static void
> +gicv3_set_gicc_accessibility(Object *obj, Visitor *v, const char *name,
> +                             void *opaque, Error **errp)
> +{
> +    GICv3CPUState *gcs = opaque;
> +    CPUState *cs = gcs->cpu;
> +    bool value;
> +
> +    visit_type_bool(v, name, &value, errp);
> +
> +    /* Block external attempts to set */
> +    if (monitor_cur_is_qmp()) {
> +        error_setg(errp, "Property 'gicc-accessible' is read-only externally");
> +        return;
> +    }
> +
> +    if (gcs->gicc_accessible != value) {
> +        gcs->gicc_accessible = value;
> +
> +        qemu_log_mask(LOG_UNIMP,
> +                      "GICC accessibility changed: vCPU %d = %s\n",
> +                      cs->cpu_index, value ? "accessible" : "inaccessible");
> +    }
> +}
> +
>   void gicv3_init_cpuif(GICv3State *s)
>   {
>       ARMGICv3CommonClass *agcc = ARM_GICV3_COMMON_GET_CLASS(s);
> @@ -28,6 +66,15 @@ void gicv3_init_cpuif(GICv3State *s)
>   
>       /* define and register `system registers` with the vCPU  */
>       for (i = 0; i < s->num_cpu; i++) {
> +        g_autofree char *propname = g_strdup_printf("gicc-accessible[%d]", i);
> +        object_property_add(OBJECT(s), propname, "bool",
> +                            gicv3_get_gicc_accessibility,
> +                            gicv3_set_gicc_accessibility,
> +                            NULL, &s->cpu[i]);
> +
> +        object_property_set_description(OBJECT(s), propname,
> +            "Per-vCPU GICC interface accessibility (internal set only)");
> +
>           agcc->init_cpu_reginfo(s->cpu[i].cpu);
>       }
>   }
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 4ca889da45..e97578f59a 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -457,6 +457,16 @@ static void kvm_arm_gicv3_put(GICv3State *s)
>           GICv3CPUState *c = &s->cpu[ncpu];
>           int num_pri_bits;
>   
> +        /*
> +         * We must ensure that we do not attempt to access or update KVM GICC
> +         * registers if their corresponding QOM `GICv3CPUState` is marked as
> +         * 'inaccessible', because their corresponding QOM vCPU objects
> +         * are in administratively 'disabled' state.
> +         */
> +        if (!gicv3_gicc_accessible(OBJECT(s), ncpu)) {
> +            continue;
> +        }
> +
>           kvm_gicc_access(s, ICC_SRE_EL1, ncpu, &c->icc_sre_el1, true);
>           kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
>                           &c->icc_ctlr_el1[GICV3_NS], true);
> @@ -615,6 +625,14 @@ static void kvm_arm_gicv3_get(GICv3State *s)
>           GICv3CPUState *c = &s->cpu[ncpu];
>           int num_pri_bits;
>   
> +        /*
> +         * don't attempt to access KVM VGIC for the disabled vCPUs where
> +         * GICv3CPUState is inaccessible.
> +         */
> +        if (!gicv3_gicc_accessible(OBJECT(s), ncpu)) {
> +            continue;
> +        }
> +
>           kvm_gicc_access(s, ICC_SRE_EL1, ncpu, &c->icc_sre_el1, false);
>           kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
>                           &c->icc_ctlr_el1[GICV3_NS], false);

Shall the GICC accessible state is also checked in arm_gicv3.c? If I'm
understanding correctly, the vCPU hotplug feature is also supported for
TCG mode when mttcg is enabled, as implemented in PATCH[3].

     if ((tcg_enabled() && !qemu_tcg_mttcg_enabled()) || hvf_enabled() ||
         qtest_enabled() || vms->gic_version == VIRT_GIC_VERSION_2) {
         max_cpus = machine->smp.max_cpus = smp_cpus;
         if (mc->has_online_capable_cpus) {
             if (vms->gic_version == VIRT_GIC_VERSION_2) {
                 warn_report("GICv2 does not support online-capable CPUs");
             }
             mc->has_online_capable_cpus = false;
         }
     }


Thanks,
Gavin

> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 3720728227..bbf899184e 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -27,6 +27,7 @@
>   #include "hw/sysbus.h"
>   #include "hw/intc/arm_gic_common.h"
>   #include "qom/object.h"
> +#include "qapi/error.h"
>   
>   /*
>    * Maximum number of possible interrupts, determined by the GIC architecture.
> @@ -164,6 +165,7 @@ struct GICv3CPUState {
>       uint64_t icc_apr[3][4];
>       uint64_t icc_igrpen[3];
>       uint64_t icc_ctlr_el3;
> +    bool gicc_accessible;
>   
>       /* Virtualization control interface */
>       uint64_t ich_apr[3][4]; /* ich_apr[GICV3_G1][x] never used */
> @@ -329,4 +331,26 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
>    */
>   const char *gicv3_class_name(void);
>   
> +/**
> + * gicv3_gicc_accessible:
> + * @obj: QOM object implementing the GICv3 device
> + * @cpu: Index of the vCPU whose GICC accessibility is being queried
> + *
> + * Returns: true if the GICC interface for vCPU @cpu is accessible.
> + * Uses QOM property lookup for "gicc-accessible[%d]".
> + */
> +static inline bool gicv3_gicc_accessible(Object *obj, int cpu)
> +{
> +    g_autofree gchar *propname = g_strdup_printf("gicc-accessible[%d]", cpu);
> +    Error *local_err = NULL;
> +    bool value;
> +
> +    value = object_property_get_bool(obj, propname, &local_err);
> +    if (local_err) {
> +        error_report_err(local_err);
> +        return false;
> +    }
> +
> +    return value;
> +}
>   #endif
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 2c22b32a3f..b1d3fa4a25 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -589,6 +589,30 @@ bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
>    */
>   bool qdev_disable(DeviceState *dev, BusState *bus, Error **errp);
>   
> +/**
> + * qdev_check_enabled - Check if a device is administratively enabled
> + * @dev:  The device to check
> + *
> + * This function returns whether the device is currently in administrative
> + * ENABLED state. It does not reflect runtime operational power state, but
> + * rather the host policy on whether the guest may interact with the device.
> + *
> + * Returns true if the device is administratively enabled; false otherwise.
> + */
> +bool qdev_check_enabled(DeviceState *dev);
> +
> +/**
> + * qdev_get_admin_power_state - Query administrative power state of a device
> + * @dev:  The device whose state is being queried
> + *
> + * Returns the current administrative power state (ENABLED or DISABLED),
> + * as stored in the device's internal admin state field. This reflects
> + * host-level policy—not the operational runtime state seen by the guest.
> + *
> + * Returns an integer from the DeviceAdminPowerState enum.
> + */
> +int qdev_get_admin_power_state(DeviceState *dev);
> +
>   /**
>    * qdev_unrealize: Unrealize a device
>    * @dev: device to unrealize



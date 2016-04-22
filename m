Received: by 10.25.208.194 with SMTP id h185csp776370lfg;
        Fri, 22 Apr 2016 06:41:43 -0700 (PDT)
X-Received: by 10.55.21.34 with SMTP id f34mr10176458qkh.101.1461332503175;
        Fri, 22 Apr 2016 06:41:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r84si870072qhr.96.2016.04.22.06.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 06:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atbL4-0005N5-P3
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 09:41:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1atbL0-0005FX-2H
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 09:41:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1atbKv-000748-BP
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 09:41:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56743)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1atbKv-00073T-4p; Fri, 22 Apr 2016 09:41:33 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A91FB3B72E;
	Fri, 22 Apr 2016 13:41:32 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-112.brq.redhat.com [10.34.1.112])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3MDfSNr014868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 22 Apr 2016 09:41:31 -0400
Date: Fri, 22 Apr 2016 15:41:28 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160422134128.tpb52mpl3mlybqff@hawk.localdomain>
References: <1458899181-17896-1-git-send-email-zhaoshenglong@huawei.com>
	<1458899181-17896-2-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1458899181-17896-2-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] target-arm: kvm64: set
 guest PMUv3 feature bit if supported
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AnJoIK3aIxWe

On Fri, Mar 25, 2016 at 05:46:19PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Check if kvm supports guest PMUv3. If so, set the corresponding feature
> bit for vcpu.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  linux-headers/asm-arm64/kvm.h | 6 ++++++
>  linux-headers/linux/kvm.h     | 2 ++

The above two files should be updated with their own patch and not
manually. Update with scripts/update-linux-headers.sh

>  target-arm/cpu-qom.h          | 2 ++
>  target-arm/kvm64.c            | 5 +++++
>  4 files changed, 15 insertions(+)
> 
> diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
> index a2fd4d9..3097f2f 100644
> --- a/linux-headers/asm-arm64/kvm.h
> +++ b/linux-headers/asm-arm64/kvm.h
> @@ -94,6 +94,7 @@ struct kvm_regs {
>  #define KVM_ARM_VCPU_POWER_OFF		0 /* CPU is started in OFF state */
>  #define KVM_ARM_VCPU_EL1_32BIT		1 /* CPU running a 32bit VM */
>  #define KVM_ARM_VCPU_PSCI_0_2		2 /* CPU uses PSCI v0.2 */
> +#define KVM_ARM_VCPU_PMU_V3		3
>  
>  struct kvm_vcpu_init {
>  	__u32 target;
> @@ -204,6 +205,11 @@ struct kvm_arch_memory_slot {
>  #define KVM_DEV_ARM_VGIC_GRP_CTRL	4
>  #define   KVM_DEV_ARM_VGIC_CTRL_INIT	0
>  
> +/* Device Control API on vcpu fd */
> +#define KVM_ARM_VCPU_PMU_V3_CTRL	0
> +#define   KVM_ARM_VCPU_PMU_V3_IRQ	0
> +#define   KVM_ARM_VCPU_PMU_V3_INIT	1
> +
>  /* KVM_IRQ_LINE irq field index values */
>  #define KVM_ARM_IRQ_TYPE_SHIFT		24
>  #define KVM_ARM_IRQ_TYPE_MASK		0xff
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 4a56b9e..104210a 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -856,6 +856,8 @@ struct kvm_ppc_smmu_info {
>  #define KVM_CAP_IOEVENTFD_ANY_LENGTH 122
>  #define KVM_CAP_HYPERV_SYNIC 123
>  #define KVM_CAP_S390_RI 124
> +#define KVM_CAP_ARM_PMU_V3 125
> +#define KVM_CAP_VCPU_ATTRIBUTES 126

These defines are wrong, but will be fixed with update-linux-headers

>  
>  #ifdef KVM_CAP_IRQ_ROUTING
>  
> diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
> index 1061c08..93aa6a4 100644
> --- a/target-arm/cpu-qom.h
> +++ b/target-arm/cpu-qom.h
> @@ -105,6 +105,8 @@ typedef struct ARMCPU {
>      bool powered_off;
>      /* CPU has security extension */
>      bool has_el3;
> +    /* CPU has PMU (Performance Monitor Unit) */
> +    bool has_pmu;
>  
>      /* CPU has memory protection unit */
>      bool has_mpu;
> diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
> index e8527bf..b364789 100644
> --- a/target-arm/kvm64.c
> +++ b/target-arm/kvm64.c
> @@ -461,6 +461,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
>      }
> +    if (kvm_irqchip_in_kernel() &&
> +        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
> +        cpu->has_pmu = true;
> +        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
> +    }
>  
>      /* Do KVM_ARM_VCPU_INIT ioctl */
>      ret = kvm_arm_vcpu_init(cs);
> -- 
> 2.0.4
>

Otherwise looks good.

drew 

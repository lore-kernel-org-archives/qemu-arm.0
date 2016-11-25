Received: by 10.25.150.194 with SMTP id y185csp188157lfd;
        Thu, 24 Nov 2016 23:58:06 -0800 (PST)
X-Received: by 10.55.73.148 with SMTP id w142mr5947772qka.284.1480060686330;
        Thu, 24 Nov 2016 23:58:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si24644764qke.298.2016.11.24.23.58.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Nov 2016 23:58:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cABOX-0004eY-Rn
	for alex.bennee@linaro.org; Fri, 25 Nov 2016 02:58:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cABOU-0004eL-B7
	for qemu-arm@nongnu.org; Fri, 25 Nov 2016 02:58:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cABOP-0000dy-Cu
	for qemu-arm@nongnu.org; Fri, 25 Nov 2016 02:58:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44628)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cABOP-0000de-40; Fri, 25 Nov 2016 02:57:57 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EFC13B713;
	Fri, 25 Nov 2016 07:57:55 +0000 (UTC)
Received: from localhost.localdomain (vpn1-6-45.ams2.redhat.com [10.36.6.45])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uAP7vpIu009273
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 25 Nov 2016 02:57:53 -0500
To: vijay.kilari@gmail.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	pbonzini@redhat.com, rth@twiddle.net
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
	<1479904764-15532-2-git-send-email-vijay.kilari@gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <02c5cf76-e3c0-5496-dfb3-d933e540d7d7@redhat.com>
Date: Fri, 25 Nov 2016 08:57:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479904764-15532-2-git-send-email-vijay.kilari@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 25 Nov 2016 07:57:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 1/4] kernel: Add definitions
 for GICv3 attributes
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
Cc: marc.zyngier@arm.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	christoffer.dall@linaro.org, Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0ZrcjBVSYPrZ

Hi Vijay,

On 23/11/2016 13:39, vijay.kilari@gmail.com wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> 
> This temporary patch adds kernel API definitions. Use proper header update
> procedure after these features are released.

Did you send the complete v6 series? I only see 1/4 and 4/4 of this v6
(https://lists.gnu.org/archive/html/qemu-devel/2016-11/threads.html#04318)?
Did I miss something?

Thanks

Eric
> 
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> Signed-off-by: Vijaya Kumamr K <Vijaya.Kumar@cavium.com>
> ---
>  linux-headers/asm-arm/kvm.h   | 13 +++++++++++++
>  linux-headers/asm-arm64/kvm.h | 13 +++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
> index 541268c..e3dd0e1 100644
> --- a/linux-headers/asm-arm/kvm.h
> +++ b/linux-headers/asm-arm/kvm.h
> @@ -172,10 +172,23 @@ struct kvm_arch_memory_slot {
>  #define KVM_DEV_ARM_VGIC_GRP_CPU_REGS	2
>  #define   KVM_DEV_ARM_VGIC_CPUID_SHIFT	32
>  #define   KVM_DEV_ARM_VGIC_CPUID_MASK	(0xffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
> +#define   KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT 32
> +#define   KVM_DEV_ARM_VGIC_V3_MPIDR_MASK \
> +                       (0xffffffffULL << KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT)
>  #define   KVM_DEV_ARM_VGIC_OFFSET_SHIFT	0
>  #define   KVM_DEV_ARM_VGIC_OFFSET_MASK	(0xffffffffULL << KVM_DEV_ARM_VGIC_OFFSET_SHIFT)
> +#define   KVM_DEV_ARM_VGIC_SYSREG_INSTR_MASK (0xffff)
>  #define KVM_DEV_ARM_VGIC_GRP_NR_IRQS	3
>  #define KVM_DEV_ARM_VGIC_GRP_CTRL       4
> +#define KVM_DEV_ARM_VGIC_GRP_REDIST_REGS 5
> +#define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
> +#define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO 7
> +#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT 10
> +#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
> +                       (0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
> +#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INTID_MASK 0x3ff
> +#define VGIC_LEVEL_INFO_LINE_LEVEL     0
> +
>  #define   KVM_DEV_ARM_VGIC_CTRL_INIT    0
>  
>  /* KVM_IRQ_LINE irq field index values */
> diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
> index fd5a276..6698bdd 100644
> --- a/linux-headers/asm-arm64/kvm.h
> +++ b/linux-headers/asm-arm64/kvm.h
> @@ -201,10 +201,23 @@ struct kvm_arch_memory_slot {
>  #define KVM_DEV_ARM_VGIC_GRP_CPU_REGS	2
>  #define   KVM_DEV_ARM_VGIC_CPUID_SHIFT	32
>  #define   KVM_DEV_ARM_VGIC_CPUID_MASK	(0xffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
> +#define   KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT 32
> +#define   KVM_DEV_ARM_VGIC_V3_MPIDR_MASK \
> +                       (0xffffffffULL << KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT)
>  #define   KVM_DEV_ARM_VGIC_OFFSET_SHIFT	0
>  #define   KVM_DEV_ARM_VGIC_OFFSET_MASK	(0xffffffffULL << KVM_DEV_ARM_VGIC_OFFSET_SHIFT)
> +#define   KVM_DEV_ARM_VGIC_SYSREG_INSTR_MASK (0xffff)
>  #define KVM_DEV_ARM_VGIC_GRP_NR_IRQS	3
>  #define KVM_DEV_ARM_VGIC_GRP_CTRL	4
> +#define KVM_DEV_ARM_VGIC_GRP_REDIST_REGS 5
> +#define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
> +#define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO 7
> +#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT 10
> +#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
> +                       (0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
> +#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INTID_MASK 0x3ff
> +#define VGIC_LEVEL_INFO_LINE_LEVEL	0
> +
>  #define   KVM_DEV_ARM_VGIC_CTRL_INIT	0
>  
>  /* Device Control API on vcpu fd */
> 

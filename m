Received: by 10.25.150.194 with SMTP id y185csp208970lfd;
        Fri, 25 Nov 2016 00:42:25 -0800 (PST)
X-Received: by 10.200.40.204 with SMTP id j12mr5666588qtj.284.1480063345456;
        Fri, 25 Nov 2016 00:42:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h25si17386217qtb.218.2016.11.25.00.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Nov 2016 00:42:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44680 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cAC5Q-0004gh-Tq
	for alex.bennee@linaro.org; Fri, 25 Nov 2016 03:42:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cAC5L-0004gP-W4
	for qemu-arm@nongnu.org; Fri, 25 Nov 2016 03:42:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cAC5H-0000Si-1u
	for qemu-arm@nongnu.org; Fri, 25 Nov 2016 03:42:20 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:34227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cAC5G-0000R8-UH; Fri, 25 Nov 2016 03:42:15 -0500
Received: by mail-oi0-x243.google.com with SMTP id m75so4387669oig.1;
	Fri, 25 Nov 2016 00:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OdFXv5KZwwhhVyhF/x09vOIpVt5El1Ql1w7C8WJhyLQ=;
	b=JOjWodRHNGa3EXskYOFpKP2vLTn3WQXq+7bbo9b5kqtp/PLgdeA0/E/smF1KDOW4al
	45mhUvqL+dmZeyzStCHtE46u5Ki6rcVngQhW7ptQ4rwcxag98rAsAfFgtCwJZMn+1910
	GZGW3POzbrILSYrGDMrhc0LO9Aq4mdPRZVrbBsDT7d8GGzt+GfhurXY7bfgnT5PkI0ma
	YK4oWNDSuEOxl2sLundXibvJom1hnbsK+UfPYfxuDDhq0mXxlbuQcbymlj+8LI3OuUa1
	Ezzh48fViNk8hqtvZNcMO25F+vQ8sUl46P5qW/1XrH+OhyAZSzxpCb46doKBR0CxgeEG
	pPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OdFXv5KZwwhhVyhF/x09vOIpVt5El1Ql1w7C8WJhyLQ=;
	b=ATLBjPVdasnTU26jikDRgMdhqZOujkr7HdFmu1cdEl1WOfV2HIB8vlfYMN9niOD5F5
	dSvaEqQfRFqp/R7wa0AXkO860Vw0V6owe6gYGmPZFPiRV74DD2qMGkZnR0yA3Fn+Ecpa
	hdAhyaPzq9BrFkpW7nZ2tKs8YX0Fw8rwPCg2dm2knrNLkQdzFzMGXEpA2GODwYreqWUx
	1mJcIBnHPAGlwJBZRuiCcvHXoUkhudNd9Tx8TgDVz5KLKoJTeN+FS0V4XoINqN5xneeX
	nF+XMMMCTw+/34yj6ruz47waRpz40GfYkzOj+qH9ACsG6df1nZtoSrqdbQVO1kFpqLC5
	LyTw==
X-Gm-Message-State: AKaTC001P5A9pdfs2j3AMkanb+Bxcog6b8RGkylV83qM/RT/WBJhwNF3Xm49QbCRvHkqX0xD2ZgC4eMcduyENQ==
X-Received: by 10.157.27.16 with SMTP id l16mr3754287otl.262.1480063333296;
	Fri, 25 Nov 2016 00:42:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.54.233 with HTTP; Fri, 25 Nov 2016 00:42:12 -0800 (PST)
In-Reply-To: <02c5cf76-e3c0-5496-dfb3-d933e540d7d7@redhat.com>
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
	<1479904764-15532-2-git-send-email-vijay.kilari@gmail.com>
	<02c5cf76-e3c0-5496-dfb3-d933e540d7d7@redhat.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Fri, 25 Nov 2016 14:12:12 +0530
Message-ID: <CALicx6vPJ9ZruSdm=w1LPWZdgrAxJVN2o9ktCYHFA8TbyakDSw@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::243
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fxvf8GqisVmc

On Fri, Nov 25, 2016 at 1:27 PM, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Vijay,
>
> On 23/11/2016 13:39, vijay.kilari@gmail.com wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>
>> This temporary patch adds kernel API definitions. Use proper header update
>> procedure after these features are released.
>
> Did you send the complete v6 series? I only see 1/4 and 4/4 of this v6
> (https://lists.gnu.org/archive/html/qemu-devel/2016-11/threads.html#04318)?
> Did I miss something?

Strange!. Yes, I have sent complete series.

>
> Thanks
>
> Eric
>>
>> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
>> Signed-off-by: Vijaya Kumamr K <Vijaya.Kumar@cavium.com>
>> ---
>>  linux-headers/asm-arm/kvm.h   | 13 +++++++++++++
>>  linux-headers/asm-arm64/kvm.h | 13 +++++++++++++
>>  2 files changed, 26 insertions(+)
>>
>> diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
>> index 541268c..e3dd0e1 100644
>> --- a/linux-headers/asm-arm/kvm.h
>> +++ b/linux-headers/asm-arm/kvm.h
>> @@ -172,10 +172,23 @@ struct kvm_arch_memory_slot {
>>  #define KVM_DEV_ARM_VGIC_GRP_CPU_REGS        2
>>  #define   KVM_DEV_ARM_VGIC_CPUID_SHIFT       32
>>  #define   KVM_DEV_ARM_VGIC_CPUID_MASK        (0xffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
>> +#define   KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT 32
>> +#define   KVM_DEV_ARM_VGIC_V3_MPIDR_MASK \
>> +                       (0xffffffffULL << KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT)
>>  #define   KVM_DEV_ARM_VGIC_OFFSET_SHIFT      0
>>  #define   KVM_DEV_ARM_VGIC_OFFSET_MASK       (0xffffffffULL << KVM_DEV_ARM_VGIC_OFFSET_SHIFT)
>> +#define   KVM_DEV_ARM_VGIC_SYSREG_INSTR_MASK (0xffff)
>>  #define KVM_DEV_ARM_VGIC_GRP_NR_IRQS 3
>>  #define KVM_DEV_ARM_VGIC_GRP_CTRL       4
>> +#define KVM_DEV_ARM_VGIC_GRP_REDIST_REGS 5
>> +#define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
>> +#define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO 7
>> +#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT 10
>> +#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
>> +                       (0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
>> +#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INTID_MASK 0x3ff
>> +#define VGIC_LEVEL_INFO_LINE_LEVEL     0
>> +
>>  #define   KVM_DEV_ARM_VGIC_CTRL_INIT    0
>>
>>  /* KVM_IRQ_LINE irq field index values */
>> diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
>> index fd5a276..6698bdd 100644
>> --- a/linux-headers/asm-arm64/kvm.h
>> +++ b/linux-headers/asm-arm64/kvm.h
>> @@ -201,10 +201,23 @@ struct kvm_arch_memory_slot {
>>  #define KVM_DEV_ARM_VGIC_GRP_CPU_REGS        2
>>  #define   KVM_DEV_ARM_VGIC_CPUID_SHIFT       32
>>  #define   KVM_DEV_ARM_VGIC_CPUID_MASK        (0xffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
>> +#define   KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT 32
>> +#define   KVM_DEV_ARM_VGIC_V3_MPIDR_MASK \
>> +                       (0xffffffffULL << KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT)
>>  #define   KVM_DEV_ARM_VGIC_OFFSET_SHIFT      0
>>  #define   KVM_DEV_ARM_VGIC_OFFSET_MASK       (0xffffffffULL << KVM_DEV_ARM_VGIC_OFFSET_SHIFT)
>> +#define   KVM_DEV_ARM_VGIC_SYSREG_INSTR_MASK (0xffff)
>>  #define KVM_DEV_ARM_VGIC_GRP_NR_IRQS 3
>>  #define KVM_DEV_ARM_VGIC_GRP_CTRL    4
>> +#define KVM_DEV_ARM_VGIC_GRP_REDIST_REGS 5
>> +#define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
>> +#define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO 7
>> +#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT 10
>> +#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
>> +                       (0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
>> +#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INTID_MASK 0x3ff
>> +#define VGIC_LEVEL_INFO_LINE_LEVEL   0
>> +
>>  #define   KVM_DEV_ARM_VGIC_CTRL_INIT 0
>>
>>  /* Device Control API on vcpu fd */
>>

Received: by 10.25.150.194 with SMTP id y185csp1709103lfd;
        Mon, 28 Nov 2016 04:01:57 -0800 (PST)
X-Received: by 10.55.215.220 with SMTP id t89mr17697833qkt.27.1480334517396;
        Mon, 28 Nov 2016 04:01:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 60si24456320qtc.74.2016.11.28.04.01.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Nov 2016 04:01:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58131 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBKdA-0008Cw-7b
	for alex.bennee@linaro.org; Mon, 28 Nov 2016 07:01:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cBKcz-0008BK-F7
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 07:01:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cBKcy-0006qe-Mk
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 07:01:45 -0500
Received: from mail-ua0-x234.google.com ([2607:f8b0:400c:c08::234]:36467)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cBKcy-0006qH-HN
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 07:01:44 -0500
Received: by mail-ua0-x234.google.com with SMTP id b35so139933201uaa.3
	for <qemu-arm@nongnu.org>; Mon, 28 Nov 2016 04:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mQ7E3RbMXULPek1UKYEh8Qlrd4LAKGGQBlLY/aWRpOw=;
	b=ZxpwDXPwjLMzcO9IjWBhX9s8Tc+Jvq5Z3dwaxtKbVkOtEnOXKz8yZZCK+3vKaS3g5G
	GSJKyvryP45JeKJhiP7AqHEH7B6sj0w9HIMPj5o8iIqoNBHLFAagD+ItJbrKWObm6arQ
	T9zzIM4mgJqNpnVLGoAm2llqyV87Q7jmudxBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mQ7E3RbMXULPek1UKYEh8Qlrd4LAKGGQBlLY/aWRpOw=;
	b=bZRMg7FvZVcAla6OD1pdrhR1XebtMlpP2oWtodLfCXuCZtQUMpvHUw6xnO9Dkfkird
	VHxvEZwRSzVXcUcwyiv3Wg3Ug/xj43vlXb06AvMMjXMAOngd9tnaEsVrgmSUkgv6xXBq
	/CHHFRKCVs7Oak0FTz74qSI1gZ/1wxVXRmKt7FeaBPtlksjZN/OrAQ1BegHzjiltI5WL
	i0Srf/l8e5n9FXhfkxiXx6IzgVq2FHznWFczhJjlH49qB+d9GL7w0XPsCqqNw3oRg4WN
	jjWlMEqPgo/UbpANypEhOonYNGwMQp9WGdwHAurJLMIrkmJeUbD6o3p3ZJOcVWQUzeOj
	I0cA==
X-Gm-Message-State: AKaTC01I0xZUpjjcy27T2MOoDUGWhwl77oip3kyvKYZMvsh9NiMLBlXUPMdAYgh3Bs8aF7u6tBZ4Stuh222ty0v2
X-Received: by 10.176.83.12 with SMTP id x12mr16165046uax.131.1480334503290;
	Mon, 28 Nov 2016 04:01:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.185.4 with HTTP; Mon, 28 Nov 2016 04:01:22 -0800 (PST)
In-Reply-To: <CAFEAcA-SfGLuDwwDwFSPwrN87=3U+9ByxdTa899b9D3xA0kFnQ@mail.gmail.com>
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
	<1479904764-15532-4-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA-SfGLuDwwDwFSPwrN87=3U+9ByxdTa899b9D3xA0kFnQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Nov 2016 12:01:22 +0000
Message-ID: <CAFEAcA9zE9atZ2qfJMaVd0NSeAHz+LtsH6OrDMpC45mVG2uNNQ@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::234
Subject: Re: [Qemu-arm] [PATCH v6 3/4] hw/intc/arm_gicv3_kvm: Save and
 Restore ICC_SRE_EL1 register
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a5qdJOJIfKN3

On 28 November 2016 at 11:54, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 23 November 2016 at 12:39,  <vijay.kilari@gmail.com> wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>
>> Save and Restore ICC_SRE_EL1 register. ICC_SRE_EL1 register
>> value is used by kernel to check if SRE bit is set or not.
>>
>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>> ---
>>  hw/intc/arm_gicv3_kvm.c            | 4 ++++
>>  include/hw/intc/arm_gicv3_common.h | 1 +
>>  2 files changed, 5 insertions(+)
>>
>> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
>> index a317fbf..77af32d 100644
>> --- a/hw/intc/arm_gicv3_kvm.c
>> +++ b/hw/intc/arm_gicv3_kvm.c
>> @@ -65,6 +65,8 @@
>>      KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 3)
>>  #define ICC_CTLR_EL1    \
>>      KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 4)
>> +#define ICC_SRE_EL1 \
>> +    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 5)
>>  #define ICC_IGRPEN0_EL1 \
>>      KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 6)
>>  #define ICC_IGRPEN1_EL1 \
>> @@ -404,6 +406,7 @@ static void kvm_arm_gicv3_put(GICv3State *s)
>>          GICv3CPUState *c = &s->cpu[ncpu];
>>          int num_pri_bits;
>>
>> +        kvm_gicc_access(s, ICC_SRE_EL1, ncpu, &c->icc_sre_el1, true);
>>          kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
>>                          &c->icc_ctlr_el1[GICV3_NS], true);
>>          kvm_gicc_access(s, ICC_IGRPEN0_EL1, ncpu,
>> @@ -557,6 +560,7 @@ static void kvm_arm_gicv3_get(GICv3State *s)
>>          GICv3CPUState *c = &s->cpu[ncpu];
>>          int num_pri_bits;
>>
>> +        kvm_gicc_access(s, ICC_SRE_EL1, ncpu, &c->icc_sre_el1, false);
>>          kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
>>                          &c->icc_ctlr_el1[GICV3_NS], false);
>>          kvm_gicc_access(s, ICC_IGRPEN0_EL1, ncpu,
>> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
>> index 341a311..183c7f8 100644
>> --- a/include/hw/intc/arm_gicv3_common.h
>> +++ b/include/hw/intc/arm_gicv3_common.h
>> @@ -166,6 +166,7 @@ struct GICv3CPUState {
>>      uint8_t gicr_ipriorityr[GIC_INTERNAL];
>>
>>      /* CPU interface */
>> +    uint64_t icc_sre_el1;
>>      uint64_t icc_ctlr_el1[2];
>>      uint64_t icc_pmr_el1;
>>      uint64_t icc_bpr[3];
>
> If you're adding a new structure field you must also update
> the vmstate struct in arm_gicv3_common.c.

...and if you put the patch which adds the new struct field
to GICv3CPUState and the vmstate first, then you can avoid
bumping the version numbers in vmstate because migration will
have always been disabled. So it's better to do it that way
round.

thanks
-- PMM

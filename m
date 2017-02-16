Received: by 10.25.77.65 with SMTP id a62csp2374873lfb;
        Thu, 16 Feb 2017 02:00:03 -0800 (PST)
X-Received: by 10.237.59.19 with SMTP id p19mr1166999qte.90.1487239203785;
        Thu, 16 Feb 2017 02:00:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l98si4877610qkh.30.2017.02.16.02.00.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Feb 2017 02:00:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceIr5-0001eo-96
	for alex.bennee@linaro.org; Thu, 16 Feb 2017 05:00:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1ceIpB-0000Jm-Tz
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 04:58:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1ceIpB-0005vK-3s
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 04:58:06 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33623)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1ceIpA-0005un-Sj; Thu, 16 Feb 2017 04:58:05 -0500
Received: by mail-lf0-x241.google.com with SMTP id x1so1024265lff.0;
	Thu, 16 Feb 2017 01:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F+fr6gLCIChTcEh21sZWnkTlDMD8Xa5unWQyb7QEh8Q=;
	b=m7j8D3VEkb9Vc/wAsbyV6tHRv+ipgrc6SnxY3A6So/SBzpJY02jzmPIVQe1sP/O0iw
	rPfAdlvc5s4bUKZ2HF3wbDiI2m2k6wRck4A/joQIEkOth2i48Z8Noh6aMnrUz5v2c2bh
	dY47nHnzlshPvMDv/CbA4DGS1Li90ugzzSyLXZt7R3yvMDtQQlinzME2ZqF3xYehKc4k
	yBSWbrbAHeLEVglVx9nqcCK1cmKE1aNZHtfvb3M6Q+cvwQuSIZ9MgbvEgHxbnz0IXvvB
	0HXbH3Pk5ddb4f5gubuzWrJHORMGuxLoJaytLbE/6xh8uGepfIhSfYBOAcVFrgEF4dLr
	au3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F+fr6gLCIChTcEh21sZWnkTlDMD8Xa5unWQyb7QEh8Q=;
	b=nfDKj9lLqXfpBxS6aDJP6MmXOtrnCtGS6Os+YvHPcXo6XY5NNxk9/OcP9ZXrs7fich
	Bmwgv6t1Q5OTpMthehqRJkowThVcwtvZDp3TbxNVydtb2SP/7W8yZbd/ujWaBW81tkTT
	jiQczwPMRFtjg0GfL58bBtiIEZVZYPqcHBT5LZlpaerXGg+8IERnqC/iNs8ER5Qkh934
	PhNQGxg+vJpp69wZ+m1b9WrEtcoBhl6hkhK93oatb6LMzkm4HNpx0R36Aqs7VtHrRwFp
	1A7w32ycqhXckN5rDDs58pdT8rgekThamWKBZ7SharUNEgPBDM0t15JLHw0kNiXEnapz
	Wdpg==
X-Gm-Message-State: AMke39kUrwVTXacFfsqHyT9TjrbOxPol1u9mLrDQfCpENUvCgJ3OC7cM56eKMoXANaDfKiyRthHxYPE7uXOspQ==
X-Received: by 10.46.9.143 with SMTP id 137mr397318ljj.132.1487239083360; Thu,
	16 Feb 2017 01:58:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.20.15 with HTTP; Thu, 16 Feb 2017 01:58:02 -0800 (PST)
In-Reply-To: <CAFEAcA-Kty3EynELrP88fgNoFj3njh1w6XZ5DOpNsTC7edPmng@mail.gmail.com>
References: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
	<1485879782-6075-5-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA-Kty3EynELrP88fgNoFj3njh1w6XZ5DOpNsTC7edPmng@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Thu, 16 Feb 2017 15:28:02 +0530
Message-ID: <CALicx6u0sDaqxJ-y_GxCCMV1CXo095MGG_ibR9HB+ZYavpuc=Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [PATCH v7 RESEND 4/5] target-arm: Add GICv3CPUState
 in CPUARMState struct
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
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2fLlA06KYtBS

On Tue, Feb 7, 2017 at 8:12 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 31 January 2017 at 16:23,  <vijay.kilari@gmail.com> wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>
>> Add gicv3state void pointer to CPUARMState struct
>> to store GICv3CPUState.
>>
>> In case of usecase like CPU reset, we need to reset
>> GICv3CPUState of the CPU. In such scenario, this pointer
>> becomes handy.
>>
>> This patch take care of only GICv3.
>>
>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>> ---
>>  hw/intc/arm_gicv3_kvm.c | 8 ++++++++
>>  target-arm/cpu.h        | 2 ++
>>  2 files changed, 10 insertions(+)
>>
>> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
>> index 77af32d..f91e0ac 100644
>> --- a/hw/intc/arm_gicv3_kvm.c
>> +++ b/hw/intc/arm_gicv3_kvm.c
>> @@ -644,6 +644,14 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>>
>>      gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL);
>>
>> +    for (i = 0; i < s->num_cpu; i++) {
>> +        ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
>> +        CPUARMState *env = &cpu->env;
>> +
>> +        /* Store GICv3CPUState in CPUARMState gicv3state pointer */
>> +        env->gicv3state = (void *)&s->cpu[i];
>> +    }
>> +
>>      /* Try to create the device via the device control API */
>>      s->dev_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_ARM_VGIC_V3, false);
>>      if (s->dev_fd < 0) {
>
> Please set the CPU's pointer to the GICv3 in arm_gicv3_common_realize(),
> because that's where we set the GICv3's pointer to the CPU.
> (We don't want the pointer to be specific to the KVM GICv3
> anyway.)

Adding this arch specific to arm_gicv3_common_realize() lands in
compilation errors
 as arm_gicv3_common.c is common file.
So, I would like to add this to arm_gicv3_cpuif.c and export it as a function
and call from arm_gicv3_common_realize().
>
> thanks
> -- PMM

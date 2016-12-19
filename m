Received: by 10.103.86.20 with SMTP id k20csp96491vsb;
        Mon, 19 Dec 2016 14:05:28 -0800 (PST)
X-Received: by 10.55.72.86 with SMTP id v83mr3145731qka.262.1482185128592;
        Mon, 19 Dec 2016 14:05:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d129si2829639qke.110.2016.12.19.14.05.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Dec 2016 14:05:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJ63g-0006Xl-2b
	for alex.bennee@linaro.org; Mon, 19 Dec 2016 17:05:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cJ63W-0006Vt-Je
	for qemu-arm@nongnu.org; Mon, 19 Dec 2016 17:05:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cJ63V-0001iP-FS
	for qemu-arm@nongnu.org; Mon, 19 Dec 2016 17:05:14 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:35960)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cJ63V-0001iH-9T; Mon, 19 Dec 2016 17:05:13 -0500
Received: by mail-oi0-x241.google.com with SMTP id u15so21426438oie.3;
	Mon, 19 Dec 2016 14:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IzjyvJOFpc3p6H7Q6DYubuXe0w7qg5mxhjwNloFrf5U=;
	b=uTop6V19phaU8LiAeoEqcwWcoaLXDrov01dWZ5Bo1uWnOwvMo23fz/LySzflSfpNeC
	PPKhGwjVyfY4pvR5rSsW/MRXRYr6q565uSa31u7NZfQ2NhJi82n4S9CzNWHVlr1CnVwh
	jFOQIKh1+bTuMdhjQng+f5mD7gtDA9Xz6ImkmcrKpbV/YKO7taSbxj8wcoG3LQr/BZDv
	O5Y11z50XT0jNWEj/jyRecK13XWuq0kb79VR5D+oFDLyOPYhwXb2zqMkXUPNiT9aERWv
	00WMb5nBEsvxaJT6acczaeHFl0gu0J8ojIBdjCeUNCcWGaKKTlx9fpo+3G+vBEVp/ueb
	LKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IzjyvJOFpc3p6H7Q6DYubuXe0w7qg5mxhjwNloFrf5U=;
	b=smhkAO+5F6AauxiRAW6A+eUWV655rt6MrzgKb7s+c0X9BTKyw36RjlRO49GYvbP0TW
	Boq5P+EHi49P150/sBLoRTK6ojnMERJhqHa75XsOYlYGJ16xuoKOKILS6bNCouhilkC2
	1eDB3+0x5UPcAt5vxfGbccMn6MfT2ammeE4ZTd5Xo/BDfEB2YKRZjHd0isXdn73ThxvK
	i0ItavV7KN2lW3vCTognXs2fvSgZaYl7fkbwTO9CWCfS226cFSLOSV5OXj45LtKVbX3z
	7IqgtROSYmf86iAgJNEIdu6iQeAL+ptOI/FQXdOAr5+/zLUKOMuQIJmvhsS35FhJdEie
	o4CQ==
X-Gm-Message-State: AKaTC01DcaN5Ods90UskEkXkXHp6msL3xQBv4+O2fMNOzeGklsSdzSuP3MhM/5yErHxYmTJULQhSWgxmGvL5LQ==
X-Received: by 10.157.22.193 with SMTP id s1mr9709515ots.130.1482185112382;
	Mon, 19 Dec 2016 14:05:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.96.6 with HTTP; Mon, 19 Dec 2016 14:04:41 -0800 (PST)
In-Reply-To: <20161213161152.GN9606@toto>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
	<1481625384-15077-23-git-send-email-peter.maydell@linaro.org>
	<20161213161152.GN9606@toto>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 19 Dec 2016 14:04:41 -0800
Message-ID: <CAKmqyKNXugCpkY_oHv=256wP5nve9hcsGep21UQuwyLE_mm99A@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 22/23] target-arm: Enable EL2
 feature bit on A53 and A57
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5/1VGj1ymJ5h

On Tue, Dec 13, 2016 at 8:11 AM, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Tue, Dec 13, 2016 at 10:36:23AM +0000, Peter Maydell wrote:
>> Enable the ARM_FEATURE_EL2 bit on Cortex-A52 and
>> Cortex-A57, since this is all now sufficiently implemented
>> to work with the GICv3. We provide the usual CPU property
>> to disable it for backwards compatibility with the older
>> virt boards.
>>
>> In this commit, we disable the EL2 feature on the
>> virt and ZynpMP boards, so there is no overall effect.
>> Another commit will expose a board-level property to
>> allow the user to enable EL2.
>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

>
>
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target-arm/cpu.h     |  2 ++
>>  hw/arm/virt.c        |  4 ++++
>>  hw/arm/xlnx-zynqmp.c |  2 ++
>>  target-arm/cpu.c     | 12 ++++++++++++
>>  target-arm/cpu64.c   |  2 ++
>>  5 files changed, 22 insertions(+)
>>
>> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
>> index be42ffb..51165fa 100644
>> --- a/target-arm/cpu.h
>> +++ b/target-arm/cpu.h
>> @@ -574,6 +574,8 @@ struct ARMCPU {
>>      bool start_powered_off;
>>      /* CPU currently in PSCI powered-off state */
>>      bool powered_off;
>> +    /* CPU has virtualization extension */
>> +    bool has_el2;
>>      /* CPU has security extension */
>>      bool has_el3;
>>      /* CPU has PMU (Performance Monitor Unit) */
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index cce8d2e..5bde68c 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1368,6 +1368,10 @@ static void machvirt_init(MachineState *machine)
>>              object_property_set_bool(cpuobj, false, "has_el3", NULL);
>>          }
>>
>> +        if (object_property_find(cpuobj, "has_el2", NULL)) {
>> +            object_property_set_bool(cpuobj, false, "has_el2", NULL);
>> +        }
>> +
>>          if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
>>              object_property_set_int(cpuobj, vms->psci_conduit,
>>                                      "psci-conduit", NULL);
>> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
>> index 0d86ba3..bc4e66b 100644
>> --- a/hw/arm/xlnx-zynqmp.c
>> +++ b/hw/arm/xlnx-zynqmp.c
>> @@ -258,6 +258,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>>
>>          object_property_set_bool(OBJECT(&s->apu_cpu[i]),
>>                                   s->secure, "has_el3", NULL);
>> +        object_property_set_bool(OBJECT(&s->apu_cpu[i]),
>> +                                 false, "has_el2", NULL);

Hey Peter,

We would like this to be settable. I think just copying the s->secure
(same as EL3) should be fine here.

Let me know what is easier for you, if you want to just add an extra
patch to enable it or if you want me to send a patch doing it?

Thanks,

Alistair

>>          object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
>>                                  "reset-cbar", &error_abort);
>>          object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized",
>> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
>> index 5e0d21d..d721cd4 100644
>> --- a/target-arm/cpu.c
>> +++ b/target-arm/cpu.c
>> @@ -497,6 +497,9 @@ static Property arm_cpu_reset_hivecs_property =
>>  static Property arm_cpu_rvbar_property =
>>              DEFINE_PROP_UINT64("rvbar", ARMCPU, rvbar, 0);
>>
>> +static Property arm_cpu_has_el2_property =
>> +            DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
>> +
>>  static Property arm_cpu_has_el3_property =
>>              DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
>>
>> @@ -547,6 +550,11 @@ static void arm_cpu_post_init(Object *obj)
>>  #endif
>>      }
>>
>> +    if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
>> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_el2_property,
>> +                                 &error_abort);
>> +    }
>> +
>>      if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
>>          qdev_property_add_static(DEVICE(obj), &arm_cpu_has_pmu_property,
>>                                   &error_abort);
>> @@ -690,6 +698,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>          cpu->id_aa64pfr0 &= ~0xf000;
>>      }
>>
>> +    if (!cpu->has_el2) {
>> +        unset_feature(env, ARM_FEATURE_EL2);
>> +    }
>> +
>>      if (!cpu->has_pmu || !kvm_enabled()) {
>>          cpu->has_pmu = false;
>>          unset_feature(env, ARM_FEATURE_PMU);
>> diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
>> index 73c7f31..670c07a 100644
>> --- a/target-arm/cpu64.c
>> +++ b/target-arm/cpu64.c
>> @@ -110,6 +110,7 @@ static void aarch64_a57_initfn(Object *obj)
>>      set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
>>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>>      set_feature(&cpu->env, ARM_FEATURE_CRC);
>> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
>>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>>      set_feature(&cpu->env, ARM_FEATURE_PMU);
>>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
>> @@ -169,6 +170,7 @@ static void aarch64_a53_initfn(Object *obj)
>>      set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
>>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>>      set_feature(&cpu->env, ARM_FEATURE_CRC);
>> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
>>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>>      set_feature(&cpu->env, ARM_FEATURE_PMU);
>>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
>> --
>> 2.7.4
>>
>

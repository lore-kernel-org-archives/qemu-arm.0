Received: by 10.25.0.147 with SMTP id 141csp347052lfa;
        Sun, 19 Feb 2017 22:21:31 -0800 (PST)
X-Received: by 10.200.39.76 with SMTP id h12mr7888976qth.212.1487571691301;
        Sun, 19 Feb 2017 22:21:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y65si12332587qkd.99.2017.02.19.22.21.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 19 Feb 2017 22:21:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cfhLm-0000M1-Pb
	for alex.bennee@linaro.org; Mon, 20 Feb 2017 01:21:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cfhLj-0000Lg-TJ
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 01:21:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cfhLi-0003BJ-IG
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 01:21:27 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:36086)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cfhLi-0003Al-Bh; Mon, 20 Feb 2017 01:21:26 -0500
Received: by mail-lf0-x243.google.com with SMTP id 90so235063lfr.3;
	Sun, 19 Feb 2017 22:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=enUIFLPu8n7+lSHXqhNJDkKmpoDXsXw2o+2moCYqR+0=;
	b=RVpj+VL7MClUI/ZCmlbGOCSfUQQk70UT3cl8FzQpfiFBm8dhF/rgv51913bmipCOoQ
	6sJQVYNU0WOzaj+jvsjd+3yW3/JnX2E4oJg2PE0zCfbl5p0/Qm0myKRb4qfVoM+qmEH6
	lYUmR/EhH7hSO3KyKMlm1uuVqMw9N1xqOqRVoJD469gJDSFRIfZ6VC3LqcjveYFSDRhB
	keXFvoCFQTtymWWdnnsmttFTp0lNk4SogTEQrA5rjgchCifrnhRwg10NjuXxajSsSMTd
	fyNFtnTtVCySV9HwT//VK3qN9gmTq0qHZtptIDpOYIt3IFXVVbjbsIwMvxd2Ciz8XRC6
	FX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=enUIFLPu8n7+lSHXqhNJDkKmpoDXsXw2o+2moCYqR+0=;
	b=ta00b050I/zlkuwmE5SNuhhgCu0OutvOGl/wuOvhMpRemn3XYuM95eLo3pMV+jEYaP
	FgIXtig4Immvj/CYN0sx+ELbt02OdRmeuMWICbmJV6LnH7Jvmmm9ImKIexn106F0sgSU
	EkorMopa/EkSvnipvV/HuesHHdZ2sLUJwWa81USoPp3XiA52DvMXuO/iMNozzF4VOD8S
	RihkfJ29CVSwFj3CfRcVTLTUjt24oEzte3esq3giNgTC9GElGTuOgJcmbW2cHWIvm47h
	ds8NVITcTr18OPL/J7SQMzd42tqh3tNpZvkuawNMw2v0Xtdo/mAEvTHwfCcqtbOKWfZJ
	HZnA==
X-Gm-Message-State: AMke39lG7+7JMBpst3mXXQZzcx1NYRwcYUVXM9xiOO7osGBbl7TPkigL0LF6xeksUXhIqYfx51+vmwaAJGqxTA==
X-Received: by 10.25.93.70 with SMTP id p6mr5559749lfj.15.1487571684741; Sun,
	19 Feb 2017 22:21:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.20.15 with HTTP; Sun, 19 Feb 2017 22:21:24 -0800 (PST)
In-Reply-To: <CAFEAcA8618+LGejFq6SpBEwGrNpfamBBX3MFWjss-ZxJ7Xk8mg@mail.gmail.com>
References: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
	<1487313115-9510-3-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA8618+LGejFq6SpBEwGrNpfamBBX3MFWjss-ZxJ7Xk8mg@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Mon, 20 Feb 2017 11:51:24 +0530
Message-ID: <CALicx6tqxXZxBTxYvF55ydBg5CB1to3MsEkhaohucx4EAZcEJA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-arm] [PATCH v8 2/5] hw/intc/arm_gicv3_kvm: Add
 ICC_SRE_EL1 register to vmstate
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
X-TUID: ONs0m1sFJ4GQ

Hi Peter,

On Fri, Feb 17, 2017 at 7:25 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 17 February 2017 at 06:31,  <vijay.kilari@gmail.com> wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>
>> To Save and Restore ICC_SRE_EL1 register introduce vmstate
>> subsection and load only if non-zero.
>> Also initialize icc_sre_el1 with to 0x7 in pre_load
>> function.
>>
>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>> ---
>>  hw/intc/arm_gicv3_common.c         | 32 ++++++++++++++++++++++++++++++++
>>  include/hw/intc/arm_gicv3_common.h |  1 +
>>  2 files changed, 33 insertions(+)
>>
>> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
>> index 16b9b0f..e62480e 100644
>> --- a/hw/intc/arm_gicv3_common.c
>> +++ b/hw/intc/arm_gicv3_common.c
>> @@ -70,6 +70,34 @@ static const VMStateDescription vmstate_gicv3_cpu_virt = {
>>      }
>>  };
>>
>> +static int icc_sre_el1_reg_pre_load(void *opaque)
>> +{
>> +    GICv3CPUState *cs = opaque;
>> +
>> +    /* By default enable SRE and disable IRQ & FIQ bypass. */
>> +    cs->icc_sre_el1 = 0x7;
>
> Why do we need the pre_load function? I would have
> expected that reset would have given us these defaults
> already.
>
>> +    return 0;
>> +}
>> +
>> +static bool icc_sre_el1_reg_needed(void *opaque)
>> +{
>> +    GICv3CPUState *cs = opaque;
>> +
>> +    return cs->icc_sre_el1 != 0;
>
> I expected this to say "we need to transfer the value if
> it isn't 0x7" (since the current situation of migration
> is "we assume that the value is 0x7").
>
> Something should probably fail inbound migration for TCG
> if the value isn't 0x7, for that matter.
>
> Is there a situation where KVM might allow a value other
> than 0x7?

In KVM, the SRE_EL1 value is 0x1. During save, value
read from KVM is 0x1 though we reset to 0x7.

>
>> +}
>> +
>> +const VMStateDescription vmstate_gicv3_cpu_sre_el1 = {
>> +    .name = "arm_gicv3_cpu/sre_el1",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .pre_load = icc_sre_el1_reg_pre_load,
>> +    .needed = icc_sre_el1_reg_needed,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT64(icc_sre_el1, GICv3CPUState),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>  static const VMStateDescription vmstate_gicv3_cpu = {
>>      .name = "arm_gicv3_cpu",
>>      .version_id = 1,
>> @@ -100,6 +128,10 @@ static const VMStateDescription vmstate_gicv3_cpu = {
>>      .subsections = (const VMStateDescription * []) {
>>          &vmstate_gicv3_cpu_virt,
>>          NULL
>> +    },
>> +    .subsections = (const VMStateDescription * []) {
>> +        &vmstate_gicv3_cpu_sre_el1,
>> +        NULL
>>      }
>>  };
>>
>> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
>> index 4156051..bccdfe1 100644
>> --- a/include/hw/intc/arm_gicv3_common.h
>> +++ b/include/hw/intc/arm_gicv3_common.h
>> @@ -172,6 +172,7 @@ struct GICv3CPUState {
>>      uint8_t gicr_ipriorityr[GIC_INTERNAL];
>>
>>      /* CPU interface */
>> +    uint64_t icc_sre_el1;
>>      uint64_t icc_ctlr_el1[2];
>>      uint64_t icc_pmr_el1;
>>      uint64_t icc_bpr[3];
>> --
>> 1.9.1
>
> thanks
> -- PMM

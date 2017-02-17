Received: by 10.25.77.65 with SMTP id a62csp77102lfb;
        Fri, 17 Feb 2017 01:28:03 -0800 (PST)
X-Received: by 10.55.123.5 with SMTP id w5mr7369996qkc.76.1487323683010;
        Fri, 17 Feb 2017 01:28:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g8si7107406qtc.212.2017.02.17.01.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 01:28:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceepe-00078M-GX
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 04:28:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ceeP0-00080c-9x
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 04:00:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ceeOu-0002MS-Hu
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 04:00:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33982)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ceeOu-0002Lo-8z; Fri, 17 Feb 2017 04:00:24 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D539FC04D28B;
	Fri, 17 Feb 2017 09:00:23 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1H90KGC005156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 17 Feb 2017 04:00:21 -0500
To: Vijay Kilari <vijay.kilari@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
	<1485879782-6075-3-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA_K2TcihHTTrrr7kZ3pGZ3BNptDb0mt5Rc0YinkGD1eHQ@mail.gmail.com>
	<CALicx6v7B3145pJXsOcgGass8xG4HHY7=iA6gEHKbMcHxqQD-A@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <bebfa013-8627-83d2-85bc-7ae55131ea48@redhat.com>
Date: Fri, 17 Feb 2017 10:00:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CALicx6v7B3145pJXsOcgGass8xG4HHY7=iA6gEHKbMcHxqQD-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 17 Feb 2017 09:00:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 RESEND 2/5] hw/intc/arm_gicv3_kvm: Add
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
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iUT4zhwz25lm

Hi Vijaya,

On 13/02/2017 13:17, Vijay Kilari wrote:
> On Tue, Feb 7, 2017 at 8:09 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 31 January 2017 at 16:22,  <vijay.kilari@gmail.com> wrote:
>>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>>
>>> To Save and Restore ICC_SRE_EL1 register Add ICC_SRE_EL1 register
>>> to vmstate and GICv3CPUState struct.
>>>
>>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>> ---
>>>  hw/intc/arm_gicv3_common.c         | 1 +
>>>  include/hw/intc/arm_gicv3_common.h | 1 +
>>>  2 files changed, 2 insertions(+)
>>>
>>> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
>>> index 0f8c4b8..f3245d9 100644
>>> --- a/hw/intc/arm_gicv3_common.c
>>> +++ b/hw/intc/arm_gicv3_common.c
>>> @@ -68,6 +68,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
>>>          VMSTATE_UINT32(gicr_igrpmodr0, GICv3CPUState),
>>>          VMSTATE_UINT32(gicr_nsacr, GICv3CPUState),
>>>          VMSTATE_UINT8_ARRAY(gicr_ipriorityr, GICv3CPUState, GIC_INTERNAL),
>>> +        VMSTATE_UINT64(icc_sre_el1, GICv3CPUState),
>>>          VMSTATE_UINT64_ARRAY(icc_ctlr_el1, GICv3CPUState, 2),
>>>          VMSTATE_UINT64(icc_pmr_el1, GICv3CPUState),
>>>          VMSTATE_UINT64_ARRAY(icc_bpr, GICv3CPUState, 3),
>>> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
>>> index 341a311..183c7f8 100644
>>> --- a/include/hw/intc/arm_gicv3_common.h
>>> +++ b/include/hw/intc/arm_gicv3_common.h
>>> @@ -166,6 +166,7 @@ struct GICv3CPUState {
>>>      uint8_t gicr_ipriorityr[GIC_INTERNAL];
>>>
>>>      /* CPU interface */
>>> +    uint64_t icc_sre_el1;
>>>      uint64_t icc_ctlr_el1[2];
>>>      uint64_t icc_pmr_el1;
>>>      uint64_t icc_bpr[3];
>>
>> This breaks migration compatibility for TCG using GICv3; you
>> need to do something here with a VMState subsection so
>> the new register is only transferred if it's non-zero.
> 
> So, you mean to put a check in kvm_arm_gicv3_put() and
> kvm_arm_gicv3_get() to check for non-zero value?
> icc_sre_el1 is always non-zero reset to 0xf in TCG and 0x7 in KVM mode.
In hw/intc/arm_gicv3_cpuif.c we have
    { .name = "ICC_SRE_EL1", .state = ARM_CP_STATE_BOTH,
	../..
      .resetvalue = 0x7,
    },
where did you find the TCG reset value equal to 0xF? I am not able to
find it.

Thanks

Eric

> 
>>
>> thanks
>> -- PMM

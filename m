Received: by 10.25.0.147 with SMTP id 141csp808548lfa;
        Fri, 24 Feb 2017 10:25:50 -0800 (PST)
X-Received: by 10.200.52.161 with SMTP id w30mr3989383qtb.69.1487960750174;
        Fri, 24 Feb 2017 10:25:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f63si6175631qkd.153.2017.02.24.10.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Feb 2017 10:25:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1chKYt-00065E-E2
	for alex.bennee@linaro.org; Fri, 24 Feb 2017 13:25:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1chKCR-0007MX-KR
	for qemu-arm@nongnu.org; Fri, 24 Feb 2017 13:02:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1chKCO-0002MQ-9n
	for qemu-arm@nongnu.org; Fri, 24 Feb 2017 13:02:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37912)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1chKCO-0002ME-3X; Fri, 24 Feb 2017 13:02:32 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF4B780462;
	Fri, 24 Feb 2017 18:02:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-118-6.ams2.redhat.com [10.36.118.6]
	(may be forged))
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1OI2S8q010853
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 24 Feb 2017 13:02:29 -0500
To: Peter Maydell <peter.maydell@linaro.org>
References: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
	<1487850673-26455-3-git-send-email-vijay.kilari@gmail.com>
	<ce8aa8f7-e163-5b79-ef1e-f8132928882f@redhat.com>
	<CAFEAcA_wQueyMKEdVpeW56RPhvG+deO5-a_AHZX+xHaMtCQnyg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c561d20f-2095-1a4e-6648-157fea80c888@redhat.com>
Date: Fri, 24 Feb 2017 19:02:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_wQueyMKEdVpeW56RPhvG+deO5-a_AHZX+xHaMtCQnyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 24 Feb 2017 18:02:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v9 2/5] hw/intc/arm_gicv3_kvm: Add
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
Cc: Vijay Kilari <vijay.kilari@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nMNNiazX235D

Hi Peter,

On 24/02/2017 18:57, Peter Maydell wrote:
> On 24 February 2017 at 17:53, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi,
>>
>> On 23/02/2017 12:51, vijay.kilari@gmail.com wrote:
>>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>>
>>> To Save and Restore ICC_SRE_EL1 register introduce vmstate
>>> subsection and load only if non-zero.
>> != 7
>>
>>> Also initialize icc_sre_el1 with to 0x7 in pre_load
>>> function.
>>>
>>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>> ---
>>>  hw/intc/arm_gicv3_common.c         | 36 ++++++++++++++++++++++++++++++++++++
>>>  include/hw/intc/arm_gicv3_common.h |  1 +
>>>  2 files changed, 37 insertions(+)
>>>
>>> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
>>> index 16b9b0f..5b0e456 100644
>>> --- a/hw/intc/arm_gicv3_common.c
>>> +++ b/hw/intc/arm_gicv3_common.c
>>> @@ -70,6 +70,38 @@ static const VMStateDescription vmstate_gicv3_cpu_virt = {
>>>      }
>>>  };
>>>
>>> +static int icc_sre_el1_reg_pre_load(void *opaque)
>>> +{
>>> +    GICv3CPUState *cs = opaque;
>>> +
>>> +   /*
>>> +    * If the sre_el1 subsection is not transferred this
>>> +    * means SRE_EL1 is 0x7 (which might not be the same as
>>> +    * our reset value).
>>> +    */
>>> +    cs->icc_sre_el1 = 0x7;
>>> +    return 0;
>>> +}
>> As Peter asked before I don't really get why we need the pre_load
>> function here.
> 
> No, it's correct. As the comment says, the reset value
> of icc_sre_el1 might not be 7 (it is right now, but it's
> less of a trap for future changes to not assume it).
> So the way migration works is that we use pre-load on the destination
> end to set the value to 0x7, then if the source end transfers the data
> we get the transferred value, otherwise we end up with the default
> value as set in the pre-load function.

OK that clarifies.

Thanks!

Eric
> 
> thanks
> -- PMM
> 

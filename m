Received: by 10.25.77.65 with SMTP id a62csp671572lfb;
        Fri, 3 Feb 2017 07:43:19 -0800 (PST)
X-Received: by 10.55.167.8 with SMTP id q8mr13431489qke.97.1486136599428;
        Fri, 03 Feb 2017 07:43:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t22si1049147qkl.165.2017.02.03.07.43.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Feb 2017 07:43:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35365 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cZg18-0004JJ-Ql
	for alex.bennee@linaro.org; Fri, 03 Feb 2017 10:43:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZfzc-0002zD-0q
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 10:41:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZfzb-0004YD-0i
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 10:41:44 -0500
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:34736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cZfza-0004Xy-QO
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 10:41:42 -0500
Received: by mail-wm0-x229.google.com with SMTP id 196so15780135wmm.1
	for <qemu-arm@nongnu.org>; Fri, 03 Feb 2017 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RFvDG8iojOJ+jl3YRvQwWYzlX8aUrt99OUPe4bS4cgQ=;
	b=EQ+tFDzNgBiMhfhlPN4gXu6COKHQqHz9l8NrxkHTp9gom6pAEAcAPBTfap/nNtYKzc
	uhVmub0R7EfHRZXhVKPKt0fgNhgeyW7mdOw4+ul+fEgOBrJv5wfOb1HOoj/FyKITaggm
	6GpK8jK090H7pRb9iln69+ceb218pulUegxQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RFvDG8iojOJ+jl3YRvQwWYzlX8aUrt99OUPe4bS4cgQ=;
	b=AQjAslJvF9Sw1HmRnpITU0SUSuHitiOCGs37YyanLpMKW0xkQmFaBm2J7PC//KQTK8
	LiH0+YFSoXo/k+0RPIX0tBvHejAJD0dwdX64sOSjSXklggFx5RY+h15jaHIGt7pC6PYo
	KRxo9gprZ8LdTzOEPxVjS6AD3YVygrcp1CJk41NkIz8LeQTiag7uMSCzl8cW1kNZymVF
	/Y0geJfkIGzxNdF/SaZwKd/MeDJn0LcxG7lqDQO84JCR3fYWqXMalcrcYU0zgIScpSuo
	wc9OIT0WoANwmduN7R1/CmlQqw/KACQU+J53H1Jsn02e6k1NaRMt8RIK5Tc3C7stg8Y8
	mHdg==
X-Gm-Message-State: AMke39lqEXPnsg17KlrBmkrQQj0nb2lg/yZou0FlwWzpjMAoJVWotvM9ROqLE1QnwYU4qWlM2fsmdMSwWyygYBYW
X-Received: by 10.28.11.135 with SMTP id 129mr1925071wml.111.1486136501626;
	Fri, 03 Feb 2017 07:41:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 07:41:21 -0800 (PST)
In-Reply-To: <01ec995f-fdb7-8516-b209-627f8aa3478c@redhat.com>
References: <1485875745-27741-1-git-send-email-wei@redhat.com>
	<1485875745-27741-5-git-send-email-wei@redhat.com>
	<CAFEAcA8-Lt4z1uiN9dcuak3-hA3d_1fL7+iL2dOm9msrrq69NA@mail.gmail.com>
	<01ec995f-fdb7-8516-b209-627f8aa3478c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 15:41:21 +0000
Message-ID: <CAFEAcA-tJDnAnuTD=txp2AkNSCRX4H+oPVvxunX1FJ1EOr1VdQ@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-arm] [PATCH V2 4/5] target-arm: Add support for PMU
 register PMINTENSET_EL1
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ajXoRTkH6soa

On 3 February 2017 at 15:19, Wei Huang <wei@redhat.com> wrote:
>
>
> On 02/03/2017 07:30 AM, Peter Maydell wrote:
>> On 31 January 2017 at 15:15, Wei Huang <wei@redhat.com> wrote:
>>> This patch adds access support for PMINTENSET_EL1.
>>>
>>> Signed-off-by: Wei Huang <wei@redhat.com>
>>> ---
>>>  target/arm/cpu.h    |  2 +-
>>>  target/arm/helper.c | 10 +++++++++-
>>>  2 files changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>>> index ce02044..42aaea9 100644
>>> --- a/target/arm/cpu.h
>>> +++ b/target/arm/cpu.h
>>> @@ -310,7 +310,7 @@ typedef struct CPUARMState {
>>>          uint64_t c9_pmxevtyper; /* perf monitor event type */
>>>          uint32_t c9_pmuserenr; /* perf monitor user enable */
>>>          uint64_t c9_pmselr; /* perf monitor counter selection register */
>>> -        uint32_t c9_pminten; /* perf monitor interrupt enables */
>>> +        uint64_t c9_pminten; /* perf monitor interrupt enables */
>>>          union { /* Memory attribute redirection */
>>>              struct {
>>>  #ifdef HOST_WORDS_BIGENDIAN
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index 6b8460a..b028042 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -1272,9 +1272,17 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>>>        .writefn = pmuserenr_write, .raw_writefn = raw_write },
>>>      { .name = "PMINTENSET", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 1,
>>>        .access = PL1_RW, .accessfn = access_tpm,
>>> -      .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
>>> +      .type = ARM_CP_ALIAS,
>>> +      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pminten),
>>>        .resetvalue = 0,
>>>        .writefn = pmintenset_write, .raw_writefn = raw_write },
>>> +    { .name = "PMINTENSET_EL1", .state = ARM_CP_STATE_AA64,
>>> +      .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 1,
>>> +      .access = PL1_RW, .accessfn = access_tpm,
>>> +      .type = ARM_CP_IO,
>>> +      .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
>>> +      .writefn = pmintenset_write, .raw_writefn = raw_write,
>>> +      .resetvalue = 0x0 },
>>>      { .name = "PMINTENCLR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 2,
>>>        .access = PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
>>>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
>>
>> Add PMINTENCLR_EL1 as well, please.
>
> It was already defined in target-arm/helper.c file. Could you elaborate
> which part is missing?
>
>     { .name = "PMINTENCLR_EL1", .state = ARM_CP_STATE_AA64,
>       .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 2,
>       .access = PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
>       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
>       .writefn = pmintenclr_write },

I'm sorry, you're right. I assumed that because we didn't have
a 64-bit version of the SET we didn't have a 64-bit version
of the CLR either.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

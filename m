Received: by 10.25.77.65 with SMTP id a62csp661778lfb;
        Fri, 3 Feb 2017 07:19:59 -0800 (PST)
X-Received: by 10.237.63.119 with SMTP id q52mr13462516qtf.29.1486135199814;
        Fri, 03 Feb 2017 07:19:59 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x34si19459497qte.67.2017.02.03.07.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Feb 2017 07:19:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cZfeZ-0000ro-Ai
	for alex.bennee@linaro.org; Fri, 03 Feb 2017 10:19:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cZfeW-0000rh-8n
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 10:19:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cZfeS-0003hG-WA
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 10:19:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42798)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1cZfeS-0003gy-Mv; Fri, 03 Feb 2017 10:19:52 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BBFB38123D;
	Fri,  3 Feb 2017 15:19:52 +0000 (UTC)
Received: from [10.10.58.2] (vpn-58-2.rdu2.redhat.com [10.10.58.2])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v13FJq6w002550; Fri, 3 Feb 2017 10:19:52 -0500
To: Peter Maydell <peter.maydell@linaro.org>
References: <1485875745-27741-1-git-send-email-wei@redhat.com>
	<1485875745-27741-5-git-send-email-wei@redhat.com>
	<CAFEAcA8-Lt4z1uiN9dcuak3-hA3d_1fL7+iL2dOm9msrrq69NA@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <01ec995f-fdb7-8516-b209-627f8aa3478c@redhat.com>
Date: Fri, 3 Feb 2017 09:19:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8-Lt4z1uiN9dcuak3-hA3d_1fL7+iL2dOm9msrrq69NA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 03 Feb 2017 15:19:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: WyC+smV5mhYs



On 02/03/2017 07:30 AM, Peter Maydell wrote:
> On 31 January 2017 at 15:15, Wei Huang <wei@redhat.com> wrote:
>> This patch adds access support for PMINTENSET_EL1.
>>
>> Signed-off-by: Wei Huang <wei@redhat.com>
>> ---
>>  target/arm/cpu.h    |  2 +-
>>  target/arm/helper.c | 10 +++++++++-
>>  2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index ce02044..42aaea9 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -310,7 +310,7 @@ typedef struct CPUARMState {
>>          uint64_t c9_pmxevtyper; /* perf monitor event type */
>>          uint32_t c9_pmuserenr; /* perf monitor user enable */
>>          uint64_t c9_pmselr; /* perf monitor counter selection register */
>> -        uint32_t c9_pminten; /* perf monitor interrupt enables */
>> +        uint64_t c9_pminten; /* perf monitor interrupt enables */
>>          union { /* Memory attribute redirection */
>>              struct {
>>  #ifdef HOST_WORDS_BIGENDIAN
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 6b8460a..b028042 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -1272,9 +1272,17 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>>        .writefn = pmuserenr_write, .raw_writefn = raw_write },
>>      { .name = "PMINTENSET", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 1,
>>        .access = PL1_RW, .accessfn = access_tpm,
>> -      .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
>> +      .type = ARM_CP_ALIAS,
>> +      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pminten),
>>        .resetvalue = 0,
>>        .writefn = pmintenset_write, .raw_writefn = raw_write },
>> +    { .name = "PMINTENSET_EL1", .state = ARM_CP_STATE_AA64,
>> +      .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 1,
>> +      .access = PL1_RW, .accessfn = access_tpm,
>> +      .type = ARM_CP_IO,
>> +      .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
>> +      .writefn = pmintenset_write, .raw_writefn = raw_write,
>> +      .resetvalue = 0x0 },
>>      { .name = "PMINTENCLR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 2,
>>        .access = PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
>>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
> 
> Add PMINTENCLR_EL1 as well, please.

It was already defined in target-arm/helper.c file. Could you elaborate
which part is missing?

    { .name = "PMINTENCLR_EL1", .state = ARM_CP_STATE_AA64,
      .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 2,
      .access = PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
      .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
      .writefn = pmintenclr_write },




> 
> thanks
> -- PMM
> 

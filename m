Received: by 10.25.0.6 with SMTP id 6csp31201lfa;
        Thu, 1 Jun 2017 22:10:46 -0700 (PDT)
X-Received: by 10.55.101.209 with SMTP id z200mr5774403qkb.50.1496380246163;
        Thu, 01 Jun 2017 22:10:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496380246; cv=none;
        d=google.com; s=arc-20160816;
        b=Hulf0fXdhlFOsYsnLmTUxhExMlMZ7oMwEPct/onp+Pc71aSogaQxfVbN1L+TbKSXs/
         Q8JlWDZLbHrBLokjDXt/I/14Je/5FtXqVFZYAn8bmemPs7nvLitAb9GGx3hdT3n1SrZl
         xPHHVaXyi9K6MHBVMXhqchHwjkcxwcTCk9MQ8zHwqfYDcbKfxHCMnsgNjHNG4L08hq5J
         5dXnduuk4tvcCNtrzI3Adl7dqQPC3EWXkl7Z28/3q+5jKj1jd4bnGObvJXdrOXRn+h/I
         wIb7OOBnehnr5ayEqO0BmD7hWSC4elswiYhKl3+n4tuqcFq0GKAaDHZyX6tYJLzUrhr5
         Osjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=+Z1ryOUURFKDRlxpQp/pnA9xzGO8ZV5RleXEJIy1CHQ=;
        b=FFRgJ6XT0d8cMLSr/a9MUXhH7AJ+vK/DUnPvP8aix2rYR3265Mp3vEy9i9Mxzxs9sP
         hqkMSTM/p8NejeCx+Ih9r7xT653Ij/x9rnBW57S4PJiuavQyXhFzD8tUQdkU5Ypcs2Nw
         5f3aVRDd0cDu53yB27XOdDo0+YIw2Va4b2Cl+17eKbZsZi3ru0ZbrM8d/yLxjvp4zItq
         EEXc2X9BUVMbp5YZX7rZ3T7DHLYm5LfOzTAaskcPQ06lWl2PSzK4V20TIoGIqrvmSlxg
         PFF2TkZspTAVNu5RpOotV+4DUCeZoJyRbVSMDIzzgzo0hB2IcD2Ip8/NszpdsX7iLaP0
         5kcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2si21806548qkb.256.2017.06.01.22.10.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Jun 2017 22:10:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGerD-0007OV-BL
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 01:10:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dGeqw-0007N8-Gy
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 01:10:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dGequ-0006TG-Tg
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 01:10:26 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:35158)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dGeqr-0006SJ-LO; Fri, 02 Jun 2017 01:10:21 -0400
Received: by mail-oi0-x244.google.com with SMTP id f206so281918oig.2;
	Thu, 01 Jun 2017 22:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=+Z1ryOUURFKDRlxpQp/pnA9xzGO8ZV5RleXEJIy1CHQ=;
	b=rIYPo3BKzeJubFfoZL1tR1W6TjzOFePGzJCbInp5NB2u04HXJgzh/yKGMrTEIzVr9M
	AmHLHJUly1hSei82PixNrCNjbKd1cL5jQ+wJ+cAAtgOGE34OdXn+Cgx1h5TMQde2AJ42
	qUWAJIBUFcBB7IIVEanWJ0yqHuowl/Ad0KF+lZVsBbhxCGEKFzg7qrtbIpNN7Y3TnMtY
	ATR6/sGTBS1VCydiqq/GPbJrkg7tSuZ8jywgvn/cm3bfbc2qP8IdAbCmmltypYaA7uhg
	PlycY4Ttqe/thaa89Y2465RCF3oYW4visD4Fx1+WkKnNBjVX4r3EUq/sJ1Cy2BdJ3lwz
	Xl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=+Z1ryOUURFKDRlxpQp/pnA9xzGO8ZV5RleXEJIy1CHQ=;
	b=TxmPG35CbhAsHvWe5idF0mU0xcDZCyDOA9JYZRkNOoNUeqdaIM72IXbzHH9t43DuSV
	aq7LLs3HI0LbN050dF6BeDYIDo8Gz4tPFb77uoEshUfPXdJlVlwdxgM7PrpsuHWUOmWl
	zO8CrpIOJtNLQXMam4cOxwBJvCwipax7lyjFUDhAWO0U8BFucNHNa8gDa0AHQ0sAw7as
	pxRrkc4MhsErd9B0SCkgwUsIvzE2Kp0f4QQyVl4i8PI93tkev5LJ2mTmm5DO2CAHRF24
	kNrtwCxOB8a82QsYZ2iSUtspuby7+QkLyEK5a6DMvKzCkWShUYnk1jvLmKRWWhttJNMg
	4U+g==
X-Gm-Message-State: AODbwcD0+QdMTYVnLBG8MCK1o36SBGWsLXDiqqtWJROuypa8ZrP5bVaq
	dwzSrtfiJAaZQA==
X-Received: by 10.202.83.213 with SMTP id h204mr3347673oib.59.1496380220881;
	Thu, 01 Jun 2017 22:10:20 -0700 (PDT)
Received: from ?IPv6:2602:30a:2c37:1a00::43? ([2602:30a:2c37:1a00::43])
	by smtp.gmail.com with ESMTPSA id r45sm510263ota.37.2017.06.01.22.10.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 22:10:20 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
	<1493122030-32191-10-git-send-email-peter.maydell@linaro.org>
	<c9954451-ad9b-2365-5ed7-bc4c29f40abe@amsat.org>
	<CAFEAcA8aAwM-_9h1L23kjmfoabvivYdbKcC5e6YEkMXyUfTt5w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c6041151-8552-6ab2-54ef-1489340e4766@amsat.org>
Date: Fri, 2 Jun 2017 02:10:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8aAwM-_9h1L23kjmfoabvivYdbKcC5e6YEkMXyUfTt5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 09/13] armv7m: Implement M profile default
 memory map
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: saP1+Kg9IDqW

Hi Peter,

On 05/30/2017 12:11 PM, Peter Maydell wrote:
> On 30 May 2017 at 15:56, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Peter,
>>
>> On 04/25/2017 09:07 AM, Peter Maydell wrote:
>>>
>>> From: Michael Davidsaver <mdavidsaver@gmail.com>
>>>
>>> Add support for the M profile default memory map which is used
>>> if the MPU is not present or disabled.
>>>
>>> The main differences in behaviour from implementing this
>>> correctly are that we set the PAGE_EXEC attribute on
>>> the right regions of memory, such that device regions
>>> are not executable.
>>>
>>> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
>>> [PMM: rephrased comment and commit message; don't mark
>>>  the flash memory region as not-writable]
>>
>>
>> "not-writable by system caches" maybe to clarify?
>
> (Note that this is a comment describing something I
> deleted from Michael's original patch.)
> No, by 'not-writable' here I mean "not writeable by the CPU".
>

Ok!

>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  target/arm/helper.c | 35 ++++++++++++++++++++++++++---------
>>>  1 file changed, 26 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index 9e1ed1c..51662ad 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -8129,18 +8129,35 @@ static inline void
>>> get_phys_addr_pmsav7_default(CPUARMState *env,
>>>                                                  ARMMMUIdx mmu_idx,
>>>                                                  int32_t address, int
>>> *prot)
>>>  {
>>> -    *prot = PAGE_READ | PAGE_WRITE;
>>> -    switch (address) {
>>> -    case 0xF0000000 ... 0xFFFFFFFF:
>>> -        if (regime_sctlr(env, mmu_idx) & SCTLR_V) { /* hivecs execing is
>>> ok */
>>> +    if (!arm_feature(env, ARM_FEATURE_M)) {
>>> +        *prot = PAGE_READ | PAGE_WRITE;
>>> +        switch (address) {
>>> +        case 0xF0000000 ... 0xFFFFFFFF:
>>> +            if (regime_sctlr(env, mmu_idx) & SCTLR_V) {
>>> +                /* hivecs execing is ok */
>>> +                *prot |= PAGE_EXEC;
>>> +            }
>>> +            break;
>>> +        case 0x00000000 ... 0x7FFFFFFF:
>>
>>>              *prot |= PAGE_EXEC;
>>
>> I checked at Table B3-1 on the ARMv7-M Architecture Reference Manual I got
>> at https://static.docs.arm.com/ddi0403/e/DDI0403E_B_armv7m_arm.pdf and the
>> on-chip peripheral address space at 0x40000000 is eXecute Never.
>
> This is the arm of the if() that deals with R profile, and R profile's

Oh I completely misunderstood that if() indeed. R and also A I suppose.

> background region is completely different to M profile. (In any
> case the patch shouldn't change the behaviour there.)
>
>>> +            break;
>>> +        }
>>> +    } else {
>>> +        /* Default system address map for M profile cores.
>>> +         * The architecture specifies which regions are execute-never;
>>> +         * at the MPU level no other checks are defined.
>>> +         */
>>> +        switch (address) {
>>> +        case 0x00000000 ... 0x1fffffff: /* ROM */
>>> +        case 0x20000000 ... 0x3fffffff: /* SRAM */
>>> +        case 0x60000000 ... 0x7fffffff: /* RAM */
>>> +        case 0x80000000 ... 0x9fffffff: /* RAM */
>>> +            *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>>> +            break;
>>> +        default: /* Peripheral, 2x Device, and System */
>>> +            *prot = PAGE_READ | PAGE_WRITE;
>>
>>
>> This body is correct, however what do you think about using cases with
>> comments instead of 'default'? This would be clearer.
>
> Yeah, we could do that. I think this is one of those cases where
> I opted to go with how Michael had already written the code rather
> than rewriting it.
>
>         /* Default system address map for M profile cores.
>          * The architecture specifies which regions are execute-never;
>          * at the MPU level no other checks are defined.
>          */
>         switch (address) {
>         case 0x00000000 ... 0x1fffffff: /* ROM */
>         case 0x20000000 ... 0x3fffffff: /* SRAM */
>         case 0x60000000 ... 0x7fffffff: /* RAM */
>         case 0x80000000 ... 0x9fffffff: /* RAM */
>             *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>             break;
>         case 0x40000000 ... 0x5fffffff: /* Peripheral */
>         case 0xa0000000 ... 0xbfffffff: /* Device */
>         case 0xc0000000 ... 0xdfffffff: /* Device */
>         case 0xe0000000 ... 0xffffffff: /* System */
>             *prot = PAGE_READ | PAGE_WRITE;
>             break;
>         default:
>             g_assert_not_reached();
>         }
>
> would be the explicit version.
>

I see you added that before your pull request, thank!

For what it's worth:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>>>          }
>>> -        break;
>>> -    case 0x00000000 ... 0x7FFFFFFF:
>>> -        *prot |= PAGE_EXEC;
>>> -        break;
>>>      }
>>> -
>>>  }
>>>
>>>  static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>
> thanks
> -- PMM
>

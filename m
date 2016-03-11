Received: by 10.25.208.211 with SMTP id h202csp1280959lfg;
        Fri, 11 Mar 2016 15:45:11 -0800 (PST)
X-Received: by 10.140.89.103 with SMTP id u94mr15291526qgd.3.1457739911910;
        Fri, 11 Mar 2016 15:45:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 110si10883793qgy.36.2016.03.11.15.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Mar 2016 15:45:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@yandex.ru;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:58280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aeWk3-0005xz-GA
	for alex.bennee@linaro.org; Fri, 11 Mar 2016 18:45:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1aeWk0-0005vF-Mw
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 18:45:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1aeWjx-0001NH-7w
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 18:45:08 -0500
Received: from forward18h.cmail.yandex.net ([87.250.230.160]:37855)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1aeWjw-0001Mn-Q0; Fri, 11 Mar 2016 18:45:05 -0500
Received: from web28h.yandex.ru (web28h.yandex.ru [IPv6:2a02:6b8:0:f05::38])
	by forward18h.cmail.yandex.net (Yandex) with ESMTP id 9B0592202C;
	Sat, 12 Mar 2016 02:45:01 +0300 (MSK)
Received: from web28h.yandex.ru (localhost [127.0.0.1])
	by web28h.yandex.ru (Yandex) with ESMTP id E017822179F;
	Sat, 12 Mar 2016 02:45:00 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1457739901; bh=iR4lUhJKsUcSJ0tPTqEEjxy0JhGPzQr1wgtsua+IjsI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jnHeHvxyNGuuWfeWk59xUZrAnXWGxznqTbRj6QQZn9rFgOA7kfWC1dT4j9ZOiWFOK
	gOsmDL5Hx6JVfKrgKGZHsPrAG4KCYbXh+SKmtvtVcD+rRPfvDAfcgKezIphBeZxpkZ
	NKSiNQqYSd1HzERm+zXc12oT6Z8GE8Qd0w6Yn520=
Received: by web28h.yandex.ru with HTTP;
	Sat, 12 Mar 2016 02:44:59 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8F9AdePC4h8ZqPftbBatnhbge=1jpoe1gdrYstpdiwzA@mail.gmail.com>
References: <1457107473-26292-1-git-send-email-afarallax@yandex.ru>
	<CAFEAcA8F9AdePC4h8ZqPftbBatnhbge=1jpoe1gdrYstpdiwzA@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1022901457739899@web28h.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Sat, 12 Mar 2016 02:44:59 +0300
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.250.230.160
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: Fix descriptor address masking
	in ARM address translation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pavGJwyV7S8v

11.03.2016, 11:41, "Peter Maydell" <peter.maydell@linaro.org>:
>On 4 March 2016 at 23:04, Sergey Sorokin <afarallax@yandex.ru> wrote:
>> There is a bug in ARM address translation regime with a long-descriptor
>> format. On the descriptor reading its address is formed from an index
>> which is a part of the input address. And on the first iteration this index
>> is incorrectly masked with 'grainsize' mask. But it can be wider according
>> to pseudo-code.
>> On the other hand on the iterations other than first the descriptor address
>> is formed from the previous level descriptor by masking with 'descaddrmask'
>> value. It always clears just 12 lower bits, but it must clear 'grainsize'
>> lower bits instead according to pseudo-code.
>> The patch fixes both cases.
>
>This is pretty confusing to understand -- it might help if you
>could give an example.

According to documentation (ARMv8 ARM DDI 0487A.i J1.1.5:
aarch64/translation/walk/AArch64.TranslationTableWalk):

bits(48) index = ZeroExtend(inputaddr<addrselecttop:addrselectbottom>:'000');
descaddr.paddress.physicaladdress = baseaddress OR index;

For a first iteration of the descriptor reading:

addrselecttop = inputsize - 1;
addrselectbottom = (3-level)*stride + grainsize;

Let's assume grainsize == 12 (so stride == 9), level == 1, inputsize == 43.
Then index is
inputaddr<42:30>:'000';

But currently QEMU incorrecly masks an input address with descmask value:

descmask = (1ULL << (stride + 3)) - 1;
...
descaddr |= (address >> (stride * (4 - level))) & descmask;
descaddr &= ~7ULL;

Then the index in my example in QEMU is:
address<38:30>:'000';

And my patch fixes this bug.

>
>Is this something that only causes problems for the "concatenated
>translation tables at the initial level" case (which is only
>possible for S2 tables) ?
>
>> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
>> ---
>>  target-arm/helper.c | 29 ++++++++++-------------------
>>  1 file changed, 10 insertions(+), 19 deletions(-)
>>
>> diff --git a/target-arm/helper.c b/target-arm/helper.c
>> index dec8e8b..b5f289c 100644
>> --- a/target-arm/helper.c
>> +++ b/target-arm/helper.c
>> @@ -7243,7 +7243,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>>      uint32_t tg;
>>      uint64_t ttbr;
>>      int ttbr_select;
>> -    hwaddr descaddr, descmask;
>> +    hwaddr descaddr, indexmask, indexmask_grainsize;
>>      uint32_t tableattrs;
>>      target_ulong page_size;
>>      uint32_t attrs;
>> @@ -7431,28 +7431,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>>          }
>>      }
>>
>> -    /* Clear the vaddr bits which aren't part of the within-region address,
>> -     * so that we don't have to special case things when calculating the
>> -     * first descriptor address.
>> -     */
>> -    if (va_size != inputsize) {
>> -        address &= (1ULL << inputsize) - 1;
>> -    }
>> -
>> -    descmask = (1ULL << (stride + 3)) - 1;
>> +    indexmask_grainsize = (1ULL << (stride + 3)) - 1;
>> +    indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
>>
>>      /* Now we can extract the actual base address from the TTBR */
>>      descaddr = extract64(ttbr, 0, 48);
>> -    descaddr &= ~((1ULL << (inputsize - (stride * (4 - level)))) - 1);
>> +    descaddr &= ~indexmask;
>>
>> -    /* The address field in the descriptor goes up to bit 39 for ARMv7
>> -     * but up to bit 47 for ARMv8.
>> +    /* The address field in the descriptor goes up to bit 39 for AArch32
>> +     * but up to bit 47 for AArch64.
>>       */
>
>This is not correct -- the descriptor field widths are as the comment
>states before your patch:
> * up to bit 39 for ARMv7
> * up to bit 47 for ARMv8 (whether AArch32 or AArch64)
>
>See the v8 ARM ARM AArch32.TranslationTableWalkLD pseudocode and in
>particular note the width which it uses for AddressSizeFault checks.

I see in ARMv8 ARM DDI 0487A.i J1.2.4
aarch32/translation/walk/AArch32.TranslationTableWalkLD:

Before 'repeat' cycle:
baseaddress = baseregister<39:baselowerbound>:Zeros(baselowerbound);

Inside the cycle:
baseaddress = desc<39:grainsize>:Zeros(grainsize);

We use 'descaddrmask' in QEMU to get this 'baseaddress' from a descriptor.
So my patch is correct and fixes the bug.

>
>> -    if (arm_feature(env, ARM_FEATURE_V8)) {
>> -        descaddrmask = 0xfffffffff000ULL;
>> -    } else {
>> -        descaddrmask = 0xfffffff000ULL;
>> -    }
>> +    descaddrmask = ((1ull << (va_size == 64 ? 48 : 40)) - 1) &
>> +                   ~indexmask_grainsize;
>
>...so this part of the patch is wrong.
>
>>
>>      /* Secure accesses start with the page table in secure memory and
>>       * can be downgraded to non-secure at any step. Non-secure accesses
>> @@ -7464,7 +7454,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>>          uint64_t descriptor;
>>          bool nstable;
>>
>> -        descaddr |= (address >> (stride * (4 - level))) & descmask;
>> +        descaddr |= (address >> (stride * (4 - level))) & indexmask;
>>          descaddr &= ~7ULL;
>>          nstable = extract32(tableattrs, 4, 1);
>>          descriptor = arm_ldq_ptw(cs, descaddr, !nstable, mmu_idx, fsr, fi);
>> @@ -7487,6 +7477,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>>               */
>>              tableattrs |= extract64(descriptor, 59, 5);
>>              level++;
>> +            indexmask = indexmask_grainsize;
>>              continue;
>>          }
>>          /* Block entry at level 1 or 2, or page entry at level 3.
>> --
>> 1.9.3
>>
>
>thanks
>-- PMM

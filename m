Received: by 10.182.158.201 with SMTP id ww9csp3378023obb;
        Wed, 2 Dec 2015 14:55:45 -0800 (PST)
X-Received: by 10.55.215.137 with SMTP id t9mr7141931qkt.23.1449096945281;
        Wed, 02 Dec 2015 14:55:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o190si5832045qhb.8.2015.12.02.14.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 14:55:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4GJM-00066O-Us
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 17:55:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4GJL-00066J-4b
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 17:55:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4GJF-0002BY-Aw
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 17:55:43 -0500
Received: from mail-qg0-x233.google.com ([2607:f8b0:400d:c04::233]:34747)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4GJF-0002BT-6v; Wed, 02 Dec 2015 17:55:37 -0500
Received: by qgeb1 with SMTP id b1so47231449qge.1;
	Wed, 02 Dec 2015 14:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=tR5eBjEEz7Eji7087h0YtKsJk7Bx6W+1fjET3IQhOlo=;
	b=oWw7NT1u1zPgGO7nwpY/iLsrzZ+xDuIesrwcAYejgb0wZTSVFTdG+Kb04woYd6YMt8
	4IEzM9G8/2x77hKsV1yT07ojvMqGA8Iv2JwPt3N5KFIYpf6qHAnw4kkJfUcZRwZ5c0hp
	dFfuF1qjqQoKA6PgQpKpzn3oWB6w5n1UZ2gu9h3tWm6F9/lpOvWfo9yBIzFoMfOuJWam
	2t46VU11Pf1vy6F4tLr4nRD7a5fn7bWx6B6bms6oWAPiQnjvekk+j9BQittMqFLE97tP
	D3yUBqCcY2N+iQW8u2kJa2++LrJ7/z1mVq8wZXG5ZrKqV0OFaOkiWb5L7uhleur/ST49
	LlhQ==
X-Received: by 10.140.44.9 with SMTP id f9mr7277600qga.69.1449096936776;
	Wed, 02 Dec 2015 14:55:36 -0800 (PST)
Received: from [10.142.1.2] (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	s131sm2132519qhs.11.2015.12.02.14.55.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Dec 2015 14:55:36 -0800 (PST)
Message-ID: <565F76E7.4060305@gmail.com>
Date: Wed, 02 Dec 2015 17:55:35 -0500
From: Michael Davidsaver <mdavidsaver@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-5-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA-yuKpZzEV1T1VMOU1HPbspTHP8PsSw80=UPr7mw2aBjw@mail.gmail.com>
In-Reply-To: <CAFEAcA-yuKpZzEV1T1VMOU1HPbspTHP8PsSw80=UPr7mw2aBjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::233
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 04/18] armv7m: Explicit error for bad vector
	table
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
X-TUID: xYGAOB+jisRT



On 11/17/2015 12:33 PM, Peter Maydell wrote:
> On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>> Give an explicit error and abort when a load
>> from VECBASE fails.  Otherwise would likely
>> jump to 0, which for v7-m holds the reset stack
>> pointer address.
>>
>> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
>> ---
>>  target-arm/helper.c | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/target-arm/helper.c b/target-arm/helper.c
>> index 4178400..1d7ac43 100644
>> --- a/target-arm/helper.c
>> +++ b/target-arm/helper.c
>> @@ -5496,7 +5496,17 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>>      /* Clear IT bits */
>>      env->condexec_bits = 0;
>>      env->regs[14] = lr;
>> -    addr = ldl_phys(cs->as, env->v7m.vecbase + env->v7m.exception * 4);
>> +    {
>> +        MemTxResult result;
>> +        addr = address_space_ldl(cs->as,
>> +                                 env->v7m.vecbase + env->v7m.exception * 4,
>> +                                 MEMTXATTRS_UNSPECIFIED, &result);
>> +        if (result != MEMTX_OK) {
>> +            cpu_abort(cs, "Failed to read from exception vector table "
>> +                      "entry %08x\n",
>> +                      env->v7m.vecbase + env->v7m.exception * 4);
>> +        }
>> +    }
> 
> The behaviour on a failed vector table read is actually architecturally
> specified: we should take a nested exception (escalated to HardFault).
> If it happens while we're trying to take a HardFault in the first place
> then we go into Lockup (where the CPU sits around repeatedly trying
> to execute an instruction at 0xFFFFFFFE; it is technically possible
> to get back out of Lockup by taking an NMI or a system reset).
> 
> That said, trying to get nested exceptions and priority escalation
> right is fairly involved, and implementing lockup is both involved
> and an exercise in pointlessness. So I think this code is an
> improvement overall.

This is my thinking as well.  One point against it is that abort() is inconvenient when using '-gdb'.  I'm not sure if there is something else which could be done (cpu halt?).

> I would suggest some small changes, though:
> 
> (1) factor this out into its own function, something like:
> static uint32_t v7m_read_vector(CPUARMState *env, int excnum)
> so the calling code can just do
>    addr = v7m_read_vector(env, env->v7m.exception);
> (2) use a local variable for "env->v7m.vecbase + excnum * 4"
> rather than calculating it twice

Done.

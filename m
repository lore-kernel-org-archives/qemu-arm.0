Received: by 10.182.158.201 with SMTP id ww9csp6918558obb;
        Mon, 28 Dec 2015 10:37:08 -0800 (PST)
X-Received: by 10.55.212.92 with SMTP id l89mr73519920qki.70.1451327828452;
        Mon, 28 Dec 2015 10:37:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e145si55224751qhc.2.2015.12.28.10.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Dec 2015 10:37:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:45812 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aDcfM-0001Lt-5R
	for alex.bennee@linaro.org; Mon, 28 Dec 2015 13:37:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDcfI-0001Jl-Ji
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 13:37:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDcfH-0004lW-8B
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 13:37:04 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:36351)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDcfG-0004l5-0j
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 13:37:03 -0500
Received: by mail-vk0-x231.google.com with SMTP id f2so143684325vkb.3
	for <qemu-arm@nongnu.org>; Mon, 28 Dec 2015 10:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=INBFeZrcaauteabZ3BhJRkS2vpR9L4Y+I+14mknqWko=;
	b=T+Br/bq5Wm5rk/NY2v3YdmS+IU9UxLEjykAXfv6J8Q8ulTX0Cj4qLGnjKp5n5kSVS3
	WV+D1abMiS0948PlvXJjuJ1NNIdspOTuQM+zf1xZCmU5gFINyXYPCRRjt5JWWAzeXg9q
	14QX0moDXLW7DjHhJT9tVAg26/L7GhMBkqrxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=INBFeZrcaauteabZ3BhJRkS2vpR9L4Y+I+14mknqWko=;
	b=l9R98Ce87Q3vxC4BwWC8Ak3XMYWD7HqWfC76xtk2qtSQka9n2/1eJWVcTZXbIKSgKy
	SmifYZKSPuIEXQdGz4M3MYDZ1gSAtMQhLVhkKY34G+h41WOeCu9iGTBWHKQT35TyJkQ4
	hRqcQBorXQpU3JKgFEui+GLNSy3rUrtCofoPfjVtV8YkiQLzcgJwJRen6sL42JC19fqe
	WMd7gcxAMdrubwuaWDVM2YR/N0JrHWMLtS8ENPCT7LvEbdI1WWg/6ZoFz7VfqsXPwrPV
	BJIpMBIt7g6LkQaf357gQ4jz/FlnxJvDNdHJMYGIG3row7tLxzDr2rICx+cHKUVHs/po
	zHJQ==
X-Gm-Message-State: ALoCoQmSeyqkz9tgEGJiKOH/SedGhami1FRi3RoBRRFR5fU3mfvGQPbCLEinhZ9+XBpBhHdQ40r9rDqTDfwwq61R171WcR1Yc4Na0+5NIRpJZEvbA0sL0pk=
X-Received: by 10.31.194.21 with SMTP id s21mr35129077vkf.92.1451327821635;
	Mon, 28 Dec 2015 10:37:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 28 Dec 2015 10:36:42 -0800 (PST)
In-Reply-To: <5680487C.7020007@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-3-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA90sBFurRv6rbDEP7Q-qEy2PrpH7BgHVFOt15ZDfk68NQ@mail.gmail.com>
	<5680487C.7020007@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Dec 2015 18:36:42 +0000
Message-ID: <CAFEAcA-8Q6iyCn0wEkxuwPzyWovi3o_s+XUB7_jPUUiag4oLAQ@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 02/26] armv7m: Undo armv7m.hack
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
X-TUID: XdzWg94ocqTd

On 27 December 2015 at 20:22, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> On 12/17/2015 10:38 AM, Peter Maydell wrote:
>> On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>>> Add CPU unassigned access handler in place of special
>>> MemoryRegion to catch exception returns.
>>>
>>> The unassigned handler will signal other faults as either
>>> prefetch or data exceptions, with the FSR code 0x8 to
>>> distinguish them from memory translation faults (0xd).
>>> Future code will make use of this distinction when
>>> deciding to raise BusFault or MemManage exceptions.
>> This patch breaks my Stellaris test image -- instead of starting
>> it just sits there with a black screen.
>>
>> I've put a copy of that test image up at
>>   http://people.linaro.org/~peter.maydell/stellaris.tgz
>> You can run it with path/to/stellaris/runme path/to/qemu-system-arm .
>
> There were several issues.  Two bugs (wrong IRQ enabled and systick not
> enabled) and a "feature" (access to unimplemented registers for a PWM
> controller is now a BusFault).
>
> As a workaround for the "feature" I add a low priority MemoryRegion from
> 0x40000000 -> 0x40ffffff which completes all reads with zero and logs.
> Please advise on how this should be handled.

We should probably at least identify what particular devices are
supposed to be here and put in dummy versions, rather than just
having a single memory region which does RAZ/WI.

> With these changes both test programs appear to run correctly, although
> the http server example has painfully slow load times and seems to hit
> an out of memory condition if I look at it wrong.  Is this expected?
> (and the blub on the buttons page about "xml technology" is priceless)

I don't run the HTTP example often. The basic requirement is
"should not get any worse as a result of the patchset". Problems
that were already there before need not be addressed.

>>> @@ -294,19 +313,9 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>>>          cc->do_interrupt(cs);
>>>          ret = true;
>>>      }
>>> -    /* ARMv7-M interrupt return works by loading a magic value
>>> -     * into the PC.  On real hardware the load causes the
>>> -     * return to occur.  The qemu implementation performs the
>>> -     * jump normally, then does the exception return when the
>>> -     * CPU tries to execute code at the magic address.
>>> -     * This will cause the magic PC value to be pushed to
>>> -     * the stack if an interrupt occurred at the wrong time.
>>> -     * We avoid this by disabling interrupts when
>>> -     * pc contains a magic address.
>>> -     */
>>>      if (interrupt_request & CPU_INTERRUPT_HARD
>>>          && !(env->daif & PSTATE_I)
>>> -        && (env->regs[15] < 0xfffffff0)) {
>>> +            ) {
>> Can we really drop this change? The thing it's guarding against
>> (interrupt comes in while the PC is this not-really-an-address
>> value) can still happen whether we catch the attempt to execute
>> in translate.c or via the unassigned-access hook.
>
> I don't think the M-profile case in gen_intermediate_code() in
> translate.c can ever be reached without first hitting the unassigned
> memory handler.  Before the code can be translated, the page containing
> it must be loaded.  Such loads no longer succeed.

Yes, but the code you've deleted here may be called after
we have set the PC to a magic value but before we have tried
to do the address load for it:
 1 translation block A (with the pop or ldm) sets PC to
   0xfffffffx, and execution leaves this TB and returns to
   the top level loop
 2 normally, we would then try to execute at the magic address,
   which would result in our trying to translate a TB for that
   address, which immediately causes us to run the code in the
   unassigned-access hook. That will cause the PC to be set
   to the appropriate value for having returned from the
   interrupt handler
 3 however, it is possible that an interrupt has been raised
   which means that between steps 1 and 2 we will say "actually,
   need to take an interrupt now". Since between steps 1 and 2
   the value in env->regs[15] is the magic 0xfffffffx value,
   we will end up stacking the magic value as part of the
   interrupt entry process. This is wrong, and the reason for
   the condition above is to avoid this problem.

Changing the handling of "PC == magic value" from translate.c
to the unassigned-access hook does not close the window where
env->regs[15] is a value the guest should not see as an
interrupted PC.

thanks
-- PMM

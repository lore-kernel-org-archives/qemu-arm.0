Received: by 10.182.158.201 with SMTP id ww9csp6404785obb;
        Sun, 27 Dec 2015 12:22:30 -0800 (PST)
X-Received: by 10.140.92.84 with SMTP id a78mr54357688qge.10.1451247750497;
        Sun, 27 Dec 2015 12:22:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h66si61381163qgf.80.2015.12.27.12.22.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 27 Dec 2015 12:22:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aDHpm-0002sn-1k
	for alex.bennee@linaro.org; Sun, 27 Dec 2015 15:22:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1aDHpj-0002sg-PK
	for qemu-arm@nongnu.org; Sun, 27 Dec 2015 15:22:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1aDHpe-0001Jo-Q1
	for qemu-arm@nongnu.org; Sun, 27 Dec 2015 15:22:27 -0500
Received: from mail-qk0-x234.google.com ([2607:f8b0:400d:c09::234]:36595)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1aDHpe-0001Jk-KQ; Sun, 27 Dec 2015 15:22:22 -0500
Received: by mail-qk0-x234.google.com with SMTP id q19so14779115qke.3;
	Sun, 27 Dec 2015 12:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=CvXxrvXtPtxJMrALnDAmvyV7xXuycyDgTC4yGV6zrlE=;
	b=sDvWXCJo6mj3CBJOMjnkWtpkfBg4T+f/OYszkHO1+ejqaC8I1rjVtnwHbghq+pJfzr
	G+IFVKrlv723Nolg8vitZMfZnqlrVnak0jG97UOXRpxaXKJlBLT2adocq6vvS94NFIyK
	+yPdylwVKLGuFXpNXA3fY4rx3cl3TD1wmPDBJDzKiD8Yr9eQVj5WRBfBMS/7lqpHkoZk
	wjVboSBH2o6yEXRfdXhkJj2knSD1yu+B8w/vcB/N9IHQY0MIn29vPjUMJddcAB5JAJrc
	UVe1e7pL6zwzfSJStNAX0vRZsQ6zFef6VE4ioxecj18W8ezTAhW9QqoR010APz+/tX5u
	l1Rg==
X-Received: by 10.55.33.234 with SMTP id f103mr8089316qki.45.1451247742117;
	Sun, 27 Dec 2015 12:22:22 -0800 (PST)
Received: from [10.0.1.200] (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	y102sm25954997qge.33.2015.12.27.12.22.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Dec 2015 12:22:21 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-3-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA90sBFurRv6rbDEP7Q-qEy2PrpH7BgHVFOt15ZDfk68NQ@mail.gmail.com>
From: Michael Davidsaver <mdavidsaver@gmail.com>
Message-ID: <5680487C.7020007@gmail.com>
Date: Sun, 27 Dec 2015 15:22:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA90sBFurRv6rbDEP7Q-qEy2PrpH7BgHVFOt15ZDfk68NQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::234
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
X-TUID: wgf1ksiCqduI

On 12/17/2015 10:38 AM, Peter Maydell wrote:
> On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>> Add CPU unassigned access handler in place of special
>> MemoryRegion to catch exception returns.
>>
>> The unassigned handler will signal other faults as either
>> prefetch or data exceptions, with the FSR code 0x8 to
>> distinguish them from memory translation faults (0xd).
>> Future code will make use of this distinction when
>> deciding to raise BusFault or MemManage exceptions.
> This patch breaks my Stellaris test image -- instead of starting
> it just sits there with a black screen.
>
> I've put a copy of that test image up at
>   http://people.linaro.org/~peter.maydell/stellaris.tgz
> You can run it with path/to/stellaris/runme path/to/qemu-system-arm .

There were several issues.  Two bugs (wrong IRQ enabled and systick not
enabled) and a "feature" (access to unimplemented registers for a PWM
controller is now a BusFault).

As a workaround for the "feature" I add a low priority MemoryRegion from
0x40000000 -> 0x40ffffff which completes all reads with zero and logs. 
Please advise on how this should be handled.

With these changes both test programs appear to run correctly, although
the http server example has painfully slow load times and seems to hit
an out of memory condition if I look at it wrong.  Is this expected? 
(and the blub on the buttons page about "xml technology" is priceless)

I can see that the http server example spends some time attempting MII
operations on the NIC.  As these aren't modeled it spins and eventually
gives up.

> ...
> We could use a comment here (a) explaining what we're doing and (b)
> mentioning that this isn't architecturally correct -- ideally we
> should catch these exception exits on execution of the jump insn, not
> by letting the jump execute and then trapping when we actually try to
> execute at the magic addresses. 

Will do.

>> ...
>> @@ -294,19 +313,9 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>>          cc->do_interrupt(cs);
>>          ret = true;
>>      }
>> -    /* ARMv7-M interrupt return works by loading a magic value
>> -     * into the PC.  On real hardware the load causes the
>> -     * return to occur.  The qemu implementation performs the
>> -     * jump normally, then does the exception return when the
>> -     * CPU tries to execute code at the magic address.
>> -     * This will cause the magic PC value to be pushed to
>> -     * the stack if an interrupt occurred at the wrong time.
>> -     * We avoid this by disabling interrupts when
>> -     * pc contains a magic address.
>> -     */
>>      if (interrupt_request & CPU_INTERRUPT_HARD
>>          && !(env->daif & PSTATE_I)
>> -        && (env->regs[15] < 0xfffffff0)) {
>> +            ) {
> Can we really drop this change? The thing it's guarding against
> (interrupt comes in while the PC is this not-really-an-address
> value) can still happen whether we catch the attempt to execute
> in translate.c or via the unassigned-access hook.

I don't think the M-profile case in gen_intermediate_code() in
translate.c can ever be reached without first hitting the unassigned
memory handler.  Before the code can be translated, the page containing
it must be loaded.  Such loads no longer succeed.

Put more literally, gen_intermediate_code() is only called from
tb_gen_code() where it comes after a call to get_page_addr_code(),
wherein the unassigned handler calls cpu_loop_exit().

I've replaced the M case for EXCP_EXCEPTION_EXIT in
gen_intermediate_code() with an assert.  So far it hasn't failed.


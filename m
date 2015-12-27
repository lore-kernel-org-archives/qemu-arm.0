Received: by 10.182.158.201 with SMTP id ww9csp6414622obb;
        Sun, 27 Dec 2015 12:56:20 -0800 (PST)
X-Received: by 10.140.102.246 with SMTP id w109mr66321474qge.58.1451249780729;
        Sun, 27 Dec 2015 12:56:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a80si55719150qge.39.2015.12.27.12.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 27 Dec 2015 12:56:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aDIMW-0007vt-EF
	for alex.bennee@linaro.org; Sun, 27 Dec 2015 15:56:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1aDIMU-0007vZ-Bz
	for qemu-arm@nongnu.org; Sun, 27 Dec 2015 15:56:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1aDIMQ-00081C-SK
	for qemu-arm@nongnu.org; Sun, 27 Dec 2015 15:56:18 -0500
Received: from mail-qk0-x234.google.com ([2607:f8b0:400d:c09::234]:33100)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1aDIMQ-000818-O1; Sun, 27 Dec 2015 15:56:14 -0500
Received: by mail-qk0-x234.google.com with SMTP id k189so190472755qkc.0;
	Sun, 27 Dec 2015 12:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=4a2sH7kTT0a2JxhDvfTZtBPMrr+U/C8SzGtV+GyMLRU=;
	b=YMASdH6XTYWNW7S8tLW6qzpDDRFUShtFkwGBUiTSi7JyWlL56jxZ1a7ud8mwYupv5K
	xDIf+uVqSrS6smiW8PKLFc9tNmmB1J8RMTr/gdGQTSdQDpc6AyZTbjsgHvYBOTJcVc52
	LnGe1MJgB12cj0cA2nldgbMZ67U1vt7Q8TYpSWMhf55LixPz+4ia9W694jkTkBOewhXv
	SatDHqbAftazKhLXPYXcI4+CiFDI9gbJ1VP8L4TLUYEJs+h/rxmZd8C/rbTo9ueRex3X
	rTsuGJvekT+wqWiAUoMzI+4T/a0/58PEpTYJx0Hu7AiGlMIKBnKgjBlrDWWbeo/D1sc5
	+AMw==
X-Received: by 10.55.198.152 with SMTP id s24mr67045344qkl.75.1451249774357;
	Sun, 27 Dec 2015 12:56:14 -0800 (PST)
Received: from [10.0.1.200] (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	45sm26087391qgg.17.2015.12.27.12.56.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Dec 2015 12:56:13 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-6-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA-0Z=rhtvO0o=WoAE4pBQ0Zqrj1n_OtcdW+2FAOd0FH9A@mail.gmail.com>
From: Michael Davidsaver <mdavidsaver@gmail.com>
Message-ID: <5680506D.9050402@gmail.com>
Date: Sun, 27 Dec 2015 15:56:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-0Z=rhtvO0o=WoAE4pBQ0Zqrj1n_OtcdW+2FAOd0FH9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::234
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 05/26] armv7m: add
	armv7m_excp_running_prio()
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
X-TUID: or/UR+Ynaq/S

On 12/17/2015 09:36 AM, Peter Maydell wrote:
> On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>> Implements v7m exception priority algorithm
>> using FAULTMASK, PRIMASK, BASEPRI, and the highest
>> priority active exception.
>>
>> The number returned is the current execution priority
>> which may be in the range [-2,0x7f] when an exception is active
>> or 0x100 when no exception is active.
>> ---
>>  hw/intc/armv7m_nvic.c | 25 +++++++++++++++++++++++++
>>  target-arm/cpu.h      |  1 +
>>  2 files changed, 26 insertions(+)
>>
>> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
>> index 6fc167e..0145ca7 100644
>> --- a/hw/intc/armv7m_nvic.c
>> +++ b/hw/intc/armv7m_nvic.c
>> @@ -18,6 +18,8 @@
>>
>>  typedef struct {
>>      GICState gic;
>> +    uint8_t prigroup;
>> +
>>      struct {
>>          uint32_t control;
>>          uint32_t reload;
>> @@ -116,6 +118,29 @@ static void systick_reset(nvic_state *s)
>>      timer_del(s->systick.timer);
>>  }
>>
>> +/* @returns the active (running) exception priority.
>> + *    only a higher (numerically lower) priority can preempt.
>> + */
>> +int armv7m_excp_running_prio(ARMCPU *cpu)
>> +{
>> +    CPUARMState *env = &cpu->env;
>> +    nvic_state *s = env->nvic;
>> +    int running;
>> +
>> +    if (env->daif & PSTATE_F) { /* FAULTMASK */
>> +        running = -1;
>> +    } else if (env->daif & PSTATE_I) { /* PRIMASK */
>> +        running = 0;
>> +    } else if (env->v7m.basepri > 0) {
>> +        /* BASEPRI==1 -> masks [1,255] (not same as PRIMASK==1) */
>> +        running = env->v7m.basepri >> (s->prigroup+1);
> This isn't right -- the effect of PRIGROUP is that we mask
> out the lower (subgroup) bits, but the upper group bits stay
> where they are rather than shifting down.
>
> So you want env->v7m.basepri & ~((1 << (s->prigroup + 1)) - 1);
>
> (the same mask you need to get the group priority for
> an interrupt).

I don't know about "right", but it is consistent with how the
.prio_group field is now handled in the nvic.  So I think the final
behavior is as specified.

There is no functional reason that I do this.  I just think it makes the
DPRINTF messages easier to interpret.  If you feel strongly I can change
this.


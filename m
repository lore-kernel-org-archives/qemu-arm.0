Received: by 10.182.158.201 with SMTP id ww9csp6920532obb;
        Mon, 28 Dec 2015 10:41:42 -0800 (PST)
X-Received: by 10.140.94.20 with SMTP id f20mr48165808qge.95.1451328102115;
        Mon, 28 Dec 2015 10:41:42 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9si65880126qky.46.2015.12.28.10.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Dec 2015 10:41:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:45828 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aDcjl-0004QU-Rh
	for alex.bennee@linaro.org; Mon, 28 Dec 2015 13:41:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDcjT-00048s-Kr
	for qemu-devel@nongnu.org; Mon, 28 Dec 2015 13:41:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDcjS-0005f7-Nh
	for qemu-devel@nongnu.org; Mon, 28 Dec 2015 13:41:23 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:34877)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDcjS-0005ez-Jo
	for qemu-devel@nongnu.org; Mon, 28 Dec 2015 13:41:22 -0500
Received: by mail-vk0-x233.google.com with SMTP id k1so55635219vkb.2
	for <qemu-devel@nongnu.org>; Mon, 28 Dec 2015 10:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=79HaPxZRNu4FFYl/cwS2kPvWF/7RPf0BbahkV+F4pc8=;
	b=Wn/lMmOSKD3L1BvkA27N5Ts7HGhRn31U7IDm6whjyEsjPxUufa/tbhluffUWHwBySW
	296ZyTczv8KFIEWY/sVBiZeELo+F9nHYJ27HkpKYIgPReXSAzt7fCvCctHTnFWUUjwKY
	e3UqET5hnZgYDoAEJfjAsr5oLAZHkqrUItS7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=79HaPxZRNu4FFYl/cwS2kPvWF/7RPf0BbahkV+F4pc8=;
	b=C5tWvbrPe+fhb2PltJs8Fz9q0g8v53gN8PSvzW5N6XBtbHngcEKafCZ+pZnHfEi6Cr
	4iKbfa6+Nujo4BVCjvXV/QgyKe5t3DfnCNbb93ueFpWXPvVm8HeTM4/wgjEwkxGO6Gfq
	DT17wGbeNI/SqQQ7kwCW+v0pKzBkTBTjG5ZffV3eC+WkYH6uRT6m6PXNIAvdx/IMfD/y
	rcYAi9SiFGNB8ZlUHQG1Na7yRoLtCTihTHQsVCcFKPp6dXlb/sH2hScVZaSPI6yD4iW8
	Iy4YUObQXUH5jBsFOlnKdpGaEMGOplCN/uWyTvrlJOV65p6umZ4sAJ+1+L0GkM3rbbOU
	fEkg==
X-Gm-Message-State: ALoCoQmLO7rWWJRZjCvTHs8QT+kQ+9VS4H+/xvf61HqX0fE0cEgAnq014ZdkfWEE5mIXQGKEZB0vtuey/j4lfSDhJxGEZwHY51F42zJmCEChdkRqprbOjho=
X-Received: by 10.31.52.147 with SMTP id b141mr28971101vka.82.1451328081421;
	Mon, 28 Dec 2015 10:41:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 28 Dec 2015 10:41:01 -0800 (PST)
In-Reply-To: <5680506D.9050402@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-6-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA-0Z=rhtvO0o=WoAE4pBQ0Zqrj1n_OtcdW+2FAOd0FH9A@mail.gmail.com>
	<5680506D.9050402@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Dec 2015 18:41:01 +0000
Message-ID: <CAFEAcA9ot6iV93NesZQkHpSmJ_7rfrQ_NTs2u2pMk5hs0vCoYQ@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v2 05/26] armv7m: add
	armv7m_excp_running_prio()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1837XunYjO4g

On 27 December 2015 at 20:56, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> On 12/17/2015 09:36 AM, Peter Maydell wrote:
>> On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>>> Implements v7m exception priority algorithm
>>> using FAULTMASK, PRIMASK, BASEPRI, and the highest
>>> priority active exception.
>>>
>>> The number returned is the current execution priority
>>> which may be in the range [-2,0x7f] when an exception is active
>>> or 0x100 when no exception is active.
>>> ---
>>>  hw/intc/armv7m_nvic.c | 25 +++++++++++++++++++++++++
>>>  target-arm/cpu.h      |  1 +
>>>  2 files changed, 26 insertions(+)
>>>
>>> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
>>> index 6fc167e..0145ca7 100644
>>> --- a/hw/intc/armv7m_nvic.c
>>> +++ b/hw/intc/armv7m_nvic.c
>>> @@ -18,6 +18,8 @@
>>>
>>>  typedef struct {
>>>      GICState gic;
>>> +    uint8_t prigroup;
>>> +
>>>      struct {
>>>          uint32_t control;
>>>          uint32_t reload;
>>> @@ -116,6 +118,29 @@ static void systick_reset(nvic_state *s)
>>>      timer_del(s->systick.timer);
>>>  }
>>>
>>> +/* @returns the active (running) exception priority.
>>> + *    only a higher (numerically lower) priority can preempt.
>>> + */
>>> +int armv7m_excp_running_prio(ARMCPU *cpu)
>>> +{
>>> +    CPUARMState *env = &cpu->env;
>>> +    nvic_state *s = env->nvic;
>>> +    int running;
>>> +
>>> +    if (env->daif & PSTATE_F) { /* FAULTMASK */
>>> +        running = -1;
>>> +    } else if (env->daif & PSTATE_I) { /* PRIMASK */
>>> +        running = 0;
>>> +    } else if (env->v7m.basepri > 0) {
>>> +        /* BASEPRI==1 -> masks [1,255] (not same as PRIMASK==1) */
>>> +        running = env->v7m.basepri >> (s->prigroup+1);
>> This isn't right -- the effect of PRIGROUP is that we mask
>> out the lower (subgroup) bits, but the upper group bits stay
>> where they are rather than shifting down.
>>
>> So you want env->v7m.basepri & ~((1 << (s->prigroup + 1)) - 1);
>>
>> (the same mask you need to get the group priority for
>> an interrupt).
>
> I don't know about "right", but it is consistent with how the
> .prio_group field is now handled in the nvic.  So I think the final
> behavior is as specified.

The v7M ARM ARM is the authoritative source for "what is the
right behaviour", and the pseudocode is I think fairly clear
about how BASEPRI affects the running priority. If the current
NVIC code is handling BASEPRI wrongly that's a bug in the NVIC
code.

> There is no functional reason that I do this.  I just think it makes the
> DPRINTF messages easier to interpret.  If you feel strongly I can change
> this.

You need to get the right value here because otherwise we won't
be implementing the spec correctly.

thanks
-- PMM

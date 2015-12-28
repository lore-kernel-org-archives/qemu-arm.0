Received: by 10.182.158.201 with SMTP id ww9csp6919355obb;
        Mon, 28 Dec 2015 10:39:01 -0800 (PST)
X-Received: by 10.140.250.70 with SMTP id v67mr77485057qhc.43.1451327941021;
        Mon, 28 Dec 2015 10:39:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j125si39298182qhd.110.2015.12.28.10.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Dec 2015 10:39:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:45816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aDchA-0002JQ-Px
	for alex.bennee@linaro.org; Mon, 28 Dec 2015 13:39:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDch8-0002In-Up
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 13:38:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDch8-00051l-4T
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 13:38:58 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:35506)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDch7-00051d-Vx
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 13:38:58 -0500
Received: by mail-vk0-x22f.google.com with SMTP id k1so55608264vkb.2
	for <qemu-arm@nongnu.org>; Mon, 28 Dec 2015 10:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=dvXtVWJXDl6fhtDKKWNW8GqvWMe6sSvPMH7wrNucAic=;
	b=Tt3WnbK8/9fACBFefOeL2cg2ZFW6jMvYa6Y2tDnp0CjegYg5GZEk2vejrziRq28NFn
	HIj6uBAw2eiIKEeu9kiI0et5oBzjALTYhTy/7PGE8x+OUa/fIKHnI0JK57GlUB/ZSdOX
	EJofDZQt67kS0Jy8gBnAQZflI0B2iP2Owk3E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dvXtVWJXDl6fhtDKKWNW8GqvWMe6sSvPMH7wrNucAic=;
	b=fgNZs56aYz2bk614fs0brDOFIt33iaVcZGaTRmSSWgwwOCvMJc817mb0lqiqORz3Wk
	0TFM2QgQ5QD6HWJye2+Pt567sUot6V7AobeyVZmRn1Cc7Y1dxsHyljmYc9Jnj2q0A9W6
	jJreMDD6uGl/oYSdeP4hNJu8hKimGfmKAjkOQd1K3bZDjZ0LLB1I3otonbtWAwwuGqBS
	qL+FkwXy4wIrhbsMyQ/Mg8fugS9e2jSYNIO5UUJu8K/L42QqpiKrCYgQBS2YPbrZswrH
	30SCKwjAsghlpvMXLtgpvf2tkoIpl4ABN3ESB1dDEoKLmpk156nxzZ9dfATyDVPWzEvI
	oStQ==
X-Gm-Message-State: ALoCoQkDwQxI+h7tQqcPEh8itP+1EAkCYaCJG8gYpOahPfhm+vO1s5uMz75GjNFKz7ZCrfAznjWIjhxlm490amF++sM0BKCMGAtWyyIE/DyjYz1ZyBld8Xg=
X-Received: by 10.31.131.203 with SMTP id f194mr36345315vkd.90.1451327937634; 
	Mon, 28 Dec 2015 10:38:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 28 Dec 2015 10:38:38 -0800 (PST)
In-Reply-To: <56804D8E.3020509@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-4-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA--3_zaVHzhF5e5SEJ2avcOKVdwitu0iBXLwb9B6z073g@mail.gmail.com>
	<56804D8E.3020509@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Dec 2015 18:38:38 +0000
Message-ID: <CAFEAcA9tNGKg3s7-fVcOM84Ft3w3Ng1faQWprU8yDbQK=J4muw@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 03/26] armv7m: Explicit error for bad
	vector table
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
X-TUID: s7+qaGgBb0Kq

On 27 December 2015 at 20:43, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> On 12/17/2015 08:25 AM, Peter Maydell wrote:
>> On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>>> ...
>>> +static
>>> +uint32_t arm_v7m_load_vector(ARMCPU *cpu)
>>> +
>>> +{
>>> +    CPUState *cs = &cpu->parent_obj;
>> This isn't the right way to cast to the base class of a QOM object.
>> You want:
>>    CPUState *cs = CPU(cpu);
>
> from cpu.h
>
>> /* Since this macro is used a lot in hot code paths and in conjunction
>> with
>>  * FooCPU *foo_env_get_cpu(), we deviate from usual QOM practice by using
>>  * an unchecked cast.
>>  */
>> #define CPU(obj) ((CPUState *)(obj))
>
> Given the present definition of CPU() this change seems like a step
> backwards in terms of safety as mis-use won't be caught at compile or
> runtime.  I'll change it anyway.

The idea is that all code should use the QOM cast macros.
At the moment we have a special case for CPU() because it's
a hot path; in future we might be able to improve the speed of
the cast checking to the point where we can reinstate it.

thanks
-- PMM

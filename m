Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4187192wrq;
        Mon, 11 Jun 2018 08:33:42 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKu1TWzC5o6piH5bYz5Jy4Jbo/aiYLLk0uAl3edfIZZbPbFj9DPD4EMdUDRLfIvWHicn+u+
X-Received: by 2002:a37:3641:: with SMTP id d62-v6mr14487997qka.419.1528731222159;
        Mon, 11 Jun 2018 08:33:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528731222; cv=none;
        d=google.com; s=arc-20160816;
        b=NVgf0TB0Wehw4Qbe5ZQqz+A9hSSR8kL20UZzGsPltj+KgoH8cvR+D0Jfg0gJlfzMsl
         minsKao/0EpjQMC1qeGGpaV32PaBTDzHnGkD5K7KjbJPjp0sn/BS7zsunoS7oxnAlefg
         7VOOjrU1W13pwupEgMRbrwIFWyacB89+hkiJSM3xSLtp9sIJOjIeBQyghmkd416Y5cH7
         dv9NkZu4zmzXoSTkD1QlR10ngcynlOaQvylCbNJf4JgIo/6nU7rQ/7K1eX33X2puhgpq
         64IUIJIqo3Nd0qGZJZ4idjc/Nh1IsIzHFc7pV3Vw8wZQnytI5j1LaAaaUz8/wXR2Z9x0
         XbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zBstnVvqPilPeacVOA1Gc2Q5+f9/iXG+g+NtBLMkvCw=;
        b=U9B7icuShZQdORctu7QHYBeEYriA8kyA6bz70xOHFoAC9cSwdTrGFs/DifFRK49982
         nQ2USKIYVAkelFwUts1ScGqSj+1sR0JxxCcZIR41RwxXjgB+cUvsPaL/sjMip/bn0gmJ
         WS/Ry4w1oN6IgontszINQo1BWBYk5o3p89sL4rKy8h98MxV3ez1o+IKkzBUbx17HhxM/
         1J97Ihxr6wWbyT3PGzdSTz7fIZMHsuvroAx+UmqiLklV0kov7SWoupjqLB7ghbtPlXvL
         hPjRjRbCSy1YL4fWUNrmwyO7Qrs11GzZecUGdzy5WdfpJt6R7UByUZ+u78gisTkEQ9DV
         e0LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ami4crHl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k30-v6si7696993qtk.393.2018.06.11.08.33.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 08:33:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ami4crHl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSOpB-0006ss-Kn
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 11:33:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSOp2-0006sA-VO
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 11:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSOp2-0007zQ-5F
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 11:33:33 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:43359)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fSOp2-0007z6-0q
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 11:33:32 -0400
Received: by mail-ot0-x242.google.com with SMTP id i19-v6so24268849otk.10
	for <qemu-arm@nongnu.org>; Mon, 11 Jun 2018 08:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zBstnVvqPilPeacVOA1Gc2Q5+f9/iXG+g+NtBLMkvCw=;
	b=Ami4crHlCPRMuOBBTuNsTvFPmneGlJq7CO3tGeUzvAIy3YYXCTKuoFSWQ10tdoklPF
	ecYCaiSdMN8Y1f2APn3GWImysGvzmKz1JP8x6qXUvvjRx3Rfcybc7cN6t1DiHk+mjoua
	r8a05B359Fb1Rn+ky30oMauXfaG0+Max7eMZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zBstnVvqPilPeacVOA1Gc2Q5+f9/iXG+g+NtBLMkvCw=;
	b=poigoLKRnq9DyQOA4S++JV5q2d5flMCqQ/y8VtKU0YF6eVzdBrAxiGqEfvDMsn/I6k
	byNkpcAMd3drf+9dq57bODuV7IE9yMDBlA9sRYLC/SR9lfzrylZqOVuUOktOJLkd4G5V
	CcTVyp/IjV37ZUYhEWy2t8qkfYqwYqunYMlp/6tu9WZY3ZdvCXIGpgazQcxZK6LKqdaR
	qEitSH5IH9f7QVcCkRrSi19hLSOQ5lvwnP00NINrVM77N6/DraSdfDoe1hoYk8zJAbec
	/CtnFAmc1QLjiucaja4e815bFN5JqqDc7gzkHFuYPZLltpcCTc2rTZ7zUpQTGkReiYaN
	Jqjg==
X-Gm-Message-State: APt69E0n/NpUmTh5vvwXN5bgGT8+TSGRV+N0cMWUeiIQgAZKZzQ7xlFn
	GGzm4sQ6ZYTrv+Sju9dzQlN81vABw0Qu9/2rCPG9ew==
X-Received: by 2002:a9d:3fda:: with SMTP id
	i26-v6mr9572338ote.126.1528731211133; 
	Mon, 11 Jun 2018 08:33:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 08:33:10
	-0700 (PDT)
In-Reply-To: <20180611172644.5eeef770@redhat.com>
References: <20180601160355.15393-1-peter.maydell@linaro.org>
	<20180611172644.5eeef770@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jun 2018 16:33:10 +0100
Message-ID: <CAFEAcA8XC08joMpMgrBD99DSJLW=ri-8gtUpqM9jtFZLHnoxAg@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] arm: Don't crash if user tries
 to use a Cortex-M CPU without an NVIC
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
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lv8xk0qq28DQ

On 11 June 2018 at 16:26, Igor Mammedov <imammedo@redhat.com> wrote:
> On Fri,  1 Jun 2018 17:03:55 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
>> The Cortex-M CPU and its NVIC are two intimately intertwined parts of
>> the same hardware; it is not possible to use one without the other.
>> Unfortunately a lot of our board models don't do any sanity checking
>> on the CPU type the user asks for, so a command line like
>>     qemu-system-arm -M versatilepb -cpu cortex-m3
>> will create an M3 without an NVIC, and coredump immediately.
>> In the other direction, trying a non-M-profile CPU in an M-profile
>> board won't blow up, but doesn't do anything useful either:
>>     qemu-system-arm -M lm3s6965evb -cpu arm926

>> +#ifndef CONFIG_USER_ONLY
>> +    /* The NVIC and M-profile CPU are two halves of a single piece of
>> +     * hardware; trying to use one without the other is a command line
>> +     * error and will result in segfaults if not caught here.
>> +     */
>> +    if (arm_feature(env, ARM_FEATURE_M)) {
>> +        if (!env->nvic) {
>> +            error_setg(errp, "This board cannot be used with Cortex-M CPUs");
> mentioning board in CPU's realize seems a little bit strange,
> maybe something similar to following would be better:
>
>   "Cortex-M CPUs require device_foo for working"

I think the text as I have it is of more practical use to the
user, who is clearly not going to be very familiar with how
M-profile systems work if they've run into this error message.
"requires an NVIC" doesn't tell them what's actually wrong;
"this board doesn't work with this CPU" gives them a fighting
chance of understanding that they've given two incompatible
command line options.

thanks
-- PMM

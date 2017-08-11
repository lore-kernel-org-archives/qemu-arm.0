Received: by 10.25.221.202 with SMTP id w71csp1362056lfi;
        Fri, 11 Aug 2017 13:40:05 -0700 (PDT)
X-Received: by 10.200.9.75 with SMTP id z11mr23140072qth.283.1502484005509;
        Fri, 11 Aug 2017 13:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502484005; cv=none;
        d=google.com; s=arc-20160816;
        b=QSpHgE1HAEhCxu2fqz8IyTfFTruSRpy58+mZSJOU3E5lh65a9ACnhuZJlnP4XOHDCU
         MHP5jLswaO0xZlaEF/YWO/pMhakZbv5LRQ67+Oy3seF0AocR+kyWV6vA2scy9u33QrQ0
         8EF1L2dzKvWW12kZffC5JqQa9TTfRW4zwUa7zM5SJidPfXbfh7BaCFgGunTcQIHMTIM+
         jY23mdAhZ9qEFaQpNBeYF2Qco5PAJaKnA6QhbMUNhEq1Gsl/5PfNIrmjzcuagck3iY0K
         KARINzy5SAqh8wsYTt529VMPy1bX7Xyh6uj9ie92FhRAKImp9XqkNJsAgvOSuLnZCuOO
         GwLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zV9QWIxV6wzmM5IBfOEINdXAxYtrvH29wYW8MYYeywE=;
        b=g6HPNArVTgK82M6+pHpv4fOOf5U2kaSFQwwn8gkm5of+aKbJIh6egkCEK4IMN7cSMV
         hSRKsdKIIDhj/W6q5IaNsPfeaG7R+3A4aHwSWLLi49M7Xl9a+r0d+LyayFoKgAObGnXL
         Js/DZ19F0MbZb2U8YdB9Ipmq0OmVZmiyFId4wAOElPDCSXGarhxKvcq4+1ohpoJsQQy1
         CXYBVarmaan1ht4iJ+i2IwYfjtDOzh6OMhwjBfx3jAv3p9YMC8vHWbRp3EKsddirjKq5
         8sjY4epYoN0hICmhVDltJ2rtgvD3lTKd8mHSTF5kf5YbsOwF8FIx+1yGFB9LUO6/ohI7
         0+kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HRvX8vhQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v24si1528693qth.59.2017.08.11.13.40.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 13:40:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HRvX8vhQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgGiw-0004NS-Ug
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 16:40:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgGis-0004Ma-70
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 16:39:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgGir-0005Sr-AO
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 16:39:58 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:33667)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dgGir-0005Sb-3P; Fri, 11 Aug 2017 16:39:57 -0400
Received: by mail-wm0-x242.google.com with SMTP id q189so7702067wmd.0;
	Fri, 11 Aug 2017 13:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=zV9QWIxV6wzmM5IBfOEINdXAxYtrvH29wYW8MYYeywE=;
	b=HRvX8vhQdLheCBSMpc8ruUgLE9EBmApFYD2H9Bvggb1wKEQll+jZFsCdV4Xa+TlOHn
	EXnXtEJXKbmaF/H5XYGtgkpzmN6jMFmRiRXBJXIt2CCa5TgWleeyxhuRaRQi3p+Bx+P8
	WKRb2LLOwtPE7RBySHgzNISWO7iixCsBjH1w/cANXx6aJADsGF9Rq0p4mGj3FcVYo2uy
	hYvMm0M47eXd7SjRM29EF0mZaxR0m7yIAD03xc4WlSPot5y578TmfIhRiHGimMWppcZ9
	NRX8h39kNSKX4KekrtaJBKcUS2kr2v5z7E8nVvG6VacWEqFWNbKmPcWhhOTLR1p05gIg
	R3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=zV9QWIxV6wzmM5IBfOEINdXAxYtrvH29wYW8MYYeywE=;
	b=JmUe+WMLm+YFsFQJ1jpflbw+Y1GAvhdmksnJCbuv/4TX9BUMG2SmMs1TAbMjHmKceK
	DKIltzBacAi2I19MeaCOFarVMZGn5PiGXi8yIK0AZ/T58kXspIajGXPlPuUr+7UVOqai
	7R97Fb6FdkKb1zGGU4wTtgA57a+okKW26LgiR0rsdptETx4yekP0jET/grC+WJNFu/Zp
	BVrctjHYg/mOhE1auD33weHgOjqh4jsYpBzQz6IgjTuv4ZFuY7U1fCsLqQ+Mixq+UQNS
	blm8zl6Ti8SfN0JUCz880dlW5FbnXzSHb4ZmErfMlpsB9zNPUzCQDNEoPNCPaPfaB53a
	6XKQ==
X-Gm-Message-State: AHYfb5iq7khtEybMYL5ZN6RmynypcEn5Gy8f49nHvyVVz0DTtJ1IMT93
	1ibQq1innWUHZYGMqjeC8oOa7uctTA==
X-Received: by 10.28.207.10 with SMTP id f10mr6854wmg.159.1502483995915; Fri,
	11 Aug 2017 13:39:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Fri, 11 Aug 2017 13:39:25 -0700 (PDT)
In-Reply-To: <abdfeb96-6c04-66cb-44fe-a964beb901c3@linaro.org>
References: <cover.1502474835.git.alistair.francis@xilinx.com>
	<2fbcf76e4ff63d8527edd3662342948276e2cd37.1502474835.git.alistair.francis@xilinx.com>
	<de3609ba-241a-6df8-b5c3-30eb4535735e@linaro.org>
	<CAKmqyKPLJpv79Dv77t8m2q-pFOBg3u4hDmcz5Wk2t+tt+bT8UA@mail.gmail.com>
	<fb2b501e-21b0-f711-19f5-a3087b6007f3@linaro.org>
	<CAKmqyKOCAS1=WPFwBUXwTve1T_VZsQKJdT=15CPRoHSs-eEhDw@mail.gmail.com>
	<abdfeb96-6c04-66cb-44fe-a964beb901c3@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 11 Aug 2017 13:39:25 -0700
X-Google-Sender-Auth: YWl0fSCFSNHvEwCnvnXUfHCuIWQ
Message-ID: <CAKmqyKM1p2-9roBs1Lh-7UUvQ+JGW4LWTPbLJ=VWzae2Q2s4uw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v1 3/3] target/arm: Correct
 exclusive store return value
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qqta66ioAQMG

On Fri, Aug 11, 2017 at 1:38 PM, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 08/11/2017 01:29 PM, Alistair Francis wrote:
>> On Fri, Aug 11, 2017 at 1:24 PM, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>> On 08/11/2017 01:13 PM, Alistair Francis wrote:
>>>>>> +            tcg_gen_ext_i64(val, val, memop);
>>>>>
>>>>> What is this addition intended to accomplish?  Because of the position within
>>>>> the code, you know that memop contains MO_64, so that this is a no-op.
>>>>
>>>> This is when size == 2 so it's a 32bit operation so memop contains MO_32.
>>>
>>> It's a paired 32-bit operation, so we're operating on a 64-bit quantity.  So
>>> extending from 32-bits would be actively wrong.
>>
>> From what I can see though, the 32bit memop is carried into the
>> tcg_gen_atomic_cmpxchg_i64() call so the value returned to tmp is
>> masked by the 32bit operation.
>>
>> Is passing down MO_32 into tcg_gen_atomic_cmpxchg_i64() wrong then as
>> it ends up as a 64-bit operation?
>
> If we're passing MO_32 down to cmpxchg_i64 for this case, you have indeed found
> a bug.  I'll investigate this further on Monday.

Maybe that is why I'm seeing these failures. I'll have a look as well
to see if this fixes my problems.

Thanks,
Alistair

>
>
> r~
>

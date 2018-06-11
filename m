Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4173239wrq;
        Mon, 11 Jun 2018 08:20:21 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLi6P7icZ1541D6EZxyeRTT8E8EH+2eCB7LFWFyft5t2ziGHHRPhjyAKFnILRIo/7yNPyeu
X-Received: by 2002:a37:a38c:: with SMTP id m134-v6mr15580346qke.57.1528730421148;
        Mon, 11 Jun 2018 08:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528730421; cv=none;
        d=google.com; s=arc-20160816;
        b=sEnV5RaEG++99ZhaxRy5QwZSkvcJU1LdBYbv3mwt0QqCSoQettsryVOPgWoTq0B0NA
         TcvVGBrcuEYbEIa2gz6gRJL6cgfNb7v39RIlX2PotWuhJNE/75lvuuPEv4fY3aQuO6A3
         CazTYj47PFPcVMJWO8eB/XGCiyAiYEA0ogE1ktdifSclGsqVm1OIkZ/rkyCccJlALZEr
         6mWNten3ffaQ/Qun7WQagTXm5S1s2SU2bIpmZRmqqEACl0RcYMEiTDMpPCHZUp4T8xhB
         EN7tgsS5PyS+UMl2vIJs/n8dtmnZAEJlc8DnkeJLojeaiKUGRTJDMjRndwA/QSFNTBUX
         z0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Fxu+6PZ4/8o7K4HA/NIyLpkrpTYHNRdmi802ZkQRldU=;
        b=L6Wu11SNhXhaaRIpxTx09l3hNf6rvE9geEaa70/nKLD1PP8djec+/CXRFaFUiOOSrV
         zvL6loNtu2HYcy3bvn1DQpuEAEWoevA9vhYlQpVlKVnd4B5RMNVvKoNsCC/MWfpK3+4y
         taP8b5OX0ixM2RY6YAJS6QqU3H04ov+JlOdSF+Hgc364PX2EAW8k77pkWcofO94eKBEU
         kUbpWFFPA7sPFcNUbIJXXQTjvft2ldKliv+su57tmFciFepDK4BEvASuDCG32qmYup5s
         7YWym7/UUJGMaDq6LhEz+Dyxuyl4hIseJkM58dACFc5m9ZYWkM9oIIKqSiWPSuU9aG7z
         wb6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IXf1IFuf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 81-v6si744614qkp.244.2018.06.11.08.20.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 08:20:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IXf1IFuf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49495 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSOcG-0007SH-LQ
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 11:20:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSOc2-0007NX-WA
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 11:20:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSOc1-0002gP-Hi
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 11:20:07 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:46604)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSObs-0002YV-MA; Mon, 11 Jun 2018 11:19:56 -0400
Received: by mail-qt0-x244.google.com with SMTP id h5-v6so20555644qtm.13;
	Mon, 11 Jun 2018 08:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Fxu+6PZ4/8o7K4HA/NIyLpkrpTYHNRdmi802ZkQRldU=;
	b=IXf1IFufQYfWRYrUmGjKMZ2SPx0AVvxul3plGrNp2QwiJDEIlplRrS/ZoU/AdHCzbJ
	eTf9HVLqt4dzwBd57zkb5Jrd0+833XSIsIo6k0t4oDkZhPX4T4hD180+e30X93ukHvMm
	jr0RDWj5YudLAT2l3WqujXhOSEshnsUuHxcK52NUk6/tnjp7I4KIxrXPSshuD2rEVPXN
	1lFn/Yxs1AB0ejf2n3jIDVZrAw7bZtQAWEDbK7IlOsIqt2baYlMV0k8xN8joNJp0t+hv
	RWyCUuUEenpmfzrxIbavLIQLr51RT9LiK7nQlj/x6k3iwV5Ph0VxGY4L/uyTbNUKcBj8
	AcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Fxu+6PZ4/8o7K4HA/NIyLpkrpTYHNRdmi802ZkQRldU=;
	b=VtIK1Mti0HS8HMxyJPTLrQ3OoKcPgR7B0ijLhlZYr024DlDkQTYoB9CBEZw5aZrWX3
	3OlAYNGkm0MOyljGtFOKMUg4DXduRsHfV0BLRwDWfPdRgV4DMYT6R8M5sKdoqWvAnRn8
	585Xh8Ex2Ajg56giO//Qzic4rScimD/P8kefboBCOWQSssMKj9aZBzLZYI0rTRYnF/hF
	9osPrZNgS2EULyPc2IlUEskK0Z47D6Xo9vh+gaCqr0wd0AHwiIWUyrM3clPSC39qetOq
	wQjuGe47LhCdeB+JDa1SgGJisHn7jcz28I1DVnTMl/dqJkrIkFSjbncC//dvYMDUkf+k
	dMIQ==
X-Gm-Message-State: APt69E3GdQ9Xyy+5IBDRmugq7L/tOqWN0Fsd3+vsGIw2AG2/cVdRXM9U
	fHzl+6RvKN+cxuWqHbkPgn4=
X-Received: by 2002:a0c:8831:: with SMTP id
	46-v6mr15450820qvl.13.1528730396143; 
	Mon, 11 Jun 2018 08:19:56 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	w25-v6sm34518859qtc.21.2018.06.11.08.19.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jun 2018 08:19:55 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <20180601160355.15393-1-peter.maydell@linaro.org>
	<CAFEAcA-9skxQ7AifPvL+BbUuPKm4PWQ+CycuERahpfNvettO3A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <69bc3f2f-4578-f679-8760-12c8114075bd@amsat.org>
Date: Mon, 11 Jun 2018 12:19:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-9skxQ7AifPvL+BbUuPKm4PWQ+CycuERahpfNvettO3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CecxWO0FGCIt

On 06/11/2018 11:05 AM, Peter Maydell wrote:
> Ping for code review?
> 
> thanks
> -- PMM
> 
> On 1 June 2018 at 17:03, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The Cortex-M CPU and its NVIC are two intimately intertwined parts of
>> the same hardware; it is not possible to use one without the other.
>> Unfortunately a lot of our board models don't do any sanity checking
>> on the CPU type the user asks for, so a command line like
>>     qemu-system-arm -M versatilepb -cpu cortex-m3
>> will create an M3 without an NVIC, and coredump immediately.
>> In the other direction, trying a non-M-profile CPU in an M-profile
>> board won't blow up, but doesn't do anything useful either:
>>     qemu-system-arm -M lm3s6965evb -cpu arm926
>>
>> Add some checking in the NVIC and CPU realize functions that the
>> user isn't trying to use an NVIC without an M-profile CPU or
>> an M-profile CPU without an NVIC, so we can produce a helpful
>> error message rather than a core dump.
>>
>> Fixes: https://bugs.launchpad.net/qemu/+bug/1766896
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/arm/armv7m.c       |  7 ++++++-
>>  hw/intc/armv7m_nvic.c |  6 +++++-
>>  target/arm/cpu.c      | 18 ++++++++++++++++++
>>  3 files changed, 29 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
>> index a4ab7d2069..9e00d4037c 100644
>> --- a/hw/arm/armv7m.c
>> +++ b/hw/arm/armv7m.c
>> @@ -178,6 +178,12 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>>              return;
>>          }
>>      }
>> +
>> +    /* Tell the CPU where the NVIC is; it will fail realize if it doesn't
>> +     * have one.
>> +     */
>> +    s->cpu->env.nvic = &s->nvic;
>> +
>>      object_property_set_bool(OBJECT(s->cpu), true, "realized", &err);
>>      if (err != NULL) {
>>          error_propagate(errp, err);
>> @@ -202,7 +208,6 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>>      sbd = SYS_BUS_DEVICE(&s->nvic);
>>      sysbus_connect_irq(sbd, 0,
>>                         qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
>> -    s->cpu->env.nvic = &s->nvic;
>>
>>      memory_region_add_subregion(&s->container, 0xe000e000,
>>                                  sysbus_mmio_get_region(sbd, 0));
>> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
>> index c51151fa8a..661be8878a 100644
>> --- a/hw/intc/armv7m_nvic.c
>> +++ b/hw/intc/armv7m_nvic.c
>> @@ -2183,7 +2183,11 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>>      int regionlen;
>>
>>      s->cpu = ARM_CPU(qemu_get_cpu(0));
>> -    assert(s->cpu);
>> +
>> +    if (!s->cpu || !arm_feature(&s->cpu->env, ARM_FEATURE_M)) {
>> +        error_setg(errp, "The NVIC can only be used with a Cortex-M CPU");
>> +        return;
>> +    }
>>
>>      if (s->num_irq > NVIC_MAX_IRQ) {
>>          error_setg(errp, "num-irq %d exceeds NVIC maximum", s->num_irq);
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 5d60893a07..eda1ce14fc 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -767,6 +767,24 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>          return;
>>      }
>>
>> +#ifndef CONFIG_USER_ONLY
>> +    /* The NVIC and M-profile CPU are two halves of a single piece of
>> +     * hardware; trying to use one without the other is a command line
>> +     * error and will result in segfaults if not caught here.
>> +     */
>> +    if (arm_feature(env, ARM_FEATURE_M)) {
>> +        if (!env->nvic) {
>> +            error_setg(errp, "This board cannot be used with Cortex-M CPUs");
>> +            return;
>> +        }
>> +    } else {
>> +        if (env->nvic) {
>> +            error_setg(errp, "This board can only be used with Cortex-M CPUs");
>> +            return;
>> +        }
>> +    }
>> +#endif
>> +
>>      cpu_exec_realizefn(cs, &local_err);
>>      if (local_err != NULL) {
>>          error_propagate(errp, local_err);
>> --
>> 2.17.1
>>
>>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

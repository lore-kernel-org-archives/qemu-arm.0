Received: by 10.223.172.38 with SMTP id v35csp1962175wrc;
        Tue, 5 Sep 2017 15:47:16 -0700 (PDT)
X-Received: by 10.55.18.96 with SMTP id c93mr869166qkh.297.1504651635955;
        Tue, 05 Sep 2017 15:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504651635; cv=none;
        d=google.com; s=arc-20160816;
        b=TZg4trDKR8i6jbD12s4PmW72Yt4aZIvws9o0FZKOw3AcQFxasz2D8I9lNkYDKTXzXN
         M/xiQyflU0T56VT+kVZU1/5EHaYZri+NUKKkNJvWz6FlLkLhGbCmtqviYXvhGv8akmEd
         lh2cjgrfZtTVMkIe0EceDJQ50Nob2O/uta8OAqXawu5Lb8emTyjhygxJAKo45+IjkIip
         WepBp1Ef9vnbuN+PXBHzqpq2/R5tmxDKzTqrXZNlEplThV2K5bTYKtWmixJRMS0TR+WE
         3cMGcV8rFQgfPhqiek0TonhLxIE4ARIKkVjPpHe6UV57PVTaUhhiWDXYShfF7YlExfib
         GMVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=PS1GBt5xcNZRGt/Lby26+iIpROCk/DHeENsq9976e+Q=;
        b=XchXZQ3XaB/dQZzr13D6CjrMkh8iS49uBGz4Jec+F0qtOG1ZxJGeM1dF1dUcABOARj
         T3f4nWaLknGn2Buh++NWXXNYg5orr7OxEtQOXRTDspYsXNzSLFw9q6mtHK2o9OGaaThi
         9vJIx9azUvLfj6E/dmVAx9gvrXXhGVtW6DHG04Q5iPQRUa3/GmiKvGvN2nWaV3uHvQ/C
         5Ps5b5q7gJ4x1aoTKiIytUyexB+OveLZEvd/9JQNfA6PGwqNNqg640zd/jhfwnWX4xqs
         lDRgOlUH69fzQajxln9l1VD+vCKvaNp4uLxzNOnxWbaJNC+SXViXwV7bHlL9pNbCx6Ff
         XaWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rEkykBJL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h57si1347343qtf.321.2017.09.05.15.47.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 15:47:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rEkykBJL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33432 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpMcj-0008GL-Hm
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 18:47:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dpMcQ-0008CZ-Lh
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 18:46:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dpMcL-0000av-Pq
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 18:46:54 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:37070)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dpMcB-0000SD-Qe; Tue, 05 Sep 2017 18:46:39 -0400
Received: by mail-wm0-x241.google.com with SMTP id f4so1547766wmh.4;
	Tue, 05 Sep 2017 15:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PS1GBt5xcNZRGt/Lby26+iIpROCk/DHeENsq9976e+Q=;
	b=rEkykBJLLJHhkAnqFU4ULxz5pAItp3KPapTs6/4lLU2u21JoXW+Rg0NGxs6XWhbvdr
	kRaBAPqq3/Xc81D9zPRfz05YoJeLfZiRc5rBvqqSCW29LGA+IzM0FekffzOgiOnIvUxB
	B8oujAIGxM6KVPbngpOY4OHITIC1ACSEwYhrjXcqGdWXza3N+BXCLPdYAQsRRaEXrGsi
	8KVaDNGQhKnqY63tF8z3rU9n6MjN4isQmLBsuutJuLsnwUnauBzmOnl36jPkHixuB5ky
	dW3HIm/WTLTjrTQ2SS0Rb4vZbg9NaH9l7L8SiUU4Dzv71Jl+kueQT2gRZFLxuKSrGL3P
	xxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PS1GBt5xcNZRGt/Lby26+iIpROCk/DHeENsq9976e+Q=;
	b=bEJJwg3SwmUhdMmaTer28QZsm/+/++RHUv0NEjxNdfw3xKsKPX87uLF8fkZVS7nnFa
	WX2WhHlTyo+3tgF87hDP6KMNH9mp9s0NkRXqMwAbEBA0uqYRIxRptQDvcs1AzQKuXKWt
	D2BJTjBZO0QdAMGmzW27VbDmMEm+xmUTRhGGp5UVzdMTO8L+Z0Sb1SSnW+95SdbWzN/P
	kHh2ATdazGwOgLcRt+66k/o4m+J60gFzJWONuYmk+Ma7MJxG6ABsXrGAwS8VY0tYvODZ
	tqBWpHyuDHUyTTvRXapXWszq3YaqDSjPnxyuyY1FBNEK7bY2wrgf+i4tOzlZ+NmtMa7m
	1OYQ==
X-Gm-Message-State: AHPjjUg3IOD38xoJHAFInWW7wrQlPnAnP5Jq1lpqxqbN3n2pBhssV0qF
	oQ6H/9DydwvrxdbLrw+Yf6CjUTGZ/A==
X-Google-Smtp-Source: ADKCNb6jjDtyLIdwSYq68RkY7W+Yrb3zHWJShGFSC1WLBalxZezhGBd4RjZfIgo0g9jdFrAcukrY2OACwPlVC7anry4=
X-Received: by 10.28.196.202 with SMTP id u193mr276403wmf.120.1504651598467;
	Tue, 05 Sep 2017 15:46:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Tue, 5 Sep 2017 15:46:07 -0700 (PDT)
In-Reply-To: <20170905221226.GZ7570@localhost.localdomain>
References: <1504533662-198084-1-git-send-email-imammedo@redhat.com>
	<1504533662-198084-7-git-send-email-imammedo@redhat.com>
	<20170905213152.GG17184@localhost.localdomain>
	<CAKmqyKPWDmVYJceYao7NkD5svWqN_fYbDoUJ4uLNFdAhv+kFwg@mail.gmail.com>
	<20170905221226.GZ7570@localhost.localdomain>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Sep 2017 15:46:07 -0700
Message-ID: <CAKmqyKO4yRz3R0BJ+gz=UfLc0d_AoNtEAHn-SNFMzg3xo12D=Q@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 6/6] arm: drop intermadiate
 cpu_model -> cpu type parsing and use cpu type directly
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
Cc: Rob Herring <robh@kernel.org>, Andrew Jones <drjones@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KFf7VUG5CYA6

On Tue, Sep 5, 2017 at 3:12 PM, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Tue, Sep 05, 2017 at 02:47:52PM -0700, Alistair Francis wrote:
>> On Tue, Sep 5, 2017 at 2:31 PM, Eduardo Habkost <ehabkost@redhat.com> wrote:
> [...]
>> >> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
>> >> index f61e735..1cd6374 100644
>> >> --- a/hw/arm/stm32f205_soc.c
>> >> +++ b/hw/arm/stm32f205_soc.c
>> >> @@ -112,7 +112,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>> >>
>> >>      armv7m = DEVICE(&s->armv7m);
>> >>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
>> >> -    qdev_prop_set_string(armv7m, "cpu-model", s->cpu_model);
>> >> +    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
>> >>      object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
>> >>                                       "memory", &error_abort);
>> >>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
>> >> @@ -200,7 +200,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>> >>  }
>> >>
>> >>  static Property stm32f205_soc_properties[] = {
>> >> -    DEFINE_PROP_STRING("cpu-model", STM32F205State, cpu_model),
>> >> +    DEFINE_PROP_STRING("cpu-type", STM32F205State, cpu_type),
>> >
>> > Same as armv7m: are we 100% sure users are not setting this
>> > manually?
>>
>> In an embedded board like this it really doesn't make sense to let the
>> user overwrite the CPU. The SoC will take it as an option, but the
>> board (which creates the SoC) just blindly always uses the same CPU.
>> That feature is more for QOMificatoion then any real reason though.
>>
>
> I'm not talking about -cpu (no user-visible change in the
> handling of -cpu should result from this patch), but about
> possible cases where the user set the "cpu-model" property using
> another mechanism, like -global.  Probably it's impossible for an
> user to override the property successfully, but I would like to
> be sure.

Ah, that is trickier.

I guess that is possible to do, but the object setting logic should
handle the error gracefully and inform the user of the error.

>
>
>> In saying that I think a warning if the user tries to set the CPU
>> would make sense. I know that this issues comes up in other ARM boards
>> (Zynq-7000 has the same issue as well) so maybe a machine property
>> saying that the board doesn't accept custom CPUs would be a good idea.
>
> Yeah, there are multiple cases in this patch where boards are
> validating the CPU model, but not all boards do that.  A generic
> MachineClass::valid_cpu_types[] field would be useful.
>
>>
>> Overall I think this patch is moving in the right direction though and
>> this CPU option being ignored existed before this series.
>
> I agree this is going on the right direction.  However, I don't
> see any board that ignore the CPU option: all of them seem to use
> cpu_model when creating the CPUs, already.

The Netduino2 will ignore any CPU options and always use a Cortex-m3.
I was wrong about Zynq-7000 though, it does respect the -cpu option.

Thanks,
Alistair

>
> --
> Eduardo

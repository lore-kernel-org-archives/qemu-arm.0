Received: by 10.223.172.38 with SMTP id v35csp7329232wrc;
        Tue, 12 Sep 2017 09:36:44 -0700 (PDT)
X-Received: by 10.55.1.202 with SMTP id u71mr20119215qkg.80.1505234203925;
        Tue, 12 Sep 2017 09:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505234203; cv=none;
        d=google.com; s=arc-20160816;
        b=o/ydo7AmNCnbM/9m973bTP/KoXaHHiMv2rV/Yi+iboXZw/tS5BhLZUR+RbK02KPajA
         4lETpYBQj2Jut60bJLWE9p1SElG2BvX2Ogdr+jcM1/U0djwDzgBCEps2pb9tkCByQaxW
         g2juy5Jjts5GA8znR8z43DIg1J4Xo2FzTD31K6EXzzFORrJDikk82ke7Fj9jBmKEqTJ7
         NpGtFAOcBbEHW2IRBeX/a6q2CE+URON56qVIAS8NiQoI/Pk53H2GR2t7nJu69W5u7vCl
         edu6JehkrDKYkfQAi39OYUFgWOFubZzT6m7XJNlGtecOSM5/djycm64MarGEZcx2uyJs
         OWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=di9xPHw9wcpr0UAdyBOrClZZSw5tNphZTouhYBMae3g=;
        b=SZI825uHyDjPx60lxVeM/dZ4qp19g68f8ZuqPjnj5t/lIw+FC4ib23LsN9nkYScZ50
         HqNbh4UXPikUl3nhUMV/vCQ6YMGwyGu641n7crvs3RxVSO+OkGB11gWfYrEtKw7Tsh2L
         PCJ+kugGR0egLOYj5hMTCYmVCcHE406cRFJZukFTcgwUecArSY4+9SBuCio5NhvDGcQm
         pOEdZoPi+5JNoLrHzVuBF4/piRxeEcRr9DbfCbR/yw1HlO6puq4Vw95qVr8n1revaAfX
         JM/K9PZKAfYmavkZJddspYJi1VDRvnRpIOqjwDNIhq2IQP/zm9UO2DY48faK+b1HqnA9
         MeQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ub8OU3DC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z18si2954386qtf.446.2017.09.12.09.36.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 09:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ub8OU3DC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37024 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1droAz-00048t-KI
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 12:36:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dro4j-0006nX-Me
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 12:30:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dro4i-0002Ho-I8
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 12:30:13 -0400
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:33412)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dro4a-0002Bb-J0; Tue, 12 Sep 2017 12:30:04 -0400
Received: by mail-wr0-x241.google.com with SMTP id b9so6506861wra.0;
	Tue, 12 Sep 2017 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=di9xPHw9wcpr0UAdyBOrClZZSw5tNphZTouhYBMae3g=;
	b=Ub8OU3DCR5IdScOTpvNa+vWWSplcVvgCD4V6h+kwvtwORa3yRq+4bnLuW6YXhn8Fwr
	JJ97mknVT3Q9gSi7YvJMgTc2c44oszQlfvMKbWbe5JOIBjmfZ6VzkA84Qwccb6Xjerho
	8DCQzxWah06oIz+9+cFz+4XG7zPgyRXk7dNv5ooupCLXkKoE6ohG6b9p9pt+ddz8p0PO
	liwtGBBb6Q4iO7FmZM7xzizu10MwN0i+VKtTm0PtDn/35+C+VijC12tx7CyR9qKQtLce
	r7FpuOWzk6A2mf6XPMsWbHZQIjImJzbXBsaKko11TPOvhyEUmnIuieejVZ10ZbzBkkR5
	l7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=di9xPHw9wcpr0UAdyBOrClZZSw5tNphZTouhYBMae3g=;
	b=Mk5E17Drj1hcPq3Gpf6Yn0JyNIL42zib2T3t9UMRAWxg6WzQVy65nW1VLR693sS52M
	QGLqrSekVe2felEL/0/n5LavBA+Fkxl0fR4y6gwvafcoJ7fNkL2G9OZ2VppOnkrqUeQy
	HlbDJLIF68yyEixHVXOLHHxjZ+evEaQyMQY/9QkSmjYTtny7wLjRCBsMj6JI6/ZgTCp1
	xKRTyy/Y5vvbWmBcRkVPlI3D32uHjYfOAXuFdufSLcgz2+ld5WPeSC/y93MY49SvjoiD
	XZ91my2rx77reg06Ko9TUiOHvsB4x87WIfTMbyqHt2YAgkUZnYHpkH2erX634LOKWCos
	zHZg==
X-Gm-Message-State: AHPjjUhZElHRbSQqh48jGoZGKT3qRkCpAo2yHAP7qNo4dRlG4iiMLgsT
	ZI9z4ajhzdcMT7wzRLk9qLS4QwiFZw==
X-Google-Smtp-Source: ADKCNb5rVpsjMCHLia48RnPZ4JB2fayeF5a4xoA6W84tYlPkeE8KyfVUCIanTkhsLA+9BfZ2lLbbgtbQ8qnMPl9LEa8=
X-Received: by 10.223.187.74 with SMTP id x10mr12467056wrg.66.1505233803373;
	Tue, 12 Sep 2017 09:30:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Tue, 12 Sep 2017 09:29:32 -0700 (PDT)
In-Reply-To: <20170912125307.5681ec0e@nial.brq.redhat.com>
References: <1504533662-198084-1-git-send-email-imammedo@redhat.com>
	<1504533662-198084-7-git-send-email-imammedo@redhat.com>
	<20170905213152.GG17184@localhost.localdomain>
	<CAKmqyKPWDmVYJceYao7NkD5svWqN_fYbDoUJ4uLNFdAhv+kFwg@mail.gmail.com>
	<20170905221226.GZ7570@localhost.localdomain>
	<20170912125307.5681ec0e@nial.brq.redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Sep 2017 09:29:32 -0700
Message-ID: <CAKmqyKM6_EYdZNB-VSj6_piAxLKHiQS3WoFkX_83HQxDmjTtEQ@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Rob Herring <robh@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aV9wtzrwfjxR

On Tue, Sep 12, 2017 at 3:53 AM, Igor Mammedov <imammedo@redhat.com> wrote:
> On Tue, 5 Sep 2017 19:12:26 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
>
>> On Tue, Sep 05, 2017 at 02:47:52PM -0700, Alistair Francis wrote:
>> > On Tue, Sep 5, 2017 at 2:31 PM, Eduardo Habkost <ehabkost@redhat.com> wrote:
>> [...]
>> > >> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
>> > >> index f61e735..1cd6374 100644
>> > >> --- a/hw/arm/stm32f205_soc.c
>> > >> +++ b/hw/arm/stm32f205_soc.c
>> > >> @@ -112,7 +112,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>> > >>
>> > >>      armv7m = DEVICE(&s->armv7m);
>> > >>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
>> > >> -    qdev_prop_set_string(armv7m, "cpu-model", s->cpu_model);
>> > >> +    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
>> > >>      object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
>> > >>                                       "memory", &error_abort);
>> > >>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
>> > >> @@ -200,7 +200,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>> > >>  }
>> > >>
>> > >>  static Property stm32f205_soc_properties[] = {
>> > >> -    DEFINE_PROP_STRING("cpu-model", STM32F205State, cpu_model),
>> > >> +    DEFINE_PROP_STRING("cpu-type", STM32F205State, cpu_type),
>> > >
>> > > Same as armv7m: are we 100% sure users are not setting this
>> > > manually?
>> >
>> > In an embedded board like this it really doesn't make sense to let the
>> > user overwrite the CPU. The SoC will take it as an option, but the
>> > board (which creates the SoC) just blindly always uses the same CPU.
>> > That feature is more for QOMificatoion then any real reason though.
>> >
>>
>> I'm not talking about -cpu (no user-visible change in the
>> handling of -cpu should result from this patch), but about
>> possible cases where the user set the "cpu-model" property using
>> another mechanism, like -global.  Probably it's impossible for an
>> user to override the property successfully, but I would like to
>> be sure.
>>
>>
>> > In saying that I think a warning if the user tries to set the CPU
>> > would make sense. I know that this issues comes up in other ARM boards
>> > (Zynq-7000 has the same issue as well) so maybe a machine property
>> > saying that the board doesn't accept custom CPUs would be a good idea.
> Agreed, it would be useful, however goal of the patch to drop
> cpu_generic_init() preferably without changing behavior
>
> so I'd leave extra stuff you mention upto board maintainers
> to fix up on top.
>
>
>> Yeah, there are multiple cases in this patch where boards are
>> validating the CPU model, but not all boards do that.  A generic
>> MachineClass::valid_cpu_types[] field would be useful.
> so far I've met 3 use cases for valid_cpu_types
>  * no check - just try to use whatever user provided
>  * check for concrete cpu models (leaf classes)
>  * check for super-class based in partial cpu_model match
>
> it is nice to have valid_cpu_types[] /I recall even trying out something similar/
> but then series turns into mess where one tries to fix several things
> and on top of it in all targets, hence I've decided first to get rid of
> all cpu_model handling in boards and only then think about valid_cpus using cpu types.
>
> I'd gladly give up 'valid cpus' to someone else more interested in it,
> there are other users beside of ARM boards for it.
> /seems Alistair is interested in it, at least in ARM part/

Yeah, I'm interested in getting a generic framework to make this
possible in. Still just an RFC, I need to get back to that this week
and tidy it up.

Thanks,
Alistair

>
>
>> > Overall I think this patch is moving in the right direction though and
>> > this CPU option being ignored existed before this series.
>>
>> I agree this is going on the right direction.  However, I don't
>> see any board that ignore the CPU option: all of them seem to use
>> cpu_model when creating the CPUs, already.
> in ARM case there are boards that use
>  * '-cpu' provided model
>  * '-cpu' provided model with valid cpu checks
>  * 'hardcoded' cpu model ignoring '-cpu'/-global
>
> I've thought commit message sufficiently described current situation and changes.

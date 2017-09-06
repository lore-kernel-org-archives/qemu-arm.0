Received: by 10.223.172.38 with SMTP id v35csp2033880wrc;
        Tue, 5 Sep 2017 17:19:04 -0700 (PDT)
X-Received: by 10.200.49.88 with SMTP id h24mr1224353qtb.335.1504657144532;
        Tue, 05 Sep 2017 17:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504657144; cv=none;
        d=google.com; s=arc-20160816;
        b=KNc0bATEUJYevpLxHdghkZlDYjlG5fMlH0iV4NxUtrzF9z0zFST/f6Ob62+HauBTpu
         0ogwxzs4ZoOaSXImyz/MwunlPgjo9PRSHYzlYqJcQA+qDyjKxzIyBcos2/6stFgXahE4
         E7R96ND7TBUfosjKD3IoAQbBVOx2T7heIqGfeO0zA/txiYNDRwa+S/+5PFoXL6jSlO/F
         M+7ElSUK0LOJzeNx/o0UIW7YMXPwjilAup/+8OaoW3kSRTzjw7mv9R4q//TUjoUmcIrV
         sfvx24kM+2J2sqQv6QA4rqpRs9RHSD7J67Md6ikSSJTAC9YThDZUpPQiXUFXqNRuTl1v
         HesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=+U5jhKTdK6gyCjbjpktaBeH6RLJCs42ukWE5sLh8ag0=;
        b=pB2dTGoVaM4GJf1dWnUJ5BAQK7LaeLxaPsYvxTYRciA3sVNLnUwLArogPNnJxdweAS
         jNLK3APVMEYPhYFv2I1eRnCXNTOwgVtWfcF8nI5NcVmXk/Pjsfr8qq+4zTCVy+O5JoSG
         kMyTf6e32XItTpImRX5Mi6lRIp0W/UnelEakuBdlnW3OljcKQdDTslHlq4UUCpwPclq1
         ALvFf0U1rBXBdxrWimiCExLeu9H6cMZ9B2RUjULDhuhCm9n9g2SlO7e+9555iIaBfR/H
         5hTx8eyhX7MSF/2jiptFzD8F12fHRgyECGaGrYlnsBr4jpttaNjDZPh+oKMjgDlNtl2O
         THug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BMK32VYB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v20si1670870qth.117.2017.09.05.17.19.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 17:19:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BMK32VYB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33619 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpO3Y-00015z-6n
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 20:19:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dpO1W-0007yQ-6x
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 20:16:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dpO1U-0000ru-Sg
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 20:16:54 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:36617)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dpO1J-0000ho-4h; Tue, 05 Sep 2017 20:16:41 -0400
Received: by mail-wm0-x22d.google.com with SMTP id i145so24401201wmf.1;
	Tue, 05 Sep 2017 17:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+U5jhKTdK6gyCjbjpktaBeH6RLJCs42ukWE5sLh8ag0=;
	b=BMK32VYBarJUjj+9mPblmHRwL5lGtIJD1M+pHB1i79ajs8T0xzzqrfuL5Tlg2FuLQ1
	0iwU62w6LHYUicu50Dk0SMEev3ionrrij4pJ28U3NA7VipBEQkln5lvuhDpr+i9Q1Bf0
	to0OEh7lhiKVNCAAE3c8E1tWbDH1Pm8Uask/4kCHMHlie9vQbYS5Q7lCRc8Tx8nVn2Gk
	yLbMSInizA+Tq52cZuYltZLtPfLGD7tcR65UEBuO+brBxU3fBTsFeqJBn42U9EOXjk/V
	7S2ApF78BvZQOzoJqBkl0GumT60MajVg6zTVa2uZxSkZDoicASNOaPoJDrS2X2drS8iA
	Breg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+U5jhKTdK6gyCjbjpktaBeH6RLJCs42ukWE5sLh8ag0=;
	b=h9M7JMKXQkHq4p++Y0xS4APQIBElAPliZO4vr1A7geOhvxL8j1FFDILKCcirMLEilt
	3uD0iwwSjh7x0WE7u/elavt+aeZS3va49ochhon2kK+J13ij4EBvh5fiU3jguI0sZfdu
	K7lxPCy37MHlKuT4Pi9WNn94ic7UJ82hh02raGHx/untccpVasW32S843KtzNAo7mGkx
	rZYnGrUFAp1l8bFYbCbrkyXxsLl+qtW56eYVunyoq2h7rY9oZR5u3ZctFhlueDwlY+VQ
	Y486wvbZlRXGx5h/wUtsRJaCxg6ktGxov2pG3U5dfSlICvQxn5AEXF57y0eKN9Di3pLy
	Jnow==
X-Gm-Message-State: AHPjjUgTZ7rPKruwWDnnGraeXkxEGbC1aXlzGdtX98Entveb6xrWtLiy
	HEgodxH6Z1yKTiQDsKPbXk4pGRZMdg==
X-Google-Smtp-Source: ADKCNb5NKufNNyPodGhg9ualjHV0rCjx2W7C2vPKiSIDNKNmwEqn1VMcWtBXf1b40sZ5Bqa/A48wDIBQAi6ZvU8Hz9Y=
X-Received: by 10.28.65.8 with SMTP id o8mr345204wma.146.1504657000027; Tue,
	05 Sep 2017 17:16:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Tue, 5 Sep 2017 17:16:09 -0700 (PDT)
In-Reply-To: <CAKmqyKO4yRz3R0BJ+gz=UfLc0d_AoNtEAHn-SNFMzg3xo12D=Q@mail.gmail.com>
References: <1504533662-198084-1-git-send-email-imammedo@redhat.com>
	<1504533662-198084-7-git-send-email-imammedo@redhat.com>
	<20170905213152.GG17184@localhost.localdomain>
	<CAKmqyKPWDmVYJceYao7NkD5svWqN_fYbDoUJ4uLNFdAhv+kFwg@mail.gmail.com>
	<20170905221226.GZ7570@localhost.localdomain>
	<CAKmqyKO4yRz3R0BJ+gz=UfLc0d_AoNtEAHn-SNFMzg3xo12D=Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Sep 2017 17:16:09 -0700
Message-ID: <CAKmqyKM+2W158tCWdQ_0EqEGnoBSrEca-6Pi+uha1Hg=SrxWDA@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
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
X-TUID: BdFX63jwJgbY

On Tue, Sep 5, 2017 at 3:46 PM, Alistair Francis <alistair23@gmail.com> wrote:
> On Tue, Sep 5, 2017 at 3:12 PM, Eduardo Habkost <ehabkost@redhat.com> wrote:
>> On Tue, Sep 05, 2017 at 02:47:52PM -0700, Alistair Francis wrote:
>>> On Tue, Sep 5, 2017 at 2:31 PM, Eduardo Habkost <ehabkost@redhat.com> wrote:
>> [...]
>>> >> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
>>> >> index f61e735..1cd6374 100644
>>> >> --- a/hw/arm/stm32f205_soc.c
>>> >> +++ b/hw/arm/stm32f205_soc.c
>>> >> @@ -112,7 +112,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>>> >>
>>> >>      armv7m = DEVICE(&s->armv7m);
>>> >>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
>>> >> -    qdev_prop_set_string(armv7m, "cpu-model", s->cpu_model);
>>> >> +    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
>>> >>      object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
>>> >>                                       "memory", &error_abort);
>>> >>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
>>> >> @@ -200,7 +200,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>>> >>  }
>>> >>
>>> >>  static Property stm32f205_soc_properties[] = {
>>> >> -    DEFINE_PROP_STRING("cpu-model", STM32F205State, cpu_model),
>>> >> +    DEFINE_PROP_STRING("cpu-type", STM32F205State, cpu_type),
>>> >
>>> > Same as armv7m: are we 100% sure users are not setting this
>>> > manually?
>>>
>>> In an embedded board like this it really doesn't make sense to let the
>>> user overwrite the CPU. The SoC will take it as an option, but the
>>> board (which creates the SoC) just blindly always uses the same CPU.
>>> That feature is more for QOMificatoion then any real reason though.
>>>
>>
>> I'm not talking about -cpu (no user-visible change in the
>> handling of -cpu should result from this patch), but about
>> possible cases where the user set the "cpu-model" property using
>> another mechanism, like -global.  Probably it's impossible for an
>> user to override the property successfully, but I would like to
>> be sure.
>
> Ah, that is trickier.
>
> I guess that is possible to do, but the object setting logic should
> handle the error gracefully and inform the user of the error.
>
>>
>>
>>> In saying that I think a warning if the user tries to set the CPU
>>> would make sense. I know that this issues comes up in other ARM boards
>>> (Zynq-7000 has the same issue as well) so maybe a machine property
>>> saying that the board doesn't accept custom CPUs would be a good idea.
>>
>> Yeah, there are multiple cases in this patch where boards are
>> validating the CPU model, but not all boards do that.  A generic
>> MachineClass::valid_cpu_types[] field would be useful.

I just sent a RFC out that does this, let me know what you think.

The cover letter is called: "Add a valid_cpu_types property"

Thanks,
Alistair

>>
>>>
>>> Overall I think this patch is moving in the right direction though and
>>> this CPU option being ignored existed before this series.
>>
>> I agree this is going on the right direction.  However, I don't
>> see any board that ignore the CPU option: all of them seem to use
>> cpu_model when creating the CPUs, already.
>
> The Netduino2 will ignore any CPU options and always use a Cortex-m3.
> I was wrong about Zynq-7000 though, it does respect the -cpu option.
>
> Thanks,
> Alistair
>
>>
>> --
>> Eduardo

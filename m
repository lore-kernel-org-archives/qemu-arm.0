Received: by 10.223.172.38 with SMTP id v35csp1935262wrc;
        Tue, 5 Sep 2017 15:12:47 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAVq9ps0JzTEr0BG4Ty6Uo2royjmnr4HXP70XPL7IIqahe7tTUh+f2D1mHwdSrNnpcF+QEU
X-Received: by 10.200.27.185 with SMTP id z54mr837946qtj.250.1504649567000;
        Tue, 05 Sep 2017 15:12:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504649566; cv=none;
        d=google.com; s=arc-20160816;
        b=JiklnvB9NmSozqMbXLrisy1PtrpFPmjzbXSCK+qBn36WIQD5rXCfdJeRIIXQFhNZom
         ysfT0XDtNfnjDqlO/+nollBnl/rURAHd5UBJmxm2ppYAf0FvWCOJa29SNGKnbvVSzvLO
         S8XMeyv0Dzr16M2t1xfL23Iw2nnFaUyCRoP2np2vZBnV/EEI0P+UfoGnlu7fla2DQbWd
         TXrTCqEH1h6inCwHRe9pEeqQ6TF0lkOPZzuoufaT8bTBD1HgHPzYDNpvGH7y65ALRiM/
         OSstEmHPzXaG1AJZ6PIR0rBPHo8c0MmSd+wRmisdNCS79Xy/tniamPwDzITfRJqlks8+
         GiJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=dpP4a6UXT4EAf+jZlNT+rmJg0kItGGY4tlBbtC1Ru+k=;
        b=Wml/VMxxUVyDL+b+a+PRIaZHKmol0myhZ0tvIwXiDp0+1wOtuikDlZ4jg1cvGGRoJz
         40+5Sgh8A+ZUx7CKSHRQMpxicLm8sn+rbHM3RpvnVJNghRGUEXtz84JZx/kdHOkFBxwp
         I2gEwys4Dsdna4Z9kYaO4NZSxUryX8cnK68yI5tfTZKMDwY0TE8QZ2xccyUa0hHVTOIQ
         vsZsNUcpmTe4TpzJml1uUnIDeo6wImk4tFnMynjQFsWl72BBGLZfEKs0nD4cEL81NHfD
         6OqfOMMXp9LKFBBmJSbHBm4sIhjcR2HptK6K675wOf/OVVLoEr7PWx6S36rzOcLvSB0q
         nbRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v55si1404604qtv.38.2017.09.05.15.12.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 15:12:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpM5M-000051-Nc
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 18:12:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dpM5C-0008W1-Lg
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 18:12:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dpM57-00085M-V6
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 18:12:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56672)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dpM57-000856-Mp; Tue, 05 Sep 2017 18:12:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8575E7F6BA;
	Tue,  5 Sep 2017 22:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8575E7F6BA
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-45.gru2.redhat.com [10.97.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECEA5619CB;
	Tue,  5 Sep 2017 22:12:27 +0000 (UTC)
Date: Tue, 5 Sep 2017 19:12:26 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20170905221226.GZ7570@localhost.localdomain>
References: <1504533662-198084-1-git-send-email-imammedo@redhat.com>
	<1504533662-198084-7-git-send-email-imammedo@redhat.com>
	<20170905213152.GG17184@localhost.localdomain>
	<CAKmqyKPWDmVYJceYao7NkD5svWqN_fYbDoUJ4uLNFdAhv+kFwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKPWDmVYJceYao7NkD5svWqN_fYbDoUJ4uLNFdAhv+kFwg@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 05 Sep 2017 22:12:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: 0ubGlIf6MqWG

On Tue, Sep 05, 2017 at 02:47:52PM -0700, Alistair Francis wrote:
> On Tue, Sep 5, 2017 at 2:31 PM, Eduardo Habkost <ehabkost@redhat.com> wrote:
[...]
> >> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> >> index f61e735..1cd6374 100644
> >> --- a/hw/arm/stm32f205_soc.c
> >> +++ b/hw/arm/stm32f205_soc.c
> >> @@ -112,7 +112,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
> >>
> >>      armv7m = DEVICE(&s->armv7m);
> >>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
> >> -    qdev_prop_set_string(armv7m, "cpu-model", s->cpu_model);
> >> +    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
> >>      object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
> >>                                       "memory", &error_abort);
> >>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
> >> @@ -200,7 +200,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
> >>  }
> >>
> >>  static Property stm32f205_soc_properties[] = {
> >> -    DEFINE_PROP_STRING("cpu-model", STM32F205State, cpu_model),
> >> +    DEFINE_PROP_STRING("cpu-type", STM32F205State, cpu_type),
> >
> > Same as armv7m: are we 100% sure users are not setting this
> > manually?
> 
> In an embedded board like this it really doesn't make sense to let the
> user overwrite the CPU. The SoC will take it as an option, but the
> board (which creates the SoC) just blindly always uses the same CPU.
> That feature is more for QOMificatoion then any real reason though.
> 

I'm not talking about -cpu (no user-visible change in the
handling of -cpu should result from this patch), but about
possible cases where the user set the "cpu-model" property using
another mechanism, like -global.  Probably it's impossible for an
user to override the property successfully, but I would like to
be sure.


> In saying that I think a warning if the user tries to set the CPU
> would make sense. I know that this issues comes up in other ARM boards
> (Zynq-7000 has the same issue as well) so maybe a machine property
> saying that the board doesn't accept custom CPUs would be a good idea.

Yeah, there are multiple cases in this patch where boards are
validating the CPU model, but not all boards do that.  A generic
MachineClass::valid_cpu_types[] field would be useful.

> 
> Overall I think this patch is moving in the right direction though and
> this CPU option being ignored existed before this series.

I agree this is going on the right direction.  However, I don't
see any board that ignore the CPU option: all of them seem to use
cpu_model when creating the CPUs, already.

-- 
Eduardo

Received: by 10.223.172.38 with SMTP id v35csp6927220wrc;
        Tue, 12 Sep 2017 05:02:25 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBHDwjw5jW6NLNBHvJ5K/GDKj6e1LMS6XMnG1/3Qrr9j4+LczsIIhVRGw+Dfc2VDCN0Z2AL
X-Received: by 10.55.152.198 with SMTP id a189mr18733908qke.190.1505217745874;
        Tue, 12 Sep 2017 05:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505217745; cv=none;
        d=google.com; s=arc-20160816;
        b=QqFyHQrXfDX8jPHDYmJx2dwbHGEBxM7/eP1iW7C66w/Tdo2ff+Yn1g8IbWR54RkYmL
         0S4/qBCgHoSmiJW9UbE2SX1bfHnXY350H4/H9UhdH9Xj8WAPgSotEqGBRVO6VQoOIRli
         SVwk1WGRC/hD7Ca/hS6zHJOD6aMyyK2jUQHTTrDP4ui/0IvjQF7vC3SDs/DwU7/rmVWz
         IeUrXC0MBzGGnQvAr5NVzvMXkOIgjX0VQvz5Axp3gzS8S4pekiPre2u3A1VKr3Ghfh+z
         ZsET6V6K+kAk+42oGjWSFtChcl5HUrw2L21k3r0yruKrc/T34kcVQK6V6SZc1aZDvhir
         J50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=akU7xBMXsyEUvouCGNbXsqM526ItjfOwB0Niv5MJdA0=;
        b=L5u3AyKPQjSkV5+sSMk+dnmrh9cPmR2QslqutyVU7/CmrIj48EznkDSXT+rqrdsZqV
         8VlljiN+ckjFgN0l8his5nyfiARRp09gnYo04yMVkolUHFOUBaSUxBENgNZ+eQobMypc
         yLHYbfQch5B29xwJ4T/iKCQ1e0T99yRMFRTimzN2qVptIT7/45TPZlqSpX4/6ESm1gm4
         RdVKcWyoYOD9sdjaqLrRx5DI3OrzMEM+gffthmyQedd8eeGS9VT+8hmKqbXILxSUkclc
         MzIf38C0CW1Uhi6FhWGcLewLLwYDH6ujSgiiLwd27U3kXMB9204eH4FZsJNgEz4sE/JQ
         WThA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b64si11177145qkd.188.2017.09.12.05.02.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 05:02:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drjtX-0003rK-Kj
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 08:02:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1drjtL-0003pA-B4
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 08:02:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1drjtG-0005MS-G1
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 08:02:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58374)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1drjtG-0005Le-6w; Tue, 12 Sep 2017 08:02:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F86F81E0F;
	Tue, 12 Sep 2017 12:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9F86F81E0F
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-15.gru2.redhat.com [10.97.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AEF7017DEB;
	Tue, 12 Sep 2017 12:01:55 +0000 (UTC)
Date: Tue, 12 Sep 2017 09:01:38 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170912120138.GU7570@localhost.localdomain>
References: <1504533662-198084-1-git-send-email-imammedo@redhat.com>
	<1504533662-198084-7-git-send-email-imammedo@redhat.com>
	<20170905213152.GG17184@localhost.localdomain>
	<CAKmqyKPWDmVYJceYao7NkD5svWqN_fYbDoUJ4uLNFdAhv+kFwg@mail.gmail.com>
	<20170905221226.GZ7570@localhost.localdomain>
	<CAKmqyKO4yRz3R0BJ+gz=UfLc0d_AoNtEAHn-SNFMzg3xo12D=Q@mail.gmail.com>
	<20170909203014.GG7570@localhost.localdomain>
	<20170912122214.29f0840e@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170912122214.29f0840e@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 12 Sep 2017 12:02:05 +0000 (UTC)
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
	Alistair Francis <alistair23@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Wz/ASrfHTJK

On Tue, Sep 12, 2017 at 12:22:14PM +0200, Igor Mammedov wrote:
> On Sat, 9 Sep 2017 17:30:14 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > On Tue, Sep 05, 2017 at 03:46:07PM -0700, Alistair Francis wrote:
> > > On Tue, Sep 5, 2017 at 3:12 PM, Eduardo Habkost <ehabkost@redhat.com> wrote:  
> > > > On Tue, Sep 05, 2017 at 02:47:52PM -0700, Alistair Francis wrote:  
> > > >> On Tue, Sep 5, 2017 at 2:31 PM, Eduardo Habkost <ehabkost@redhat.com> wrote:  
> > > > [...]  
> > > >> >> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> > > >> >> index f61e735..1cd6374 100644
> > > >> >> --- a/hw/arm/stm32f205_soc.c
> > > >> >> +++ b/hw/arm/stm32f205_soc.c
> > > >> >> @@ -112,7 +112,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
> > > >> >>
> > > >> >>      armv7m = DEVICE(&s->armv7m);
> > > >> >>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
> > > >> >> -    qdev_prop_set_string(armv7m, "cpu-model", s->cpu_model);
> > > >> >> +    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
> > > >> >>      object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
> > > >> >>                                       "memory", &error_abort);
> > > >> >>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
> > > >> >> @@ -200,7 +200,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
> > > >> >>  }
> > > >> >>
> > > >> >>  static Property stm32f205_soc_properties[] = {
> > > >> >> -    DEFINE_PROP_STRING("cpu-model", STM32F205State, cpu_model),
> > > >> >> +    DEFINE_PROP_STRING("cpu-type", STM32F205State, cpu_type),  
> > > >> >
> > > >> > Same as armv7m: are we 100% sure users are not setting this
> > > >> > manually?  
> > > >>
> > > >> In an embedded board like this it really doesn't make sense to let the
> > > >> user overwrite the CPU. The SoC will take it as an option, but the
> > > >> board (which creates the SoC) just blindly always uses the same CPU.
> > > >> That feature is more for QOMificatoion then any real reason though.
> > > >>  
> > > >
> > > > I'm not talking about -cpu (no user-visible change in the
> > > > handling of -cpu should result from this patch), but about
> > > > possible cases where the user set the "cpu-model" property using
> > > > another mechanism, like -global.  Probably it's impossible for an
> > > > user to override the property successfully, but I would like to
> > > > be sure.  
> > > 
> > > Ah, that is trickier.
> > > 
> > > I guess that is possible to do, but the object setting logic should
> > > handle the error gracefully and inform the user of the error.  
> > 
> > After looking at the code more closely, I think we can be 100%
> > sure the user doesn't rely on the property, because:
> > 
> > * TYPE_ARMV7M and TYPE_STM32F205_SOC are both sysbus devices
> >   with user_creatable=false, so the user can't instantiate them
> >   directly;
> > * The only places where those objects are realized inside the
> >   code are:
> >   * mps2_common_init()
> >   * netduino2_init()
> >   * stm32f205_soc_realize()
> >   * armv7m_init()
> >   Those functions always set the "cpu-model" property immediately
> >   before realize.
> > 
> > This means any value set by the user (e.g. using -global) would
> > be always overwritten before realize.
> > 
> > However, I have a suggestion for Igor: making a separate patch
> > that renames the existing property to "x-cpu-model", and using
> > "x-cpu-type" in this series.  This way we will explicitly
> > document the fact that the property is not a stable
> > user/management interface.
> There is no much point in renaming to "x-cpu-model" as it will be deleted
> right afterwards, I'd just delete "cpu-model" and use "x-cpu-type"
> in this patch. I'm not a fun of 'x-' prefix and would prefer a flag
> in property to mark it as internal. But it's out of scope of this series,
> so I don't care much about naming at the moment and will use "x-cpu-type"
> as you suggest.

Peter pointed out that this is the case with lots of properties
on non-user-creatable devices.  So we can keep "cpu-type" for
consistency by now.

-- 
Eduardo

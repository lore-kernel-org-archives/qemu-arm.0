Received: by 10.223.172.38 with SMTP id v35csp6931306wrc;
        Tue, 12 Sep 2017 05:04:47 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBchXdmbY2WyqfD98+y1LDoL5B/qcvwX9Uxz/FTDnfmqDyUm087kVTWcjazmsaylQfTPsl7
X-Received: by 10.55.190.198 with SMTP id o189mr18356190qkf.103.1505217887749;
        Tue, 12 Sep 2017 05:04:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505217887; cv=none;
        d=google.com; s=arc-20160816;
        b=t5VJADBSpjwzq0AzdqWCxpc/DE7oGUb97ExXDbVURL93+4TgLlH3IkDQ7FQ70mTmDk
         a1sFF8gjn3IKljxHYgtaFMzJuv/vVr/MIjwtZIvKwuQACV8YrQq/YCrMqYZitzqqWDEj
         ghOeuZ84nHZxL+W094btjR6at/asSxyiJSXocTGQdSll3G53UOC5BIsxu2+R6iVVYLjx
         xR8RM+c3nVVsztf4rSh+WQcGF8A/BWL/73xePJFrErTvFQMO8/eAIVe1ciUuk4u79NpK
         gzuI1yWNyGIf8WdIowD/vZ9eyMMa3n2ZT6IvbJqof3nYPRpHf72Zgr/zIB4yj/AJ8YQh
         kVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=m5Q3kRxdInAbk34xQyQ0FQQkxpJA2U2c43+NctxQ+u0=;
        b=UMg4N/9Cl/W6IAnAk3k+Ig2NxcZzU+NqMj5h4Ha7oDkD8VtW9RJkPhMEW5e0UYhbAU
         II/uacv9KVMWrfVfL4OAJWqfKp1i219d+WDsaC9SrbqZK2XTIo7+JvTy05T4ugyD9x2E
         5zVKr041EfLCReDW5GBRtm05yT3Y8QqKUjdUYwiNCm9XzUjm9V22cd9F9iC+BZerlWCw
         urv5MKkuE5ET6b3Aq2Kq+ZgIMmabKSYQ1Btu6KPs+onG3xuHK2mhBsCZ91ha9LM8M019
         iKv4Xdss2nM6F8NRmqaKTQzM+YeApXzaiqrbZdZ7rudm/95ucZdIcwoFh4wuYppaunKR
         vhEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c11si1702328qtj.15.2017.09.12.05.04.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 05:04:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drjvp-0004oj-Dq
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 08:04:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1drjve-0004oG-74
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 08:04:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1drjva-0007hw-0W
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 08:04:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:17387)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1drjvZ-0007h7-PE; Tue, 12 Sep 2017 08:04:29 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE20881E0E;
	Tue, 12 Sep 2017 12:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BE20881E0E
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-15.gru2.redhat.com [10.97.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B1AF6F920;
	Tue, 12 Sep 2017 12:04:28 +0000 (UTC)
Date: Tue, 12 Sep 2017 09:04:27 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170912120427.GV7570@localhost.localdomain>
References: <1504533662-198084-1-git-send-email-imammedo@redhat.com>
	<1504533662-198084-7-git-send-email-imammedo@redhat.com>
	<20170905213152.GG17184@localhost.localdomain>
	<CAKmqyKPWDmVYJceYao7NkD5svWqN_fYbDoUJ4uLNFdAhv+kFwg@mail.gmail.com>
	<20170912130235.2353dec3@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170912130235.2353dec3@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 12 Sep 2017 12:04:28 +0000 (UTC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Rob Herring <robh@kernel.org>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	Alistair Francis <alistair23@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q+JC5/PWCauU

On Tue, Sep 12, 2017 at 01:02:35PM +0200, Igor Mammedov wrote:
> On Tue, 5 Sep 2017 14:47:52 -0700
> Alistair Francis <alistair23@gmail.com> wrote:
> 
> > On Tue, Sep 5, 2017 at 2:31 PM, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > > On Mon, Sep 04, 2017 at 04:01:02PM +0200, Igor Mammedov wrote:  
> > >> there are 2 use cases to deal with:
> > >>   1: fixed CPU models per board/soc
> > >>   2: boards with user configurable cpu_model and fallback to
> > >>      default cpu_model if user hasn't specified one explicitly
> > >>
> > >> For the 1st
> > >>   drop intermediate cpu_model parsing and use const cpu type
> > >>   directly, which replaces:
> > >>      typename = object_class_get_name(
> > >>            cpu_class_by_name(TYPE_ARM_CPU, cpu_model))
> > >>      object_new(typename)
> > >>   with
> > >>      object_new(FOO_CPU_TYPE_NAME)
> > >>   or
> > >>      cpu_generic_init(BASE_CPU_TYPE, "my cpu model")
> > >>   with
> > >>      cpu_create(FOO_CPU_TYPE_NAME)
> > >>
> > >> as result 1st use case doesn't have to invoke not necessary
> > >> translation and not needed code is removed.
> > >>
> > >> For the 2nd
> > >>  1: set default cpu type with MachineClass::default_cpu_type and
> > >>  2: use generic cpu_model parsing that done before machine_init()
> > >>     is run and:
> > >>     2.1: drop custom cpu_model parsing where pattern is:
> > >>        typename = object_class_get_name(
> > >>            cpu_class_by_name(TYPE_ARM_CPU, cpu_model))
> > >>        [parse_features(typename, cpu_model, &err) ]
> > >>
> > >>     2.2: or replace cpu_generic_init() which does what
> > >>          2.1 does + create_cpu(typename) with just
> > >>          create_cpu(machine->cpu_type)
> > >> as result cpu_name -> cpu_type translation is done using
> > >> generic machine code one including parsing optional features
> > >> if supported/present (removes a bunch of duplicated cpu_model
> > >> parsing code) and default cpu type is defined in an uniform way
> > >> within machine_class_init callbacks instead of adhoc places
> > >> in boadr's machine_init code.
> > >>
> > >> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > >> ---
> > >> CC: Peter Maydell <peter.maydell@linaro.org>
> > >> CC: Igor Mitsyanko <i.mitsyanko@gmail.com>
> > >> CC: Rob Herring <robh@kernel.org>
> > >> CC: Andrzej Zaborowski <balrogg@gmail.com>
> > >> CC: Jan Kiszka <jan.kiszka@web.de>
> > >> CC: Alistair Francis <alistair@alistair23.me>
> > >> CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> > >> CC: qemu-arm@nongnu.org
> > >> ---
> 
> [...]
> 
> > >>
> > >>  static const TypeInfo lm3s6965evb_type = {
> > >> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> > >> index f61e735..1cd6374 100644
> > >> --- a/hw/arm/stm32f205_soc.c
> > >> +++ b/hw/arm/stm32f205_soc.c
> > >> @@ -112,7 +112,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
> > >>
> > >>      armv7m = DEVICE(&s->armv7m);
> > >>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
> > >> -    qdev_prop_set_string(armv7m, "cpu-model", s->cpu_model);
> > >> +    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
> > >>      object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
> > >>                                       "memory", &error_abort);
> > >>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
> > >> @@ -200,7 +200,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
> > >>  }
> > >>
> > >>  static Property stm32f205_soc_properties[] = {
> > >> -    DEFINE_PROP_STRING("cpu-model", STM32F205State, cpu_model),
> > >> +    DEFINE_PROP_STRING("cpu-type", STM32F205State, cpu_type),  
> > >
> > > Same as armv7m: are we 100% sure users are not setting this
> > > manually?  
> > 
> > In an embedded board like this it really doesn't make sense to let the
> > user overwrite the CPU. The SoC will take it as an option, but the
> > board (which creates the SoC) just blindly always uses the same CPU.
> > That feature is more for QOMificatoion then any real reason though.
> If SoC has fixed cpu type then I'd drop property.
> I'd leave it upto board maintainers to cleanup not really needed
> properties and make soc with fixed cpu type where it makes sense.
> 
> > In saying that I think a warning if the user tries to set the CPU
> > would make sense. I know that this issues comes up in other ARM boards
> > (Zynq-7000 has the same issue as well) so maybe a machine property
> > saying that the board doesn't accept custom CPUs would be a good idea.
> > 
> > Overall I think this patch is moving in the right direction though and
> > this CPU option being ignored existed before this series.
> right, this series just removes cpu_generic_init()/cpu_model in boards
> everything else should be done as separate series.

Agreed.  Except for actual bugs and opportunities to document
these cases in comments or commit messages, these things can be
done by other series.

-- 
Eduardo

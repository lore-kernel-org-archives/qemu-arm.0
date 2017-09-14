Received: by 10.223.172.38 with SMTP id v35csp562531wrc;
        Thu, 14 Sep 2017 00:50:30 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCsAzuEvLGbcz4Y6aY13iQiAGzUhq85CDZfpjLxvOMZW4zhR5SF65ViwLPmLbBWhXB5SXXT
X-Received: by 10.200.37.212 with SMTP id f20mr29563832qtf.177.1505375430014;
        Thu, 14 Sep 2017 00:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505375430; cv=none;
        d=google.com; s=arc-20160816;
        b=Ds0FcK3dVXEXkbyH1fcgGqVn/SaMlnQqzHZI8FucCnCcSkVfKrO87SoXMOul6SQaZU
         vbkEjfFir5w7t4M6Z5xAOaTGYZ35ng0H3B8lJRDWFkjg4P4Ijtx8BwD4iskGogV0I0mO
         WClysvxfZ3prBYttQ2Glnx1GxEXRHRmWT6SRbfEsrpWDUNqttv29h7ZJVQykPPCk0tRl
         NFNUC+do/kKQdtW0aX1IvrYqpyI1YAlf3oUjkBOuenUgPKCS5Wcf2f2xDL3qfWqq9moz
         xTfX2KMVG+n1Fw1yP+t78tP2Xq9ARuL9PfHwOW82jSB6LF37xt7HaDaerSVT7DE3Msps
         oK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dmarc-filter:arc-authentication-results;
        bh=h/rAYdEERyssUDciUK6W4OptJWnugwoze/RGg+GDI2Q=;
        b=0rNJmlkH4kxKdQwKN9PMzajWnHJ6EzkcgTO5HY1YpnAKy0MdpVmJaWyhrqedNkoaBv
         C+6tS0B+C3x8phVrjObR/ha36LGj+59je/EZMq0w2WfIq4c0OToncxYMRGYQbdGgFBO6
         rEl0EPPUnLU59he5CPPH4/AVTNqilPDnsta09apUdLI6ilExJ/856xwlR2nXk0u9LkCu
         LTOePlxhsYZooGan5s24s16Xmo7nlUXOGw1fvVx2vhJaJVWd7wtWEPZ+vwvzqM11s3dc
         z0SbchWW/yPpbMoML/Fm1Bl21sVPGYVG+JSc/sl10/M44pJ/QCn70rONQIfH0o1Y2P2q
         /mFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d191si16359164qke.194.2017.09.14.00.50.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 00:50:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsOup-0005Z6-Uj
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 03:50:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dsOug-0005Yh-9a
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 03:50:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dsOud-0005kl-4M
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 03:50:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58230)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dsOuc-0005in-Sj; Thu, 14 Sep 2017 03:50:15 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D1C5037E65;
	Thu, 14 Sep 2017 07:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D1C5037E65
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=imammedo@redhat.com
Received: from nial.brq.redhat.com (unknown [10.43.2.209])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D412F756BF;
	Thu, 14 Sep 2017 07:50:12 +0000 (UTC)
Date: Thu, 14 Sep 2017 09:50:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Message-ID: <20170914095011.2fba8aab@nial.brq.redhat.com>
In-Reply-To: <af093dab-efb0-7fb7-b373-e9a547ca6da7@amsat.org>
References: <1505318697-77161-1-git-send-email-imammedo@redhat.com>
	<1505318697-77161-6-git-send-email-imammedo@redhat.com>
	<af093dab-efb0-7fb7-b373-e9a547ca6da7@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 14 Sep 2017 07:50:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 5/5] arm: drop intermediate
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EOoq37dqFYXc

On Thu, 14 Sep 2017 00:47:20 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Hi Igor,
>=20
> awesome clean refactor!
Thanks,

there is more patches on this topic for other targets to post
but it's waiting on 1-3/5 to land in master so it would be
easier for maintainers to verify/test them without fishing out
dependencies from mail list.

hopefully everything will land in 2.11 so we won't have to deal
with cpu_model anywhere except of one place vl.c.

> just 1 comment inlined.
>=20
> On 09/13/2017 01:04 PM, Igor Mammedov wrote:
> > there are 2 use cases to deal with:
> >    1: fixed CPU models per board/soc
> >    2: boards with user configurable cpu_model and fallback to
> >       default cpu_model if user hasn't specified one explicitly
> >=20
> > For the 1st
> >    drop intermediate cpu_model parsing and use const cpu type
> >    directly, which replaces:
> >       typename =3D object_class_get_name(
> >             cpu_class_by_name(TYPE_ARM_CPU, cpu_model))
> >       object_new(typename)
> >    with
> >       object_new(FOO_CPU_TYPE_NAME)
> >    or
> >       cpu_generic_init(BASE_CPU_TYPE, "my cpu model")
> >    with
> >       cpu_create(FOO_CPU_TYPE_NAME)
> >=20
> > as result 1st use case doesn't have to invoke not necessary
> > translation and not needed code is removed.
> >=20
> > For the 2nd
> >   1: set default cpu type with MachineClass::default_cpu_type and
> >   2: use generic cpu_model parsing that done before machine_init()
> >      is run and:
> >      2.1: drop custom cpu_model parsing where pattern is:
> >         typename =3D object_class_get_name(
> >             cpu_class_by_name(TYPE_ARM_CPU, cpu_model))
> >         [parse_features(typename, cpu_model, &err) ]
> >=20
> >      2.2: or replace cpu_generic_init() which does what
> >           2.1 does + create_cpu(typename) with just
> >           create_cpu(machine->cpu_type)
> > as result cpu_name -> cpu_type translation is done using
> > generic machine code one including parsing optional features
> > if supported/present (removes a bunch of duplicated cpu_model
> > parsing code) and default cpu type is defined in an uniform way
> > within machine_class_init callbacks instead of adhoc places
> > in boadr's machine_init code.
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > v2:
> >   - fix merge conflicts with ignore_memory_transaction_failures
> >   - fix couple merge conflicts where SoC type string where replaced by =
type macro
> >   - keep plain prefix string in: strncmp(cpu_type, "pxa27", 5)
> >   - s/"%s" ARM_CPU_TYPE_SUFFIX/ARM_CPU_TYPE_NAME("%s")/
> > ---
[...]

> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index fe96557..fe26e99 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -163,13 +163,13 @@ static const int a15irqmap[] =3D {
> >   };
> >  =20
> >   static const char *valid_cpus[] =3D {
> > -    "cortex-a15",
> > -    "cortex-a53",
> > -    "cortex-a57",
> > -    "host",
> > +    ARM_CPU_TYPE_NAME("cortex-a15"),
> > +    ARM_CPU_TYPE_NAME("cortex-a53"),
> > +    ARM_CPU_TYPE_NAME("cortex-a57"),
> > +    ARM_CPU_TYPE_NAME("host"),
> >   };
> >  =20
> > -static bool cpuname_valid(const char *cpu)
> > +static bool cpu_type_valid(const char *cpu)
> >   {
> >       int i; =20
>=20
> I'd just change this by:
>=20
> static bool cpuname_valid(const char *cpu)
> {
>      static const char *valid_cpus[] =3D {
>          ARM_CPU_TYPE_NAME("cortex-a15"),
>          ARM_CPU_TYPE_NAME("cortex-a53"),
>          ARM_CPU_TYPE_NAME("cortex-a57"),
>      };
>      int i;
>=20
>      for (i =3D 0; i < ARRAY_SIZE(valid_cpus); i++) {
>          if (strcmp(cpu, valid_cpus[i]) =3D=3D 0) {
>              return true;
>          }
>      }

>      return kvm_enabled() && !strcmp(cpu, ARM_CPU_TYPE_NAME("host");
here is one more case to consider for valid_cpus refactoring,
CCing Alistair.

> }
>=20
> Anyway this can be a later patch.
this check might be removed or superseded by generic valid_cpus work
that Alistair is working on, anyways it should be part of that work
as change is not directly related to this series.


[...]

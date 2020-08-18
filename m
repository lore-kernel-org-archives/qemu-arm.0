Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3697418lfy;
        Tue, 18 Aug 2020 03:26:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDjpL2WO2mFmyK0vY16ddELwgnP0mSSE+WaRILqx60TSHMZjxK3dIrYWbZP/CEhI1CDy7s
X-Received: by 2002:a25:4251:: with SMTP id p78mr25541234yba.306.1597746383170;
        Tue, 18 Aug 2020 03:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597746383; cv=none;
        d=google.com; s=arc-20160816;
        b=vmN1EGdWsY9YA7InQvvTNV0WK0bZp9GttsOgKk8V+E9QSEajkdm5/xByFaNszWHUmL
         jp4UjLgkqC3HDC0UsWPOdE9Qg85v24VjApPdYOaQ5sWNdXDbkYa+bhBqwbC43Xi91ARO
         HyMqAfGcPYG35K8WemLH/SyHH3n13RqZtcbbewWRMp72PoBgpKyLQmPElVMg3v9UyOS5
         OjzBHHEHWFeEVF0uWmY4ZZiijKm6CPpZiCxf2bbwo3R+ERzpBY8wANa1OxEjs9JvS95I
         iwinySpgPe3Bbux7X+A8xAr6cyhIuzn6GqGd9VbTFRTVlStY5/QSEn47AQ1viRfdSZT7
         95zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=NbDW1HLNCOs0Z4yh+HyA36FoNymUmPg3R6M1amuR2RI=;
        b=vb0ayoHfJ8nI+jsTl+1tW19WnxgAcDKHLh1q6oTuwHA7uLgbw6xWqa7mNG5MGgYj/4
         zn1HpZod/W/bWPeTetmc9vnmGCwyyG5y15gpocH6H+Q0dSrfC6UD2p2jXP5daSDly1XE
         RadZjD8o3rqf9cnZyILKGyx6gl48gT7VG4b6YS/Jia4B/pkJwElH++wWa0HDNKtq6dl4
         r1U2jE42w1oYeGfRSSC7KvlII77aMYh6QMyHoLvo6ju+BF2dH7FwXv/Hn/v7QGKuxf0J
         GoxRWC+zZUVCBPVAzf+adIFL//EW6+fnkE/ZBc84ElkdiQP4f/IDlsy47/8Ywg4dlKVW
         6Fpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G8wmjsCj;
       spf=neutral (google.com: 205.139.110.61 is neither permitted nor denied by best guess record for domain of imammedo@redhat.com) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id d17si21319655ybn.396.2020.08.18.03.26.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 03:26:23 -0700 (PDT)
Received-SPF: neutral (google.com: 205.139.110.61 is neither permitted nor denied by best guess record for domain of imammedo@redhat.com) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G8wmjsCj;
       spf=neutral (google.com: 205.139.110.61 is neither permitted nor denied by best guess record for domain of imammedo@redhat.com) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597746382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NbDW1HLNCOs0Z4yh+HyA36FoNymUmPg3R6M1amuR2RI=;
	b=G8wmjsCjreLpEyrstb+gwKHFFPlHoJxv/9tTCr08XBkBQySWaT7PpTNapu6oZPzQiRlKRk
	mqN30IbeA3cjPweAxidp4zq9dugi6Cxookq/lFAh7tFJxB+ztYki6984tmUtTqVhi0fJmK
	XenPsmYYoBCeckSqEz0qk9vxfLGW4cA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-SXSQ7uisMnW78JbgKWNhiQ-1; Tue, 18 Aug 2020 06:26:17 -0400
X-MC-Unique: SXSQ7uisMnW78JbgKWNhiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA427801ADD;
	Tue, 18 Aug 2020 10:26:14 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BCAE7849A;
	Tue, 18 Aug 2020 10:26:05 +0000 (UTC)
Date: Tue, 18 Aug 2020 12:26:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Cornelia Huck
 <cohuck@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth
 <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand
 <david@redhat.com>, Richard Henderson <rth@twiddle.net>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Aurelien Jarno
 <aurelien@aurel32.net>, David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v4 4/8] ppc/e500: Use start-powered-off CPUState
 property
Message-ID: <20200818122603.0dac1a38@redhat.com>
In-Reply-To: <83c5045d-ee26-9433-46a3-4919bcea7cd3@redhat.com>
References: <20200818033323.336912-1-bauerman@linux.ibm.com>
	<20200818033323.336912-5-bauerman@linux.ibm.com>
	<83c5045d-ee26-9433-46a3-4919bcea7cd3@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xjm0gyJTQS/Y

On Tue, 18 Aug 2020 09:22:05 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 8/18/20 5:33 AM, Thiago Jung Bauermann wrote:
> > Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), us=
e
> > the start-powered-off property which makes cpu_common_reset() initializ=
e it
> > to 1 in common code.
> >=20
> > Also change creation of CPU object from cpu_create() to object_new() an=
d
> > qdev_realize() because cpu_create() realizes the CPU and it's not possi=
ble
> > to set a property after the object is realized.
> >=20
> > Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> > ---
> >  hw/ppc/e500.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> > index ab9884e315..0077aca74d 100644
> > --- a/hw/ppc/e500.c
> > +++ b/hw/ppc/e500.c
> > @@ -704,9 +704,6 @@ static void ppce500_cpu_reset_sec(void *opaque)
> > =20
> >      cpu_reset(cs);
> > =20
> > -    /* Secondary CPU starts in halted state for now. Needs to change w=
hen
> > -       implementing non-kernel boot. */
> > -    cs->halted =3D 1;
> >      cs->exception_index =3D EXCP_HLT;
> >  }
> > =20
> > @@ -864,8 +861,9 @@ void ppce500_init(MachineState *machine)
> >          PowerPCCPU *cpu;
> >          CPUState *cs;
> >          qemu_irq *input;
> > +        Error *err =3D NULL;
> > =20
> > -        cpu =3D POWERPC_CPU(cpu_create(machine->cpu_type));
> > +        cpu =3D POWERPC_CPU(object_new(machine->cpu_type));
> >          env =3D &cpu->env;
> >          cs =3D CPU(cpu);
> > =20
> > @@ -897,6 +895,19 @@ void ppce500_init(MachineState *machine)
> >          } else {
> >              /* Secondary CPUs */
> >              qemu_register_reset(ppce500_cpu_reset_sec, cpu);
> > +
> > +            /*
> > +             * Secondary CPU starts in halted state for now. Needs to =
change
> > +             * when implementing non-kernel boot.
> > +             */
> > +            object_property_set_bool(OBJECT(cs), "start-powered-off", =
true,
> > +                                     &error_abort); =20
>=20
> [*]
>=20
> > +        }
> > +
> > +        if (!qdev_realize(DEVICE(cs), NULL, &err)) {
> > +            error_report_err(err);
> > +            object_unref(OBJECT(cs));
> > +            exit(EXIT_FAILURE);
> >          } =20
>=20
> The last 4 lines are equivalent to:
>=20
>            qdev_realize(DEVICE(cs), NULL, &error_fatal)) {
>=20
> This is also the preferred form, as we can not propagate errors
> from the machine_init() handler.
not exactly, it will leak refference, but we are dying anyways so who cares=
.

>=20
> Since you use &error_abort in [*], maybe you want to use it here too.
>=20
> >      }
> > =20
> >  =20
>=20
>=20

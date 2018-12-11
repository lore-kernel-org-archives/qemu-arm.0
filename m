Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp653454wrt;
        Tue, 11 Dec 2018 06:32:29 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WnIMqAT44+cvn7whGxS6ckJV8hn3i/9YJbc8l+w8PqT8HW747J/0357o/l2afe7qM27JXE
X-Received: by 2002:a37:1509:: with SMTP id f9mr14194671qkh.271.1544538749296;
        Tue, 11 Dec 2018 06:32:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544538749; cv=none;
        d=google.com; s=arc-20160816;
        b=TTngPzpkdvSr04us8BorFusTBaiNdSCwCkDoouifNF2vy2kXQD/Mp/5VZj37Z5dhRh
         9ztqFgFM02V78dQijmYEEYCrOdksHeEDGAzo/msdVQeUFQIDBnWwrid8mZizesQX0lCY
         sWDo2GStiSXQ8uddOTzNwOhU3m0XPYs0FNX1psZWBU7Ff/4T2V9Qx2guJvTqUHHkMqIT
         WmdsaMwHfJPXUPdZOe9xQBemuTHz63ja5IKnpi2UNcnZxjFFN+2hqEoTNqw3x6w3OS7S
         eL6nIoefDiJMrCLvArWlv1iy+TVzsSOPKuOAsc1Q3Swm6K7q0rs3bPXcfevBp3oAVneo
         hhKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=JHKKuzzVjb7ZlmD16/2MT6az+KfBgjND2+BxpkUm41w=;
        b=j+coh7h8TKiPnbLPg2uFq4ueqTqx7IXPiRI4dNgRg6FeRsX1ZwZNFE9a90NDFUqKlq
         NQSDRpYBqEnIMX0HZtzuFwffuTG9x3EVkjO9CyWI4abPji9pzGecHdldG26rOGXl4yu6
         y383npCEce6xAH7L0swVaITeEyHoNs+dTvNPRsJb84MXMxyyw58R6KrqGUtgPakZUbNF
         oO0DZW9XIhX4C4nmB/MuFa0Re7s4DjnfU3DDuwQtA/5b4eQ/HutJtDKIvflLGoBF/6eu
         D4qPdCVGly7i4Ko4VZKMvlzOkgJHecKDtDPpB59v43D7gU3cRaBMfrS/WO/NHG2F9XwL
         9mbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qjPMz2gT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x18si1351727qkg.199.2018.12.11.06.32.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 06:32:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qjPMz2gT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWj5I-0005dY-RC
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 09:32:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gWj3t-0005G6-Is
	for qemu-devel@nongnu.org; Tue, 11 Dec 2018 09:31:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gWj3q-0002ak-MB
	for qemu-devel@nongnu.org; Tue, 11 Dec 2018 09:31:00 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34014)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1gWj3e-0001zP-6l; Tue, 11 Dec 2018 09:30:46 -0500
Received: by mail-wr1-x444.google.com with SMTP id j2so14337057wrw.1;
	Tue, 11 Dec 2018 06:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JHKKuzzVjb7ZlmD16/2MT6az+KfBgjND2+BxpkUm41w=;
	b=qjPMz2gTHH+z3UCCQJ1o3zJ9/La2t6h5MreZL8mCnlZIQu+IzKLMeQe2uhvB1Q/aVQ
	1yShZFtH5pGR9rSe7qxaNOuny2bgL9XBfexV6HWkdnhL3YK14HQ7d7DGrLvppknLAluv
	lC1MpM03idm9QzV03D4eFENB+edAfU2WxHScZKW6NVJVMXMezmCB/4zmSqfngH0vlYfw
	u/JdHmLWgVuI5ePdRENJsyK+nWMKg02NOLeF8GMFQZ4JdH7NYldErZ3M8B2LvKm8uZxS
	EVH5C2jLRP7e3FMB/0vZu5Seuq0PWcxl/8f38IOAqFtH17IsCXG2zM0fMuB8aTn6yFo6
	nlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JHKKuzzVjb7ZlmD16/2MT6az+KfBgjND2+BxpkUm41w=;
	b=ex50P/Gmqh2pckCth8ToyuY24aBsrmReM8dURCLY0stRj/KprTBVfpaZ2SZWFaeFjy
	EvRYXIZgqJygaV8qSYg/gFgFGJElnoZDiQ60P0Zivtn+EWkxvED7v8QeBiT+0LvXVnML
	iafUOBA0L9+GhOqYAYwU2p4oUyZ5PY1yVN8Gp/qSNiUZraWZHbBDgauOWOIbxbD8mU/4
	bt/iUv8XzH62NutLkZ7XmSj1859Feye6rIPEcTqgqNksD3vcMRi470pDlmJhVqpX0uey
	8AlOBAroQloDug5eO+eMWObhuVGXLv/aUeI7vFqRz/q0jTbD4Sf568Zd7iHVY2nmRju/
	l6IQ==
X-Gm-Message-State: AA+aEWanKE0bDXHK4X4TYxaIMbIrG114f4OlybTjzQ+g7kHFYTif7vwI
	y5tVetBUDiq67mBovcC4j5l9dsx4ncU4SI/uhX4=
X-Received: by 2002:adf:f691:: with SMTP id v17mr13069815wrp.114.1544538645033;
	Tue, 11 Dec 2018 06:30:45 -0800 (PST)
MIME-Version: 1.0
References: <20181204142023.15982-1-marcandre.lureau@redhat.com>
	<20181204142023.15982-9-marcandre.lureau@redhat.com>
	<20181211142310.GB20015@habkost.net>
In-Reply-To: <20181211142310.GB20015@habkost.net>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 11 Dec 2018 18:30:32 +0400
Message-ID: <CAJ+F1CKF7_MEtZNY2FEot9dG-RZQwGeZZ7+3+q1QgD98koF2SA@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH for-3.2 v5 08/19] hw: apply machine compat
 properties without touching globals
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, QEMU <qemu-devel@nongnu.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Qemu-s390x list <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: okRGn7GS/3VO

Hi

On Tue, Dec 11, 2018 at 6:24 PM Eduardo Habkost <ehabkost@redhat.com> wrote=
:
>
> I have specific questions about the approach we are using to
> eliminate the macros.
>
> My main goal when asking this to be moved to a separate patch is
> to not make this discussion block the register_global_properties() &
> device_post_init() changes (which look good to me).
>
>
> On Tue, Dec 04, 2018 at 06:20:12PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> [...]
> > -#define VIRT_COMPAT_3_0 \
> > +static GlobalProperty virt_compat_3_0[] =3D {
> >      HW_COMPAT_3_0
> > +};
>
> What about moving the array inside virt_machine_3_0_options()?

Sure

>
> >
> >  static void virt_3_0_instance_init(Object *obj)
> >  {
> > @@ -1883,12 +1884,14 @@ static void virt_3_0_instance_init(Object *obj)
> >  static void virt_machine_3_0_options(MachineClass *mc)
> >  {
> >      virt_machine_3_1_options(mc);
> > -    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_3_0);
> > +    compat_props_add(mc->compat_props,
> > +                     virt_compat_3_0, G_N_ELEMENTS(virt_compat_3_0));
> >  }
> >  DEFINE_VIRT_MACHINE(3, 0)
>
> This is nice, because it's basically the same amount of
> boilerplate code, but I would find a NULL-terminated array much
> easier to use than having to use G_N_ELEMENTS().

But easier to get wrong too. I prefer the explicit N arguments. (it
also gives some flexibility, since you can point to inner pointer +
size, although we don't care at this point)

>
> This would be nice in cases like virt, because we wouldn't even
> need to declare a separate array.  We could do something like:
>
>     compat_props_add(mc->compat_props, hw_compat_3_0);
>
> and that's all.  No need for HW_COMPAT_* macros, no need for
> extra arrays to be declared.
>
>
> [...]
> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index 7092d6d13f..575566e466 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -438,74 +438,112 @@ static void pc_i440fx_3_1_machine_options(Machin=
eClass *m)
> >  DEFINE_I440FX_MACHINE(v3_1, "pc-i440fx-3.1", NULL,
> >                        pc_i440fx_3_1_machine_options);
> >
> > +static GlobalProperty pc_compat_3_0[] =3D {
> > +    PC_COMPAT_3_0
> > +};
> > +
> >  static void pc_i440fx_3_0_machine_options(MachineClass *m)
> >  {
> >      pc_i440fx_3_1_machine_options(m);
> >      m->is_default =3D 0;
> >      m->alias =3D NULL;
> > -    SET_MACHINE_COMPAT(m, PC_COMPAT_3_0);
> > +
> > +    compat_props_add(m->compat_props,
> > +                     pc_compat_3_0, G_N_ELEMENTS(pc_compat_3_0));
> >  }
> >
> >  DEFINE_I440FX_MACHINE(v3_0, "pc-i440fx-3.0", NULL,
> >                        pc_i440fx_3_0_machine_options);
>
> Now, this is requiring _more_ boilerplate code than before.  I'd
> like us to find a way to eliminate the macro without increasing
> the amount of boilerplate code.

I am open to ideas

>
>
> [...]
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index 7afd1a175b..d801ba71eb 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -3973,8 +3973,9 @@ DEFINE_SPAPR_MACHINE(3_1, "3.1", true);
> >  /*
> >   * pseries-3.0
> >   */
> > -#define SPAPR_COMPAT_3_0                                              =
\
> > +static GlobalProperty spapr_compat_3_0[] =3D {
> >      HW_COMPAT_3_0
> > +};
> >
> >  static void spapr_machine_3_0_instance_options(MachineState *machine)
> >  {
> > @@ -3986,7 +3987,8 @@ static void spapr_machine_3_0_class_options(Machi=
neClass *mc)
> >      sPAPRMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> >
> >      spapr_machine_3_1_class_options(mc);
> > -    SET_MACHINE_COMPAT(mc, SPAPR_COMPAT_3_0);
> > +    compat_props_add(mc->compat_props,
> > +                     spapr_compat_3_0, G_N_ELEMENTS(spapr_compat_3_0))=
;
> >
> >      smc->legacy_irq_allocation =3D true;
> >      smc->irq =3D &spapr_irq_xics_legacy;
> > @@ -3997,18 +3999,19 @@ DEFINE_SPAPR_MACHINE(3_0, "3.0", false);
> >  /*
> >   * pseries-2.12
> >   */
> > -#define SPAPR_COMPAT_2_12                                             =
 \
> > -    HW_COMPAT_2_12                                                    =
 \
> > -    {                                                                 =
 \
> > -        .driver =3D TYPE_POWERPC_CPU,                                 =
   \
> > -        .property =3D "pre-3.0-migration",                            =
   \
> > -        .value    =3D "on",                                           =
   \
> > -    },                                                                =
 \
> > -    {                                                                 =
 \
> > -        .driver =3D TYPE_SPAPR_CPU_CORE,                              =
   \
> > -        .property =3D "pre-3.0-migration",                            =
   \
> > -        .value    =3D "on",                                           =
   \
> > +static GlobalProperty spapr_compat_2_12[] =3D {
> > +    HW_COMPAT_2_12
> > +    {
> > +        .driver =3D TYPE_POWERPC_CPU,
> > +        .property =3D "pre-3.0-migration",
> > +        .value    =3D "on",
> > +    },
> > +    {
> > +        .driver =3D TYPE_SPAPR_CPU_CORE,
> > +        .property =3D "pre-3.0-migration",
> > +        .value    =3D "on",
> >      },
> > +};
> >
> >  static void spapr_machine_2_12_instance_options(MachineState *machine)
> >  {
> > @@ -4020,7 +4023,8 @@ static void spapr_machine_2_12_class_options(Mach=
ineClass *mc)
> >      sPAPRMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> >
> >      spapr_machine_3_0_class_options(mc);
> > -    SET_MACHINE_COMPAT(mc, SPAPR_COMPAT_2_12);
> > +    compat_props_add(mc->compat_props,
> > +                     spapr_compat_2_12, G_N_ELEMENTS(spapr_compat_2_12=
));
>
> It would be nice to be able to write this as:
>
>     static GlobalProperty spapr_compat_2_12[] =3D {
>         {
>             .driver =3D TYPE_POWERPC_CPU,
>             .property =3D "pre-3.0-migration",
>             .value    =3D "on",
>         },
>         {
>             .driver =3D TYPE_SPAPR_CPU_CORE,
>             .property =3D "pre-3.0-migration",
>             .value    =3D "on",
>         },
>         { /* end of list */ },
>     };
>
>     compat_props_add(mc->compat_props, hw_compat_3_0);
>     compat_props_add(mc->compat_props, spapr_compat_2_12);
>
> This way we won't need the HW_COMPAT_* macros anymore.

That could be done on top, I imagine. I can give it a try.

>
> Other than that, it's also basically the same amount of
> boilerplate as before, so that's good.
>
>
> >
> >      /* We depend on kvm_enabled() to choose a default value for the
> >       * hpt-max-page-size capability. Of course we can't do it here
> [...]
> > diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> > index a0615a8b35..275cbe5da4 100644
> > --- a/hw/s390x/s390-virtio-ccw.c
> > +++ b/hw/s390x/s390-virtio-ccw.c
> > @@ -651,96 +651,106 @@ bool css_migration_enabled(void)
> >      }                                                                 =
        \
> >      type_init(ccw_machine_register_##suffix)
> >
> > -#define CCW_COMPAT_3_0 \
> > -        HW_COMPAT_3_0
> > -
> > -#define CCW_COMPAT_2_12 \
> > -        HW_COMPAT_2_12
> > -
> > -#define CCW_COMPAT_2_11 \
> > -        HW_COMPAT_2_11 \
> > -        {\
> > -            .driver   =3D TYPE_SCLP_EVENT_FACILITY,\
> > -            .property =3D "allow_all_mask_sizes",\
> > -            .value    =3D "off",\
> > -        },
> [...]
> > +static GlobalProperty ccw_compat_3_0[] =3D {
> > +    HW_COMPAT_3_0
> > +};
> > +
> > +static GlobalProperty ccw_compat_2_12[] =3D {
> > +    HW_COMPAT_2_12
> > +};
> > +
> > +static GlobalProperty ccw_compat_2_11[] =3D {
> > +    HW_COMPAT_2_11
> > +    {
> > +        .driver   =3D TYPE_SCLP_EVENT_FACILITY,
> > +        .property =3D "allow_all_mask_sizes",
> > +        .value    =3D "off",
> > +    },
> > +};
> [...]
> >
> >  static void ccw_machine_3_1_instance_options(MachineState *machine)
> >  {
> > @@ -762,7 +772,8 @@ static void ccw_machine_3_0_class_options(MachineCl=
ass *mc)
> >
> >      s390mc->hpage_1m_allowed =3D false;
> >      ccw_machine_3_1_class_options(mc);
> > -    SET_MACHINE_COMPAT(mc, CCW_COMPAT_3_0);
> > +    compat_props_add(mc->compat_props,
> > +                     ccw_compat_3_0, G_N_ELEMENTS(ccw_compat_3_0));
>
> Same comments from spapr apply here: getting rid of the
> HW_COMPAT_* macros would be nice, but this version is good enough
> because it has the same amount of boilerplate code.
>
>

thanks

> >  }
> >  DEFINE_CCW_MACHINE(3_0, "3.0", false);
> [...]
>
> --
> Eduardo
>


--=20
Marc-Andr=C3=A9 Lureau

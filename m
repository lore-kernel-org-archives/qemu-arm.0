Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2816639lfy;
        Mon, 27 Jul 2020 05:37:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEgGwYTVYUw+6EAh4eIGcaTg3NUIHKTy3zpQ51BR0qU8ipCFwvBjaZKzSoDkh4mhK+R7sf
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr20187531wrn.110.1595853444749;
        Mon, 27 Jul 2020 05:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595853444; cv=none;
        d=google.com; s=arc-20160816;
        b=H0u27uYCqzSfwE3yWxxYNi9G38GuhAlVtyaonJCgXMlsytb2KWOBOxgpWzJp1Mbl1b
         rg6zsTW+Jw+sNrP4vqU7PNkb7D83INMLpOGY9gKhBk2xlNWeMeKB+WkRh3u6XBqF8dtN
         +Umw10AI53fAKE5NK5mpdK1FPr/FsCPn/OXoL1+1a3VZcewVjJv6Egc5PGkNEy00Agwc
         fs3tVLKzsKa1zC/DHJ5T3n36wqq2qIuaBqvjfbfAg0B7bRA+azNNCmIINvHqhhr4SlnP
         f5e3v1ogVAwx0qC2yZWGXuCZQuUJq+yw6pn6I25tHP0LCQQJVd6EhhXl/4KijY0vWNcE
         obpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date;
        bh=m/DjNBdSMMrekJaH1hiwy42ZrosrOQfeSapeZ1oiaq8=;
        b=JJUfeiJE49vijiz0yHA9FqMBRkDUnPIhQaRvNpvot4xmJZCWJ0bupxvdOnL9yXUtI7
         YHsdPvFvsiAbbkOByvfA4piYZ3idKgDe1AI2U5P4NWkPhdDHqmJD4VDePMVJ8gLA+XZ9
         wIp2bcl9Bx3USil3XEHuBLeJFMH+PuP9P+hIdGBNKEho9SddlvOt7/Es5w8+bEgPUef6
         ARfvisE1obK33XxX2n5HjHEp92yPpEiD27yCgvd4jTWDwT4PJUDeM3wvok0BUWRjGlKi
         JO6w750stog6xU70DAzfNlu02hPmj5nagJaDaM7AYlaKTiYeop8QLeIGGV/AdAogzTrx
         Afsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of groug@kaod.org designates 46.105.41.16 as permitted sender) smtp.mailfrom=groug@kaod.org
Return-Path: <groug@kaod.org>
Received: from 17.mo4.mail-out.ovh.net (17.mo4.mail-out.ovh.net. [46.105.41.16])
        by mx.google.com with ESMTPS id q13si7647370wru.219.2020.07.27.05.37.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 05:37:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of groug@kaod.org designates 46.105.41.16 as permitted sender) client-ip=46.105.41.16;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of groug@kaod.org designates 46.105.41.16 as permitted sender) smtp.mailfrom=groug@kaod.org
Received: from player690.ha.ovh.net (unknown [10.110.103.2])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 450DA245C63
	for <alex.bennee@linaro.org>; Mon, 27 Jul 2020 14:37:24 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net [82.253.208.248])
	(Authenticated sender: groug@kaod.org)
	by player690.ha.ovh.net (Postfix) with ESMTPSA id 5444D14989EC8;
	Mon, 27 Jul 2020 12:36:57 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-95G0018439f768-0629-4b97-9cca-d49db8edae8c,B7B50C960922AB26A7D550ED897AF9E452A9EBFF) smtp.auth=groug@kaod.org
Date: Mon, 27 Jul 2020 14:36:56 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, David
 Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 1/8] target/arm: Move start-powered-off property to
 generic CPUState
Message-ID: <20200727143656.277500f0@bahia.lan>
In-Reply-To: <20200723030609.GL5513@umbus.fritz.box>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
	<20200723025657.644724-2-bauerman@linux.ibm.com>
	<20200723030609.GL5513@umbus.fritz.box>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x6A_q+XXF/OnOq118RkT5mq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Ovh-Tracer-Id: 14592507219021371878
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedriedtgdehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgesghdtreerredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveegffeljeegleehheetiedutefhueehgeetteektddvieevgeeujeevgfelfeejnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhg
X-TUID: xNavVcLths6x

--Sig_/x6A_q+XXF/OnOq118RkT5mq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Jul 2020 13:06:09 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Jul 22, 2020 at 11:56:50PM -0300, Thiago Jung Bauermann wrote:
> > There are other platforms which also have CPUs that start powered off, =
so
> > generalize the start-powered-off property so that it can be used by the=
m.
> >=20
> > Note that ARMv7MState also has a property of the same name but this pat=
ch
> > doesn't change it because that class isn't a subclass of CPUState so it
> > wouldn't be a trivial change.
> >=20
> > This change should not cause any change in behavior.
> >=20
> > Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>=20

Reviewed-by: Greg Kurz <groug@kaod.org>

> > ---
> >  exec.c                | 1 +
> >  include/hw/core/cpu.h | 4 ++++
> >  target/arm/cpu.c      | 5 ++---
> >  target/arm/cpu.h      | 3 ---
> >  target/arm/kvm32.c    | 2 +-
> >  target/arm/kvm64.c    | 2 +-
> >  6 files changed, 9 insertions(+), 8 deletions(-)
> >=20
> > NB: I was only able to test that this patch builds. I wasn't able to
> > run it.
> >=20
> > diff --git a/exec.c b/exec.c
> > index 6f381f98e2..82e82fab09 100644
> > --- a/exec.c
> > +++ b/exec.c
> > @@ -899,6 +899,7 @@ Property cpu_common_props[] =3D {
> >      DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
> >                       MemoryRegion *),
> >  #endif
> > +    DEFINE_PROP_BOOL("start-powered-off", CPUState, start_powered_off,=
 false),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> > =20
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index 8f145733ce..9fc2696db5 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -374,6 +374,10 @@ struct CPUState {
> >      bool created;
> >      bool stop;
> >      bool stopped;
> > +
> > +    /* Should CPU start in powered-off state? */
> > +    bool start_powered_off;
> > +
> >      bool unplug;
> >      bool crash_occurred;
> >      bool exit_request;
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 111579554f..ec65c7653f 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -174,8 +174,8 @@ static void arm_cpu_reset(DeviceState *dev)
> >      env->vfp.xregs[ARM_VFP_MVFR1] =3D cpu->isar.mvfr1;
> >      env->vfp.xregs[ARM_VFP_MVFR2] =3D cpu->isar.mvfr2;
> > =20
> > -    cpu->power_state =3D cpu->start_powered_off ? PSCI_OFF : PSCI_ON;
> > -    s->halted =3D cpu->start_powered_off;
> > +    cpu->power_state =3D s->start_powered_off ? PSCI_OFF : PSCI_ON;
> > +    s->halted =3D s->start_powered_off;
> > =20
> >      if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
> >          env->iwmmxt.cregs[ARM_IWMMXT_wCID] =3D 0x69051000 | 'Q';
> > @@ -2182,7 +2182,6 @@ static const ARMCPUInfo arm_cpus[] =3D {
> >  };
> > =20
> >  static Property arm_cpu_properties[] =3D {
> > -    DEFINE_PROP_BOOL("start-powered-off", ARMCPU, start_powered_off, f=
alse),
> >      DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
> >      DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
> >      DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 9e8ed423ea..a925d26996 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -810,9 +810,6 @@ struct ARMCPU {
> >       */
> >      uint32_t psci_version;
> > =20
> > -    /* Should CPU start in PSCI powered-off state? */
> > -    bool start_powered_off;
> > -
> >      /* Current power state, access guarded by BQL */
> >      ARMPSCIState power_state;
> > =20
> > diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> > index 0af46b41c8..1f2b8f8b7a 100644
> > --- a/target/arm/kvm32.c
> > +++ b/target/arm/kvm32.c
> > @@ -218,7 +218,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
> > =20
> >      /* Determine init features for this CPU */
> >      memset(cpu->kvm_init_features, 0, sizeof(cpu->kvm_init_features));
> > -    if (cpu->start_powered_off) {
> > +    if (cs->start_powered_off) {
> >          cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_POWER_OFF;
> >      }
> >      if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index 1169237905..f8a6d905fb 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -775,7 +775,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
> > =20
> >      /* Determine init features for this CPU */
> >      memset(cpu->kvm_init_features, 0, sizeof(cpu->kvm_init_features));
> > -    if (cpu->start_powered_off) {
> > +    if (cs->start_powered_off) {
> >          cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_POWER_OFF;
> >      }
> >      if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
> >=20
>=20


--Sig_/x6A_q+XXF/OnOq118RkT5mq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl8eymgACgkQcdTV5YIv
c9Y5cA//fI3S70yYaqp/nGvaYTyqKR0BdlFHwouXRg1VROwRvgb5kzZy+HBv0UE9
Ol+K1kJJw3gw0qCTrKyNkV4bQEBEmIjIRz/X51OyZ3+oaXArlpd1dW6phxyo0frF
sNKo/CBS2vS+g3W523fXdCbBil0RErkTim5Db3TmJD301yUNLv4jy4Ej7hFSvUT5
EGDOwR0IR/H2HivOoO5r6+cKTUl0rHo95Q/yrgTrjIq5/QZMwCrrMnoiPOfOS+r8
xTlol5FS8dmfPTDaDtwF+9jkLjXGQozrXMKpgITY71OLR06CcmiNpnLWqqXNCak8
vIrp8UDjksfssmQ7ikA8FvVsX8I987sfySU5QA6Pt0YdahChhQkc2GFkI/Vhl2HI
c8Lz53Jg7snLUw/OAtXtWugWN6NEGSaMGMvn0IPtNkV+GQmZQpbCFwoh5WxnVrmP
ErFsc9dISP9VW8Jr5U5IMd7J50AarPbp5oAJEJaObFi3hkjTMhpSK/vl7q+zoePo
ByHt2MusgEBDF771iyCHxU1LDByb0lSDjrDbTNzUN+i/qjjvR5udOFBEnwkMmf+M
0yDKzncIMgZMgXgY16m8bXXqTE52rBhJxAU2IijfVGid1y3SBkXrFzaHsiO0cVJR
ev7a7b3qU7K5Uy1W8BJTHSU60Dz4hzWieZqKxIo0zACURTK0Ekc=
=QmXv
-----END PGP SIGNATURE-----

--Sig_/x6A_q+XXF/OnOq118RkT5mq--

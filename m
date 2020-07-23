Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1288889lfm;
        Wed, 22 Jul 2020 20:08:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW74OtcvXz1Xzjr5rptP5y9TlUnfkzLCnILVQe+KdF+C2rAQqPQ+R1i2WsS0cqZDkJjHJt
X-Received: by 2002:a62:2546:: with SMTP id l67mr2455816pfl.154.1595473724977;
        Wed, 22 Jul 2020 20:08:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595473724; cv=none;
        d=google.com; s=arc-20160816;
        b=LMLfcSqMEV43qJnGBWx2wlzkulvyQWkSCRdvJI1WBIG43xlVtScwOnOD55Ch5C273x
         gL2qH8bKT+0zNhTBkbGJTL78q0QuD+GdVa+7Z5veO9zTy8/6HcNxoKAF0EWwLf60cC0h
         GKI/CVIUrt4es/0DzJ7Q9fi4QEgPneoppQBVMs4i2jeHvKXyreMlv0cXCu3zF9c6xeks
         qm6IRgcxtrd++R+wZKcusGkyw81qJpBmhN4UwKk5siWtHdGi854puHkQTewth4xTQkr/
         /W8JTXgjinsa8Xai+9dJd9vi0KO+Bk+DY757rSM2uPe1kR5m/I/pE550gGUX4Ze3J+43
         L1CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=KHaDw0Z1d6A/+AjQGMxxZQI/R/7W/XRwnrfdYVJ1WmE=;
        b=yuAxrRxydZXSpzirGsW4VM2ZgrqoIAwRArY3MVf8am7AG4Cs5FGqxVC9wJSKEWYCPy
         HcRdFCtdU59XwjTZNxd0lnZH/uyUilHwBkzKbowbhV939yxBdJnUHdKpjMEB8OjhOtJo
         IGLJE/11XACHApHqIJyPfHwgXA+UlvgnWuDJalOIiP7+naDjz4WKs+oPP4IxIS2gyqrI
         2R3ZVVt8Pgts0PgPj0kooRqds1bwpoJGuWZpCoOlAmia9oeiSJ4YApTNf3pc81JkALSq
         cVW0+cK1+xVnp4GoWiny1iIGkCD9TwbZfFQXxnh7saAIKa0+8qnPCvEnNMtcDKyclQXZ
         CYdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b="VNvTh/VV";
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id w21si877989pgc.565.2020.07.22.20.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 20:08:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b="VNvTh/VV";
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4BBy2v2LQDz9sRW; Thu, 23 Jul 2020 13:08:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1595473719;
	bh=XXBf9GvdJtl/hxVFX9jO+2Y4JyS21BIXHuwyM7dd19Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VNvTh/VVboKLCLrPxn2yZhX/WYD8mDM6KlYx9q/FWPf4Ep0UXDtck1gzsd+EX/C5k
	 BI2wse9Fgl40ipZOM5HZ2jUJ4S8mwoM4f9DCvlf98vUOf4IfxY5D/Sfd9tsUFozHBu
	 q4MZa/4j+BK3JX5mCwoffkSGqoMGIXrDzTTSJbSo=
Date: Thu, 23 Jul 2020 13:06:09 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3 1/8] target/arm: Move start-powered-off property to
 generic CPUState
Message-ID: <20200723030609.GL5513@umbus.fritz.box>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
 <20200723025657.644724-2-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vTUhhhdwRI43FzeR"
Content-Disposition: inline
In-Reply-To: <20200723025657.644724-2-bauerman@linux.ibm.com>
X-TUID: K5Ho8eBPijml


--vTUhhhdwRI43FzeR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 11:56:50PM -0300, Thiago Jung Bauermann wrote:
> There are other platforms which also have CPUs that start powered off, so
> generalize the start-powered-off property so that it can be used by them.
>=20
> Note that ARMv7MState also has a property of the same name but this patch
> doesn't change it because that class isn't a subclass of CPUState so it
> wouldn't be a trivial change.
>=20
> This change should not cause any change in behavior.
>=20
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  exec.c                | 1 +
>  include/hw/core/cpu.h | 4 ++++
>  target/arm/cpu.c      | 5 ++---
>  target/arm/cpu.h      | 3 ---
>  target/arm/kvm32.c    | 2 +-
>  target/arm/kvm64.c    | 2 +-
>  6 files changed, 9 insertions(+), 8 deletions(-)
>=20
> NB: I was only able to test that this patch builds. I wasn't able to
> run it.
>=20
> diff --git a/exec.c b/exec.c
> index 6f381f98e2..82e82fab09 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -899,6 +899,7 @@ Property cpu_common_props[] =3D {
>      DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
>                       MemoryRegion *),
>  #endif
> +    DEFINE_PROP_BOOL("start-powered-off", CPUState, start_powered_off, f=
alse),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 8f145733ce..9fc2696db5 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -374,6 +374,10 @@ struct CPUState {
>      bool created;
>      bool stop;
>      bool stopped;
> +
> +    /* Should CPU start in powered-off state? */
> +    bool start_powered_off;
> +
>      bool unplug;
>      bool crash_occurred;
>      bool exit_request;
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 111579554f..ec65c7653f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -174,8 +174,8 @@ static void arm_cpu_reset(DeviceState *dev)
>      env->vfp.xregs[ARM_VFP_MVFR1] =3D cpu->isar.mvfr1;
>      env->vfp.xregs[ARM_VFP_MVFR2] =3D cpu->isar.mvfr2;
> =20
> -    cpu->power_state =3D cpu->start_powered_off ? PSCI_OFF : PSCI_ON;
> -    s->halted =3D cpu->start_powered_off;
> +    cpu->power_state =3D s->start_powered_off ? PSCI_OFF : PSCI_ON;
> +    s->halted =3D s->start_powered_off;
> =20
>      if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
>          env->iwmmxt.cregs[ARM_IWMMXT_wCID] =3D 0x69051000 | 'Q';
> @@ -2182,7 +2182,6 @@ static const ARMCPUInfo arm_cpus[] =3D {
>  };
> =20
>  static Property arm_cpu_properties[] =3D {
> -    DEFINE_PROP_BOOL("start-powered-off", ARMCPU, start_powered_off, fal=
se),
>      DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
>      DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
>      DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9e8ed423ea..a925d26996 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -810,9 +810,6 @@ struct ARMCPU {
>       */
>      uint32_t psci_version;
> =20
> -    /* Should CPU start in PSCI powered-off state? */
> -    bool start_powered_off;
> -
>      /* Current power state, access guarded by BQL */
>      ARMPSCIState power_state;
> =20
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 0af46b41c8..1f2b8f8b7a 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -218,7 +218,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
> =20
>      /* Determine init features for this CPU */
>      memset(cpu->kvm_init_features, 0, sizeof(cpu->kvm_init_features));
> -    if (cpu->start_powered_off) {
> +    if (cs->start_powered_off) {
>          cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_POWER_OFF;
>      }
>      if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 1169237905..f8a6d905fb 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -775,7 +775,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
> =20
>      /* Determine init features for this CPU */
>      memset(cpu->kvm_init_features, 0, sizeof(cpu->kvm_init_features));
> -    if (cpu->start_powered_off) {
> +    if (cs->start_powered_off) {
>          cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_POWER_OFF;
>      }
>      if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vTUhhhdwRI43FzeR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8Y/p4ACgkQbDjKyiDZ
s5L65A//XhsDBZQC78Yse+Qdy8bJ5h86KbaxbOBf+A9kvORdxYRt8JIoy1mhh4y3
NNjzrq5HDKx6YVwW9zLISGtrAT5JzqC4rO8XMsUnxW43FoG1nCErtH6Ml9cW9niw
5Q/REX6DeDHNOdAMEO3ZMMzc2VOHHD2+GwUg7E1hEjkl8D5HqaLpKUBV5UVCwhgR
/ZhNgqreHF7YU7fa+HgX/EXoRQ3vVubxmD/zR4mlaegJU+JxFtqGzHqa4BfmQyMJ
Gx2U4BQvzAK2rNPmOFOQpuEE8X0Nyq4w/5W/V4ZPEhmptJVA9wwpDgNrjGJVp7y+
6zHmpaoBNDUk2sBpXzUbr05keXxg7H3m6WruWcobyTIW7fyDE8zTy3kxXXQltS8K
NJSZVGA0yRjwSDy4vMOcfys7hdTvrtD3osbOQh5+pkRHFGYwDsGW8ukSdiRzgHxC
KQ9PQ4DZqPpa0pWA91sCY54E9LCKEWHxBsafoLsQ4ngXmaIASUj6x0pbYk16ushz
IXXPEBsvE1pE04lDwaCX3SP3VZvenbYVtu/44CNgBT1EjO8OVnUlx9zU4A0BOqGu
Tk0O1goMr3Ip7m5xY/HMT75dffpS0gH846+LqisoyA7xWAfmI7p/eoF/BRE/vpeN
jPFzmznA5N8t2vWAhEXRBv32TMZqkHai6Ag5oUe8uEy62T250fk=
=QrMU
-----END PGP SIGNATURE-----

--vTUhhhdwRI43FzeR--

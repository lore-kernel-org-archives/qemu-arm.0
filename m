Received: by 10.28.71.27 with SMTP id u27csp3083791wma;
        Mon, 5 Feb 2018 15:46:01 -0800 (PST)
X-Google-Smtp-Source: AH8x227GprDTfNSfJuUPnVuQ+QO9gyytByvFmdRcysYgdq2Y9EvdGtsOMF0CmT/BFlwbAsa+Q1cj
X-Received: by 10.129.152.138 with SMTP id p132mr324405ywg.378.1517874361602;
        Mon, 05 Feb 2018 15:46:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517874361; cv=none;
        d=google.com; s=arc-20160816;
        b=H5SUndMfdjxqangVnB+9c5O3qzFMokG9qTf6sG0TF7QszQoWMTn4f7W2GbfvGtSX1/
         Yrk/I21qInhMuCvkGVLYwMe+9kneOXISAPxjzmHDTt2cY4VjjD5xDxk9xpIez02F0ZsT
         HFnyp1nrVCvpPwIKStpoA9iYAGw1Qzh/4lKVNxR8gOJ3CXIDIvaRaGoGEmYKNxtGMZ1G
         AH93aTv5PegLyrWW9y8hrZR6LYKY+21f4sSOWdjANe+pV/2K4lDYyOcHCGqs0qF9nc58
         1DZ/rrfD9n2/ud7P0/v+21YFMZQt0f7E6v/3gC10Xr7jyZK/5sV9LEuF/v/0M/IJTop/
         2m0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=zRuqS/B26BSOmtJ2PumHmM1DhWYLDBHwY/DCjQM9yzw=;
        b=A1v3xecP5XUsUqUCp/6RanDZWVI435S3O4u9fNVVt3n2RSMYAujlt2hwIrSWWnfpiw
         N/ptflQvJQ6nLu3KTbG0d68eAlSxDuo6w2zjtGD4LqhbwsmNXKEkA6sdkTnDNKMDsvPV
         i93wu0G7O3qFXc5BEL260laxzmeE5VcSRJO/cQTz++jpFOc3ETwn+UUtE3371RXloEYI
         SUWcangMrOW+xIDJql3XOYcZ+u5k2+j0EeqrgVwyAnyUZ18m7gvYCP3K+cUPglssG54D
         1Z7X0LgQz0jr+xxPuVOU9/87kvvkBwf06yBK9zRhRgIFv1c3uqEtSUf0ToCB/ifVbQ6a
         78wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=Piy/japt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g70si1666726yba.678.2018.02.05.15.46.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 15:46:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=Piy/japt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eiqSX-0003sO-04
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 18:46:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eiqR4-0002uC-F4
	for qemu-devel@nongnu.org; Mon, 05 Feb 2018 18:44:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eiqQz-00084y-OU
	for qemu-devel@nongnu.org; Mon, 05 Feb 2018 18:44:30 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:45984)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eiqQz-00083p-GF; Mon, 05 Feb 2018 18:44:25 -0500
Received: by mail-qk0-x242.google.com with SMTP id x127so90975qkb.12;
	Mon, 05 Feb 2018 15:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=QpeBFrfST3HFg21Ayxl+TUEVDTmUZF1GSh+A8NR9UVI=;
	b=Piy/japt8m7ZGsiMZK2W1DB5zNzG4HNiz0qd254+prvbf7pYfDeLHDc9ECfnn19n8u
	Y3GD9t/rem0chEC9njjhj5gGkKGBkC6AH2bYyVVHF4d1Ea2ODqClmxJMv97q50vQSokU
	gyJgi7v9VfiOEKbW1sIuqv1gjMtFJfUEB9LbUVK3O68er+WjncDdflUkQgbKLs17RGXD
	+wfxkgYb9rdWCJCho7LzL26cfNFX3CR9Xly/UWhVH3pmhHNsnML5hnyhS8QeOl4fJWUX
	+30VbGZQ3QiDeV85jHt19oMn/nRQMYR5rDdP5M/AbJpLc//d9flp0XLeGlwQ39HDiOfw
	WGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=QpeBFrfST3HFg21Ayxl+TUEVDTmUZF1GSh+A8NR9UVI=;
	b=cvSCbQwnuXCpYq1q8iaoQx5Q+MkyJIFoU0b/3MWbteVflM/FfWH6TagGzS8UEMlW7H
	7BjMhhKSCKkNJzoAnGlrQo/q+1KGnmxDb+opCkURl7oYC9p2jrdMgmyJNqd/+BmY4pDX
	frjZ/1eKZ3EA0RSboJlNVv/3w3DMwA6IIwl0azpB4K2v2jNcwEJ5pN1kE3aO/qOcD6of
	3Zd6azewZN616x7lObvmh4znxvoDYL8VuycdCiUETGeikFbUDgqNJ1XKqmBcx865siLc
	8wn53GA4te6CFGTzLQNhiT24UpPH0mfGy9M7TGFGhy3Bv6CE2h0NiIm26k6P6/oanFMM
	3E2g==
X-Gm-Message-State: APf1xPBss5cXXCHTj2q4EWFiX4Lcakh2LFgWrMKlTzKZefL8PHzJ8Ylf
	5AeUqbA8bTrT7h2cGXLZBJ0=
X-Received: by 10.55.133.71 with SMTP id h68mr765969qkd.106.1517874264410;
	Mon, 05 Feb 2018 15:44:24 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	y188sm6501709qke.55.2018.02.05.15.44.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 15:44:23 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
	<1517324542-6607-3-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <540d164d-23b7-c511-80ee-037cdcb3d86b@amsat.org>
Date: Mon, 5 Feb 2018 20:44:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517324542-6607-3-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="gwRmpTidnztYlPqgKmwku3VfM8P78TADb"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 2/7] target/arm: Split "get
 pending exception info" from "acknowledge it"
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ENUnHKD4Wf0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gwRmpTidnztYlPqgKmwku3VfM8P78TADb
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org
Message-ID: <540d164d-23b7-c511-80ee-037cdcb3d86b@amsat.org>
Subject: Re: [Qemu-arm] [PATCH 2/7] target/arm: Split "get pending exception
 info" from "acknowledge it"
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
 <1517324542-6607-3-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1517324542-6607-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/30/2018 12:02 PM, Peter Maydell wrote:
> Currently armv7m_nvic_acknowledge_irq() does three things:
>  * make the current highest priority pending interrupt active
>  * return a bool indicating whether that interrupt is targeting
>    Secure or NonSecure state
>  * implicitly tell the caller which is the highest priority
>    pending interrupt by setting env->v7m.exception
>=20
> We need to split these jobs, because v7m_exception_taken()
> needs to know whether the pending interrupt targets Secure so
> it can choose to stack callee-saves registers or not, but it
> must not make the interrupt active until after it has done
> that stacking, in case the stacking causes a derived exception.
> Similarly, it needs to know the number of the pending interrupt
> so it can read the correct vector table entry before the
> interrupt is made active, because vector table reads might
> also cause a derived exception.
>=20
> Create a new armv7m_nvic_get_pending_irq_info() function which simply
> returns information about the highest priority pending interrupt, and
> use it to rearrange the v7m_exception_taken() code so we don't
> acknowledge the exception until we've done all the things which could
> possibly cause a derived exception.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 19 ++++++++++++++++---
>  hw/intc/armv7m_nvic.c | 30 +++++++++++++++++++++++-------
>  target/arm/helper.c   | 16 ++++++++++++----
>  hw/intc/trace-events  |  3 ++-
>  4 files changed, 53 insertions(+), 15 deletions(-)
>=20
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9ed03e6..f21f68e 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1519,16 +1519,29 @@ void armv7m_nvic_set_pending(void *opaque, int =
irq, bool secure);
>   */
>  void armv7m_nvic_set_pending_derived(void *opaque, int irq, bool secur=
e);
>  /**
> + * armv7m_nvic_get_pending_irq_info: return highest priority pending
> + *    exception, and whether it targets Secure state
> + * @opaque: the NVIC
> + * @pirq: set to pending exception number
> + * @ptargets_secure: set to whether pending exception targets Secure
> + *
> + * This function writes the number of the highest priority pending
> + * exception (the one which would be made active by
> + * armv7m_nvic_acknowledge_irq()) to @pirq, and sets @ptargets_secure
> + * to true if the current highest priority pending exception should
> + * be taken to Secure state, false for NS.
> + */
> +void armv7m_nvic_get_pending_irq_info(void *opaque, int *pirq,
> +                                      bool *ptargets_secure);
> +/**
>   * armv7m_nvic_acknowledge_irq: make highest priority pending exceptio=
n active
>   * @opaque: the NVIC
>   *
>   * Move the current highest priority pending exception from the pendin=
g
>   * state to the active state, and update v7m.exception to indicate tha=
t
>   * it is the exception currently being handled.
> - *
> - * Returns: true if exception should be taken to Secure state, false f=
or NS
>   */
> -bool armv7m_nvic_acknowledge_irq(void *opaque);
> +void armv7m_nvic_acknowledge_irq(void *opaque);
>  /**
>   * armv7m_nvic_complete_irq: complete specified interrupt or exception=

>   * @opaque: the NVIC
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index b4a6e7c..360889d 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -650,24 +650,20 @@ void armv7m_nvic_set_pending_derived(void *opaque=
, int irq, bool secure)
>  }
> =20
>  /* Make pending IRQ active.  */
> -bool armv7m_nvic_acknowledge_irq(void *opaque)
> +void armv7m_nvic_acknowledge_irq(void *opaque)
>  {
>      NVICState *s =3D (NVICState *)opaque;
>      CPUARMState *env =3D &s->cpu->env;
>      const int pending =3D s->vectpending;
>      const int running =3D nvic_exec_prio(s);
>      VecInfo *vec;
> -    bool targets_secure;
> =20
>      assert(pending > ARMV7M_EXCP_RESET && pending < s->num_irq);
> =20
>      if (s->vectpending_is_s_banked) {
>          vec =3D &s->sec_vectors[pending];
> -        targets_secure =3D true;
>      } else {
>          vec =3D &s->vectors[pending];
> -        targets_secure =3D !exc_is_banked(s->vectpending) &&
> -            exc_targets_secure(s, s->vectpending);
>      }
> =20
>      assert(vec->enabled);
> @@ -675,7 +671,7 @@ bool armv7m_nvic_acknowledge_irq(void *opaque)
> =20
>      assert(s->vectpending_prio < running);
> =20
> -    trace_nvic_acknowledge_irq(pending, s->vectpending_prio, targets_s=
ecure);
> +    trace_nvic_acknowledge_irq(pending, s->vectpending_prio);
> =20
>      vec->active =3D 1;
>      vec->pending =3D 0;
> @@ -683,8 +679,28 @@ bool armv7m_nvic_acknowledge_irq(void *opaque)
>      write_v7m_exception(env, s->vectpending);
> =20
>      nvic_irq_update(s);
> +}
> +
> +void armv7m_nvic_get_pending_irq_info(void *opaque,
> +                                      int *pirq, bool *ptargets_secure=
)
> +{
> +    NVICState *s =3D (NVICState *)opaque;
> +    const int pending =3D s->vectpending;
> +    bool targets_secure;
> +
> +    assert(pending > ARMV7M_EXCP_RESET && pending < s->num_irq);
> +
> +    if (s->vectpending_is_s_banked) {
> +        targets_secure =3D true;
> +    } else {
> +        targets_secure =3D !exc_is_banked(pending) &&
> +            exc_targets_secure(s, pending);
> +    }
> +
> +    trace_nvic_get_pending_irq_info(pending, targets_secure);
> =20
> -    return targets_secure;

maybe:

assert(ptargets_secure && pirq);

(function is externally callable)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> +    *ptargets_secure =3D targets_secure;
> +    *pirq =3D pending;
>  }
> =20
>  int armv7m_nvic_complete_irq(void *opaque, int irq, bool secure)
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index bfce096..6062f38 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6395,12 +6395,12 @@ static uint32_t *get_v7m_sp_ptr(CPUARMState *en=
v, bool secure, bool threadmode,
>      }
>  }
> =20
> -static uint32_t arm_v7m_load_vector(ARMCPU *cpu, bool targets_secure)
> +static uint32_t arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets=
_secure)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUARMState *env =3D &cpu->env;
>      MemTxResult result;
> -    hwaddr vec =3D env->v7m.vecbase[targets_secure] + env->v7m.excepti=
on * 4;
> +    hwaddr vec =3D env->v7m.vecbase[targets_secure] + exc * 4;
>      uint32_t addr;
> =20
>      addr =3D address_space_ldl(cs->as, vec,
> @@ -6462,8 +6462,9 @@ static void v7m_exception_taken(ARMCPU *cpu, uint=
32_t lr, bool dotailchain)
>      CPUARMState *env =3D &cpu->env;
>      uint32_t addr;
>      bool targets_secure;
> +    int exc;
> =20
> -    targets_secure =3D armv7m_nvic_acknowledge_irq(env->nvic);
> +    armv7m_nvic_get_pending_irq_info(env->nvic, &exc, &targets_secure)=
;
> =20
>      if (arm_feature(env, ARM_FEATURE_V8)) {
>          if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
> @@ -6531,6 +6532,14 @@ static void v7m_exception_taken(ARMCPU *cpu, uin=
t32_t lr, bool dotailchain)
>          }
>      }
> =20
> +    addr =3D arm_v7m_load_vector(cpu, exc, targets_secure);
> +
> +    /* Now we've done everything that might cause a derived exception
> +     * we can go ahead and activate whichever exception we're going to=

> +     * take (which might now be the derived exception).
> +     */
> +    armv7m_nvic_acknowledge_irq(env->nvic);
> +
>      /* Switch to target security state -- must do this before writing =
SPSEL */
>      switch_v7m_security_state(env, targets_secure);
>      write_v7m_control_spsel(env, 0);
> @@ -6538,7 +6547,6 @@ static void v7m_exception_taken(ARMCPU *cpu, uint=
32_t lr, bool dotailchain)
>      /* Clear IT bits */
>      env->condexec_bits =3D 0;
>      env->regs[14] =3D lr;
> -    addr =3D arm_v7m_load_vector(cpu, targets_secure);
>      env->regs[15] =3D addr & 0xfffffffe;
>      env->thumb =3D addr & 1;
>  }
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 09e87d1..4092d28 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -180,7 +180,8 @@ nvic_escalate_disabled(int irq) "NVIC escalating ir=
q %d to HardFault: disabled"
>  nvic_set_pending(int irq, bool secure, bool derived, int en, int prio)=
 "NVIC set pending irq %d secure-bank %d derived %d (enabled: %d priority=
 %d)"
>  nvic_clear_pending(int irq, bool secure, int en, int prio) "NVIC clear=
 pending irq %d secure-bank %d (enabled: %d priority %d)"
>  nvic_set_pending_level(int irq) "NVIC set pending: irq %d higher prio =
than vectpending: setting irq line to 1"
> -nvic_acknowledge_irq(int irq, int prio, bool targets_secure) "NVIC ack=
nowledge IRQ: %d now active (prio %d targets_secure %d)"
> +nvic_acknowledge_irq(int irq, int prio) "NVIC acknowledge IRQ: %d now =
active (prio %d)"
> +nvic_get_pending_irq_info(int irq, bool secure) "NVIC next IRQ %d: tar=
gets_secure: %d"
>  nvic_complete_irq(int irq, bool secure) "NVIC complete IRQ %d (secure =
%d)"
>  nvic_set_irq_level(int irq, int level) "NVIC external irq %d level set=
 to %d"
>  nvic_sysreg_read(uint64_t addr, uint32_t value, unsigned size) "NVIC s=
ysreg read addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
>=20


--gwRmpTidnztYlPqgKmwku3VfM8P78TADb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlp47E0ACgkQ4+MsLN6t
wN6EJg/9H4QutZmybzqShWZskhhMDusEBpdqkdMEztWMGtRKckDvDoz5HmsXXn0J
sAL5azfjWfYTe8fWRwgdgNXLrtfgtUU1zpokfpQzQahBCNTCfas14vB39MkABksa
mmPWd1RasroawqZhfTGOAKfmEI90colRI+ZeF8Ym2N3kGOziRDPK9hJwW8J1x2/w
rv9G7hbjchzDZKFEuztWzlmwyvIItEycdCnyBRXY44CE9q1Y0FVoP75JrZ+7/Y9/
FUQRoRM3AIRUf576natF4/9m397hYepfRBV7lMihnjNVN/ronZTqqoxOJEe97htO
ei+dymk3O0YEhEnI0plZ6XOUogXwlBkgJw7okWTmK53SaLKmGt9l2FGPnIdtCEoT
2YtIB/1XL5Q+7KbOilrALm7TZoZOW7+kHlpAMWdXgEp18FaVn9nLwfPi7a5MQg4d
3sMc/9gij0R6C32nZTSG6EIYw25UkQGBdlM+9Y3PUtVBagMfkLxaFCcqZzpIQR5k
UAN82tTGy+VFgGf6EMRKIis5/bw89kq72cYOIrXwhLrV7R62KdoCmj6ImxkOuKT9
aVACv7A4LLEZeOuuBFMk1ao9hHJ9gBBGe61ymRltU0kMfatd9WVV7R8oYBVZTIkK
eLIBxeYIwgM86sO2cayjAQH+XFaYQE/tqyXuqnG/VfSkMuQyDRA=
=8IS7
-----END PGP SIGNATURE-----

--gwRmpTidnztYlPqgKmwku3VfM8P78TADb--

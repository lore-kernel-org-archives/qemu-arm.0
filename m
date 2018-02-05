Received: by 10.28.71.27 with SMTP id u27csp3085587wma;
        Mon, 5 Feb 2018 15:49:00 -0800 (PST)
X-Google-Smtp-Source: AH8x227Yir1NlEdXUNsXRusRPMojgh99SNSQhcKko9bkY3SRZruuntWRcblGH8z1oyFqRvARbfcx
X-Received: by 10.37.195.131 with SMTP id t125mr357768ybf.216.1517874540407;
        Mon, 05 Feb 2018 15:49:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517874540; cv=none;
        d=google.com; s=arc-20160816;
        b=Ptdp2qomRtexLekycBGKaUg2phDW2Su4O3yukdnyW0/44xWVpyD8J4zgKrM8m3oRjs
         uzFKbRCHMezFli0dfgnVuEpkKRxou/C1u9lL5/AxAQgyTmX4Ls75x3cKM2n4GDn6gntq
         XV12BkKOJ0tErLNncX9B8ugtGJmxFW2jJmVch8aY5U/UXhq6GP/EyNZc0fgfdhNwh9eW
         XqYnEu+5wsc88sYqhk7f/ua66J1YGsYyVoo9FHRK+aRFHPpGLW/eQcZoubfwh/avs2HY
         R4E/wG3aJTMyJRkPVfakgPoHH6HxfldX/R6S7cC0bGX0GNNlCL4cZ4+fA05ohGYbzpoy
         Sp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=w+7ZlVLi6D9JhwOpgWQTeLcAGjO5CrYZPpBATYnC7pA=;
        b=j4kVBLjcgUn6cgGkt6XE+weycYCXEcURKSOEfstv2RdOmrxGtNfYPJfp7u0RqiHpkO
         PZ3qVz1XLPpEGzavUji5lxyesmbJPqdrjK/hglpJ4EGHAuTxoS8J6gmE9QYGU9LAdL61
         rE9e35pyUyLpi/pMzqIeaj0E6i9JI5alqZgg0cX163E+1387jhMKuQmoHbu7LvbT3FNs
         +j04HPqKL308Yw8SVHfI9KpH/SGy1kBVdTHlJ6ZtxBajGDO+BIJj+RH8nmC7p29S0SJK
         fDPx6qXXnuIu/9yNY5CKwInYeAp6l3OMTepnJrhG1h0LLRIRS5fg22Jo4uk/q4wfs4qm
         NANw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gVen0Yq/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v125si1670349ybe.572.2018.02.05.15.49.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 15:49:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gVen0Yq/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eiqVP-0005Ml-Rt
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 18:48:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eiqVC-0005Jb-Um
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 18:48:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eiqVB-0003FD-TX
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 18:48:47 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35769)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eiqV5-0003BI-BS; Mon, 05 Feb 2018 18:48:39 -0500
Received: by mail-qk0-x242.google.com with SMTP id 69so130789qkz.2;
	Mon, 05 Feb 2018 15:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=w+7ZlVLi6D9JhwOpgWQTeLcAGjO5CrYZPpBATYnC7pA=;
	b=gVen0Yq/igi1nWcnZNGhEhpDCcY49HYGwyW3DCn93Ok5f+qZMTOVG6NMk3W2JEO6+q
	F0jhzR82IL11I2w21ibpGqTQPA7GW2waIrMZyz7ozhG5iEPTcuVN/b91hISAbDD3Zjff
	W3HbTrcBHIp0UeDM2V2K6mvNS3NAF9/kArVEiW2KUJaE8Zyyj9VH2s9+F6SA8NLDTEcp
	hoaufiI1SsmFlGu8fiJguPgwOFdrTDqEONPYwrxXdn9Ic4fTP9bkzhWpuHP0vaKNY4xt
	5AGXpHBda9Ao49+t8E/w9sUAXfYtfDMAIGdGqIWo8uHEYMussXs7mjpWHEk4/fVC23Bs
	mBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=w+7ZlVLi6D9JhwOpgWQTeLcAGjO5CrYZPpBATYnC7pA=;
	b=es9iaDAq6CdnzqohonH40bUYtGgiSEIkOJLKx6HvuYJkN8Cr9ye7LXCkRQSP/40oPl
	6+jnEkfq8f5HnHTYr2pc7Py7Rk0h+AeAbDBIXhN+hdQp7Biyg1ApcN2ZSIYns43ZibTN
	dnOSvKAZncRvV8/eg7LQy6ODwIhBmZUYRwRMvS1qkGghO633L+f4FPFrD27wZaTXGmkX
	Q5NYtaHRDrQImoaBiIYjy/nEIUo8uVBD8PBUzoCO1r1beKE9qeUpLRLsJNw+MiNQeFdO
	XGPtkYxdsJbtE+xhlyohwA21XwPOPMJeESBqoo9nakAHZC53rgTVG9GdcDNekdH+zRyP
	D8dQ==
X-Gm-Message-State: APf1xPDtW75QpFe1nROpd9252/2n5Yw2RnwFE5Ua+45bLg2rrPNlMmLW
	PkluUij1Vo37A+MkJSPehBsvITaS
X-Received: by 10.55.88.7 with SMTP id m7mr806664qkb.142.1517874518647;
	Mon, 05 Feb 2018 15:48:38 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	x135sm6683895qkx.93.2018.02.05.15.48.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 15:48:38 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
	<1517324542-6607-6-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <7b9ed62e-7210-48a3-9c1d-8f16e3a16796@amsat.org>
Date: Mon, 5 Feb 2018 20:48:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517324542-6607-6-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="zhP4fAd7UXZShWhLn9Sd0IbV600QjE0qa"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH 5/7] target/arm: Make v7m_push_callee_stack()
 honour MPU
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0NlawEmhSCgC

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zhP4fAd7UXZShWhLn9Sd0IbV600QjE0qa
Content-Type: multipart/mixed; boundary="B35iJIaI7R01vBmCsGmTn4P7aFKHcf6EI";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org
Message-ID: <7b9ed62e-7210-48a3-9c1d-8f16e3a16796@amsat.org>
Subject: Re: [Qemu-arm] [PATCH 5/7] target/arm: Make v7m_push_callee_stack()
 honour MPU
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
 <1517324542-6607-6-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1517324542-6607-6-git-send-email-peter.maydell@linaro.org>

--B35iJIaI7R01vBmCsGmTn4P7aFKHcf6EI
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 01/30/2018 12:02 PM, Peter Maydell wrote:
> Make v7m_push_callee_stack() honour the MPU by using the
> new v7m_stack_write() function. We return a flag to indicate
> whether the pushes failed, which we can then use in
> v7m_exception_taken() to cause us to handle the derived
> exception correctly.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 64 ++++++++++++++++++++++++++++++++++++++++-----=
--------
>  1 file changed, 49 insertions(+), 15 deletions(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 007e760..de0031b 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6473,7 +6473,7 @@ static uint32_t arm_v7m_load_vector(ARMCPU *cpu, =
int exc, bool targets_secure)
>      return addr;
>  }
> =20
> -static void v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotai=
lchain,
> +static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotai=
lchain,
>                                    bool ignore_faults)
>  {
>      /* For v8M, push the callee-saves register part of the stack frame=
=2E
> @@ -6481,31 +6481,55 @@ static void v7m_push_callee_stack(ARMCPU *cpu, =
uint32_t lr, bool dotailchain,
>       * In the tailchaining case this may not be the current stack.
>       */
>      CPUARMState *env =3D &cpu->env;
> -    CPUState *cs =3D CPU(cpu);
>      uint32_t *frame_sp_p;
>      uint32_t frameptr;
> +    ARMMMUIdx mmu_idx;
> +    bool stacked_ok;
> =20
>      if (dotailchain) {
> -        frame_sp_p =3D get_v7m_sp_ptr(env, true,
> -                                    lr & R_V7M_EXCRET_MODE_MASK,
> +        bool mode =3D lr & R_V7M_EXCRET_MODE_MASK;
> +        bool priv =3D !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_NPRI=
V_MASK) ||
> +            !mode;
> +
> +        mmu_idx =3D arm_v7m_mmu_idx_for_secstate_and_priv(env, M_REG_S=
, priv);
> +        frame_sp_p =3D get_v7m_sp_ptr(env, M_REG_S, mode,
>                                      lr & R_V7M_EXCRET_SPSEL_MASK);
>      } else {
> +        mmu_idx =3D core_to_arm_mmu_idx(env, cpu_mmu_index(env, false)=
);
>          frame_sp_p =3D &env->regs[13];
>      }
> =20
>      frameptr =3D *frame_sp_p - 0x28;
> =20
> -    stl_phys(cs->as, frameptr, 0xfefa125b);
> -    stl_phys(cs->as, frameptr + 0x8, env->regs[4]);
> -    stl_phys(cs->as, frameptr + 0xc, env->regs[5]);
> -    stl_phys(cs->as, frameptr + 0x10, env->regs[6]);
> -    stl_phys(cs->as, frameptr + 0x14, env->regs[7]);
> -    stl_phys(cs->as, frameptr + 0x18, env->regs[8]);
> -    stl_phys(cs->as, frameptr + 0x1c, env->regs[9]);
> -    stl_phys(cs->as, frameptr + 0x20, env->regs[10]);
> -    stl_phys(cs->as, frameptr + 0x24, env->regs[11]);
> +    /* Write as much of the stack frame as we can. A write failure may=

> +     * cause us to pend a derived exception.
> +     */
> +    stacked_ok =3D
> +        v7m_stack_write(cpu, frameptr, 0xfefa125b, mmu_idx, ignore_fau=
lts) &&
> +        v7m_stack_write(cpu, frameptr + 0x8, env->regs[4], mmu_idx,

nice!

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> +                        ignore_faults) &&
> +        v7m_stack_write(cpu, frameptr + 0xc, env->regs[5], mmu_idx,
> +                        ignore_faults) &&
> +        v7m_stack_write(cpu, frameptr + 0x10, env->regs[6], mmu_idx,
> +                        ignore_faults) &&
> +        v7m_stack_write(cpu, frameptr + 0x14, env->regs[7], mmu_idx,
> +                        ignore_faults) &&
> +        v7m_stack_write(cpu, frameptr + 0x18, env->regs[8], mmu_idx,
> +                        ignore_faults) &&
> +        v7m_stack_write(cpu, frameptr + 0x1c, env->regs[9], mmu_idx,
> +                        ignore_faults) &&
> +        v7m_stack_write(cpu, frameptr + 0x20, env->regs[10], mmu_idx,
> +                        ignore_faults) &&
> +        v7m_stack_write(cpu, frameptr + 0x24, env->regs[11], mmu_idx,
> +                        ignore_faults);
> =20
> +    /* Update SP regardless of whether any of the stack accesses faile=
d.
> +     * When we implement v8M stack limit checking then this attempt to=

> +     * update SP might also fail and result in a derived exception.
> +     */
>      *frame_sp_p =3D frameptr;
> +
> +    return !stacked_ok;
>  }
> =20
>  static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailc=
hain,
> @@ -6519,6 +6543,7 @@ static void v7m_exception_taken(ARMCPU *cpu, uint=
32_t lr, bool dotailchain,
>      uint32_t addr;
>      bool targets_secure;
>      int exc;
> +    bool push_failed =3D false;
> =20
>      armv7m_nvic_get_pending_irq_info(env->nvic, &exc, &targets_secure)=
;
> =20
> @@ -6546,8 +6571,8 @@ static void v7m_exception_taken(ARMCPU *cpu, uint=
32_t lr, bool dotailchain,
>                   */
>                  if (lr & R_V7M_EXCRET_DCRS_MASK &&
>                      !(dotailchain && (lr & R_V7M_EXCRET_ES_MASK))) {
> -                    v7m_push_callee_stack(cpu, lr, dotailchain,
> -                                          ignore_stackfaults);
> +                    push_failed =3D v7m_push_callee_stack(cpu, lr, dot=
ailchain,
> +                                                        ignore_stackfa=
ults);
>                  }
>                  lr |=3D R_V7M_EXCRET_DCRS_MASK;
>              }
> @@ -6589,6 +6614,15 @@ static void v7m_exception_taken(ARMCPU *cpu, uin=
t32_t lr, bool dotailchain,
>          }
>      }
> =20
> +    if (push_failed && !ignore_stackfaults) {
> +        /* Derived exception on callee-saves register stacking:
> +         * we might now want to take a different exception which
> +         * targets a different security state, so try again from the t=
op.
> +         */
> +        v7m_exception_taken(cpu, lr, true, true);
> +        return;
> +    }
> +
>      addr =3D arm_v7m_load_vector(cpu, exc, targets_secure);
> =20
>      /* Now we've done everything that might cause a derived exception
>=20


--B35iJIaI7R01vBmCsGmTn4P7aFKHcf6EI--

--zhP4fAd7UXZShWhLn9Sd0IbV600QjE0qa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlp47VIACgkQ4+MsLN6t
wN7wqBAAs6ZQweJcPjyJOJj6DDIfhMYZrpnlvRhE8C7cbfvPhhycVpYTaF6aI3t5
Dfz76F6Zwt7EnODPrD7B1oRDg8NCnU1+p+B5Wsaw1WT8CfSGh1WElKaBRlnWBD4O
3A/hSGn2zpXVlCub6occRoBAcFZFonGa2vOfPuN+L/tly5BXllC6/7ioMkohhPhn
7P74WFN+oGoXqxddOQcI2t06rI/mJDhmtUdJ4bBzjvXyW3DT4yqelZbkww1obQds
f/hyfnDiNRnMvOxvt55Ha+O++I0aM/Tm6FGq/YYUrIwEB9n+rH4zRFZQ0K1f/sK9
2An/zLTxoh9mDEKlXR0bBiHhWCORcdvP9Ve5KU0S7PkHXLfFgu+r5cZDspkYInv9
0PZl2couTDSIvPdb69jS2R48a8SevvWt7xHKDzoDIdBizLkwdZTXz4xRcSAZg2jr
A8I7Gh0nbX8uVhDg8Ir8WTzld30oDdSrne7MuXr6wPC80K3etlQPedDMJo5o4eZN
Bi9j1JL4IuYUYZVrTythTMGh59m70MlE8hMqF7/TfqtmgJlHFUJwJ1wgH+Nlr0MW
04H/okLQ5EKO1LT9iVauSIiDzaLs9cg/U1ORJcnq2KSDyg8ofEaKe9jbEM7GNd1Q
3egdNd7YADvd/9DHc7983jizNxq+mKyyaY4YZHuUscvVUvxim44=
=51Em
-----END PGP SIGNATURE-----

--zhP4fAd7UXZShWhLn9Sd0IbV600QjE0qa--

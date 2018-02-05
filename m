Received: by 10.28.71.27 with SMTP id u27csp3088886wma;
        Mon, 5 Feb 2018 15:54:16 -0800 (PST)
X-Google-Smtp-Source: AH8x2251GscN6RUKf4SV5Q9mb03j+DWC+eymDsc55uBmcreVjs/fkc6ey91N2rCxgtHGiXBZeMzZ
X-Received: by 10.129.241.6 with SMTP id h6mr313813ywm.499.1517874855969;
        Mon, 05 Feb 2018 15:54:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517874855; cv=none;
        d=google.com; s=arc-20160816;
        b=HeFSZejlOtHd/veERT9aGbXH8OidHyobTlUKWnTjOsR3i/eE65BmmBV1hJB92emss+
         eGdaqv/aOPHMM0CbgpL1C6hYs9QRFS6MBUzohcl7uKGsIQTjbGvUMZF1rs2F36qEYLqB
         F08tCk1+qqzlJnNA7EvTxomam+5yzShEGBMeqWT9mURBLSDmzIU0cYXPJQRfHxKwdJOs
         lciyUaj4O5tq61SqX7QTH4ArnS9J8qDavXBNpDP9WvdtyESGjMdqdq1pZzlV2MHgO8IL
         1ah2Wws4CxVe+k39Ow9P40qCc1M3+X9b9E5Yl2IT56i6BNxsXDE4tFSkqRmSPgAAk7a9
         q78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=z5qUWmhgGVfU6rBETmM/kcFzCAqH/KdXLmSU+axhGSQ=;
        b=vfDYNp7gUbd4IQV3KXQQsbmhP+OchNwBz2QtXpUtyZVj5375u+YkyzdynyIAhmR71L
         zKiEQXDHUZcS5d7VJe/6b9qvP4VcZNkwsYfu0rDZ/LNF0SlV/rVk4yg4Oc2Ksgt49AFz
         gM2C163/blSBlYZKwJXFNm2Vs33s6wCz7NY/emaIwvlXYC5geAdLVmo6qve7L1Y7Wkl1
         9tyLhWlh4yc9JaCCHhC8ugKVToNbfc6wjjeJ6YgqGV/RiLJ5ejFvzjeYysX38j5aXCTw
         o1P58gMsLXGFaly/dIuwKDnzxQMZBq2KM48kcwolO4wps8hxzU/3paVNJjc1ORIWWhFh
         EF7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j5gS+vQM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s3si1642208ybj.448.2018.02.05.15.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 15:54:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j5gS+vQM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53435 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eiqaV-0008JU-EZ
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 18:54:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eiqaK-0008Go-HP
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 18:54:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eiqaJ-0007yf-EM
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 18:54:04 -0500
Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e]:41781)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eiqaD-0007vZ-Ho; Mon, 05 Feb 2018 18:53:57 -0500
Received: by mail-qt0-x22e.google.com with SMTP id r13so130700qtm.8;
	Mon, 05 Feb 2018 15:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=z5qUWmhgGVfU6rBETmM/kcFzCAqH/KdXLmSU+axhGSQ=;
	b=j5gS+vQMV2jlzjh2CegeeixqqiG0726Qwxun58h2NgD9Mx92UJtSTpJvvhqpBRLZG4
	4I7VrI5+6HR6OhHjAQbDbMlNII+PZ5YC0UfkOfBxQxg5oaDFTbyPpmMbWz9JhKlkL1Cp
	4ILkpkvRgZlLhXlpyz/tuNzQtVdhRQUWxLGXfMqETu9urQR8NF4jqwgZOr2T6w/cNYHj
	+Hd9PDsGjJ8KYR68Cx+Tu6H+VV35A9p72XFnCcCttDVl3nZmxHXwgYFmXANB/J/acfjT
	OVOFByjIGxa0t7NW6gmmw9+gM78eqyXeauqsJ5cb7PcBoYuMMyR3cffj2lKQqwsQOS+k
	Cc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=z5qUWmhgGVfU6rBETmM/kcFzCAqH/KdXLmSU+axhGSQ=;
	b=nqqF1BI+3J+Pxq50LWIHTttjmOBoSfNeXYtzqrVVDd00syTE7kW4LEVfuI9bvXeVXP
	r8pQpyij4aoDisEzBx7mwr6pLdi/kFhlYb0h0ECwS0b7QyIn6F4ECtsDpmP+9kmJROVp
	w9ar3DAx0OZIO8o1GPTLr9SgstNLCxBlA9NxN9upkJO8z5ojLbDZ273uXxO1yvIFWPM6
	q4NyYyekMA/hzdYj2a8jo0OMZk9Fao2xFj/KGn5LZsb6yue5+X38WG5vyPo9fxrgcgsn
	cD4VIoktW0apC/8ADMeeXl1DbS8FvfD0tUXMajPqiy4SsWtB3wHGTY5A/5EQmvZrCUCt
	vdSg==
X-Gm-Message-State: APf1xPCoIlGEhUAxzR48lb8/e9ihWdOEmsVJvdIJGjbbbX2IQEc7LDz2
	AfT6OTwqPiHNtwgO8MVcwHI=
X-Received: by 10.237.37.168 with SMTP id x37mr874049qtc.78.1517874836750;
	Mon, 05 Feb 2018 15:53:56 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id y9sm6588577qti.7.2018.02.05.15.53.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 15:53:56 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180205105720.14620-1-peter.maydell@linaro.org>
	<20180205105720.14620-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b1112be1-c1bf-ee94-f786-84f248e223c5@amsat.org>
Date: Mon, 5 Feb 2018 20:53:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180205105720.14620-6-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="Y1hOvH8H8T7JIg63Sk7JtEYZy45gzejje"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22e
Subject: Re: [Qemu-arm] [PATCH 5/8] hw/intc/armv7m_nvic: Implement cache ID
 registers
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
X-TUID: UW7Obd06x2ZS

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Y1hOvH8H8T7JIg63Sk7JtEYZy45gzejje
Content-Type: multipart/mixed; boundary="jezOJrk69jWj0u0pzbOptRnlmmKN9wmMn";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org
Message-ID: <b1112be1-c1bf-ee94-f786-84f248e223c5@amsat.org>
Subject: Re: [Qemu-arm] [PATCH 5/8] hw/intc/armv7m_nvic: Implement cache ID
 registers
References: <20180205105720.14620-1-peter.maydell@linaro.org>
 <20180205105720.14620-6-peter.maydell@linaro.org>
In-Reply-To: <20180205105720.14620-6-peter.maydell@linaro.org>

--jezOJrk69jWj0u0pzbOptRnlmmKN9wmMn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On 02/05/2018 07:57 AM, Peter Maydell wrote:
> M profile cores have a similar setup for cache ID registers
> to A profile:
>  * Cache Level ID Register (CLIDR) is a fixed value
>  * Cache Type Register (CTR) is a fixed value
>  * Cache Size ID Registers (CCSIDR) are a bank of registers;
>    which one you see is selected by the Cache Size Selection
>    Register (CSSELR)
>=20
> The only difference is that they're in the NVIC memory mapped
> register space rather than being coprocessor registers.
> Implement the M profile view of them.
>=20
> Since neither Cortex-M3 nor Cortex-M4 implement caches,
> we don't need to update their init functions and can leave
> the ctr/clidr/ccsidr[] fields in their ARMCPU structs at zero.
> Newer cores (like the Cortex-M33) will want to be able to
> set these ID registers to non-zero values, though.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The CSSELR/CCSIDR parts are a bit under-motivated, because
> the Cortex-M33 doesn't implement caches either and so they
> are RAZ/WI for that as well as M3/M4, though I'd written all
> the code before I realized that. This will be helpful if
> we ever need a Cortex-M7 model, though (which does have
> a couple of CSSIDR array entries).

I wonder if it is easier/faster to add a check for the "Instruction not
Data" bit and the level value is not 7 (not permitted) or simple comments=
=2E

> ---
>  target/arm/cpu.h      |  9 +++++++++
>  hw/intc/armv7m_nvic.c | 13 +++++++++++++
>  target/arm/machine.c  | 36 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 58 insertions(+)
>=20
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index f21f68ec4a..99c7cb996f 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -453,6 +453,7 @@ typedef struct CPUARMState {
>          uint32_t faultmask[M_REG_NUM_BANKS];
>          uint32_t aircr; /* only holds r/w state if security extn imple=
mented */
>          uint32_t secure; /* Is CPU in Secure state? (not guest visible=
) */
> +        uint32_t csselr[M_REG_NUM_BANKS];
>      } v7m;
> =20
>      /* Information associated with an exception about to be taken:
> @@ -2443,6 +2444,14 @@ static inline int arm_debug_target_el(CPUARMStat=
e *env)
>      }
>  }
> =20
> +static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
> +{
> +    /* If all the CLIDR.Ctypem bits are 0 there are no caches, and
> +     * CSSELR is RAZ/WI.
> +     */
> +    return (cpu->clidr & 0x001fffff) !=3D 0;
> +}

Suggestion to be consistent with other bitfields:

/* V7M Cache Level ID (CLIDR) */
FIELD(V7M_CLIDR, CTYPE, 0, 7 * 3)

So we can use:

    return (cpu->clidr & R_V7M_CLIDR_CTYPE_MASK) !=3D 0;

> +
>  static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
>  {
>      if (arm_is_secure(env)) {
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index eb49fd77c7..cc83c9e553 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -1025,6 +1025,14 @@ static uint32_t nvic_readl(NVICState *s, uint32_=
t offset, MemTxAttrs attrs)
>          return cpu->id_isar4;
>      case 0xd74: /* ISAR5.  */
>          return cpu->id_isar5;
> +    case 0xd78: /* CLIDR */
> +        return cpu->clidr;
> +    case 0xd7c: /* CTR */
> +        return cpu->ctr;
> +    case 0xd80: /* CSSIDR */
> +        return cpu->ccsidr[cpu->env.v7m.csselr[attrs.secure] & 0xf];

/* V7M Cache Size Selection (CSSELR) */
FIELD(V7M_CSSELR, LEVEL, 1, 3)

> +    case 0xd84: /* CSSELR */
> +        return cpu->env.v7m.csselr[attrs.secure];
>      /* TODO: Implement debug registers.  */
>      case 0xd90: /* MPU_TYPE */
>          /* Unified MPU; if the MPU is not present this value is zero *=
/
> @@ -1385,6 +1393,11 @@ static void nvic_writel(NVICState *s, uint32_t o=
ffset, uint32_t value,
>          qemu_log_mask(LOG_UNIMP,
>                        "NVIC: Aux fault status registers unimplemented\=
n");
>          break;
> +    case 0xd84: /* CSSELR */
> +        if (!arm_v7m_csselr_razwi(cpu)) {
> +            cpu->env.v7m.csselr[attrs.secure] =3D value & 0xf;
> +        }
> +        break;
>      case 0xd90: /* MPU_TYPE */
>          return; /* RO */
>      case 0xd94: /* MPU_CTRL */
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index a85c2430d3..968ec30b4a 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -108,6 +108,41 @@ static const VMStateDescription vmstate_m_faultmas=
k_primask =3D {
>      }
>  };
> =20
> +/* CSSELR is in a subsection because we didn't implement it previously=
=2E
> + * Migration from an old implementation will leave it at zero, which
> + * is OK since the only CPUs in the old implementation make the
> + * register RAZ/WI.
> + * Since there was no version of QEMU which implemented the CSSELR for=

> + * just non-secure, we transfer both banks here rather than putting
> + * the secure banked version in the m-security subsection.
> + */
> +static bool csselr_vmstate_validate(void *opaque, int version_id)
> +{
> +    ARMCPU *cpu =3D opaque;
> +
> +    return cpu->env.v7m.csselr[M_REG_NS] < sizeof(cpu->ccsidr)
> +        && cpu->env.v7m.csselr[M_REG_S] < sizeof(cpu->ccsidr);
> +}
> +
> +static bool m_csselr_needed(void *opaque)
> +{
> +    ARMCPU *cpu =3D opaque;
> +
> +    return !arm_v7m_csselr_razwi(cpu);
> +}
> +
> +static const VMStateDescription vmstate_m_csselr =3D {
> +    .name =3D "cpu/m/csselr",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D m_csselr_needed,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(env.v7m.csselr, ARMCPU, M_REG_NUM_BANKS),=

> +        VMSTATE_VALIDATE("CSSELR is valid", csselr_vmstate_validate),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_m =3D {
>      .name =3D "cpu/m",
>      .version_id =3D 4,
> @@ -129,6 +164,7 @@ static const VMStateDescription vmstate_m =3D {
>      },
>      .subsections =3D (const VMStateDescription*[]) {
>          &vmstate_m_faultmask_primask,
> +        &vmstate_m_csselr,
>          NULL
>      }
>  };
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


--jezOJrk69jWj0u0pzbOptRnlmmKN9wmMn--

--Y1hOvH8H8T7JIg63Sk7JtEYZy45gzejje
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlp47o4ACgkQ4+MsLN6t
wN7gVA/+LgXWcBtHxzuOoRtl05kGPWkYiGLisZYm1OFDIkN0UPXG5QwpZIKhs6y9
+ri83UMexq/baWy0US+t5NySGjfTKmhGC5mh2VcitrRFCDv6yobwfqaconHVyEnb
40Mfq7dz9G+8+L4ZBeGOU/Q6MEW14M3/ojmY9ydXqDocRZnWJroKvqhSOCEJ1uWS
GRDLkioLKE+c0+r9M8gJsLWQTw8tXhIB1W5P0PQZ7azVymaH41B2s9oSZ0E4dpfP
jS+tSbtZMyF5xxRBjJUN/hetLnJqznoaWENvXx1mkS40MJ2LeUe9OY9fOE+NKQHY
hOXGSrDL9wZTAPjNkVLYJ1Lvz2YqNC72PNsjP99d90TFhEwXf46Gk3rwpMyHHeZh
75pLW1TWkzDmrkJD/LS3Jxepk2xhPviIjujuTRvcHnu/6rzyDeNTcXCpefFJGXe/
LdXWwjccgCXD0EK62h8DX/1Xr2LLkb4nQ8VScPu4pbBXrjE8O+JG0otiWa8OLQe4
kRrIZb7YVNFbOjlEgiQ8umQCCuq/BpU33YUQC+0ZabXKOi+ZmuhJxmoGrYrWxLP/
eSsmfSiBK3JAgbdcs9MomuXIKDAgE1M6lXrhT9Vk7nke9hE8H8kzXkKhqtD2n3t2
nOAvMfNPjRT9P/LTydJhsPRUbWzvgyMjk94wJOfi2tJP46tDImw=
=M7Vp
-----END PGP SIGNATURE-----

--Y1hOvH8H8T7JIg63Sk7JtEYZy45gzejje--

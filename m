Received: by 10.28.173.206 with SMTP id w197csp2182336wme;
        Sun, 14 Jan 2018 18:34:59 -0800 (PST)
X-Google-Smtp-Source: ACJfBouhFdaDd8HI7pbyYYWYG9/sEeDABXazEdMdK67Lf1P0aG+70dAtrj/fmBcoTaSWMyPXu2bB
X-Received: by 10.37.134.129 with SMTP id z1mr1269964ybk.451.1515983699746;
        Sun, 14 Jan 2018 18:34:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515983699; cv=none;
        d=google.com; s=arc-20160816;
        b=uKotT5L3W1ZScq06Ac57hfyHwY3UyzKr3SKlipjTFQTOis6EO4NUyBVRSzpul+5RAg
         iCxSuPpy9m5VM8UsyyIztxHfJptdrXACgOmgGIjdefoPA7Rz5bsT3T9dVoUrvN8vkoET
         e6N1wQxbLEiM36w8QIGywlEsDSEJR8j8finOWsf3sOAcEW+/OwiiC4kAw2m9vzuMd6ZK
         SIp/ZRz9qRa2hFcxcJVbeXl8kl+bJEUsQOna2d+mBUAD1YbzVTi1c9Mn/tGnYwhcKbrL
         K6w0eE2dRLRBA8vCHZLPloE02hD3dqTf5M2LQYCdrUswcKgLVHMMU96k/Q40H6nyfCjJ
         6+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=P1bYkPqyrbfgKQTdEtzhmcc7IsvgbmArJl8HSMDOT1U=;
        b=xli3ZyV7ZTBa8L9lxmTbhm68wiyS5F/jwB14zpdx89+9NRXE+6RrlFZEXJjow0fEc+
         0NgoJHQ3HPn4vRLPhwQPngkxyl0bbaxYLtTJBZhJ+z0yL/p9/Z7veoFbX2GkhH0tPLgR
         b4VVtQnOYJEPhKGD66pcw2Bb7VSB/6aHHtUSJGQPVzasHc4UqvrL/4bcsXtwvmwXIQLp
         0aN4PUnKdlsy7UjbJlwvqauDeiCacMcXMEV4+dJUDb6PpwXM0c+wGU3Kc7ffuJiS148F
         tNZefBw4/LL7iXj0xGoVjXNW85wjjkij5c8fwOQ3GtC8SU02qBBDFc3Za/iSGq3gPnzs
         oN7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z4q6PLVA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k8si5654087ywi.613.2018.01.14.18.34.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Jan 2018 18:34:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z4q6PLVA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56819 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eaubz-0003H1-5l
	for alex.bennee@linaro.org; Sun, 14 Jan 2018 21:34:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eaubr-0003F9-Eh
	for qemu-arm@nongnu.org; Sun, 14 Jan 2018 21:34:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eaubo-0001zo-B2
	for qemu-arm@nongnu.org; Sun, 14 Jan 2018 21:34:51 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:34949)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eaubo-0001yb-3z; Sun, 14 Jan 2018 21:34:48 -0500
Received: by mail-qt0-x243.google.com with SMTP id u10so12547545qtg.2;
	Sun, 14 Jan 2018 18:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=P1bYkPqyrbfgKQTdEtzhmcc7IsvgbmArJl8HSMDOT1U=;
	b=Z4q6PLVA1zTPPDZ6VlVrBwXPPnDbIRx1w6QXNHL0hZ8ExvxPMUG5FI0XuP/psyy75J
	CCb30DUAK1xbrGrWnG+E/BYmSjPQ6qNbrBzNyODD+4RqfE0DacCHP2nBCXCjytM+ZN3y
	ja3kQw+1FHgY9qFlR718TDVm7de3Muhenp5ss7tAYlVARDucBmWjcy7TiAo2X9Bc60aS
	FKfqeH2RWMg9rT3sWokyx/VNAY7xPHB9+ZvQ3JjBiuSKzFMF7b/HTumC7udf5rT1M6PG
	sj9t370ucIpPhp+meaDwuNTalSlicXJgVdNu7j+gW+xOwJ5o1+bOxeJQNeyNEK4pKiFH
	YVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=P1bYkPqyrbfgKQTdEtzhmcc7IsvgbmArJl8HSMDOT1U=;
	b=fUPldQRA1icbKGmee/kO9m1WglIlegn1RfCMoHknAvwj+/xgi3vn+XM5APfW4Yx/mB
	96pmgdL6b2dSGIKm1XRenSWE9FEmN+3MjZEfkQ8hwK0ouMMs66r5jbF4u00D7Mq8+ThW
	i5lgg3SRUedpRqO/dvyk1abwYTFjzx+sxBJeIC88rTHNAskMnZ8ZJnxyPJSWA2waqTHC
	4J6Zgfbm81EXBv7imVZREJnI/y0wJNNCGBkJOhkVTmaZW+sHXaGfLoK0qbhvGNpDGqHd
	+EIvUUgRucWnwE+ys+I6jqvg1kDRieuTdYXPI3enpVllwH0e+S5h91AutGRCD+fMCn/g
	4yBQ==
X-Gm-Message-State: AKwxytdkZV6JqT+BOt4FsAEM4sgzpOX2MRCu/M6g59FCdblvsCxhy9lD
	nDGhtZqod/bhaK1Z51jEz4I=
X-Received: by 10.200.40.195 with SMTP id j3mr50925513qtj.154.1515983687354;
	Sun, 14 Jan 2018 18:34:47 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	i31sm16976806qtb.34.2018.01.14.18.34.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Jan 2018 18:34:46 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1512742372-31517-1-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <f7aa6594-c3a3-fb42-9147-de8fcbddc848@amsat.org>
Date: Sun, 14 Jan 2018 23:34:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1512742372-31517-1-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="EBpf3iNK9ynF8R5wab3NgIceFix7oOYvv"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH] hw/intc/armv7m: Support byte and halfword
 accesses to CFSR
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
Cc: Andy Gross <andy.gross@linaro.org>, qemu-arm@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: valVtaGQaozP

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EBpf3iNK9ynF8R5wab3NgIceFix7oOYvv
Content-Type: multipart/mixed; boundary="cH5OK4ruv7xBhwPfFvSUfjUGk0vF6FESU";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Andy Gross <andy.gross@linaro.org>,
 patches@linaro.org
Message-ID: <f7aa6594-c3a3-fb42-9147-de8fcbddc848@amsat.org>
Subject: Re: [Qemu-arm] [PATCH] hw/intc/armv7m: Support byte and halfword
 accesses to CFSR
References: <1512742372-31517-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1512742372-31517-1-git-send-email-peter.maydell@linaro.org>

--cH5OK4ruv7xBhwPfFvSUfjUGk0vF6FESU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On 12/08/2017 11:12 AM, Peter Maydell wrote:
> The Configurable Fault Status Register for ARMv7M and v8M is
> supposed to be byte and halfword accessible, but we were only

"aligned halfword"

> implementing word accesses. Add support for the other access
> sizes, which are used by the Zephyr RTOS.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reported-by: Andy Gross <andy.gross@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 38 ++++++++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 16 deletions(-)
>=20
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 5d9c883..dc8e2f1 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -896,13 +896,6 @@ static uint32_t nvic_readl(NVICState *s, uint32_t =
offset, MemTxAttrs attrs)
>              val |=3D (1 << 8);
>          }
>          return val;
> -    case 0xd28: /* Configurable Fault Status.  */
> -        /* The BFSR bits [15:8] are shared between security states
> -         * and we store them in the NS copy
> -         */
> -        val =3D cpu->env.v7m.cfsr[attrs.secure];
> -        val |=3D cpu->env.v7m.cfsr[M_REG_NS] & R_V7M_CFSR_BFSR_MASK;
> -        return val;
>      case 0xd2c: /* Hard Fault Status.  */
>          return cpu->env.v7m.hfsr;
>      case 0xd30: /* Debug Fault Status.  */
> @@ -1280,15 +1273,6 @@ static void nvic_writel(NVICState *s, uint32_t o=
ffset, uint32_t value,
>          s->vectors[ARMV7M_EXCP_DEBUG].active =3D (value & (1 << 8)) !=3D=
 0;
>          nvic_irq_update(s);
>          break;
> -    case 0xd28: /* Configurable Fault Status.  */
> -        cpu->env.v7m.cfsr[attrs.secure] &=3D ~value; /* W1C */
> -        if (attrs.secure) {
> -            /* The BFSR bits [15:8] are shared between security states=

> -             * and we store them in the NS copy.
> -             */
> -            cpu->env.v7m.cfsr[M_REG_NS] &=3D ~(value & R_V7M_CFSR_BFSR=
_MASK);
> -        }
> -        break;
>      case 0xd2c: /* Hard Fault Status.  */
>          cpu->env.v7m.hfsr &=3D ~value; /* W1C */
>          break;
> @@ -1667,6 +1651,14 @@ static MemTxResult nvic_sysreg_read(void *opaque=
, hwaddr addr,
>              val =3D deposit32(val, i * 8, 8, get_prio(s, hdlidx, sbank=
));
>          }
>          break;
> +    case 0xd28 ... 0xd2b: /* Configurable Fault Status (CFSR) */
> +        /* The BFSR bits [15:8] are shared between security states
> +         * and we store them in the NS copy
> +         */
> +        val =3D s->cpu->env.v7m.cfsr[attrs.secure];
> +        val |=3D s->cpu->env.v7m.cfsr[M_REG_NS] & R_V7M_CFSR_BFSR_MASK=
;
> +        val =3D extract32(val, (offset - 0xd28) * 8, size * 8);
> +        break;

we have:

static const MemoryRegionOps nvic_sysreg_ops =3D {
    .read_with_attrs =3D nvic_sysreg_read,
    .write_with_attrs =3D nvic_sysreg_write,
    .endianness =3D DEVICE_NATIVE_ENDIAN,
};

with:
    /* If true, unaligned accesses are supported.  Otherwise unaligned
     * accesses throw machine checks.
     */
    bool unaligned;

So unaligned halfword should throw excp.

We could add an explicit ".unaligned =3D false,"

>      case 0xfe0 ... 0xfff: /* ID.  */
>          if (offset & 3) {
>              val =3D 0;
> @@ -1765,6 +1757,20 @@ static MemTxResult nvic_sysreg_write(void *opaqu=
e, hwaddr addr,
>          }
>          nvic_irq_update(s);
>          return MEMTX_OK;
> +    case 0xd28 ... 0xd2b: /* Configurable Fault Status (CFSR) */
> +        /* All bits are W1C, so construct 32 bit value with 0s in
> +         * the parts not written by the access size
> +         */

This comment is welcomed :)

> +        value <<=3D ((offset - 0xd28) * 8);
> +
> +        s->cpu->env.v7m.cfsr[attrs.secure] &=3D ~value;
> +        if (attrs.secure) {
> +            /* The BFSR bits [15:8] are shared between security states=

> +             * and we store them in the NS copy.
> +             */
> +            s->cpu->env.v7m.cfsr[M_REG_NS] &=3D ~(value & R_V7M_CFSR_B=
FSR_MASK);
> +        }
> +        return MEMTX_OK;
>      }
>      if (size =3D=3D 4) {
>          nvic_writel(s, offset, value, attrs);

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


--cH5OK4ruv7xBhwPfFvSUfjUGk0vF6FESU--

--EBpf3iNK9ynF8R5wab3NgIceFix7oOYvv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlpcE0AACgkQ4+MsLN6t
wN66+Q/+NJp31yn+AZFbouOhpDiAeWBU2Lh4L1vS/yMnbLA0lXlaIU8jfLkok/qP
oGaWAvehZQhNIoKAAfFwRUzNnNQaA5ktaxK6YfABWnjBfFvIesQKkKT5TSB8c0Lf
uR37EY05Eoq7cy2B3+7BqeXRKSIBTCTvzOf/LbPHLOYMLjzAdgPi+42VTvtHHsgE
Ls01tEvlDqoBan0Hu3uQFhZiE+NFJmJ65WqaeHaSSvyLGK+jts6pYjZg8p2r/3z6
bkfZI7ImUsjuy5MSlUYbinA8M0eMVNJvt/eQbosm+0X110d5caD61hphbIi/YF6o
dQj75R98Yjub1cAh6nbq5lc1ZiiVrc6JDaRXKxBdIugN9sI6j3bQ6pCmZVNaKj54
qMCv+JyEBbhwpUV3PBjCe5PK0KvsYMGkqssRP8zX90C1pY/B4N6a8CGLyK47ezNc
4JU6pLMaacxgUYly5OScvSkJSor5yYlvkhWqtRDLbhjRzlDyj+wtcX6Yam2Owi9S
tnIgAEYkDr1CvYNIFT7vaw/JtYxpwaO92rO9SMPw7t1fz/5nGe1CKeqFUdjn8/xU
n6LKoiaDGVk6Ovzbfc+5KrzaWyTyjWU9Rw5IF1EcPP4ucQWRB6tqYOJ0f6SIBnv9
xUWLrANfdVGX2QByTFfecPZqJaU/bOc8no8J/frVmHEOr5FShvc=
=rfbG
-----END PGP SIGNATURE-----

--EBpf3iNK9ynF8R5wab3NgIceFix7oOYvv--

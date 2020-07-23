Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1210558lfm;
        Wed, 22 Jul 2020 18:00:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHdo3DclRPdtLDvdvM2g7PyjzueQMhiFOxkkeUfOoHNQEANpoXqF8FL281jVC3NPziQuPU
X-Received: by 2002:a25:d94d:: with SMTP id q74mr3473565ybg.387.1595466057526;
        Wed, 22 Jul 2020 18:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595466057; cv=none;
        d=google.com; s=arc-20160816;
        b=HtJSAlufcO1z/VN/yoie569g7msU99lel89/rzXSIk/AZNCe+Ie4l2CIr+OyUVwgUJ
         H16Bh2txYuo3nF5UVUAtOeAu3Jh+SzG4kUqmPpDixI79j2Dbf1J9hYr1rd98pKpGDMmF
         r1G3IXUZ3BahOPnPlVoDbZkZJqK6mWye8pEhLHKj+hlFTFXqA910jKTny8pmnokMurWW
         uyXAOe3+D8iaGndIzSuh5XPsdivYG25WC80Ldur8VQsz8Ec0jWB4PcYJ2D5NzL1IqUP0
         e3TzGO/NllcnxMjMruQPVzTbRev/SsaJN0CBalkd5UefqKDkeUom6Vu1YZ4beQbBP60f
         8fJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=10yNT2+tqEDh3CSTqRO8LuqAjExvRL0SxdhJq8+2yeg=;
        b=tsSlGB+waF/j7HD+h6bxTGJ/rpGJMU3hnGRqPDaytzMi1fNEBGyeHg9oPL6P1j4AgZ
         MDE+uOZyemcsxiDW2DXqtXSZQagHRt4fX6b703IjNt/RuyCtscgGiWRALGw4viDtcs7V
         wZiazKL/ZT+Y11mkpVUuJEXNSuCvjfhJnu1CRpdU7PT+5MtHZFxx09ct15uU30l8anrL
         Q7LoXIXqmwMeJxrKe3VrgVqmGKFXzqPrTQgfRdMKi1ZeO39t4Qji6XNweNPkzEKvdnmP
         Y3sjU8/qQYaPu5cXedxfXzBhCu3hm0YqPqlrTs6fBGE0u0F8qyX7U7yqYzfoYzMjnp1M
         ++rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=YiKCuN8s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si1307341ybe.441.2020.07.22.18.00.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jul 2020 18:00:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=YiKCuN8s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jyPbU-0000hR-TI
	for alex.bennee@linaro.org; Wed, 22 Jul 2020 21:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jyPaw-0008Qd-CT; Wed, 22 Jul 2020 21:00:22 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:42731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jyPau-0007HN-7b; Wed, 22 Jul 2020 21:00:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BBvBk6Pvvz9sRf; Thu, 23 Jul 2020 11:00:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1595466014;
 bh=/dGgJclc9RTkcxSGPVohP34vadU4jFuxm92lYW2hUIQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YiKCuN8sQG8+6edKLVlPmEt/SDXTmVwADMu8O6hqsc28OWcqLoal8FMqBQlM3hy7o
 F8Rffg5pnr7hiLN+0aqILejml97YWzeXxk7D54QEDMxpU2ScegFerj9Ud5cBkZ91lA
 5ZkPWAGVfguk9B4rmKSo1Hngti/HORT1vQZ0YeLI=
Date: Thu, 23 Jul 2020 10:57:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH v2 6/9] sparc/sun4m: Use start-powered-off CPUState
 property
Message-ID: <20200723005736.GK5513@umbus.fritz.box>
References: <20200722035016.469075-1-bauerman@linux.ibm.com>
 <20200722035016.469075-7-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Cy+5HEalSgyXkpVS"
Content-Disposition: inline
In-Reply-To: <20200722035016.469075-7-bauerman@linux.ibm.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lK+fRYZoEzav


--Cy+5HEalSgyXkpVS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 12:50:13AM -0300, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in secondary_cpu_reset(), use the
> start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
>=20
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/sparc/sun4m.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> NB: I was only able to test that this patch builds. I wasn't able to
> run it.
>=20
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 9be930415f..766e79bb5e 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -233,7 +233,6 @@ static void secondary_cpu_reset(void *opaque)
>      CPUState *cs =3D CPU(cpu);
> =20
>      cpu_reset(cs);
> -    cs->halted =3D 1;
>  }
> =20
>  static void cpu_halt_signal(void *opaque, int irq, int level)
> @@ -833,6 +832,8 @@ static void cpu_devinit(const char *cpu_type, unsigne=
d int id,
>          qemu_register_reset(secondary_cpu_reset, cpu);
>          cs =3D CPU(cpu);
>          cs->halted =3D 1;
> +        object_property_set_bool(OBJECT(cs), "start-powered-off", true,
> +                                 &error_abort);
>      }
>      *cpu_irqs =3D qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
>      env->prom_addr =3D prom_addr;
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Cy+5HEalSgyXkpVS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8Y4IAACgkQbDjKyiDZ
s5L62g/8C3RVn5hXu4Ubj7n3wjsL2HJXNRFYXkuPXXQFEQSQjV0bcx94ckyrvV9S
NBYEallDQ8gm7MTI8OyBs7LTBpzyCdg5U4CBU+ybsM78kqrIghMOOnUvBBQip8tm
ihUBhLSNV08xvUf/S0yjn5pkvmvfDjhZRNGPo9S9u+xY86FqK0Ipm436jAetXq0j
VJccwALsdj5L3eaYrhKocyRal6VDRIoHAN0HcjClSg85y6Nx7ZJdl8uxNqKWxbgi
jRmooWASAUUcJJfr+FmE3r+qkl2ZjWu7Tr3/3cPRb7qoXAsrQYMi1Z20W5CvVhRt
kMcOtJRPW3k/3o5ChwUciZoHvU05bb5KOMGmrdaj4hs85HYrvhywO5m+nNH6DKb7
Hy5YGwzzZJPtyEUc67n5hGkQqbllyAXw8fTDm18cxYohW60zx8T/kY912R4NRYBf
bt0GzIYAHwSRE4niINxXdR70cYY4ufh3Cv9vmD29tQVk65EfuZQyPSuTTaCpqqe6
s8sfCoI4wj6vTuBpeSWEUSEwlyD1A4sFPhKHxehLaMi9SsCgZmpCJcAvjQ2/d2Xi
kJ199l7Ij18qXe3+lOu3ha4X4Bk8pwz0yW/DDoLuR8tqUvOdca/8CJGXEvk2FyAP
uapmP3ednQaXA3lDfMX/Bf0Zx75NKmocTrt9RXpKBA+bTXO3FNM=
=FTDb
-----END PGP SIGNATURE-----

--Cy+5HEalSgyXkpVS--

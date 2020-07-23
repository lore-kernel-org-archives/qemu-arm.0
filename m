Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1210232lfm;
        Wed, 22 Jul 2020 18:00:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzK1jTh86ZDzziGCSTz11czpDEMen2tIzjuOC+1za4ly/V3Du//bcOLrsDN3hRtk9h5+4R6
X-Received: by 2002:a25:d046:: with SMTP id h67mr3142522ybg.458.1595466033151;
        Wed, 22 Jul 2020 18:00:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595466033; cv=none;
        d=google.com; s=arc-20160816;
        b=naNqRAdJ5Yz3dvR+NnxsDwMqy6fUpL4suJyLk1eWOODAMgryVzGPa7t1Ti7BBeA0dq
         xVTRRM1m+fHIsLJnDmHDXmtLN9zQ3KFmtXNTPZ32VFoH2Tm++SItgdLCOH/TYpBEuYJu
         j+hxcgAd3BDqvmlzBadXnTa3DE4bfmHH0EL3bsY+Zi4PjXU/qVY64RxQWmASTMI0oIIo
         rzD8SFoperjShHeAZdOTnmq3BjtEiuedEKZc7CRJrW7vY8P3unHlLPUaVE3KcNnZK12o
         sDdMGW/RukeicN6sBcS5l6niYPF1w58LZWF95d+BDu+MWO96D1MlJ9vNqwxf4ZS/WutU
         JlZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=LFW9Wu9mfkQx2DXAxn4NnU+JRnfgAQ5uzNggoItdaNs=;
        b=deH5TKv2uRXWcyhERX6WfHCTqtAjQxe6tCSnju0RR/5avbA4IqtV8E3XbIlV2P2X2P
         uYR8/IKWSmmdwXrjelvWAbtwTQXmMmoMdvpiyvdwpKuOhV3OI3uyzccyWf8L2KSVli1K
         kIOekl/TUU9C9vy651sOQ40AHdvUXIrYMuf4whvw+m0jFGrXTRQjOxWXM5HO3Tiv9BJr
         RoH/f+n4wU2vHo9e1LRhv5UKSEVDpvz62cbwaSbGLR8xdtwOnfTg+3V6VxiGmQ9+dJgK
         wGhOlIhv6kmjuDZqIgLhNwF6cmEdZjatliyoYpLNO5WE2bcteowfSH+VDeXUut/MtdIM
         XeWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=a7g5Qskz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si1166416ybp.182.2020.07.22.18.00.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jul 2020 18:00:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=a7g5Qskz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jyPb6-0008QW-FB
	for alex.bennee@linaro.org; Wed, 22 Jul 2020 21:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jyPav-0008QH-CJ; Wed, 22 Jul 2020 21:00:21 -0400
Received: from ozlabs.org ([203.11.71.1]:33559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jyPat-0007HL-Cf; Wed, 22 Jul 2020 21:00:21 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BBvBl0JXBz9sSd; Thu, 23 Jul 2020 11:00:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1595466015;
 bh=j7QHYI65DAAfvhiaUe+cigZivwhlPGe/EcQR9c5T6QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a7g5QskzYnQhXpbR3330bYae+0cUsky834NMUaHnprn6o7fKmR934/ixahUuxfTXK
 DdzsmFHlsHHAnTbTCxIQiVQBF3uLT6n06d5RkkciOTMBActuH+sCvhgMpQ7bH0Io0c
 7jYN5NLVHt4Xce0JAL7pvjgachU6KYaVfCpXZhVg=
Date: Thu, 23 Jul 2020 10:57:07 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH v2 5/9] mips/cps: Use start-powered-off CPUState property
Message-ID: <20200723005707.GJ5513@umbus.fritz.box>
References: <20200722035016.469075-1-bauerman@linux.ibm.com>
 <20200722035016.469075-6-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zYo4Elh1vtcYNvbq"
Content-Disposition: inline
In-Reply-To: <20200722035016.469075-6-bauerman@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 20:52:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
X-TUID: L8eofeCUH3YC


--zYo4Elh1vtcYNvbq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 12:50:12AM -0300, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in main_cpu_reset(), use the
> start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
>=20
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/mips/cps.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> NB: I was only able to test that this patch builds. I wasn't able to
> run it.
>=20
> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
> index 615e1a1ad2..d5b6c78019 100644
> --- a/hw/mips/cps.c
> +++ b/hw/mips/cps.c
> @@ -52,9 +52,6 @@ static void main_cpu_reset(void *opaque)
>      CPUState *cs =3D CPU(cpu);
> =20
>      cpu_reset(cs);
> -
> -    /* All VPs are halted on reset. Leave powering up to CPC. */
> -    cs->halted =3D 1;
>  }
> =20
>  static bool cpu_mips_itu_supported(CPUMIPSState *env)
> @@ -89,6 +86,9 @@ static void mips_cps_realize(DeviceState *dev, Error **=
errp)
>              env->itc_tag =3D mips_itu_get_tag_region(&s->itu);
>              env->itu =3D &s->itu;
>          }
> +        /* All VPs are halted on reset. Leave powering up to CPC. */
> +        object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
> +                                 &error_abort);
>          qemu_register_reset(main_cpu_reset, cpu);
>      }
> =20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zYo4Elh1vtcYNvbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8Y4GMACgkQbDjKyiDZ
s5JyAA//YW6V9OgSuH8HwzLeg/iqfCLU0uckSWxXFKHEeKOZVALxgz+G+LC0+mQO
w8K15hVprkUqkHHeRM0tZbS2+iO+Zg4emNd+E8lRZ623lMJJmm6mBrV+0z5O1jK9
hjEMrIQkLj1XEO5ugqbdHKyN2iMZE+37sYYDaGbgQkwiVHvznicjjETfn5zihukF
LPWRkjKmq9+IozQFd1x0MQZCcaqM6EQKO7K5p9csv4MHWPe79OYdW3U8MhQxo1y2
oDwrid8l6l00Z+54L2lSBRi9aZuHviz/A6wvxOWLoQmLSZX0RiT1Cp786CArwyCI
jb4zIgnnfn+eCdM4LhUXY2xchum696P1J8lSJAJ/60ghMPpNF0q4+ogWBesIz9CG
W9UHaDpUOJjxIUJiQiqaKfxQWUX/5BmE+faeII5rgiCRK0s9rufHIZO+ids4jnjl
twyjfbAOPdb614CPV+Csoi5uv8eT/JOFodekvmypueWiMNOUXXltDmPd7gt3LMzf
qNYJITIV++NeyJ/hTxGaZLIvM1PtVwGfbNTPuKT9bGwH7ZsCkMANdnSKVrLrShn5
YpmW+EMmo/NVl1rwBT0oLgcwie0R9bIXD2gqNfQPOLPPqOX2CwjPlb68NEkZc/r1
U8e9xBkI0x7htd5ma5+cvsxI592oj59a6j35/w1Y5/UtZy0EEQY=
=HY4e
-----END PGP SIGNATURE-----

--zYo4Elh1vtcYNvbq--

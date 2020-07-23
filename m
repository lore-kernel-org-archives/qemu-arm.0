Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1212397lfm;
        Wed, 22 Jul 2020 18:03:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAqySFbo+Nk+Vi86sCqXxS4lxD3weLDRtf7Bead64ig15lSSud7zkuB8tKDubqKQPeOeq3
X-Received: by 2002:a25:1f55:: with SMTP id f82mr3264183ybf.103.1595466201665;
        Wed, 22 Jul 2020 18:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595466201; cv=none;
        d=google.com; s=arc-20160816;
        b=pLjxpRqbLyPRn1fgFadZAW8uAotaPbF7nR01sCOKMCsUd/Z8JfHoGpKh8OH594395P
         p2hmNRRm0myArRPoUBCah8Vljf/Pcm5uJHyqVZAYuGM9zDUkHm/Qn0dgmP/HC2satxcc
         Zbt906RGstT7UzRKXRN6SDz/HDZN30MzvBNLsq3Tn1aE5O1ZMe5LCaksGIz30WR9uxPV
         pKSE/HY4kyuAqaPIlEe9rfpTb+WXLOYCeK5hW7lDuJHJaC8pCgtnAT7N7182SxJnDOR2
         4EUixV7H/Y2+6T1dO6cTkBqdUIh0kwO+65aGBfo3B0D5HaYoK1F4SsIK8A5zsAhGHmns
         24vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=p/5sIy4+G48rX88YCtxoTlXfwpY33neb7nniHb9pOpA=;
        b=i5+3xud3uKRRA6suSNXWv7kI1obT3sefQ1uK03Xu456eZa9gvWd/1/9LMLxAmMaEPW
         yEUDWjcBdZwH/RfybKyyZMx3Am/jFnnhCnecTX+ZoHmOWUqoFhs5ZwMGVP3lVtjNReyL
         IrKSFt4ZeJdvc9g3S4pyzXbY94qIuHQCFdr9KYxcpk4a9J8BX44MyGS7fd9ikk9TyzZK
         Ww8+sQerEmrTF7RORdCMYCNQceEvgLPwCuMek2856RqIaWTJ1+ECB2fOXYJqo3/G9jdQ
         O4HmlOtEKkNc4L51CVocV8tn5HXik2RZmTU+9Rz49BdRFMlHUqjM5oJJUfq5GhZ15dIU
         XRMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=bBtJ7vdy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si1845171ybt.216.2020.07.22.18.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jul 2020 18:03:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=bBtJ7vdy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jyPdp-0004Ex-2j
	for alex.bennee@linaro.org; Wed, 22 Jul 2020 21:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jyPaw-0008RO-QM; Wed, 22 Jul 2020 21:00:22 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:36849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jyPau-0007HH-Hk; Wed, 22 Jul 2020 21:00:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BBvBk4qCWz9sRR; Thu, 23 Jul 2020 11:00:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1595466014;
 bh=Dj0Y0gkrxPHbTK/MI/TwCv7ZL7R9wEyOUsLsGzFq2Z4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bBtJ7vdyoRl3HDe/HBYdeIPU1tT0SpmAmthKh15FonsXjj03Yjd3C5+LH4Gep0c5j
 TWSD3GlK16FVF5aES+lEy3IZoS6smkDw9+K3C2Wf2nlkEpNzBMkk44hO3J9FIZ5tXi
 ZzE1/BuwmnEYWaS7MpZysIaHyUqzb/mt3Mu1hfyc=
Date: Thu, 23 Jul 2020 10:56:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH v2 4/9] ppc/e500: Use start-powered-off CPUState property
Message-ID: <20200723005630.GI5513@umbus.fritz.box>
References: <20200722035016.469075-1-bauerman@linux.ibm.com>
 <20200722035016.469075-5-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4BlIp4fARb6QCoOq"
Content-Disposition: inline
In-Reply-To: <20200722035016.469075-5-bauerman@linux.ibm.com>
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
X-TUID: gxMj5CRhvibM


--4BlIp4fARb6QCoOq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 12:50:11AM -0300, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
> the start-powered-off property which makes cpu_common_reset() initialize =
it
> to 1 in common code.
>=20
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/e500.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> NB: I was only able to test that this patch builds. I wasn't able to
> run it.
>=20
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index ab9884e315..dda71bc05d 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -704,9 +704,6 @@ static void ppce500_cpu_reset_sec(void *opaque)
> =20
>      cpu_reset(cs);
> =20
> -    /* Secondary CPU starts in halted state for now. Needs to change when
> -       implementing non-kernel boot. */
> -    cs->halted =3D 1;
>      cs->exception_index =3D EXCP_HLT;
>  }
> =20
> @@ -897,6 +894,13 @@ void ppce500_init(MachineState *machine)
>          } else {
>              /* Secondary CPUs */
>              qemu_register_reset(ppce500_cpu_reset_sec, cpu);
> +
> +            /*
> +             * Secondary CPU starts in halted state for now. Needs to ch=
ange
> +             * when implementing non-kernel boot.
> +             */
> +            object_property_set_bool(OBJECT(cs), "start-powered-off", tr=
ue,
> +                                     &error_abort);
>          }
>      }
> =20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4BlIp4fARb6QCoOq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8Y4D0ACgkQbDjKyiDZ
s5Lf5w/+PoQjOoiGcvCl8nMUJvCDIB2G8Ft0xGjbAxMJf3IYkQaLAWiczhujLem7
GYIXtu8WpgjGZj9u+tMEKkfch9L9OtLbmpvRXXxrcBovhXu8YQPoMcjePwbJijVd
3fxHWC6g+Dc5GUJD3ugqHQP/ntpLjr5+vZ43I6NwOtuL71INn5R5jdHhP36zrCYq
xQQnRQT3Sg+hoD/9kkffP1qCXm1siw64RwsELLbKCVYbLyI85ZUQJqS3nxiuXlDx
vp8gMX3NLjDevvz4wkPMOp9xq68CN1sosiQXSzenLNND2f1lx0iC0/RM8WNIvssA
DitHjO6UJMlqrwHg423ko1G+74VKy7r/3rC91scg0ldXKjceABIGz7RhHvaImLbH
ar5PG4uTgN6HxjVUK97dgjcFflvfn055jKAoOWOhfJZDtfiSp+JWf79JxQzf1Wt3
iQVs6NGBxkANwhMVu7ztzJBA3NzoCvpa2fJ0xyoBW49BvNFQqNCGZ9CXeEsD5sny
r8CQGOhSUYuGs8bmVkQmGEyqRcbDwUPXotF2tUv1iAGZ7NENJsiR+cWaPVX3qxq7
Iu4hPpIXeMSxvnjIC393yTtzRkDA3wI3d0gG6X2iXFU1qAS3IfAWz+cRAw2ZPyI6
1/PTAvo9RRKO6T4CPJX2ZBg6hI9DlSXWUjsmGulppBQbTDvxK8g=
=J82A
-----END PGP SIGNATURE-----

--4BlIp4fARb6QCoOq--

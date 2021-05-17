Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp857688lfm;
        Sun, 16 May 2021 20:15:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyvxBbr2fVWMhgVQmS+8LcWy5RvugyUxzYLYnDr7UO3xXlnZfsltYGELVfYCAJg5+1JdCV
X-Received: by 2002:a37:64f:: with SMTP id 76mr12402707qkg.444.1621221335516;
        Sun, 16 May 2021 20:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621221335; cv=none;
        d=google.com; s=arc-20160816;
        b=RXXwfQ8YyrnVVE+2w/3QyFUtCbcXAtc4VgEqmrqIA/iJcgZ3Nmethgqa1x6BjwpZzv
         4zH3uvjM0ae1ZllZxpO5258QSc3+pnF9P13eDutkc+XlcfRnzyiGT9r9vq1jQHPQNExa
         ay8HqaY07hGeZn2lokGImx70A5yzqn1B9Q8r6vhq9sejh1KdmS0CcUUD1HY4AqUobpZO
         kxwnRoGAOT3QGeRLjVotAMmRseJUHHhQrj/IinA9aB6uTBFOkyxweaExn1i/JzRS9taH
         1E5aM9ps0b20sXc5E4XCth8gHycd0jZVR5jxZ8pBSLvKWuBsiPmTwfi3qy/L4O829THV
         ontQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=yk3YPjZ0EIDERGbake+N4siYzUhVAnmlykfBpX6qE68=;
        b=tOxVCVW5SciDaxjVK+Jomv4q26vzv8BHHMrzkLCUdvJ3x1/UEQGZ6CYs4Ur9qNQmTf
         VYWrXnQs+LbFQWCbgIcReWxt9DvoS40ZJ5QHq4PT/k5I/Rw1KGCrArz9GJhi4J8RhcB2
         XFU7YwUbQnU80ENhRak6F8Q9KbA1Km0TRr/ySQp2zWpeiQ3DEEV1Svjkvdpm4okRN5q/
         d9zzxg6Fi39fzeE1x5Bs1cTbZoIF2gS0GPcWihWfmDbvaimNny2eqsXXigwClxwfw/Y1
         /CYU5rSMq4Br8fQP2t+77VVOj0jboOkcewBcu6IE22mIqAXi6uNgOp6W+75Qh0HU5FI4
         zWKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=WM8ByMnd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw12si11462242qvb.4.2021.05.16.20.15.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 20:15:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=WM8ByMnd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liTjC-000219-Oz
	for alex.bennee@linaro.org; Sun, 16 May 2021 23:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liTim-00020P-3v; Sun, 16 May 2021 23:15:08 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:33181 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liTik-0007KR-9L; Sun, 16 May 2021 23:15:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fk44k4nlyz9sSs; Mon, 17 May 2021 13:15:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621221302;
 bh=6Be4UtpxnUpGwaqht9fr6Hc2Gxl5C07p+4BS4gG5YSs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WM8ByMndF/6iBOlgFmSTPtmLC1jTSae2IzlxpXiPWBDYXUttJN4e87E2kzTOS9y33
 cJtO0NEIMygrYCv7I/ZWDXzEoVQEcSWuK4f0Dr2DAM0KCjmo3zPl96DJO02rPbocvX
 cWCqRN0TExppcCocAwEwEErKAmGuYo//OT6jowBo=
Date: Mon, 17 May 2021 13:13:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 09/12] hw/pci-host/Kconfig: Add missing dependency
 MV64361 -> I8259
Message-ID: <YKHfbd2kFygnWVFw@yekko>
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-10-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NmXgcd/mPMezN3dT"
Content-Disposition: inline
In-Reply-To: <20210515173716.358295-10-philmd@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DUKry6Bh2re9


--NmXgcd/mPMezN3dT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 15, 2021 at 07:37:13PM +0200, Philippe Mathieu-Daud=E9 wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Looking at the MV64340 model source, there is a dependency on the
> 8259 interrupt controller:
>=20
>   523     case MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG:
>   524         /* FIXME: Should this be sent via the PCI bus somehow? */
>   525         if (s->gpp_int_level && (s->gpp_value & BIT(31))) {
>   526             ret =3D pic_read_irq(isa_pic);
>   527         }
>   528         break;
>=20
> Add it to Kconfig to avoid the following build failure:
>=20
>   /usr/bin/ld: libcommon.fa.p/hw_pci-host_mv64361.c.o: in function `mv643=
61_read':
>   hw/pci-host/mv64361.c:526: undefined reference to `isa_pic'
>   /usr/bin/ld: hw/pci-host/mv64361.c:526: undefined reference to `pic_rea=
d_irq'
>=20
> Fixes: dcdf98a9015 ("hw/pci-host: Add emulation of Marvell MV64361 PPC sy=
stem controller")
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/pci-host/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
> index 79c20bf28bb..9dc0d761815 100644
> --- a/hw/pci-host/Kconfig
> +++ b/hw/pci-host/Kconfig
> @@ -76,3 +76,4 @@ config SH_PCI
>  config MV64361
>      bool
>      select PCI
> +    select I8259

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NmXgcd/mPMezN3dT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCh320ACgkQbDjKyiDZ
s5J7KQ/+NUiTYotpEXdbSdfv80Ss/pH28xIwlj59IowANukK341LDV2UdxxhvkGO
RG0ZoR8pqS8CqYIwpjYhuuql/RhdFoA/UAoWqm4bW3qW314npte3mNsnhY6wSa5f
AzcnynAkKrv3bO0CFn/b/g09oxl6PACj32lyfIeT4wt4YZ6Lu3Y0aQEvNF+8F1A5
lM+5cR92d/nEjPRvS82+XFRZsLiIzfRMXZsw8eUs5+2qPgEl756Wizm/RKvfEXiI
zys/6AhgZUe3rB/YnwtfDlXf9QivYQ/SgHfteY2XIPBs7PakEPfPkqJx9Est56+g
ljIofx2sNSE48ijR5Kv+Mok9XNv7hTCma5OwCKZ/W8XoyB1OoBVXjXMSLEXozWDb
GEHEraas24Sh0SnpkAF0qTH8jUAAkK99rYJvSAnW1T8m8+TFFPYYl96XKWZfzFLk
H9XzvSXtVcdeJ2xUVHivTPTFHpn1UbnvlV154ROzRBfIkh3tJc9OBx/FO9uY27kh
TqxojsNtbK9axxeamQ2mQeYcQ6x3T4NTi1eDWWsFtnKYWWx1d8YerCVhFUHKBwaA
CaNF1UUck8DUZN0PX0ZjIQpVw7vYUM4G5FR2jUxQe2mTDdwEn00WnXEQ1s0/thUR
ZI9XzsNEQCehSHv/JDT7aRq8zo1JgkJnYHFeBOW1P5KU+MevjIs=
=X729
-----END PGP SIGNATURE-----

--NmXgcd/mPMezN3dT--

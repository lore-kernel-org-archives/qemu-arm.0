Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp109194lfc;
        Tue, 1 Sep 2020 18:20:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytNwsVVdIjBN6p32axsx7Ulvp9cLW4VVYmfh56PYHbm3VmYJcdJ2RcMlycaBoyPMyF0ojq
X-Received: by 2002:a25:8b89:: with SMTP id j9mr7354598ybl.457.1599009622535;
        Tue, 01 Sep 2020 18:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599009622; cv=none;
        d=google.com; s=arc-20160816;
        b=QtijAmpF7DgUzahfKIUpHXfRUt2s/g9zJqWPrKv3XQMDcUl6ZORIZMIB0+UUjbcxff
         u4bUUcS0ruJb3BSXRg1Hg6je2lTETanqdS+GZyAWhLvGQ1xyp3NmX3Lkl13+GXtnsmJz
         Z9Ld1PQgV37K1a3ENIOY+mHEcwvEuwJJzRDRfuAKPtaFe0SkXgxagEsaMbbEFq1RHry+
         lXqL1xEs0ueLQmJgYsvxjfXosu+PY5YdWu5KxT9RybvA0JHo3mx6Zd3c0FK6/nJzhSgx
         JhlguG0aZNU+cIwKUyd1xxaoMWbNQXMikDfTFDXFKuV87DDGHWc2SBRTdkHix8ZWzfAv
         9KCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=t9fzNhoudZcvS5xaO/nVHi0O9+vXnAifByNIpePJ+lk=;
        b=VIM0I3RtaSiLCvVMj1Z3UnDIA9kltoUr59NO7mURWCg0v83eV1DjHxBCMgiUfzGjAh
         2ou0aNyJLPaB5ZZkG9ZKJgDHA1sN9hgM0hyVgHeFdPEKKiZfCZKssjN9CAcTDpA3C33X
         qVjGGJNGTerhhFa3wdQgA/MLHWMdvdKvWoKxSefmg8/m87qucfNH7IkqVvd3MKMf2RAF
         9vsxsNGU0mlPInrYxeGKxUDaQrNCNoDt/ClNcBl0XVGTaAfcrdXZR2A+88yXhruYZU5j
         tG+HdvfYvHcQ/K7Mf9JuBwrgNX/ZL7l8MYCpswaX3D1YcJjcpd+EUMmd9l7fqoxJpfRd
         oyOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=YzUo+KFQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o80si2650629ybc.69.2020.09.01.18.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 18:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=YzUo+KFQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDHRl-0000K2-U0
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 21:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kDHRb-0000Ic-QC; Tue, 01 Sep 2020 21:20:11 -0400
Received: from ozlabs.org ([203.11.71.1]:45701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kDHRZ-00033y-9g; Tue, 01 Sep 2020 21:20:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Bh5hg4WR6z9sVB; Wed,  2 Sep 2020 11:20:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599009603;
 bh=2cYAGQ2lNa6gMCGD9qDWp1XaH9iLwnixTvAlsiyhYhc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YzUo+KFQJzudPzGE6ztsrWURVDJYCf62L8nOfMIOPWpJl59y2JrRaR8Cs8xwrodHx
 D1iEGe10M0KNFKvaKsNUxrW9PeDb0AbTnwhW0aULG6KD3ye4dR5JMuD58qv15MZ7YH
 v2kaVRc5VITOqTqlMID2bs5oTa/BhfmhF7OdB150=
Date: Wed, 2 Sep 2020 11:17:08 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/5] hw/ppc/ppc4xx_pci: Replace pointless warning by
 assert()
Message-ID: <20200902011708.GE1897@yekko.fritz.box>
References: <20200901104043.91383-1-f4bug@amsat.org>
 <20200901104043.91383-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Q8BnQc91gJZX4vDc"
Content-Disposition: inline
In-Reply-To: <20200901104043.91383-5-f4bug@amsat.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 21:20:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-trivial@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhc@lemote.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z/QqudgWQJFU


--Q8BnQc91gJZX4vDc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2020 at 12:40:42PM +0200, Philippe Mathieu-Daud=E9 wrote:
> We call pci_register_root_bus() to register 4 IRQs with the
> ppc4xx_pci_set_irq() handler. As it can only be called with
> values in the [0-4[ range, replace the pointless warning by
> an assert().
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/ppc4xx_pci.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
> index cd3f192a138..503ef46b39a 100644
> --- a/hw/ppc/ppc4xx_pci.c
> +++ b/hw/ppc/ppc4xx_pci.c
> @@ -256,10 +256,7 @@ static void ppc4xx_pci_set_irq(void *opaque, int irq=
_num, int level)
>      qemu_irq *pci_irqs =3D opaque;
> =20
>      trace_ppc4xx_pci_set_irq(irq_num);
> -    if (irq_num < 0) {
> -        fprintf(stderr, "%s: PCI irq %d\n", __func__, irq_num);
> -        return;
> -    }
> +    assert(irq_num >=3D 0);
>      qemu_set_irq(pci_irqs[irq_num], level);
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Q8BnQc91gJZX4vDc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9O8pQACgkQbDjKyiDZ
s5KJww/8DJKc+Z8Cyw/JmqNHIWsPxtWYOpEure+y3N/0w8qmxlWWupDbGGgynPqe
Ry2eZR7tEMap4X7qGOUGxvv4MvIVlqqOIrgWXnWgXWK+C2KR9qJm/rXuH0U4wuqr
L9h2kKAN1ppF1UBAVjZSf9BFA7XiLnWwJqDZC22ad4jJkztWnwVifoQa1E1J6Uy0
4WfG3yRfk5ESsN/HBn+mi2UdV7iv3bm8aQUA7mFMPT1r/V7u816z0i/u/mPPRRBL
WSUPOYiucE+kSAxL2QNHNFgQ8ZxqE9QBhiF+qxu8ZVwwbhYjI0AoC5jGkhVcSAU0
XCa2AkpPC9YM1Z6LyEsXbE8BorUZGZ321ZaR3DQFFhZlHITzzyUjauGE6dTbk65l
/J3+yg2GNVMQmjg+8ANmPd/vQtcgsCl27qZjVRudlJXxGJu9zR0nAMMo2XAWlMUq
shAxQge4LFK/zd4YoM9l9RJl47tpkAp+ZP8BloVyKGGqVeIOU6zN4zdkOQ4b2wLJ
txvdfts+Alx5k1myRawpJRkE8ypuy9cVTk8ADdLxR6Cq/CHRq0teSKoD31+q1y2S
ryVDy3lgUeaSyQqHV6MXVvVjM5F3aG3sa/nWko1QHtlNC0c0u/S4Buz3gnKDQ921
+eNNmFTt5tGtx7G3tq3OVBgZLv9Pjn6op3DGnXwp3JTnCczaDT0=
=A0Tt
-----END PGP SIGNATURE-----

--Q8BnQc91gJZX4vDc--

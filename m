Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp109897lfc;
        Tue, 1 Sep 2020 18:21:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK6KC8m5XtoJ29mwfU2O8VeKWG3tTtzMk5VLm2S6aRaZMyneds68bnG6MmWahBxfeM+Y6w
X-Received: by 2002:a25:7007:: with SMTP id l7mr6892665ybc.85.1599009703143;
        Tue, 01 Sep 2020 18:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599009703; cv=none;
        d=google.com; s=arc-20160816;
        b=D+DFZ4iZpDlrIb2FaRy9h0ymtBJQzZLj1ENTflhDThi/2EdOrHT7/4rsgEF5QCsUfN
         0EwaXgxYy+x6grO45jF34PR+vR+w/2Hapgm/PPa5Q3P6IgbS3O3HL5soK57EqDioN0ks
         EXjYDDB7Na4oxKy/7MuXUbbdMF0R4FCfbSG4iUuepZgCanwdOhKcQcyuq2+RzjvgdxLO
         3I8GO3lBVvHUOWtCAWoyeW/re6tf/l6dTWj8BmMyfGS/AFxN1B2E/VzHwlsy5eNQF74l
         T4kcqRr+xODYGR94Qhqw+0ieiX23IbEVtw4M+l4L2L3OBKFqherik2jdCrdwjmyH8UNP
         5DvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=VtarrqTa7BAf//Y+BbNtBnmiRyHKVhIhez1yfb8H6L4=;
        b=GbpYDY4rF76ILgei57qPZhyoREG8JD+CPFElL0LMUGx6IUbHVVyUxcGJIivXrFuclu
         mwT3K1crZvh2JVexv6hrq8Yd8jMIKq8n0JdUIuB2vSjgE7y+lyh+qd10tzkCSDt4K0cU
         nB8A28/otiKButS+pcd/2ttR9AK4rLe7V+PjPTfRT4KiinnNcnGGmdjwXILi/z7ptDa0
         01a1dB97sUZnyngVfiFUTfvQFinXEWEY4Qk9DJkbG3KyIr+sT3ncT3uqJop9qRPtLGp8
         ZIizpiNtgfrStfVncehve0QIfTASmThyflFnWduY/tKJbJc6FilijalCSP2irg+U/wP+
         jOww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=ZAgoIYin;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6si2761190ybk.277.2020.09.01.18.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 18:21:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=ZAgoIYin;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDHT4-0001ff-I8
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 21:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kDHRb-0000Id-Sj; Tue, 01 Sep 2020 21:20:11 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:49455 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kDHRZ-00033x-Bd; Tue, 01 Sep 2020 21:20:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Bh5hg40RFz9sVC; Wed,  2 Sep 2020 11:20:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599009603;
 bh=/0Fr68ZLatqgPD2Ci5FuiRZsFR3bvwm+hPOl1XlWBAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZAgoIYin2FAgD8kDjGTHbFHdDuMhJgdVBFQ+bzAn51/ITDYmtYGfIsc5pULCHDBZd
 WdU8cfGVz/Gjy3tGzNAyOY9jIUYJamfBnBFCtKOYzUROO/J7yV3yFGF/MPKt7xlV9k
 za6bpwg0LuuwzBMWQEnerH+RfCT8x7nm/wDs14ag=
Date: Wed, 2 Sep 2020 11:16:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/5] hw/ppc/ppc4xx_pci: Use ARRAY_SIZE() instead of magic
 value
Message-ID: <20200902011646.GD1897@yekko.fritz.box>
References: <20200901104043.91383-1-f4bug@amsat.org>
 <20200901104043.91383-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Content-Disposition: inline
In-Reply-To: <20200901104043.91383-4-f4bug@amsat.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-trivial@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WaI4EcaAppTO


--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2020 at 12:40:41PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Replace the magic '4' by ARRAY_SIZE(s->irq) which is more explicit.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/ppc4xx_pci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
> index 3ea47df71fe..cd3f192a138 100644
> --- a/hw/ppc/ppc4xx_pci.c
> +++ b/hw/ppc/ppc4xx_pci.c
> @@ -320,7 +320,8 @@ static void ppc4xx_pcihost_realize(DeviceState *dev, =
Error **errp)
> =20
>      b =3D pci_register_root_bus(dev, NULL, ppc4xx_pci_set_irq,
>                                ppc4xx_pci_map_irq, s->irq, get_system_mem=
ory(),
> -                              get_system_io(), 0, 4, TYPE_PCI_BUS);
> +                              get_system_io(), 0, ARRAY_SIZE(s->irq),
> +                              TYPE_PCI_BUS);
>      h->bus =3D b;
> =20
>      pci_create_simple(b, 0, "ppc4xx-host-bridge");

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9O8nwACgkQbDjKyiDZ
s5ISdw/+Ni8dI57O4f+4QVXKXRlk4CHa6MGCPttZD3sTvlp/gmvUUUu+cD4exKck
gQWqpH3+mYZxILRI8bk0Ep6D2lGGgwvbLIQjN6WbDbX8arLgQ/BZqgQtDutD9Ugb
+CUIaQxP9ewl15HIz7jM00dkwESUpdeigbbAp2wp8WUFLzASjvyooiI5OTfrYL3I
ZpS14gpYSI4A2ULLLKgSTA5hzEmdLULA1EXhKeaqTgrn2jBSJxUyB2xGh4fhSOeW
uG4whEF61bjjFzpHA9daeT2cZfHnLF5KHpnySnj5cB5nqGOkg050DfmQ2rRvkRr+
rOWJAbNZ61G2+Rfch1T/AmcgwiCmaHtF4+Y2qIN3NOeNymoPOInjJnXxUz+KDdRb
VeSc5ZSBIfMgTCBcXYdOi29fIt6wrqB1eeaB5MLC74SmihDMDNRinvQfH1Ii7Mxm
JgXU/QfBBwnzbxehyV3OzzxrLKMa2013cTGTQ+X0qmkxoNwsNG8txmurMzcGHCBc
zldTFFC/08F+IjzVrGj+p/b3CtCB+JAGCT7wfFLRMkzyupDgDYOMd0+A1PrvLR83
d8E1g7HfsyAGDbEloYMGtfABpK2O7DSAFlSqF1jH5FH3fdf/hxRjDe+2PAtLv/6H
/oVtSUvYsygKNo+3JdZzYoGGrzT+UyoL68oBhr4m5z0krn/VC6U=
=ITJa
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--

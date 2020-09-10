Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1088338lfq;
        Thu, 10 Sep 2020 00:52:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUvJ3UvygdbJZW6cOZ+Dzh45dtvcLZ6E4DY/MU1pt9dH5iZvOTPBnFYXY5oDhKEhLDPbSC
X-Received: by 2002:a25:9b81:: with SMTP id v1mr11467305ybo.129.1599724376638;
        Thu, 10 Sep 2020 00:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599724376; cv=none;
        d=google.com; s=arc-20160816;
        b=ixNRUrS1mNDdHC8Q/z+GUndrECpJohw1DS7I1mwjL3An06B4+4+7mCVHL272xvk6vL
         kCoGd0x9IZa9T6KtbG4S0OiDTjnbfo47zNPVEutZ3CuFwkEJzykL8YmHHH7lt6aM/5VV
         zF0jPbEjvwe3uxVRFfDbLqklqIMYnwr5c9RJBA8Z/E4Q9ybPiFirvb5+eqvN0FZju8tG
         fa67XvLNea5Pd+Pj4XmSh5L20WH/UHlGK1ygOyjUxZ453UtXJSZnZM9gkvCN3XPy6xnb
         mc9lwMc4ognGtA8IrdfM/HcX8Lj5NPLH1N1oHODaiZ56l08SKEEzWeBQil6MGXL+T+kq
         ruqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=szJJkQJnPjnw9LXidI14NLt5ztm5mzafudj2lqwMBaI=;
        b=H4uh+6TGd4LCK+n3fvLQS7l7wCpSIWQaIzGgk1yD5Mt1dockUTfVRH+YYNXb95l9nT
         wBB8ycCqUhyH6EZ1bcLEjM6ty6Nt5NipobQBA3a09TGcaA2WXKQAf9dhJun5qnTi0k40
         jIgJ/2yveshVkemsXE5bIbK0BSufzt+DPQqYTsS9RXapvOOdES8KNYlmv8tUP6H0EgKw
         9c+rvAnQsQSZ/QlqTQYSkBKGlr+2f/v/Dt8jKbspu0gB4PgrMrtkop9+cGe3z7qU+kSE
         X6Pv/p6NqYG4jCuBNGJ+rYFEelIPAS4drJj0ERNnjPySdb8O2Pf2yZbLYMPPRLrypANP
         QpRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Ti+QSll+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j124si5155089ybb.162.2020.09.10.00.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 00:52:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Ti+QSll+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGHO4-0005aJ-2K
	for alex.bennee@linaro.org; Thu, 10 Sep 2020 03:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kGHNw-0005a4-GM; Thu, 10 Sep 2020 03:52:48 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:60309 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kGHNt-0008II-9o; Thu, 10 Sep 2020 03:52:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BnB1p3Vf4z9sTX; Thu, 10 Sep 2020 17:52:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599724350;
 bh=h/hA8wwXLn+3KtEgBuXIuDWls9QWPOpxG3nzh0aZbPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ti+QSll+aB63fml18Kq9IvJMCZH8eJuOP/sUmLyQrcmBpXPhsfI9BdTS1D3E/kxLY
 IprGF5m2R/1j26WO+6SOuvwulXASIb1p9KIZ+i9yHV24Ic6IEx+O+pL4a52C+V8G5D
 a2W6aiW7wkJ/XBWnpqsGSDMEK0H0TiQB47CyWTp0=
Date: Thu, 10 Sep 2020 17:43:14 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 2/2] hw/ppc/ppc4xx_pci: Replace magic value by the
 PCI_NUM_PINS definition
Message-ID: <20200910074314.GB66834@yekko.fritz.box>
References: <20200910072325.439344-1-f4bug@amsat.org>
 <20200910072325.439344-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline
In-Reply-To: <20200910072325.439344-3-f4bug@amsat.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DXhZOJkL4fZn


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 09:23:25AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Replace the magic '4' value by the PCI_NUM_PINS definition.
>=20
> Suggested-by: C=E9dric Le Goater <clg@kaod.org>
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/ppc4xx_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
> index 503ef46b39a..930be78361d 100644
> --- a/hw/ppc/ppc4xx_pci.c
> +++ b/hw/ppc/ppc4xx_pci.c
> @@ -54,7 +54,7 @@ struct PPC4xxPCIState {
> =20
>      struct PCIMasterMap pmm[PPC4xx_PCI_NR_PMMS];
>      struct PCITargetMap ptm[PPC4xx_PCI_NR_PTMS];
> -    qemu_irq irq[4];
> +    qemu_irq irq[PCI_NUM_PINS];
> =20
>      MemoryRegion container;
>      MemoryRegion iomem;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9Z2RIACgkQbDjKyiDZ
s5LxFw//bMZAfGy1cHOROzZOgcQM1rWlQPbgH5n5PO+gFe9qA0VHbFIhC4HqUteH
OKcuKbgxBs7Fd0+mhMzcw7oxt/Osge+ihqE/vcc3xawcSedys2Nd/LrhyFITU8m5
G9abirP3i0SN7nXVMWMbEDLZ1noy4XBuIu8zFVJzC/MLUPAHe76IRsgnh8pq0ze1
dNiOpz9I25V5r1nIto07mUGgVsdiLz59Ppr48KSnhzIQ06pbpLNzoBCHmiMjqckr
knFQXsNht9kVA24IH2ve6RFz1DGnC6jXTba25AUgDAm4GCLFDbtZdT7eABFAqFqw
UV39zNYthe8CEPSRvKbnimVuuzBvGITT1XeJS4abyVcdbO4P4QtOJjzwd6BQiXRV
3c/lhISdoi1jqDjlv3JChibsjU+q886KMojtnUBo1HO8JwkAUfqqSyA9L6wg/17b
eu6Vu1XMJ+2O3OCxtQrUDwjHKPw59kueZ8SJJS9sxrMVA2eouFqKrzSX+mwrv9k7
rm/OLLINXZQtc7f1Y1H1iETttqXnkiafpBEh7kkVx/+F7Im3JeYTzP/T0Br5MhiF
qyKSuEIJmwks96VOT8L9kUByBxih9STXQKamWylXL+glphNeOrnwAIzphG3RWG/+
I+lh5UnSro8BKPXdOror7uSq+9szSRwL6d60FrD6tma3deG0aSY=
=u39l
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--

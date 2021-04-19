Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp728308lfb;
        Sun, 18 Apr 2021 18:00:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLn3ckcUDIr6LGzObMrivwF/YfN23SuOYHPmFdhzpvkPMC2JRWGxfqJ7UUusnoKfLM2VqC
X-Received: by 2002:a0c:bf47:: with SMTP id b7mr19362995qvj.38.1618794010200;
        Sun, 18 Apr 2021 18:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618794010; cv=none;
        d=google.com; s=arc-20160816;
        b=WPSA5ccSN2zUmhRbZ3/wIGDdgLARAw8pelN2kLtoxGC5HSl59W9wVP83eQ3O021DAd
         Kk1UgafdC0bpl5M5VmVjrs3QKw/oLXP5MvLukb7gqmBT2Aw3GpmEX9zMOZMTasern0hJ
         nY2OkJ4DPxTMVuvO4NsoUTNWROckB9T1WtPXJwPwZnzLjv4I+o5tRFFQDlqF8oUXafm1
         6rJbaMLI/E7JNEjDgJkXx5CJhcNpkTfAkB3sSmoUYVssUuuH2wL/Gvk5fnPR7qrFdv1p
         ZUWJMFZVBm0AZwmxRO4Uilpl4z3cvrq9V90PMQyni3JQKSF3GeDg5mn7xKwYVKPvkKb2
         xxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=CYMUf+gkKQm10v+EOoBaylMdt3uwxx6QN1ZvUarZnYw=;
        b=SEyPZFsH6XJzOOG3juzk223IprJP1ZrHtgndmztmuMVD+9vl0zoYna8U6/BEhLIUta
         0ElgSFLyb5YNchpRKZAChZGAbnSUVkfReWj58tjQjUrQ4RXxp4ydssI2zQQ/81NeWmRM
         DIwe0LXRI4r+yF8OwxJWQbrn48YlR2f3ZtYLiiJ4e3Uj2rpJ8EA9Qb8NlVeYQE5E9u6q
         s1FPadBpJ3efp3Z4M60eAK3tEbKHsJlzR2xCl6GxrnZXZZCHVhzd0EjXy223P28swVm7
         x613ft61DTDe//3FiG3ITODWv9AVI0aq9uQcLpW1Nzm7RdAzENiyVYJ+4Dw8OKG0zVyC
         nZlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=lWscOpnw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11si9317352qkl.160.2021.04.18.18.00.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Apr 2021 18:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=lWscOpnw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYIGn-0006eA-FJ
	for alex.bennee@linaro.org; Sun, 18 Apr 2021 21:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYIGN-0006cs-St; Sun, 18 Apr 2021 20:59:43 -0400
Received: from ozlabs.org ([203.11.71.1]:39487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYIGL-00009i-Am; Sun, 18 Apr 2021 20:59:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNpPF5rpvz9vFF; Mon, 19 Apr 2021 10:59:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618793969;
 bh=Lv4qyMHh3Ed96JGnqLLgSEeIEKZNoCufKkcJTufYCuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lWscOpnwwCSaJ3R9e9SD5bjHj+k0X3OCovDqrYaQOqlb9mHDwQsfQC2CdXyYJDBBa
 +XpygNfyt0jnNSngqMJa42EsYY+15vEhYl2oL8FsgdOW+IiwyKnIaWqzOTA6ocbvo6
 HX+HWVKNfLfSkwgY0uSOMuiwdhUWDpusMsm7/7lA=
Date: Mon, 19 Apr 2021 10:46:48 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 04/11] hw/pci-host: Rename Raven ASIC PCI bridge as
 raven.c
Message-ID: <YHzS+IhxUwCJ3gyO@yekko.fritz.box>
References: <20210417103028.601124-1-f4bug@amsat.org>
 <20210417103028.601124-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lJ5bUK0ys6IObMRY"
Content-Disposition: inline
In-Reply-To: <20210417103028.601124-5-f4bug@amsat.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DVtpjp0l/P5T


--lJ5bUK0ys6IObMRY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 17, 2021 at 12:30:21PM +0200, Philippe Mathieu-Daud=E9 wrote:
> The ASIC PCI bridge chipset from Motorola is named 'Raven'.
> This chipset is used in the PowerPC Reference Platform (PReP),
> but not restricted to it. Rename it accordingly.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/pci-host/{prep.c =3D> raven.c} | 0
>  MAINTAINERS                     | 2 +-
>  hw/pci-host/Kconfig             | 2 +-
>  hw/pci-host/meson.build         | 2 +-
>  hw/ppc/Kconfig                  | 2 +-
>  5 files changed, 4 insertions(+), 4 deletions(-)
>  rename hw/pci-host/{prep.c =3D> raven.c} (100%)
>=20
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/raven.c
> similarity index 100%
> rename from hw/pci-host/prep.c
> rename to hw/pci-host/raven.c
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36055f14c59..0e8f9cbc2ab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1302,7 +1302,7 @@ S: Maintained
>  F: hw/ppc/prep.c
>  F: hw/ppc/prep_systemio.c
>  F: hw/ppc/rs6000_mc.c
> -F: hw/pci-host/prep.[hc]
> +F: hw/pci-host/raven.c
>  F: hw/isa/i82378.c
>  F: hw/isa/pc87312.c
>  F: hw/dma/i82374.c
> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
> index 2ccc96f02ce..593d90e5588 100644
> --- a/hw/pci-host/Kconfig
> +++ b/hw/pci-host/Kconfig
> @@ -6,7 +6,7 @@ config XEN_IGD_PASSTHROUGH
>      default y
>      depends on XEN && PCI_I440FX
> =20
> -config PREP_PCI
> +config RAVEN_PCI
>      bool
>      select PCI
>      select OR_IRQ
> diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
> index 87a896973e7..2460f365471 100644
> --- a/hw/pci-host/meson.build
> +++ b/hw/pci-host/meson.build
> @@ -13,7 +13,7 @@
>  pci_ss.add(when: 'CONFIG_SH_PCI', if_true: files('sh_pci.c'))
> =20
>  # PPC devices
> -pci_ss.add(when: 'CONFIG_PREP_PCI', if_true: files('prep.c'))
> +pci_ss.add(when: 'CONFIG_RAVEN_PCI', if_true: files('raven.c'))
>  pci_ss.add(when: 'CONFIG_GRACKLE_PCI', if_true: files('grackle.c'))
>  # NewWorld PowerMac
>  pci_ss.add(when: 'CONFIG_UNIN_PCI', if_true: files('uninorth.c'))
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index d11dc30509d..ebbe95eb90f 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -73,7 +73,7 @@ config PREP
>      imply PCI_DEVICES
>      imply TEST_DEVICES
>      select CS4231A
> -    select PREP_PCI
> +    select RAVEN_PCI
>      select I82378
>      select LSI_SCSI_PCI
>      select M48T59

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lJ5bUK0ys6IObMRY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB80vYACgkQbDjKyiDZ
s5JMgBAAkbXZEGGOgJU2UZoZ95HPsnmpjPxYv/EorqjlGC3n1CThuoIsRFvayiQ6
7NMjTGsL6SElifsKocFDN73FVCOhqg0nDeWy+laKT46g4youJRFfGy0ifWs8zxHU
6mGR6zbpGsvbfUpEwob0GrSG2IRWMO75Bw1eIi7tugEEcru0D5jcyVbzAedUlB3x
kSJGTKbHo/2vK9T8kGufP95Ejg800X54omOyFuaGdOVtu+QyEwRkObX4s8ZNZC++
faOxt32jq9Z7GIAJTc6qJWGcD8AaTuhY4uTHQ7TQDcUBv5PcyKgVtz+iLP9yl5kl
88LU1QIEcSfWdVERf5IF6YOyOr3joZLPutc6r8MpvZUN5X+VVAnvZkwDQhOcZhkz
1Ysz8//HLR3X6OeIv3L/GagpGO9QSYqYI6heNu+JvMdRg7O+yPg3TQ4UsgFNAacv
kPJiWBwCKhg+pvTv/zJl53hZHG5dhhN3M6tMuYvPLjEVyCNZVmaI5uYw9MfPHTMT
F3bGwLUIWR529VCRPMrM+RC8X39TW/pm0tuwPToy/wv7vk6yLHBhwIreL2tMu1Vo
beKp/5fR7kbfQfrqF+lDzY13ys/JQUJI7BA7pKVyeETK6s3nw++zjXeHyDPSl40c
U11U/lGkTne/GL1ndqdCHlqaBac1D6+fatYDfEh11ZVMckON1A0=
=/e8M
-----END PGP SIGNATURE-----

--lJ5bUK0ys6IObMRY--

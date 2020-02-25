Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp947157lfg;
        Mon, 24 Feb 2020 16:24:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqyuuT/5Jgm8ywhkjgLPW1dVi6YippQDbYr42ndZbmEm5DNyZkn0qc3bWBLPQB+bUwTZiMZp
X-Received: by 2002:a05:6214:13a3:: with SMTP id h3mr47331804qvz.212.1582590271951;
        Mon, 24 Feb 2020 16:24:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582590271; cv=none;
        d=google.com; s=arc-20160816;
        b=EZF3VXUJNu/MLH01mxA3rHfVVqjaZ/tOJDR4I6Q2R3DluH26aabedreCFeog2xq98p
         jdbxeiEqSU1CrDfRTiMNMfH+EJRggTaqfPEbmJnQ2ZN61OEm9ddb/VQVovTNR8U2PjD8
         ElH5uqm/ye5JbPrcRHW/sz0gVmESxM5s1O0zF89h/H1j9ZXCpaO/WLGrdV54TNK9AVjj
         ktwcBOvt2gwcHDc269Do8OVCOSpZgM/BNd2Yr2/24tFgXA5/slxNgEW7oTY9iGacC5jD
         B1W/0ICj80P51yUPHGscxzib46Trhe1B2h6/TuOMdUv6gZvoZl0oSZ67gnBmwbwmUsGh
         MA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=CuRtM8t++35moo6JSAsvSt8ZpEHmgW8/Ftc1Cym5VZE=;
        b=kouFgc99tMwZsCtxkLS9GuSONgQ15yZza4991ZJmUFAvKtfTnw2eKo2NvAIUzGqcFD
         Z+05+CDJxi8RDVkTlSe6iTKjrtqqbyQlkhH6Wc7wVl8srK8qDTQh/Klgl7ITwZlU6/VW
         glbPS9ksURNNWd34dlAWVYtF2k7vrAxNcvZP3BkNRv8bnfHIsnxgiHyIfx/gjPeCs1Om
         DjVNIdi7vLA5lAqRye6CsbNzg4w64uAuXG9uHzrPPNdDbnD7fr37BfykGscxXpBHuuTm
         PMvk8EcK31WwioIMu15O31hOfhuHaIfWycuoFMDlgVvz2lhfGvha43DiQsXcirDGO0PM
         YVDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=EIS6g4wc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15si5770432qvm.7.2020.02.24.16.24.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 16:24:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=EIS6g4wc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6O1X-0000jf-8C
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 19:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j6O1N-0000jM-I1
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 19:24:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j6O1M-0000JZ-C4
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 19:24:21 -0500
Received: from ozlabs.org ([203.11.71.1]:45553)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j6O1M-0000Iq-0F; Mon, 24 Feb 2020 19:24:20 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48RKS01rmzz9sPK; Tue, 25 Feb 2020 11:24:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582590256;
 bh=QB8oFSFaYoTX8Rx05o4U8QAJPl+c6DRspslzdATSPv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EIS6g4wc5HG9jscHdglTXT8XM8ciZTrxjmwHjIQwC3S8rIPIkvtw/7/JDCx1PwCZN
 t1Y7w21xw+l/VgvFp+QLpgRSqB35L24vmsQFBcUMrFFyD1vbTuzaVuvfSf1eax0ALd
 hbWnomDgyjHNHjpifw7rdWTPMkcKjrYMbszh1AaA=
Date: Tue, 25 Feb 2020 11:23:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND v2 11/32] hw/ppc: Use memory_region_init_rom()
 with read-only regions
Message-ID: <20200225002345.GC41629@umbus.fritz.box>
References: <20200224205533.23798-1-philmd@redhat.com>
 <20200224205533.23798-12-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Content-Disposition: inline
In-Reply-To: <20200224205533.23798-12-philmd@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FW7oZddO+Anp


--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 09:55:12PM +0100, Philippe Mathieu-Daud=E9 wrote:
> This commit was produced with the Coccinelle script
> scripts/coccinelle/memory-region-housekeeping.cocci.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/mac_newworld.c | 3 +--
>  hw/ppc/mac_oldworld.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 464d012103..566413e479 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -156,13 +156,12 @@ static void ppc_core99_init(MachineState *machine)
>      memory_region_add_subregion(get_system_memory(), 0, ram);
> =20
>      /* allocate and load BIOS */
> -    memory_region_init_ram(bios, NULL, "ppc_core99.bios", BIOS_SIZE,
> +    memory_region_init_rom(bios, NULL, "ppc_core99.bios", BIOS_SIZE,
>                             &error_fatal);
> =20
>      if (bios_name =3D=3D NULL)
>          bios_name =3D PROM_FILENAME;
>      filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> -    memory_region_set_readonly(bios, true);
>      memory_region_add_subregion(get_system_memory(), PROM_ADDR, bios);
> =20
>      /* Load OpenBIOS (ELF) */
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 7318d7e9b4..8b22ff60b8 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -132,13 +132,12 @@ static void ppc_heathrow_init(MachineState *machine)
>      memory_region_add_subregion(sysmem, 0, ram);
> =20
>      /* allocate and load BIOS */
> -    memory_region_init_ram(bios, NULL, "ppc_heathrow.bios", BIOS_SIZE,
> +    memory_region_init_rom(bios, NULL, "ppc_heathrow.bios", BIOS_SIZE,
>                             &error_fatal);
> =20
>      if (bios_name =3D=3D NULL)
>          bios_name =3D PROM_FILENAME;
>      filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> -    memory_region_set_readonly(bios, true);
>      memory_region_add_subregion(sysmem, PROM_ADDR, bios);
> =20
>      /* Load OpenBIOS (ELF) */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5UaRAACgkQbDjKyiDZ
s5KqNRAAwHe0vYT9rKDx9BpcgQAO3s4kkrzffvgcGNe9AVt7B6T75Q+kf6bS+0oU
yhLP9NJFkwjH1hzbyLE0sNKQjWpUdguJh7KYlC248qV8UnozdFXpEp4vYo6ZzLev
6EF7LqLRS4gIR1t7SP9DMeRHUIY5NGTWmDJMU2WrmGT3/gEMZ3MWyVVlOSMr3lD8
butF2PhAdrRUZL5H/IiXcbLIgeCzDw24+WwI8MppW1llereWfRgXL++j6OZnG5mr
Xd1MsivbWZN1lRzORhhhY9eFLvmZk3B54gemMCuGPCX85iafqohFZQTkeq6QHeH0
dyBQ1KkgTHQJOZ8+o8V+zUIzDhOjiTFMZJ2w7z90BiNBt2wqvHYoUGTY9I9tqtdq
TWOoOWkWxElc+HMMEWAq6z9Zxp/QhuPzQ0LqQovmeAGwLwPsuWc1oBE2yhnPDvYP
d1PS8t9+RObBgT8qGFR5X20qpzQErRCU7Vh3exBLRcjjwcj73yJ2RNDaXuOgZfwv
cjyKY5xi3FtNLX/F6Wus4TbC0nddcKs4I/3i/MoSUrAXhw1hFxhuNZ0gHteI0EZf
21L1XBnMUzz1m43uaIyyJTCU4ppEY8+/dlV0h/bcpWP0JvP7+YmLd3Bv5KFlrGxz
c+NDW3O63gw9R7IB3QOYVSlQBIQrnqAjikQVt82hMWbQoh/yz7c=
=Ji33
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--

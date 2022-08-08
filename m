Received: by 2002:a05:6512:618:0:0:0:0 with SMTP id b24csp317838lfe;
        Sun, 7 Aug 2022 20:37:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6xy3ZDSt48UCxX8QMe7uh+JrTofkcQcCVilOXllvKGcxVICnGIhLPGzxwpoffKujeARsHi
X-Received: by 2002:a05:620a:4513:b0:6b8:f52c:f100 with SMTP id t19-20020a05620a451300b006b8f52cf100mr12837626qkp.155.1659929865090;
        Sun, 07 Aug 2022 20:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659929865; cv=none;
        d=google.com; s=arc-20160816;
        b=PnaaRL/IJMVq4lwWho2EMIuRa0Ts/yDMBwBNDkhD3opP4ZC5vCIxrQVSD5MPlkc/Cz
         o6y+z0K7mk6D7DQpg5qNkJAxDdlAXTev2n8x0NLPRTfjflp4IV6Reo0RpNynA7m6Yp9g
         z6KhMMVWh3FVBS63Uzr6ULyjD/CLeSbw3zwsqp5iUJ5Y3Z/HNZad/b16WdFHJUrb9x2S
         B8WKdSz/GWAdFOK9kXUIRl4mwNFavP9dtmI+zP6ql9hZL0xdQvMu6icQSTiXWLP/+SSk
         HBYIEa4DENN7p1PaApPh/c8OcXlCJ/Jzj84SWE4WaNNR1ZnmNlePp6qMpkqoaOBZs3Gq
         mmvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=4VvvaKCJhPUo2Ye8oEnieV7F5GByqSGI8pv/QBMYplE=;
        b=IWu7YS+14XDZdCeA42OD+Fc/q+MfGPqjMXPg8C1lQoW8XhxDS4IkP2jOc8t5393YDk
         eRfmbq+YHOgXVX/vyOlWkp7AJgi3wh0QU7SmdPPAvSym+T3deJ6AWBKNRY8h6FduOdwW
         jvztC8w5GqCdDQkiyHqsQwpKucHjb+MG1RVGQeqq/l1izfY4iNCWCJAt0yb0W2Bpkuty
         Hvadp3SIXTro85+Ur8ftKMXxwYXozpjG4UexHazlokDhF3/6y7nyb4s4aXF68LfWuOm+
         kzI7ASidny9hxRPR1SCcpin1Ws86TnhWte6RGfEuewKvoiynxUmU2yZ9+jFoLTEzm609
         7RJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=EmTm7LVx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3-20020a05620a0d8300b006b47631b63dsi7065198qkl.115.2022.08.07.20.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Aug 2022 20:37:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=EmTm7LVx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oKtaK-0003wo-HC
	for alex.bennee@linaro.org; Sun, 07 Aug 2022 23:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKtZi-0003uE-8Q; Sun, 07 Aug 2022 23:37:06 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:40261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKtZe-0006a5-8V; Sun, 07 Aug 2022 23:37:05 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M1MM85834z4xMW; Mon,  8 Aug 2022 13:36:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1659929812;
 bh=4VvvaKCJhPUo2Ye8oEnieV7F5GByqSGI8pv/QBMYplE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EmTm7LVxFxGvfFtjmwO5XzBQDOVmzJDa6ZaFrc346AOyA3078yQ+ol8XsQDz5JqHZ
 tmKRvkSgKlXpOnoEpXZUDZDMqerxGWBedl1zlPdL2sbpkIE5ghnKZr/m+/EsafBE0S
 JKslmVYkhLykxpy+kZvLdmRk3cvA/NqB3edmWHr8=
Date: Mon, 8 Aug 2022 13:23:44 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH for-7.2 v2 01/20] hw/arm: do not free machine->fdt in
 arm_load_dtb()
Message-ID: <YvCBwE200sVzMixz@yekko>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bPHyV/5iBO3d7ztV"
Content-Disposition: inline
In-Reply-To: <20220805093948.82561-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lU1AdXxWVnWH


--bPHyV/5iBO3d7ztV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2022 at 06:39:29AM -0300, Daniel Henrique Barboza wrote:
> At this moment, arm_load_dtb() can free machine->fdt when
> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
> arm_load_dtb() will make machine->fdt point to an invalid memory region.
>=20
> This is not an issue right now because there's no code that access
> machine->fdt after arm_load_dtb(), but we're going to add a couple do
> FDT HMP commands that will rely on machine->fdt being valid.
>=20
> Instead of freeing 'fdt' at the end of arm_load_dtb(), assign it to
> machine->fdt. This will allow the FDT of ARM machines that relies on
> arm_load_dtb() to be accessed later on.
>=20
> Since all ARM machines allocates the FDT only once, we don't need to
> worry about leaking the existing FDT during a machine reset (which is
> something that other machines have to look after, e.g. the ppc64 pSeries
> machine).
>=20
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/arm/boot.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index ada2717f76..9f5ceb62d2 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -684,7 +684,13 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
>       */
>      rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
> =20
> -    g_free(fdt);
> +    /*
> +     * Update the ms->fdt pointer to enable support for 'dumpdtb'
> +     * and 'info fdt' commands. Use fdt_pack() to shrink the blob
> +     * size we're going to store.
> +     */
> +    fdt_pack(fdt);
> +    ms->fdt =3D fdt;
> =20
>      return size;

fdt_pack() could change (reduce) the effective size of the dtb blob,
so returning a 'size' value from above rather than the new value of
fdt_totalsize(fdt) doesn't see right.

I believe some of the other patches in the series have similar concerns.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bPHyV/5iBO3d7ztV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLwgakACgkQgypY4gEw
YSJlqA/8CD358Ck1lrnt1Xfx7HqJpqx4IA8M0LUL2UBWdaL0aVME14E1GMKb80Wk
i95WJOWrf8lZilVEOkR28k2y61KK0dP5pQ/iTLSaltNXugRJwTVbeawWcqWaXYZX
tuBaA/EWUHsI37nimF6LT7DTbxscoY0VWhgysORZN6LujgojkSAdNnHxcDl9zkZY
e9BpSBLfAxzWoDBQoNQZqGuJCWLw2sfZShTw9bXYE2Vo5wI2fBGoHyz7TbKd34MF
ydsmvOS6PpbBWuzAOorYqSfmD/27mhxAOQqIq8TzZFLcbj3dNkPtbsLzMBE4Rhja
O0SVw53Qk0Rc9kesaoPcY1iQPG1bzdcUB3i3VQP0rAwXUEksgBc6KKukqopFo8Ly
vELGp5q79RmgMlS2ZEYyMPxazzpirwZcrbCLqsf/Lsg2JwCuBhANjycoTKRFLFts
Fml1jNwuAx/OyzTCKPZHV5EaBt+ZVYvAH7vgugRSgM1VaZFv6cYdyorodRABEbdR
6nQ5WrDSmlwqOs26omleQ0Bp1OQLKC5+98D/mfrH0LuU0XYp8BWbE0iyX/1MsLDd
U1zQ8l9LBvg1kcGirm06RJTxXS9v1DCPPq/PBQlu/KxU7GGC++W7HDOoBD2Aqp4R
pXHFVAJBCCWbXhnnoWAgid1dmYe/wUWJSpW9e/wAOoJEiagqgZI=
=gls5
-----END PGP SIGNATURE-----

--bPHyV/5iBO3d7ztV--

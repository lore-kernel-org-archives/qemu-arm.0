Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2656488lfg;
        Sun, 9 May 2021 22:54:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi8M9Ia3uJ2KH7tH0dV0n/raTmQrAjVuuDvgto1sUg1u8rhn0JLjwJq3J+G56Vl/Z53Y11
X-Received: by 2002:aa7:c914:: with SMTP id b20mr28275218edt.199.1620626040128;
        Sun, 09 May 2021 22:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620626040; cv=none;
        d=google.com; s=arc-20160816;
        b=escdskHAcYwVcunVpEnXRqe9C/7fC4e2qizNEArf7mtM1Bqm46zlDETii5yBdejS9r
         1lvkY/Q+61j12UGyKeOCfVwYfFlNvN1HH4CzH2W8EZx7v4d85W9fkBlF5L2GRgpQ1iTW
         evPF0zszGIN4IHL+4OXpy6W1FydhwLJ2fhOmbUyKUZ4GwHx33dZdXjFUeg9tl4n6MgFf
         3XA6jhBq0r7vOA3EpXarjHmEF3MGvBJE3qwFrpzqvNfiGS6Ht7bgVJHI6gTZ/EOhzGuN
         owu5qj0tWbov0JQcbKSBZ94bgiCnhORVDih8YIl/eGVrZq3z7jve/XxjjFTN9x0yaxjg
         Mfdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=eUgO406bti9wzGMBsSu6lk1TuBnh0IzKEenOV4G/SXo=;
        b=TVoJWnCumE+D/ax28karGJLL699vB6zvkQWdK+hvnOb1h6yp/ZT2emuuZRW8+dAnXa
         UfueveyZIR6eFSeJRpGJU714kCF/cs//w7sQT4c3vC+qWxJhJ7GbjdZCLn1OXw4kj3xb
         3XUOnYjCKX1x/8f5zNYryPun58B1U/BOs/23FLRuqbeU00bEMepDHbhaDhtLzomZs4pT
         Gt0KOfN2nemV7uK1EEjGOlaw7HAOYsQeUAVMIQI/M30cJVg4pv7TugDFu6I51CRuMcj5
         caQNUXA21ug+kr17YPvSFTqRK1BNpgnUpBds7iQ6WUiDrT2v2+QQpeQuwBVHsu1aX+W2
         6wLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=eaquEyrq;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id n24si12306106eds.571.2021.05.09.22.53.59;
        Sun, 09 May 2021 22:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=eaquEyrq;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhEJFzD (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 10 May 2021 01:55:03 -0400
Received: from ozlabs.org ([203.11.71.1]:59731 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229863AbhEJFzC (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 10 May 2021 01:55:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
        id 4FdqxK0Nfbz9vFt; Mon, 10 May 2021 15:53:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1620626037;
        bh=Dex4GpvbUQbXqChv0Q2g0NAer0UcJ6OSYIFxuMVyNHg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eaquEyrqb9fzb1vK0YO7vT9KISXpfThh7X1MEWp1UAdTmRWjn9Tz6nRTfiK5Od/2C
         d6DKcxainnV7OOlUMdNpunT9KS10aq6euzLqVqePTx5P2KGXxC05Tk36i+6/Ix3pIC
         x9VRmH9YjmgSgoErYMqgp7jppB/ga3n3HFmMxWyE=
Date:   Mon, 10 May 2021 15:38:02 +1000
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc:     qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
        Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
        Peter Maydell <peter.maydell@linaro.org>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        Gerd Hoffmann <kraxel@redhat.com>, qemu-arm@nongnu.org,
        Greg Kurz <groug@kaod.org>,
        "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
Subject: Re: [PATCH v3 15/17] target/ppc/kvm: Replace alloca() by g_malloc()
Message-ID: <YJjGuvsB5r5f7x/F@yekko>
References: <20210507144315.1994337-1-philmd@redhat.com>
 <20210507144315.1994337-16-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d0Yk/ttOaOG9s+2E"
Content-Disposition: inline
In-Reply-To: <20210507144315.1994337-16-philmd@redhat.com>
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 6IDPfI1TCmbW


--d0Yk/ttOaOG9s+2E
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2021 at 04:43:13PM +0200, Philippe Mathieu-Daud=E9 wrote:
> The ALLOCA(3) man-page mentions its "use is discouraged".
>=20
> Use autofree heap allocation instead, replacing it by a g_malloc call.
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/kvm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 104a308abb5..23c4ea377e8 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2698,11 +2698,11 @@ int kvmppc_save_htab(QEMUFile *f, int fd, size_t =
bufsize, int64_t max_ns)
>  int kvmppc_load_htab_chunk(QEMUFile *f, int fd, uint32_t index,
>                             uint16_t n_valid, uint16_t n_invalid, Error *=
*errp)
>  {
> -    struct kvm_get_htab_header *buf;
> +    g_autofree struct kvm_get_htab_header *buf =3D NULL;
>      size_t chunksize =3D sizeof(*buf) + n_valid * HASH_PTE_SIZE_64;
>      ssize_t rc;
> =20
> -    buf =3D alloca(chunksize);
> +    buf =3D g_malloc(chunksize);
>      buf->index =3D index;
>      buf->n_valid =3D n_valid;
>      buf->n_invalid =3D n_invalid;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--d0Yk/ttOaOG9s+2E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCYxrgACgkQbDjKyiDZ
s5ITGQ//cx1kIrgp8Q/IhYmEdRIUtMGVyBCKWYUh37rI50BsqykhIjP6v0MGQUVq
+vcEanUqTaYiCQxcwG4wj09Peh1Y1ldVGVshKKvfpyTRx7XNQieiUgrcPNH6Z+x3
X948ERPAlwDCnFT6OUc+wzszjbdLbjiTa1YVBIAP6XPNN+GS4edSJSnmhWQ0owkl
zSqzxYCR4HLB7ltUy7DLvifuDDM+NIl6eZBfgzy0oC7VBLSgSRGIUMthgJOyXgbh
XqmzV39VdyTKLhK7b+XMULwTAL+Qxls9ARFjyiCoXR67pEzTE2wglNxDpifi9TPF
3pV7xQbd5aWPQ7GR7P6sVtzz8091elcUxvaJ9te7Fwiqfj/Oe65vuDDNMnVKO3Rn
elpNLSCI2uW9SA2AwRUt1nPeN46URQMzYd2wCyXALj8VJhmWwtUSTGfrYOjH0xCM
M8p8qMf5U2Iutk3fAHTtaybmGY+JCC/34DgVUoh7zKcFyigzQoIp5avZ2/LkspQc
9xJwLEVP/mHSet9CHMUwu6OFNAJNzGgeCh0y2DqVthQoUOQNhCOMn5Xg9McrmGAv
5kKOz2Rh/Ibz2mBzxAMkqNOZuCBh0tV5JEgcXL/UZywVwqPG24jNXEL34JR2W75t
mp7+J0fm280huxEfjQX/F2EfD1i0sWKoGMXriord4Ps+bmLEF7s=
=9BxG
-----END PGP SIGNATURE-----

--d0Yk/ttOaOG9s+2E--

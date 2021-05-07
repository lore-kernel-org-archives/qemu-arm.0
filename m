Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1855626lfg;
        Thu, 6 May 2021 20:00:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIp/z4M43UBqvNLVGYrZtgkaeudxe+tBFn59lYCHfZo3IHNnBzrggSUgwlWlanK5zDCXj4
X-Received: by 2002:a05:6e02:c71:: with SMTP id f17mr7309935ilj.176.1620356447107;
        Thu, 06 May 2021 20:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620356447; cv=none;
        d=google.com; s=arc-20160816;
        b=Uzissp9B33GJ3lHeaGWlDnXxyes055untVrvK7zVTHp6lSeQAZknKey9lRkFhgKLUo
         mRrH6Ei2gAB/xdK9zL0VkwPdj8+279gvn6kZBo3f8GdIjUMht+a7N3wyv5N9hwosVRkD
         038CMYUHEDqzsPLs0SZahxjUy30I8+EJ6JberdJAUJ3x0+gXh8D/h3UVg0BNza5HopTP
         eUJl7mvkb7T1tKGSzglqMjJOwgGNjEkX3lOP0l4LGZOJaOZrAqS4N/n4LUf4BY0tdJSe
         zpRBCVgnpVxkad2fpshDSUzpU64iuZWBx+qsEsQafKBrzGsIw/fSMatCduL0v5licWPY
         uG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ggBPMCmmV45tpZ/9UyzDM0qDJugY7T1JEhsB02Tkc9s=;
        b=pewk/6z6wlL2IoYPmVZvWfz1J8TUsE2zk/lew245Dpcqto8ba6WN/Q5lhOK6fZRI1a
         oxDGIB+qFqSKscs+eePHK95iJdZ/AcCHL6Gs5w41Y0BnpATVCZEbm2Z/wJycoyu1gFkS
         SzjdRob89sI/f3lPoRB7/8djwulxad6q1CBT9m/rXfdYDSXjzKytNXzMWlMrb33pM/Ne
         5IroCTABUwCcI35B+fjRTPHdG3P11jn3gVvEvAzoNC0hUG7ogwYMEBmFSfw+wD6UfID2
         RvQt7oZ7lcyVuAMQaVRVWkE4Tc3rpX6YCXXIuzlbiK67fKxl/QW77sgE6QbqgqErAnSW
         FUng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=edza2Ley;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id y10si4915389ili.76.2021.05.06.20.00.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 20:00:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=edza2Ley;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4FbwDm2j3Tz9sXS; Fri,  7 May 2021 13:00:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1620356440;
	bh=V3Col8QuO+oqxyxGF4EMsfKrF/pUgQZGNFIpssOh0AI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=edza2LeyxxkxmGtfpPhcz3XklUpdUgN1Aqkrr6AcESVHjA5NDMONhLDq8vdFR0mA9
	 Ev2aVcmxor+FyG9jCJ03f7dIGIn4hb2rHFiwsWWm+ATaBNAgAA30gKGrnmOTaCbya4
	 p4Coak2+knhaXxjx8cMB2Ef29JD/zmObxV8j8DFo=
Date: Fri, 7 May 2021 11:05:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 9/9] target/ppc/kvm: Replace alloca() by g_malloc()
Message-ID: <YJSSX1eUIecBpwwX@yekko>
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-10-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g1x6QJlBgI8sUhxy"
Content-Disposition: inline
In-Reply-To: <20210506133758.1749233-10-philmd@redhat.com>
X-TUID: crkH/xnTqw22


--g1x6QJlBgI8sUhxy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 03:37:58PM +0200, Philippe Mathieu-Daud=E9 wrote:
> The ALLOCA(3) man-page mentions its "use is discouraged".
>=20
> Replace it by a g_malloc() call.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  target/ppc/kvm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 104a308abb5..63c458e2211 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2698,11 +2698,10 @@ int kvmppc_save_htab(QEMUFile *f, int fd, size_t =
bufsize, int64_t max_ns)
>  int kvmppc_load_htab_chunk(QEMUFile *f, int fd, uint32_t index,
>                             uint16_t n_valid, uint16_t n_invalid, Error *=
*errp)
>  {
> -    struct kvm_get_htab_header *buf;
>      size_t chunksize =3D sizeof(*buf) + n_valid * HASH_PTE_SIZE_64;
> +    g_autofree struct kvm_get_htab_header *buf =3D g_malloc(chunksize);

Um.. that doesn't look like it would compile, since you use
sizeof(*buf) before declaring buf.

>      ssize_t rc;
> =20
> -    buf =3D alloca(chunksize);
>      buf->index =3D index;
>      buf->n_valid =3D n_valid;
>      buf->n_invalid =3D n_invalid;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--g1x6QJlBgI8sUhxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCUkl0ACgkQbDjKyiDZ
s5JeShAAtE6r+nLzXGSDEwW1F4BeqX9QVewuCmaxNGgnLxraxLHuO0ME9IMsp0jM
xJg2sv+KFC9axYu1o2RZeGeH8+wGBusgofIRlxmL28+jIgYyFeD/VQZM5Fh2C/Qz
apTpHA6Pjn6Ed6d8qk+6cTCAYj4cEZkq+4PvI7Rf492WLPDJxKMa28DeUdJ4Oe/K
SsYZIgJMRXrgk8ckPEJ7faYweaBtVxlvIK8yt/dKJuv+u33oHMoFwwqfPJP2i5ed
LKCl5bN/wEMGkaD5iP39AgPbLf5ICl2W3wB42+jbsewTBwCzr//+Oudl1Qt7Okns
08kk6GFbK/9jLrSUDUAN8JUblIzPGu0QF+QEsWGaCvgnL+EXHUDBNjv9BtEpupPt
KauPOUXwA6XA6gEnU3N3S5kP9QlN1sWs9Df0wH0flbJo62cGFAg1A1ZxgCmyayfZ
H3c7bPsQvTm1lB6YEHAirHe2FB5G9blsNAZU4dtMsxxdm2uOK87rEwuwFzW3XfZY
aNcENy3aYUbKVLSOWoeRLLlvtVXHAT8afhN1RYtaby+mA8w/fI22IW1F55scEz1B
AZSDqkJ0ZDmNM3KUY+n6YRJeYvTTQJNIgAO5Lud5533d9hZFxD3HVD7oogXykAaL
XYG+MJamQEwkV5wZr9VXyy543zqIwRatQdJk7RAxeHPsqt8lYsY=
=JBda
-----END PGP SIGNATURE-----

--g1x6QJlBgI8sUhxy--

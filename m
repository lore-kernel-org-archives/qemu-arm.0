Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2175696wrw;
        Wed, 7 Nov 2018 06:11:17 -0800 (PST)
X-Google-Smtp-Source: AJdET5d+ugJXcm0V4XZ3LOlFk4f+fPfeFzKQh6lX3Pm1pWBfnHooTPvS5TEtPJxTP39TYD+fdBnB
X-Received: by 2002:ac8:5241:: with SMTP id y1mr397436qtn.22.1541599877655;
        Wed, 07 Nov 2018 06:11:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541599877; cv=none;
        d=google.com; s=arc-20160816;
        b=NjzqQUiJHfr//+Fa8rhSiQf7fEk2iKXMvy/tApQ2UHQ3SfeUBN8K1XwaOHjx+p8AVB
         iE1CHks1jQfxPiYArCifFM9EdJ9Y6m6TL1zBSExaiHIJvnz5M9PBTQ08V+rg86t9JHOZ
         fgk3UoFmq9MwHpzi9Ie9C5zU8BHZuPPbJrkrcERrwtperB11p6xCCY5awEY5YIpiNmHs
         JahowD/P7TcmjSuNmNSl5lWoxMYhXIi9UBSSq/+Ht7ZV6j14ywcQhjaIRAIzwTn8dg78
         gwLAe4b8bvFf1G4/H4C9SJBIkxbJmhDoB1bSaLgkAsKLI3cg1HTxIS9uyzF4nDdqnZ0C
         OIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to;
        bh=9DBRWGY+cSq9dVLVzEnjIZgQemrw5g7OF2CDebtT2zw=;
        b=ZRVhw3U93Et9kghX0BrJ2DSHGlQQc8Ihgd3DEh+9gur6Qk/CYWOOxS9yL1tFEvCsAO
         hYpQQwZolW2cWNZnDYZchCXb6XUQ8bwg1UANL+FKyzLRp49lu8t7KfXzhJGwK+w4I/rD
         GmnodL/wd+Mzm6ba08Tdr22wrZ1BEk0ehM2HoinBIdPPYC7ub8X0lPnJbs78o3/5qV2J
         G+0O0OGsVb0NX6joZmnD+qOyi3ypiUG0vAnCb5dlTebCEKcUhs6ERMAwymtG8G8/UvqV
         iwW7LJ0y23Sr1KvLOxSoWDwOgKH7xICCY3x3yltqgPvMOw2E/Y1qquq2OKo215CQ9jpO
         Qqig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a103si25065qkh.5.2018.11.07.06.11.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 06:11:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKOY9-0000oT-3w
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 09:11:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41334)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1gKOWc-0008WK-Uj
	for qemu-devel@nongnu.org; Wed, 07 Nov 2018 09:09:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1gKOWY-0005va-UQ
	for qemu-devel@nongnu.org; Wed, 07 Nov 2018 09:09:42 -0500
Received: from mout.gmx.net ([212.227.15.15]:55915)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1gKOWY-0005W5-Jg; Wed, 07 Nov 2018 09:09:38 -0500
Received: from [192.168.0.241] ([89.71.135.231]) by mail.gmx.com (mrgmx002
	[212.227.17.184]) with ESMTPSA (Nemesis) id 0LwJFG-1fRha00rk6-0183pK;
	Wed, 07 Nov 2018 15:09:06 +0100
To: Nick Hudson <nicholas.a.hudson@gmail.com>, qemu-devel@nongnu.org
References: <d9876015-2126-79fe-415f-ca7427ab3059@gmail.com>
From: Kamil Rytarowski <n54@gmx.com>
Message-ID: <d2313261-ac1c-4122-a49a-5fb521461118@gmx.com>
Date: Wed, 7 Nov 2018 15:10:28 +0100
User-Agent: Mozilla/5.0 (X11; NetBSD amd64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d9876015-2126-79fe-415f-ca7427ab3059@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="rlitqKnF5scRhdhioQvdkBUbDBdoGIPAr"
X-Provags-ID: V03:K1:dQqkWf3yCp8c5AR3APERdygD82JC+kXcuNQKJEt2X5HS/uorUdQ
	dWDX10C6K1ZBlLva4hHI2rtFBuVJdjUj+xQhZnOkfkrsbnQUKIqIlTkrsFK/+ITSIumTXlV
	tkeNOMFwhnYVjNNE3hhR6D6qNM5bX4CvgVZP2QtCcZVWsWmV2ThHXWayz2o/5TMIjfosiEm
	n+QbQMgs5U7kzper9mX5w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:e+a6kp9GmRg=:c87dO/QGLYKe2fBJ0nsQIb
	NiWguUfvpIDjoLdRCCjrnridUn6Qp8FQWLIxWeLgnn3sdi3zUubDmCGevuxo2ipkByhczHNsS
	jefwrffoqXvrxegSWrSzV9jz6OF+3MLoYugI/UarqTmKPYP84xJ2E1cYV/IMIPVA8ZDueJZoB
	Zbfsoyipd4LKoBCXG3cyXkg37iZYGpQsaa18dWi/o8aN4WFqkuL9GZtLFT4APJg+eabeIf3TW
	+MKJ6opF/UGQtwYo6ibD6Tf5exAadr0nGTWT0XQG9+9DNdeSqwiEMxhFILMjY3ms4HP/EY3FJ
	Z6nGdTcEmCtrFOAXJ16eRLe4W4IFIGeh29v/i9guM2h+rnbZkX4AsgyG83Jb7gBZV+DblskIp
	hSMUd/HqnCcc1ZaZGv7BqioO9J94QHEDcybwLuQldP+8JsRD2g2B3nNREVVugG6xEqxQF/4ES
	3PgiStVFCB7vhH1txKUQapuMvSJPdmlo3v/aV+/9y56wt7q33Gqearx1tV5BmGRfbm27r7SKw
	WOlPN5qkHojay0ia4LusHDEAO7QrNkLkJeGblNgUpU3BwwKvbRlGp0PWiWEEv8+yk9ogkR+28
	XR8LARoDwvLJxY6w0hZQQqJBLR1Mh2Da19yhOz5ULw6th3WZP//hkHBl1VgQG2dXFJ+s+mutS
	gEc85r98dJAc5I6LhiMCvPni3xdKUjiQj7SM+Xz44Ui/KM4eLIXxZam/s1Jz7Buv87Fi2sVWE
	0e+tE7AHZ/TQRVwM1WBN6JQYvDDoap8R4lUwuLWSRX4mcMz3vbFZkG0oPOCj+6XgJyc4VUOyp
	occ+OKz5y+Jilr96eLa/pHWANoHel6Es4CVpnePj9r7v+1FRWPRHJWb+imwotMCq5nTWIpLLq
	BUl/4z9Linikp5BRMBCkmf6xt7FP5x2HD2YOdDkv8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.15.15
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH] Support u-boot noload images for arm as
 used by NetBSD/evbarm GENERIC kernel.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UeczpydYeAZC

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rlitqKnF5scRhdhioQvdkBUbDBdoGIPAr
From: Kamil Rytarowski <n54@gmx.com>
To: Nick Hudson <nicholas.a.hudson@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Message-ID: <d2313261-ac1c-4122-a49a-5fb521461118@gmx.com>
Subject: Re: [Qemu-devel] [PATCH] Support u-boot noload images for arm as used
 by NetBSD/evbarm GENERIC kernel.
References: <d9876015-2126-79fe-415f-ca7427ab3059@gmail.com>
In-Reply-To: <d9876015-2126-79fe-415f-ca7427ab3059@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I saw this thread, but from a NetBSD maintainer point of view, I will
defer review to ARM people.

On 07.11.2018 14:19, Nick Hudson wrote:
> noload kernels are loaded with the u-boot image header and as a result
> the header size needs adding to the entry point.=C2=A0 Fake up a hdr so=
 the
> kernel image is loaded at the right address and the entry point is
> adjusted appropriately
>=20
> Signed-off-by: Nick Hudson <skrll@netbsd.org>
> ---
> =C2=A0hw/arm/boot.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 8 +++++---
> =C2=A0hw/core/loader.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 +++++++++---
> =C2=A0hw/core/uboot_image.h |=C2=A0 1 +
> =C2=A03 files changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 586baa9b64..450267566a 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -30,8 +30,9 @@
> =C2=A0 * Documentation/arm/Booting and Documentation/arm64/booting.txt
> =C2=A0 * They have different preferred image load offsets from system R=
AM base.
> =C2=A0 */
> -#define KERNEL_ARGS_ADDR 0x100
> -#define KERNEL_LOAD_ADDR 0x00010000
> +#define KERNEL_ARGS_ADDR=C2=A0=C2=A0 0x100
> +#define KERNEL_NOLOAD_ADDR 0x00000000
> +#define KERNEL_LOAD_ADDR=C2=A0=C2=A0 0x00010000
> =C2=A0#define KERNEL64_LOAD_ADDR 0x00080000
>=20
> =C2=A0#define ARM64_TEXT_OFFSET_OFFSET=C2=A0=C2=A0=C2=A0 8
> @@ -1078,7 +1079,8 @@ void arm_load_kernel(ARMCPU *cpu, struct
> arm_boot_info *info)
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0 entry =3D elf_entry;
> =C2=A0=C2=A0=C2=A0=C2=A0 if (kernel_size < 0) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel_size =3D load_uimage=
_as(info->kernel_filename, &entry, NULL,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t loadaddr =3D info-=
>loader_start + KERNEL_NOLOAD_ADDR;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel_size =3D load_uimage=
_as(info->kernel_filename, &entry,
> &loadaddr,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 &is_linux, NULL, NULL, as);
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0 if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64=
) && kernel_size < 0) {
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index aa0b3fc867..952562c2da 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -638,13 +638,19 @@ static int load_uboot_image(const char *filename,=

> hwaddr *ep, hwaddr *loadaddr,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 if (hdr->ih_type !=3D image_type) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fprintf(stderr, "Wrong imag=
e type %d, expected %d\n",
> hdr->ih_type,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 image_type);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (image_type !=3D IH_TYPE=
_KERNEL && hdr->ih_type !=3D
> IH_TYPE_KERNEL_NOLOAD) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fpr=
intf(stderr, "Wrong image type %d, expected %d\n",
> hdr->ih_type,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 image_type);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o out;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 /* TODO: Implement other image types.=C2=A0 */=

> =C2=A0=C2=A0=C2=A0=C2=A0 switch (hdr->ih_type) {
> +=C2=A0=C2=A0=C2=A0 case IH_TYPE_KERNEL_NOLOAD:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdr->ih_load =3D *loadaddr =
+ sizeof(*hdr);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdr->ih_ep +=3D hdr->ih_loa=
d;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 case IH_TYPE_KERNEL:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 address =3D hdr->ih_lo=
ad;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (translate_fn) {
> diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
> index 34c11a70a6..608022de6e 100644
> --- a/hw/core/uboot_image.h
> +++ b/hw/core/uboot_image.h
> @@ -124,6 +124,7 @@
> =C2=A0#define IH_TYPE_SCRIPT=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 6=C2=A0=
=C2=A0=C2=A0 /* Script file=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 */
> =C2=A0#define IH_TYPE_FILESYSTEM=C2=A0=C2=A0=C2=A0 7=C2=A0=C2=A0=C2=A0 =
/* Filesystem Image (any type)=C2=A0=C2=A0=C2=A0 */
> =C2=A0#define IH_TYPE_FLATDT=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 8=C2=A0=
=C2=A0=C2=A0 /* Binary Flat Device Tree Blob=C2=A0=C2=A0=C2=A0 */
> +#define IH_TYPE_KERNEL_NOLOAD=C2=A0 14=C2=A0=C2=A0=C2=A0 /* OS Kernel =
Image (noload)=C2=A0=C2=A0=C2=A0 */
>=20
> =C2=A0/*
> =C2=A0 * Compression Types



--rlitqKnF5scRhdhioQvdkBUbDBdoGIPAr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJABAEBCAAqFiEELaxVpweEzw+lMDwuS7MI6bAudmwFAlvi8lQMHG41NEBnbXgu
Y29tAAoJEEuzCOmwLnZs034P/Ahj6p817nuGQboDH97YXC86apQxWCe4vlerY6QP
jXwPRZd98ATkmIf7AjL3JLY/9FXBr/l+89lTSdU/wk1Bea4KLikX2lngzkr5dQl2
9fxWSzKtQQzFCBwzJ7Da1PCKlBHRG4V2qLSaGdG1zNgiUPOSNvAWWz395AeNwhin
CmJyVNtVeKn59q12DU7YX7p7GSOmDgo5jP59W+2uITU2v0U5b+60GUZzssoCgTW+
6MiCllKWcr8l/qdEoqHrED2zMcfSlWBsfjZJ4EO+x2f0RDxXI9TSxcu79MY/G6Cg
Cafgm0Se930OyXy0B6ldR94hPGT4MOIq/nMAIogrLt1qYw/BlSrl3ks2WKU70C5B
BZp8zoS+rBO74j9aRU8Bt1pNUjOtt59xYnxmpte/8/8fXTuznwIxRN20cXRND4Ha
tvoQaWPgWYs4w9Zma/lpPWttSPrNoGrRmY1FlMpVN1jnoj6kPqaq/7UyoQ6vEMqb
/XkdC/MO+SbudHcUxmjJvr7UbfRmZD1du3r11ZOKdFQXbD54xJwhzpajZHb8gBUv
2cV2aRroxq2I94IPkPILSNnnmS2kez6OUv0R2shP+yGaGCTVfVNYDq5XVEiu8c1z
pZrJk4D+MdVLXenguLt6H6/WkFDAZB4nCSMRv6jcJtcRjJ6EGlQtUlv7Uh3lTVkw
+cIY
=3C++
-----END PGP SIGNATURE-----

--rlitqKnF5scRhdhioQvdkBUbDBdoGIPAr--

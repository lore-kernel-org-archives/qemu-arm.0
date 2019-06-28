Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2687726wru;
        Fri, 28 Jun 2019 09:36:13 -0700 (PDT)
X-Received: by 2002:a2e:b047:: with SMTP id d7mr6800290ljl.8.1561739773356;
        Fri, 28 Jun 2019 09:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561739773; cv=none;
        d=google.com; s=arc-20160816;
        b=X68JlXYgHXx5EVoyPC2qyC9ZPeIB4qDRXItICE4ia92xPo/7RAgG2FZYD6aaPWGqm4
         vXI1U7/se+/i7VkGD2PZtOZws1Rby7KYoXnMBeXajOHMEknJ01+2a4S8D4oICihm+zp2
         N+9cBYfJt+b/JEiDbJkBn+DW4YQmfxb7WBO7e6z2inKCsV1e3kYLkE8x51wn6XtcmAw4
         qEYTDDbqY8JeQ/tob1JEvP88sAbsnpDFUFnD0QLQ76An+GL4O+jZ0j93S1Ys40C92x7z
         z86bX501lKFD0K1NQ9OFD7cEThhB2XM3HCw3JHF9U/0uZ0p3eLtYXaL+b1JTVbggi1c1
         V45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f25JLAKyHtV8jvniNcYaG9xMTHVkgpR7QSjcLNQUGAY=;
        b=GApmKM+a1zaqFoZXruWs0FquGp+3+6hUA6g8mv0G9k1gsPcKwhr3j/8gb+fmF/7PsW
         X9qfs0CpQ9c2FkeeO2n5AC6fNbaGaqChXjumq1faf1tukE7tKVOLqLDoN4LdJtxMsK7g
         8jqGcjx+Xm0qQk9ZWQ2uDIvd3wLdypjxpPx7DvYb/oRWLRnPtEZkHKQPkAOcw6QU4nTR
         jCiG5FF3Wg0RVIQeI3LxLo/YobNPvvLPguITz6E0u3eCsU/B48gZ1ls1O+0QVBeKrp6Z
         9IUGegaJ3j+Xscw6u3WylgOXFMKzyLed1dn4Wm6VNr1uJCnITpyIJ7dsfilJOEWRYtm2
         cFpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HBbMZcue;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v14sor1841958ljg.48.2019.06.28.09.36.13
        (Google Transport Security);
        Fri, 28 Jun 2019 09:36:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HBbMZcue;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=f25JLAKyHtV8jvniNcYaG9xMTHVkgpR7QSjcLNQUGAY=;
        b=HBbMZcueLdSy1TXqeTlgcbpJyTIWKSSl5GKsEfpRQNYu+YDEuc4t2DfISs+AdGZArz
         Bpm2expJJXQ8g9PQc1/dA3XmP1Mftehzg6a+1wXpm4MA59QN2tMbtakKLClPFvoMz5KE
         Nwk0RgsxCzyEDYM2pi0WrORqHjr+Pc3kr/X8SeCJtoapM5W59UBLm7l57TEXW2uNN2/Q
         C9HJggInYNk2wTE5/gMSw3Sl2H/HRcU/lGFV4oQ4OfnisZthXVEk6sTr8IC5AifCIV+V
         /3upjDHE5zexxnMY08ExOGDKtdQ2bUB5yE9y0kbX1Un2tItfVr297EO4kcNztLVueSzy
         FiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f25JLAKyHtV8jvniNcYaG9xMTHVkgpR7QSjcLNQUGAY=;
        b=Lyb8WGIdDH36sScM6/d/EpM+sm1cieUZ8NqvmRm6s5XM6cODSenTBQtE7lNMuw2XWd
         gLJSu1FpP+41easikQFav+xlloN1OREDTu/2Y4j2G0m9kfLqPwfPmMJVUDMTKo8nSDIz
         1NhaDGN6iveWW6oJtmHR1HHlyWkkGjvMuv/Oez/uTojC1r/RG19PBzhCNqxgn+vJwscD
         MxKpGFzLlTSC9XsbF8hn5VIpLYR0mcFw0ZVSBLLczzYVZ1V0rTKr2k/W31bkmFjsW92C
         FBXplXi5aMUI1awcir2N1r/Q2p1fiy4ixf5KBFbnXkNogwexxtfCZAcCHIk9waQ6Ie87
         cUhg==
X-Gm-Message-State: APjAAAVN5fA3/A841uB65KMw5O6X1luE1U62UQNK93X9ebBP30dDm2UU
	zeqjnG2yxCexZ72LHMNL6gGuHDp3J9U6QK1Tp/o=
X-Google-Smtp-Source: APXvYqw5UgCvDdjO02HUj2hztKRPgSxiDfc2+rQe+ueVuY9iv1PYGQjVqViaYsbnlzxPWK8Pb1snnb3P6UcWKrHt5RM=
X-Received: by 2002:a2e:3604:: with SMTP id d4mr6784697lja.85.1561739772947;
 Fri, 28 Jun 2019 09:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-16-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-16-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 09:33:09 -0700
Message-ID: <CAKmqyKMJQMGb_tLShvzWSx-KoaBA7Rq9xXJu9HQ=DsmMt_+62g@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 15/28] hw/block/pflash_cfi02: Document the
 current CFI values
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Stephen Checkoway <stephen.checkoway@oberlin.edu>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Qemu-block <qemu-block@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alistair Francis <alistair@alistair23.me>, Magnus Damm <magnus.damm@gmail.com>, 
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>, 
	"open list:New World" <qemu-ppc@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
	Aurelien Jarno <aurelien@aurel32.net>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: rpy7URUkwWMP

On Thu, Jun 27, 2019 at 1:53 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Message-Id: <20190426162624.55977-6-stephen.checkoway@oberlin.edu>
> [PMD: Extracted from bigger patch]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 1a794fa83c..f1bac480f5 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -550,6 +550,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
>      pfl->wcycle =3D 0;
>      pfl->cmd =3D 0;
>      pfl->status =3D 0;
> +
>      /* Hardcoded CFI table (mostly from SG29 Spansion flash) */
>      /* Standard "QRY" string */
>      pfl->cfi_table[0x10] =3D 'Q';
> @@ -575,7 +576,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
>      pfl->cfi_table[0x1D] =3D 0x00;
>      /* Vpp max (no Vpp pin) */
>      pfl->cfi_table[0x1E] =3D 0x00;
> -    /* Reserved */
> +    /* Timeout per single byte/word write (128 ms) */
>      pfl->cfi_table[0x1F] =3D 0x07;
>      /* Timeout for min size buffer write (NA) */
>      pfl->cfi_table[0x20] =3D 0x00;
> @@ -614,17 +615,25 @@ static void pflash_cfi02_realize(DeviceState *dev, =
Error **errp)
>      pfl->cfi_table[0x32] =3D 'R';
>      pfl->cfi_table[0x33] =3D 'I';
>
> +    /* Extended version 1.0 */
>      pfl->cfi_table[0x34] =3D '1';
>      pfl->cfi_table[0x35] =3D '0';
>
> +    /* Address sensitive unlock required. */
>      pfl->cfi_table[0x36] =3D 0x00;
> +    /* Erase suspend not supported. */
>      pfl->cfi_table[0x37] =3D 0x00;
> +    /* Sector protect not supported. */
>      pfl->cfi_table[0x38] =3D 0x00;
> +    /* Temporary sector unprotect not supported. */
>      pfl->cfi_table[0x39] =3D 0x00;
>
> +    /* Sector protect/unprotect scheme. */
>      pfl->cfi_table[0x3a] =3D 0x00;
>
> +    /* Simultaneous operation not supported. */
>      pfl->cfi_table[0x3b] =3D 0x00;
> +    /* Burst mode not supported. */
>      pfl->cfi_table[0x3c] =3D 0x00;
>  }
>
> --
> 2.20.1
>
>

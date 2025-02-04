Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp274049njb;
        Tue, 4 Feb 2025 07:10:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCNL66Az+WXDbRHNDdiA64AbaDTP33M6fmeFgimYXqBSiPcdCaTN/DFtYfpoxCVW18uN3p64WdZ1vubw==@linaro.org
X-Received: by 2002:a05:6902:2006:b0:e38:9d2e:4162 with SMTP id 3f1490d57ef6-e5b135ce7b9mr3236277276.12.1738681836020;
        Tue, 04 Feb 2025 07:10:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738681836; cv=none;
        d=google.com; s=arc-20240605;
        b=j3flZ6fLuft0DRSZf4IFwCIdvXnmet/tAb+8y6QQIdZa0EVG0kuu/aHqiexpM1oXXO
         D/bdRl/O22fhISHRyNFnpY3geES9koPbtkyj2VIMzmNQEgZm5HaPCRfpj5CFuziUSGRo
         1u0ENBdDpvYgfIpkMpJv9JzdwatTkkZu/+XXXqIssEG3t8guDmMkKIODid8PIoiY5v0N
         5xSxTK5jcXmCi/m9dYrZJcE5u+4fnzG6uT1SD3fg4Uo9pVhK4/XeNJ1uYvEseEdoM37/
         LSsV5KW9DE30u71idqhpvgDu4YOl+PfwGVtfXoEFY5qXlVGJD4lt1M7oZ/07V/h/1jUa
         LMpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eWuGHrcBgE5gWrOGEcMmcRHM4su5sxfaNfpSnxgJY44=;
        fh=elTeciFzBPXinfE1wPtpAw9P0wB42Q31h3ndOUBBNhM=;
        b=LzQP4F8QGgNeWI74pndhNn7sx06sqz6NcQBqd7qUcOLueVZ/PEUG67d+VLcCEdXQHw
         IY/VNklWBEIS3QFEMPyonnjK0Xzui/eclfE4ttICwUND/Z8D103XDpl2EY+Ef0Ua/LGy
         Nq4SaPXMcQuiTq5KlVyEbiPsXPeuYvByhj071s5ozghglbCzp43SRHjWgodlrgQqCUiS
         ivQOATvNxlBuBB/j2UOdjNYzLc4Oer0UMXlzNb1SscA1eRP1mbC8yZn4sCbwu+ZcGRFZ
         ZkLGodCVX93QRF+ZS8GcE0S6by/lxhQA1DGFK/WhghkpmiGp85y6qGkfDA4hOFN8DLRS
         f77A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a1MZd/sL";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5b2213dbe1sor112577276.6.2025.02.04.07.10.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 07:10:35 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a1MZd/sL";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738681835; x=1739286635; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWuGHrcBgE5gWrOGEcMmcRHM4su5sxfaNfpSnxgJY44=;
        b=a1MZd/sL71aJNfM6STfYFeDf73jRZLpmRYzCFfC44RpOliidkaGZhQypOrmsKDcOOE
         /aNag8A1C8/KIXGuGlhhn9PswcnvEeXiKYBujebHXTRC8Jd5JUgXMSQOt9tlixuZ+MkL
         m/HikC2t0ezol8pjfkwGRnITguvqUcU0lFFZiiYR423vQCXKUHoB+e0GJj7/0UVKBko2
         EsQxyj5VrClJ0/Vz6PUaJbENFY0HFV4i4zRRsLpp5RsqkqGno43tty+v3DxKJP99i2DH
         qoMo0lLW9rYkJyKQ6rfTnQgRAuvm//yqLdfC2ybYNTARZvRjlbpciV3GG6zRqjITbviT
         PJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681835; x=1739286635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWuGHrcBgE5gWrOGEcMmcRHM4su5sxfaNfpSnxgJY44=;
        b=U5bn75DTuwUBIqLRpCe+Umc+YmxTejqa+z7J2VpMAM67J8/8CVYP+/XLkMOFFhjZcT
         O+T5QCG+rx/yYj8yO2wF1x1py2wnPwRh1RZ4rD/WyQ1DiWJNqjK4dyTzzKpq7qs9LcLn
         vj8x/2a1aF3Weo8IftV3AXoJZ4HH9FPrWxa5hsuNmKhoTpr3GEkC7gttygZ3jrJH2Ft2
         vDi++7KPu1aBjt3rTu+0yYe902fPyqaf6LwaKffHKSP5SUWPs1ZrfxldymWRAuiIUT9/
         iyLppLDYu61x+aTG8lURZIDX4Ao04gUhofkDWZRv0rEWsjKwzK1N/XUDg+pSrTRujIDB
         Iaeg==
X-Forwarded-Encrypted: i=1; AJvYcCXiCA5mYT7QbvfU4PwKRy3T3UAB1Uquf+35PJwTpkeqbk/diGGHSK4BqNQyuthYDNrGluMDVz1cHgEXSw==@linaro.org
X-Gm-Message-State: AOJu0Yz/k9QzESjGMdA6ai4P5kNLOGBxN8AmrOrdzVwlg5HoL8uEg3cp
	KrPcE6vO2DfWftA7rUpn++9KR2HM0IpA/v8xed6wBOJAFFRbMnbw2bOC3cHmOC79CLeoOW3332O
	dBjJYfOZ26SiWHx+337C+bNj3BJiEEK+sm6T2xNGu
X-Gm-Gg: ASbGncvu0uY06lnHKi23kl3IeQIf8F1yrSLfi7zBvxCHKAA5lw4+4lABzoGPCFYhmUm
	fcJqD0IKM5vk7UelKczu6kGyBWLR5gLCSRrai779O+OESYquSEE6Pj4TbVy+Bi5qHOixXQtlHPA
	==
X-Google-Smtp-Source: AGHT+IFFDOWQ+brIrOrbY2qM/1jbZurjUz5KlsBxwHhSnSsTfLh/iq4ILQrbYGtZTi9eQP8BeKCLNfW0guPl2ilEN3A=
X-Received: by 2002:a05:6902:128f:b0:e5b:1108:2240 with SMTP id
 3f1490d57ef6-e5b1318c38dmr3383060276.0.1738681835552; Tue, 04 Feb 2025
 07:10:35 -0800 (PST)
MIME-Version: 1.0
References: <20250204002240.97830-1-philmd@linaro.org> <20250204002240.97830-8-philmd@linaro.org>
In-Reply-To: <20250204002240.97830-8-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 15:10:24 +0000
X-Gm-Features: AWEUYZkNiNVYYvGzIQpxktw7EIsb5zKYOhOLRKpDlnx_1hsSJUbMWGHSChHySfA
Message-ID: <CAFEAcA_sphbzR9V_dSgR4yP1msNjWTKbXcFi5H5497UUya67nw@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] hw/arm/raspi: Check ramsize is within chipset aperture
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>, 
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>, Jared Mauch <jared+home@puck.nether.net>, 
	Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	devel@lists.libvirt.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: y+AQn8vEMy/C

On Tue, 4 Feb 2025 at 00:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Add the 'max_ramsize' field to the soc_property[] array,
> corresponding to the maximum DRAM size a SoC can map.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/raspi.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 68332fba027..d44277001ee 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -76,11 +76,12 @@ typedef enum RaspiProcessorId {
>  static const struct {
>      const char *type;
>      int cores_count;
> +    uint64_t max_ramsize;
>  } soc_property[] =3D {
> -    [PROCESSOR_ID_BCM2835] =3D {TYPE_BCM2835, 1},
> -    [PROCESSOR_ID_BCM2836] =3D {TYPE_BCM2836, BCM283X_NCPUS},
> -    [PROCESSOR_ID_BCM2837] =3D {TYPE_BCM2837, BCM283X_NCPUS},
> -    [PROCESSOR_ID_BCM2838] =3D {TYPE_BCM2838, BCM283X_NCPUS},
> +    [PROCESSOR_ID_BCM2835] =3D {TYPE_BCM2835, 1,              512 * MiB}=
,
> +    [PROCESSOR_ID_BCM2836] =3D {TYPE_BCM2836, BCM283X_NCPUS,  1 * GiB},
> +    [PROCESSOR_ID_BCM2837] =3D {TYPE_BCM2837, BCM283X_NCPUS,  1 * GiB},
> +    [PROCESSOR_ID_BCM2838] =3D {TYPE_BCM2838, BCM283X_NCPUS,  8 * GiB},
>  };
>
>  static const struct {
> @@ -133,6 +134,11 @@ static int cores_count(uint32_t board_rev)
>      return soc_property[board_processor_id(board_rev)].cores_count;
>  }
>
> +static uint64_t ramsize_max(uint32_t board_rev)
> +{
> +    return soc_property[board_processor_id(board_rev)].max_ramsize;
> +}
> +
>  static const char *board_type(uint32_t board_rev)
>  {
>      assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
> @@ -294,6 +300,7 @@ void raspi_base_machine_init(MachineState *machine,
>      BlockBackend *blk;
>      BusState *bus;
>      DeviceState *carddev;
> +    uint64_t max_ramsize;
>
>      if (machine->ram_size !=3D ram_size) {
>          char *size_str =3D size_to_str(ram_size);
> @@ -301,6 +308,12 @@ void raspi_base_machine_init(MachineState *machine,
>          g_free(size_str);
>          exit(1);
>      }
> +    max_ramsize =3D ramsize_max(board_rev);
> +    if (ram_size > max_ramsize) {
> +        g_autofree char *max_ramsize_str =3D size_to_str(max_ramsize);
> +        error_report("At most %s of RAM can be used", max_ramsize_str);
> +         exit(1);

Indent error?

> +    }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp273303njb;
        Tue, 4 Feb 2025 07:09:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWwcyAHdrd7+2hEfdEIlRV1j9xG5TSX30Qr3Ng76WfnJVjixvISTMZmNiswQsK7VnJ+c/FNvs5qMq3V9Q==@linaro.org
X-Received: by 2002:a05:690c:380c:b0:6ef:57ad:9d6e with SMTP id 00721157ae682-6f7a834ee33mr218352467b3.15.1738681782865;
        Tue, 04 Feb 2025 07:09:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738681782; cv=none;
        d=google.com; s=arc-20240605;
        b=CPVm/DmJDEp8K2srbFL8eNNa6dkZ3Jz+rhBJQqq0y/REl8Z6FTgWUfkgda9jPAoli8
         8s7iJt64V87XrG2HtHBWPVJIInxE4wQHkB6ZxNIorT+bZGg3AtN3JQ+Q//4ZoZR/EdVF
         GKUoaw8UbTUZIoq4rj/EkLxf6k1QCKvGKZuW/rYOS8XOMItmPht4gjrEPt3IMfoknTnY
         GYpE4sj8gJ0pB6f4C9/f3cM16Vr01wSWGff+L0zDVUOuIXmYlJYAuXpS7j13xK4jpTIa
         Ws5YssCAAcJxV2w9aN7DEw6w/hxHaUCPmmfrJ1nofmC5UnSBtxFrkb4qvuCNksR79GiB
         pltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dWNSQGL5aJVYEVZQCGlkPNzok/EZiOoyN3zu02wGQv0=;
        fh=Ckz6t2VdgfZK5a5rST3rQJbMAo7FTMmSG5DtmyAS0pA=;
        b=lSQe0rz63MECfijc6ZfhRy033MDNI0/2MoFyabxtL6qzAvWDDCrmYN7rtT7w0eJWz6
         NdxUjqJwiIeFF3ITDxBi3BtZY9dFNGNHOu/WiO/d1Dl7dZEQrUPd7XpHD5M9ilfcbSlb
         l+dn5dOpI3/mdC5n7FlD03nkeBu5eL04sH0nnlr4OB8IVKeV3ddteECxg3zOJcDMiLVg
         ZltWAHvMkO+iDdQraJfVuJafwd5WWhF4d9TBPUVnJ0nwvvX0Yl+sEQvZ3zxFHMNM7RpO
         igrXGOs3uV96lMsoaBeE3NlyJDRjhRfOBfB/q4s7yqYXrp2TdpYyBFCo2Rbm5XVwA0C2
         4mPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I7ayur1T;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f985f1c14fsor2236767b3.16.2025.02.04.07.09.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 07:09:42 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I7ayur1T;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738681782; x=1739286582; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWNSQGL5aJVYEVZQCGlkPNzok/EZiOoyN3zu02wGQv0=;
        b=I7ayur1TkVQmzkTzV7csPFqTiUenLdrQjkO04y4N/+HboItMjFKNaCvzo/RYgfM1lh
         CFexfGKGu6ID9HPIkCTsT0ZF9RXnUMgCb7JSUu2qXVMhQi+mGZ9puPFvEJAkdXjPW+BF
         zJxkJLlMoCknEbhPz1FY3IZCcV9kc4WKZo1veXX2wZHs+31cRXpt8CSMhh/G9TqtoPgB
         N1d0O6GLnBKlQNMLmuH4ewAAwyNI+I5Ce46BlTmSh5NuOaF7WVgFhiXFIGU2ZwGVk1Gd
         ONPSnDQuzLZZ+YpGdqBFaMQNE5MjnbwOLMSo5MXI8igX+6PDlb8VFxO7gMTH+v4i3dI4
         PHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681782; x=1739286582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWNSQGL5aJVYEVZQCGlkPNzok/EZiOoyN3zu02wGQv0=;
        b=RRXNPWFiTmdV6Jvx5wfRRAyqeElE1pUCMyvsvfLkvJVcfBMZ5dEO4aGnB4ZViuMomc
         AGnlMJl9biPVo2s1Ayp2sWVLzL0p9LdRnGY4qYvExMID7+vSURe1aadT9XXCzBosIU6J
         XcfVXX4ihQeFk6T4z+LqsX7DafOM64EolSweuXj4lMFA5ek/d1SBnQn/2rFv2977AC7I
         I5FVa5mLsaNAAcPnOg2CkPhHIe9MwCtrdr5X7/68rq8dS6AzUmMw4xN9Hmyv3odP9mUN
         J96ydsQYcPxV02qVDwylgWl/AIaA52hwUbGy+ljTOsr5N8chqZxbCX8kfmyRnSLoKZFF
         /H2w==
X-Forwarded-Encrypted: i=1; AJvYcCUMkn+964mBN/LGNb9vJJ/KMdyMW0ez9OHGhtPTCZi59X2LZKBM1ARRqx6ND9+H7ZAa0nmcQmmJQNJaVA==@linaro.org
X-Gm-Message-State: AOJu0Yw25PWCNKBFEDTyu9vAWnbs6rgE/a12ukjDhhTmK8xHTHSd4akz
	8m6UuwpGTEinFg3U1McpcbKdKFxE3mqqigpook6ay+WqAA4Cc2ACMMvOX7r9n+gWYG4wbUiXqjB
	IgFTtMQlvMvho7HAT7oPrLf8bGG5adIf+WGzibWWd
X-Gm-Gg: ASbGncsX8RAgizgWM3/wEjG5UuKS+XNPWDgIy+GLI1CBhsb2GHKnJvx8JSFP/1xXeHS
	qaVuBSWVD5Jc/d84Zevd0+YEgjU2n9wxARRYjuDhfF1GiUcX0jOwzK+vQo8c5Z2Gro2CsFISe9A
	==
X-Google-Smtp-Source: AGHT+IFV3CLZLrcg6yKFRfqJpKchyZ+s55CDDOdvQ/gFRpfuN0lQJElqAB2GNFgl+zJCJD00LNfzMD/d+OQ/9orlcS0=
X-Received: by 2002:a05:6902:c0e:b0:e57:2e8f:b682 with SMTP id
 3f1490d57ef6-e58a4ae916fmr20177983276.22.1738681782386; Tue, 04 Feb 2025
 07:09:42 -0800 (PST)
MIME-Version: 1.0
References: <20250204002240.97830-1-philmd@linaro.org> <20250204002240.97830-7-philmd@linaro.org>
In-Reply-To: <20250204002240.97830-7-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 15:09:31 +0000
X-Gm-Features: AWEUYZmlqKw2QuC9sIS36HGrtHZoqOk4Aq0vSmGaRqN_5Mc9jW2YfXvm-rWnzsE
Message-ID: <CAFEAcA-YXwa9ZQWiV+nBC2p8chq2NkDfksiADNh540nLZYeMCw@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] hw/arm/raspi: Consider network interface for B models
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>, 
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>, Jared Mauch <jared+home@puck.nether.net>, 
	Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	devel@lists.libvirt.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: DljoOg0aNScQ

On Tue, 4 Feb 2025 at 00:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Raspberry Pi 'B' models have an ethernet chipset (the LAN9512).
> Since we don't yet model it, add a /* TODO */ comment.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/raspi.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 1a6a1f8ff22..68332fba027 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -143,6 +143,16 @@ static const char *board_type(uint32_t board_rev)
>      return types[bt].model;
>  }
>
> +static bool is_model_b(uint32_t board_rev)
> +{
> +    return !!strchr(board_type(board_rev), 'B');
> +}
> +
> +static bool has_enet(uint32_t board_rev)
> +{
> +    return is_model_b(board_rev);
> +}
> +
>  static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
>  {
>      static const ARMInsnFixup smpboot[] =3D {
> @@ -304,6 +314,10 @@ void raspi_base_machine_init(MachineState *machine,
>                              machine->kernel_cmdline, &error_abort);
>      qdev_realize(DEVICE(soc), NULL, &error_fatal);
>
> +    if (has_enet(board_rev)) {
> +        /* TODO: model LAN9512 and wire over USB2 */
> +    }
> +

Why bother, if we don't do anything anyway? We can
say in the TODO comment
 /* TODO: "B" models have a LAN9512 on the USB bus */

thanks
-- PMM

Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2484614ejs;
        Fri, 12 Jan 2024 08:41:41 -0800 (PST)
X-Received: by 2002:a05:6512:3a81:b0:50e:7bf2:69 with SMTP id q1-20020a0565123a8100b0050e7bf20069mr983790lfu.94.1705077701566;
        Fri, 12 Jan 2024 08:41:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705077701; cv=none;
        d=google.com; s=arc-20160816;
        b=Z9WosaSaPJKwlU+bzZe6BY/WIkMZCA8xZlpd9cgqIHGLAqM1YXwCGkAHs3OXawPGhq
         UWFojy0dGpmf1M5U9XsJPJVJIiGYks4POarLXjyhj+ATUgSiRXBoocxUkszm0rq41xGV
         EvF4lE7hjq9H6/JxBKNsrwraE9WUQET6aJkqWSBHjkFmUMo78e3Ykhrayiwj2xJ+DJl1
         fKxXpwUOYM2douJf7K5BYLvQSuGSZzQz9ur3nTB0mDdo6zzSA8hs1MsW1w743N0Cq6II
         HRclm80H6TGw/NqS53++J+OTqalUQGPG+rYrq6FiVopjrkAQdD4leMe8aveXKhcaKeRx
         ZUZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BEFF89OwKim9bxIDXoomIIhBg+ts+L6z4md1sRy870k=;
        fh=EJlKFvTEXeBbatWu+S+2owffZOJ22sl4ViEmjlBrVyM=;
        b=qCaIY93CbV/ToSWRgvMAxnNwBEI92jsktLEW8+7eLTSdAhgQVugirn3cW7st8zh/Ms
         bx5M/3I8hCrdJkDdutTBryOkiwnucxBVe0CPkAYOEw/mq9d4PM0DtaSEnGMf2pm7r6WO
         pdu4OSySZ5cH8QH8v7/UgjMUAeKfUWrql6EU9Z8eyiWTPRZC3XaSY11N4+DwPOGqqJY2
         vrXgq3Aa/YRh9pQT0HLDx1+V6DGKJsh8fYoCMyXjk1Q30dopdKA4I/1eH6McZJWrLWlz
         LsQjnOO6Gkt2VGiBYo4Uf6t1hcmu1KibxeWU7m3Vxq4GQgJzixb/wymShcPQTViEMgQR
         3t9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NjaOSJjp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x26-20020a056512047a00b0050eb36c135asor894561lfd.18.2024.01.12.08.41.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 12 Jan 2024 08:41:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NjaOSJjp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705077701; x=1705682501; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEFF89OwKim9bxIDXoomIIhBg+ts+L6z4md1sRy870k=;
        b=NjaOSJjp8QfR8hGoGJDtiaZl2iehfwDnd5iHohxGMzKHTOBR7HhOb/PIQ4KrXUTbEk
         Sb1kSXMZn+oFDPUx7T89ADAafmRcKHcQt154j9l4E9k2mHMELBsA0INH/EDEBjj5jeyp
         87PMdebYLf+22pUy/FtaMKaTLINrOlAk2kmek9qy+MxybYHTr3cpXKclQ/kFiAePRObM
         ag0L2kYQz1u0dyXqpsDJrZwSTyL6UR/HgEO6Sx83B3VU7vEm0yIHel1ykq3Qsp5iZvUc
         qJfjjrSyB3bPilWlqQUC0oE9hjMWNB1k+Gayv7AwnH3hAucWb7568qjjkktIGp1WoV+/
         wdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705077701; x=1705682501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEFF89OwKim9bxIDXoomIIhBg+ts+L6z4md1sRy870k=;
        b=QS0NH9xs9Nlz89ZeFMmS1NFJg9PBeFosM6Otsv3ccDhW5lZGvguyj7tlE0RGvgKrRF
         DuQfeTagPpdBeQ47wE9lOy1eWhjqvkX0VSLBahAR0vvTKZp2RSHaXYfP5ixe9GylcdgQ
         GbMcldcnDNND1iR2DQL4q0rVCT4gD3AX+XJ6QndHaOCo4URAGFBMPPbTUBvZ3kgVmL/5
         uXFmMmLC1eCPNu4kne3Ipq4pWVvhB1Mfo+VtjtVBz1R3q2SJCo8h5sV7Cx43Hil2ZecT
         n1nPKBHFPrtprtIgdLl5yuYzweMb/1Q9vR/T6YpFzEeFFyu836agJV+ielV/YWln8wMb
         cJWA==
X-Gm-Message-State: AOJu0YwhrW6yz91352bRceSkpSNILJ8wWLziqTgthO5te3RmpaoJv/OW
	ZkUB8nJk1VW6t8yAUm3opVptDVtiP0DSUG0O2Xzfp3svkccyKUNY
X-Google-Smtp-Source: AGHT+IFWMfKEiJsqRmc2ekiDwya6XdYRUPze6mpsYCQFgZmzYlOBo+7MZfKmRu/+/hab5VSHqQsOJsMrZALMhW5mrc0=
X-Received: by 2002:a2e:8013:0:b0:2cc:ceb2:372a with SMTP id
 j19-20020a2e8013000000b002ccceb2372amr804945ljg.96.1705077701104; Fri, 12 Jan
 2024 08:41:41 -0800 (PST)
MIME-Version: 1.0
References: <20240102160455.68612-1-philmd@linaro.org> <20240102160455.68612-5-philmd@linaro.org>
In-Reply-To: <20240102160455.68612-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jan 2024 16:41:30 +0000
Message-ID: <CAFEAcA-qyLf_ACX-pD2nR8h+EcipqK_=re05wmBJBa93AOeg_Q@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] hw/arm/armv7m: Error if trying to set unavailable
 ARMCPU::vfp property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-arm@nongnu.org, Luc Michel <luc.michel@amd.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Eduardo Habkost <eduardo@habkost.net>, 
	Frederic Konrad <fkonrad@amd.com>, Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: iKLPU+fcgwIC

On Tue, 2 Jan 2024 at 16:05, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Do not ignore impossible configuration requested by the user.
> For example, when trying to enable VFP on a Cortex-M33 we now get:
>
>   qemu-system-arm: 'cortex-m33-arm-cpu' does not support VFP
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/armv7m.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 3610f6f4a1..12cdad09f9 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -328,6 +328,9 @@ static void armv7m_realize(DeviceState *dev, Error **=
errp)
>          if (!object_property_set_bool(OBJECT(s->cpu), "vfp", s->vfp, err=
p)) {
>              return;
>          }
> +    } else if (s->vfp =3D=3D OPTIONAL_BOOL_TRUE) {
> +        error_setg(errp, "'%s' does not support VFP", s->cpu_type);
> +        return;
>      }

I'm not sure exactly what this series is trying to do, but
this isn't the right error message, at least at the moment.
Our Cortex-M33 model does support VFP -- in fact, there's
currently no way to turn it off, since we only expose the vfp
property for AArch64 CPUs.

I think we broke this in commit 4315f7c61474 last year,
accidentally restricting the definition of the "vfp"
property to ARM_FEATURE_AARCH64 CPUs only.
(filed https://gitlab.com/qemu-project/qemu/-/issues/2098
to track that)

I suppose if we fixed that regression then the error message
would become correct again, since we'd be back to exposing
the 'vfp' property only if the CPU did support VFP.

-- PMM

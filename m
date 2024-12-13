Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp532596njb;
        Fri, 13 Dec 2024 07:37:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXtVVBE3UqFrrk6ePPC6t47sc14ZKgjt38ikFUJbNmDfcfqNTtItBjhy37Kirjaid7WOuBkyeNvocIZ3Q==@linaro.org
X-Received: by 2002:a05:690c:4512:b0:6ef:9dbe:9f82 with SMTP id 00721157ae682-6f279b7c5b6mr32137527b3.29.1734104236485;
        Fri, 13 Dec 2024 07:37:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734104236; cv=none;
        d=google.com; s=arc-20240605;
        b=bMDN6Dq8SjxOkJxbUVN8dstWvnCVha+TDbgHMPR+wlpfumb+B1M36XzPOZlEwrxZrX
         t4HzywnBR4ODBfo6KhbfGThEri8249vEKOdaBlMZG2ZP0cd6Ps3OQUPvGGlHOlzzy8op
         h4531dIy+xR7YGt72yc2texmsaTooHhxct5FA5lWfQkuTAvyjuF87QSGOAhN+pEhys6J
         7I2lmj64fFax8HxhXzN8JqlOSmAN4elbvzfqnGhnish5pcVy4FZI0XzmCMmiLmMxAXlI
         xyR9Le0EWNWhZC5ugSTmnioYsF3ncJsjB+D3h2Hna1iMV5z3kA7EqYE2z/GZlv7PC4dT
         YFKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TSSAiMXN2YjyBddSL7QadCKvy86NxvQqg4ACDVITRV4=;
        fh=CAY3PWeCu2CotbF5x87dbajwfzlgnKjY5OAgYnp4X6o=;
        b=ALzTrizmZZpCyqdTrkUpD8J89ugTv+hudwBwvBOU1lgF/vlOGy2Xh8yPZLivW1enKZ
         +MHwvDZO2QzKmT2ZNofnRWGb0UgxVRWrS2QzD9XtdFXBe3nyZJMrqxl2fycITKIdu42m
         77F5ja3ykk7xyYMFQFSuphuG2PaEww+fHnTPqHmRgp7pdUd7HZRiq0K1VfqPzbYDe1r/
         m4FIoHQvWS8ppBVWue/yod8mDCmDXfoe9aVP9Jty8V4BEzHVxPdBgHZyo+p0QaK3A7Dc
         SgEITFY9GhrCAZRCg2vHqCKE42sa+DPyUnPmC5qEaz3912s9PxNuaPeBEyU/JVWn5nPP
         NMEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j4dgqtOD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f00db4aad5sor85773187b3.16.2024.12.13.07.37.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Dec 2024 07:37:16 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j4dgqtOD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734104236; x=1734709036; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TSSAiMXN2YjyBddSL7QadCKvy86NxvQqg4ACDVITRV4=;
        b=j4dgqtODw1naDbuvu3b4RsYVtKY0YYXg/ekbds6exWo0qHye6KM2t59Rz68dalfo4w
         hkbeGsaxeBRGpsJNy/sO1ooOBILsEmT9RGBetlvlUA2m2+SaJq6yNWARoiUHyILq2AcH
         K735n8MYu0vCFbO7g5D1Kyofy2/NuQRI0eaB4PENQepCmxcCPbpRzVKU4z2KBSa78T6y
         W+h7NnWToon8N+ciZH3szEM3A+oRpulc4ySDrhnWJvfJaliBnwUmQXES9acSJQ7D39oR
         l2ihcbVipq0hiofZ/z34nvUq/dhRagbSYf3oHvW3hqsgAEGsK0+LU/l2SlroNzuGWCD7
         neiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734104236; x=1734709036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSSAiMXN2YjyBddSL7QadCKvy86NxvQqg4ACDVITRV4=;
        b=TOUl2Be/57M4Plr0x8U9lanpwAnWR2yQoqq93aQBbc/16+NQLYTmi+hGXbK3BrMGER
         +zTjDhz0/uUST3WEmVXtfxdYqLVcT92E8Azei6jB0kENn4xQu+bzXSuWPb4aAL6TsX+T
         oE24Ul0tE/wdNccNJ7qBHqCVgWP9m9RvKHgholBw1Vh49vNnulcbcpZTVScyY5dN1vYW
         nm937J6LDdezHx68UrnOHSSCww1wsrFvJ7RsfCUMfpnSEpbO4amYYLbmi0kh9rchftZv
         LU0Sa7uHIcEyISG3FMggmCY5Oi+Zgl7xjSQ03PikxubpEgMc25JUxOQ4Jeik9YenCsWe
         LD+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaS8D9YDh300fpTDSUEjFj43GwxcYLV8QF5PwlsOTIVyzMPY73F2jasigrwFrfO5qi5nPIlCt0f/rZGA==@linaro.org
X-Gm-Message-State: AOJu0YyuvxpPO1d33N/q2RyFpr+WGAAJt83+dXCmyfpOAwqpo981PqIX
	rsHfuklOnqiyIJFA+yy4VXdRc9AZnkWAiV7wq5mGRswNf20AP+RyIJYeFQW/3krEX2PBdBWkQr4
	r0DguThmSJLpyxbrRptwWNBewu8sT8dENpW2bw2on
X-Gm-Gg: ASbGncsR8AgMdIkRE/rzXwQ65dtpfhC/xcutDGGbUusOkLcG5RDc3lR38NYly56FOxa
	7PIUZkEymv7kKz1Yo5tVC98dMhzOl9YTgT9AU03o=
X-Google-Smtp-Source: AGHT+IGwYw+BVOtoKvLgesairME07vmlCK2orfbln0yGma2TUjxCY5VrT5E73IZkPq7pXfV7diZJlbpdkqd8H7R78VA=
X-Received: by 2002:a05:690c:6212:b0:6ee:7797:672 with SMTP id
 00721157ae682-6f279ad1782mr32086977b3.7.1734104236159; Fri, 13 Dec 2024
 07:37:16 -0800 (PST)
MIME-Version: 1.0
References: <20241206192254.3889131-1-pierrick.bouvier@linaro.org>
In-Reply-To: <20241206192254.3889131-1-pierrick.bouvier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Dec 2024 15:37:04 +0000
Message-ID: <CAFEAcA8TKyEJrPcNz3NOzv_LOkh9ENKiyMtBgDmH+xdEwZBqOg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Minor fixes for Arm documentation
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Troy Lee <leetroy@gmail.com>, qemu-arm@nongnu.org, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Jamin Lin <jamin_lin@aspeedtech.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, 
	Steven Lee <steven_lee@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: S3R6Lzkus7uC

On Fri, 6 Dec 2024 at 19:23, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> Reviewed following things:
> - system/arm/cpu-features (options)
> - system/arm/virt (options)
> - boards documented and listed with -machine help (arm and aarch64)
> - grep object_class_property_set_description hw/arm: ensure all options are
>   documented
> - reviewed boards description
> - reviewed all Arm features (FEAT_) from: https://developer.arm.com/documentation/109697/2024_09/Feature-descriptions/
>
> The Arm section of the documentation is in very good shape, and this series only
> has minors fixes.
>



Applied to target-arm.next, thanks.

-- PMM

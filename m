Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp272463njb;
        Tue, 4 Feb 2025 07:08:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXpqmd9dJcj39736lcxOZuq3gNBB6YglQtws0OEaBF6RFp0R5GaiYyvyMrHEtmE4tLSor5CPsiZZUqpSg==@linaro.org
X-Received: by 2002:a05:690c:6d07:b0:6ef:7d1e:bffd with SMTP id 00721157ae682-6f7a8424acbmr221848477b3.37.1738681718948;
        Tue, 04 Feb 2025 07:08:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738681718; cv=none;
        d=google.com; s=arc-20240605;
        b=RB8AXIgeFoAc2+13ICAyKzgv/lfGGYksk0Qpp8BJZ4f2W3tHTPOQt9rX9xuYW/eApK
         V41uRyFlM5bw1BI236FiiAZ+ocjW2o6QLa9v9grj9ursJJWNaZ+5aWbKWD9NFlycQuq/
         oaTHD8GtqdSA83B68Tqf0F4pXx9NW0nJFR2JHvokx5TOhVfCStgps2Z3ZMS6G9MOHAlY
         EDFnYhxJKBX4kPaMQzIDUahwbtBLxF9jNLqXVcmL/fWvnZDEkc7x/G2tRdmSCARij5d1
         NxhUfsUoS6bRgT6TezkRfQPC/tnQAMwuR3xUtioU/T4RHAem6Vf+2xCu7NSuDMyZxoKE
         byKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x8PytlqhHLULq87UYWJlTlSEDli7Ujv2u27vNHepCtI=;
        fh=KzZ2QgfDTDiU17zdcYpnUcqs0X99nTvY3DiIrRaGX2w=;
        b=KChKQu4jwegOHWxZUQSjJVpc/bmuiGykDa3yajk315Kg28niJQKDv8TpH8x1lVOzdB
         7WgQJAqA56ElnIFui+jINXSsS52G/jj3F6w0eScow83wDGFR1vk3d45m/6S00QpuY16H
         jwMY/e1lmDezwJ2LmHRoZsah8abGYi2Gk/DZZ6oitdGbLy1ZzgwfXkIxAVVpRHHWvmK/
         cS1PZhr3U0M25ebKbfE8QTsKT2OuMIa9RxQXdLINLeFXdm7UBWui45qDtnlu8iB2g3LX
         go4OVKKYfnXuKdPtDLVxf45AenEE/vwYV5VeLDzsC2u4SyplxFnNOg9M5VGdmpsOyv6d
         YDvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YNT0L7Nj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f977120d8bsor14735747b3.13.2025.02.04.07.08.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 07:08:38 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YNT0L7Nj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738681718; x=1739286518; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8PytlqhHLULq87UYWJlTlSEDli7Ujv2u27vNHepCtI=;
        b=YNT0L7NjkEPylwHqgvTCOW4v00Wd/dNwZ4X64mhV0OHni4JRtMrPXB6odzPcatpp6L
         BfoUvCjuVGC0EFC2NbW3HXF34vWCs1I5AdOapJuSOF+PjE+6EMcRWgqWZ04+k1KLyr3f
         x4WkWkdzbOPgD2ryVq5ppk6cz4E5GxLI4AUXUEnTliJh0A0my8gSIHamlXog+eqQI834
         vGwHJ9WFHSqiipXpwOTj+vU640bTmjfZNgk0Umer8aUfeMdipVZSoEJUZei58j9hSiwA
         s57w3eKajr4gxmG/byU6jleYq3Y4zesKbZT3Bi7bX1i9Dq9LOthYZ4b82RQbKvSyZ7tl
         Myvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681718; x=1739286518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8PytlqhHLULq87UYWJlTlSEDli7Ujv2u27vNHepCtI=;
        b=a5jxD/BZ5jFDoGmuejFAx3R3mB/fifKeMoZEn/ShXi6TrdHpnVmLBm42As1XGrhD3X
         vcudWtiah1WJYklEWsIJzWGlDc2HvXXoCApZ5oL/YE7Xkjw/fO2jYAATvygaRi1COK9w
         BJiAtIaHwsFyAxLd+CxNwwgk3IilyH53GdUYpXuvd67QWIvig66QCaANwa4kFLD+sfPo
         cPgwmmbOcFmASNoqcjU/nNIG1OmETYKTN+gBCt+Iy9h+5zv5Hz5KgeEoHRcyEce+88fa
         1wBJXSxBvjka5BeDybiwctGnIS1pMbrYEpUXKabkb+FZ4AHj/tEkH5/vEvrw+/S8nf4p
         JCyg==
X-Forwarded-Encrypted: i=1; AJvYcCUyX6aqN0J6Mvn8WXc6kXp4YI1pbA/Q6ouKOEgnJGpmVRIs+wEQu7sKw1BtvEeYDuvmo4P78p9bpkqW1Q==@linaro.org
X-Gm-Message-State: AOJu0YytDzL4OfiaBdr4ZCQc4P1bgO1v+7B7THS6KqRPQObhMWssVr1W
	bQrbyJObFDYVTg1Do0tSP4DHNtgXv5JdMwdc1eV4kdvFJrIZSZSFCbmZXuG2wDFxuoaz0GjV1jH
	kuFX0Jno5sZncsjOuOYJyXNoW/CFdZ2WzKJDtfsLx
X-Gm-Gg: ASbGnctGan/AI8snWUBvTJeYOygLbMxYEw3ZgPC+Q5iGoi9ikLE3AW2nMWLG1ZQPrOm
	A5vZ4T09cZeCwKPsnDCmHkiWCvsjm/FG8vFC4oMwNjbrqtHj3/r/XRvMZ3voCI9ixoenvxBaOeg
	==
X-Google-Smtp-Source: AGHT+IE7YAOvh2lU0RxDcDVz8ZP2w6hvhd11Qzh95CIurf0+u3yXxCQ4hKnwi1SXjO5BGpTWTIOu0AJ05dG05Bb/lB8=
X-Received: by 2002:a05:6902:2089:b0:e5b:233c:18c with SMTP id
 3f1490d57ef6-e5b233c031cmr9746276.7.1738681718524; Tue, 04 Feb 2025 07:08:38
 -0800 (PST)
MIME-Version: 1.0
References: <20250204002240.97830-1-philmd@linaro.org> <20250204002240.97830-6-philmd@linaro.org>
In-Reply-To: <20250204002240.97830-6-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 15:08:27 +0000
X-Gm-Features: AWEUYZmpOc3Td8urmScwPSNFypD6MR5pMwL1WXgOB69yu7GxOK3fEA1V33SZj0E
Message-ID: <CAFEAcA-KzF2iEhxNqvEBkgg6qUrnuBJZR_tEUG8Zu4qrrcdQkA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] hw/arm/raspi: Consider processor id in types[] array
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>, 
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>, Jared Mauch <jared+home@puck.nether.net>, 
	Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	devel@lists.libvirt.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: jOsQSKIlupo1

On Tue, 4 Feb 2025 at 00:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Expand the current type2model array to include the processor id.
>
> Since the BCM2838 is indistinctly used as BCM2711 (within the
> Linux community), add it as alias in RaspiProcessorId.

Can you explain this in more detail? Presumably the hardware
itself has whatever ID it has...

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

-- PMM

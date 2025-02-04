Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp270944njb;
        Tue, 4 Feb 2025 07:06:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVj5MOmjsthJG5qOXYT5D47ER2u4IQ5Sso7elCsGRTpKBpasGR4HaOFCaBJq4O5iHuAojsdxhj6mGT+LQ==@linaro.org
X-Received: by 2002:a05:6902:2605:b0:e59:a174:85e7 with SMTP id 3f1490d57ef6-e5b135f6e90mr3382432276.17.1738681613168;
        Tue, 04 Feb 2025 07:06:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738681613; cv=none;
        d=google.com; s=arc-20240605;
        b=NDXjNZDLpyr2sjX30pf9b3IZM0Fp7A5FeKJcHFg5vs19/a5QLoQRGz+SpjbW+9sNIa
         GFKX55hEK061QBi5uxv5yQmYuNMUxzWE0as4OUCXPNOnUk1stalvpxhsXgvSnPAHmw9V
         ERK65GgA8zsmYUql2whIkiQH4RayIQ15pPYDRxNgJElqh53NqU8Ur/yl/2aVVWTw9YXl
         sptP1PInDr0ULh0LKeMCZi39OLDF066+nn6jpo5P1gRBpzrfxMUZCG374CSkvcDme7/4
         ioGOdPX250swnT7gpNoxbTgRILv0KSIqkWqt3oAMgItG64inUCmXvTvQM+dVpS8ByMkS
         E/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DvsUuJWe9RvhXqA747nGDaYATpe2HmzJ5+xRgOBNDec=;
        fh=h7KcSMET5GoL4WrHL2vou1KDC2o3Vgs6/S+p03NqEi8=;
        b=AUdkYqh/XrBwTUoeJL4VOrekbdc5uoLrUAN5Z/3eaSmsCKGs2CQ7FXlr2gQN1+vnSb
         N4LSoanCQMEG7fIMb6H0WkAXcBbsxADyGI6qUB3o7CEyD813KUJ09UMtEeOITyeATyBE
         RhSEbh1gBEUEy7c+1qCao1ykEJcTSmqlM//pU4zbYs6hLJYF9+HG0SVDvaa0YIXm7t4R
         m2juDdGwL4+wsOtd3ukPFAFQ7r5+xoHBZsN2Db1AGlxFKEYplPYElTkRlOeOT2OokLnh
         St2uyFy93Ku8fdY89YP/3ywSszAWEJ0LMHtInGxgjrOD9EmSZ6t76ht7+V92N7xFEdRW
         q/Kg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G+K+nFZz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5b22015c0bsor205381276.1.2025.02.04.07.06.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 07:06:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G+K+nFZz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738681613; x=1739286413; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvsUuJWe9RvhXqA747nGDaYATpe2HmzJ5+xRgOBNDec=;
        b=G+K+nFZzmziW5GVw3hF2YtsSRv0oZKEcrxPyJRn75br3KXdy01noosr8ZWsvpCkbhY
         Abi/s+NHtQnBoq+4VTfJ7swiVqBS/fg9hTWNPM6d70bvQsQHDD4zO892uMB+Iqr69dBl
         bMMTq0ZpX8+yHPh0ot0P5fdVmCpT6ltOAII0VBitbXnl//l8x8TYig1Eu7dKJN1o8/Ek
         JYScKtJ/jkKB09E2aeViJsddtnIXZYFueLTTfkoht/Oc0xEUNx91zfIyoFDJA3rYexIV
         ryadvRCT/KebFoQaZsHyNinum/LP/srQctbKmrdrMQsuTIPI5JhZKF6JnkHow6odTa4U
         p+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681613; x=1739286413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvsUuJWe9RvhXqA747nGDaYATpe2HmzJ5+xRgOBNDec=;
        b=Z+o8aB+Hjfu9q4gs2NEdQelXMzcjyxoA7YfTkGNVkb7G6AtXE5CnrQ2UZss9tYxja8
         8CygAaT8udNQ1H/VoJfDpUCPK6lIkx7/3fnpI+BLVzNg1DEU/CenfF4UVyLATMtIYnSv
         f0wQa0PO/XAnrQV2Lm2ChFb3QwoLBkBiqu7wUZe2zgapXzT0qwx3C6jnDXYrzM+if6+H
         ogg0NFJ7y2Rk9xeQABPnY5CK6oSPFBulSks2GIeFaa+ASji8OMpdA1VBvDKUsxHvMFeR
         wjA/EDYqzvNsfEYAFcGby8k6DVL/xhs9rh6fb/c+38elywFvzq2qDkhrlaFeZDis6BLM
         Gi5g==
X-Forwarded-Encrypted: i=1; AJvYcCWdx6rga4JO1ATZhEnBPnwkbYscSuPa3Z9DTI/A7AajF9QsmvwOX31mmefB1GOkjeFxtx95fVknw/cNAg==@linaro.org
X-Gm-Message-State: AOJu0YzuWBPTUK60kgaiDYPjmdXdCO4HBTdRX9EqOszr1YZ1DNEEaeJE
	sVBnFRISi8EcdbzchTaOdRF/W19Ep33JwROEnH90mJN6X60+0ehh+aroa4F/UKXkirc74J+kKXp
	Sbm3GfKQtXZiPpeHZCdpjabgm59xnbaobhJo242kl
X-Gm-Gg: ASbGnctPqkODEJTbThTsKM7Ekq/248QwGlCyy/PyLDUnG2iuaQwVWj+opFpirXXc+IU
	M7vP7EexX+ZOUwVTA56MQWpTwC8lPtTzXVAPnYohXDBTIDvyKrSUUubTOs4kxkMSvmI55fMSITQ
	==
X-Google-Smtp-Source: AGHT+IGsjl3ZXwFhDzzL3TR7GiZ5aZhSsdWVUdMkA40VfGIaKQvcRftCjN+55wrCC2qrBvCBxOLQRolyLNO14fhr68E=
X-Received: by 2002:a05:6902:2481:b0:e58:55be:b0ae with SMTP id
 3f1490d57ef6-e5b135baa29mr3250832276.14.1738681612724; Tue, 04 Feb 2025
 07:06:52 -0800 (PST)
MIME-Version: 1.0
References: <20250204002240.97830-1-philmd@linaro.org> <20250204002240.97830-4-philmd@linaro.org>
In-Reply-To: <20250204002240.97830-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 15:06:41 +0000
X-Gm-Features: AWEUYZlJeSPpkEmY8V_OFRFE4QwuMGfbLvKpvxPfi8-motuDR53oUNLUaclNfgI
Message-ID: <CAFEAcA_81PfM3SFTXEgj3c2yBh32XDwbkosM8z+qBY2ZZb2Akw@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] hw/arm/raspi: Unify RASPI_MACHINE types
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>, 
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>, Jared Mauch <jared+home@puck.nether.net>, 
	Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	devel@lists.libvirt.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: qMX0TRnw9bR5

On Tue, 4 Feb 2025 at 00:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Merge Raspi4bMachineState within RaspiMachineState by
> using an unnamed union.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/raspi.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 3fa382d62ce..ef94d57dab5 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -38,9 +38,6 @@
>  #define TYPE_RASPI_MACHINE  MACHINE_TYPE_NAME("raspi-common")
>  OBJECT_DECLARE_SIMPLE_TYPE(RaspiMachineState, RASPI_MACHINE)
>
> -#define TYPE_RASPI4B_MACHINE MACHINE_TYPE_NAME("raspi4b")
> -OBJECT_DECLARE_SIMPLE_TYPE(Raspi4bMachineState, RASPI4B_MACHINE)
> -
>  #define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAG=
S */
>  #define MVBAR_ADDR      0x400 /* secure vectors */
>  #define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
> @@ -49,15 +46,12 @@ OBJECT_DECLARE_SIMPLE_TYPE(Raspi4bMachineState, RASPI=
4B_MACHINE)
>  #define SPINTABLE_ADDR  0xd8 /* Pi 3 bootloader spintable */
>
>  struct RaspiMachineState {
> -    /*< private >*/
>      RaspiBaseMachineState parent_obj;
> -    /*< public >*/
> -    BCM283XState soc;
> -};
>
> -struct Raspi4bMachineState {
> -    RaspiBaseMachineState parent_obj;
> -    BCM2838State soc;
> +    union {
> +        BCM283XState soc;
> +        BCM2838State soc4;
> +    };

Do we have any other examples of using a union like this?
I think it's exactly because the components are different
for raspi4b that it has its own machine state struct.

thanks
-- PMM

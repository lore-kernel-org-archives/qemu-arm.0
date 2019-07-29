Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3132808wrv;
        Mon, 29 Jul 2019 06:06:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwdzS36Cp6SjCVMSMQP6HOQR6s+bjwDUwpfJnkH8cHlYzfvpFHwwJ2DwcZ8dJl577jXbRC7
X-Received: by 2002:a0c:f482:: with SMTP id i2mr79618261qvm.233.1564405565432;
        Mon, 29 Jul 2019 06:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564405565; cv=none;
        d=google.com; s=arc-20160816;
        b=oYUTEjQd+012gPwqztBgR0B65ptZfaNq66WpD6Jqj5NqKg2cJ+3hIvMImq7D3QWBGS
         oyCL40VdfzIKGxo9GCAbMPzWkLpPZ5UtlrqGBxJ6v+0cIG2vtiksFGCWIW5s32mtZ9bk
         /kXqSjWzxx7CaegkFRRXy+BIDhweWfxdIR8EJLSCMF/C0B/afxm2s8Nx2+9taB8rUgjk
         MR1FjPwVXb4YM9g4Q3Ue5fufReFMOgLj0qVJo8uMZlndPyUV4xF2qWJjPdmv7iBqbVFN
         oJhVoV5hPLnOmaL+WUCpRTwCITxTFVWCCxmHg7izVH9SvHmSCBOBOx1UortUg4iWis+l
         itMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=kHVhYfic0Bhc4iWY4yeO10UmswtGAufpQP2HzCG/LmI=;
        b=GgKNxVWW+rjecJLiTdfIVp0/R1oNYEzcIBEaNg8pQmCAzgVbRIjciKiwmwBcaWis11
         3ZBuSnNWwnumSpQ/2Lz5YviCDS6TAfhlIRrzOzhGp73rBdbwFDPMyS1PuE+xH1fAYUxR
         vEI+LMR6hTUUbvdWjjKdj/s8uhqYuu/Tut6sD0EowrybtV7F7jjtNmhXZjlSuYKwxVZD
         fNivA/dPY4r8OFcBWdBNZ5wCG2pZK/0sQsZWo5FI+wWXE6jvPUSWE7BPRTc0ulUbqTJw
         E3XsPUzfjJzu+XBY01HUbFtY/eAt86MFGEN6pQnAFNoV4nVBj4+WhxQBgNThC0VnrizW
         O0SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UpdSQ9V5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19si40198869qtf.27.2019.07.29.06.06.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 06:06:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UpdSQ9V5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hs5Lp-0006k6-0o
	for alex.bennee@linaro.org; Mon, 29 Jul 2019 09:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39761)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hs5Lh-0006ju-Ux
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 09:05:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hs5Lg-0006El-Fp
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 09:05:57 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41100)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hs5Lg-0006E1-98
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 09:05:56 -0400
Received: by mail-ot1-x344.google.com with SMTP id o101so62429240ota.8
 for <qemu-arm@nongnu.org>; Mon, 29 Jul 2019 06:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kHVhYfic0Bhc4iWY4yeO10UmswtGAufpQP2HzCG/LmI=;
 b=UpdSQ9V519tUHFE192qV05YHWK0pOFETq2Q0P41un3Hg+/TqRGu0Gu5SOKLjY63lr7
 Ep9XA6R+qUHExmgvdGNMmG0fIwi/mSSCxZmFPuQj7Mztc0rCXWFowfU3ftGxS5ejlLp/
 87fC23CiUgjc9LPyXFSAZIDPuRX/GdqWyun9muhIykAICa3CYdUfkCfsYzf5F0UI9Ze8
 4pp8txIpzmhfD/7qj/uXPvpLW9uMctKxJ6OaSB1rgcZDsioAXZNqzOcFIMaH1ToAkVkU
 fjG/RqlPrtcfvNh0nH8tjgokdOWcceNJ1YhC20QNX33yYY3gGxtUWLzfbQIfOGOUXQJS
 sd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kHVhYfic0Bhc4iWY4yeO10UmswtGAufpQP2HzCG/LmI=;
 b=RcwvhsXfWqZEgkt4vbp+xzu98Xjm5gnYH3GCruVcPkhOHdHCTsCcHHKVEAYV9v1DN1
 Kc3k9QKTk6axr6oDZbBN1u6Wl5UZxqOdEhCAgIG4L9BjUue8aycw3kW70FFLXQYvOnyH
 TKyfd0QXM/hKZoano5Jfp3Z9sk+rHxeNvQy8cbvrpGQcxEdcQM3tccSdoQfmYSF79D74
 frf6HO8uFx6p9C5LNwEgJ4NP1RjZCzzCNkoMlQDPeiVsUYYfFTKXonD4czU6u5Mva6Co
 KHZaaQMlZ7I05WV3U1fnE5wpzTmFmlXdk8+XXKQaZHNHalmUbJ/bj3sDTvUuNSSDTbeI
 YFpg==
X-Gm-Message-State: APjAAAUhwVDafrs8wm4cjBqVZftFex0v8HsYWlC9VUOGtjXLpU0QaBGH
 hIW4saFcTOcf3JJLazv7FMOXUNpuwXR88PDFkE/nAg==
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr22951231oti.91.1564405554831; 
 Mon, 29 Jul 2019 06:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190701123108.12493-1-philmd@redhat.com>
 <20190701123108.12493-5-philmd@redhat.com>
In-Reply-To: <20190701123108.12493-5-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 14:05:44 +0100
Message-ID: <CAFEAcA8sBj23KTBVJRwQe7_jFgD9zmhbQx-SqJqWssUYALhYzw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 4/6] hw/arm/fsl-imx: Add the cpu as child of
 the SoC object
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 43RURADY7Ikd

On Mon, 1 Jul 2019 at 13:31, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/fsl-imx25.c | 4 +++-
>  hw/arm/fsl-imx31.c | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
> index 869ee89b15..a237e967e4 100644
> --- a/hw/arm/fsl-imx25.c
> +++ b/hw/arm/fsl-imx25.c
> @@ -36,7 +36,9 @@ static void fsl_imx25_init(Object *obj)
>      FslIMX25State *s =3D FSL_IMX25(obj);
>      int i;
>
> -    object_initialize(&s->cpu, sizeof(s->cpu), "arm926-" TYPE_ARM_CPU);
> +    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
> +                            ARM_CPU_TYPE_NAME("arm926"),
> +                            &error_abort, NULL);
>
>      sysbus_init_child_obj(obj, "avic", &s->avic, sizeof(s->avic),
>                            TYPE_IMX_AVIC);
> diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
> index 662fe78f1b..423d9ef076 100644
> --- a/hw/arm/fsl-imx31.c
> +++ b/hw/arm/fsl-imx31.c
> @@ -33,7 +33,9 @@ static void fsl_imx31_init(Object *obj)
>      FslIMX31State *s =3D FSL_IMX31(obj);
>      int i;
>
> -    object_initialize(&s->cpu, sizeof(s->cpu), "arm1136-" TYPE_ARM_CPU);
> +    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
> +                            ARM_CPU_TYPE_NAME("arm1136"),
> +                            &error_abort, NULL);
>
>      sysbus_init_child_obj(obj, "avic", &s->avic, sizeof(s->avic),
>                            TYPE_IMX_AVIC);
> --
> 2.20.1

Really the ARM_CPU_TYPE_NAME part of this change should be
in patch 1 I think...

Could you expand the commit message a little to explain why
we want to make the CPU a child of the SoC object?

thanks
-- PMM

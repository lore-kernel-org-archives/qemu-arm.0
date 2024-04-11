Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp889428ejc;
        Thu, 11 Apr 2024 04:34:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZ2KeFjyjI4Iv6MiVpk5UU0DFjWx5Fa5IEy9Kx09w04VCN8UZLFSMR5wopdTMWoKa8rluGJ9LwZpXQVm+GSRWzXAHJ4u0c
X-Google-Smtp-Source: AGHT+IGGQ+l5b2Sakx7Lc2vAtOjpCW09uOvm4bqR9+7GO6OCttcKWZNgxWyYIbMBmttRog/7o8z4
X-Received: by 2002:a05:620a:3b97:b0:78e:c0f7:54f8 with SMTP id ye23-20020a05620a3b9700b0078ec0f754f8mr1764168qkn.72.1712835253773;
        Thu, 11 Apr 2024 04:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712835253; cv=none;
        d=google.com; s=arc-20160816;
        b=lq62KiIE1G2HQszxb/upFLZQUvaWSpG6xyRrQW5ViZg6dDMzdB5kdX7+4nJIn4Xe8+
         CVpN+GLLNe6xMSNlb1sPmkoz9NbXrMvFVurvol3zeXCDH4yDJvF5nXJOfJwr4CzhHuK4
         OHjqAAK59f4Fl42udXaZKzclU7RKfUEUYrglAOBhsANvXciiFdkSh+p3zCWOOFFjZVNH
         CgYDtpCHW2CIZPed/JHMsMDLvcmd6yQJ3uQlcbV8rRSe7AsEr9BD1+6To9O/kNiiM2/n
         sMYUIbzASFtam8/kBN3b54Q7wqoIc+mopRreFH2ybFlus4RJmcm6npd6UNVTcX1r5e9M
         +KqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gKW27QqBx2ht5r59ew3GF9HDkfUQawGcCPc7HVvCMwk=;
        fh=xM8T+pRtd++UTdbbv4HInZ452LsshM7TdnaHx8u6wAo=;
        b=FyxL38ibNa+O9soJowwYmCInjb9JwUK7ZbdBPLXOOa0NXF6CS0kChLCRDK+YzR+wS5
         z19+SsxG1AUnMTnw3HjSIwSp+d/VVF6nDDBPeBCm/8chV9q7wsnznE4Vg7Gxs39+qD3R
         CXHDDz68V5aJviu/7Tn3MKEmHTZ/8tx0iLEx6ErBZmbkrVFlI9fAvXrHaiBZHPf3P46J
         wMUW63eg2WezNHyXoskVPiHgiRv8Xa+52hkFbuwMiHfakF+r+quWVTzHpDwcw85/vFDe
         Upy78Jymi2yihUg8C2oh7jLbAHWuzVG5bSFJXQQIGmsll+rQMjp693NGWQaIcixd5SNX
         KWUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y6V/KAYk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wl16-20020a05620a57d000b0078d67e70f5esi1341773qkn.222.2024.04.11.04.34.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 04:34:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y6V/KAYk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rusgD-0000Rp-AP; Thu, 11 Apr 2024 07:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rusfn-0000NL-G6
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 07:32:56 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rusfk-0006Fp-NA
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 07:32:54 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56829f41f81so11238682a12.2
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 04:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712835171; x=1713439971; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gKW27QqBx2ht5r59ew3GF9HDkfUQawGcCPc7HVvCMwk=;
 b=Y6V/KAYks98/K5ima+xgnU4xKC61hkhQ+gDslVxqftOg8EoQSsOWW2RRXBvCjJGVLQ
 lvkpbQAyv+NA42dB0I8Mu8kcEhJ5rm+KyWtaxC9pKLA5oJv+hzwGvdf1hD2B/wARMcXi
 Fcn3MJqYsdmmrr0XkSr4jjrVH3fK/bV1JJgtchJhz50MKBsfPpI+NMnK3K9QE0WZzGT5
 DZ9CxpKHolrL9RO1ZrTcYMu1LnTkTR/Jeewo8h/vqCEUV1yYjInNIXgQSztwS/dG8Nfv
 LzpTyqXpW4AouqePrzq8gbZS1bSkCk1kiHdYkUJe+daP9PUNpN1BMHtqYy6f00HHDtWb
 qong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712835171; x=1713439971;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gKW27QqBx2ht5r59ew3GF9HDkfUQawGcCPc7HVvCMwk=;
 b=I0hDVhoAZiCcFfyP3LbXemhaB6r0F3K9IXOw6LlEKNXHbzt5uOMosmJFDS+a2SbY5q
 aTpqRfj8uXxyImzDtubjj7GvLqh3yGZ/+pv0CmHFx5lfibafU+tqoSoUu4nJH9Mb/kfv
 Tn37ZIwnvK+ybL8KFZOz3sekXVqR50xVFly8mKya3xXlJYb6SVFxGZeqbjy6bj8x7Bei
 uUJA+T82JFmo2PVtffOcOmTZV7QE9LN6dcPIWhiMw3RYwlDHkLDzPBV6ndRckNUSBBue
 +TeyKRG1zDU/eKbjKczAT5/HDSfkICi/AgYE6n2KgxHT1SHHSd7vtHqslMxof2Du5UjV
 zBnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu+YWNXO06IcJm8/8hMXsPJJAnCl95/EDR/XUG12kfulGFWBYmPzntvqDPwHalXq6jEFh4wkPsbMVfrREANBByVzvm
X-Gm-Message-State: AOJu0YwaIMavtLMwAW8gJ9J80O1tIKmCv0LTQ3MO7f1+Zm0SR+vXXeZV
 usJDlYYr1uys3cDFXI8z0rVP4Z1CPGeCGppLPTgf1obd+O7U2+MhLpFx7oni/lay9dYiMNyYKOh
 IAXCEZ2xRXY/eGhO4XojveIDqm0tDln9gMPMFs2SBtyrWSres
X-Received: by 2002:a50:8e50:0:b0:56d:f3a7:60e with SMTP id
 16-20020a508e50000000b0056df3a7060emr3752165edx.22.1712835170769; Thu, 11 Apr
 2024 04:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240411104340.6617-1-philmd@linaro.org>
 <20240411104340.6617-9-philmd@linaro.org>
In-Reply-To: <20240411104340.6617-9-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Apr 2024 12:32:40 +0100
Message-ID: <CAFEAcA_2=3-jCR0FDPAE=Y-wG+LCx-Pqq-Oe4ageuUi=beGCrw@mail.gmail.com>
Subject: Re: [PATCH 8/9] target/arm: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fRfpmRZG35tu

On Thu, 11 Apr 2024 at 11:44, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use snprintf() instead.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/arm/cpu64.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 985b1efe16..f0f4fe6714 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -433,7 +433,7 @@ void aarch64_add_sve_properties(Object *obj)
>
>      for (vq =3D 1; vq <=3D ARM_MAX_VQ; ++vq) {
>          char name[8];
> -        sprintf(name, "sve%d", vq * 128);
> +        snprintf(name, sizeof(name), "sve%d", vq * 128);
>          object_property_add(obj, name, "bool", cpu_arm_get_vq,
>                              cpu_arm_set_vq, NULL, &cpu->sve_vq);
>      }
> @@ -458,7 +458,7 @@ void aarch64_add_sme_properties(Object *obj)
>
>      for (vq =3D 1; vq <=3D ARM_MAX_VQ; vq <<=3D 1) {
>          char name[8];
> -        sprintf(name, "sme%d", vq * 128);
> +        snprintf(name, sizeof(name), "sme%d", vq * 128);
>          object_property_add(obj, name, "bool", cpu_arm_get_vq,
>                              cpu_arm_set_vq, NULL, &cpu->sme_vq);
>      }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

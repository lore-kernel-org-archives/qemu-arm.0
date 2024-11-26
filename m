Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp187273njb;
        Tue, 26 Nov 2024 08:24:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWXuL0n3DLGKlB+2G3tKUUT6PMV7JlFUrQdDdD5dMc0Yh8yibRGPPgQPWf0KxrCcOmgJpGfuWcmk73JwA==@linaro.org
X-Received: by 2002:a2e:7c07:0:b0:2ff:b822:ec4c with SMTP id 38308e7fff4ca-2ffb822ed1bmr48779121fa.35.1732638295862;
        Tue, 26 Nov 2024 08:24:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732638295; cv=none;
        d=google.com; s=arc-20240605;
        b=X/Dnt+hA1/KWCeYykLZgQ1jFnjHDg/OSJHfJUosbkjsSgWmmTYa5QNjuwLBRW+UNrv
         Up1Gt3ZLAl1M2ZxUW/ncMgniOTcDNFWTpj+F3qY+n7GBiOfZrI3Dt9PwaHO5dK5FecE5
         HFBMJV/az9gLVbFjRdCZZUD+Ihctn8YOIqzmbIAKVZosnkz93tOTvdZQouNtIgnF3h2u
         m2QhV5rkkEiOoITts8EKjQ9zBJAU57gFH+LiHZc/XG/Gmvb+5cWknelNj6mD/UUiOHUg
         BWgUNHz8I4tdtNvUTtd4vSi8SQ1lp1m+6UR7FYfqPjS9+EK3GJYJwPK6O3k8J1oqTjUi
         Z12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=imbbFsKgSJMQcpFXUzcc/I0vHluB/HWsjAPOFw/l8Co=;
        fh=J77moObRfC71dwPJtFIWD+HB0F4Sp03xeEUxMQYo/mc=;
        b=bzJT5m79sT/GFR0s7v3bbDXJPmufw9Eq0ZfpF19vQWDdznM63FtTn+Td6/rRmGlNad
         1AUTgEKxXIYu0n+vvL501KJs5aqOtrK5mTbEATfRrvCC/B59YTa/yEI4QMTLELjnMsVy
         sOQBENnBMAdg5IPBE19I8DPdhn6rPRXLoxOfCYETp5WWoAk2Wke6IMSpnwOM0pachOGX
         QmgGg5CZdB5tyNDhx8dd5oYuJGjTYuroTUM+uhiyYnP5K7zbFT1N0LBYiGeYGpQl8Gf4
         rg9QmDjsAoO2k5kAIb4V/Reqz6Ye8kfi8KTjL3ZppW3u1632CdpPlzbJL/18JBKXZVVO
         1LsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I/fvu7dg";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2ffca283439sor9331271fa.11.2024.11.26.08.24.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Nov 2024 08:24:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I/fvu7dg";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732638295; x=1733243095; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=imbbFsKgSJMQcpFXUzcc/I0vHluB/HWsjAPOFw/l8Co=;
        b=I/fvu7dgrN4sD6TRonix5REoJvtU05RN3v3wb6f/9yMmMtKnpI0hoiT60x6piUanVp
         lB9xPBxCnrAqmgsvpoVu9tb0ZMChcHwDy6RyiiofxxjnVUcNJ9XAbzknMgIGYW1yx6zl
         GRC2ac8kvs9tEkKTnRBJdXX5Ns8MxmYUfj6rVma0WZ6MkrDREKVB5dsXOyKt7JTm/n2D
         PWs5Vp6kzGTdOsCOr+KChuzPS9uEtocurRkd0BMHBeaz9j8ZgN2f4P8j46BoWrktXGf7
         igkhIwNb38a7wVB35XqduPTxQcHEPeS4vLxEFNISTbvSl0yi0Ez2JfbvmyXhvFkNNuA3
         CiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638295; x=1733243095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imbbFsKgSJMQcpFXUzcc/I0vHluB/HWsjAPOFw/l8Co=;
        b=sSGUJdJ3/leGtXZyod5bgBZribh8Lw6xdPCUVug8DEfA+8XJrMDbFouIZsriQTjr5y
         ZB9iXB48c0oXgLNhtihQiqWjBDVAe2v/c+cj58iw316umkRvgW4FO+SbCD/OrHNdz1Gf
         SIE00yrUWZkoqvoIYpvwC9AWbt0CYNnrT9c83SkXp+DvFD1x9Fd7AzsXRtK8LK6evfnl
         J/XS6YZ4lHAh6hjoCqFtzkhExd47OG7xYsQKqJGQoaaoJs7IIiH1ie4H2YT5vzU5K7QV
         bXxYcCp1erWgBRIppXZZuRTN8cxaEKutwo+FFPx3MSYMx6EfEbOADYlpk19vV9YpqbJN
         Q2Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXMHgUPVlbe83/9+UOfKo8hKeiObtNUxCj16uZIxPrJFTwTPb7qRnNQDPOBy4kJUx3KD8QM8O6qA+QqSw==@linaro.org
X-Gm-Message-State: AOJu0Yw3LYr0ARUbgsBYBG3trRidEgoQfHbQyWX5FwwyuxKSuwTXyPSU
	Z6lrbmceAkeIddLua/wZuK1Vtbdbs8fuEFEI2kl9EvGDkn2HlFNvuWKHHLAv0DWWmJYlGqaRCQr
	q2GQLimH1wrLBOEJSDGSHzolpzI51/2uGhu3ujRez
X-Gm-Gg: ASbGncuLQPlPFf/YiYLfi0jkx4x/xiBmmmBpXKgH73aA4ITncmP1Rte8dp6Qv+/0ufW
	Ytucb13TiaEfohU9b1gJQ+u8hqiYv72Vy
X-Google-Smtp-Source: AGHT+IFMkD4c9eO2mrzo5TaUfhGhCH365Fd4tPVOe85/nNh0QIjZYsNL+3Zgy6cCMJRj31N2qwX1d8Gpwlu5Hrx3h5U=
X-Received: by 2002:a2e:a556:0:b0:2fb:5da7:47a7 with SMTP id
 38308e7fff4ca-2ffa7197a78mr95962551fa.25.1732638295119; Tue, 26 Nov 2024
 08:24:55 -0800 (PST)
MIME-Version: 1.0
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
In-Reply-To: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Nov 2024 16:24:44 +0000
Message-ID: <CAFEAcA907AJ_x73wG83HYk1xyMksx7ij2TpLpOaVKgrOffA6og@mail.gmail.com>
Subject: Re: [PATCH 00/12] Minor fixes for Arm documentation
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, alex.bennee@linaro.org, 
	Steven Lee <steven_lee@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
	Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 8oCcz8ddewP8

On Fri, 22 Nov 2024 at 22:52, Pierrick Bouvier
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
> Pierrick Bouvier (12):
>   docs/system/arm/emulation: mention armv9
>   docs/system/arm/emulation: fix typo in feature name
>   docs/system/arm/emulation: add FEAT_SSBS2
>   target/arm/tcg/: fix typo in FEAT name
>   docs/system/arm/: add FEAT_MTE_ASYNC
>   docs/system/arm/: add FEAT_DoubleLock
>   docs/system/arm/fby35: update link to product page
>   docs/system/arm/orangepi: update links
>   docs/system/arm/fby35: document execute-in-place property
>   docs/system/arm/xlnx-versal-virt: document ospi-flash property
>   docs/system/arm/virt: document missing properties
>   docs/system/arm/aspeed: add missing model supermicrox11spi-bmc

I have taken the reviewed ones of these (1-7 and 12)
so I can put them in for rc2.

thanks
-- PMM

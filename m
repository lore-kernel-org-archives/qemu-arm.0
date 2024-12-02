Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3162310njk;
        Mon, 2 Dec 2024 11:56:35 -0800 (PST)
X-Received: by 2002:a05:651c:1590:b0:300:3de:628e with SMTP id 38308e7fff4ca-30003de6526mr40479231fa.41.1733169395489;
        Mon, 02 Dec 2024 11:56:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733169395; cv=none;
        d=google.com; s=arc-20240605;
        b=h/aiZ5/8qsN/JSaTWyskVzGTEavZ3N7sBUztDxWhE5qzJStkGEsLHn8LR8iZtWh1+G
         xTIX3V+SWKfbnzWE2zBCQJTlpOZnjUhvJmCRsxJPEHKD6LmtA/uhArH6F1pVSSICCBdk
         HCEKW+RPf1dXRnpIXmEISSjxW4pDXgM2+7caMk3Ywrue6Bv1SogeSlWnLJtI5C9Z8iT1
         uG7nphsrWd38F8ZN1Sz01g2gbWsGNrAUbZSiZpevpdftlYhrJSLr5yvs4EikEY7ux7BS
         Y00/iVCO4yMHxzeJnBqW/rEZvA293VF32DeUev7rVq+5UDcIIgA4Bcud1mdGR7i2Krc7
         JMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rjPEVeVubv7yo9F0QbP9XQRaClcIjjwTcST8R9WFH8A=;
        fh=jzQ4EgR8EKxK8+SMSzQ/AsNAxKgQFV1EXS1f3hVD50U=;
        b=dSgk1GXTHChSnhy9BgeYTfVEScoPfBGSZi5bbckh9O99Hx729cJqFcRpOBjkgnG41N
         QRbICSNuCfElVILCO2bOKv4szK5W6Ck8e6Jc7NQpp5Nqrv9abqXJQP8qyh14Pnu8LX0l
         +qcWDxf2xzYxQxypddaG4MqJJv70Jevn5a/26D61lpHPitXy+yaiOtZyDnvlNJLkp8HW
         C3fSTRcG9EtjEwa+SJX3K2vb3kCT14RNqZ4XKXcGfk6ZgREV7FcvzJhPWlN0zOq/i4gL
         c5ADtmeOykw0nacFZca6hl4ptOOEEaMQSkEk3dESd0lzWx+Mv1YDQooYepq2Xh8XXnp9
         FrEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SFiRfxa2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-aa599933b86sor190068166b.12.2024.12.02.11.56.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 11:56:35 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SFiRfxa2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733169395; x=1733774195; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rjPEVeVubv7yo9F0QbP9XQRaClcIjjwTcST8R9WFH8A=;
        b=SFiRfxa2hfBaW7FUw+kGvf9sdKhknMUn87rdyKj/TOXwVS2mUDR94TdX9kRkzjHtFf
         XnXVQZtTONzwp3OZfCzkqN54TBeSoasXpj1BPdiXano1u7KrkvIF5jUFaKORbSGGcWui
         OT3+L24eS9kpdrajZKR0WMN09vtwtWAU4csQqMX5CiRvHYVRGpIFS2FjBukVETejtUQ+
         1rq8783JS1ajcxcf3UyTzk/N0OXuWzd5IucmObC1r+ywPQo+5kTWO4tSOV5yauqxumL5
         1qvtjfLhgf6UOk84hAoamk9OLdgzqmgSptQ5zuUD36GffB+Ibd/dL4dnt1A5yISuhZnn
         WEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733169395; x=1733774195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjPEVeVubv7yo9F0QbP9XQRaClcIjjwTcST8R9WFH8A=;
        b=Hnq0+WZy/4J9AXfcOOaUjmu9C9Nwc0lNElqFn5iVtggVPLcQR9h5yD3yjnkJKD606W
         0p0yw9PhA9kjfoWhn2qT3ruifDKnfcZmkgFCuYU0R8dr+2G2cm3cxdDfDKaoXgdr2169
         3sgChlSeIlo3wUTPxdm5uy5cyOhFo1tZqR1ck/bZ0T5/F+5T5VxgKKHyns4giIK7oJrD
         5gf/jxFgbO3UZEk72DAmT37I457TPFsGj4UaT6ocSMBAALaVZnHBsS4J1zHZIOmXx6yl
         iu2JViuckZCiL/1x81O89ksXldR0+fXd/i4jPJO8lQMjHyMr6STYRWAQhAd+xNK9s1Ez
         yoJQ==
X-Gm-Message-State: AOJu0YxX8PxSHP0W3HnZEhstgbM0dPVZji9JTdtCYBExeXHGt33nWLP5
	/D18+sb9jYuCC2imMI/aNL3EJiJa3bOoTPsXeAcdV97vwG/LW3ChZPYbjeCIu7wtLrc66Po7CiZ
	ALwHYDSShGQX6ptT9f808u+NRuCciNmZHrWApUV/4
X-Gm-Gg: ASbGnctXG1WhaMOcunhIWCaxW1WhWFNVTvwavHajddTcOkncVPdq/NvlaxFRdvw6yvN
	19vjHB44Eb46AwgaMhE+07bJMHIh1vpMf
X-Google-Smtp-Source: AGHT+IFflGrprTtDbxqXzbEW4DIiE8vusR6V+C+y0rTvEJsEGVYNetc97vEsnOhfyyeM84pTlPAlAkEM92XAiaI7yxM=
X-Received: by 2002:aa7:ccca:0:b0:5d0:81f5:a398 with SMTP id
 4fb4d7f45d1cf-5d081f5a877mr25790407a12.1.1733169394972; Mon, 02 Dec 2024
 11:56:34 -0800 (PST)
MIME-Version: 1.0
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
 <4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org> <5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
 <CAFEAcA-xa1AKf2GAv7go5wdu+Td=4jf7Nriin-Oe3S6qEV6X0g@mail.gmail.com>
 <fd7ad48e-1e72-4735-8064-7039eedc00ae@linaro.org> <87ser6c5be.fsf@draig.linaro.org>
 <a26e2a3d-d915-4e84-9b8e-dd5935049f31@linaro.org>
In-Reply-To: <a26e2a3d-d915-4e84-9b8e-dd5935049f31@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2024 19:56:24 +0000
Message-ID: <CAFEAcA9q7advmbws+xx6Mgcg-=072tBfdRReSSqymYz6p9zENg@mail.gmail.com>
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Troy Lee <leetroy@gmail.com>, Alistair Francis <alistair@alistair23.me>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Jamin Lin <jamin_lin@aspeedtech.com>, 
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, 
	Niek Linnenbank <nieklinnenbank@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: lBvEHBO0NyXZ

On Mon, 2 Dec 2024 at 18:36, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
> Maybe our enable-debug should produced optimized builds by default, and
> we could have a new --enable-debug-unopt for the "I need to use a
> debugger" use case. Would save a lot of time for devs, and in CI where
> minutes are precious.

The whole point of --enable-debug is "I might need to use a debugger"
(or a sanitizer, or anything else where you care about debug info).
If you want the optimized builds, that's the default.

thanks
-- PMM

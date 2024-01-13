Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2958055ejs;
        Sat, 13 Jan 2024 05:28:07 -0800 (PST)
X-Received: by 2002:a05:600c:2e15:b0:40e:5182:e8dc with SMTP id o21-20020a05600c2e1500b0040e5182e8dcmr1421697wmf.99.1705152486885;
        Sat, 13 Jan 2024 05:28:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705152486; cv=none;
        d=google.com; s=arc-20160816;
        b=B14itMuiFXW4uxmt8haBp5nk6gz/e+Tyf8UWzsCvtdvg9su1s1ToDTnxd7l92E0whm
         uKhB16knOOpN0qj/TGLUDaX7RTJhCVpaiPIHacys3hwhvcGD7YeqX2zlEMalY8PqQjrP
         tTCt/lfCAigXvFHFrtaYZFae1AI+bGBgUveYUuqmqed4NGUpCddnoYJqYFEsXv+VP07z
         oCgQJXuC7bWt0btutR0FN6VpeU+fSzJVeXOJeIUn+7v+FWMsMmQzcLhtmB4XPQ4svvmU
         TmDepKKRWn1V2e2hL1d7ex7UMLO2ZnYMl+SG9G62jQDsfzh/a/pQ1mEGuYrG3vNgE9bT
         2E7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h4K3Wxfo4ZyLhveW7ANrV2lDD2G99tSb4tG0hfk3ZaM=;
        fh=TdHNMZ8OHJtpmGETXsguxom88UHQqP6xd+te8w86lwo=;
        b=wm0zJRQBElYuhTIuw+vB07T1rNBQH6XHjKNmfv5jAGTy37fKNa0cF2Niz+Up3zuq+e
         lj00y4Pq+xTnxCT4l8YwdXwY/t3KcsY8buYpbJXLt9U+Zpt7filAvjeAbo8R1itv5nL+
         IuZez8AChJOBjR8XUZjzausvQD6P2ihZhVX80bkbK+503xm8fBten81GotYpcxM25n38
         locTzKdD0nv9rQK5ZEpaZSnzyICbl2FOD5mAzPXCXkmoXBsFg1nt8HX70Vgn0dh5JlUy
         4vieaxcAS2T4MivKsRgaB2CW1NxarQFuzTMIHWu3N9tyfmthbR+6jvargJZLzSOSFSbh
         MQxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ntyHI/eu";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n9-20020a05600c4f8900b0040e4e36d0cesor124174wmq.1.2024.01.13.05.28.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 13 Jan 2024 05:28:06 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ntyHI/eu";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705152486; x=1705757286; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4K3Wxfo4ZyLhveW7ANrV2lDD2G99tSb4tG0hfk3ZaM=;
        b=ntyHI/euI90S5TnUQEwxcAhYa5uxFhPykp/Q652jv+lrLlVIPn/g2/7pHGVNcpdHNk
         jh2utfCdblCvVzjUBOyhME04Xlzmskff/GJ/xb4g1tdw2eJ9LfGTdg++05uGfLsCiJS3
         Y770dY/NqF1ac3K6438EfIgsVMK2ytfl2GPB2y3GXqL9Pn0oYRavE1XLu3O4m5kDzDyM
         OXsa56W7kodWzu+6qEaagqjnt71Kh0tqqIWCN/E+wE/diHBCF/DQHFRtyZlkN6hpp9el
         zzM1zGrenR2cKK53F0E9aiU8dQmYXGLlxNyda4TU3VQfiNxtomJ8GdQDqjHXvzvXJVZ3
         hedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705152486; x=1705757286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4K3Wxfo4ZyLhveW7ANrV2lDD2G99tSb4tG0hfk3ZaM=;
        b=eBtDThIuGK7s8fTKDc9JkpwtjENPdRIlatr7po+Mm0feM1kopHvDhKNnPFzfkEKE9y
         O1yJWma4RshKCaCInkTeDbaRZgS6Ddo7yWLm1KFx2yBx0llcX55GkvK7Mzvd3YFwBUQN
         L933tceNOQbELnmBD1N2sxP2K0u9OEmdgvocc2SYPPVACkDmVkfG6WNgc+e4XzylA1XS
         iWFypRWgDJK6RmgIpSXKyuseRFjm8fh6TudgRrQjKO7bDKbUh8Q4wTFPEEVSNDxYRwox
         p7HvqMJ7TyzexWMZ8i7ZVl/KY1j21EYVTTQgkQWqR8Uxn2QrpiUzHPZe3F1u1Fx/WVAz
         oQzQ==
X-Gm-Message-State: AOJu0YwZcdei+9ZT8BkSAw+Wi5J9M0xXE3B94yj3YfHeHqyskvbojUG9
	6l5H053dge1ZiQhi81i9Ge71nYD6aNjEFX31+yizaZ8Esh6jf27s
X-Google-Smtp-Source: AGHT+IGXxTvL35WmMTNzUEMuG99M1syyv7xFN0LuUEEggaWsIfLCCeKzw1TLSg9w362CnqRs5DDHBLTM2hBlZXeTTh8=
X-Received: by 2002:a05:600c:1d85:b0:40e:4c1a:2663 with SMTP id
 p5-20020a05600c1d8500b0040e4c1a2663mr1406433wms.3.1705152486520; Sat, 13 Jan
 2024 05:28:06 -0800 (PST)
MIME-Version: 1.0
References: <20240110195329.3995-1-philmd@linaro.org> <20240110195329.3995-5-philmd@linaro.org>
In-Reply-To: <20240110195329.3995-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Jan 2024 13:27:33 +0000
Message-ID: <CAFEAcA_OarQg2Aw8bTQD3Q4X80uTzzfgvG9pXcRvz48_aa=vFw@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] hw/arm/armv7m: Always set 'init-nsvtor' property
 for Cortex-M CPUs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	qemu-arm@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Radoslaw Biernacki <rad@semihalf.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Rob Herring <robh@kernel.org>, 
	Markus Armbruster <armbru@redhat.com>, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: T9ZhBmyTgb56

On Wed, 10 Jan 2024 at 19:54, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> All CPUs implementing ARM_FEATURE_M have the 'init-nsvtor' property.
> Since setting the property can not fail, replace
>
>    object_property_set_uint(..., "init-nsvtor", ..., &error_abort);
>
> by:
>    qdev_prop_set_uint32(..., "init-nsvtor", ...).
>
> which is a one-to-one replacement.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

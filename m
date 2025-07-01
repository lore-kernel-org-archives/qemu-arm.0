Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3035121dye;
        Tue, 1 Jul 2025 02:53:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUBCV+IaV6yDq1TPmlV9hHkZQPNuIVWe29x+uENzpdWTcEAWE+REVV+vcD1wDyl0tbwFm4+aEOVao5mLQ==@linaro.org
X-Received: by 2002:a05:690c:6410:b0:713:fed3:70a5 with SMTP id 00721157ae682-7163ee8e0c2mr41985937b3.9.1751363608599;
        Tue, 01 Jul 2025 02:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751363608; cv=none;
        d=google.com; s=arc-20240605;
        b=ILBu37ptdptD9wQv0tMPnAvw5yHaR/LkuuvN+7R5qLcmKIRpe2j5h6ez4vGHcIBnO2
         aaaJY9zO6Z5BGQkf7TaBYDR873wWkuoKeMXD+fF1hsbZfrs88ud9HSNLuXwJb0s0AOk3
         RDIwRjaB9ZUJ2zKd5qagQ+2EzXQ4qY+6Tlb40ELy8BbOVQv1lOZbYBD/ZJZqsyhQWA9d
         Kx+PyoA/p8dcCGynM8wJEGz4SzV5KE3y/sbsbNdeeN9AIjKdDKw6TvNha/0X6Sy+iIb8
         mVJ3GERJ01X/pCOV5M27HyRCFIohaWABYIPeYmVbKMZwLhn9Yu0SMxDQwkQxa7Wn0IFy
         eVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wImLPadQucP6avEWGXXDkRvaaePghLhR5MvhokcUgVY=;
        fh=G3HX5PJflaGEpy+WrVM2w9QuFrZBAw2ZltPJhrN3JkE=;
        b=HOvmMtukaZb4DBnZhmEauzYm5bAvLka+lYAxjpddKjzxC8CQG2tb8nGvuc4TfK+HSv
         5b9chjdYZQHZQaFlFqLGv1MdB6eetlZSiuI87kQjxfB60I+agpZ7s67HglzGJKcW2MBt
         +T1a2U4Bf2KLNU4yboVSxHa2cGT+4DvmtdbTLYMhv6w2v5gqot7hM7bbDHt/eG9jw7jc
         qhdZpt2v2K/GoDoqfT/2ESCOm8dwBCCCyH2DKjRZ9Fa2UOXd4JjThnPEFES+OoLztQg4
         XiCNyML++sHyB55Ew47pFZcFMxLiaIgoUzv65q9bXXqJLQXpEIIjCHXcefqTgVB5wgqk
         ERww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ULfzZA47;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71407e4becfsor58829877b3.0.2025.07.01.02.53.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jul 2025 02:53:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ULfzZA47;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751363608; x=1751968408; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wImLPadQucP6avEWGXXDkRvaaePghLhR5MvhokcUgVY=;
        b=ULfzZA47MBzLvIb5YG/TywDwUQT61lUT9tg1QN0qOHjBdl4vx7buF3k6yZ+ay/rp8l
         oxDZ8k9uusjBIvXDsQuvDCNCI7USjd/xK0qB6d2y1aC5C69RNEaNpXXs9vnVwuutHS5R
         FCbgflZly2Ul/+TRQif7+PijV87O3WLf9+LJGlDRAkfiK01jSRh2krdsYhJc0ygnrSAa
         VObrA695kRXxnGUamIqR9TBh6fJ/8NsHFQkdVTEz6OqWXxvpXuARzZVkORLSJPI3mOq1
         ysvOhfHF4asxOQ1KKKfqUiWyyZPh/AF3S2rmsWKjT1dMybywbYld/Ahvw4XiDXxZEPHT
         9sCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751363608; x=1751968408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wImLPadQucP6avEWGXXDkRvaaePghLhR5MvhokcUgVY=;
        b=ZQh15fD7TXkmaFJ64fZ2F8GF/TRS+UCAsOBXTm7dyyZt6mCY1pSKPpB0fOavrfKKtC
         go4R1brpwK59ogy+e1JapKecJf5fwmeewUu0wspbvPxoD6OPDd3mSFKuTrFbUIa3epH4
         jTKpE5DLr8/9zzcAuUx37HLAKx6xfDCQaMiKqp0ZJHwlwXSoc3EA5Nj6pjAHAKMj9t7s
         E2MnffIeZtAVXdS5qTIwo/BuR3ircVI8TrTqU7R0OxW7PwDs8aoygUZlUXRXFf9rAMtG
         tQqhJn4+CWRMSDj8/NB9gaPmfKLyDFe4HtUl5htyTJV31DnGS7eQH5PI5sfu1BJMma7h
         RjKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMRYT0DD0Qw2y5DYYq6L6fmAoBesdPw9KjyIoeyeR0qIAU3AWrKROZolflHY0geGJ5esVsWuSfa1yKmg==@linaro.org
X-Gm-Message-State: AOJu0Yxss/LBcqYCl6HKQlXLC1WzPiQj9zRL3aClbZ1JahHUqMK4qBm6
	SALmm5U4ML2pbL0hOHhQolLI+2iN5I9cAhYggibjXCkEZAX6qgtcUl4b1Y3eqnmfmxmXCSo9dpi
	x6V7IbmCZPNLz9PriaNG9rnlVQdfaomR6TZxNUC25kMaa
X-Gm-Gg: ASbGncteIKTb0eAkBJJb/Ym7+aD7Acv8//oz+l5SFu6l8ndvlxiLe9rrJKVBYg161El
	Tix4xRpEcqtQik2rAHlk4t1AQmvc91l4z0LmvqXMoCgn2nArjA4pfQTdTl52Y0rBxady+CBzEWC
	I69/+P3AvuKNoSfHVRI37Zz1EoeE5iXcNvpF5dDEYDIVDY
X-Google-Smtp-Source: AGHT+IFJCoy+BaAXpqIPg7zTDLzhyK8miq/1Dpx45qGcw9+XUoph9itQWahKy4dHJ12+vXIQx6+RnOzACS932yqoIig=
X-Received: by 2002:a05:690c:6602:b0:712:c295:d012 with SMTP id
 00721157ae682-7163eeb32c8mr39248687b3.13.1751363608216; Tue, 01 Jul 2025
 02:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250623121845.7214-1-philmd@linaro.org> <20250623121845.7214-12-philmd@linaro.org>
In-Reply-To: <20250623121845.7214-12-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jul 2025 10:53:17 +0100
X-Gm-Features: Ac12FXww9a1Do6eGY4OGmuJAIl3RWIp53XrSRbJt38wyQKMH3BAQVzfhsdW1Nmw
Message-ID: <CAFEAcA95pGrwhv7DwmjayhHoPvdmYbYBHnHUmCpHSMzLz_YE_A@mail.gmail.com>
Subject: Re: [PATCH v3 11/26] target/arm/hvf: Pass @target_el argument to hvf_raise_exception()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
	qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alexander Graf <agraf@csgraf.de>, Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
	Cameron Esfahani <dirty@apple.com>, Cleber Rosa <crosa@redhat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Phil Dennis-Jordan <phil@philjordan.eu>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: P/dblZUO1A0A

On Mon, 23 Jun 2025 at 13:19, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> In preparation of raising exceptions at EL2, add the 'target_el'
> argument to hvf_raise_exception().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

I'm taking this patch, but note that caution is required here:
part of the analysis that says we're OK to call into the
TCG GICv3 implementation includes "we will only do this
for EL0 or EL1, not EL2 or EL3".

-- PMM

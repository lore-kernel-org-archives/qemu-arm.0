Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1195367dyc;
        Fri, 4 Jul 2025 06:03:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWsLus5z/EsSyMUu1YzUepBok2aXuXEAaHIRnS2cReMgPWlzh/I7ZBDKowVXIeXsJmrLc6bnmIWCjGv/A==@linaro.org
X-Received: by 2002:a05:6830:3109:b0:72b:8c4b:8ef2 with SMTP id 46e09a7af769-73ca1350e4amr2289391a34.24.1751634232795;
        Fri, 04 Jul 2025 06:03:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751634232; cv=none;
        d=google.com; s=arc-20240605;
        b=NgoLJyEZPWAF0G4iFPrEQPM+UQtKPa1VgFHgMBfSfcbSXBxYJ2oaSVyssa+GVp3dPH
         vxqwX2oJQGtLN3Wmdeha4mgAUIuDh3T4S3yFL+gbnbK17h0MziWgJam8YZRWi2NBehVM
         u4r6cxWt5zSHBA3Pao4v18P+OVA3mSGz9A1qScZLVZHelabXHAOR1yQboYnWEouXoDLf
         qeysIdb7GraNuLN4aPetE9gAEH445uTVde+liRJBj+X9Bevn8y94ESUHoJlm7zE4kGfi
         1ZhkmcbjFa3xXX6h8nVbes1Y7yyRXUV5H0vru6a6rnGT/RvPDqOJfQIpEm7e0VWSdYLG
         bsCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FwW+K+s3MMXLuj1meDNa1wI7pdgz+LYYco3rFHvLV30=;
        fh=bg7s/p0p7Ys20wGQhnGy7wYaBTXGASFUTiLxZRBKjcw=;
        b=DL8Y5OwtRBfiLq6aUvqAtJsHlWsJCc+958aPnkFCXmENUmk5DfM6mAO7FOWrYW/npO
         25crSZ15uURW3uLxJCv2Mj1LDk4jdeRk0nrXhIOpRj1UxsDdpx7wSOYtPghkCcvE5gdK
         PrRiHyikpz1HCHxBV+MPgNz8Q+KSAcG1JJGQ3gqdzrdpHB8v2LpqPZ+zCLCM0DSmQRPv
         J9fdzwXgC++qXSKaoXwrnnjwXUSp9/Cu3eV2NOKsdOeA9Q6RDOLjznDRT1yie6VdXuHq
         6h7qypO8otieurcXqmHUR/nL2+dXVZNFo7FcT+5Y7Q0H+r4TkC14UiYYJE2RSp2bNjEY
         8zmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LmEhER7l;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71665b682f2sor12575917b3.13.2025.07.04.06.03.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 06:03:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LmEhER7l;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751634232; x=1752239032; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwW+K+s3MMXLuj1meDNa1wI7pdgz+LYYco3rFHvLV30=;
        b=LmEhER7lzSmeeWng0Y+nhIhl7MRk8pUKqmaRnIAq37nWARymou+dJOb1+z80nO+2T5
         uVyawEcLeWXxsDXSITFMAJYH/L/Sq5CCh9bQqJRi9bvemdDCfz7akq6Z4EZjMfqdaAYV
         dm07gCxQym8hUbIURFBW5rnSxCXN1bXsqIQI9+hG/zF20Mab3gKKh5NTLN88xZX2Z5IO
         LsYKUp7EpukiyDkE8J2We5u8sfU5C7CDZdg1GSsJN+60qxyI+hoUoaJztt9xpSHlR3KV
         ouhPQogQUSC0F0kbODStH47KuzYSez/0P5gwVX8DmSCiIPO+Cf8j+G0/HEb+o3LvFaiJ
         FWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751634232; x=1752239032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwW+K+s3MMXLuj1meDNa1wI7pdgz+LYYco3rFHvLV30=;
        b=O3OTgwNKAVthMrliNpcUUe05XEBANEsAoPBXtKKplZFyHzHI4KDRxwK4mkrDMfCIA8
         iAnjVpITT1SFpW8SSLvkcFRfZturVEfA4juSGYB9yLWOpg9JF0uu6/NuIO/1oDwxWzOK
         mgBvG/EQxjhdrc5OidqKCWbqxShviFKPPe3awnnhZISIHtk5Z9f3s5jcsCeDO6bVfLbW
         PYXy8Bv+uEr9aCnb03W0Pi26N+ceW0rVLnG6Xw4IlSemXJho5tRGUChYtCTL1/9wYMFi
         LQ0EZcfR+uElrD7xkH1i49QL0j+bngC32P9BvuW0RoTEWnIWmaoasrqj/3ZH6OvbbJWK
         xn2w==
X-Forwarded-Encrypted: i=1; AJvYcCXGMnCgkVA1c36UmNJ2tiei/JnAhbsCTE+eoc5VXT0IwVZ5V/JivTUDERZxbb8+12+Cn6VosDGmZNda0g==@linaro.org
X-Gm-Message-State: AOJu0YxrXuHIpEN6EGAWAy/cDqu7gHGuBhs+n9cYLF6wPGqu0GFdEEfi
	Sibh7vHPAR88OXC5xL91FYt3F8xONA00J767x6zhy0nbJWP78vT0DVRCCRv0/JmKu8ncsPw7FJE
	2unpw7aDfQbKwTIorjsoahRnxquIgnY2YZYOOI2CA5aWx
X-Gm-Gg: ASbGncvMmz/3CfjvY/j9rygtgflRNV0q9gCd8TIrC7+1dIObeLGgwZfqDzuoXuX95AT
	89Jf7tfJsa9c36QeOxkxLu7+1nYYb+MDD8/fB1mYgjhY37vmT7GodLbz8tU3CQ8BeBwquGppTQQ
	dw/1F8rOjsiFmkvMWL0SCKkUQBaw9dDNzw6ODqi+QvV+cU
X-Google-Smtp-Source: AGHT+IF+c5EgzFng7hZvgo2/mMwQZYJnDlYCJKxinyxUjpOwVwN7lfObz6CJ25ORLlOd+Hx79rMhNw4xX23kFK3h15Y=
X-Received: by 2002:a05:690c:6105:b0:70e:2cfb:1848 with SMTP id
 00721157ae682-71668e382b1mr31524887b3.31.1751634232388; Fri, 04 Jul 2025
 06:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250630130937.3487-1-philmd@linaro.org> <20250630130937.3487-3-philmd@linaro.org>
In-Reply-To: <20250630130937.3487-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 14:03:40 +0100
X-Gm-Features: Ac12FXx7P3ArMOGQRe61EH7qWxFpfmO4w_v5IJ9p8OK_V08-WhWfAYP9Z-BfgG0
Message-ID: <CAFEAcA8KBTfJqUbBeUm9_=JoMf133Tt3tcWhJ=sSSy-Yc6Cdcg@mail.gmail.com>
Subject: Re: [PATCH 2/6] target/arm: Only allow disabling NEON when using TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: N5gkBoY88YEq

On Mon, 30 Jun 2025 at 14:09, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Only allow disabling NEON when using TCG.
>
> This avoids confusing user experience:
>
>   $ qemu-system-aarch64 -M virt -accel hvf \
>                         -cpu host,neon=3Doff,vfp=3Doff,vfp-d32=3Doff
>   qemu-system-aarch64: AArch64 CPUs must have both VFP and Neon or neithe=
r
>
>   $ qemu-system-aarch64 -M virt -accel hvf \
>                         -cpu host,neon=3Doff,vfp=3Doff,vfp-d32=3Doff
>   qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or neithe=
r
>
>   $ qemu-system-aarch64 -M virt -accel hvf \
>                         -cpu host,neon=3Doff,vfp=3Doff,vfp-d32=3Doff
>   qemu-system-aarch64: can't apply global host-arm-cpu.vfp-d32=3Doff: Pro=
perty 'host-arm-cpu.vfp-d32' not found

I don't know about users, but I'm definitely confused.
Aren't these three all the same command line ? What's
the problem it's trying to show ?

-- PMM

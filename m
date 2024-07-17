Received: by 2002:a05:7022:1102:b0:84:b8cb:c71e with SMTP id ou2csp970738dlb;
        Wed, 17 Jul 2024 08:09:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWA5uYYGUlzSnQWsYfx53x81Pt2ylrrGR5oxBKSUofsKZrG+lTPWUBD8WaesqeTSyKFIlrkmaV7x2Tb1dYfHCRuzyVsAkpE
X-Received: by 2002:a2e:be0c:0:b0:2ee:7a4f:349 with SMTP id 38308e7fff4ca-2eefd083f74mr16736601fa.15.1721228955805;
        Wed, 17 Jul 2024 08:09:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721228955; cv=none;
        d=google.com; s=arc-20160816;
        b=AoZgn4hrBD8SELqTxfA28OTmyzJ6O9nGT1eCxOF8+A/EGx4pXSvr6Q/cCEvO8ne1nu
         2H8n1ib8CTZ8ityo6iuzvtflIkJiMS4CU00Hk0BrY0PJcVp8F9VD3MHF3Xu9uEZPWY/K
         Ulj4L3f6zQhf/WPpGJgOC2rYhg842wkOksSzCoPTziTFaLFrhJsN9z4zRVDzwyirdAZU
         XV841O0pX739Hzm8oPtcLlh3VNak/4mOHhV/6LLs8wDeSIOyTNp2oetbu0oNjWrGGRvE
         DEesYDg7MyTyG0FdwbnYe/0UcwxRDnVy8gqy9ODYZR36iuXVkv61AtNZZfKwa7Y0TeMS
         o7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=bQkNj5pgx13qsMzcdOU0QW0CL854aAv9poMaOUpWJgA=;
        fh=qj3s1ZdtFicZdgykv63PnlxPovQt8Y5xBJs8qmMu8KE=;
        b=V7rCMWRPHqmw5zRIYRO5qUpm4cpeHI+ii7o7F9QZeSaV+lOCMlTgDPI7kx5GS1ms5h
         CiWU6KFdJwak2Pltk0fZOtJdcuqxqMTBoCBRyUCBhNQBgpOSyZ2EODOkK1xLF2CIz92b
         527s8xKdhgZJBy/ipYnTQMuAk/0BzIU+c6nvZnx7mSwgXOhIx50jk33G7OvjdDrUjMAW
         T6jVV22KrtiTYF4yt19NFUEMfkDijh7+i9uMLq92ZIy1w4bKls+3Wm0RBYG2g0cPvcni
         meWvPBo6OAiQgBrxTCt8TpUIXasy/8Om8FhLBhg6c5b67fz4WOphYnDxZCRdAyWFyJbT
         iumQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EbAuPYeL;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2eee190a18bsor22303001fa.10.2024.07.17.08.09.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 17 Jul 2024 08:09:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EbAuPYeL;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721228955; x=1721833755; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bQkNj5pgx13qsMzcdOU0QW0CL854aAv9poMaOUpWJgA=;
        b=EbAuPYeL6NXiMTuX2Day4OJjlCaJaysuCQdETACZZcBxmp8WVHQmTyIL6f/WgxBOnv
         eTBnBL5a9Cyui4TYCWS6bOiSQ7dz+w91oOaUU5i40x2G3d9GlwoBTJUU9R3OfoxgYzxe
         mFmkR9IDBcQyinCVGLmKLvm7ZwR7KCwEb8sKfjRwa/PXzYKO296mny8tQsCz1J/ebMiG
         b3pGXmZZTcLOuoBsJnTHjeCZSAaG4ZANO924cuZNiyVtZVvFIjsYH3t9N7hO7tAOXRtT
         oZHD7I32znPbuGaVXlsH9NctKsLvqCLcds5XGcnJfC8wUKRjvSvgX65xXN2XadzM+EyC
         3RHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721228955; x=1721833755;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bQkNj5pgx13qsMzcdOU0QW0CL854aAv9poMaOUpWJgA=;
        b=kOgXnhRg61y7d5wydOaG9WDsGtkpM0JTHlrmG8/0K8/CvLtJuCVIw2NI/zSwdpsCXp
         vHWSKjyv51s83OwjWuWrxzFPu9ij9tK9nF8Dx+FTJblL6r9XTC5OLxybdGRlUMpIK3H1
         thfMbuzFe7YAf8JrR4sTmGc//i/E+VxiG4DVvV1iWXlZo63z3jgIS8NiHKka01dAt2cc
         OjImjZRjHFljLHJPlG8NfuUkIxOsD7Y6lXSXIhQIIpLBQGr1W8xx+f7nGGAf7wH+p3qO
         sPMbtqx2BsnQIcGOWS0JJjeOmGnUbhk2AAmxnLtb9dhMcVOtMAIyyoRkLae+2ZfIJ/62
         36KA==
X-Forwarded-Encrypted: i=1; AJvYcCWTbwNHrwfdh2UBbg1kZW+0cQOEMESHEhkBhPIb1ZOOzTQxlRIQeyjiiyjbWxnWYyxw3wH2T77ukJayZL52l/ata5snD6uE
X-Gm-Message-State: AOJu0YzCooUFuaREkG7WtMXp/AcgTxrM4qkhNIXjjlD1stOr3DxaDKND
	737EmIs36S9Sn8FdEpsjbl/UA+iSP08f6ULrUd/f5zE9YWUIXISyX4+sXEUBDOtcug==
X-Google-Smtp-Source: AGHT+IFdsJovopPtMAmvSHHK05E4ASh1jJbJQfOs70sw1mBeWMSJGO5pkKGwcBPXhUeNIm+33dSQyQ==
X-Received: by 2002:a2e:92c3:0:b0:2ec:5945:6301 with SMTP id 38308e7fff4ca-2eefd08fe2cmr13105851fa.18.1721228955183;
        Wed, 17 Jul 2024 08:09:15 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafbb77sm12123183f8f.72.2024.07.17.08.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 08:09:14 -0700 (PDT)
Date: Wed, 17 Jul 2024 16:09:31 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v5 00/18] SMMUv3 nested translation support
Message-ID: <20240717150931.GA3988597@myrica>
References: <20240715084519.1189624-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
X-TUID: kY6tde5DSeOu

On Mon, Jul 15, 2024 at 08:45:00AM +0000, Mostafa Saleh wrote:
> Currently, QEMU supports emulating either stage-1 or stage-2 SMMUs
> but not nested instances.
> This patch series adds support for nested translation in SMMUv3,
> this is controlled by property “arm-smmuv3.stage=nested”, and
> advertised to guests as (IDR0.S1P == 1 && IDR0.S2P == 2)

For the whole series (3-9, 11, 12, 15, 16, 18):

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

(and I think patch 16 is missing Eric's R-b)

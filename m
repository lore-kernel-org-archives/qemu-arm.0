Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3661146ejc;
        Tue, 29 Aug 2023 06:24:00 -0700 (PDT)
X-Received: by 2002:a50:ec84:0:b0:522:2b76:1985 with SMTP id e4-20020a50ec84000000b005222b761985mr20679931edr.2.1693315440621;
        Tue, 29 Aug 2023 06:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693315440; cv=none;
        d=google.com; s=arc-20160816;
        b=Beho0IKrohGigC6l6Vf5MpGSZM/9i0tj3Oeyj31Kvwq49wF1jXgP6U9ZK+ktdxIxIo
         NL31IpF5YvfdHY+tqYBjfeazlKXvQ1VG1V1JaHuh2YHKahXiRbTCgiV5MZaoDm8vyDZs
         ks+0jB1ATumdz1YO/k2Csd4X7DR4GnpPyib77IcaYppNJx+Y8UusdW9XAHpv8YABhrhj
         twIRFBOXaE3I4eanjp4GPE4p5XSnmGkM9TgAXUHkqbZ5vVbx5hbQ/RN66Ghpk+u6A3OE
         DzQHUE5Q1aPiybhTgkVmiE7I8G5Zr5laqLN2HsmBT0QDe76/ge7u8aiaLHEnfw8fi/yK
         gorg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QOKP6BVOjMM6N7KawWSRFGn3umAy8kJ3B3bH2V5qpzU=;
        fh=6bM/HriA4qWBRMYusCEsKibyyLfl3BL4rYINTom/YrU=;
        b=wOGb/FhA4MV/ZmnnUQ9BnCN3NDoRZ8BcrjocWKUSq5m6usobs+XhnvYRpOLytshi2H
         VB3D2QpUVB4YkCaI8U/TimVpZwq8+biC8Q0K4A96+bfBL4XwjiMAaDSJAW1EdN86vdZy
         2HWpKn3bltPtXSE+W0hgAln5PUr0KJUi6BhJR5pJDc9XBuAGHqDLiLsPBjWBFvSvltTp
         lwGA4l73cALjMVrQg4a5DVtlVDLXSLMywp9/s9tZ+2Y0eFMpy/KcrykluxpdCIn8TKW9
         c7bW4u+pf2v20M+tO6aYVS+1vkGhOqpTeK0B7mBQ/iq7jL6QwfdgM+q6qEWbhwsSXoyW
         +SaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTOP45Cd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r21-20020a50aad5000000b0052570970b0fsor3411940edc.3.2023.08.29.06.24.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Aug 2023 06:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTOP45Cd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693315440; x=1693920240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOKP6BVOjMM6N7KawWSRFGn3umAy8kJ3B3bH2V5qpzU=;
        b=tTOP45CdM5NUO/x2hzhqEzzfDxYIFaoGEGqunLRe8ZQ7s9twxpOqEWRYgTLT//Fedx
         G5Qf1E0ZwJsC+lantV+/YDQxWTAo8B2fuWx5gwDwyB4AOZ7rR72yVeaftIxoEujMxcE5
         yk/wrxareqZYRCCvAjiIlGNVzyfvELs43T8aNDg+rws3ttc8tvHEYvQGxpO20rAqagGB
         2QHEVESsNwI4eZNqo0HmEP7iNDCb/1Hspv2BAelkx2P/AYLAD9fJe5UuM4YX3QQQ1Sqk
         d4biFqokSJBW/SGsjRtUniN+wg8UTCvxKaU8hmMj861RBqEqy1dd9i8R5LSSH/zUpKcK
         SD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693315440; x=1693920240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOKP6BVOjMM6N7KawWSRFGn3umAy8kJ3B3bH2V5qpzU=;
        b=To8I4fJ6Emxje2touhfkwHZD7nIZtjhVK7rlGEphrk2WPFjzr6yBIT9Yjq4llqKjtm
         0EzIRSk5EzGO2AhFXbHkuax9rGVVpn6D+oW9wrMr6LqdQyA9ATJ2LTeve6dnZywFCWny
         dKGK1YqE3xOSm2QALyJildKNBi7HtEAJV6Em7BVOHjN4wSmbiONtK0bIirZxKjpjnZHK
         w4Gg9iUaZ6I26aVwgq/uOMOBweWJmcDNgeiBtS7CVtWcOIaEvHSsNgPP8QwJGHPY8iKV
         a3x0XRUyB7BHfIEjwQD9bEiNmA2OItiJpU04ZDDeJV/2QvZCa0KNt9mcnzpnw3vfbwTj
         91yw==
X-Gm-Message-State: AOJu0YzzHY/6dMC+5ZcjVTepdA7qz+Shp8Qr5F/vg7VGBnNwOZILInSh
	lHCs3+X99Kpm8dSVi8f85E+UO1LyXX9/BMtd6l1Vk+aqPx3TAJME15A=
X-Google-Smtp-Source: AGHT+IF9Bl1R+Jh43e/A//mGKCqNOK5TMgltniSD6tSfwG1O9UqZbFACNUZVJU4hBz74pWHXRoNa2xlijUKcksv7PjE=
X-Received: by 2002:aa7:c741:0:b0:525:6661:dc90 with SMTP id
 c1-20020aa7c741000000b005256661dc90mr19849027eds.25.1693315439975; Tue, 29
 Aug 2023 06:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230824075406.1515566-1-alex.bennee@linaro.org>
In-Reply-To: <20230824075406.1515566-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Aug 2023 14:23:49 +0100
Message-ID: <CAFEAcA-n7KVVLEUjYYkPMbLPVn+daXb4iDwe2H3x7KF+BeKt+w@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: properly document FEAT_CRC32
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-stable@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: yWkBZZeTI8wg

On Thu, 24 Aug 2023 at 08:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This is a mandatory feature for Armv8.1 architectures but we don't
> state the feature clearly in our emulation list. Also include
> FEAT_CRC32 comment in aarch64_max_tcg_initfn for ease of grepping.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: qemu-stable@nongnu.org
> Message-Id: <20230222110104.3996971-1-alex.bennee@linaro.org>
>
> ---
> v2
>   - dropped the breakdown of setting ID registers in other CPU init fns
> ---
>  docs/system/arm/emulation.rst | 1 +
>  target/arm/tcg/cpu64.c        | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rs=
t
> index bdafc68819..65d1f39f4b 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -14,6 +14,7 @@ the following architecture extensions:
>  - FEAT_BBM at level 2 (Translation table break-before-make levels)
>  - FEAT_BF16 (AArch64 BFloat16 instructions)
>  - FEAT_BTI (Branch Target Identification)
> +- FEAT_CRC32 (CRC32 instruction)

Applied to target-arm.next, thanks. I pluralized "instructions"
here to match the Arm ARM text.

-- PMM

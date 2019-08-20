Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4120714wrs;
        Tue, 20 Aug 2019 08:31:38 -0700 (PDT)
X-Received: by 2002:a05:6830:2094:: with SMTP id y20mr21948457otq.36.1566315098517;
        Tue, 20 Aug 2019 08:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566315098; cv=none;
        d=google.com; s=arc-20160816;
        b=Zqg6qOEeRp+GNafPKr3Ecnt/sh+H1XB/No5J1qSxj5i21+Mtgi1lPAzgkGHkUvK5SS
         IcrBfWvgmQIpTdWntrmHgAqyga9X+uSpvdJbT7vNc6Wrjcqotc5WV91syMbjl4oB5Hkx
         sNP/2ZKgimLx6NGsH1iz5hzbAv05q55kEPvvthH9KS1fQ1MasfDVZqG0qWeHx6abmy31
         xwq9TYh7STx0wt50APXIjCm+mI/SVrwbPC4J5c6VssjFr2SVXg5/nTByO8nggDW1LUuh
         q1VnRGEP8CKvNAJ2mS6ivqANxui29w9Wuvxha0tIP2UeWFlbUx0IJVmeTK4C1EWL++xS
         YxoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zpB9XLMo1Q8vxKxjfFa8+dNSfxsG4UwS/v+5EZ7yVGE=;
        b=h8RqZOlpsgPd59TytSTERuMDI+oo5Kxt5KZOD4iy+TDvCdZOHx67DNgTzWmS6U1Wfa
         hzyuABO9Rm0NhH2IaESZidYBJow1IKAgqOTUyEK8b9rGjeeiVS0ZdhH3s9Bn5MSw/ka4
         2CNyq+p0VPmYs80PA1avtl9tmmqsGoQjsfjrLY1UVlHdNvsFTyssGCIAIpsO4DUW0BJc
         Hgh8//+sXA2M4nZFCPzHOicUr0s8xptUfuUKWSOJbSYKCCIzcy/AYlCvDhmXju/03JDy
         ZOx9M8GyglIFGRuSmhSd2xW2NmTuBXiXxA7TVqAyxK0UF3h+cLAA2+CJwjgciCCGmU0m
         dxfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fiuNZ+MU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 2sor2197663ots.16.2019.08.20.08.31.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Aug 2019 08:31:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fiuNZ+MU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zpB9XLMo1Q8vxKxjfFa8+dNSfxsG4UwS/v+5EZ7yVGE=;
        b=fiuNZ+MUpFYo+Un6MR2cnrRt40+xZysKRDRPqjnra2SopPGAIPOxNxhd90g03VEiuR
         zPLCEtJTdMp8VObOJBjItr1W6SON6nZ24BC3oP/B9rcClfP1W7jgnI3mDJCilKrf4wgB
         tcLwJyqz2mgv2MCfUC7eLPiX32Ubc6dG9HohmPG2X28dfGnXP1tRYXkxTLuWKdGNbg/a
         3sEZKNk7hpAgMEGamTuCCsDzJAuvVAAF8xGT99adCzp5B5Xw2M0TgBtoBPgCFcSI/H9/
         O0PmngspOAd+RyOtFHqpHMqxnlVYXOVoVxVeZR0tPOrOxqTa6Y7tTdwh3appCZMsb0/v
         Qk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zpB9XLMo1Q8vxKxjfFa8+dNSfxsG4UwS/v+5EZ7yVGE=;
        b=jm1XGBIPbuy3M4Mn4BJSyH2G/CRxSL1XJBHYCXm24jE7xyREHQGyVF2peI/FTMU3HF
         VNMHzpOc+lfxOU5pMiDWTUFxWQLh2nbuXWelgbFRsnF2GhZOM58dTVXMexLqyIDNfUYy
         prkALig+MO9M5W8UKvrbLfMGKU8OgcgSquPpHcldAt5EmuuOiKBAgGtGCmbbeCd4KPkO
         VwnyFeHnOyauJw8Ezxgzhzk9UOCnCwSHnXyuU046z7yh9JG+TPr1B8RcnObZ0Qv5hiu0
         bVg8WZZAygn4B4AVmUERUzOV4WmO5+l79R3WCRbBEoH0ljHUGvCWIhYPF0qt+nOIOrSI
         N8Xw==
X-Gm-Message-State: APjAAAWRCBjuuFqFxZJ8wZFyUeQpii0amwASoWlL6jSsP9vTD9hu/4Dx
	jm30V4vOXq5kEpt5nlCqb3FjHdjgG/5n83Q6kYnRxanY
X-Google-Smtp-Source: APXvYqy5h7Y6KP2UHXIsqChtlrxY4OxuU/O1HVfFIGAh8uHoRnhub9igSYF5/qJKQQs5PvLPkIfpYU9q6Qn67x4Cpj0=
X-Received: by 2002:a05:6830:2103:: with SMTP id i3mr23438141otc.135.1566315094670;
 Tue, 20 Aug 2019 08:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190803210803.5701-1-richard.henderson@linaro.org> <20190803210803.5701-7-richard.henderson@linaro.org>
In-Reply-To: <20190803210803.5701-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Aug 2019 16:31:23 +0100
Message-ID: <CAFEAcA-cFi8BLBhh3vPdT4d=ps_pmP5gNz1W00mskVhhzN175w@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] tests/tcg/aarch64: Add bti smoke test
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Dave P Martin <Dave.Martin@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: reQnOCnBNPNJ

On Sat, 3 Aug 2019 at 22:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will build with older toolchains, without the upstream support
> for -mbranch-protection.  Such a toolchain will produce a warning
> in such cases,
>
> ld: warning: /tmp/ccyZt0kq.o: unsupported GNU_PROPERTY_TYPE (5) \
> type: 0xc0000000
>
> but the still places the note at the correct location in the binary
> for processing by the runtime loader.

Is there some way to suppress these warnings ? 'make check-tcg'
output includes

  BUILD   TCG tests for aarch64-linux-user
  BUILD   aarch64 guest-tests with aarch64-linux-gnu-gcc
/usr/lib/gcc-cross/aarch64-linux-gnu/7/../../../../aarch64-linux-gnu/bin/ld:
warning: /tmp/cccZ8Fk7.o: unsupported GNU_PROPERTY_TYPE (5) type:
0xc0000000
/usr/lib/gcc-cross/aarch64-linux-gnu/7/../../../../aarch64-linux-gnu/bin/ld:
warning: .note.gnu.build-id section discarded, --build-id ignored.
  RUN     TCG tests for aarch64-linux-user

and these are going to come up in the merge-testing search
for warnings in the build logs...

thanks
-- PMM

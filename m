Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp894732lfy;
        Wed, 5 Aug 2020 12:03:02 -0700 (PDT)
X-Received: by 2002:a05:6830:2091:: with SMTP id y17mr3718116otq.276.1596654182087;
        Wed, 05 Aug 2020 12:03:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596654182; cv=none;
        d=google.com; s=arc-20160816;
        b=Rt2iyHM2vJ/6mHA8nfO8wO3qzn91yGAX+StuCuWNsSjkkA8vvO7uyZK8qZY7PxWPEH
         mDADg7zQ2TF4bjTVVdowvqKclwbiqpZQozwVBGpGMnA3mU/FY3z0LQeXWJyunAveUcK0
         4j4UcsA4vHOzCxdnrx3HGie33Ewxyt+AroEFAXfcUDa2VpTkoFK+9POka9cYmemaa46s
         tPzs6H7LojfEqr1C1XgHFsPkFb8nO6fFM2GZQTyDFc1KeeYMhEWfa3hRdittyZi4s7wV
         uGIePr1ZYivgDke7KDBTtMBVet1sb/MxqMdsnU7pDGhfSMHAQpz9HzDJOMW2ivGS0ZP/
         VYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iREQpVcvmUgkRTy82rJE18VB38/uIikwuQyiEWDCr0Q=;
        b=0oCG0vxRAPUxEk8RkVtsY5NL733ir3AmWFeslxklc+yAL316K6xyR6YA1HaM6KbXnP
         OMR6j7CG9lRBkQuv2wA2k95hKeLcpX+6lIim6cju5ah6e2cKdz+xRbUrWQzZLm64qXNh
         bXCAxnfgld+RNlbxDDJC3h6Ekx3L9RMGGP/HGUONd4FWEQ8uSpWiaovtLT97eqfDTd2H
         pyV1r+TEzneM/spoCWcDQDB6/wxIiialx/U8UPebbXjcfFCzlQhHe4OvwmhPI8Iz7mI6
         9vrZ1CqjtAgSduIwnyqUymRgb7m8GU4+mkszOhlvOSsSKeg6BG7fAOY7bF0oH/ePWf4j
         m8+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yzE93/A+";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l190sor2733900oih.94.2020.08.05.12.03.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Aug 2020 12:03:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yzE93/A+";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iREQpVcvmUgkRTy82rJE18VB38/uIikwuQyiEWDCr0Q=;
        b=yzE93/A+vvmyc2tni7zWiCCToouuSsHdIXdFpJ0Ed7nwXClToBqE9BFoNhRJikFTs7
         /FxrmBzPMMqKA3N6Ln/j1XtkD0UEVsPEmL38KQmoQY/uzF3OLOyeSZfz2z2KWx5dNwrd
         /Nw8jTsGiPB1LTtxRcvHVkaomvniF8Fjva55iEOsSHT39ok0MyJXC/j1iQgXP/qIGxN0
         rdbJ+jvW5+FZou8n3dMQVtfHTU82RC4KjnVLIp7YqQ8w2P4XrQT5MvQ+zy9+iZ6LT151
         PEMSrK4MVztLngMVW2n3vc/2EEpt4YYKmBGJnVyDrwQGYHY/Uim8jNo15rrl8Tv6taNq
         c7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iREQpVcvmUgkRTy82rJE18VB38/uIikwuQyiEWDCr0Q=;
        b=sK5/yrmtGtYTZP8d5GuwuvXeSpfLo9ZSqa/SB7JP0kRArLoro/JCCLtOt9dhkSi/yN
         NVRRLWC/mUK2Hsv5yAhwK6R+TM/XRr4qnCfdWZyAWmo2H/7BiTAmtK+3rSQUqvRnu2CR
         lKJkUwrQtZ6luZVUyDDN/1JkwaOqpM192bR6VyTdbBi7qxvGccpg/XxHW1WIWmmqOLQf
         sgjhNIJYwxkqz6yXRlKEkKXMQvsASnudXUPb8+CaXMOTvkwFAoP8J7npDKYPo2IP4kx+
         uJz2W/3F6XNbaoUNVQxELaXxCPZ0/65A+qMX1LZ/lMeeaKzyo1pkc3vMcmlL89wj6Tfi
         ULoA==
X-Gm-Message-State: AOAM531BjHK0y6tKnS4ONLPynj3i3eGgtBMzHYn6U6GUC1P8lz1nvPaD
	q0Z1XIqE9G2gigdc5qc/inbGuE23pyuJuLypVK7AnBXW
X-Google-Smtp-Source: ABdhPJwkH7R1Fb+tri/6ZRD69nfZsXATUAIIjVHriW/AwHlvHgmDLL8K7vMRfMjZgIsxQPePO1xz6gLTxuH5uSZ1v2Q=
X-Received: by 2002:aca:5703:: with SMTP id l3mr3727440oib.48.1596654181520;
 Wed, 05 Aug 2020 12:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_6zbOfdVi+Tp18seaEy4don1GurVya+E+QXRGrZ_WVLg@mail.gmail.com>
 <2c5ed9d8-6d79-1b53-5588-8fb9efebf0fa@linaro.org> <87tuxhkpo2.fsf@linaro.org>
 <CAFEAcA8+acTg6KoBDW5-7FvnrW=vDMXohWfTAXtTFv6BDqyuRQ@mail.gmail.com> <a1e53e0c-fbab-a789-5f07-cfae99b6042a@linaro.org>
In-Reply-To: <a1e53e0c-fbab-a789-5f07-cfae99b6042a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Aug 2020 20:02:50 +0100
Message-ID: <CAFEAcA96CBz_h6xzwdRL_Ls2rGjLEKi02uXB6DS2Bp-56Bhe8g@mail.gmail.com>
Subject: Re: v8.1M cpu emulation and target-arm feature-identification strategy
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: M3p7KYxTZ3nQ

On Wed, 5 Aug 2020 at 18:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I've always assumed we'd never get rid of all of them.
>
> Older ones like XSCALE are obvious, but I don't think there's a clear indicator
> for V{5,6,7,8} either.

MIDR.Architecture lets you distinguish v4/v4T/v5/v5T/v5TE/v5TEJ/v6,
and there are also some separate per-feature ID register fields for
things which we currently hang off those ARM_FEATURE_Vx flags.
In theory all the v7-and-later stuff should have its own ID register
field...

Regardless, it's hard to see a clear benefit from a hypothetical
concerted effort to convert all the ARM_FEATURE_* uses to ID
register checks, though we might choose to convert a few here
and there if we need to overhaul the code anyway.

thanks
-- PMM

Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4962847lfg;
        Tue, 29 Jun 2021 06:54:40 -0700 (PDT)
X-Received: by 2002:a05:6402:154:: with SMTP id s20mr40753553edu.103.1624974880470;
        Tue, 29 Jun 2021 06:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624974880; cv=none;
        d=google.com; s=arc-20160816;
        b=aPqYzhl4ATa1oWlZCnIyMX6VAz+gbQGu42QPZMz80JEMA4olJFFlilCWZlNsapmExo
         WMrzH8lwD8uqNxl0WaJydgqV5b8hv6s9k3BKJj70SbmQO9klATSPQFIxm0CqMB0J3l8a
         10keUeeoZvdStd7hQqOSpzf8uSluy5cb5lNbbMFBEtZlZm6t3HuvyEHmWQ0FIf3iqFbz
         VMi0P9IVeDIse0IXANlHX5onPoWdduZUwkBOnYjGiK6I8EiU0IrJLblY8c8qn0DavIZ4
         4L5Xz8yikJx8SNFcdhPGOoJeBcmik2szzDlb+qXX4+XOz/VzCowczUpdUB5mymKZyAyH
         i9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WPaKFAZoKEvgNPARIT/NXavQ5odyFKkQ5uHico6xuZc=;
        b=qD6x02Xgb12X6wjPx7aXPQSQdLhOk7mgs4ngnblmnY4Bc7635ZthXUZmY/9j8RsgNN
         BksKm2gupSPJVSJrjDZs56ZaELqa4LJMk7DCG0OJibOLgH+MKsI0yiS1p3buuO2TM0W4
         /BJF82MqKV1YtLpRnt7MvH3NYx7S1ifYeeutadpkfMV8WShgumJmE3gFFmkJyIYXNBjm
         wizeg+DjP1BTqhidcEPoOl8JnK4sLfxieQgfscGARjCxHp4cbYUbMZicqjn6VadAIwnv
         RHgsPhYMtF9tP9Vw6lDQGOQ50O4n/bYsXolaF97YDr+la3dvzZKeUGYLTjm4iDoh1p7p
         lWAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="f5xZl/t0";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u15sor16051334edv.8.2021.06.29.06.54.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Jun 2021 06:54:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="f5xZl/t0";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WPaKFAZoKEvgNPARIT/NXavQ5odyFKkQ5uHico6xuZc=;
        b=f5xZl/t07KIFGHZIMw1JyLkLRgb9cdvoiSJR/NCBkNV7SWB5g1fx+yypQ18SZ/8pcX
         bQ4hwz4fmbQfL37Tlxck9N478nmI70wsMUSaeVn64DD/MpsNISwIUrQLXcYS3fQZ1EHE
         o1Ns9fyly6r95nVnjn1wfX3jg4IUcEdt1ns/rfiF/jyvTRMB+FTJy96sfP3U+jQQtEFv
         kWgPwkH/LmGN9dBv0Rgu8Vs5nUBCHgAdATX6QEZQ57hp1HfP6Hj8uzIeLosaRuo+oMva
         hpzfLtz6XQMIE3tmpw31cVNbOfGJ733gsZRhYcqWS/99Dt6op/L5jeieDkNMx63D9+8V
         ZY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WPaKFAZoKEvgNPARIT/NXavQ5odyFKkQ5uHico6xuZc=;
        b=MiAsQ1UVTi07UrNwZ8aYq6cAfC7qBBQhg2cnz9t0AYp0v1oq3V0z6+CbV4yZmtgF7/
         /Yf4+783YHZMkdi9/RTg6lv7c5uz6F6VDN+4J11TcHFU148Pkm6KgRikBaOWu7cV98zO
         7NRLTuCVnpoZD8KHfWg3vSLUtyUnO14SvXW9guRS0MrrY0Jq6vAg5EEq3HU6o3H8BgaM
         i4phRMdZMHZU6RcNSHvt3ltdPB+cpB0QqkV6i/PeMKzt56JHkz+nK3nYZ4fx0q6G/9GX
         KbRq1G+q8Q4861e9ozWhutqEVcB+O9ZSsM6CaSx0AV/tyGic5NvnyQf28blarDDqKUvN
         SRpw==
X-Gm-Message-State: AOAM533SBNJ7874sruSHmLWIqtz0fFmK+ZkT7yIbiXUk7irdZ17M4uoy
	9p58xwaVRwRuIK4DECO/5XE0YxR9Z7HqJY8KBJxZK1GI
X-Google-Smtp-Source: ABdhPJydxA2ty4zLFCSlGIo+auDtm81szUwaXqZ44zTX3EdQYKaeQZpXILP5a2k4Zd8u1khZ8U3LJ7Alfb8whi792Kc=
X-Received: by 2002:a05:6402:848:: with SMTP id b8mr40200464edz.44.1624974880177;
 Tue, 29 Jun 2021 06:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210618192951.125651-1-richard.henderson@linaro.org> <20210618192951.125651-5-richard.henderson@linaro.org>
In-Reply-To: <20210618192951.125651-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 14:54:03 +0100
Message-ID: <CAFEAcA8kLZnpYjrdRyiUFmJqtAWKMw8xLW_GkW6pbenoYsb3gA@mail.gmail.com>
Subject: Re: [PATCH v2 04/23] linux-user/arm: Force v2 frames for fdpic
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-TUID: aLW+iuDY5qxk

On Fri, 18 Jun 2021 at 20:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The value of get_os_release may be controlled by a command
> line option.  Since fdpic was added in v4.14, and v2 frame
> were added in v2.6.12, this makes no change under normal conditions.
>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

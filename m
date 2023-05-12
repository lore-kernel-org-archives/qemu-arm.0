Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4846845ejq;
        Fri, 12 May 2023 07:49:54 -0700 (PDT)
X-Received: by 2002:aa7:d455:0:b0:50d:a27b:10c2 with SMTP id q21-20020aa7d455000000b0050da27b10c2mr12865075edr.6.1683902994385;
        Fri, 12 May 2023 07:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683902994; cv=none;
        d=google.com; s=arc-20160816;
        b=blXijrMM6s7gFLluuPoXXM6v9LXuVYJ2ayWKzy2WkojixPx9FE/wd4agI5fZA7gfxj
         aIQpE/ERGOsJxP6vWDuCDXpxvqyd/XDPCu26/keZQRHi6n1yQsl1JGuez2sIawdg3oB/
         cN6nJsavu+LCUlyW6YbY9EaYzRxFrJIoQyiAe/+VlT+FChOCg/cjHtZlKqG6D4PK/liY
         MGlvT/vbhL6KA34dQbr1JzccQRZ5b88xN5Rv3Q3tfCjDrvwz/7gdS0/BW0cfpQu6kGi/
         MAOQbJhT54rzbvkA7yTOnSEg94Adf+W+XgL98jcnFfU5EzGI7/wpE6XfxTNlTbVqs+tW
         uOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xZBXrg330SH5MhDt+hBaIDpHCoQ1Ljx3OTOsDdySBYs=;
        b=J6lGWbXIO3x86j56bgng82VRt/3YseRtq5KsIfhhI9l50iqRPovFRiJddPpU1jUxtK
         cp2MMGqu0pQLXlT9Mn0BKhfqF3muSxU0qaCsO+U/nFo66cYe5RcGlYN3tWB+XOUlH6my
         shx9VgZQYss79JLOLzYIlQ6y81HzTsRkaAIhby3p1bsc1U6CGgnXP/D8rtTawTM9hez5
         GaRmES0GnZSaGVlpJIbzYH/P1nFiB0qbUvWqMe/yYu/S+dMS4Hs0GxOOEHg8q4xfgbdu
         2PRbkYeu9tdEVhllv0pzdYhGxZgSSKWuBxMaWv/xn97S1rMmsu0kDCg28tLFy8Qf1vLd
         l5SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bUSZBhdc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q23-20020a50cc97000000b0050d8c668b07sor3105587edi.0.2023.05.12.07.49.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 12 May 2023 07:49:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bUSZBhdc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683902994; x=1686494994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xZBXrg330SH5MhDt+hBaIDpHCoQ1Ljx3OTOsDdySBYs=;
        b=bUSZBhdclJMEbrjXxjoArJuet8hSNYvRWti2cvJCZKqyKAO6Z68UH40Z2WPS2h9HJZ
         MscEpeZebLBb1x0XP9mclDFQcpOIaoHDoc5A6//4dp7iqy7IUusw2SsrYFBOls+1q6jP
         jDYX9TifoagCvma5BPwjeFuc0QNKJg2r9UV/mrSC6v9JDd5GahDbB6tQWXXQ5zlOH9U0
         z/VvkBoWh1CfUezvaudXn5aGjWVY3CiMyI0MaJohyTiaI6iq33AXDHuPckU4w6Ohprcr
         qLrpLRfkVOUEE0rtczTyIPkNOgmr/xwVe3og3MhSdekydha6KJ8xXWcYvtAmehuWzwnU
         V0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683902994; x=1686494994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZBXrg330SH5MhDt+hBaIDpHCoQ1Ljx3OTOsDdySBYs=;
        b=Rk3Sd6TiwACsi1D9oSnh78Y6OxlQKFcDZBm2BN7StvqU0FCe7HniikWXtUkIsIP0Zc
         KFOaYkzgFDaG9/AaFz7ZIZM6bD0f0FsoxeG56M1FbyIJckYFWUm4LG3RdXSp7QSDsXpH
         XCTiqrgQGoux9J0YUQfM4Bn6hjatduWNgbEQx/RclYgTYqTdHcr326hJKJ3ICCs+/7RN
         WhmL/jWgLXkFRUpFz8iBy7o/9wESVHLQ8TYBJUoBUuQ3QSPUNSPnNydN221XItgGVwfx
         d4aGuV4ENJvQCaGrKCLcYlie7rLcW27Xhv4H4RcLIaTg04QMOvRSDv/PWhc0Cd/ETTiK
         N4CQ==
X-Gm-Message-State: AC+VfDxqyoUQNFCKDnPbQmZ5Xjl19RirS4LaU5EATRT+8Zc74vDus54b
	65WPEcWckLpe0JqGYeSxZRzhMMP48BjmRgXFA6qiS8kw
X-Google-Smtp-Source: ACHHUZ5PmAbepWDNcsTxHx4Efi8DMK4J6g0OfjVMDUhtlV/f4Xk9cLi9M/P58C+BquhFJUljRfL7KiIJJyNE7Mpf+Zc=
X-Received: by 2002:aa7:c659:0:b0:504:b325:bd4d with SMTP id
 z25-20020aa7c659000000b00504b325bd4dmr18041992edr.12.1683902993989; Fri, 12
 May 2023 07:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230508181611.2621-1-farosas@suse.de>
In-Reply-To: <20230508181611.2621-1-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 May 2023 15:49:43 +0100
Message-ID: <CAFEAcA9gUthE_0VAH2EDz4pMqZL=Z=WC9piZNcMeJBFL8-_vnw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] target/arm: disable-tcg and without-default-devices
 fixes
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: bC7XX9AgUhKz

On Mon, 8 May 2023 at 19:16, Fabiano Rosas <farosas@suse.de> wrote:
>
> Changed the cdrom test to apply to only the x86 and s390x cdrom boot
> tests.
>
> CI run: https://gitlab.com/farosas/qemu/-/pipelines/860488769
>
> v2:
> https://lore.kernel.org/r/20230505123524.23401-1-farosas@suse.de
>
> v1:
> https://lore.kernel.org/r/20230503193833.29047-1-farosas@suse.de
>
> Here's the fix for the cdrom test failure that we discussed in the
> list, plus 2 fixes for the ---without-default-devices build.
>
> When I moved the boards CONFIGs from default.mak to Kconfig, it became
> possible (due to --without-default-devices) to disable the CONFIGs for
> all the boards that require ARM_V7M. That breaks the build because
> ARM_V7M is required to be always set.



Applied to target-arm.next, thanks.

-- PMM

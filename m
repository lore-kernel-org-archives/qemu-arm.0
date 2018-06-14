Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2269861wrq;
        Thu, 14 Jun 2018 09:51:27 -0700 (PDT)
X-Received: by 2002:a9d:2b64:: with SMTP id f33-v6mr1938263otd.342.1528995087283;
        Thu, 14 Jun 2018 09:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528995087; cv=none;
        d=google.com; s=arc-20160816;
        b=hyliYo1luLWnchzGuq1SvKIDLKtUA5oxyu7usg8kZEL+Q197MoMsyn9mntnhRKiqdb
         uMQRo8tugejDW6qU3KSQQx2Kz/4bxEyjXcaplYjhReiSR3sIDlVDjIbE1sQ1BslJ2ihc
         uDDKx1dQNVhsmVHlZweIXyh63VVyCPGMTcmN0WuKPvY1sa5pGQRPFvv4XgUoT2vgnz9C
         zLctmFMn/GxWyXkbzwGhh2VjCBdbLGAaOFaMlhQMuPcQkpSd3d3kXYlrqQJtIaiqSB5S
         0QcGasrYiFeKQUJePmq8RUiYsT4oNjBC0QXvRVuyGm1So7YIaP/XfGj5z6hphrRx2poa
         Odfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=5Gvpp3kepbqQQAR+kkKGeuIluxo5tMiHQRHlNBPXDOE=;
        b=dmy+wMmhGjSx4DRjE8UpyaHvaE8cHSkGG0hYKvUYm1N6oib/c9VjiqtTnINj01XGdm
         I3XKxKxg2zOqXEKAHcZ3X6EkzTiVsn40b2XiKIjaHJALOvm28cnVmboft3Bknagjw/gK
         6Spke57m3867Dc/TSC5OZHEgv4dD4bZN5PXEgF+UaqNS1Jzd/Oy8zYnhn9p6HWxXZtQM
         xDAuXf4cWwJAFK1VxFVO/WVPU/O/+THJqNUbG3dcA7bdhhKWJKrKfcNTEt5BtMD1Id5i
         4JQa6VEl3mJhHqpbfylhfGxlgfABv2A+he2Lrd/WJ56FMXj8XynLVTruDnuBf8KOqwQd
         8Fmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G+U1lPoR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k127-v6sor2364008oif.81.2018.06.14.09.51.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Jun 2018 09:51:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G+U1lPoR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=5Gvpp3kepbqQQAR+kkKGeuIluxo5tMiHQRHlNBPXDOE=;
        b=G+U1lPoRlcFZ4U7fSwhTPQ4Twl6lGuv1kbo53+IkkKR8bJBRxlVlim2+tj2kWOb88K
         FNcuortN6q5/4ZnKf1LeNnJEwQTRDHmwK3ctQdKCJJpdKxh6y2bFs+wSDr6+6eDBv46G
         inR00xSOIjSp4TvvfC3mi/yNL8A3XUjiSJw4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=5Gvpp3kepbqQQAR+kkKGeuIluxo5tMiHQRHlNBPXDOE=;
        b=CCmLAQHwnLPlWVXa431u+rKfvrfmSkMs+289zKzgEdGCkXrzpkQ7hQWf8B+cvGehjo
         BSGncM/vhF4wxdIj/Ne5voFDo7KnUxqIU2c8qwXcb0fWJ6OueO8KaatFIdwJqCrVW3uj
         KTTCCqUIjfwf28hrvrxaF7wWDHd+WZ4/9EXb0leyTLUE8MYqmiSeF2p13ADjMV+jd0ds
         d1Qj68SiFCpiv5/KUGx6be6JcymArTHOH6i8h1zE54ONo5CSiduhGS280+R10/6RdrVo
         sNlvoZJiDYastapAIjrOIFrYHM2i9VmmUk3a5Kyg44hX3FBhha/ic5WmqVpy2X16WXP9
         KcDw==
X-Gm-Message-State: APt69E3tTQRqN6TEGXWqruDdEQyn1Ghf/UF+BlCvmKszqB0WNzqhWYwV
	uac28sTg2HiETc7kv6/IEqFD/nQYRbV2u6Lu1SWYmp2v
X-Google-Smtp-Source: ADUXVKLPUmGRiut9Udg525I7nlR/OevtR8chATaMXNrIUdTwEdUDsmdo1X4qIl4FIPsf0jKBBcSa4tboloe0I6Z9TGQ=
X-Received: by 2002:aca:5383:: with SMTP id h125-v6mr1723217oib.252.1528995086910;
 Thu, 14 Jun 2018 09:51:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 09:51:06
 -0700 (PDT)
In-Reply-To: <20180604152941.20374-1-peter.maydell@linaro.org>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jun 2018 17:51:06 +0100
Message-ID: <CAFEAcA8OO0SdmE4nJhcQg6kWPcqs-5g8BkjOREw40aUchc6RXw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 00/13] iommu: support txattrs, support TCG
 execution, implement TZ MPC
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Cc: "patches@linaro.org" <patches@linaro.org>, Peter Xu <peterx@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-TUID: u0Y30H2tjc0q

On 4 June 2018 at 16:29, Peter Maydell <peter.maydell@linaro.org> wrote:
> Hi; this is v2 of my iommu patchset, which does:
>  * support IOMMUs that are aware of memory transaction attributes and
>    may generate different translations for different attributes
>  * support TCG execution out of memory which is behind an IOMMU
>  * implement the Arm TrustZone Memory Protection Controller
>    (which needs both the above features in the IOMMU core code)
>  * use the MPC in the mps2-an505 board

> Unreviewed patches: 4, 6, 7, 8, 9, 10

Ping for further reviews, comments, etc, please. I'd like
to put this in via target-arm.next in the not too distant
future.

thanks
-- PMM

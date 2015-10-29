Received: by 10.182.105.169 with SMTP id gn9csp531309obb;
        Thu, 29 Oct 2015 07:18:28 -0700 (PDT)
X-Received: by 10.31.181.209 with SMTP id e200mr1316840vkf.123.1446128308337;
        Thu, 29 Oct 2015 07:18:28 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com. [2607:f8b0:400c:c05::22f])
        by mx.google.com with ESMTPS id 134si969572vkp.147.2015.10.29.07.18.28
        for <alex.bennee@linaro.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2015 07:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22f as permitted sender) client-ip=2607:f8b0:400c:c05::22f;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22f as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by vkex70 with SMTP id x70so27078289vke.3
        for <alex.bennee@linaro.org>; Thu, 29 Oct 2015 07:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=Vc0WgM+gJDFa7jaGGXr/G2ioY0yO3PzyJAvySOZoVnc=;
        b=OYR0djNiJKgCsAppzQGfPWqoqIUzTAHUDwKaYMvmes5II5xrOGDFP6682kBWyju/40
         pgXLfH9r+ycqSLhztlXsfXnU7loc5B27DKU5WD51KfAhkmmgPR8ZdEgQYJl2TPqxUOh6
         iHUBXxMY+zkEWYamZSlutlLbPBh0/8JazIcyol3T5A/gsOsC6QJggJoRmeTuy8AfjMGZ
         /hnIl+iF8UaMdg0BPDB2VPWzUzT+biO9oAYd72S2g/XZI55PIi3AoRO4pazbAEC3iUnh
         3tn0FaajOI86Lsp5SWmsxgfhoBDehYA6SyFgrVDO408HZZl2oRLpz4vhdF5NJTzcHVkj
         vYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=Vc0WgM+gJDFa7jaGGXr/G2ioY0yO3PzyJAvySOZoVnc=;
        b=B8wg/JMdOX9GSkt3SCsh5XXyq0RVmNQGYpRmU7c39txz0E92bhhMrsjYqBBb6u6oGg
         rzVYQlKfNDTAhiCE8N3ug/YntVPihntu5vnJYRLzIxPyXg9rmrQRpOnCT4v6iMrMSkmT
         VlzS7csahbjmDV/rQ9xVu0bs/TjeZ9fnp4GPgGMNeB9EOpyFHLNCJUPQ73zf/oyUPIOa
         sKJStG9gVtal8ZrHk1X6AiFbI6qPFD0j31RtYrf/um0QLT/6nToS1YmU5d5hcn4nFlzM
         HdlXwJXlBV0tKuiYNK3UOd175fBo7TMGexFOS60xQUHHPDWyUPR/BZuixk6ROSPH6gTF
         hMbw==
X-Gm-Message-State: ALoCoQnauaBc/esgh9M4y3fZCr0lRoifzd+YmaHOvna3M37EPmyUiMKDVkkRQ5AtlYr+H8Yc4XBp
X-Received: by 10.31.136.144 with SMTP id k138mr1319094vkd.92.1446128308086;
 Thu, 29 Oct 2015 07:18:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 29 Oct 2015 07:18:08 -0700 (PDT)
In-Reply-To: <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com>
References: <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2015 14:18:08 +0000
Message-ID: <CAFEAcA-7KkMF3X3gab-WYNt2VT67Tc1eovjMdNUb0RqWtorojQ@mail.gmail.com>
Subject: Re: proposal: new qemu-arm mailing list
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Peter Crosthwaite <crosthwaitepeter@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-TUID: 1NIGgQa1keWC

On 27 October 2015 at 10:15, Peter Maydell <peter.maydell@linaro.org> wrote:
> Hi; it's been suggested to me that it would be helpful to have a
> qemu-arm mailing list, along the lines of the existing qemu-ppc
> and qemu-block lists. The idea would be to get people to cc the
> list with their ARM related patches, so it would mostly act as
> a way for people to filter their mail to separate the ARM stuff
> out from the qemu-devel firehose. (Everything should still be
> cc'd to qemu-devel as well.)

OK, I've now created qemu-arm@nongnu.org. The mailman subscribe
page is here: https://lists.nongnu.org/mailman/listinfo/qemu-arm
though of course you can just stay subscribed to qemu-devel and
filter on qemu-arm being in cc...

thanks
-- PMM

Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp860677eji;
        Mon, 18 Dec 2023 07:13:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUTYonpOj8Y4NWOuXfE+8+rkbJvKlBa4NXlbAFBuaDNPoYn6MFxnmvqeI6Ojv8M3d47IbC
X-Received: by 2002:a05:620a:4e1:b0:77f:3b1c:1802 with SMTP id b1-20020a05620a04e100b0077f3b1c1802mr21402392qkh.6.1702912410937;
        Mon, 18 Dec 2023 07:13:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702912410; cv=none;
        d=google.com; s=arc-20160816;
        b=KLOT7f9MQX1ObRG5aomWzGoESUD9rVEwQuVBUVUqHdZ/TwR07o42SkdJGAEPQXCRTT
         raILTbN0czxEu1uE/3XhYlZTFexZoB3nmiY2QeHO+swkj4xlhQe+SK5/YKcz0Er9lu/q
         CbXErjKmfHNxDvgrmF6RYoJfNZcVJjpJq06SCq7Uv0PyybJGACNOy5MibQEet80NTvW8
         fQFfkSVWHIFHn6ugoGfdKmpFyr/Ia1ir3zG25eUmmr/lUYkR9bNjTATypmr9aeEW2jyN
         jhG3kLtD9bsx110uy0kFDEmw/yKsOIrpOO+RahDJxj2uMcrgf76Atcm9QmEH4qI0Nn97
         YqoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bYeSHm4wswRJn6b/WQ53Z7Dgquy+ccBZWzRwub9ZcOE=;
        fh=fCYb2nWR+z75YKAHpSPy6WeIbB/aEi3LD1ao5KRhgFo=;
        b=QooaIzZQlwJyQ/VZrfur1QBszAYtXv4xIiwwfy6u5jZIBc2Z8Dc5/S/2SqbRftz+yZ
         LoDIlFIIgSyO+vdpWC5nxShIJHkDR4RzS7MWpcC1gWBsbZ0Fcm+dalTHq3vfJwOALVBn
         AY3ROLc5OVe9Isl2sfV+zZBz3QreRuRsXh5Qu9AEXizTzU1qow+Ln7pcuQV7eKmM53qm
         bMZURtfUQSNwmUEiQ5qHet66DBwhFY8hWMSM8GifUzAv9w1mknSLdqxJ7hkomzO2qkid
         buuqajOud1305VWxTV+1aDJA5hQ5rq0As/B4Qa4/Vc/PUkxM9K2KrQ4KUHJWlqJk5FbL
         eRnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yt0cPCs8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id or15-20020a05620a618f00b0077dcf0e1604si24116145qkn.717.2023.12.18.07.13.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:13:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yt0cPCs8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFFIt-0006FA-5n; Mon, 18 Dec 2023 10:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFFIr-0006Ep-On
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:13:09 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFFIp-0000mh-Lo
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:13:08 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5537114380bso640255a12.3
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 07:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702912386; x=1703517186; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bYeSHm4wswRJn6b/WQ53Z7Dgquy+ccBZWzRwub9ZcOE=;
 b=Yt0cPCs8FlbEVM+0VX0O6+q3RbKZedRzNg573ylnxB2AnXEX+uF4K0o1N6Q7K1umN4
 wilNP3QbHg9DWeTS5uWm1faIbDywe/yG6Q9aV/7S5utZj+d6UuZ1JH5XuXHcSjMAwpNh
 WHUD1xb/ewmRLHwTPDF54yppQt1McpGDvBxWWao7UKIEKYt0T6ooX+gnIrqEDs17iuwx
 kRSazLIV/pWA/sS+QG9sLN5YicIcgDnVU0VfPuj2gxtwswD+tziijK7lNDqVLltRKr3r
 Yqkt/l7DkLyPeXAG3R0MlSyv5KSKJbrbUPjNYYiGqkkByNfiIi/Br07sacGjlXjrt/ET
 r2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702912386; x=1703517186;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bYeSHm4wswRJn6b/WQ53Z7Dgquy+ccBZWzRwub9ZcOE=;
 b=OUtAeefP4wYu0PFt/2PQX9AQwkh5Wq9KFd8+ZGs7AISv9R3e9SzUk+oHLQB5sHNfe+
 Ni7yp0xnq/YSktwhAa1DxC6BYBOFxqVd5Tw6v/0O8NhBNJuUWSNBSBPQt9qE/WPnMe+G
 Z/rDwa3EGbtYEo1xAi9HiVW92LnRv6ptMNhjpwb3/8Vg6xmoIYWrzbTtQx+dMGMtcAvr
 RfGEr55XfHiDzT9YCPzoTcR318CFFjGEOLS6BrJsGl3F5uV6B2PpGa3gMDWqYCX91ah9
 X6n1biQGtUnENe5+ETv18B05vMVgu+cwiA0nHuNPLcsTFBKHkZ4UF/wnBY/MPiVWPhOO
 edxg==
X-Gm-Message-State: AOJu0YxMxuD3dMVfD87MN90wnInnbmvznmz4Ae/LKwEf+wFagz3C6TCQ
 4piERN+JYjcsvgQMhlS/4iPKO2WsRYEUAdkRKri67g==
X-Received: by 2002:a50:d095:0:b0:553:6692:db67 with SMTP id
 v21-20020a50d095000000b005536692db67mr815664edd.12.1702912386045; Mon, 18 Dec
 2023 07:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20231216133408.2884-1-n.ostrenkov@gmail.com>
In-Reply-To: <20231216133408.2884-1-n.ostrenkov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 15:12:55 +0000
Message-ID: <CAFEAcA_yXDfq8Q=374dtbWz=-SeioF7gxVFqtGuteTLZQgjZ5g@mail.gmail.com>
Subject: Re: [PATCH v5] fsl-imx: add simple RTC emulation for i.MX6 and i.MX7
 boards
To: Nikita Ostrenkov <n.ostrenkov@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0652GXG2hdP+

On Sat, 16 Dec 2023 at 13:34, Nikita Ostrenkov <n.ostrenkov@gmail.com> wrote:
>
> Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
> ---
>  hw/misc/imx7_snvs.c         | 93 ++++++++++++++++++++++++++++++++++---
>  hw/misc/trace-events        |  4 +-
>  include/hw/misc/imx7_snvs.h |  7 ++-
>  3 files changed, 94 insertions(+), 10 deletions(-)



Applied to target-arm.next for 9.0, thanks.

-- PMM

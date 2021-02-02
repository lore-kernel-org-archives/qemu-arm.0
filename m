Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp19633lfo;
        Tue, 2 Feb 2021 03:08:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXiBN9zf8kgMYQOx+FcrDkz8TO3EaiEQ2gMFy03VNtmGKq2sUP3RPnKgEktwpnD4Bjw1cr
X-Received: by 2002:a25:9cc5:: with SMTP id z5mr9513963ybo.470.1612264123734;
        Tue, 02 Feb 2021 03:08:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612264123; cv=none;
        d=google.com; s=arc-20160816;
        b=AQfrxsoJ7xf93+i4xb2+Ix+NFoXQJEU+1a4f/F0JzNVbVu1cSJlhYehR0op4C04ESP
         nAcr4ehHYj1CbrI4Z04JMTZFmEk23iVszUE9orD1uVF95G/nonS/3fOv5Yy+EpzvdOri
         DgxYgHnipPkNehWvfFgJBMVm2/Quy0AFhQVqszF9KIEVpvVhaj5l2dYupV+YFXY6yVIm
         FdoeZ4JNHylPMISYQr3qd2GHYKhSdivOWdYjHHSLM0MGuds4YTTWJ5laPmYuuWqnODTG
         yazZFNKKwcPJgIMhZyt3LTCzKBWQ14xUj0/JuEAWWQMYfgZrPYbquFl7fNNZp9AZtEXz
         JRMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a7hqaW6hEJtiOm4/CE4cMAH+PRLbyPDVjjwBBVgIOJE=;
        b=nHhAOYc8Cs5UCh7vScfhUFmJC8BXzMY/JivmS3hiMMsD2I9Tidj6w+iS1WNw7Iqbcx
         tWpcyGqyH1rHlHMQ704bs0b80HFoYBqdiBSbZYk5cYSmbmvdurTwcNNk2FJtGCWOXXNW
         s59xE1pMq/IrEvxhdbtsz7UaPfg7gbU56rBqDhRQwZtFlv7+2qQy6gqDxLvOKEAmUVO1
         Bz0ELx/Ii4KNpOHv5AAc+UVr7rGwjB688fc7cOdy/qxAwAKicjhHB+HAc8T/1ajMmnuG
         HTDjVZj6JPMpEIoLUjuCBwjSrWk+6YGMCI+/r1sBZ/MIP7IzM3w9MQnFnNOwLDSPdrvu
         hblA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GAh+5urb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8si20283372ybo.110.2021.02.02.03.08.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 03:08:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GAh+5urb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6tY3-0007wN-6F
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 06:08:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6tXV-0007v5-CO
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 06:08:10 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:37569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6tXT-00058U-6V
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 06:08:09 -0500
Received: by mail-ej1-x62d.google.com with SMTP id jj19so1593905ejc.4
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 03:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a7hqaW6hEJtiOm4/CE4cMAH+PRLbyPDVjjwBBVgIOJE=;
 b=GAh+5urbEiNQGe3AyZwZCXjyESdDJqj5GXRrNPgV/V9V+s7xDkG0i2cnkhf6Pji4Xe
 PJbpXrthh3QJt2OgBGZZdmUaDHXpy01SO+2f9F31JtW6kbg3U708cGHVRjWbSk4eeW2C
 LtKXMvnY6vmft9kAj6euDdWFYjU9MkmdqDCj0AdRr/bH0BDZN6L+xbYvTHz7gX1XX8cK
 EptlrVYWfQFEPOZV4uUgHi4nAfv6tunzRgSQLqd2xf/4EVb8OOZ6aciPeV9rHLfgTEEf
 Z+CclTdwmcyjEC2g6JBb7ckSiGaJQLhUgtoubx4V5VpRkQBG+MHvXAoZBxKaG243jiQQ
 5w4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a7hqaW6hEJtiOm4/CE4cMAH+PRLbyPDVjjwBBVgIOJE=;
 b=UU+jKiM/m2y4maoQ9d46Fe2vhsOjQsYNMUETJv0mmw4OWeU+YeIVBvNiXPXreBzKEX
 iDrj1UvOuDD/zoprMzwy5SRHmntYLQxvwHKfg8DmVaKcqZs7RLusLIe4rTjg3tGd1LR+
 JU5JPbI+SlLo5oeEIAV/2j5RvBo3AqcMcF3un1BB9UWvo8IGGSxHIShd4O21U7jDgEeA
 CcmIGcq/y2iSz7doc9vljst4AYgTt72169eWD986pGDtkmAXLk3hvZhWWd4emuRZA77P
 HnklX9A59Iq96N1IaCWoBKZxGGeAdEscCVwjoi8xlySj56pAv/fJq08NvhQELrOKrQTz
 9vjA==
X-Gm-Message-State: AOAM530qzCNem09e6eXfsGPU/VnCH35qZ9LLyslj2MOfcd/SvOnAj2Hb
 uBc/9WqFjC2VvNosud3etMCbBJOltLVfTQJUww+Nsw==
X-Received: by 2002:a17:906:4bc2:: with SMTP id
 x2mr21712605ejv.4.1612264085619; 
 Tue, 02 Feb 2021 03:08:05 -0800 (PST)
MIME-Version: 1.0
References: <20210128033655.1029577-1-iris@modwiz.com>
In-Reply-To: <20210128033655.1029577-1-iris@modwiz.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 11:07:54 +0000
Message-ID: <CAFEAcA8806xXHXjVA5bSSwcAowiqKKdu0L-VQNttULmTtTnq=Q@mail.gmail.com>
Subject: Re: [PATCH] hw/char/exynos4210_uart: Fix buffer size reporting with
 FIFO disabled
To: Iris Johnson <iris@modwiz.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J3n69baTzJVB

On Thu, 28 Jan 2021 at 03:36, Iris Johnson <iris@modwiz.com> wrote:
>
> Currently the Exynos 4210 UART code always reports available FIFO space
> when the backend checks for buffer space. When the FIFO is disabled this
> is behavior causes the backend chardev code to replace the data before the
> guest can read it.
>
> This patch changes adds the logic to report the capacity properly when the
> FIFO is not being used.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1913344
> Signed-off-by: Iris Johnson <iris@modwiz.com>
> ---
>  hw/char/exynos4210_uart.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

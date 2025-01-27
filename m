Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2450960njk;
        Mon, 27 Jan 2025 05:55:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUA0jMLnHe3w9ks50QL9oSY6ZhAA4+5rZSjsAAfAlGmZZCrANfzot001eJgqmF/5PprumAf8n0fmD9vSw==@linaro.org
X-Google-Smtp-Source: AGHT+IEyCjYY+3YuDNo58GtIA0Ll9YVR1bpz1dEwsZ2NIWG37NlI5BvbG3BARRWZRR4HOFe9U0hq
X-Received: by 2002:a05:620a:2a0f:b0:7b1:11ac:627a with SMTP id af79cd13be357-7be6323cc1cmr7495022785a.25.1737986110421;
        Mon, 27 Jan 2025 05:55:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737986110; cv=none;
        d=google.com; s=arc-20240605;
        b=dPhhdzmGOmKxs+KKXFTdNb2r8zPOp0lPWt0aZivzkkFOG7fGNvvm0GCNNFPrVd2ve3
         HukzfFtsdBLSBHDcvXoB9FZ/vdZtcCAFdRf9sC+f0bQGAjavl4lfj2HCF0xBtoNouN1W
         Pxlxd8gTF7LjQf0Q27Z7Pe7Ix3iqdsCvT4R5UtzE/AEukUhKvqb92OEdZ/fDV/L0eoZ4
         VD5sGmvGrvN+OI5bPTMFuZWwTzCaPKBjXWSdT0LtpGjOSkcljy1COYiAZuJ63Rggv3DB
         468ql+2x678meZOwvrdlMI9qPx38i7ALOQxYSqYlf11tPNW5aU/s77gdKyRCDvH0A1tJ
         tpsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8Lhj97v80kFVbDq00mXHkVOBuGzpVF6IYLPxp3Desvw=;
        fh=3kjDWIoUQ4lbrl9bwftPSXIeRXdj8R7MOQ1s9P/CKks=;
        b=AQAn2BUb5rX3lZzduVWXaMocYH33ZAoCnr2BhEG0AB9ikzN6PqO1Y40iy1kiW/mttr
         dq5q/wuQx7+yFMK4l45B63UZZsoA+oxHvTT1uuntNKigxBowIp8e+LWfAlzZfW1EGZkW
         jb4C9gmoC/UX3kvKYjdLxFZLFidiOvpzFONxw7JOO7hbKKnfybhSN9eb0+cxmzgcV3pQ
         T3veC3jAZBnotSppZUe5HxqnVkzQsII0m/JBEhkWXgFwXIurtH4LYZKutz91yXekDxR/
         0Lw6V5zK7Pz6tWskGqTypZQhaBc/cAigVBkaQx4cZWz+zRdqso5kHDwAcnpk3E0Uu8ww
         zNoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GdwuM3E7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9aeedb36si1057495385a.419.2025.01.27.05.55.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 05:55:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GdwuM3E7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPZi-0000IT-NM; Mon, 27 Jan 2025 08:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPZe-0000Hv-1G
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:54:46 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPZb-0007Mq-3v
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:54:44 -0500
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e3983426f80so6641428276.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 05:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737986081; x=1738590881; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8Lhj97v80kFVbDq00mXHkVOBuGzpVF6IYLPxp3Desvw=;
 b=GdwuM3E79uvItA9q6Vumz0Ghs7yb2tAyxtxfluCBPfD2JuyBNC25iz1q8vyFaTEXLV
 hV6c33Qgc5xEMiim9JRWROMXqN8IpkOlz5cR274L5MebjNRIgnVAnwgpDv4D5pM5UqmD
 pQ/Jrbcicp9//LC/YElWzNu2v4KsqFHH2DJSG7iBsoF0lTPx1PVazqiwDc4z3umqxCXD
 npdhVZt4pnlsW+gwsjjdVeseo8xaLHWYTH3QaU/H3BM9aDzY5OZUIy0OgkGYkt9MkyUJ
 HU2htlZwCLioFbxadW6SqfoDqu7Pc+z4PYWMcr/R5Kpu0g50VNxezTYjIxzy7YS13xmC
 7bRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986081; x=1738590881;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Lhj97v80kFVbDq00mXHkVOBuGzpVF6IYLPxp3Desvw=;
 b=lzdsefmaZQZ2S9cGJDducHplRlCfhM9R4vXOfBnlFBHkOqir6D0pUPi+Z+gG5BiFKE
 kMTlPFjcvCbZctiI1mf4rIEEMoyoHmWFkcHyIn8MnDscseKROEhrbBazSEa1vyW9qjtW
 BEMFL6mWa3RtOGAw39Nrw26xebQitoZDqnqHVCDFwFWYkhBZ0FPCyEFJZdsbgdLcpRLj
 +NYY2mTc82FaXDoGTMUK2/JKLZQ71H56DqXaDgaeKzR+rh/qTAoq37SmkjP2U5Gh9KDd
 qxtWzJnGkFqYdWV383n9zrlpz6QgyWxH8p0JA/CjiZMKTbJcm9zq3Md4k3NJnPhyzpvZ
 nOpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq8mQmjnuIUZMbjY/qo3pJ0/j+8TYa2AFl+4kMjL9V6BLq39qtdgT4hyS2MSDgVqqcQVs8fdKKkA==@nongnu.org
X-Gm-Message-State: AOJu0YzjHoMJL40TCcbPcMeSWgfkSJseb9ZWBPimBHrOxwicfszp72Ci
 d5eWliqgvLaivTwPrJ3g8iNFbEgo9tXf4qjVtsw45YqDUUUavZdxhVkfUqig06sWtyBcB7b9CoY
 7nBQXbWXHhcPhxVyGHTmxjnr7biXBexQ782+JfQ==
X-Gm-Gg: ASbGncuqbp0962H1QBTIxMDqjIGN478YWFixHlwl8CiL/ubFnnP17ZAWZs1JVMClZPg
 xlnpXCxcfMgERnNj9xmfUTtOirLuGt1+nMi3WDhGoAHZ0KKaHJWmNHkvDcgcjZxA=
X-Received: by 2002:a05:6902:160e:b0:e57:8b0d:27e0 with SMTP id
 3f1490d57ef6-e57b12f8ff1mr27078757276.31.1737986080079; Mon, 27 Jan 2025
 05:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20250111183711.2338-1-shentey@gmail.com>
In-Reply-To: <20250111183711.2338-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 13:54:28 +0000
X-Gm-Features: AWEUYZnCyXqdjLQzDfyO8yWC1ecpZrV6QNbvzr6F7d8FYjdpI3JVwS2UnjosqSg
Message-ID: <CAFEAcA9pKrU4401VxHyFerK+VQT-dCHPYKFFdjOZPRZ3x0Ti_g@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] i.MX and SDHCI improvements
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Paolo Bonzini <pbonzini@redhat.com>, Guenter Roeck <linux@roeck-us.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Laurent Vivier <lvivier@redhat.com>, Bin Meng <bmeng.cn@gmail.com>, 
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Bj1cOS4g9qr0

On Sat, 11 Jan 2025 at 18:37, Bernhard Beschow <shentey@gmail.com> wrote:
>
> This series fixes some details in i.MX platform devices, improves SDHCI
> compatibility with U-Boot and modernizes some code.
>
> The first 5 patches are bugfixes 1/ resolving infinite loop in U-Boot esdhc
> driver, 2/ fixing a character echoing issue in imx-serial, 3/ fixing IRQ sharing
> issue in Designware PCIe emulation, and 4/ fixing GPIO level preservation across
> resets in imx-gpio.
>
> Patches 6 and 7 modernize SD card emulation by turning presence and
> write-protect GPIOs into qdev GPIOs and then further allowing the GPIOs to be
> inverted, just like device tree allows.
>
> The rest of the series is cosmetics including turning DPRINTF() into trace
> events which eases debugging.
>
> v2:
> * Drop redundant implementation of TYPE_OR_IRQ (David, Zoltan)
> * Use absolute QOM paths when tracing in imx_gpio and imx_i2c (Phil)
> * Trace hexadecimal values in imx_serial (Phil)
> * Do NOT move inversion of presence and write-protect GPIOs since that changes
> the internal logic of the device
>
> Bernhard Beschow (13):
>   hw/char/imx_serial: Fix reset value of UFCR register
>   hw/char/imx_serial: Update all state before restarting ageing timer
>   hw/pci-host/designware: Expose MSI IRQ

I've taken these three into target-arm.next; I see Philippe has
taken most of the rest; and the hw/sd patches I've left some
review comments on.

thanks
-- PMM

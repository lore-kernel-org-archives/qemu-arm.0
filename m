Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1596622njf;
        Tue, 3 Sep 2024 14:37:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXk1sozxmEi20bZOgea5Yo9/GUoQqKhUkLST21XgV8JJ81Zgm0mMSShtmdxUBa4Kor+A/1rpL3QCGqxBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEPbn8YrJU8MDhKfl6ospk4B3vinbV0MXfCvVwuqXUupBIByBikrbgx2S7Gkx0zD3FjiR2g
X-Received: by 2002:a05:622a:5586:b0:446:3677:96a with SMTP id d75a77b69052e-4567f57395amr245896781cf.31.1725399435399;
        Tue, 03 Sep 2024 14:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725399435; cv=none;
        d=google.com; s=arc-20160816;
        b=YNYMYQmB084xKSeGEhWUTiEnosCJod2Spm7xTBo2/492uNA3toCbdbd+LFSrobSm0e
         MsHveatEwigiQDCQ8nL0BP2nkMNk/b96hWvGtgze0MOTm58YR18vlE20YODNQZiCb20D
         1zjRvi6YqDoieoXR1fQ2dmPlxcserpHSWwBkKJaDbxh0imNn7TSd78mBVt87kvE4PHWx
         ed8mJ+ZrNS/p5hlGpfwaJmk2KQNYzJNZl8QoTzCbnyPzeULrQqeJl+z5IYyHbhmlnaDz
         z/4sleujy14eSJfhmpI6nrqaL3Tk1sCdS/n11cUT3ngWU0YimyVFF8lmT8pBG/rOA+A8
         Ig/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=gfmATu2m6mkKKzzZLVURnXGkZjjrSE3sIDhUZFfLpK0=;
        fh=SWTaNtn/Hs/g9F1vzGEq3K772oHQwcLxC9kjiAiC31c=;
        b=fQ4UPN4Wg93j/rs57thynNNfxkHFCbYdOhGjnk1T5nwqOUirBiFV/VGJMWhEVXHJ/u
         OJFsnEFos5XKUA5pHdFoL0OIR/7EzKhtOtTUu2wgJ2BBSM2a8f4O45FQhmxJAUS2fBMx
         vaAyHAjlLBXXt1h33OFYKrv8AkRa0mP2Fn8llUoRLe/myp/rzCxB5zfzfkOBDzcmxhSx
         PIwqFCRNdo/DtJsPTXlJ3kRb5tprTumD0YZAiJaqscS7yaPEjOrEhwS5Nyr/GkAuOFU0
         5fMkjSbne+T2NR2gl1RvtpEult6wV9kpOQ9CUdCJh4U8RituEEVOyP5iMuIC3GSG6fGA
         lUmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xdNbPWuN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682c9d6a0si115603681cf.172.2024.09.03.14.37.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 14:37:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xdNbPWuN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slbD3-0007Ns-BM; Tue, 03 Sep 2024 17:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slbD1-0007Lc-EQ
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 17:37:07 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slbCz-0000zw-Om
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 17:37:07 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42c7a49152aso39135405e9.2
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 14:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725399424; x=1726004224; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gfmATu2m6mkKKzzZLVURnXGkZjjrSE3sIDhUZFfLpK0=;
 b=xdNbPWuNNsE7A5dduEbhrtyS4/BhTeQMRNvuDdQa/P8bjJC84QYMWc1yyxCqJ+eq5W
 q85bnjr8nd8aMpFIl/vgfgjeSepa8qNg2s77yRkMMEsmEPs2JsYeLkFmnxN0GcAXdd76
 5+S3wD4A3xVGf5nBpVAeOeMnQ9cW3wDiikHSiXaMSR3GXJRrAiMNNYqCXSSBmbfojAAC
 71nbznC+d7NWnjiiCulJvTXqTUqDccEnSzWSWdl+Uk/ghILZ3VTV+PJklIX4crNdoJnO
 Qs4wl0I/flyhOwpGZyR7NSL32jXs4iWwNGRbOunoxqnCZMNaFIUHYGZAMoXQWyAMp/ZL
 JcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725399424; x=1726004224;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gfmATu2m6mkKKzzZLVURnXGkZjjrSE3sIDhUZFfLpK0=;
 b=ahDetUKgVBI+xEAOoWtLhtJl93MrT0j4R91SP3JQ3fUsGim0g+raxl4ucoTgLABK9n
 rzGUFhUZDX6JVe+xAFKCwrSpckxARv2WfnXuKQQcAoq9eGHmKiO+VybSv8suFqreCvEs
 Bj5Y3puvSBsgJWLk87i14B6hWNqloY4dY70xeRhzj4dqRoXSj3EmyWJgCpBWBZ/ZZ5xG
 yfq7OHg94mxJDQk3CjkxFN18XfZlX1oeAW5Pfuvx6Db/DOGDSdHaIeBwJ9jUyGBrYobt
 hbOluXXWL618XicCqt10woGcEzGFu/u3zyhQ5vgPfkdpkBRh0Y9E8ORLldFsUQeALltr
 WSDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0MTpUHJVZsGkVkVkMDDLXCYEhhFsmb7MH2vztFk+JW+tcnV1Lvwfrb2xrfau3pE5pnWYPiUb29g==@nongnu.org
X-Gm-Message-State: AOJu0Yyen+Af/yPHcxPfeHtRQ1PP9VkrepVCxZApBBcUc7/16BY7Y7do
 NAABOhN3IymHJVzHObCgAdCBTrYL8gO77i3pFvTnvqOhWU82Qiaw7IaVBNH+52ufLHIlsucgs/l
 w
X-Received: by 2002:a05:600c:310b:b0:426:5269:982c with SMTP id
 5b1f17b1804b1-42bb01edcbdmr174913665e9.28.1725399423879; 
 Tue, 03 Sep 2024 14:37:03 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bbe79f545sm150783965e9.2.2024.09.03.14.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 14:37:03 -0700 (PDT)
Message-ID: <f65053b7-f909-4ff3-b938-05cff490548c@linaro.org>
Date: Tue, 3 Sep 2024 23:37:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 26/53] hw/misc: Remove cbus
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-27-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: Pndu5Mr79nkt

On 3/9/24 18:07, Peter Maydell wrote:
> The devices in hw/misc/cbus.c were used only by the
> now-removed nseries machine types, so they can be removed.
> 
> As this is the last use of the CONFIG_NSERIES define we
> can remove that from KConfig now.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS            |   2 -
>   include/hw/misc/cbus.h |  31 ---
>   hw/misc/cbus.c         | 619 -----------------------------------------
>   hw/arm/Kconfig         |  14 -
>   hw/misc/meson.build    |   1 -
>   5 files changed, 667 deletions(-)
>   delete mode 100644 include/hw/misc/cbus.h
>   delete mode 100644 hw/misc/cbus.c


> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index d33d59bee90..a70ceff504b 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -142,20 +142,6 @@ config OLIMEX_STM32_H405
>       depends on TCG && ARM
>       select STM32F405_SOC
>   
> -config NSERIES
> -    bool
> -    default y
> -    depends on TCG && ARM

Maybe squash this ...

> -    select OMAP
> -    select TMP105   # temperature sensor
> -    select BLIZZARD # LCD/TV controller
> -    select ONENAND
> -    select TSC210X  # touchscreen/sensors/audio
> -    select TSC2005  # touchscreen/sensors/keypad
> -    select LM832X   # GPIO keyboard chip
> -    select TWL92230 # energy-management
> -    select TUSB6010

... in the previous patch?

> -
>   config OMAP
>       bool
>       select FRAMEBUFFER


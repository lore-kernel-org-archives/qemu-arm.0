Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp1530556njl;
        Thu, 3 Oct 2024 08:54:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXAtJFgVpViRID9xjURR5t4sv6pAZF4bzF2ieOipbnUX0ueTRlEnraWDr/VE0yhyBh57OWN7U+B4dXZRw==@linaro.org
X-Google-Smtp-Source: AGHT+IETpnmemrKt8/4HUp5s6eBvQbrD6M9vtm1+hvVK9Fy7uwmC64N3PBG2gRcxvZh0VOFnDbdP
X-Received: by 2002:a05:6870:3c8f:b0:277:eb15:5c60 with SMTP id 586e51a60fabf-28788a4af9amr5031087fac.10.1727970875591;
        Thu, 03 Oct 2024 08:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727970875; cv=none;
        d=google.com; s=arc-20240605;
        b=aKKjNWgz709gco+7GWo5EWYdiyI2/Bz4uH9BSDRUnjJO9tBoUl6vpnLIvUCbQeV84i
         bhCPguR7FNkQQPx+e/OQXl+dlYDex9zI7j6HiQ5ix+uVSzfq569vPjr4P9F96iTI/gan
         Q/Y89aE/xcjOoIveJwQDM2jSpt0QxqCI3lwwDjQaqxzkIOgdrkzVv4tPy40FN8b3v+Es
         43bhameBfIobR21Sqys/1LSEu2AHIxbFxBTV2vDD7c/PSXXFka9vp9qCR3Fyyn70umph
         yeW1tAhX9TrGCqmbS+laFvXFX4D3YwRyVQCr2X6aJdgq3kcdWQrjRp0UiwxNz0VxTmza
         zr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TBITSJDqEpI1h+gfmHH74Tl6nxhef0yH1QKQqXa5NwI=;
        fh=3ZsbDyDHJVlbi9wWmlUmK9wc360JQw1SR5XpavmM+Ac=;
        b=h4bqPu1zya7KVS3OW+GfGaqOLx2zZWs4Gr52yU9EIrDh8EsZb933dhtoFQvzTM4VMo
         y9yuJ41jtz57NgtGL/T6yqx1TCOyVKW2RtEOZxUfY4JIA1NGsAcKdZ5Eu4VqOeaWnbGu
         PTowL8zj6AYisXYrmMDDkEBOTg0ceyrskg5z0YSMJ9zSxSAaH7Rmamil17vzz0z6Gxrb
         08oQYtK1fXoIm/VEVnesqfuML3Nw4puoDYv089DEbz5sIc3EEvAUWVqHTyjhA3+ZOKqV
         NjBZA+jGVnWSd42cPadjyRGAmDcimcKXv4tlBVNyR/f9Xg8sYzPR2UqPZIxUIu/BDAUi
         hrtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kSUY0/Ho";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae6b74f017si138495885a.125.2024.10.03.08.54.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2024 08:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kSUY0/Ho";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swO9Z-0006R1-Ep; Thu, 03 Oct 2024 11:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swO9X-0006Ph-8S
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 11:54:07 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swO9U-0003Rg-Lt
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 11:54:07 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42cb2191107so10517735e9.1
 for <qemu-arm@nongnu.org>; Thu, 03 Oct 2024 08:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727970843; x=1728575643; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TBITSJDqEpI1h+gfmHH74Tl6nxhef0yH1QKQqXa5NwI=;
 b=kSUY0/Ho9yWyfBPN/5ieMfCweqHgbNQJq5GCmtBrL5N+jGEf0HHRRCxvzwEnjEeVzD
 1E+DjLsXhS7AqaHqXNbZs6hUPKXXwDycrZZCBLntWegmpIVWR68TA3n87hkfuKqUxstW
 TWViuq73vHJ8IIrM22ia/Muq0RyRCVtJHeoIzGgDQjD+rfayd/2s5oYIyEj6pw9sGzt7
 Zcfq37L+rSFgL6wG75dVzTbRk4JbKXQqLHJCXwYVLcHfi0I+pPloac2qkAQ/VzAokI2W
 ciROc+8Xxz0XLkbdnH49sImjw0NTOeQhf3NLkjGGvSOIFKjzpO463K6wK8/NbprZBDxg
 gaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727970843; x=1728575643;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TBITSJDqEpI1h+gfmHH74Tl6nxhef0yH1QKQqXa5NwI=;
 b=EdiXRU33IuFGSx1OANnbzNbARm6SgmOJGGQkaO12eObhlNruYVJAxUL/u/vwZ+YxV7
 0M9rfOU4wqnzs/hAZFYhgeTUPTDuiAAo3daR+AFZNe+t1cAOrWcvJonjcalwTUCjqiZr
 ceG0XIUm6UiNdmASUjd/Rr9TLYwC1bF6LE1o/vK3Ya6QOu/YyPCBp187cJYhZWZl8ATR
 Y72DEeAUyv+CK3GMcfSZfZFLlshz1yhkl0qN+rPcXjzh10KQzqqPmcrm9LdifVLRYanU
 9NnJP64YEIR0hzjsTGT9Er8SCIzJhhvMSoOVUpn7BI1lzD5qFxVMXjzFLtDlpBdAxD0y
 sQQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqqJsTSS42n26wDh8URfLr+JaQEQt9qeFxG7aqBvq/29uLoi9okppKBeVkRbBdXL1Pw8zdOzHppQ==@nongnu.org
X-Gm-Message-State: AOJu0YwjKC41NvxsfIeMrkt+cqfb/pcfXXFrGv29c24EtEybdPU4u0IP
 +Gt9pUmhNU0OfdXV/yK0bzZjfykX9BaXFJGSJV3/zdale25xlRZ+3fYv/qT1etQ=
X-Received: by 2002:a05:600c:310c:b0:42b:af1c:66e with SMTP id
 5b1f17b1804b1-42f777b6d0bmr56888285e9.9.1727970842832; 
 Thu, 03 Oct 2024 08:54:02 -0700 (PDT)
Received: from [192.168.13.175] (49.red-88-29-183.dynamicip.rima-tde.net.
 [88.29.183.49]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d082425f5sm1544489f8f.50.2024.10.03.08.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 08:54:02 -0700 (PDT)
Message-ID: <eff57418-917b-431b-ad2a-4db76de7bdfd@linaro.org>
Date: Thu, 3 Oct 2024 17:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] hw/block: Remove ecc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Guenter Roeck <linux@roeck-us.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20241003140010.1653808-1-peter.maydell@linaro.org>
 <20241003140010.1653808-6-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241003140010.1653808-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: n7kvzTjM2B8W

On 3/10/24 16:00, Peter Maydell wrote:
> The ecc.c code was used only by the PXA2xx and OMAP2 SoC devices,
> which we have removed, so it is now completely unused.
> 
> Note that hw/misc/eccmemctl.c does not in fact use any of the
> code frome ecc.c, so that KConfig dependency was incorrect.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/block/flash.h | 11 -----
>   hw/block/ecc.c           | 91 ----------------------------------------
>   hw/arm/Kconfig           |  1 -
>   hw/block/Kconfig         |  3 --
>   hw/block/meson.build     |  1 -
>   hw/misc/Kconfig          |  1 -
>   6 files changed, 108 deletions(-)
>   delete mode 100644 hw/block/ecc.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


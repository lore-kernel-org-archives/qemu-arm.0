Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp723804lfu;
        Wed, 6 Apr 2022 07:07:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI3Y28UHOI64WyeWv205t78hb0/g5h67txhB1mYmsgro4Bj/cqtL8Rb9DFzz4ijii/qa4B
X-Received: by 2002:a25:d046:0:b0:634:763:549c with SMTP id h67-20020a25d046000000b006340763549cmr6777603ybg.568.1649254048446;
        Wed, 06 Apr 2022 07:07:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649254048; cv=none;
        d=google.com; s=arc-20160816;
        b=acJE6dmERtKEdmAtzjVlj9E/EbJIMN/wNPZyQP7aZIMVsttbAm6B18++4UF3z+LH66
         xQfwpJtPrrVXqYVG/fs0quuNCkA4w3aw9LXWFSjoMBU0IiavAJ3s15YNBRZFfmx+OUwd
         nbFpF36pKIv68xCxGk6B3+Hj5dMM2UHTmOwx+vtihW53Hily3Kozr5dBymIsHY6+9+em
         +NxZ2ZaezHiMTEWnIlp9pUMZjWL38BU5v1ROBZZOhhgNDKSunUsa9uavZ7Xd/JidxpLq
         bS9DXkJ4pciYNgSvV+lMJRH3DskGOh6IYK/M00x2n9iRQov94P5kuADyB4XhoAZfiTVy
         9p4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=7CN4md7jUqAs80Mf8lxCx2YVe6U6LEiC8G24WE/+bd0=;
        b=ld8xHhi/RJjdZH8971VJIbbQDdBaQwQ+aX7t798vRsEosxqbTi4nC+KQRgLzQShxI+
         cuPYbquphn+4MVwbtWo8UkK7AWM/HzYewH2cJW4XTl5iYM+xgaCBXJ45NQKESThQlrP1
         T8b84oMKqD6FMqRDqJhKeGPrt7CIytv7wNeKI+4I/Mmox8JKEEtw4eHGaF7NngECMZt/
         6Mh3BNfg6BUBt19yr9RieZenU/30kAzA6s0GH1dTQ1mfdF1a0dnDiUCRGLxHb4HnKWkG
         PNVTQJDC8ILugfHK2/8g54bC62HvkerlFnW5yIeoCv1aeNyeA9nm4GdZ6j7xATSQoB8f
         wO9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M+vlZ26R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bg22-20020a05690c031600b002eb6c7ec4aasi6414753ywb.114.2022.04.06.07.07.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 07:07:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M+vlZ26R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc6Jj-0007pC-S7
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 10:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Im-0005or-Fu
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 10:06:28 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:45793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Il-00072U-0S
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 10:06:28 -0400
Received: by mail-qt1-x835.google.com with SMTP id a11so4317519qtb.12
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 07:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7CN4md7jUqAs80Mf8lxCx2YVe6U6LEiC8G24WE/+bd0=;
 b=M+vlZ26RXN2t7qj7LeMdAk1bDCh0l1F0DQeFtPMyQYmqvgIm8shJlbEH8J/gVju3c6
 jdFlqhRYNVFLqTNxEgoOb1yC35v6t6EaPlKNF4WLJTeonvnn5if5SN8uBgphYGHnZ6WA
 VsvdDuU2E4rkHQk3MhcDSH4kGmudLexzGhxWkBFcyE6/bMkeDWdlUU56IEvCFN5xfA0k
 /KLD0ZKx4NapAfFfk4ip0omXgedtpM8/tIhs0x9LSrC0XLue0z9ZW2+6/5Nm822IgQeB
 RuPGlfcRt/pQVcsMkdvdi7XkHCDxXKDHilnv7AzxjTuAU4DsHv+jCVkmNvE5g1Kk22L7
 Xabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7CN4md7jUqAs80Mf8lxCx2YVe6U6LEiC8G24WE/+bd0=;
 b=EXpmMfP+hgqn5wPi48yvnlnsMqcT9gq7ZwFErXinzfgvfYVEkCdlfA8OzwcmhWmEP6
 ZXhNo7uN5qPqo2JnJTSYCBxrj9DNqVNVerC7tPgyTCav5Mm+lBmnJ5YV48GPEISommS3
 fEkVczw0JD6s0AP95D8QJQUast3zK5b9WZSpXatuDKgNwQQb1AIZO/DMPl7r3eHG7BRP
 +ebZGAIbyT47d0A9wRVKebzmS36Hr50IQ2UXR5yhespQDmRmEZGksi5DS8G2cWVXFclg
 CVT5laQaUWJnwLzSxnuVWUnS+g4Eau1YUPqjNHmWJIgTgKQFpmuFZo/LRTxXk7PGKHyi
 g71A==
X-Gm-Message-State: AOAM530T7pyBx+4qKLr7dXa9LMtHXsnjePhDsKyXpuJRODpbj+dnmRZF
 dMlUjWpXRaFdidFqsVDsaSACWw==
X-Received: by 2002:ac8:5a4f:0:b0:2e1:a7be:2d13 with SMTP id
 o15-20020ac85a4f000000b002e1a7be2d13mr7517958qta.598.1649253984907; 
 Wed, 06 Apr 2022 07:06:24 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 s11-20020a05620a16ab00b0067b3bc3c35bsm9637736qkj.113.2022.04.06.07.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:06:24 -0700 (PDT)
Message-ID: <f7db2c43-8fa6-490d-cd49-43df3fa55de3@linaro.org>
Date: Wed, 6 Apr 2022 09:06:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 18/18] hw/arm/exynos4210: Drop Exynos4210Irq struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q355GX/JS673

On 4/4/22 10:46, Peter Maydell wrote:
> The only time we use the int_combiner_irq[] and ext_combiner_irq[]
> arrays in the Exynos4210Irq struct is during realize of the SoC -- we
> initialize them with the input IRQs of the combiner devices, and then
> connect those to outputs of other devices in
> exynos4210_init_board_irqs().  Now that the combiner objects are
> easily accessible as s->int_combiner and s->ext_combiner we can make
> the connections directly from one device to the other without going
> via these arrays.
> 
> Since these are the only two remaining elements of Exynos4210Irq,
> we can remove that struct entirely.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h |  6 ------
>   hw/arm/exynos4210.c         | 34 ++++++++--------------------------
>   2 files changed, 8 insertions(+), 32 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

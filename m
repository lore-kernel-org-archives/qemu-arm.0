Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp403829ejc;
        Tue, 11 Apr 2023 03:43:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350YXxOKXq/SIGFmX2OCu8omAqyPbUR+S6o9gKGhvMMuoy001ooDOLjcNSzu48vg/VNhyOHyz
X-Received: by 2002:a05:6214:761:b0:5d5:fd1d:6ef5 with SMTP id f1-20020a056214076100b005d5fd1d6ef5mr22318483qvz.12.1681209785302;
        Tue, 11 Apr 2023 03:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681209785; cv=none;
        d=google.com; s=arc-20160816;
        b=RufxDPNKXAgRnqP9NQNQ20t9zRJbMj3CxxRjXkMOtP391Tut5ONkctQku7/JfCl0xg
         b2Ltk4dbNTQgixLMMqfUqfyRCBHMRjcrUrjx/mO1iLnBHC0uvwvJsUjLXnm41fD4dJIJ
         XVjIdg5KjC2eWAN7N/Ln2JYANK03fHfZPKUs0xFo9i7gIli4Y3GR60yCuiMKky3wR+l+
         T6i5oZc1NuhfllXxawrqhFaEO/ET+MPv0nsdmHJaLeumNqvD4/rwB6ak0AJFbnkjS9dl
         8Lck0mXs5ZVaBel0DUhJYbhUv5SYam9ZgVV2TNJGV5dTFL6fYiMxXJeBZVwnsH6JJPXo
         RgWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Us6tcV5lnTKRKMyK6gacWOCqQITbRHtnTKAjVmBqFMo=;
        b=rWoLGR9OFwNH79DJy7jQeuGHyEurJftfWDbdLgLVuTGtcAYeF0jlEGuv/XfP0YG0Jr
         tu2d7ZzntEOF60V4NPpVz5EFHgeu2IdeL5kM0RxxArdQVLDxL6O4Fdhbrqvp4ceYc5IG
         /che+rmprnNRqteVZMvk+pA0lwM686X5M6/HlsK0QrP8SCg/Dt0XDuaHlZHhBbve5/vW
         IqjJz5psD2L4CBAevm0Ky717HEwlnPtbrpnKQSudW3UjYaq6kP6EwycnyS/TZSDh4oIy
         ix6fPrqezwCBYfDEjDpeim+PgB+cgGIbpqLsqscIFdThwg3WVLJFD5h/jKyuTO4qUcYN
         4KWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fd49tepf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jv14-20020a05621429ee00b005a3ad4d0a4csi8907741qvb.482.2023.04.11.03.43.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 03:43:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fd49tepf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmBS6-0000p0-0F; Tue, 11 Apr 2023 06:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBS2-0000oI-2v
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 06:42:15 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBRw-0001bH-LX
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 06:42:10 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso698961wmo.0
 for <qemu-arm@nongnu.org>; Tue, 11 Apr 2023 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681209727;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Us6tcV5lnTKRKMyK6gacWOCqQITbRHtnTKAjVmBqFMo=;
 b=Fd49tepfcjJhEL+qgTVHfFOS3PqsxXZtX7h2WnkKyy5FSjgywnJSOsdp8fIT7UK0aX
 dbA2EpkayNlNITEEtXBVZtHwc+7nncvwRgqK3T9C5eRVKTvVYzYXp2HtFBreJ5v+mNf+
 SsoCGBYunkmGHpzSCClQ+xob7muJquU3tYi184cixAWPeUQlNmXwI3eeRtQ5FB07LMqQ
 7wI3PDwfBWtMDuzOmLfIsl33SzcOBevefMqxrfi5nh8bhxorty596phO2Hh0O3BmHaCW
 qXojlhUUG9WnWRmDXrasnoS8vB6JYrCHLYBRQpPlFIs4oyXQj7yPoTFwLbnoFxibBG14
 HaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681209727;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Us6tcV5lnTKRKMyK6gacWOCqQITbRHtnTKAjVmBqFMo=;
 b=bKloQLZyXiATzTSLK99G+INiIFebeuGGhbpynvXCMuL0tlAE3VWYtE8gZhg8YFeaCM
 nverNbeq94hmKQ/Lfza/t8Cn83GnyJMs8GmZ1fv+rSjgEJpf6znQCY0YVxHzDTEGUSzf
 +obIxBqTQltg5UDP5/BXDfJzk3WwaB45ALNFyn8xp53k2vE6onjYyKOXUPZhH5nB77iQ
 voFY92HwM5M94kriJyF7qIIZ87mUQKceBZCG30ff6g1LXpbCF6rp3v1mT7IqDgo1XV8E
 v13ywXytnMwYq17V5m52Ffr3k/1jTTppIVvHlOZSnuqkqKeXdHnuOnqRacjo/xWxg+up
 t/6g==
X-Gm-Message-State: AAQBX9ff1cvlK2JU0KCWe8Z34x788aTyuAxRom5dKgo6eI/ViPwiQcDE
 PX+jQl+GK6nFGquQqXRQyMRN+A==
X-Received: by 2002:a7b:ca50:0:b0:3f0:80cf:f2d5 with SMTP id
 m16-20020a7bca50000000b003f080cff2d5mr6472724wml.11.1681209726872; 
 Tue, 11 Apr 2023 03:42:06 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003ee443bf0c7sm20380270wms.16.2023.04.11.03.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:42:06 -0700 (PDT)
Message-ID: <0dd900ec-cb08-b89c-bf09-851cca144afd@linaro.org>
Date: Tue, 11 Apr 2023 12:42:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] hw/arm: Fix some typos in comments (most found by
 codespell)
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
References: <20230409200526.1156456-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230409200526.1156456-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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
X-TUID: 7/BCryM/gVku

On 9/4/23 22:05, Stefan Weil via wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> The patch does not change code and could also be applied for 8.0.

But not user-facing, so can wait 8.1 :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   hw/arm/Kconfig            | 2 +-
>   hw/arm/exynos4210.c       | 4 ++--
>   hw/arm/musicpal.c         | 2 +-
>   hw/arm/omap1.c            | 2 +-
>   hw/arm/omap2.c            | 2 +-
>   hw/arm/virt-acpi-build.c  | 2 +-
>   hw/arm/virt.c             | 2 +-
>   hw/arm/xlnx-versal-virt.c | 2 +-
>   8 files changed, 9 insertions(+), 9 deletions(-)


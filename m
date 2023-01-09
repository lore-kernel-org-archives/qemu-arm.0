Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2460746ejc;
        Mon, 9 Jan 2023 09:44:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXudx+U+lOnKrEPbycerR9PpAsf2SHDyEdh2tTEmbUXUfU8fLx0pjL0guOKUbZfyq5D7iqfp
X-Received: by 2002:a67:c585:0:b0:3ce:e535:d6dc with SMTP id h5-20020a67c585000000b003cee535d6dcmr7055691vsk.5.1673286272498;
        Mon, 09 Jan 2023 09:44:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673286272; cv=none;
        d=google.com; s=arc-20160816;
        b=FdHBxWo8u8NwLI8/njLwpOnOLgWK4H433soM2XPY9o9KumMAvmo2SZd19PdE3fwpjh
         xWI2wz0fSfevWbRsly1K21F6ycoF2otpHYtRBAuMzMXY8IwHmWdWjJdXXb+pr3GrkIXB
         EhRSkuKwtpKpDWnPYTCok9sG4yxDxzuah4Ah1QAXcR8lQwdwT/47nIw3LaeW8/NtYpCV
         v+bh1EfbGQd+XChG+wdtJLF8QveUwdnDB1FuHoK/7ht07AA3NWBhlEWi7F3beNQeLCdG
         eEKV6LUlSwfCm+qrzsKAgWgQQME0X4M9jHkxMX6wo14LvovELQP8oSu1fhcenxVptnlT
         xhdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tXWhE1XisfJ6nzvcUpo2PoJy/dKFyeRVIIfvt8sSBUo=;
        b=bru7/eRX48RER+QCZCKNwmlkJq1DSa7Cwi1KaMsv+c3H65lzaDGIxaAS3Wa+RB4RYY
         c88WveyW5Vp4Dwa94DcTZJ6YCPlXs+EczmIrwGpBn5hMRVZGosuQloqFUJpN9UApOJ32
         8a50rwluo8OYlMh+/KDIOS8RicEofeqVPFTRvovFMB0jdD2YbcKAqNBJPlqAi2zHtfx4
         DihRWocrujs9SubHIok1CKtVq3Q+7l6l6LiZGE8vrIG8UwbDixE1riTLeGicXWWpe/rU
         Wl9l4lPE/kq0L9QC1bE9C+RUY+IJyRsJhgZY6stm8saut8/2uHRscW1Rmxk00jYHHfVz
         Vq6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H0Fx1w89;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1-20020a05620a2a0100b006ff8ac76381si5102395qkp.98.2023.01.09.09.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:44:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H0Fx1w89;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEw8l-0005K3-ND; Mon, 09 Jan 2023 12:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEw8h-0005FG-3u
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 12:40:51 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEw8e-0006lN-SS
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 12:40:50 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so10432854pjj.4
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 09:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tXWhE1XisfJ6nzvcUpo2PoJy/dKFyeRVIIfvt8sSBUo=;
 b=H0Fx1w892mswWkJQWeCtqSKpC2Jjmo//J42Q5qL3EghCwA0UVswrXC6d8V6u7vj41x
 VB+kCHQ3UqyA8G9xUyVKMuoppqFOJCRVDC4x5j33u19j9Ilw1BEyUDlpVeOokpdsYDse
 N1Vzf1tlyq7yC+CjSKCHk0o4kz5Zm1nI2pOfj0W6RzRTzmhgQ8Swj56cKPc/vwAeRHGv
 YDlb5+4N+aZJU+tF7JBvRo36WGTWrZGq4kZavmir0RnFNZ+wAfN77o94OfT3Ssz2BR+i
 uEcEqXelwOTTv3QzdbkB41TKwM9FCwLyW7Ek/bNgXwf5JnqXz6o78jsG6isAaZGCbfh/
 97Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tXWhE1XisfJ6nzvcUpo2PoJy/dKFyeRVIIfvt8sSBUo=;
 b=JRNechPPQHKy0H5astXXCY9EIKW22OGOxc9Fu8WGqmrEWbA2BRikPLF9QFo29ORS7o
 3g+zlYgYzfjUvYe3d5R4XUZyxkhJ9xyMgn9qCZSs6//TbY0dXFJpJSrrT8ZJ6nNJTFbv
 IgjX13SfAOE5GqR7+s0woAxFENBYTZbELDCgcjTXazv/1iC0uWpyxthafJCa+QDdC0GX
 yA0Aa9Gn83ATYqbWhXtMJQ6xl83EJhw5xl9HiVkKYOBCxnyOJIHJdGD1J6/N6B+PXSvJ
 X/Kk2f4Fglujxk3hfzV5Yj25KynNQ66BzmrIZSqgH6dUGYK+PurxVaDVbZ9/RSjzDgsh
 0+Zg==
X-Gm-Message-State: AFqh2kpD5E3y28yoAqCjxAKreDy5/lCBaImWiVRrPmrqJrhrAVf6G3BM
 PavM+VHiX4nxHqdHGkqpmlkaaA==
X-Received: by 2002:a05:6a20:d39a:b0:b0:2b4f:a9d9 with SMTP id
 iq26-20020a056a20d39a00b000b02b4fa9d9mr90288754pzb.5.1673286047313; 
 Mon, 09 Jan 2023 09:40:47 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 17-20020a630211000000b0049f77341db3sm5511554pgc.42.2023.01.09.09.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 09:40:46 -0800 (PST)
Message-ID: <5bcc36c3-ec86-9cd3-f62f-f27392eca69f@linaro.org>
Date: Mon, 9 Jan 2023 09:40:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/13] hw/arm: Cleanups before pflash refactor
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109115316.2235-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: nvnJ6NhpQcGK

On 1/9/23 03:53, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (13):
>    hw/arm/pxa2xx: Simplify pxa255_init()
>    hw/arm/pxa2xx: Simplify pxa270_init()
>    hw/arm/collie: Use the IEC binary prefix definitions
>    hw/arm/collie: Simplify flash creation using for() loop
>    hw/arm/gumstix: Improve documentation
>    hw/arm/gumstix: Use the IEC binary prefix definitions
>    hw/arm/mainstone: Use the IEC binary prefix definitions
>    hw/arm/musicpal: Use the IEC binary prefix definitions
>    hw/arm/omap_sx1: Remove unused 'total_ram' definitions
>    hw/arm/omap_sx1: Use the IEC binary prefix definitions
>    hw/arm/z2: Use the IEC binary prefix definitions
>    hw/arm/vexpress: Remove dead code in vexpress_common_init()
>    hw/arm: Remove unreachable code calling pflash_cfi01_register()

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

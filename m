Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp6142311lfc;
        Wed, 21 Jul 2021 14:46:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVWVSZm5J+x+kIPY7cJUpt99xoreihmBGhXYPH2gp7Hys2j5s903mhHFr7nAgHm0EmFDjr
X-Received: by 2002:a25:dc8c:: with SMTP id y134mr47656872ybe.301.1626903983375;
        Wed, 21 Jul 2021 14:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626903983; cv=none;
        d=google.com; s=arc-20160816;
        b=g/pJl1jebyFozylEuOLSVVTRnOKz9lOqKAtUNMZUzXDwMuH4MQh1qO5NZtZIlAlEVd
         db/MaZrSfAmZZXGiKbq/ZuFcRw7u3mlMRJvU9LH1VXUYc7Cjy4VNWMxgk+HVBGcI0U35
         ImBT76Q57SiFAEspzxskXVmG/EQvAh316Hdr400Hs5SWFynAjuP/I9Y9E3ogUn+6MGcr
         EIWHHFqIaG77TgiA447U4pYmk/AsXnQGbMzkIUY/ya9TnNXnWFyOyX9SqZUiCURhKB7C
         LeTHvLNbZEWx+L+M4V/yQU8muZTOhUa+fcmH3/rp5AHMMqq1qRBZrEfpoVD87XreyQ93
         rThg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cC5kdZvjngHHAKWeMEuLpnIjYkfjTzSsjHpLIpv9aTU=;
        b=KQYDmK3G6tIhLPaHVKcmHRbohkPuBiOJDwAxu8gYGMbyx7SJ3+Efs+/GLRezEsqbxs
         20TPmYPzGmqYdN2fTXJcJJx8Z/npyf1LrUFcWMN63NXJiww3rBIhV6xbh0OqHszDpCpK
         07V8pyaCKSUE9xEhz7P+VewuS+Vm6OHR4MBO5N4J//KugIFZItI7/6K0FfegUEJDQ8G/
         86cq/zbOQCewDdUnUwIiuPPtRz4wtoq+WraH8kUxgzoi8p/fl23VoExw0fsLgRauTWx+
         1PQag/d4A9/CzJEepkIqfJeS/5vTgKJ/cwvtlzfWKsyM5mIRUW7BJ7x3fBbHx3t6Kf+z
         /ixQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sA6+jxiH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t64si27112609ybi.171.2021.07.21.14.46.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jul 2021 14:46:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sA6+jxiH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6K2o-0007YX-Mi
	for alex.bennee@linaro.org; Wed, 21 Jul 2021 17:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6K2K-0007Jv-De
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 17:45:52 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6K2G-00025v-GQ
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 17:45:52 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso1280703pjb.1
 for <qemu-arm@nongnu.org>; Wed, 21 Jul 2021 14:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=cC5kdZvjngHHAKWeMEuLpnIjYkfjTzSsjHpLIpv9aTU=;
 b=sA6+jxiHntZCUReu9f4XmU7n7a2JvRk+MzDAkIx6j3q6wv2sdWh1Q3tG+wUsJcpRvk
 xLSjn4JeVXUCmRcCOHUc225DXoeFbzTEuQ7CcFzuxCxm94Ui2MKfLubJfBGaCzCNeCNx
 5TKo2mB1ffAc1KGtmr9RoS9w+fyNuE8YBheQawPaz5AorvrVL7EZf8mpEEsl8pj82QVK
 vnjV+T5wdN5S114W2jil12pdDqcVhWcOZMfu4Kk7blXXpqqQLJMG/hgE2B1WkMx6MPrM
 l0S6o2rEd0frgOG6YW/XEVLW2MAJ7/HHqB9lSLl1oAmGyoQ3MfUkihfM3bhxlCYNDwgD
 VptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cC5kdZvjngHHAKWeMEuLpnIjYkfjTzSsjHpLIpv9aTU=;
 b=k1M1rlciYNRyGM3+0y2QV4Fj8gj7feb7M28KqlMJQ/nJ+B3Rhkj0VVLp4k6SizMFns
 ZpnwEkyX/1DXlns1MJX4owauf27+rpASQuAKOa1CpJQ48S2eu4Kz9n32NyWc1dD2RDWR
 5J8GY8MERnr41G/wsDKhzJokRvZhQVWxTROio/2cJIgm0GMQVsQKIrjbWS7UVX+b6byI
 NjFz3R42VAxM6DhGwm+KqE8a/ol01LFaYcZanbz1tceTlvitXI0gYrwcKtQrScP11Ydf
 x85KT5mkOLo7iaBFEVdaBWsDZZikAM+XgjcKpcoq4Mxf2Za2FhPwhxi9QGHTI22XcF31
 UlLg==
X-Gm-Message-State: AOAM530XrAiEUTGGtr7aQ8xgiL/TC1lPGPGLYSB9IdaUQsr2KfOYE561
 Dti8hMElVKomdShvAcC4AsrqRA==
X-Received: by 2002:a63:4b20:: with SMTP id y32mr37787146pga.382.1626903947129; 
 Wed, 21 Jul 2021 14:45:47 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e3sm24009998pjw.20.2021.07.21.14.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 14:45:46 -0700 (PDT)
Subject: Re: [PATCH for-6.2 23/34] target/arm: Rename MVEGenDualAccOpFn to
 MVEGenLongDualAccOpFn
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <84ce2abd-080e-6190-939a-ba2895ec32c9@linaro.org>
Date: Wed, 21 Jul 2021 11:45:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K8RWzmXcfwIa

On 7/13/21 3:37 AM, Peter Maydell wrote:
> The MVEGenDualAccOpFn is a bit misnamed, since it is used for
> the "long dual accumulate" operations that use a 64-bit
> accumulator. Rename it to MVEGenLongDualAccOpFn so we can
> use the former name for the 32-bit accumulator insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

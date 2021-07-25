Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2249452lfc;
        Sun, 25 Jul 2021 11:23:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytTqulJZGbBTOmRVtCB2If9kOuMqEhSYutnhL6KHjHTzkMoKk9NevHIXlCl6O0U4TaC16y
X-Received: by 2002:a5d:960b:: with SMTP id w11mr12061629iol.138.1627237430220;
        Sun, 25 Jul 2021 11:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627237430; cv=none;
        d=google.com; s=arc-20160816;
        b=AOxxnxEROQDuZ3iBnti1NEWcEZPqEpy2+rXZ2V6KaTPzJbw117sxIevgaUtsGox85p
         GTf1AsFWAQqFEV8KNOrlyPxQ/ZPdh/HCTF209i3Z7cuVGHfwpnZuEfaILQD42IauXZLz
         tKHDGtuNlXy1SnWvBkosJvDOiAHIm2BOObsQwsXW9Ay//BQQKE15ICxciKtaFI45WOIQ
         EBqAbiO6fhDsnTv9eELPdAaawGgxh5yrCjkxijczq/hVrk6EAyN5/opHizTE4EokqBm0
         87Jag15FkT1aDCr0w7TjqRfE3zo14+m6tg4KBMCJY6IWWibz6AdA9Jnuz3Yc5YhjqJ4x
         TAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yrgP8hpFovMvTAiM5rAavk6XcbfLVZt6q/yQhP8CQDE=;
        b=By5M+x1zK+jIGjNmVC0LaoL+0dd3BFiVccxXG7o0LG1RemasoZo35fV7VeFpI1NinZ
         vCnZPlkW9Sk3jIKT+pYQ2XMG+KJxx0xPeyx4tz5MO9jF+eW3ZRtM5/ILcbc1YVXu9zI5
         nYDG1LARJ6xmm8wlLrylbSIHOeYmZJ6GtT7jBep/3uUTSQDdNFyIkBoU+5oiqDwTnhTU
         nfZ7HMPaxycb0c8Mfg1OdvrLWcn116x6+z8hIVJSAhvIbLkjG2hFCkPFMbsnjhTd6qR5
         2BwI/eMbiIjvCmfvTwgX+SWkBUbI5y58WouwtdZ80AuoHx1nwa5irWHpKRsPS8Qhajhn
         KHTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XKtYWBv2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si13154066ilo.76.2021.07.25.11.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Jul 2021 11:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XKtYWBv2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m7imz-00041e-J2
	for alex.bennee@linaro.org; Sun, 25 Jul 2021 14:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7imr-0003zC-5S
 for qemu-arm@nongnu.org; Sun, 25 Jul 2021 14:23:41 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7imo-0007O7-DQ
 for qemu-arm@nongnu.org; Sun, 25 Jul 2021 14:23:40 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 gv20-20020a17090b11d4b0290173b9578f1cso11043796pjb.0
 for <qemu-arm@nongnu.org>; Sun, 25 Jul 2021 11:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yrgP8hpFovMvTAiM5rAavk6XcbfLVZt6q/yQhP8CQDE=;
 b=XKtYWBv2EfIWUBqvSiG/HU23o2gUy0OO/R9HbqbwKIfdmiRQ8y0jiZcqrHd4RMo4lM
 AlOmjywDBRO5MiOnwDHreSsDG2O5o36bJUcRUh+CJFnXNhuI6K4nXYvSJMbp14B5+8lV
 XtekBDOtJ4iGzCckFb4w/wrHIR7UNVQlF3ZvXx8gGYpAsghns4Av0boTTrrMGbyDuJSo
 AeB+L5trDc2Cfk3jQt+TmRt0/+ybRpc6KwwTuiBPO5O40NEnjUk4KtLK2+0nREY3tGLR
 N05ntOmRvhXFsoYD1DNfbqzSkYYzOCSLELswaCs0g7TlLTU3sNeEa9dGykkaGJUSToAb
 5dFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yrgP8hpFovMvTAiM5rAavk6XcbfLVZt6q/yQhP8CQDE=;
 b=ts78Qx46rVYENSQZbFn4eKnZaBW6ogLK5iAKYacGI4Ypc+X4VTWJD1CLdyMGAEs2FI
 y1lZvXDR4NNJwiM34udwc9eFa90OYlaxIPIT7D0fbEIjvqoiK5dGpcSqOXj+PcKKMUGH
 7hzXgwmqATYRNiEsgbeTxSSVcpEskXPVWBy7Pf+PndVR04b0QyHxb07X6JWWjP2mg+Tq
 PEL70tH5aCP/T6tZsp+ANFB3GP/flRyM+bfu9B5Bm/BQgrJiwgfEx7Kf4uYJsjvKW4Xf
 OXk5yiCO6YxhaeYOXRz8+LrhJoRO8awexfkFkLuEZwUSDoqNc+7qdR3XAr+F3fzo96oI
 qecA==
X-Gm-Message-State: AOAM531yV0EndZAVK1MOETzOYUSOLvyClPcePV5/ZY2/gQ/qr8ZjPCLN
 hGvKDGNnuPMd1qvnEf2ZMMbxmg==
X-Received: by 2002:a17:903:404d:b029:129:b048:528b with SMTP id
 n13-20020a170903404db0290129b048528bmr11463542pla.65.1627237416908; 
 Sun, 25 Jul 2021 11:23:36 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id k198sm42521587pfd.148.2021.07.25.11.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 11:23:36 -0700 (PDT)
Subject: Re: [PATCH for-6.1 6/6] hw/intc/armv7m_nvic: for v8.1M VECTPENDING
 hides S exceptions from NS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210723162146.5167-1-peter.maydell@linaro.org>
 <20210723162146.5167-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1c014563-12b7-af0a-a03d-d7e4c2a7a54a@linaro.org>
Date: Sun, 25 Jul 2021 08:23:33 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723162146.5167-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
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
X-TUID: fdaj3kLdcrss

On 7/23/21 6:21 AM, Peter Maydell wrote:
> In Arm v8.1M the VECTPENDING field in the ICSR has new behaviour: if
> the register is accessed NonSecure and the highest priority pending
> enabled exception (that would be returned in the VECTPENDING field)
> targets Secure, then the VECTPENDING field must read 1 rather than
> the exception number of the pending exception. Implement this.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/armv7m_nvic.c | 31 ++++++++++++++++++++++++-------
>   1 file changed, 24 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

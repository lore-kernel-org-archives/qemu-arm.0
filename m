Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp520721ejc;
        Wed, 10 Apr 2024 12:13:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0go8pqoinqe5CzxhoQCOpXHdbcOo0hTSwB1dBKkMeDIglk8A/Kk+bmzx42ArLzrmIZE/2TjyUdqYDGIxgLw8Yia4gYICA
X-Google-Smtp-Source: AGHT+IEucyLV8aej5t/+NyVj1QbXyKuDYd9GD3lgwLiNeMrbjINdPHa7CQl7/F30yensWl7ay0wY
X-Received: by 2002:a05:620a:1279:b0:78d:6649:4c79 with SMTP id b25-20020a05620a127900b0078d66494c79mr3569184qkl.70.1712776405471;
        Wed, 10 Apr 2024 12:13:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712776405; cv=none;
        d=google.com; s=arc-20160816;
        b=jfFwkrUHnFpyPN4N9P4QmtDRoGmyiH7+x8IAHZenEw9nmu4Tjt53BC3h2Rah6G6stc
         IOiBxemZgGAzmXxb3xtDOA8N/83xaX8YMYN+KThIcbdPkw9nu3HC76iRP/1tNGFHX4i3
         TZDjmILvsW2KDhlWrTRyA74n8YxXX1x65WFyhZh11pLy7zW5ayMFTbUettj97yoGWQ2X
         LRmbeOWSh0WlNO6y/ypp5NphcwTpJY3ogbz5nM+qgfYG+ihcnZR04cbHidSIRsQVdsQ2
         UW6hrWnym4g2Do6n22rGrI9GmsUnQZMasgVZq4BJjN8mWaKmEAFAU2sNyN3SdL0EMcaA
         3O9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=K5DcqdSAdbuKnYaF+G88dGl3X18nqFIMKDGaSYN84kA=;
        fh=poUdc+nNSwVS0Kv6ABQw4We5+hrh4qfvkjOXdMsMgmg=;
        b=f1wlwai0dEv/Yn47S12uGIZgTJ9emzL51QXQBS+tbb1F/VN8+XQxHnbQYTkoOTJqMC
         aC1SAVWmBRd8LTSvLxcLiQaS75Bl0pxLS5GDJClW/BWiil6fXAKdE61Mrp/8MGcrGFj/
         r5hqFauzZP8popN8/h8OwWA3s4778LPhh8vSzR8UJJDKoaqsaO+CvgaA084Jl6Us/fgv
         qkVj/rXtKkiPOoe65h7E1LCeRsI5N3zDeqE0c+w76kXcLcxudjucFu5dinpl0mSp0SHb
         IQ5JbQMSQz/TIDUL+ZMZKm7rAWF1/oTimHxdT0kFnMCEY+JWD22JRbPYZtkHEE45LxeL
         fRVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OjguU1xl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12-20020a05620a16cc00b0078d5ef14735si9419045qkn.682.2024.04.10.12.13.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2024 12:13:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OjguU1xl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rudNS-0001ZG-Hw; Wed, 10 Apr 2024 15:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rudNR-0001Z5-At
 for qemu-arm@nongnu.org; Wed, 10 Apr 2024 15:12:57 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rudNM-0007oY-Cl
 for qemu-arm@nongnu.org; Wed, 10 Apr 2024 15:12:57 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6eaf9565e6bso4993851b3a.2
 for <qemu-arm@nongnu.org>; Wed, 10 Apr 2024 12:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712776370; x=1713381170; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K5DcqdSAdbuKnYaF+G88dGl3X18nqFIMKDGaSYN84kA=;
 b=OjguU1xlrYtePClOdGfl0EzzPj/NZV+Sz0dm5h4W8H2OFBv2ZOfr9ruTLeveyaDrAp
 UeKX+K/gRlp26HEmnMV9oogLKVCoiPhu+2VwnIaWTCHZKdI3l9C6nPkN/CI8sR8NnLpn
 VY+ThO1Ju/0+30fGueQ3tkc5JWRHgL++9asO1NYfAlibi5nwuzpXhzWvlF/5OwGLlbkK
 YSFRHjZDQ6EZbj4oDTdEsIFowoKa9Oi1U1fqRcNyAQ0sYZItgHwUaYZ6u3AxSM9vCl5K
 7lSkuUf4bWqCbST+PYcDEsxIuyz9rN+vwkErma8XrCGMN7Mv0yxRkaloIbbmjsMRyWc8
 i7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712776370; x=1713381170;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K5DcqdSAdbuKnYaF+G88dGl3X18nqFIMKDGaSYN84kA=;
 b=vr7tgFAJhPAJRdkasgWoQD1YE/xVwV7AZ+5IGB2FZLr+6QArlXadOf/L4fECAoxwH0
 5vJyNYT3L7+FL1zNaJXVCeoZ9T9/m2Aabw1YZi9AR7E35xrhTs2pSF8ggxc4z0uspzZZ
 XKU6sN5oxYLuxtsTQWGT1ptiimc5PosZkY8zVe6Gpu5wDXtkmJm7Ki9X9hYgcspCGr1D
 ygM/2AMsZViahcmt+NJxDw2FcNv1VRh6iIxK0guN7P+ZGAz5f5JVaMXgbnpkqKoWRqk1
 8556AEnCxbLK7Rr3PxD/p0vKfxhRFdEv0OzSIYJvQwVivGOdBVlOkQgIWQalCKIWXm5+
 qHZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV11F2XQaxnnY9V3cZ+xyvSUBYYUmH/8nm6+u0SZPc0PZccINprESEVTmVMeuZHyevm95RfHjuNOM09rjF+VuN7d69v
X-Gm-Message-State: AOJu0Yy4WnMdUuCl3cCr31RlzWPMfFLrTzfRy2aYODpGa3ue6vViSwZf
 icgwpDABGaKtzjMwR0YRXi3CLDw+DhJCOfli92GQPD1gA18yOvts99gbrop18Fk=
X-Received: by 2002:a05:6a00:4fd1:b0:6eb:2fdc:f8d9 with SMTP id
 le17-20020a056a004fd100b006eb2fdcf8d9mr3682039pfb.9.1712776370309; 
 Wed, 10 Apr 2024 12:12:50 -0700 (PDT)
Received: from [172.20.1.19] (098-147-007-212.res.spectrum.com. [98.147.7.212])
 by smtp.gmail.com with ESMTPSA id
 e15-20020aa78c4f000000b006ea858e6e78sm10478196pfd.45.2024.04.10.12.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 12:12:49 -0700 (PDT)
Message-ID: <c4c8f2b8-7ef2-4b2f-a9d4-8c1e64668570@linaro.org>
Date: Wed, 10 Apr 2024 09:12:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] misc: Remove sprintf() due to macOS deprecation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org
References: <20240410160614.90627-1-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240410160614.90627-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Q1y4GliBEEew

On 4/10/24 06:06, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience.

Is snprintf also deprecated?
It might be easier to convert some of these fixed buffer cases that way, if allowed.


r~

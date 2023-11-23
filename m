Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp556376ejj;
        Thu, 23 Nov 2023 09:34:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzlT0UyHr3yAvTGrHEOOIF9e4DC0+PwQDegVz9iXtZSDN0fbM9Y7NemxZk7Z4psgexYden
X-Received: by 2002:a05:620a:8707:b0:77a:b77:bcb3 with SMTP id px7-20020a05620a870700b0077a0b77bcb3mr71081qkn.5.1700760851536;
        Thu, 23 Nov 2023 09:34:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700760851; cv=none;
        d=google.com; s=arc-20160816;
        b=VAr4unNJSCDX4rvCt4K6BQ+QFSzasneZgPLE6N7Ie5PkVxnpL8bSYLM9XI1BQ3FDAw
         l2MFUHQUkrB1hF5POmgtqhMhnQ7Dl1qAK2fpWttX/2mkIcd6jlhVLlSRwhWZ3jCQrZhd
         eyXGtPkKpBzJW6o+xeBVPAY6iEB9DB4nPVrEGdRGrTxyOy6BjmzwTAPL/vQ/uwq50ZaV
         GesrHGGQ9S9z3kv2Re+Sp3bYZWqSgmW7gykTdw0OIUoGkrNRkyOpUvXMjY9F8hDY7d28
         RB4xJ/w1ac3owkqZDf6nW2jRttt3EDqLeIRNteM63IE85GrJpbPop5P4jHAKpZU78fer
         i8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lavYDdN/Mv6yJ+kdqqYmIq+qs5nycWgd1tfZqwn099s=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=CJOqqvh4bUfAq8nsxu3SlT3IxFyJusloO5wTVo1FCU7CCaLnS/XgN7y9zQ22Aa21in
         tctXRcgb+D8jWInknADqgnbkUzrZ1skwK7l15vqx8jcpOGZUXddVd9caoldu3HfBmPIn
         LIA/Mwvo6FMM4xq3yJLlo/qUjGIwtjWBgFSTsv+u1f5T80jUkXOsROWukERVhzPTZk7K
         sK2OOwEGFiMiJP1+YVRhUMwobB0vJrbj+HI8WJv2PE5brEUqAcYUxMWwNdkoV/3xm0hs
         1DJwoV8tnlzOqwJ//70GJWLEUOmyIH7jOiS0Q5AUMls+UPa1XWdA4psSEyi3RPVXgNJ9
         NCDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H5dW6oSH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a05620a048e00b0077d6787245fsi1481856qkr.443.2023.11.23.09.34.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 09:34:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H5dW6oSH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6DaR-0003b0-MZ; Thu, 23 Nov 2023 12:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6DaQ-0003aS-CM
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 12:33:58 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6DaN-0000dn-Ry
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 12:33:58 -0500
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c6b30aca06so13870881fa.3
 for <qemu-arm@nongnu.org>; Thu, 23 Nov 2023 09:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700760834; x=1701365634; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lavYDdN/Mv6yJ+kdqqYmIq+qs5nycWgd1tfZqwn099s=;
 b=H5dW6oSHld4N1hwFx3RPBjiY/QG5r00c+hnPbOTpQ0/XMUC5/fXcxgSJfv+bMtV4e2
 LU92micuiiwhJI1bROIhtLL3wLIdF/Ne5PtNE/ypoVh2XY+BBO2BD+/PvF9QCdrMHI5H
 TZXQNapsElt+DnVkYx8DL8oGqV3XNEXGfyTjhefb2VPsowXrHgbByTjZwyKeHiCE3DFM
 UcSboGE3G3TE8odrxEXsByWZvza3Aj2pt8HMa9BWOkjWXfwXlogtEW+7mIkEB5tAc4Lc
 4pmQ/mSc3sJGg9dr42VUF8bl7QagC9f6Q1FqSiHLE69l4gCwxAVcT32zrLmJbiRAOU4k
 m/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700760834; x=1701365634;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lavYDdN/Mv6yJ+kdqqYmIq+qs5nycWgd1tfZqwn099s=;
 b=b3jKSyjuUPYk3hjdIp2R8oDsDHq2CW2MYh8csDoSeIMGCIww0By4IhjL3piLS1E4m/
 ibcKXknfgqH7c0nvrMQMnxUurRvyzFfGmFZACug4no3pZ1YyEXN4XyIJdYF2OvAHoQeg
 3Q+HAly6Wlar0YfMcDhAYGwWlv7jsF+Mi/ioiTo5+uwgIChlVrTpetOP0jHBFWQ0vhsx
 YCb3csq8zd7Gsby/QLkNx44Vf8VGe+/MCWO4BHu02IpRtUQHVp/c8VJivuNPbXbwWIpX
 5qHzRTtSZFyMBiblRsJvmiS5HHE9sPFcaAUHAg6JxA4T1LV2k9zl2gkdCGn54KPXXLMP
 i9fw==
X-Gm-Message-State: AOJu0YwCZA/YQl1vyhwTl1IUAzwxou0YjB5yOMsG94gerI8qrqpyMwUd
 Qv7g9l47+ItdI3lYhKnr/wtvRQ==
X-Received: by 2002:a2e:81cc:0:b0:2c8:33a6:4df4 with SMTP id
 s12-20020a2e81cc000000b002c833a64df4mr36402ljg.38.1700760833658; 
 Thu, 23 Nov 2023 09:33:53 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 be7-20020a05600c1e8700b00405442edc69sm3305072wmb.14.2023.11.23.09.33.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 09:33:53 -0800 (PST)
Message-ID: <235ef186-50cc-4893-abaa-f0a9e0386d9b@linaro.org>
Date: Thu, 23 Nov 2023 18:33:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/21] target/arm/kvm: Unexport kvm_arm_init_cpreg_list
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22d.google.com
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
X-TUID: jYuebIJgARd8

On 23/11/23 05:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 12 ------------
>   target/arm/kvm.c     | 10 ++++++++--
>   2 files changed, 8 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


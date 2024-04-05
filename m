Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp1125842eju;
        Fri, 5 Apr 2024 10:09:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXhslW/20nAC79Baa2nxOnGGr+qzRvd+Y23ZOC6StdT/OXnynEDVm2npT+28CGQrV4Unhj2ytpnVOSzXwf4EwCW8vKJDTQ
X-Google-Smtp-Source: AGHT+IFJCPygWwjd5EWWL1AbK2BTCOaGAo8SkVMlDQ1x9mEycxBxWnaDk4NYAFzjNKSB2SKtwcmI
X-Received: by 2002:a05:6870:5a85:b0:22e:cd76:9cc3 with SMTP id dt5-20020a0568705a8500b0022ecd769cc3mr1599703oab.29.1712336969811;
        Fri, 05 Apr 2024 10:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712336969; cv=none;
        d=google.com; s=arc-20160816;
        b=Hk68KowT2b68u9wxgHQ+rXcl2ZWOfgzs4L7IY+5YmeP3kEu9VwZdLBjyxIp2ntd0e7
         2u8p9pEaT4zXpYhEXgvtCVl1uaMLaxvDRQZ+UjUEfHc8Rq5MaokpVmFdVs/zg814g2zB
         X+fUETmzAt2ZfoRL0RigKtNBjeBvmEggt0Bx/PUeQelpuXIvrOATdcYkolVDd3ADGwLP
         7HIOVBv6Y0yjfaKBB4gKE4B2schgTXVGBC3YDggM8Rv9O7DnlD0m9qhwwIFqgRA3KqjE
         8Vtdo4ENNvUQrOyj925TqFG+0JqFLBBiXr7ISzgOGLtjaga5SXogizmciJ7AvDEm+W6H
         qQQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=o8vbCZadgD7aa0QkATV3N9iQ+1lljvzuEqBVXuz24pY=;
        fh=mWkp7ov8mphcoDoXEMU77NJnYnRbsFsqh28gfeMcUU8=;
        b=TUT0Pw3EmIQwqqrjKRN65QOfPjXzeGft25VRovBkC756m+HjGzDwYhhNNnhkK+rtky
         I3cdDTrA4hp2FDm7XCM8Hyi8eEx/tC3ieXXf14NLO1eCx1VFFVxuWJMnXKhkqT2mer/q
         bNNEOvBd42DnYhWzlDqMQ7JovFgs8xIoWXDnOCmyOyvht8z/PiFHAVAoCXzQGmLNobsG
         zVQd25zAR+IwYcGB4Pyz6U6E4wB3BUFtQsgau2UWgYJi/eGYprrktpPO2qf7C6qyytyX
         MqRmc4ZAQiRN38z8azdL5PQXOP9eXZotfGUQwme4Xv80Xsw1+0l/Z7hAyutCyCvNbSI0
         R6NQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=av6sWq4A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7-20020a05622a060700b004317c1ea75bsi2229574qta.134.2024.04.05.10.09.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2024 10:09:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=av6sWq4A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsn42-0006xC-Qi; Fri, 05 Apr 2024 13:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rsn3w-0006t8-Ak
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 13:09:12 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rsn3s-00081d-8H
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 13:09:10 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5a58009fe88so1220213eaf.0
 for <qemu-arm@nongnu.org>; Fri, 05 Apr 2024 10:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712336946; x=1712941746; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o8vbCZadgD7aa0QkATV3N9iQ+1lljvzuEqBVXuz24pY=;
 b=av6sWq4AOOSiOwtepKQhMlszbrY000PQyysqv/+hmxaot+JYpaqVB0j/VB/BW9pXYx
 aP6ST9uGmefMqQMkZTXZ/XKUICU9BpIax3LRdclOVfrM4y44YsO1S5VHZVVM34oQQx4k
 HdjTzReJ5DsvYqaFg63YeSMT72AkQoXmwz6b3kN9j/Bqf3T8ftckPiYEDjWJr9Rl1JDM
 LtavfwJYwRmAfhAtCGgLX+SDCYdfiI4+gk15Y6Z2MVyocxwaOhmQImTiG5q3sXwmYyMq
 KoYE7pie4rQQhOLkNtEh3z6MSddPZMbZUGI63ogqjd8jauLcf36GzfcLEmwtrpK/t+ap
 jpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712336946; x=1712941746;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o8vbCZadgD7aa0QkATV3N9iQ+1lljvzuEqBVXuz24pY=;
 b=D+f/10bi9eAuPOh/t6Eo2u45A0lpSWo5aZM6Nx+1VIvL3/0rUA6EnRXgo7QaK5aHyi
 Wj1GDLlqUIFpPHl/FIsiiNBTzf+Q2fG7TDFtGwdkbDQ2adP3EdfTqUl2tfIgj21j/Sly
 zTfE/KzmjLgzqqj9z/IlS97TUHfR54cM7dw1wwOoeL/8j5MFxErqtkoTw/aYY6WqM8Hy
 v+58badQi9oW4gmSqakU8woDeDrMxshvMqUkqKrB1HQzZ21gttEfeVcQm+TvIUWd28LT
 HZa8HNC6EbPb4ibFp9GLd9tGE0nQkig9jbN11bcTfp29E6hgEHCERzwg7OrV4MhcvEU7
 qV2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRTVadM1v6bHq/xAbqUhedmoh9uZres1fqkvJsIJoPJduBEpO/+J91N5VBy0M+zO0Zdu0MzwMuQ7izBRPyxXLKRcQv
X-Gm-Message-State: AOJu0Yy5KOfMG8Fu8Cukt1aE84xWx+5F46d76msYPrWkHeJWxTS7g4Eg
 bfsHDtM2yYwl5l976xd+JoYov0Ud3zHeNduC9xUA6kdMY16w7ifDk7wksgwRi90=
X-Received: by 2002:a05:6358:9544:b0:183:f639:2415 with SMTP id
 d4-20020a056358954400b00183f6392415mr2009701rwl.27.1712336945820; 
 Fri, 05 Apr 2024 10:09:05 -0700 (PDT)
Received: from [172.20.1.19] (098-147-007-212.res.spectrum.com. [98.147.7.212])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a656090000000b005f0793db2ebsm1510433pgu.74.2024.04.05.10.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 10:09:05 -0700 (PDT)
Message-ID: <64f3f615-2eb6-4303-a96c-c9f1a5aad0f5@linaro.org>
Date: Fri, 5 Apr 2024 07:09:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tcg/cputlb: remove other-cpu capability from TLB
 flushing
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20240405125340.380828-1-npiggin@gmail.com>
 <20240405125340.380828-4-npiggin@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240405125340.380828-4-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc29.google.com
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
X-TUID: V92osKQl8fy9

On 4/5/24 02:53, Nicholas Piggin wrote:
> Some TLB flush operations can flush other CPUs. The problem with this
> is they used non-synced variants of flushes (i.e., that return
> before the destination has completed the flush). Since all TLB flush
> users need the _synced variants, and that last user (ppc) of the
> non-synced flush was buggy, this is a footgun waiting to go off. There
> do not seem to be any callers that flush other CPUs, so remove the
> capability.
> 
> Signed-off-by: Nicholas Piggin<npiggin@gmail.com>
> ---
>   accel/tcg/cputlb.c | 42 +++++++++---------------------------------
>   1 file changed, 9 insertions(+), 33 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

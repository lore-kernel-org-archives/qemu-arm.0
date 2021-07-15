Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1211227lfc;
        Wed, 14 Jul 2021 18:38:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/yz83Cdz3jslr72jjTyZT5XfvPyVwRjShhj5KRqBmbV+A6AEzTzhDGWGSb1P3QManW405
X-Received: by 2002:adf:e0c8:: with SMTP id m8mr1259325wri.261.1626313087178;
        Wed, 14 Jul 2021 18:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626313087; cv=none;
        d=google.com; s=arc-20160816;
        b=YBfFtxcsvG2laUivFl0eG1xxfLDouQpvOj5I+2b/Vr9qUboh06O9ksL9xCxJUC3g5r
         pUYlfK+KlrkDDEb9FQiYmQx3INJv2kTwqvySbFCYOgQ3gWnC8w7OhTh5aeEb2jd1bm+H
         diNRAsZsqtjpvajd8a0L232FNRbC+gZWYKb4td+Fng5l3Sjv2luNt95E7n2DjvThIqHs
         V+MbIMEfyKnmBue09/wTrq3Op53JLXz7WbrRdKdXH3nKNWo4ib67vgevMtjohzyd8Gbq
         Fr7c2Qq/zMhP1//+zs5XO2AI8xK27GovCJvqWN4q/Q6AvKK8wh0H17eUTFWi0LZlG5tu
         9zVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ce32CrITOlKgSjw4Ko4/D8Jjp1B64lj61S4vAUyJzmM=;
        b=Rr8lR7qbhpEcCkLwfHMPM0gPq2FTZ8TE4vBLwVIwPu0bFYM6TTkxIJQCRVfx59I2UD
         1MYl/P1w3Nvovoe0G5a3xdzNeSnih1XhfJ+9DdbKbK/co7f6A5DmctO7H4HiRtob6WTM
         GrGVK9oKJUlrndPmRX+MhldAtoCxvPSR27RG/iBXfMesnVdC/M65aP04iAiqBvSWFLV+
         dKNk4o7oiEdoaPlkZJeODjttt3CXPg5nzboEns5Fq0oRNIpZ9GrWAJvCJUZmZu4D5d8W
         uVwel8ZWFr66ylPh3zYgWy4c2c5EaVJha6EnOByUXY0i91b1FOwOX3i55z8O7DvS6V25
         V5ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MmErWpi0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si5773874wrv.31.2021.07.14.18.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jul 2021 18:38:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MmErWpi0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3qKE-000283-BA
	for alex.bennee@linaro.org; Wed, 14 Jul 2021 21:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3qK3-00027Y-8Z
 for qemu-arm@nongnu.org; Wed, 14 Jul 2021 21:37:55 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3qK0-00039N-NM
 for qemu-arm@nongnu.org; Wed, 14 Jul 2021 21:37:55 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 g4-20020a17090ace84b029017554809f35so4958370pju.5
 for <qemu-arm@nongnu.org>; Wed, 14 Jul 2021 18:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ce32CrITOlKgSjw4Ko4/D8Jjp1B64lj61S4vAUyJzmM=;
 b=MmErWpi0aBbK5vcbbry2VbVqQepLP5fmXtvRh6AzGAVIfyMKN3EgEscIvw3fYBBSTx
 sRhx2QVCUvSXN/+Mc5oBKU9IyhS9Bq/daZv0hDB8gEy/c6fLDUOCqOZCtgpTqfPKXsqV
 xffAYJL3/xa/MUgfp3+6lBXBTxdUVhwKF317eOFoI7W03IA4S6Vl56HfBHb22nCOKfel
 Ecpk6uVHgmFR+a80cP4GpQDXYvPSEqLyXdPxm8+Nlxo979o3NEgiPLh+Pw95cf7TO9V2
 s43yJwInBJGqyObt2KVO/nWZGwV5bVCXUdrNiyH/+fp73G3rAZf9MqMGublKUMkkFuPe
 RrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ce32CrITOlKgSjw4Ko4/D8Jjp1B64lj61S4vAUyJzmM=;
 b=SIydG/soiwPiw0o91N1nNzo6qB+EnJUEjuVdoGSd0lQlNBlifhokHIl0XjwION6LH3
 A2IKFvh9jOYF/RqNU+vBZqa0cMM7k+HwzRdYfR5Fb9gtCa5kNTmRLAy4Rhpfu+ZxAbc8
 U2ToSHUUpVC9MsEomsU0u54o5jRRgk2dgRVfqXfvK1+IJsJxVudh0Q4W5NBTT1DWFOYC
 yi+iXtpkNyQLaxV2e8qxPIcqNxpiuGQVJZPHazJkWbXiLB26i21kqUXMcwc+J37n+jQt
 ONQ/K97ctMPNhAegzN54KmJc6nm3/j1xT3FtZr+PWnXnAxT93wJobA9zR1Fywk54zuNz
 8qDQ==
X-Gm-Message-State: AOAM532i5oU5ijuDPIPq9rODaRhnRezIFbNy03+cxj2naJiubGKqRPeC
 CChvi/IGI/nRLpvst3IRaGKjvw==
X-Received: by 2002:a17:902:ec86:b029:129:ab4e:9ab2 with SMTP id
 x6-20020a170902ec86b0290129ab4e9ab2mr1006197plg.12.1626313071241; 
 Wed, 14 Jul 2021 18:37:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g9sm4234512pfr.133.2021.07.14.18.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 18:37:50 -0700 (PDT)
Subject: Re: [PATCH for-6.2 04/34] target/arm: Fix signed VADDV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba6dc02b-045d-ca87-64c4-c58cead22cc2@linaro.org>
Date: Wed, 14 Jul 2021 18:37:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ZFdL3CcrXjiX

On 7/13/21 6:36 AM, Peter Maydell wrote:
> A cut-and-paste error meant we handled signed VADDV like
> unsigned VADDV; fix the type used.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve_helper.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

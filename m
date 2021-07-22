Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp6249036lfc;
        Wed, 21 Jul 2021 17:50:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTQcOmfcT8enL7yhW9I6YJjIN4g43iTwpfevbBjV9xvHmvYawi1Nbj2PlvFC3BYUSMB7MM
X-Received: by 2002:a25:374b:: with SMTP id e72mr43342903yba.360.1626915027780;
        Wed, 21 Jul 2021 17:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626915027; cv=none;
        d=google.com; s=arc-20160816;
        b=PFAH6l+P6tmDgoQ/4j4RWs3gAKxlxJ9XXg6l6lkJpq8Eoof4YFActskLge3euhIy3B
         /bAIURAdkWD3GOMYyzow3NJn/12a5db4rTv9QqVWbhRACurTe7GF+LwnfghreyEaG+np
         1ciEiPPZr+w+I81dR+qak27mkYmZdcKUCZj/RBVGJNIgEzILGdJaJMVWbBIIZPCXCYbe
         OHmMsnXNJfr4cev+DAivDhNfhSYn9CmIsnm++vpLkTMXitCItpVr0PU6oUkTZ94Wd3Dq
         MTqmbT58NaFd8E0wB42VIN+lAGLEZ6ZVO0mzH7CwTI/4260Ei8VhBYeViP0yHeAUvBdT
         7HGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CiBs9ErOQVTYs2CjuygeJw6/bsE5JEbE2kWIVK2dJJs=;
        b=BWh947CQ+YIP25dHKM0IMThk5RtIRVbPoq1ZfsSwx2SfKxMey/rvNceqQK4dEIZ6WE
         udiU10RatM+GS8PlqTsUNeRZkz0uXOXSY7Wi110ZqAfgz/LP8Fl1Ww8s4W7U4967q3+h
         j5F/fP90jZv2UUulZeViX/J4Rd+Pb38yXY7Ttkge3zXtXjyM/VE5J8tnz/KamHOIwRyJ
         ST6erWYQ3/sn2H+7yLeb0wyqi+gciGze6YjJZMKLDxORvVf+pZa+uQI2s1aCq8izoxac
         lnxsKuDZGfTdhFKlX8/FilFskKQzsSjHf9e6ErpN3IYPfH5MUMDV5bz38t7CZ9jWVv/n
         0Njg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mj30NXN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1si27683843ybp.57.2021.07.21.17.50.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jul 2021 17:50:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mj30NXN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6Mux-0002Bv-7A
	for alex.bennee@linaro.org; Wed, 21 Jul 2021 20:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Muc-0002Bf-Bx
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 20:50:06 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Mua-00089G-CC
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 20:50:05 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 a17-20020a17090abe11b0290173ce472b8aso1855216pjs.2
 for <qemu-arm@nongnu.org>; Wed, 21 Jul 2021 17:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=CiBs9ErOQVTYs2CjuygeJw6/bsE5JEbE2kWIVK2dJJs=;
 b=Mj30NXN5JoRRkJSVAttTcs4CLbG04ApmGv1dQL75q7zLJRaW6YZUDm42trvV75mg97
 RljNZex1pdiPjD4E7yzT1WtSUUUImjyXtUUmWcWH4FYNMV3LM+P6IET5u8OChiwXL6eb
 UKzbKmeQJIbDsrb8vHmHzCqgnGv8XZXYT8HPisk8IpipKSoPUNZjMwUhghYsfOW9qBV8
 l17RFnIeOX7GLoPFoXA8c2YZUmYdQ3hBX7CxS48jisMYB46HIUEWiQPbM3lysyrypPoP
 rXs5vIVmZycY6G0agDvYIlouZOLZzjbS1hBTcn3iXQw9lg7mIfg5YSAn+nLYDPFZPLX5
 9/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CiBs9ErOQVTYs2CjuygeJw6/bsE5JEbE2kWIVK2dJJs=;
 b=FXCxLhdmWqGLhdIj1L+kJD3qiXGPGqj/K6lK+7QC22YCsKx2h+AI7fym9ZZY/TGoji
 O7RhhehuK9lbTFx+cAiK48WtCac7+JyDGKFugAebGedXZJHIpT2hMR9GWBgFfnXiXJ/m
 a/mhUH6mC5W8YSq+A+Y9oy8pGAF9NSHmfVQWNOpgpuF1S8EPY/+I3QV5js8m1rKQlzuh
 +ax7nml6jI+jnqOCPuKouZmeYL4M+p4HKE+2H7dqtXUmcPD2D6Sfd2sLa8ns7hMZtzw8
 WmDa+NBN2lWSnK7hTl5zo4l0GIgfZBq3R5XmWfuXv2c1XhZa6ocMtewD0kzLC9rDcQjQ
 Nu2g==
X-Gm-Message-State: AOAM532kw3APKZ/m+ClHsYQrmJU9OZ2STrU9nIeFJxuGNu2xKcHUUjDL
 beJ5r5QZ/pdJjUjNNCf/QKxhlw==
X-Received: by 2002:a17:90a:3f87:: with SMTP id
 m7mr6436139pjc.128.1626915002590; 
 Wed, 21 Jul 2021 17:50:02 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id y187sm27716791pfb.185.2021.07.21.17.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 17:50:02 -0700 (PDT)
Subject: Re: [PATCH for-6.2 33/34] target/arm: Implement MVE scatter-gather
 immediate forms
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-34-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17a1f037-3033-dc83-e970-bb16dffcdeef@linaro.org>
Date: Wed, 21 Jul 2021 14:49:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-34-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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
X-TUID: DubIoXBJ6Wiw

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE VLDR/VSTR insns which do scatter-gather using base
> addresses from Qm plus or minus an immediate offset (possibly with
> writeback). Note that writeback is not predicated but it does have
> to honour ECI state, so we have to add an eci_mask check to the
> VSTR_SG macros (the VLDR_SG macros already needed this to be able
> to distinguish "skip beat" from "set predicated element to 0").
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  5 +++
>   target/arm/mve.decode      | 10 +++++
>   target/arm/mve_helper.c    | 91 ++++++++++++++++++++++++--------------
>   target/arm/translate-mve.c | 66 +++++++++++++++++++++++++++
>   4 files changed, 140 insertions(+), 32 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

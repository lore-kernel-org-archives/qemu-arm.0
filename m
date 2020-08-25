Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp78102lfc;
        Tue, 25 Aug 2020 11:19:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGC8XtnSS3+nunx1q/ntaoabyk64nnmDKSX4J8eWCOhDOItigk7kFEMaH5X8SpuZT+Xn22
X-Received: by 2002:a5b:1c4:: with SMTP id f4mr15698381ybp.48.1598379585221;
        Tue, 25 Aug 2020 11:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598379585; cv=none;
        d=google.com; s=arc-20160816;
        b=nLi6rWNa+e9+6EiXPEQ6heymkdiUNtC7uII1WeDNL4CTwEtYqrmUQ8BWFSEqCUyrXs
         o19xSokM+B57/v/jaVbohR841ypLz26A4bkDhxG2E5uh00Vofk2N75Ia+0ZZO60RRhiv
         7iRkWlV3y3S1m9WibDgsK5ZH/sAZ9vmiLA76LUmBsxa6G5UaKrSHxUxOvEXdfID6cwfr
         BP4pqfGkQJopjqIjacfezVZYvgjeWOxr42UXoT6BaeOWNVUjROIUTJ2qkZcEEWqnVDil
         2ljaMLMwcgG3VAjSlsq9mEP6yadypXD5accTneNCTl9DrW6GotLFDw8tu9ncgwhkD40K
         /dqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vs+PEI1fEoLIhKUp/fCWO0LnH+Tv42HxTAk/bRgdsvs=;
        b=sTo/H6h5Qe6uo1P6hMRODa6gHBbXh19IBnZaxC7rV7gRZsZx+DTwo+3ZnanoKlNuhJ
         GOiWm433SQt19TzOGpbz/+CvIMMhaMX5DC4XVrOUx30Yf/QSMRnmnjsmJ5fPbL1gHbgx
         P2ocdlSiOCj6cBkLjAKSdNOr37UdBWXCqPlP64DmfUF35IWlZknNdotpMlPLpAam7rzG
         0GtpI5LYD9VgrV/DYPh13Xj8jXJjZKLoxwMfc9295lvRzsfst8tcY2vDXsBcSTPagsQa
         hIxrcFcPXEnGGaoe1vpk+8gVMTDTtb5OEe7CSmeG2FRZHJTcznlSoN/jyrmwlmjd4kBl
         ueVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VRFgntni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si16253066ybk.174.2020.08.25.11.19.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:19:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VRFgntni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAdXs-0005KW-JG
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdXb-0005JO-GZ
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:19:28 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdXY-0006OE-TO
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:19:27 -0400
Received: by mail-pf1-x443.google.com with SMTP id t9so3817649pfq.8
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 11:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vs+PEI1fEoLIhKUp/fCWO0LnH+Tv42HxTAk/bRgdsvs=;
 b=VRFgntniwsORs6ZZ3i3U81tnmlM98eVVQKrm3cv+gL1UcJ7hAOQyeNbhWxxkBnKjVO
 h89wlH7G8ws0ZmtdNqRi/1AtVlhta8dDUnuojw2NMHwmCIiWh79Z03zt0DI1jsVKSYCQ
 mxWroI9WfL5bKhnJpyGnFI5ZqX64S5TQCoV+mQ0IGQ30RIoUg9VkyHs2cw62gDTtrguy
 sQsaBOiVOVNrgTlwfe91jQoHNwk8X3qKIUVhLHw8l5lHvtYU8eccmUiBFYMGvEkL1/qy
 WMSHL06lTv/Iq+HNBWM5Zspan348auoZnOX9y/M/4UAOJZV5DvZlv1mHRQwXAmUS3zdZ
 wIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vs+PEI1fEoLIhKUp/fCWO0LnH+Tv42HxTAk/bRgdsvs=;
 b=D9guFAfBrU9YVLu0Wrq9O77Ty3hrcl8bIkM76o6RGBR09aloJsL0XyiwlRKVDhbq4B
 Lw1Sw+xOAPvmRF81N6Xb6FgiEYglXQpaGjyScW9EaMhbCXp6lBY3pHHdUVQARYMBi1vD
 Z/KWi3x+1bOdmfYeZMSn3Zyq/2OUdIR+uT9BheOBlQW09dqNRRG2TTc5JhaLWSPjtND8
 0F5hf/wxGx9B7ZbEesZhQVE5yx9NeKxUAXnmo6TGvc9yrhdJije8/m8j4iDsFcjkBZMf
 Soi/qbS9Okqc9M/bI+ImNmzeZa6iU0Zcm4C2r9bwgtTvGdMUuEI3BtXOlCIspilnTV6w
 FMEA==
X-Gm-Message-State: AOAM531MAaB3AGdZkTq+UCnU4MJidXqBrKc7Tr6nMKnWsGnWH31pwMBB
 MKxtIfX6nw3MOkQmXyB/LaMWCw==
X-Received: by 2002:a63:d410:: with SMTP id a16mr7599948pgh.133.1598379563590; 
 Tue, 25 Aug 2020 11:19:23 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id b185sm16020787pfg.71.2020.08.25.11.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:19:22 -0700 (PDT)
Subject: Re: [PATCH 05/22] target/arm: Macroify trans functions for VFMA,
 VFMS, VFNMA, VFNMS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <df10ae80-a135-dabc-2a4f-ca86116b895c@linaro.org>
Date: Tue, 25 Aug 2020 11:19:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
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
X-TUID: d4nTQc6Lf4/r

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Macroify creation of the trans functions for single and double
> precision VFMA, VFMS, VFNMA, VFNMS. The repetition was OK for
> two sizes, but we're about to add halfprec and it will get a bit
> more than seems reasonable.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.c.inc | 50 +++++++++-------------------------
>  1 file changed, 13 insertions(+), 37 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

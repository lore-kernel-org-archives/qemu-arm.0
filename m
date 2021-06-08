Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4886588lfa;
        Tue, 8 Jun 2021 16:30:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+E6gDLmhXwN89iOKgeN/9Qs7dbgzBTRQOCKetbWr+kFY+F23ILG6Y2Zdc0/rkuz1xB8Ep
X-Received: by 2002:a02:ccd8:: with SMTP id k24mr23033350jaq.99.1623195002721;
        Tue, 08 Jun 2021 16:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623195002; cv=none;
        d=google.com; s=arc-20160816;
        b=KSKNj4aMGL8uDvxmODaEqi96q513grfYu2u+Cu0tkYYI6SXGff7QLLcw+GYtIm6id2
         XH1e1GpN8tqRppPofIQkE/L0cdXmnKHCnB6mfITfn+ZuZ2L+ueGzC99VahAq256PC56J
         HnEedSB8/AtmS9HHBXVRF8+czbxyrWAWPu0K5EcH2iywhSlbaEoOtk/5sokc3N9FDqTy
         feWDrn6zAagcqQZ7ijDLmgbxyXx2xRVkpHfaTuUbrVtY7gEz6OMwg110bQL36nqnATWi
         tX6HJ1jF2PMgRxhv393SAQL0QXObiCgqsSMsjF9D2rTh32CplLZUgLG1Zzr7SKvcafGH
         +sjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jaEOuUFHUlxQrPeAVYC/FA4jnObIh53SdcO0faDHEP4=;
        b=ZmDahBET0HLAxlTOadG994Hib3SLdXGH7RtsbtiXl+MqxLw/yQFnBUkvLtpP/SpX17
         rOOcmNd4NfaaIq4i/uRShXcG0sfQJMYFW/a/kyI/W86YXe4UHWv2FMQqR6Yai0WEeVDO
         uDoKPuQ24gvdD5pcRjaza9x4F+OK5YL6FS38op2ddEmLFplN31Ii7CEhDFysuWR5bRKZ
         giaFKPqjd0fjDxwxZmEhX86wno8ipnCC3MQi5Y4yXa0xwgn4M47xQYpXqRsHZE+tv7nY
         hVQ7hmsRsLRgiJiyjF0Jtb6R1+ghPAYLIgkKQzhgFljgaIX7/s6blW03PlhcGw2KNckF
         yI6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hdVChaMq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si1364601jat.109.2021.06.08.16.30.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 16:30:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hdVChaMq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqlAY-0006O1-1z
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 19:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlAL-0006L8-Rf
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 19:29:49 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlAG-0000CR-F0
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 19:29:49 -0400
Received: by mail-pf1-x435.google.com with SMTP id k15so16941040pfp.6
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 16:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=jaEOuUFHUlxQrPeAVYC/FA4jnObIh53SdcO0faDHEP4=;
 b=hdVChaMqMTKeT1kRAvu+478y03Pt/7PG7uRvxOCJXd+nK18AfHPbtDfs/f2g3umIYL
 Hc7fmPIaqaN0DN1qC+0rDS3YmjV6BJP26VeN1mN6danyUHOElu3obCgpkw41k9MVHaER
 WLs+xgBF7FZQd8/BlVuhE2fhy+eb6/RFFm1t8hqn8u2c6sjM0uRkQorsGZ74ejEJdaqW
 +B02tsLERvTb70fAZQYp6pbGeQXbxWqT63DmBVHRzqdsEhRC47NUAyu/kKuvQG0TAlse
 Neqq/2p7EbRV+GwhBfYfTDS6w4PMNKJer/ASf7+WjwEBW54ekgLoO8LF7Fe46Y3vkb/P
 7L1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jaEOuUFHUlxQrPeAVYC/FA4jnObIh53SdcO0faDHEP4=;
 b=GYoGGQlX2f4Fn4Sk1ksdGcmgnKmNBuEWEdwc06qWZFnCTIBGi6xVPjNDvNiVP1FR1q
 tnca9DrbDLVmC1oNTpT4adAFLsnJY/+W4vGSG9nA8Z7bxYm6AWguw52lGZyB9lqX6mqj
 GWvyR4Zman9HIJ+Yup7Rk6EqYUF3T79/xzaIadrQ1qvoZThoOpeIdRVEuWXk6dBJLjHb
 4KSSSMCnqaAwdEGwEU9YEOtdy02hcJUroYnkPTzY7EF0tFr2By/c4tJ7+l+F/k/1EfPC
 PB4a15z+uXwAZ9lMOii0TZirfsyE/C5tDFKjOeMZ2k3ksHGbrAbotLZnz6twglRBw1Vs
 fEbQ==
X-Gm-Message-State: AOAM532C6UrylCRvVsfXQNeNTN01/s26ZqH4ZjC1JrEEhnDRDIp+AJAe
 PIv1AJyUCmkKcRBkCaXrBsEbyw==
X-Received: by 2002:a05:6a00:cd3:b029:27f:c296:4a5d with SMTP id
 b19-20020a056a000cd3b029027fc2964a5dmr2427942pfv.38.1623194983030; 
 Tue, 08 Jun 2021 16:29:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 b195sm12585528pga.47.2021.06.08.16.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:29:42 -0700 (PDT)
Subject: Re: [PATCH 23/55] target/arm: Implement MVE VMULH
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e258719-e982-c188-69ec-71e897d75e7d@linaro.org>
Date: Tue, 8 Jun 2021 16:29:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: UhczwZSuh57s

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE VMULH insn, which performs a vector
> multiply and returns the high half of the result.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  7 +++++++
>   target/arm/mve.decode      |  3 +++
>   target/arm/mve_helper.c    | 26 ++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 38 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

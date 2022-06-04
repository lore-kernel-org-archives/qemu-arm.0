Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp335286lfb;
        Sat, 4 Jun 2022 10:43:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8bwU3YuwcPMgpyBMH7KUUOGqw/5FLq3rp/0ALghDD4315fyN5uHrmwLagcEYR06vAmlCg
X-Received: by 2002:a05:622a:3d0:b0:304:b6c5:dc26 with SMTP id k16-20020a05622a03d000b00304b6c5dc26mr12648115qtx.237.1654364632236;
        Sat, 04 Jun 2022 10:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654364632; cv=none;
        d=google.com; s=arc-20160816;
        b=gyVvs2FBo2NEOYYI8Qw+PddJwyDo9RKsQ0gfHAJlA3PYEfQxpxUAzkoJB1CS0hj9P+
         ytakQ26uqRAJvNGzSoAd3s4DcFQvLFS0dbdDkWOY7JlLDgGs49b0kflLrXqMlygscOg5
         F+vC7wDS3CQ+TOqkdnbRJqCWKLTVOFBI5/DhnqrD9aec9qV/cSHxNCXczcbUOAh2+oUa
         oc8hYyFd5AT5+a05yUbUSYyvqML41Hqla1Gr7UYwxxXhWAvgQHykeaCMvPOVgDxARZsA
         5d8COhVSQAtt/bBzrM6KYy+IYZ4lJsbIQtiKfnuXwAi/kWOy4etaAYRsYvAVJSm7O4tT
         yuJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zBUleHY/7WLUV5A6tWvyIaKgoXOKSrXghjVFxG6O4AI=;
        b=V3Tn+Xkk4DfGakTT8ceb9HQh3em3Y5xuWdJyYuk1h8Cyl4w/2NnwnStMvWctKS/bFl
         aqt1TQk8xFpxVCq0SaOnc5AssGu21TNANR6my5z49ajTWsGaEqpLxAZHIG6m3X0B0+3I
         MrNZ+k6DA+a4wJBEShIFXZHuOoOkDKJqgh0Ak7AVy27bqVTm/NyDP8xDfGlj0YaCui/J
         7/1b8/aBHQVnXtktAsHHx6gbaSYLXuqWqYVAv/bk6Z2VIzOnDkt5eEf/2RHfMtVWdJ0H
         IehusP6agQpehSFGzklxjWJazkx6gHoyz9WXbimm6uQJrEnsbANAN/vsdJH7KmK9AXRg
         G78A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WB/TB9dM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a056214202e00b0045641f7637fsi5952418qvf.105.2022.06.04.10.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jun 2022 10:43:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WB/TB9dM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxXoV-0006ct-QK
	for alex.bennee@linaro.org; Sat, 04 Jun 2022 13:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxXo9-0006cX-Bl
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 13:43:29 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:53760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxXo6-0004nu-KJ
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 13:43:28 -0400
Received: by mail-pj1-x1030.google.com with SMTP id a10so9652385pju.3
 for <qemu-arm@nongnu.org>; Sat, 04 Jun 2022 10:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zBUleHY/7WLUV5A6tWvyIaKgoXOKSrXghjVFxG6O4AI=;
 b=WB/TB9dM8QQh8060P7pP1IpZK8KCmbO9mHJUUc87k0YZlwXi9ofWPMYQKyaAJeWSuV
 1l8nOkAjLRTkgSYrVpCsjBvnMlF5aNuUlWBM/fRdF0D9bp+tftooNzdYL4W3JrS3ZkE0
 qUFiZ+o8lJtNoZ85bUTSGca6IjcC98c4FlZxZQ1PeoCMjyY4xutRqukLgJmbAoow95F/
 1cY/1MU8+t4HwEQ0PE0tYxnEZroxa0za/AEDLL6YekD2CCxdZbOm2Ie8nrp8AruJpp+i
 U4y469YYlTycyAjZh8t/VbPMORi1gByxtW6qBqfr8XIdwShpPpaSo+7FQQhdBG3u4Vjw
 i0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zBUleHY/7WLUV5A6tWvyIaKgoXOKSrXghjVFxG6O4AI=;
 b=uOYNZXexJ+TSuH3sHTrVVK4TeOzVVu2UQaXe4FS/PKsENbQAUjtpjL1wPOXnREZ6XL
 tfSgzvq3DrZQxbi6BRgXXcl87piVPKew+3/hjfTz0XzR3OeIJiKAhSlcy6LxHtIDVALp
 xTMDFMkqaYcsS4wrIKFtD50vV7mQUP2rBCZ2/7xITN8M7dw4hjFagugYaUJLiImxpV4h
 yXROVUpF0mAzdlk9rYEGQ5GK+74DIuvJmuzrbBAF9vQrSa+BbmTYQTMnUSZB6BbcJwjm
 Tny9uHdBrdxHOhKLFtR+AqcFzVI2B0OoadxxkaqU2p3jUIJJIIOmzs37N/Co1qddB4WK
 G5lw==
X-Gm-Message-State: AOAM532bSdTknpSiAQKDxXfF06wJxuRbeQ5K9GOgfE/4d/0OtBfiilOh
 D0ks+HtwHn/4xaQRntGhpBueEA==
X-Received: by 2002:a17:902:a502:b0:151:8289:b19 with SMTP id
 s2-20020a170902a50200b0015182890b19mr15648804plq.149.1654364603845; 
 Sat, 04 Jun 2022 10:43:23 -0700 (PDT)
Received: from [192.168.0.4] (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a17090a590100b001e33e264fd6sm7032108pji.40.2022.06.04.10.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jun 2022 10:43:22 -0700 (PDT)
Message-ID: <44db7bb4-b1d3-ef2f-44fb-b8198c724d5c@linaro.org>
Date: Sat, 4 Jun 2022 10:43:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/28] target/arm: Move stage_1_mmu_idx decl to internals.h
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220604040607.269301-1-richard.henderson@linaro.org>
 <20220604040607.269301-2-richard.henderson@linaro.org>
 <c1295e83-88e1-7530-6965-f7385b908a83@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c1295e83-88e1-7530-6965-f7385b908a83@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y480308+b2np

On 6/4/22 03:40, Philippe Mathieu-Daudé wrote:
> On 4/6/22 06:05, Richard Henderson wrote:
>> Move the decl from ptw.h to internals.h.  Provide an inline
>> version for user-only, just as we do for arm_stage1_mmu_idx.
>> Move an endif down to make the definition in helper.c be
>> system only.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/internals.h | 5 +++++
>>   target/arm/helper.c    | 5 ++---
>>   2 files changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/arm/internals.h b/target/arm/internals.h
>> index b654bee468..72b6af5559 100644
>> --- a/target/arm/internals.h
>> +++ b/target/arm/internals.h
>> @@ -979,11 +979,16 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env);
>>    * Return the ARMMMUIdx for the stage1 traversal for the current regime.
>>    */
>>   #ifdef CONFIG_USER_ONLY
>> +static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
>> +{
> 
> Should we assert(mmu_idx == ARMMMUIdx_Stage1_E0)?

You mean ARMMMUIdx_EL10_0, the stage2 idx, but no, I don't think that's useful considering 
the ifdef.


r~

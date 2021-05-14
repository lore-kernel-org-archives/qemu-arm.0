Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp665908lfg;
        Fri, 14 May 2021 11:17:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFsh8W623Cn2OZPuMJFAvib8QsLpZ3w1fc8FXTtaqING0bLPxRUUQbCc2ZItPa9VXq8602
X-Received: by 2002:a05:6638:344e:: with SMTP id q14mr18889785jav.47.1621016259742;
        Fri, 14 May 2021 11:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621016259; cv=none;
        d=google.com; s=arc-20160816;
        b=gjAA4q+FVPTYfZrXTkLxLYiEm1OC+Sc14XLfl23OrMpS0s7kGzzppO+e5zTAbDtxM1
         TfgRaj1tMLKtV9eRNLSJ4TvhoIMsP6msfcSCLuUDaQvj5C8JuMWvrMhwZOcF+s/2lh/m
         F+v+8nuU1xTWbLdmKt2D1Zstfcs1gfuin/hCl/NFSPXTsXElW0lOo5XVrB/i2f2TMZQq
         i8SbnajaS1REnGAj06GMppwF9JUncgLm5tW560gzTgpCUsNIB/g+TVesvd3m4PvKIxlT
         mGLSccjxgY1D1Ea8YMF04hYpWd9L5DG6joBNBAKAZ8eJS9I4EHMlcpxk1yC71RLpZBE+
         Mdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2G9ozxiaHjuL/P9CIVlVxN+jeKlbvhkAToG1ruCubp8=;
        b=XaQOaqAgAUg8f/aUrs8VL8wq2ZU8uEbzaZZ8GeUrM6ITQ5lbhocyemzEiawjjZr2r3
         b35wSKvEze6z3Wns9vdOKVdQITCdH6io+UNk/pZJqcfOgIz7DPy/DLcZTf/+xeCR78fD
         fEleAyYA1MVf409cFi7JEbYCViUfyrtaOZBJ2SPSP/r3NA2BUMNBpUkk0S2+/PMu0O1H
         Vc7i6zcIPWNTt2Iy/SzeYSMrWog0hjj8TqzVXJRun0jOg8RXtoxHoLm+up9fF1ONrvm/
         I26yOvVakavuGvV2tYv6ShmYHpD374i3qmJj9WKzTEO17HpkwmWQwiH94fwwDvMemD1y
         C3LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wen5WOLW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si5065jan.21.2021.05.14.11.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 May 2021 11:17:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wen5WOLW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhcNW-0002Lu-B5
	for alex.bennee@linaro.org; Fri, 14 May 2021 14:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhcNJ-0002Le-Tq
 for qemu-arm@nongnu.org; Fri, 14 May 2021 14:17:25 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:37720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhcNI-0003lS-By
 for qemu-arm@nongnu.org; Fri, 14 May 2021 14:17:25 -0400
Received: by mail-qk1-x736.google.com with SMTP id i67so29576021qkc.4
 for <qemu-arm@nongnu.org>; Fri, 14 May 2021 11:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2G9ozxiaHjuL/P9CIVlVxN+jeKlbvhkAToG1ruCubp8=;
 b=wen5WOLWkU55w7v71vsyKfnyYCaNUB3GXFhCSGEUWwZD1exCDrD66HAdKf11MddduK
 abhkOtwv6YOlSn43eBMdL27gOGib84ojnI/2HM2+eehC0zWZ5SNFV6qajMumI8AITqnV
 PUizmYNk0pxqBylMRW8t+VCG2kprSrWYrvWGqCJeFkxDRCJ81i1SLgp2zbd4DL6gp8ky
 PvlJA28iQuAe7VpzgCi01Wg4IQZGWQJ5wfJch3vCKPt6zIRfgOVAl+p9lOScRkOrvHt/
 34LnbhSL2756Q2uIOuH1RZk3RfcdP1uXYK1pJXJ2ktbAJV1J52C4BbGDLnoea0rbjToS
 fzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2G9ozxiaHjuL/P9CIVlVxN+jeKlbvhkAToG1ruCubp8=;
 b=ZDWANvPL6BOa7PbizTwNwdfUNPiVm1rS7KYgAVyjXR8pum1IOXiW6DWMRPOse7R+Oa
 4TKFniN96sPRYxu9I59vWkFbSfBKkO7dKJfg/SW0puqQBc9Jyy73uDJ21IIBjLVpQ/PF
 X1xUP66TBJosAM8pDtgqtR3RDVzbvkcqRmwdKIb0PE3rcyxsbijIhbu0YO4cHeXEfmKU
 mkajlJgICFEH8Mo+sz2XYx4FmVWU8hImrKNv+CoKBwYiT/DWN6wE1bdOIm+0BH0BFAaI
 fOIMWPKYMM/Zq08JSE48MNZJZI1dltWSVDy9IK//KfAwTE5tCSrBazUaP9jf8jLLu/sH
 jkfA==
X-Gm-Message-State: AOAM531ceRShBTvKKgtJ75R60yLsXvti8rA2Vw7SqK8E25paVvO7pvKv
 yuBUWTHK/WlwRVPzax5ctcfbJ0DcFasrYwcd
X-Received: by 2002:a37:b784:: with SMTP id
 h126mr46051962qkf.402.1621016243025; 
 Fri, 14 May 2021 11:17:23 -0700 (PDT)
Received: from [192.168.183.76] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id 7sm5254305qkd.20.2021.05.14.11.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 11:17:22 -0700 (PDT)
Subject: Re: [PATCH v6 55/82] target/arm: Implement SVE2 saturating
 multiply-add (indexed)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-56-richard.henderson@linaro.org>
 <CAFEAcA8SrNTpUCzJtx0ejEjFcURk43BJ+8Sa3XvqNSAuQCPjLw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2584e0f-18ce-8d83-718a-2a1f6c019da7@linaro.org>
Date: Fri, 14 May 2021 13:17:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8SrNTpUCzJtx0ejEjFcURk43BJ+8Sa3XvqNSAuQCPjLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kaet9eziZ6pJ

On 5/13/21 7:42 AM, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 22:07, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/helper-sve.h    |  9 +++++++++
>>   target/arm/sve.decode      | 18 ++++++++++++++++++
>>   target/arm/sve_helper.c    | 30 ++++++++++++++++++++++++++++++
>>   target/arm/translate-sve.c | 32 ++++++++++++++++++++++++--------
>>   4 files changed, 81 insertions(+), 8 deletions(-)
>>
>> +#define DO_ZZXW(NAME, TYPEW, TYPEN, HW, HN, OP) \
>> +void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
>> +{                                                                         \
>> +    intptr_t i, j, oprsz = simd_oprsz(desc);                              \
>> +    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);   \
>> +    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 1, 3) * sizeof(TYPEN); \
>> +    for (i = 0; i < oprsz; i += 16) {                                     \
>> +        TYPEW mm = *(TYPEN *)(vm + i + idx);                              \
> 
> Doesn't this need an H macro ?

Yep.


r~

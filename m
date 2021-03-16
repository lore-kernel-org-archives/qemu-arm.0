Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4928395lfg;
        Tue, 16 Mar 2021 14:14:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwBwkIXxKSDA1IOVK8SYMp2BqDI84uXhnfBQea6Mqajyp0oP8UjOJ2qxoEF+Ww8ME7CpYl
X-Received: by 2002:a25:286:: with SMTP id 128mr1178472ybc.449.1615929248211;
        Tue, 16 Mar 2021 14:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615929248; cv=none;
        d=google.com; s=arc-20160816;
        b=YIfv+bMflRb4Uoyh8eSXsOJbZm+F7OBMVihshrWV7UtmroXN3qUca++XaZj8Espbtm
         TnoYvsmjPEQss5ZnpsFPKOOaAdgovJxzUOq2FaDG+hmv+wwKxP4+rubunyFEh1bruTRS
         Q0ThDPGnhsxwBP9MZFtTJ5CxIYXB1nDDdFgf7CIkoRJjKvJ0RPvd21uoPjdgCiqfVl+k
         EPmNDGDvedZ/SrPkr2Ls+srn+1P3OAiCbKdbYlMSMlqO8PlpgWajkzQnQ2LxvaZaI6Xr
         nHrsAyBuvZnzQWfJ2IgPZ93WRPDqiI1KOZlHKDl+t71v2WlKQ0jQSqUUmvuF785U4QFQ
         9HNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tHqILMUBcKh9wPHZJkYv7qq6cy8jUMWX09mVHQXr//4=;
        b=0J/LE1LPokQeVaSTHc3baQJJ5IkJYwSfMVX5hEb+ELLNxj24DkshIEiQCB92wkG2m6
         YFQhfN1Fla12myZUDrDI0agEvSAnWVpi//xVfRHH21tGJqQ+gAOE1l5eT3qVNBt4whNf
         SX/oxTr1lSVkE/rKf55eocFqjbAjXfV+x3wHMsqOVsG3Zon5bg+4vr0DCQ7MI0Sz7arK
         Rub8ehxW2Pieo5KT4ZZBPI4gvpnkg1noYK054LXc1Sfh9l9Abc0WjP+k+nZUw6KVNq8/
         kN1sxFKIxqlThKx6V1n1mLg9vKAIACYlM5N4e3sbwFTjVAzmeOe6l4L0FoD9nbXoZXTh
         9nRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=VFBfpmaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e191si17706848ybb.2.2021.03.16.14.14.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 14:14:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=VFBfpmaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMH0x-00043b-If
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 17:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMH0p-00043M-Fo
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 17:13:59 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMH0n-0002dZ-QR
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 17:13:59 -0400
Received: by mail-pl1-x634.google.com with SMTP id u18so17539191plc.12
 for <qemu-arm@nongnu.org>; Tue, 16 Mar 2021 14:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tHqILMUBcKh9wPHZJkYv7qq6cy8jUMWX09mVHQXr//4=;
 b=VFBfpmaB1t1NWM430DZuhGwkYJWWuuxSrIys7H9DZjJVPWJtgq5UreYyvIq8luTIkR
 T1cQ4wB/p+fUoZqa+t2dznS95YnG252Lcm83Xu+Xtd5IZEQGOefF47lnY1RAEEdKeM6d
 lm9jVtPYSNK2Wj4p5t6IVIj/IBZNQ/taMre4QZvrjAvOGX+/0qhPG14wbXYfl7WvLVlB
 Idt4hFmOu0Y5cP3ag0fZ2CjpIE0SGVAluyk5udW/2RGZfLF8m97Drl5DbiVKQPtnotCy
 VUoNxf3ynXL0bxkDyVeOZYDquBnfaLCB87ShuojEtrlWqF4BXsXIe70VZzyoLNiViHcM
 4wPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tHqILMUBcKh9wPHZJkYv7qq6cy8jUMWX09mVHQXr//4=;
 b=dcRG2XT7C1yW1ag3MO7dSLXEvdV9stpclfdYjlWk3Jj4jmf1XaCr3MjnT67EId307c
 nRFAl4UwEwtVqBhJP6VK24vPdCDFaNAfdXJ8Gb3nbRkHnylmpyXw76TNSkiOZzLkCimv
 9puc4K4O5pGZyW0a7oB6m+JvcpUyRBCL7b0gZSx7rNjhqiEIstqLX+i963ksYedPjHAg
 iN5wPRMTfnK9rs6h2bV1my6f38Kikfnz5svLmaUiKMZdY3lsyk9PkGtFmt0g0zb8P79D
 h/rftgqHRbgnIHNfabu03a5xn+LMDb/hU/bFLBxUoi9K5VqupoRGjWd1vLgF6Of5j5Tn
 ywQw==
X-Gm-Message-State: AOAM531AnUBHOqd23nzvGCp9v5ZvN1AFI8tOc4bdM7U8vw/Vazitv4hR
 RwsuF+agUkiXt0eG+lWp2ay3tQ==
X-Received: by 2002:a17:90a:be07:: with SMTP id a7mr954033pjs.75.1615929236141; 
 Tue, 16 Mar 2021 14:13:56 -0700 (PDT)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id f2sm268005pju.46.2021.03.16.14.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 14:13:55 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210316154910.25804-1-rebecca@nuviainc.com>
 <20210316154910.25804-2-rebecca@nuviainc.com>
 <8124cf7a-1634-7232-465a-172aeec47d07@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <1e127c1f-7ff7-1f8c-a245-a85bfa3693bd@nuviainc.com>
Date: Tue, 16 Mar 2021 15:13:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8124cf7a-1634-7232-465a-172aeec47d07@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=rebecca@nuviainc.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jRjnuCEaCzyg

On 3/16/21 12:09 PM, Richard Henderson wrote:
> On 3/16/21 9:49 AM, Rebecca Cran wrote:
>> +    for (page = addr; page < (addr + length); page += 
>> TARGET_PAGE_SIZE) {
> 
> This test means that it's impossible to flush the last page of the 
> address space (addr + length == 0).  I think better to do
> 
>    for (l = 0; l < length; l += TARGET_PAGE_SIZE)
>        page = addr + l;
>        ...
> 
>> +        for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
>> +            if ((idxmap >> mmu_idx) & 1) {
>> +                tlb_flush_page_bits_locked(env, mmu_idx, page, bits);
> 
> Hmm.  I'm not keen on this.  You're not able to notice the special cases 
> within, where we flush the entire tlb -- and therefore you do not need 
> to continue the outer loop for this mmuidx.

Would you be happy to have tlb_flush_page_bits_locked updated to return 
a bool, indicating if an entire flush has been done?

> The cputlb changes should have remained a separate patch.

Ok, I'll split it out.

-- 
Rebecca Cran


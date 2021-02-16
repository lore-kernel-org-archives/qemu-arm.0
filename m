Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6104430lfc;
        Mon, 15 Feb 2021 18:26:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkTxOaHwWbBpdwARE3G2AHtiemYUR9BNeGgIapSW6/AfqWUWBzXHtJ6aQecwv8BLdEjKI3
X-Received: by 2002:a25:7009:: with SMTP id l9mr28643957ybc.118.1613442415703;
        Mon, 15 Feb 2021 18:26:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613442415; cv=none;
        d=google.com; s=arc-20160816;
        b=q22LFf/416YN4jVGJb5xJK/O4lg8r+QUwB/oTY/ad0GRzQ6Ay5k4UnrqVUL3JqKt8l
         457QonJpOnJj2vrxeTd406GOw4IKJQKMa9TAKNsCQGXDGc0IHZ5UwgnprCNU5uwtAp6H
         vKVmm4p54Ws0p/jdecgh+QUMm2TMyYRlPTVUV6RUZNlxPAuMGaZcu7wYnYxbR/m7f77t
         hF+5XVwQYaY+LHud3bBxFcVQuOB0sB4gZsCrNv22F1PLVAHXxmdkrDnuGlLdRxeLAq6r
         17QJj1NMIshrNJf2P0izlsy5Y7NGxrMss+Lr62y2EwmqWZFT5fWcyQfZ7IpsGYdAwNsO
         MyFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ww9zTOnQxN5wOduZ4fPjbuGe+rSzce/iLXZI9QuWjOw=;
        b=XZ/Awt140KClMr7RZR5drEZc6fkhcnWfsAJ737qDmVZ6PXTuOcd6V8i+cTGLN4zIYk
         jFEI9FE/gR62xrVtzE69ysOsTUoYkKdXjZWP7Ji2Ozq1RangNe+/huRRWrn9MWHrWOfy
         j6lcryESupCjWnOJMr38bzMFLwe58UzRt7Wyiddhvs/qcVJzIMBpSA214Rs1iXOh0GLu
         BdXi71XLDxQZIQ3HBMH0d/rUJYfAYnbiFIYmkHTSDksKEfmcTyABxViYeEkOMTHfGaqt
         eIWdCSWjjUPBjJpFBVVZgPej/k6SzKw48ppzkAKr0HOea7zuDzLUEqWUT+RsnMEBu1GQ
         UA4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=ulm8X1ah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si19585631ybp.441.2021.02.15.18.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 18:26:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=ulm8X1ah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBq4l-0004uY-3w
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 21:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBpuD-0006me-Ev
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 21:16:03 -0500
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36]:39779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBpu8-00021b-Lz
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 21:16:00 -0500
Received: by mail-oo1-xc36.google.com with SMTP id z36so1970372ooi.6
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 18:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ww9zTOnQxN5wOduZ4fPjbuGe+rSzce/iLXZI9QuWjOw=;
 b=ulm8X1ahX+ezaIvaJ9pnPtrZR55GIW7JPDlMJd4Jf/PRqO1p5RYcSXlxlAvWqWhOmV
 SVLTlEhcqQ3bPdPUB3hN1w8RpQg5Was+eWG7MS6PI8lYsneJbQcwZpdFUcIa3o06S0f4
 +V4uzBR4blnyNcgb9FOfmRfyAmEpSn9eBuJn4hKl5njAb87WVhoXesCIuF+P6sIIOSbB
 nhnwokRAIk3ZxiPyNcOMBA0HGykxOGFdLWPVluLteU62ZAF99kFP64+SKZTNn/Fn2PrH
 Kqw6NUrUSE7/hU9xuYEGg8y3qwhIaSFDyb4lOydbe/4a8KNVdMpK8+ICavD3US8+jnpX
 kVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ww9zTOnQxN5wOduZ4fPjbuGe+rSzce/iLXZI9QuWjOw=;
 b=OLNEbvN2nLdPfIIxWqkEBp74CsVAmPyywBbUZBtTAKtIX1mW3hgyZgXHOuM3qG1YGJ
 epWPICcIvz6np7EH78JuIIuO/AK/LLQbe/XWgcpWoiN57nl3sWwBQJsyInHCuEegS9Q2
 iotwkAyIxilkQxZnxti0tVUUv0Ei+037GnCCgZSNAci9n4RdZpL02BcjaE8nOzmtMRrz
 44dIS9xyzGRLHClT8kMFuBo71ZnM/QNKvbMX3LUxDPTBEndVQVaxASPmxOICzU1C+Eib
 Nsqu3cNkyGsJJrGBpBQfqIp0zLSzUQOFCrksmaICWu8kyEqOG5Azo9g+TmyK68XmLSY7
 VkGw==
X-Gm-Message-State: AOAM5330RBjyEo6zsCkt7OWfIJ65BocZstuWPTIDXJWJS/jG+5lzcTTB
 Wl/TY6o83kNQPJG+rVxx1LwAdg==
X-Received: by 2002:a4a:858c:: with SMTP id t12mr12804136ooh.20.1613441755296; 
 Mon, 15 Feb 2021 18:15:55 -0800 (PST)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id g13sm3850623otl.60.2021.02.15.18.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 18:15:54 -0800 (PST)
Subject: Re: [PATCH 1/3] target/arm: Add support for FEAT_SSBS, Speculative
 Store Bypass Safe
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210215215819.1142-1-rebecca@nuviainc.com>
 <20210215215819.1142-2-rebecca@nuviainc.com>
 <e4233ca8-72a2-5213-1832-b326db071b49@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <a66d581c-680c-63a9-08b1-59ed176c4fa2@nuviainc.com>
Date: Mon, 15 Feb 2021 19:15:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e4233ca8-72a2-5213-1832-b326db071b49@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=rebecca@nuviainc.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 0+2ov4qMXGBt

On 2/15/21 5:19 PM, Richard Henderson wrote:
> On 2/15/21 1:58 PM, Rebecca Cran wrote:
>> @@ -960,6 +960,12 @@ static void cpsr_write_from_spsr_elx(CPUARMState *env,
>>           val |= CPSR_DIT;
>>       }
>>   
>> +    /* Move SSBS to the correct location for CPSR */
>> +    if (val & PSTATE_SSBS) {
>> +        val &= ~PSTATE_SSBS;
>> +        val |= CPSR_SSBS;
>> +    }
> 
> Incorrect.  SPSR_ELx leaves this at the same position as CPSR: bit 23.

Okay, I see where I'm going wrong now - SPSR_ELx has different formats 
for exceptions taken from aarch32 and aarch64 states, which I hadn't 
fully understood. I'll fix it.

-- 
Rebecca Cran



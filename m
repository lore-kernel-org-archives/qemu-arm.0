Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp5223966lfb;
        Tue, 31 Aug 2021 10:07:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywkZVVGffzivzQy2150GFP9bohh+nzR+OPwgVEWOc/VG4J0zM7w7zYVd6BJYFeaIikMQTe
X-Received: by 2002:a1c:443:: with SMTP id 64mr5352089wme.180.1630429663530;
        Tue, 31 Aug 2021 10:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630429663; cv=none;
        d=google.com; s=arc-20160816;
        b=oMgMa6xkYGfocgnvoLkeoIISZSqsVXSt5f1tyAC3bwJPsR1kdxX9mZKFC1xTZada76
         caS6khF/c5aAzin/C6zDwwkpK04sTAwYppDQSnskAJzLi66luczGrQSDktCqSN702pPx
         k5wF3qBxzntZe/3SWtpPieOm6HhvCL9pkWt44GDO/THcswSGttJ4p6klYsmnP3TD8AbN
         zYQ3SbiElBfk/CHM4gRm5QQiIY/3n+ijffplwC22DQm+p+5PZSKuCpjvEmiPYospAIaR
         CW/KT/vNWbc0HrncMNj/P5RztkH18yNlvpc2NameU7dms4yKUnmibOm+xU5XzozZxaG/
         JoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+OfqhvwjCgB6hEE/GND78OAQI4vErCGstjkbhsx7b1w=;
        b=l16yRRwuIzPTRHhR6HagmIXZNkCOXbtTNeUSaixU03TlIym1xaXf29Ov0PTPH2D4ZA
         aws60q3NpW62F2sALjf7En/egsYqUBmMdaviW+3ZdymjowyMR63e+JWPHmbXo217gTxT
         Z8eUfHrgr8NhR/LLrd3fr0Zw41c3pVSWe/od1GkHmJG/qhGCmnxyMRljW8GaROSTaa8E
         0XLziX6DcGDdQr3OmcXgDeiQiFvnk04cMTIdv8gMIUIZsL9Y0h1C8m974rdURd+G0i/C
         88HF2QEnXqG4Gdaxp6QjXO7uSqYdJHNheYQT04EHpdSoZi/ZDYJG8jjjlbhxFohczwGI
         r/kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mvqwo9Wd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16si17644163wrx.97.2021.08.31.10.07.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 10:07:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mvqwo9Wd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mL7Ec-0004gp-KM
	for alex.bennee@linaro.org; Tue, 31 Aug 2021 13:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL70c-0002i1-6z
 for qemu-arm@nongnu.org; Tue, 31 Aug 2021 12:53:14 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL70Z-0007Vo-CP
 for qemu-arm@nongnu.org; Tue, 31 Aug 2021 12:53:13 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so2399340pje.0
 for <qemu-arm@nongnu.org>; Tue, 31 Aug 2021 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+OfqhvwjCgB6hEE/GND78OAQI4vErCGstjkbhsx7b1w=;
 b=Mvqwo9WdcXH3wiYSwvx4XhWVS77WkwlZ1W/0e2UQX40vepl2QCgTsbfCwLYGdQx0nA
 +6+QGKdt5aqz9xecWqU43TMRUgxFZbtx45i7Y2SQAsa/2dKjZKNAkWDvcku8MklfzGwv
 fgAzx/5JDq4BB/eNKlGP+JBf8okN6zEH8pNL7dik4YW0YA9io3H9JwVZZTjXMIkaJrqJ
 3xwVwFt9bvKcdWsu9gFAQOZ8/bKTT40v2iEx/Xenhb1R0xcj5ozqHN3zQlzTu3BpwK1w
 NPQoGZHaATqo6PtQbCKcyp/MMoMp/tXSO9ZyPzFt6rUKioSDZfLRHcATwYR1GhsSzoJz
 vt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+OfqhvwjCgB6hEE/GND78OAQI4vErCGstjkbhsx7b1w=;
 b=q+37/PWSz2mHBbV7ntBXoXICtFWD9J8eaCFfzVBrwO/aIl+Cc90aLHtNq01t4/ZtFH
 Z9jr6G1IQYSSYpRtSzkuzJ+D0Anl9GTaV5z201ZA9H7v9jeaxBlBX45WJSANxKvyZ0tO
 XJS5Jhxu6h/jHO9RyXcD1AlnGc0iaYZf/7BIeWaLoL/qC0cceH4lM6k11UnKihT0tsVf
 ve7++IwC07YHpvyVyxuHNerWee0sSNpb3Cj5ebnjVi/vhEqcfoyE77yuVYV4Mx8UgsSi
 vVyOBZUm+S2M3vzMELYCjUHg8TQe4QRaM2JKMzf/Z6EF2zD++vjvQlV2DxHf2xKgXcw7
 ZKJQ==
X-Gm-Message-State: AOAM533O1ATvTM8ajR5gf61S8QqBXW2KfVsE6bMwAnoyrYryCR3O1P8G
 1SYvlnPamvS8pjT2beexEjbwRHUbdbUcBQ==
X-Received: by 2002:a17:90a:da02:: with SMTP id
 e2mr6667587pjv.89.1630428788983; 
 Tue, 31 Aug 2021 09:53:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id j17sm19033563pfn.148.2021.08.31.09.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 09:53:08 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/intc/arm_gicv3_dist: Rename 64-bit accessors with
 'q' suffix
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210826180704.2131949-1-philmd@redhat.com>
 <20210826180704.2131949-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b93bf05-84e2-13d0-83f6-e8ab610dfb81@linaro.org>
Date: Tue, 31 Aug 2021 09:53:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826180704.2131949-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 43H6IVdiRair

On 8/26/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> QEMU load/store API (docs/devel/loads-stores.rst) uses the 'q'
> suffix for 64-bit accesses. Rename the current 'll' suffix to
> have the GIC dist accessors better match the rest of the codebase.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   hw/intc/arm_gicv3_dist.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

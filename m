Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp5215952lfb;
        Tue, 31 Aug 2021 09:58:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR4tURD+fqCzjnnFoPfsvA+Gy6+wnIbp2PPyXzQj5frQ62z2iuC0yAGS1Frt7Ehg9+hJNZ
X-Received: by 2002:a05:6102:dd0:: with SMTP id e16mr19280096vst.7.1630429108411;
        Tue, 31 Aug 2021 09:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630429108; cv=none;
        d=google.com; s=arc-20160816;
        b=wabI/cUqc55w1QVP74ox+aJwWeLz1pFrc02XdxNENegTDLtfj8Ye0a4GD2X+ACC3Hy
         ncBhe2pELyU8r/RvGPXKJ3gTwUt60u/tG80/3dptHuIE5tPkH4pqNP8mlzwPSzXT8OB3
         dk+QxT6GHLNn1gZp0Cky8gvS3COuk7QFlyvbXqZeqsTj1GANtrbmjXit+opq1vXDinyM
         5QThPcNunjTMxAt7xOhISOlbbWfz5AhrpQJURxwnEu/cevZ9SCBfygMMyIDzwtzE3IY5
         oMel31rUbCC+V7LIf8znXnJKOov59i63ZXcHp5j7yVwyX2ByBaj3VJ0sUNI5EKmqQHWN
         84dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bmDmUezKUmdPNliefbwTqL1cMamYNYt2leBAPAIwzQ4=;
        b=C/dKI6szA1QmPSGk7I4v98wd60EWAV/3RxFoF55W8WDhIdRxWE4Lzbyn5z9eG56pe5
         YlXSQ+teXfeXVp9jdGGqNTggm0+EYgpMP3+fP84YA7XTRkf01TcRxkroSaTzBfBvVar+
         dHFKGbjyiBP0K5/IaIyvuy/wcWYMp54rCReGjXQqaykrtmGCKUZoYmSQegf81kNAevPC
         DnbLb4yoZH62BOPNtqMf0zO1dudmwSdGJnBROiNsosL52lmFY87woJn9fO1TsSl6X9KF
         Gcq4JBoFQnhjwTLxoBxCQGN/gl4rrRULypchWHUsNy/pbLyM4E6awDnxIx/K8usTbevQ
         GJyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z8NqLKYg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p17si4870241uac.23.2021.08.31.09.58.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 09:58:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z8NqLKYg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mL75f-0002ki-Ov
	for alex.bennee@linaro.org; Tue, 31 Aug 2021 12:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL746-0000Fc-EC
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 12:56:50 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL744-00024z-Se
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 12:56:50 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so2535964pjw.2
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bmDmUezKUmdPNliefbwTqL1cMamYNYt2leBAPAIwzQ4=;
 b=z8NqLKYgOMduOd7vyioQuvwAi9sjluJZGbhrEHKreNDW02ekMS7BzCa9Qp3XYrwni6
 8m2bRwcypoNWHAGNRjiGmexJcvGrVeKVHM5Ldc1urYsSdrux0ce6P5HZukI1sns7XLB8
 ul43EQ7e3HkEf+Kxrdy2vRslOS6txn7lYSd7/P/nxWl/cpr/4kwbMIP0QXZPvaxXQThP
 mR37Wti1twVhyJzjyRsUwWqLm3r41T52TQozUAw1RUSxJoJzk3VYTPKE45U3RoePFSR/
 Mn6tUk1W+bXye3nz5gof9Xfb62O+9wbmrQFvVnilwjFPwTITxBg3eQkCOEvYPaMwLYRc
 Xctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bmDmUezKUmdPNliefbwTqL1cMamYNYt2leBAPAIwzQ4=;
 b=BG5Yai0ovJOI/fc6kRcjpjsCPV9HU/mJyVa5i0y4vuMHnSqQz+7kGatbtHLZk4F5HP
 3eMjFjsKssBMKhhcGjOk1UJlUntbYaOIgCYvOuMZ93l8Dl0vFfjnHi64YDH9fS6rYZ34
 cNLZEyjq3arCaEjSD0Djv5N5xGpgNDJO6YCBWeLuLCwx/LY28JKHwyqIMXUkgPOE2tw1
 yxr/gFaKDRfehnTlswt8NCKVlZ6Fpa3K1DE3W3/Ae2K7NAp8hjLvHca/QHapPmXkYCAb
 uDUdRUDvcPO9DY3/IWe5ARRiZLEWIZCNeiMuM8/5NlIgkHF5IQvsUfy0RpHcDbANxmj1
 T0bg==
X-Gm-Message-State: AOAM530EVWgENm8jV8l4gQ3zdqIUqkthQMjff6UgD2755WkXrMSBjP8k
 CfoKenTQSdwvICCDKbtqGQ2XAMkct8eC+g==
X-Received: by 2002:a17:90a:c984:: with SMTP id
 w4mr6759467pjt.124.1630429007062; 
 Tue, 31 Aug 2021 09:56:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id x13sm3592595pjh.30.2021.08.31.09.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 09:56:46 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/intc/arm_gicv3: Replace mis-used MEMTX_* constants
 by booleans
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210826180704.2131949-1-philmd@redhat.com>
 <20210826180704.2131949-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e764f9f5-5f7e-5a70-e5c7-135e62784959@linaro.org>
Date: Tue, 31 Aug 2021 09:56:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826180704.2131949-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: maEkpabnoKPW

On 8/26/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> Quoting Peter Maydell:
> 
>    These MEMTX_* aren't from the memory transaction API functions;
>    they're just being used by gicd_readl() and friends as a way to
>    indicate a success/failure so that the actual MemoryRegionOps
>    read/write fns like gicv3_dist_read() can log a guest error.
>    Arguably this is a bit of a misuse of the MEMTX_* constants and
>    perhaps we should have gicd_readl etc return a bool instead.
> 
> Follow his suggestion and replace the MEMTX_* constants by
> boolean values, simplifying a bit the gicv3_dist_read() /
> gicv3_dist_write() handlers.
> 
> Suggested-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   hw/intc/arm_gicv3_dist.c | 201 +++++++++++++++++++++------------------
>   1 file changed, 106 insertions(+), 95 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

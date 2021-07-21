Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp6160939lfc;
        Wed, 21 Jul 2021 15:20:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztMuZYG/QI6aHlrhykA3MRclfDKzKk0d88GtG8L/XOUlitTIlzBStAvvmFeORhs+0pfrTr
X-Received: by 2002:a25:2694:: with SMTP id m142mr47602420ybm.251.1626906036371;
        Wed, 21 Jul 2021 15:20:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626906036; cv=none;
        d=google.com; s=arc-20160816;
        b=jIpyFsRrsD6djoAvQWwxa+XeVnQjK+D16ctWV6EM0uXeg5S6B9KSJj9Fs9atQuy6+o
         7rdMTtoF5Ut1pBXNnezt4uRzWJ9+yVAcH4tCXIjwJPhFddTd81x35Zp0I8YviIbP2Xwb
         xkiljTs9qiV226iG7k2FOCjdlx03GEnaV+HuU5ffaWDL5aVSbyi0uWemFdo4PLJ7xlaZ
         AyPfnLS17MZquhtx2ZHcyWPTX466Mmdc0B30tbLvgcDd86ySMM2uHW+5wKAFVEy8R6gQ
         naamIZsKTm9vMtp04JVcrkrgJto7/95spzlSsgqtVozF9zU1hrEstxBDZGQ1/BHu+icB
         DiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sdgnkbdrgLyKqQwpzZHL2a5iqy8kYlHXjPMY38mu2p0=;
        b=Ebxyd++8aiP86SuLXa1mrq6zdSsXSvQhtq87Fe4N87tXM6rtY+PGr8EyHWmO3K7+rG
         s8pMddITWJEuOt4d9jXxBvZxmDXiS3RGTp2mFwGdfiwOcbgLXhXAb2ptRa/LhOGCjq9+
         oBS/dnWqB7ZT3Z17vfHZIhF5mdjy8YI3pqv9mXXY8VcngKec3SQ3d31RxE/qEn053nbp
         r3PqfkehXYdNjg8uVNhE27k5d/0UNpJq1awlixxfebe0P9SScdF3SUZGo0k7khJ3e6sp
         6R2aKKATDVKPr6fLS3pwaVUhpYok8tyra5EqRH32p5VR9SJp3fVwmofe437HHeXJzezT
         +VaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HxBXbjI8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x65si26541979ybc.371.2021.07.21.15.20.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jul 2021 15:20:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HxBXbjI8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6KZv-0000mD-O1
	for alex.bennee@linaro.org; Wed, 21 Jul 2021 18:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KZl-0000lw-N0
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:20:25 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:33653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KZk-0000dg-8w
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:20:25 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 gv20-20020a17090b11d4b0290173b9578f1cso1905459pjb.0
 for <qemu-arm@nongnu.org>; Wed, 21 Jul 2021 15:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sdgnkbdrgLyKqQwpzZHL2a5iqy8kYlHXjPMY38mu2p0=;
 b=HxBXbjI8o9VA/MQ9QU6oBwu17N6m4ttU/mMgJDPgCXBn8xspL4w962++YM3MvWZrc0
 4ppf6PFG1YSdKzi9rTiuCTcUheTWSkq8Gf/nrNDZwnQX8Mra1FPiZoNXQnHLbjvv42lR
 hTkk7WoG4btg7vOpLri7M9/QyoDKt89hyr6eJq+NNt3TcZAsl2aOZCtq8ySe01iKU/vQ
 nmrcHp+ZB+eyCW4tSkK47/p3OGsBREaDhZBSh7/LQLhIZMKh+BREooedbNVvM3C1pjdY
 1zJNtTrXvc/WI2WAHWOiBql0rROWMgnGR/FuS7KKhJkO71/KZmGqBQJJzVza87qWVxcm
 z5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sdgnkbdrgLyKqQwpzZHL2a5iqy8kYlHXjPMY38mu2p0=;
 b=Je1+wPryhbl7W2gyyoUvjhFvTVZfYY30Prw/OjGmd6bgrHFIw8n1/5o7nS2lRw1vjE
 2SEvK22xnqx7giCCOlbfBoZZ0uIhHBJshIafj21KEKnayJS6ojA9blQEANZdsWhrkm5P
 6F3zpmo6CY7yAyld5zhbNBXDZt+tCPqSodRpGgsA7YcBmDs6GkKAL2bnLIK/XR5a3msl
 EysK2VEkXnoptiPoyoT13euGWV7/SBEnJ5b1n3kU3P1pjEcwpPo48bLZOxzkqYjIRjDE
 KgDnzocW3o0PoS5hz0Kph0fz2aP8+9PyDl8p81iCLLkxbuzX2J0yrQn2PYfhpaOqQwIS
 qU8A==
X-Gm-Message-State: AOAM532WZEiyBAhZaxhmsL458hRggSfaJ/IglK7ISzrcjlGPsta3rsY/
 WgY+3x5ZQD1DJt5JaCh93K4htw==
X-Received: by 2002:a63:170a:: with SMTP id x10mr37252487pgl.305.1626906022161; 
 Wed, 21 Jul 2021 15:20:22 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id y35sm19954810pfa.34.2021.07.21.15.20.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:20:21 -0700 (PDT)
Subject: Re: [PATCH for-6.2 29/34] target/arm: Implement MVE VMOV to/from 2
 general-purpose registers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-30-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <14627b3f-eb25-eca8-00ac-cef31b53c279@linaro.org>
Date: Wed, 21 Jul 2021 12:20:18 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-30-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-TUID: bngU22hT0jbq

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE VMOV forms that move data between 2 general-purpose
> registers and 2 32-bit lanes in a vector register.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h |  1 +
>   target/arm/mve.decode      |  4 ++
>   target/arm/translate-mve.c | 85 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-vfp.c |  2 +-
>   4 files changed, 91 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

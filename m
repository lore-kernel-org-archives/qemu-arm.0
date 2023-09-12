Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1701843ejx;
        Mon, 11 Sep 2023 17:45:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFVTdU99u8vfJqEDmxTtfiLcHyz6qob/fu4btkD8smMcwORcO34V/EchDnvfSL3pd0nzqL
X-Received: by 2002:a05:620a:410a:b0:76f:1d46:4a9f with SMTP id j10-20020a05620a410a00b0076f1d464a9fmr14603758qko.4.1694479511392;
        Mon, 11 Sep 2023 17:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694479511; cv=none;
        d=google.com; s=arc-20160816;
        b=g6G1SlHO7rbPireLzZC9XSpRKU8/ix35Bkgpe/j0P99HLjKBeXeGk0SnZhImXs1WML
         GLJmL9Xlrg2AFxfhsPnvq7Snk/EMMPfEjMNkmQ5GbjKbZGnzg7N1becEabowUcjkiZ1l
         227lu8I7lPbyAeGYi2RIMKX60TGe9S31eijxzDdZKGv2EGKFjFCkNqAXOOlgJ20UF/Zi
         yfaecdEUvfKSMNIqgrFK4yntUKOpEGHbeGnhik7EXuzbu7kHZ00RLG0i3HQ7VKq4GcEG
         89CHNYR365RhN9fmp7g07TSOlSherdobBycu+sIDb6ac/dLCznDUiM8AJhXheCKmKbF+
         2KSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=JDj6F2QGCGRwgb3/P2Jxn6cxLh+sKtMvE8mZjIgL+DM=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=twdBCNL0Mut361lbtIQ1sgvLdVTrOlVILMYJneGDmskMDEO19CS4+QhLBMBQM8zrIM
         /BDOcOIaugaX38JY0C44LfaL/aq7a7CBaloK4MLJWFKuLc07Wuw0mj+Iep7be7PjVhSp
         8WJrUQx5iIqleKZOK461TuThekxTkLrGyZJIUXnjAkBaOHcSFUG3Mo7g/ZsFJRTW9bl/
         bIyUTfV5padd9v3WyaS8L2tFLg4H1MQ9mTp2mBkSsSA4gDOlNRVAU6Muo462tkOtwHAX
         Isx+7sHFv+3YLS3qoY8G2+1ZbpQFEmxGePSTuMpgtls3lU7t32Fguq1lAHF8zC78rSV4
         cilw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fdQZPcwz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x21-20020a05620a099500b0076f21765d39si5316078qkx.274.2023.09.11.17.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 17:45:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fdQZPcwz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfrW8-0007ID-3P; Mon, 11 Sep 2023 20:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qfrW6-0007Hd-Kb
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 20:44:34 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qfrW3-0000H2-36
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 20:44:34 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6c0b8f42409so3238220a34.0
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 17:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694479469; x=1695084269; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JDj6F2QGCGRwgb3/P2Jxn6cxLh+sKtMvE8mZjIgL+DM=;
 b=fdQZPcwzEUoiyFUkFfEM3crt0M6mKNISP/F5nzYorKAhWi9Ca5cDUnhvytg7oHjCvC
 RsS00hlGG0U8BVyF60M0Bc475NV5GVu1Q0GEeS+wk41UPDtDkrw3Wys3ji4X//wzh4xv
 IZ/BPnxu9qibz0COP3VC/pfUeV0NgEV4ax95GShQoghKLC6Aa1mh90qHOG//klt9p2Tm
 bktFSKfmj3iZG0K5ST9H/ZYPFgyIKdzgnRGfPs/wP05mh/LEipWg7tZCeYrT7DyXTvW+
 H57MfNclsHVoIDjhAJ28kn38rES8t/L0e65Pndj2sX8sQqvI7GylDkzv3FWiy/IZg4RP
 QhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694479469; x=1695084269;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JDj6F2QGCGRwgb3/P2Jxn6cxLh+sKtMvE8mZjIgL+DM=;
 b=WP3ja5RMs7rHeK1ugeFxqjyBsiymF0PEIB6/jvZYaaTo1fe9b2zHCcjU9Z4YMGN7Ma
 RLhItpSRiLqDNxHoikGCVVmUeKxZ0YJ1yAUVtpLI74jHLqINAZme/dP9KtkgC68eNku+
 5zhuOX+yHVRpWKJivS2XisambrBRdE2uVJQqrvEb19S1kayj0fhyF7uyXySJ+d/fqBFM
 PRHjqTG2lC5DWKQbR+T7EEplDq7QtTymwiz7PyAjmW+qVjFkOQmErmaUzvWIsuQxdXsf
 ZSSmyK/sEd0v/i34TIdtpcl/DSL0fvTdzdWXdawPe6KnpNssB5N5/C9O89Jw0JuSc6BM
 KsOw==
X-Gm-Message-State: AOJu0YyzaEvPLsYiELBswQiud4vpCLe6nyQ9AM+ettOb6hoLc4x9mVAh
 2nbT7tx8lb7XWRQL4JhcwNPuIw==
X-Received: by 2002:a05:6359:8086:b0:134:c279:c82a with SMTP id
 re6-20020a056359808600b00134c279c82amr8839239rwb.29.1694479469404; 
 Mon, 11 Sep 2023 17:44:29 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a639854000000b005579f12a238sm2256800pgo.86.2023.09.11.17.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 17:44:28 -0700 (PDT)
Message-ID: <818ac358-dc21-34eb-7c79-e8c254bb2f12@linaro.org>
Date: Mon, 11 Sep 2023 17:44:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 0/7] target/arm: hwcaps updates, FEAT_HBC
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230911135340.1139553-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230911135340.1139553-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DGvHjqphlpTP

On 9/11/23 06:53, Peter Maydell wrote:
> Peter Maydell (6):
>    linux-user/elfload.c: Correct SME feature names reported in cpuinfo
>    linux-user/elfload.c: Add missing arm and arm64 hwcap values
>    linux-user/elfload.c: Report previously missing arm32 hwcaps
>    target/arm: Update AArch64 ID register field definitions
>    target/arm: Update user-mode ID reg mask values
>    target/arm: Implement FEAT_HBC

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

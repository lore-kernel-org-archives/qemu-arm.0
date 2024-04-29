Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2164861ejb;
        Mon, 29 Apr 2024 05:22:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSRt4TZkTCoibPi6ncoJPXtSo+hB0UaTD7dYDBsmui1+d9uI7b1O4k7qLV3TbmFEg6xOtRfjTutLSY79grICA0svA8pkGU
X-Google-Smtp-Source: AGHT+IGfuSA30ou5KNMZxRCGASRmmkDwZbqGJpW+pf6dYG7M7MqyKodVdztMjCvLaee4sJLdrwOo
X-Received: by 2002:adf:ce06:0:b0:34c:cf95:c3d2 with SMTP id p6-20020adfce06000000b0034ccf95c3d2mr3087003wrn.57.1714393333037;
        Mon, 29 Apr 2024 05:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714393333; cv=none;
        d=google.com; s=arc-20160816;
        b=voSkwSeFasQmsoboU5Q5cLwQ22s7rGyIwUCz/MOAzn4m8Po3FrKH/R0aWWmzreyzqw
         Ls8/hjguh6wcW1fbK+/5129xnsjqODqbxiX49nKobrJk2gdP0VT09jqawhiYJIesQSOY
         2Sq4G2gLzqyhsrIa8x2kZqFkHz06RBH3yBC53QhEiAif0w6au//wsvGkrxqhYghgIMan
         O6fnKA23UY+OdF6mK+1El8EviwazmhxPNNZVy+oaTDbRVHmgQZHdk7fXWbAzKaXNmyWQ
         Lmp/odTyKB4gcE54xFEwW45vlO8h0pRNWoBWN5HT4ftYJ0W5QwnlBk/cnbmuHMENq2Db
         hLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=S8owiYBZJ9txiC/aDrnY9VxX0RMPocD/lMMvVdHKUuE=;
        fh=T1iTTsZLckiCdrIrFaSDdaCd+Lq6vHCR28gJf0SIQ+c=;
        b=O/dG4CLvVjGu/7l4d9uMVqbo4jCX0vJg6hy9bebbu3iI6eiFzGFJlvIn24yrDK3pZF
         7E6VCphPFZbLmTMgfQ3J+Lth1g/H6CZVCmT3RjoY4nf/36vt0RFntJUyejPw+F34/INo
         B/QzZqyuCTMKjXPA+z+VjFJrsS7ltbkkIkZ+2DRQ5XcDLtuknvQ3P+lAdnqqb3FwHV4e
         DOtfc0wV6NzUhA2LrC3Q/SDvoNSZWTGNxvXRWes4Vv6snKpKxRXkb5hSzSRcHmcw7Toe
         s1NAkUZul7BLx9FbmGQbp10itET41tbzv9WfyfFpvmNHJGMh7WmPkZifEbHCCZJYPMLj
         /iAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m1jlFJ5t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5-20020adfea05000000b00349f83f6f05si13361302wrm.880.2024.04.29.05.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2024 05:22:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m1jlFJ5t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1Q1H-0005I1-5J; Mon, 29 Apr 2024 08:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s1Q1E-0005GZ-Vi
 for qemu-arm@nongnu.org; Mon, 29 Apr 2024 08:22:04 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s1Q1D-0000q1-0D
 for qemu-arm@nongnu.org; Mon, 29 Apr 2024 08:22:04 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1e8f68f8e0dso30896765ad.3
 for <qemu-arm@nongnu.org>; Mon, 29 Apr 2024 05:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714393319; x=1714998119; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S8owiYBZJ9txiC/aDrnY9VxX0RMPocD/lMMvVdHKUuE=;
 b=m1jlFJ5tX6nhHrkNF9s0tf9T1QA/xhDRFq/K1/XQKUVItAkwhdedJwCwiprM9/9Ae7
 GJotXr+AM6ysvnVY31neZP95StWhifi/zhkMOnIT9P9iOpWSJuCnl41l+y1ipCxk1Y9b
 UGuJaRFS3dLUN4F9p3qSjJi7jgKhXh3aorsmN3bTsS4sSWShxU5oDR5xStSHcaaNw8PX
 UcxoDPCzgbK7Hf+f25HF6tMO2bDFifvw28FHDqLfbPAPLmrv9u0fZcT182kIZHeJoVk+
 tgy5L2ic0qtj8mBr5zAA8yJrFLUhg5u4xaCoUID8SNHKDyEZwgZVhcijOkA965v3Sw0e
 N6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714393319; x=1714998119;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S8owiYBZJ9txiC/aDrnY9VxX0RMPocD/lMMvVdHKUuE=;
 b=Dqsqcx1BN5qDE+hr5PALupSKxdY3ZKFgxUf8XvsPYPqWwxuRbQiTyIMeIVyKW4Wfdc
 SBYwA2Pn0ieC3rBkiep8hBDsfP2FsQI8rYRQsUN5GMQs2KfAaBCm4Ls2TrLGILhPDMeZ
 TZGFQe8si1FLk1kvmRrDGyjdDH/tp3lORiQbNVsbLRC7EQdTG2pUFSmn5nM8GOlu1aoc
 fZWHT9Ga0QILGS8vZiiZVuDdWyn4YaQY5R0G6htKKhHWybX3eoKcq68odvt8NKSGvOkp
 aU2/u0byqOROzMNlIznihoJdH19awexDX9vyHeeAALBaTf8UPUGA40jymaXJmqC9knjC
 yuKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWORFMLMR+jzPR1FsUxzSqLFc3eaiIN6Z2tsroni9p7tHakESdn9uYXfaRbnqZ6V4Hl+Hb3bv+BdXtYmncQ5oR+UeWX
X-Gm-Message-State: AOJu0Yzj4LQgF+75JTPrdYQUlo0JPbbnC/uXbHLdxw0k57APzrztNBoV
 FFhLxN414NHDkdkiUYq9h6zM05UBlS72pH1pUFiSWQx/EV/sJwgsfu/c9i12UYM=
X-Received: by 2002:a17:902:d4c4:b0:1ea:95f3:b0a5 with SMTP id
 o4-20020a170902d4c400b001ea95f3b0a5mr8998573plg.0.1714393318866; 
 Mon, 29 Apr 2024 05:21:58 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a170902a70300b001e83a718d87sm20253971plq.19.2024.04.29.05.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 05:21:58 -0700 (PDT)
Message-ID: <2deb6299-eca1-4611-8977-73ee2d792b5a@linaro.org>
Date: Mon, 29 Apr 2024 05:21:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] hw/arm/sbsa-ref: Enable CPU cluster on ARM sbsa
 machine
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Xiong Yining <xiongyining1480@phytium.com.cn>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com
References: <20240426073553.326946-1-xiongyining1480@phytium.com.cn>
 <20240426073553.326946-2-xiongyining1480@phytium.com.cn>
 <a25e01c0-5f6e-4568-93ec-970987eb6d07@linaro.org>
 <559cc23e-f581-4f0d-bf59-94a516d1ef56@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <559cc23e-f581-4f0d-bf59-94a516d1ef56@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: Vpl7tmyvq8ec

On 4/28/24 23:35, Marcin Juszkiewicz wrote:
> W dniu 26.04.2024 o 18:06, Richard Henderson pisze:
>>
>> Isn't this basically what MPIDR_EL1 is supposed to indicate?
>> We do not yet implement all of that in QEMU, but should.
> 
> QEMU has socket/cluster/core/thread model which could map to
> aff3/aff2/aff1/aff0 (or aff0/1/2/3) of MPIDR_EL1 register, right? But it does not.

Yes, I know, but there's patches on list that started to deal with MPIDR.SMT,

   https://lore.kernel.org/qemu-devel/20240419183135.12276-1-dorjoychy111@gmail.com/

and I suggested that we go whole hog and support all of the -smp options.


r~

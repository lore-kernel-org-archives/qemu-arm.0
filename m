Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2184843ejb;
        Wed, 21 Feb 2024 13:45:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXYWownZGvPuanDRaTZMspZVpDtNADU0dhmRoDIr5gpVho99Wkx4KaBe4Py2gRwssPCc0Kttwl6r+IzH5I7qx15vjtkO0QE
X-Google-Smtp-Source: AGHT+IF0StehBXq8ZOAIWHpMJnvbq3Jobkbj0jtqrYNBYZPovoQPpLnuUAGjLJrKyzTZDB797iTz
X-Received: by 2002:a05:620a:2159:b0:785:7387:4c0e with SMTP id m25-20020a05620a215900b0078573874c0emr20926219qkm.21.1708551912227;
        Wed, 21 Feb 2024 13:45:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708551912; cv=none;
        d=google.com; s=arc-20160816;
        b=b5LOT9KdYsl7LsCjrzcnYzBXtyMqXx4lwMfHoO2xKmWLVdwqjn9or4qrI5N87OpbJ/
         mLT0DGnZbe8jsg52TOumALIYPcEqt37uwuDLlXPoSRujWOgsafQPKxX+8U746C+s0m0z
         6vcMHKHjlV7B69kTzI80MmgB9/6qj2G7vNuCmu5DeuoZUx7Wxp2qYuaCMosOdeP01p1A
         PQasrdzDgquHMh68ZYToYgCy74MDWoA19fM81F30AIiUAN7s5rDqStqEknSgEtAMoA12
         U5PNHQzSitO+/8JkFUu46zV+g/Ubz/enkLjsishjjppk53MaAUTWupw/C65JsZf6BN7G
         2JbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=3ymlyp9LqkKgQT6kNoix2ZwRRamVl7+be284Cy/Jwu4=;
        fh=KGNcWYVz6QUlpair03KX5FYH6vw5o1PnA5Zx2qV3iEM=;
        b=qKsgRksvJr1M+gtt8aIDI9FShQgSv60KZpwrd2io7uCGKGGtPVgnLlCAemtvWJCTSF
         a3PXohm/PZtAHXlkAGijpOGSQYOUvk+LsvAvEpjCb8D2Yqo1a0CA58MFifQpW2zxK8N4
         tmRSgv2hHrfgI19NEmjyFwVCWVdn+jW2eHe9f66NZ0K8zC3Y8mH4i9Oj3kpMK0leOrb2
         0NcxxNLMxhz7kPzRYBfpnog/md2Kxs2WlRUDbFkYkvGNfZKolvQnyBFFC96Dq9Av1+0z
         BYpq3VstwPL6NjqwZaam2yqNVsedSCUQF0uKWTeYj1dSKH9QdRJyhf8tSB4m6HaOmS7I
         czBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LVENi6p9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2-20020a05620a094200b007877cdf78d0si3748638qkw.81.2024.02.21.13.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:45:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LVENi6p9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcuOF-0007WD-Q0; Wed, 21 Feb 2024 16:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcuOD-0007Vq-V9
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:44:29 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcuOC-0006bX-Il
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:44:29 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-5ce2aada130so6320565a12.1
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 13:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708551865; x=1709156665; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3ymlyp9LqkKgQT6kNoix2ZwRRamVl7+be284Cy/Jwu4=;
 b=LVENi6p9xg2VD2qd+7RZ/t5AsIA2lGmhDszbhvNDFjd4OJ305oLGonZdnkpglnqz67
 e2YlaItQMYW+ZYl/jLpwp1LZ4iMvY4mHgE4yek/fkj/I/rcWCgdN3+1hkuVXIbcOnTqf
 Q/K69NgXRcak/JtClMIE8SQjjxRm18zfSwbSFFspA9b7OBcZzI+8Q347sy2PmXlvByHQ
 qI3K/LyGv4pIRPOmh763KotumxMsciW1XylwfnI6h57Z69xKUonsi1CCUnywL2fiqAOp
 XSD1EDX5MtCiV3dlCoCG4vTsJj1m95HjxJtomA5WU5K+KVv3HAN4eTVaPRQaub/V0yh2
 aBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708551865; x=1709156665;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3ymlyp9LqkKgQT6kNoix2ZwRRamVl7+be284Cy/Jwu4=;
 b=dKfkb89xeFp/jtZcxkdRS1aQasZnts3/AXp0rXp2YnO85DRMwQCioPp86q6huLEufn
 fAYuEmnYj/j2hchXb1kPD8Q8Xe5fh9LWea5Ia2OzWzmWhTTxYAbg45fDtszsQXF4ICTm
 9PwCohqm3gPf9EahpVPCC8/FjAFwAQ3kgpZnryOpgL8F3sqZCqld7jgH3cM0q1eDrE6H
 TycCUtfWKKTJZ3J6jw7e9SkrRODX3PIgaorHuCQd3wejKOmyyDXqKHKm0RSWJ4wxZpeJ
 5x/7EqSMet6HWfChJ7Ptnb9qLL/YHocmvjxAd+n+/GwbQXlzJ0mBUMMxfAeYkh2vMG4s
 QEiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw4bEghLGZJJly3ENtIvLmd+LnqUqsxTV7VARAqT/ZeiDGVSnu8QaYKrcuyznd8yVC74KUj5MntnE1gKfCK9xqcFSx
X-Gm-Message-State: AOJu0YyfwMMpWmq0YTLApD6doLSyWg5ExvRUoKNKrJ+ow11jPxTyQwtX
 0tgYoPVDnqXUoh1MmtJLYx4ZPlv930eNyR3OtmWoVLxo/uf7bAtKHV45i0IJ7Oc=
X-Received: by 2002:a05:6a21:9216:b0:1a0:776c:f45e with SMTP id
 tl22-20020a056a21921600b001a0776cf45emr22745764pzb.4.1708551865555; 
 Wed, 21 Feb 2024 13:44:25 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 z16-20020aa791d0000000b006e0d165f8a4sm9446676pfa.20.2024.02.21.13.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 13:44:25 -0800 (PST)
Message-ID: <425d1313-a1fb-4098-8413-026c47a6ff44@linaro.org>
Date: Wed, 21 Feb 2024 11:44:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 16/22] hw/intc/arm_gicv3: Implement GICD_INMIR
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-17-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240221130823.677762-17-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: uEW8r5H3MKCk

On 2/21/24 03:08, Jinjie Ruan via wrote:
> Add GICD_INMIR0, GICD_INMIRnE register and support access GICD_INMIR0.
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
>   hw/intc/arm_gicv3_dist.c | 38 ++++++++++++++++++++++++++++++++++++++
>   hw/intc/gicv3_internal.h |  2 ++
>   2 files changed, 40 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

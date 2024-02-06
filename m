Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp2058139ejb;
        Tue, 6 Feb 2024 12:38:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFMWRwPsDxMisKRSyE+e9u30ahwmw4GYHAZ8Prz+unu9rv2UQDSzrh91ugGwfbLFMgp7Nn
X-Received: by 2002:ac8:4742:0:b0:42c:3731:e45e with SMTP id k2-20020ac84742000000b0042c3731e45emr2436076qtp.64.1707251933148;
        Tue, 06 Feb 2024 12:38:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707251933; cv=none;
        d=google.com; s=arc-20160816;
        b=lE5J7U9xTAsiXdpiprSAdG9m4dVg+zHi2dUyuEbfSBJE7d/FF7M6hhv2f+Tyir9AMr
         skLYU2yqXT8bA4iZPYmauAZ5Blf07yiQEazCtyowFuDquzYtqEc7HJ2Y/ep4VyPZWmcs
         1Xspy8wvJem7XE8YkpSjV9OlHBiE8VDvAlJZ5cIJu40Mnda2KGKjuwN8HA0Up/oXtY6V
         xH4CxkitKXmrq3ecZvpusc+Fl0JC1HdwnfK8h5iPyg2FHqVfypIykQ2fSmJrOwnPoR62
         FfAFaVaMb9T4yGKNXLdRgIjIIpw0lQXio2KgjpLt9IOA2QoI8EefWHPoV72zBj2Jp4P4
         HNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=QPZ4nDHu4Px4WR+0uxKo54dRmPzuN2VdMewUhXIXBr0=;
        fh=F+FH1wq7kV52YFnE83pJs/mQC38kkPwbqkpGTyVV6XI=;
        b=gavkf7tnduKAXDV7eiiyJZwRe782I5ty1IfZ79vh2Y/DGyq473zGPHNYwVSgc7WfF0
         ZRgJkNF5NXJi1FaOCIPo0gWzow+Wq/uJnPqOUHxKACbEh5lCveVZ0WWmOpHpq2heeBAT
         gNynUq7oUbHO/omWrT36QGL6k9gig5jSnW4UX2ZBGRcNsKlnbF48mB46ZAuusdpi8F5v
         u2YLqLNxBLsV6GOU3jpLVf2t1a56I61mnxoFshWmvI6K13mxjnGDTkTxGYYRoCJzMCGj
         V4rvSALMJhLMwt5eVRSwk6RuRsV7+5R2w0FH+B/MqnjVYv9qUiy/u2U3TAbkkfc/RfvR
         9ZSA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jQFNRU0O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCUELQcRNN2HeIIs9IVv9zW91JuIFsNi2dM8zT6/0C/UCahh9KDRFioGOgPuVXxqHd8ARURnzE6e4yOUoVHXZ/9clfm4Y1Kn
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9-20020ac857c9000000b0042c37acc03bsi1802959qta.701.2024.02.06.12.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 12:38:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jQFNRU0O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXSDI-0001fZ-9T; Tue, 06 Feb 2024 15:38:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXSDG-0001fH-FL
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 15:38:38 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXSDD-0008SI-RW
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 15:38:37 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-296c827b42dso902155a91.1
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 12:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707251914; x=1707856714; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QPZ4nDHu4Px4WR+0uxKo54dRmPzuN2VdMewUhXIXBr0=;
 b=jQFNRU0O8N9HFdAndTeUM8MN6P5kQ5vglU0pUIirVHQPklsb/ZEGE+UBQBz/jiFJB6
 lqOEs4jUMXLz4RuB4VoCr0V6btiR/ETrf1tuix52Nk2sZvCRvhjJt9EY4TpdmBcNqpzC
 kKotoMV+sIYnlqRWf5OSn5AQxZvYZ77WCJzyxE5b39QB3KB9IuBj3a1Qc3LJkPEpS4qE
 4t7nWY9WeUxIvHO8cdmP02B4A7pDBiGNRUWL5fAXXbvPM6zihHuDMZdoOlc2J/AaGYeU
 IneT/DnD3Mz6K/jhwhSN3fMjnd3TC6SQQq72cW70B7FqHgUQI+PtUVHe6hvFXwxwIPnv
 1Q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707251914; x=1707856714;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QPZ4nDHu4Px4WR+0uxKo54dRmPzuN2VdMewUhXIXBr0=;
 b=GPrU1xVCuNXat+QKvxxtKxmpCSQgwTj13P2OYUDGgQQNRg+uVft8Nj18gU5xZePU8Q
 e9I1G55ZIl65Fi62SHl7Ru1Lv9TCuTgB09aVG1hywJnH4MydfazML67js6kS0tFvtdyJ
 urgQ9cNXJCXYGh8R9vOesGkayf2Ts19Xvr2kJJFNNjCAlRY9LXsld3+ZVub8G+FO6tcb
 eLlmCw/Z0nMvHcommq+amj90vt81q6YoiUj5ZTt9K5G3UlbSwuKQOZU6zVyCM9ZJdWlI
 RGMhDB5Y9yh051IfRaxv4vEvfP3cLJrWzVZNgVVAZn9hLqD5yBWfPHGeVkr7MjQm21ML
 KzYA==
X-Gm-Message-State: AOJu0Yy1MiHGQ7r06reEH3hSWy8KQLu2A82ECfo9fT3khG9+Xem/HzyY
 gTDD68gAjVNDN4+HcmAEPw3/1KCkVoFErzMkPdNr3bklEaDSPtpgHscKFbRhvL0=
X-Received: by 2002:a17:90b:4f42:b0:296:12df:a93a with SMTP id
 pj2-20020a17090b4f4200b0029612dfa93amr643643pjb.46.1707251914053; 
 Tue, 06 Feb 2024 12:38:34 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWBIRvlNQcIfA7GhgcfXISj3HWTO+j9F/XKaBi/tBh4g9FUWyKJ8u88j8MWaajk6+27qHoJ+XpN9WzJ0V+kiiX2SG61FU3J5WTb2hJECEVRh07n8iQIMZneZmw=
Received: from [192.168.0.100] ([43.252.112.200])
 by smtp.gmail.com with ESMTPSA id
 qa7-20020a17090b4fc700b00296a7abe2aasm2199219pjb.8.2024.02.06.12.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 12:38:33 -0800 (PST)
Message-ID: <668729ae-4305-4a6d-9f95-c92fea6cfcbd@linaro.org>
Date: Wed, 7 Feb 2024 06:38:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] target/arm: The Cortex-R52 has a read-only CBAR
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240206132931.38376-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: re7gC8XcVtsh

On 2/6/24 23:29, Peter Maydell wrote:
> The Cortex-R52 implements the Configuration Base Address Register
> (CBAR), as a read-only register.  Add ARM_FEATURE_CBAR_RO to this CPU
> type, so that our implementation provides the register and the
> associated qdev property.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/cpu32.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
> index 11253051156..311d654cdce 100644
> --- a/target/arm/tcg/cpu32.c
> +++ b/target/arm/tcg/cpu32.c
> @@ -809,6 +809,7 @@ static void cortex_r52_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_PMSA);
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I just noticed that arm_cpu_post_init can be simplified to not check CBAR_RO, now that we 
have arm_cpu_propagate_feature_implications.


r~


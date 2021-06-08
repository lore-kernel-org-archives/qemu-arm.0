Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4894620lfa;
        Tue, 8 Jun 2021 16:43:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIgBS+9J776pwkEW5H9hrXmXpTn+1+tppaXqHxobV7y+FUmueEIc8vgJJV+e83J2YA1dcH
X-Received: by 2002:a25:c947:: with SMTP id z68mr14567064ybf.473.1623195810740;
        Tue, 08 Jun 2021 16:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623195810; cv=none;
        d=google.com; s=arc-20160816;
        b=cOSU0Y3PEEq/kUaZzjzyKFQdoBeQ2CiRkAg8TqFTXunxuwLeyfsRjKHp8Q3trBS32o
         iAhD8FsSsO2orVxjSz0NW06zn+S9SHwrb/iVMAGR5NryTDu1d8O3dIYw2onGu7dUsMxi
         3KqGEkLuS3JhWt4cpgL2IKZo6esGFm7vQ23Lch3dO/G87wIJoHnupCBjIQeTNE42vBpG
         41I3ZvRqgTxI03D6rynbUrqXq3BDbD8uIFyUj0UPsWvHFwGg4Y3g4y3mSywkCKrU38jV
         4alDAF4/G2T9Ldfvl0KfLDuFIfCFjh0gpHvMTaOZehE3PnbpNy2aypR0Ofux9yzMDv+O
         cZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qna+oKte/QGASPxuMLgzEJEQ2ImlDPSh97npSpCKF7w=;
        b=ggCRlQj1Im0reAIQZJGgz0nD86LnxQLnrTx+ERA2WV7t5cTQKqV7gvyN8Sq5qPsmR2
         IN4H8VEGrRe338HCjHXheglfThGlNJFZ9eqpNRPVRdWzAI8qOxBPzzpyCeowDqOlw4H+
         +mrhxCj38grQqxIfWC7K24S34VXGuAnj5IvA2Q4WEtxALyqyBDLjCVlxRM1x8kfMIioG
         2zDP9p/zLoOGNH7L/XAOWhHacFp4o+2FqzfCnQRs9jeWk6jsBX5Seo70nndb+2zkTcfC
         3WZIi/I8sE7vczdB1fKNWuz2BKaPJTJ+Ms57FTWQxAzAZyAF0DrlXWD9+JKDNxJw1eRR
         X31g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DeyOXQi5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18si17391528ybj.176.2021.06.08.16.43.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 16:43:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DeyOXQi5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqlNa-0000Z8-2x
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 19:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlNO-0000Yb-4e
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 19:43:18 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlNM-0006lY-82
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 19:43:17 -0400
Received: by mail-pl1-x635.google.com with SMTP id v13so11561888ple.9
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 16:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=qna+oKte/QGASPxuMLgzEJEQ2ImlDPSh97npSpCKF7w=;
 b=DeyOXQi5YPnr9dJoZByTJnRmweqd8Q+OJOGz6/yQaOsp3lY7Zcw3mKmqXtyD//OLpa
 hNoQ0LzR7WdtWp6W1pZXo3OVHlS5pyvjdGnoUMIS4y+ChCkR/aGf3ahZyvS0D8dN2+Ij
 Qilf/9WUFQ5M7iPZ+XC9m1qqYH5f6qnmpAwz0G8eTeOF3ahTrmC57YT1QjloD1N8/FLr
 xH3NUhLRm4BLnYb/k4iueqvzFLQuQasAwR5Fm2KTm0RUNLQko6uYCN8x5vss2STi+9mV
 /42PWBl+Pa1KkugZGzqmOKMgpCvQZFcrkcz4/b51SM0d+OhRtGLgSZj1XaniJUazhtrv
 T3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qna+oKte/QGASPxuMLgzEJEQ2ImlDPSh97npSpCKF7w=;
 b=HJx+4IEDi+8sKy37cXd9ssyyujVrg3LKWM5NljcfQRY/pqHGkEVZGkyjsXTWe0LwEG
 wn1GTbRH/t009XaTYiLJ4rRJMfDKjoMmjcp+uK2unXBD9duTgbCLYd7MFk/uTp7WQf19
 hktpImUKaXBmZ5pkRr6ExJmDtXZ7kyDEYs8hhJ266fIBchFJjZ8Dv0OrjxEfYJhkiwDu
 tCeZ1ixzsIeNtZ1JLHWZwtq3/PdG1JWe0bSLF9d6YYjTURIgPFndeFIKLZ3G8MKmi8FG
 kcjjUQDx1V9HKcLmZh4lxKuL4p6wxwGN5oaaAzEE3+7S7AtEx9jhbi1EX4yKQ82aciz/
 oShQ==
X-Gm-Message-State: AOAM530B7FCRLNzudmEYJvjmRBLf3ts2jaX4L3OKD+X399UgtIBWgPgO
 zHbscZ406Ug12g8yh4lhEXN3mg==
X-Received: by 2002:a17:902:e5cd:b029:112:7879:4e6d with SMTP id
 u13-20020a170902e5cdb029011278794e6dmr2222419plf.58.1623195794859; 
 Tue, 08 Jun 2021 16:43:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h12sm12057967pfq.72.2021.06.08.16.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:43:14 -0700 (PDT)
Subject: Re: [PATCH 27/55] target/arm: Implement MVE VHADD, VHSUB
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-28-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1c67dd65-75e0-c088-fded-3e2c23b9b05d@linaro.org>
Date: Tue, 8 Jun 2021 16:43:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-28-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MOIphCB+6oSG

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement MVE VHADD and VHSUB insns, which perform an addition
> or subtraction and then halve the result.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 14 ++++++++++++++
>   target/arm/mve.decode      |  5 +++++
>   target/arm/mve_helper.c    | 25 +++++++++++++++++++++++++
>   target/arm/translate-mve.c |  4 ++++
>   4 files changed, 48 insertions(+)
> 
> diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
> index bfe2057592f..7b22990c3ba 100644
> --- a/target/arm/helper-mve.h
> +++ b/target/arm/helper-mve.h
> @@ -118,3 +118,17 @@ DEF_HELPER_FLAGS_4(mve_vabdsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
>   DEF_HELPER_FLAGS_4(mve_vabdub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
>   DEF_HELPER_FLAGS_4(mve_vabduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
>   DEF_HELPER_FLAGS_4(mve_vabduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +
> +DEF_HELPER_FLAGS_4(mve_vhaddsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhaddsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhaddsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhaddub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhadduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +
> +DEF_HELPER_FLAGS_4(mve_vhsubsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhsubsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhsubsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vhsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> diff --git a/target/arm/mve.decode b/target/arm/mve.decode
> index 087d3db2a31..241d1c44c19 100644
> --- a/target/arm/mve.decode
> +++ b/target/arm/mve.decode
> @@ -96,6 +96,11 @@ VMIN_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
>   VABD_S           111 0 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
>   VABD_U           111 1 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
>   
> +VHADD_S          111 0 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
> +VHADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
> +VHSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
> +VHSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
> +
>   # Vector miscellaneous
>   
>   VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
> diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
> index f026a9969d6..5982f6bf5eb 100644
> --- a/target/arm/mve_helper.c
> +++ b/target/arm/mve_helper.c
> @@ -415,3 +415,28 @@ DO_2OP_U(vminu, DO_MIN)
>   
>   DO_2OP_S(vabds, DO_ABD)
>   DO_2OP_U(vabdu, DO_ABD)
> +
> +static inline uint32_t do_vhadd_u(uint32_t n, uint32_t m)
> +{
> +    return ((uint64_t)n + m) >> 1;
> +}
> +
> +static inline int32_t do_vhadd_s(int32_t n, int32_t m)
> +{
> +    return ((int64_t)n + m) >> 1;
> +}
> +
> +static inline uint32_t do_vhsub_u(uint32_t n, uint32_t m)
> +{
> +    return ((uint64_t)n - m) >> 1;
> +}
> +
> +static inline int32_t do_vhsub_s(int32_t n, int32_t m)
> +{
> +    return ((int64_t)n - m) >> 1;
> +}

Use 64-bit inputs and you don't need to replicate these for signed/unsigned. 
But either way,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

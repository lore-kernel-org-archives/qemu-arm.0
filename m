Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp1932944ejb;
        Thu, 7 Dec 2023 14:13:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2k87++Iu09+stpc2XnSZ2HBwRYB53G4vR/rdYtPCOJCDJWb5vyzRG52EQV8RO1+hvX3ow
X-Received: by 2002:a0c:c205:0:b0:67a:a721:781d with SMTP id l5-20020a0cc205000000b0067aa721781dmr3483867qvh.66.1701987188853;
        Thu, 07 Dec 2023 14:13:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701987188; cv=none;
        d=google.com; s=arc-20160816;
        b=z5Jrrcqy0GET3/iucBrHurUh6dIRHSwdaadL1y5idPO1lf2NDpb3WjVqaIv7CEX4vU
         dKhmebSbc3j/eCopJWR2ivWKGfgLtDHv4Mvw0qNqSviSwlq+IuL1rkSCi1w+wRdtfORO
         FxGpmlhbBsi96msP4MrB9L6qYq4opQzCXWyOwieZt6XZSecH2v+tF1RJgCwvszNT2AjB
         01V9VaihNNEVds9X6G5oVtykpvemZsIT6aTd1aiE3+kb0jQdBPkkH/96HlE+5YhqJDgI
         PXLrFN8vy9PCgI/Gy//f/L/MKMil2bfq3/5TJenLYlbwF+/ryDwDrK+ohA2KghjdhlGT
         Ym2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zuMK2+osl+g3rcJ34pnrTBegkSKiuBMFAEJDZTsdcsc=;
        fh=84KY1J7FJJGslRkG7yjQRx+I8Qn8QbTjdaXSfOowZRU=;
        b=RAb4r2o6X9kalAf5VoNC9wU9yk6aKZTVqWBLfobAGygfOz0VaF/TqLij25i5e5l676
         pb8Q+qOvO0IvQJaP61mbZGC8ZAaSeenPFcVmqRTVH7eo+5WXTtXo/XPV4QvbeA421gPK
         J/zXh4JDX2+K3nM+r1czhtnLQGPbsk8ERmM2VcPIdcdOYajTZKUQPL+zhTzL3L1pmJbF
         vO3MrkqgJ/NZGij0Ic5QJT0/6+5Nck4Heqjf6NLTgZhRW2rY9sNx5oCoQCHqEgAbG0P5
         E4xwpL9dCUqaAqpI5Fice8tezy3mzHfAgdkUpEe7AHnqLLsyj+1D2EFIO1qr0N+ZRcuF
         x5Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GjBPkPpb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dl13-20020ad44e0d000000b0067a9e1a97basi705999qvb.381.2023.12.07.14.13.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 14:13:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GjBPkPpb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBMc1-00012e-NJ; Thu, 07 Dec 2023 17:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rBMc0-00012T-QN
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 17:12:52 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rBMbz-0005PF-81
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 17:12:52 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1f03d9ad89fso863879fac.1
 for <qemu-arm@nongnu.org>; Thu, 07 Dec 2023 14:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701987170; x=1702591970; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zuMK2+osl+g3rcJ34pnrTBegkSKiuBMFAEJDZTsdcsc=;
 b=GjBPkPpbjH0OTwU5oAtQ+YEmtxqp/vT7zf9GOBhX9IkKDjGc3vqY+2BZxlcIU5iN9g
 66Es0leQt3XMDeRHpn9yp9h0Em7UAFTVBGSzI2c6PIwT2mgQtD2uz7d8UR63G0lIrrKg
 zB7LgNRe17Lzr1DTht+USwbuBf80+pWJtKDMhNHWXMTCg4aEcSY+tdwKjhch969pFt0U
 wSputkA3K+XfxiEe1SI1G3u7erP0784VTZVFPJSJvZTWb3K91ewlbIkJgXJmp2tu/B8W
 6J4gB16fjSf+mTbhrMb6kuUOLYSu3NUbyB5nUfBqJcGCdKW5hI3w5Gep/vfEhay10SIY
 KzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701987170; x=1702591970;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zuMK2+osl+g3rcJ34pnrTBegkSKiuBMFAEJDZTsdcsc=;
 b=v+LOvzurxOeLts3kCyRGyN+3xd8WtnNvCW8Er0ipTM5bu0cR78MGvXMBtx+khDBMO1
 9eP6swSn882H6AN5jCiYIqoRMYO6z59QwjLMf4YRaDOIbTnqsm+5ZRTCgbVQVh/VopCg
 RFAQVABSWBwOdEMQPS5zygCpm+mGvfAVYQXIjRxuHkI0lpBkWYZJ57Z7GHArni0yKJfM
 wAE1wGVs3Ff1BUaIzBwINzwJmp830Ya/+Ggn3xRFGCUN4WKhh2jgn9vGUNgYdXnKkS+t
 H/tiUm9LLRR9l4QVxkdROge893Zdq6Us53BpcsUnRdAXi4KuR3BD/q+GgL8tag5QFvy3
 AbJA==
X-Gm-Message-State: AOJu0YzLZ47n6FS1OOLbluPCnGGwyF9Qa/jHbN3WGr7c71/TZuQSDF3F
 2YBtPDoc9bJz+PhxGPuPUTg5mg==
X-Received: by 2002:a05:6870:5b89:b0:1b0:2f63:4ff6 with SMTP id
 em9-20020a0568705b8900b001b02f634ff6mr3824228oab.1.1701987169979; 
 Thu, 07 Dec 2023 14:12:49 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a631c51000000b005b92e60cf57sm267781pgm.56.2023.12.07.14.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 14:12:49 -0800 (PST)
Message-ID: <9508bf5e-a554-468f-ba94-4d6f1a5be7bf@linaro.org>
Date: Thu, 7 Dec 2023 14:12:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] target/arm: Ensure icount is enabled when
 emulating INST_RETIRED
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20231207154550.65087-1-philmd@linaro.org>
 <20231207154550.65087-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231207154550.65087-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
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
X-TUID: mXiHkiTy3j8F

On 12/7/23 07:45, Philippe Mathieu-Daudé wrote:
> pmu_init() register its event checking the pm_event::supported()
> handler. For INST_RETIRED, the event is only registered and the
> bit enabled in the PMU Common Event Identification register when
> icount is enabled as ICOUNT_PRECISE.
> 
> Assert the pm_event::get_count() and pm_event::ns_per_count()
> handler will only be called under this icount mode.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/helper.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index adb0960bba..333fd5f4bf 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -940,11 +940,13 @@ static bool instructions_supported(CPUARMState *env)
>   
>   static uint64_t instructions_get_count(CPUARMState *env)
>   {
> +    assert(icount_enabled() == ICOUNT_PRECISE);
>       return (uint64_t)icount_get_raw();
>   }
>   
>   static int64_t instructions_ns_per(uint64_t icount)
>   {
> +    assert(icount_enabled() == ICOUNT_PRECISE);
>       return icount_to_ns((int64_t)icount);
>   }
>   #endif

I don't think an assert is required -- that's exactly what the .supported field is for. 
If you think this needs additional clarification, a comment is sufficient.


r~

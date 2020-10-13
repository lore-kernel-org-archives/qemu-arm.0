Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2279588lfa;
        Tue, 13 Oct 2020 13:06:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsH01fNUqshuaRcppkrvdNMkPd4SfNs5QKf1OJMZJrNm3UQ4tCENTTwQwx5HHxpCsENbL6
X-Received: by 2002:a25:c542:: with SMTP id v63mr2295840ybe.241.1602619600054;
        Tue, 13 Oct 2020 13:06:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602619600; cv=none;
        d=google.com; s=arc-20160816;
        b=yEBoAzGfxp0mVLW7hYn30AlGaVRGmZbTjbR/vmaHlA2j6olranD2CfjaYl+u1cBnXO
         bqon4syNrS3nW3z8fiJYG6ZFCI7UVhIp2Bq/rJG0H8pSLJYO1Wa2giLwiaW6K1MHRn6/
         cQ2Ctm2PSxfSrf5otsuMHauwGKO3mTHz4nbkjwiE0J9ajproeFS8z9a4s8kd+4oZj58A
         kAunJrsHNFXlga0yf3t2sKDdB+bf0onEA/5MyW+cEyF3wSEk4qXvORKC2uLlrK8BiNOq
         E/L8DQhEN7eYv0PWasVGBHqqE8wLjid+aVSGhjKYt3eUicqo27jZDsbMyKaDOYTLBnkS
         XThw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tFP9/oVxNxD5L14FkZIvJ7f+2CkBXItmIACKqHNyNWg=;
        b=ys8ICSbvZVlNiRCBhiN4fHtoWTQVtBIe8xMGRXLzqLW1k5q+mdQTRS1EabQ2pxI2Wc
         Ztojtb3zqJpIfLOnXLxAbbhLzTfXPqwMtW964gdAgs8Q/ipFJ7d4t7gWk0Rd3WI5gmoT
         AlX/8BfGKCH2scZEsqvyOz8QtIu+tk8cPRCkzDGGcVSIWiKoKbSYbEdKxvzASFq0SotC
         T8xC5Rofmv40Pga/q9f9O4Jh94LQPRF/2LDUMadQRc0XuPnmyC04144su4lDrnoI9oRd
         Q1Kl8mXey0kNCSj+fuffzGiK/XqYyBHYDM+OqzN0Uff8duV8NIyjevfHopXJu6NJ86cQ
         heng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HL4CNVkh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p202si848878ybc.330.2020.10.13.13.06.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 13:06:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HL4CNVkh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSQZD-0003lN-Fm
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 16:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSQZ5-0003kW-BQ
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 16:06:31 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:38832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSQZ3-0005L9-Eu
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 16:06:31 -0400
Received: by mail-pj1-x1041.google.com with SMTP id u3so34620pjr.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2020 13:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=tFP9/oVxNxD5L14FkZIvJ7f+2CkBXItmIACKqHNyNWg=;
 b=HL4CNVkhB0SywKAJa4egrbGm0lPJMAJ1hXM2gF7ltcHuCcNgCvbSa8RvJJEAWS20UJ
 ItpWlqccdQFtwW59nIwHkTcyf5JEb9wP/QrSiOJ7q+AqGl+vlmTXaic6ClE3ZH9tmOL1
 eDRpH/2w2pX1xNCLuBmwbGeONqSS6Xmd5YOTZ++WrVKyF+i+XZwHJZTAc3yX0EQPfIbF
 xbAxTFir3AKRnFbsqIvi/YahTjLSMAdokimU+496FX8yVocJyByKVnkXIyQUJ84JHSnS
 p26G7ywLQpWS5S5owHNFa2LGqzT4nGuj/E/PazDhFeb2tgWdz8/4+3S5wm7h4btMykGm
 meeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tFP9/oVxNxD5L14FkZIvJ7f+2CkBXItmIACKqHNyNWg=;
 b=U9Sgu1vNwzRNHviApoZrP+mKdft3RkdsghzNj82VQBrOmJNPDmIfe8iwJYKqEWLeZ5
 754GcMjrHTGShWbVUmp57Xj0zUfBg8+v4YDGjg3sMMaZbrSgB0sAnyMYGJvjqM79lH9o
 upmS73Ad6jP6foEB7asgi0L6AtdSbCeGenbzaalf45CLBEhK7btCmq+wLy2b6oPlcjgS
 CemZlW7/+FoWEBzUbjyvcwUL2rfyeH1SzUUJqrQI+tEPyIK7Yw/j6aQ8WaSImKqRISuO
 h1phKOgolIA6KkcrF4yZxbjjSaSJHcNfD7a6gdXquHia+Om89aKZFsOFhdBVzUInhwYf
 3axQ==
X-Gm-Message-State: AOAM5329CCTgBLPVTq69h1EpynF7RzaqNoM6smK3hpE6JNsPuwUv0b/+
 ObEhjkeWUhD8j4GF2aNRu9LZfw==
X-Received: by 2002:a17:90a:dc07:: with SMTP id i7mr25101pjv.111.1602619587570; 
 Tue, 13 Oct 2020 13:06:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id z20sm515191pfn.39.2020.10.13.13.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 13:06:26 -0700 (PDT)
Subject: Re: [PATCH 09/10] target/arm: Implement FPSCR.LTPSIZE for M-profile
 LOB extension
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201012153746.9996-1-peter.maydell@linaro.org>
 <20201012153746.9996-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbba485a-b69e-9138-5db4-d146ceec3c3a@linaro.org>
Date: Tue, 13 Oct 2020 13:06:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012153746.9996-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ehspBMT9Q0u/

On 10/12/20 8:37 AM, Peter Maydell wrote:
> @@ -198,8 +200,14 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
>          /*
>           * M profile FPSCR is RES0 for the QC, STRIDE, FZ16, LEN bits
>           * and also for the trapped-exception-handling bits IxE.
> +         * From v8.1M with the low-overhead-loop extension bits
> +         * [18:16] are used for LTPSIZE and (since we don't implement
> +         * MVE) always read as 4 and ignore writes.
>           */
>          val &= 0xf7c0009f;
> +        if (cpu_isar_feature(aa32_lob, cpu)) {
> +            val |= 4 << 16;
> +        }
>      }
>  
>      vfp_set_fpscr_to_host(env, val);
> @@ -212,9 +220,18 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
>       * (which are stored in fp_status), and the other RES0 bits
>       * in between, then we clear all of the low 16 bits.
>       */
> -    env->vfp.xregs[ARM_VFP_FPSCR] = val & 0xf7c80000;
> -    env->vfp.vec_len = (val >> 16) & 7;
> -    env->vfp.vec_stride = (val >> 20) & 3;
> +    if (cpu_isar_feature(aa32_lob, cpu)) {
> +        /*
> +         * M-profile low-overhead-loop extension: [18:16] are LTPSIZE
> +         * and we keep them in vfp.xregs[].
> +         */
> +        env->vfp.xregs[ARM_VFP_FPSCR] = val & 0xf7cf0000;
> +    } else {
> +        /* Those bits might be the old-style short vector length/stride */
> +        env->vfp.xregs[ARM_VFP_FPSCR] = val & 0xf7c80000;
> +        env->vfp.vec_len = (val >> 16) & 7;
> +        env->vfp.vec_stride = (val >> 20) & 3;
> +    }

I think these two sets of masking are confusing.
Perhaps usefully rearranged as

    if (!fp16) {
        val &= ~fz16;
    }
    vfp_set_fpscr_to_host(env, val);

    if (!m-profile) {
        vec_len = extract32(val, 16, 3);
        vec_stride = extract32(val, 20, 2);
    }
    val &= 0xf7c80000;
    if (lob) {
        val |= 4 << 16;
    }
    fpscr = val;

Which then obviates the next patch.


r~

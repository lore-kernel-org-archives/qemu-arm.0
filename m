Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3457016qtb;
        Tue, 1 Jul 2025 19:07:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgUUDspybWHniylake2BewvWtKkH1fLzwPLNKBbcO3RIsIqfrlNnRQNHWM0L1GQdiYs0kfGgCXtLDVIg==@linaro.org
X-Google-Smtp-Source: AGHT+IHWyRfU//fXTJ1c6SpxfOtbqCMLjoiBsxRxwBGb/zZykU1DtCyq0G7PKaeX5CY/jI4zkLhm
X-Received: by 2002:a05:620a:170f:b0:7d3:dbed:869b with SMTP id af79cd13be357-7d5c4797b69mr181940085a.42.1751422039471;
        Tue, 01 Jul 2025 19:07:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751422039; cv=none;
        d=google.com; s=arc-20240605;
        b=eiWwiRIyaVAdiUcp8h1zP3Ltr0tc//hkL8CkO/0ka6mjgD9DlhjBXmW/AODjlAYUsd
         +9ntfoUMF1FKKmxCQ43CRLf8qWYErFg9Q6GcOxn7rc7YFqkarAVNJHh1VZL4egKQlXld
         O3HLjUi+wKnrnBYl8CA5/V8k2ukT8huG1giPnMrSzQRZp/mMVLnPbXsDbY8srqZmAR8B
         NPiXEe9vJCSm4y0C6eAumPyhApubveWh1ZcXo76rj5RhMywhcm64pAA6dMSnuxJfjToj
         xX92ylFlLUjF62adyFcTNspNWNXCUMjptgPvyIwwS16dlGLlOEjw60QrVvuGjk9gqrJj
         aTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4yiF5IrOyxAjbvHg14hQjpBgBMge4ArYTidkU/xmVuQ=;
        fh=VmNcvBpGnZ12hYnd9vj+I9Y9X/sn86eY2dEvOtqhn80=;
        b=LaPNqTdAXGxZJWxDoCDuQaJxvo64r6ZV6IjiAy6kJZVM/7Nj4xbUHgCp5QvCEa8sBi
         UM/CwNsrWcj3V7Fbd0zsU9j2zNXWMuQ0i2TSU0pvjTFCVFmMfYNfqWuJgPNyoPfZhxHo
         vpgqOQKceUAMA1CCNVVM0c4E2Slfuk4/gHih140r03qXVbgsLbYH7PmFO2nLIm9uiSiB
         sHG705bWBiCKHFADM3kqPPs2YxdPfQcICc/5FxC5wnCserjj4X3gYU0WNJKacg+f/qKR
         05F2CQo3MxzQhJ3/QasWtGpvYc6K/ljthWtfaJdVRYI1rWZ5brp+VQceVre/fp2lh4G7
         4hlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Abtf3901;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44324c356si1212469285a.357.2025.07.01.19.07.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 19:07:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Abtf3901;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWms4-0006Bt-C9; Tue, 01 Jul 2025 22:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWms1-0006Ap-OK
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 22:06:45 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWmrz-0002v5-PD
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 22:06:45 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-407aac76036so2274534b6e.1
 for <qemu-arm@nongnu.org>; Tue, 01 Jul 2025 19:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751422002; x=1752026802; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4yiF5IrOyxAjbvHg14hQjpBgBMge4ArYTidkU/xmVuQ=;
 b=Abtf39011RQO515bmJhEW4pLNEj7RC6J1LX72ZgP9TW5LUeFL/DOnPCasHCwmS665d
 VAh1ikMbXa56qey+TWaDqHG118/p2hzVZ1I6GfuaeIHLVr5IcP+fi/MXYBDp4Mk491wX
 6FxB+rps3tsUlnf4rUPjxHs2l4EoHnfPiQ4bAzOww4dDqjfYuSYn8mUwdkJFMurtBAOJ
 63SytYNQeI1wowh0bG8+IgZ730CRnSYLubmaI8ZOe/PDnL36ZbavnYkIwr6Plng2MzHz
 Xva+OizU7Qlv61nrG4DL9Au3wH9HqlE3xzvvXR9THcZQJGMxy5PNgvEvFfkscZOYVrZF
 nhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751422002; x=1752026802;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4yiF5IrOyxAjbvHg14hQjpBgBMge4ArYTidkU/xmVuQ=;
 b=kf57HCOWMpkD7mADSW0R9aa7OgGwA9KfO82V0ytutXxGLBZoRg7Kb1A9GNLgVLourv
 d62HztUOFu+GKuCopwzqVEza81Uz3krv6YhbIyd8JJjSleHAnUH/MNhScEdD6Eego1Yu
 hwoQi/0GRV1L0Ej+aUMYiKDXQ7B8iffg977DmaNL/BKdIW8Er2p4h1Au/Gigewy1GcyL
 d9MfSi4BeqjNIi456YAr61jSaH8JJ6lP6kyzW3SZSr0PmsOPM819Ui538qk1P6W6cIIk
 bCNsNlyhP+YJ5CubU87+yY8V3HcoVxXKknYfMdVBOwb/GwOn+2CpNmt4fX4PUuSvjc9B
 bwDQ==
X-Gm-Message-State: AOJu0YzJQfxKNFOf2DmH+AMK5UbouI3hv1ePynGmERkJxxOFYi69puSq
 wdEQi55Hor00G6ZszYORYD6v5uO27GeBpjCZ9eldBpXPUK6wG3+ptnz+1abevOCI3ck=
X-Gm-Gg: ASbGnctPWNkjQuARrNZKJuP8AJHiNObY3rWNsxscRWQp78IiXIY4HAmCozgf9NCO5iN
 c1ZmECcN1kBZh1ZgupUq2+3KkvA+CZVeo0qFu1b/053Vl0SgXKi0TRaCBT5y0LBV8+PkuiHpqhI
 r2i9CFOOifWmOsYjOTn9dYZKhlXGMEOE+fPsLRbI06pxj+SO/UljMbHoTfcMcmWJJ1Ublr8H869
 JIhL8HE8519N0jpg74ZceNQhlxcjN9EMoiEmCYRW8RVHgYAtX5D1Jo+hqKFAP0GQUFFW9hQNO+e
 xrOfoRO2nCFH2+PPnQrse+WaAuRM4sOvBTR9XHISorQs6L8wYATMYcx9+ceTMq9tv5TwseV7w8P
 CQw==
X-Received: by 2002:a05:6808:6909:b0:40b:1588:e005 with SMTP id
 5614622812f47-40b8877df29mr667132b6e.10.1751422002239; 
 Tue, 01 Jul 2025 19:06:42 -0700 (PDT)
Received: from [10.25.7.201] ([187.210.107.185])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40b324050d2sm2370875b6e.32.2025.07.01.19.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 19:06:41 -0700 (PDT)
Message-ID: <0ac8967e-ce39-4820-8c60-474b702cc728@linaro.org>
Date: Tue, 1 Jul 2025 20:06:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] target/arm: Fix VLSTM/VLLDM helper load/store
 alignment checks
To: William Kosasih <kosasihwilliam4@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250701103159.62661-1-kosasihwilliam4@gmail.com>
 <20250701103159.62661-2-kosasihwilliam4@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250701103159.62661-2-kosasihwilliam4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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
X-TUID: +NXk6fkLDdNA

On 7/1/25 04:31, William Kosasih wrote:
> This patch adds alignment checks in the load operations in the VLLDM
> instruction, and in the store operations in the VLSTM instruction.
> 
> Manual alignment checks in the both helpers are retained because they
> enforce an 8-byte alignment requirement (instead of the 4-byte alignment for
> ordinary long loads/stores). References to cpu_*_data_* are still replaced
> with cpu_*_mmu(), so that the individual word accesses themselves also
> perform the standard alignment checks, in keeping with the ARM pseudocode.

So... this merely makes this function match the pseudocode, it doesn't actually fix a bug.
This description should be fixed to reflect that.

> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
> index 6614719832..251e12edf9 100644
> --- a/target/arm/tcg/m_helper.c
> +++ b/target/arm/tcg/m_helper.c
> @@ -1048,6 +1048,9 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
>       bool s = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
>       bool lspact = env->v7m.fpccr[s] & R_V7M_FPCCR_LSPACT_MASK;
>       uintptr_t ra = GETPC();
> +    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
> +    MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN,
> +                                 arm_to_core_mmu_idx(mmu_idx));
>   
>       assert(env->v7m.secure);
>   
> @@ -1073,7 +1076,7 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
>        * Note that we do not use v7m_stack_write() here, because the
>        * accesses should not set the FSR bits for stacking errors if they
>        * fail. (In pseudocode terms, they are AccType_NORMAL, not AccType_STACK
> -     * or AccType_LAZYFP). Faults in cpu_stl_data_ra() will throw exceptions
> +     * or AccType_LAZYFP). Faults in cpu_stl_mmu() will throw exceptions
>        * and longjmp out.
>        */
>       if (!(env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_LSPEN_MASK)) {
> @@ -1089,12 +1092,12 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
>               if (i >= 16) {
>                   faddr += 8; /* skip the slot for the FPSCR */
>               }
> -            cpu_stl_data_ra(env, faddr, slo, ra);
> -            cpu_stl_data_ra(env, faddr + 4, shi, ra);
> +            cpu_stl_mmu(env, faddr, slo, oi, ra);
> +            cpu_stl_mmu(env, faddr + 4, shi, oi, ra);

This is an improvement because the mmu index is resolved once, instead of within every 
call to cpu_stl_data_ra.


r~

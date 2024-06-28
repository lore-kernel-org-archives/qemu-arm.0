Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp201706njm;
        Fri, 28 Jun 2024 08:50:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjhBEZgY6+NOx5AhyQMgk8X5LrBK7ID3o3t3d+oR8xCfBf5xMgaTkVauZGoSefsdQ6oGhCkYu4gpzK3UyEKoLFcJxOP2ID
X-Google-Smtp-Source: AGHT+IGcO8KeeIbSuGjUiapZrNVjZk2Ek+an+Zq32pjboRqdAkqrfqtWVDBcrm/TVZpxDgcU4rLg
X-Received: by 2002:ac8:7d4d:0:b0:446:3b3e:6dad with SMTP id d75a77b69052e-4463b3e7558mr82119651cf.21.1719589842312;
        Fri, 28 Jun 2024 08:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719589842; cv=none;
        d=google.com; s=arc-20160816;
        b=C+z/DmEI6RdZZQsHMKuRK2SGef6VV+DaiEXdwye1mSBrWHG9inDr6YNJa0+WeUUKKW
         tX5CRf45392VbMjDSrfQlv3DAV2y2b+uDYCDMpDb5+kz41ZhRBLw6zVtFMiZl+Bk4war
         N0rSDB8DuLx2s4lIR/Zt2XbUKG2ZnzmrVOTm27F8SbCked3hiqiC+5x5nLvZgbnZNR+K
         tiJHyrnjFREOpcz9KaQAacTH/p4YnJQ8PI8ZArhJVIgh3V9NXzULuNzcPWxX1L3VVE1m
         YCaXduDIfVCVhX1EcemcC1geT5q+VJWTwsmVz9HEMlSnhmh1/jaWF21/Cgp9HlIyqWuy
         x/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=tF1N5TvFlgbPuhz7UsAWhJ0PkEpXSXYCOi0u3u9GVDA=;
        fh=TUb2atTKWJVOTM2oOP453GTZUh0vYU1D+yozWJv+3Ug=;
        b=XQDj6KLnyJdgdfXC3FSel2dWxasOEPgDLMGj62fRhDLw8hSvd0DMRYZ9yCPJr6jm4t
         SQHivvAYl8Jx5TjEFzl1/sD9H7yiY3OfKTr/dic3hvTV3jCUwWQmmCgk13aLx2B4x3zi
         ulHNWoermgAToy3pkv/4jStRvb4xnWQv3uAag3v18wKtDArHZ0kjZ66VP0DlVoKXxnv7
         OBpwcHZz+e9I6nncsoc8h41FO4fCowGMA8x0+yItNeLCBWijq6rCE5Vz24chBv94Spx2
         3ce5t0I2u17dB/1OwNs69M1h3gL2jyFyH/eVDezS633aNLpwkbD4KyA0KlxCAoqt+miU
         mmhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fq16tDlx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446514869cbsi21445211cf.292.2024.06.28.08.50.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 08:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fq16tDlx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNDrr-0007tf-Hj; Fri, 28 Jun 2024 11:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNDrk-0007o3-TM
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 11:50:26 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNDrh-0007D0-0a
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 11:50:24 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-706683e5249so559143b3a.2
 for <qemu-arm@nongnu.org>; Fri, 28 Jun 2024 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719589818; x=1720194618; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tF1N5TvFlgbPuhz7UsAWhJ0PkEpXSXYCOi0u3u9GVDA=;
 b=fq16tDlxwr3tb9Lzm9ggxtBmecIvJIWuVsNr17rr0QTG59p6L5+IkyMEN43I9107yq
 ydc0Il1y0FZjrqq0swYjjOJRO6YGxzR+dmFizWZNuudrbDxnSovxPf5chcxd2eq4NBIM
 lx52kYuEw7ad6t+IJVulF+R3L3H/bXoH6PLzkUPtDM1LusZvO7Yps6EyMFZgtlqa15eS
 XSRuebxntQYWlImwljMktnuoOK0FU7VdnmEfUhfDo+OjhfgnFBJY2XmzqAghXHzcRjzw
 G1iaA+15XNB0/I8KX7ghuf1ORyvwO5kPjUdwZzFtfHK7vsrMsGLJg+YBAP+NNjreTz0j
 aeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719589818; x=1720194618;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tF1N5TvFlgbPuhz7UsAWhJ0PkEpXSXYCOi0u3u9GVDA=;
 b=mkSeWHRMcrixglF0aFlqNUfUkKylGmim1K5Ct62GjzktuWCmqM0ArNxXm2umN77L3H
 rtMW9W3cAD8/JuLxJHL4Nq+eu/mS0oPqQMeTB0yDns5gQ+hC8Jk4f6LwLnxsggG75sIP
 xAkk4Vtl19uiMLsiKtzkrl85ML5FHaeGCflhgqFcuG5QbpEeELAk1w6TCkK4rHW069I2
 nvJUAld23YjPqowmvBGbIOXnj0SSUw2ZYD8Cvame8HdDfAot7RCyjMtMQ/OUM6fsN2eM
 bS6dZwKtf4TOgmW9uivgNVjA+8boogozm1t4Uhs7B5TXaaQYQEEXrJOKli1WuC5E0o9M
 VIaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcgX08ostnztwlF4orA42xefYg530/iaFtfLrTHKNSgD0pAm0tuHDAjhI37n2V/EkeVeUEnWrwroPnvgiSW0hhxB8v
X-Gm-Message-State: AOJu0YzcLVp7Y51VrO/jwEgfUcoxDc6pXrRqHGGsKhLKPOsx37F9Ltvt
 nX1zNztuUwfNQ3Yzxgn5PPcjErou106mlKXqrLGbQ86smFvC00lcsKrlAvA/P/ZxK2mz/w7hhfR
 9
X-Received: by 2002:a05:6a20:da82:b0:1be:bf38:7b18 with SMTP id
 adf61e73a8af0-1bebf387cabmr10347066637.60.1719589818233; 
 Fri, 28 Jun 2024 08:50:18 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1549f2esm17322235ad.164.2024.06.28.08.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 08:50:17 -0700 (PDT)
Message-ID: <9c16d849-cccf-4637-858b-e556ddf0869e@linaro.org>
Date: Fri, 28 Jun 2024 08:50:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] target/arm: Make vfp_set_fpscr() call vfp_set_{fpcr, 
 fpsr}
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240628142347.1283015-1-peter.maydell@linaro.org>
 <20240628142347.1283015-4-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240628142347.1283015-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
X-TUID: X5aznZDx9sty

On 6/28/24 07:23, Peter Maydell wrote:
> +void vfp_set_fpsr(CPUARMState *env, uint32_t val)
> +{
> +    ARMCPU *cpu = env_archcpu(env);
> +
> +    vfp_set_fpsr_to_host(env, val);
> +
> +    if (arm_feature(env, ARM_FEATURE_NEON) ||
> +        cpu_isar_feature(aa32_mve, cpu)) {
> +        /*
> +         * The bit we set within fpscr_q is arbitrary; the register as a
> +         * whole being zero/non-zero is what counts.
> +         */
> +        env->vfp.qc[0] = val & FPCR_QC;

While it's code movement, the comment is out of date.
Update s/fpscr_q/vfp.qc[]/, possibly as a follow-up.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

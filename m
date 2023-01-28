Received: by 2002:a17:906:a8d:b0:883:7228:2f81 with SMTP id y13csp7249ejf;
        Fri, 27 Jan 2023 18:36:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvwNoRB+BTDeXGXbVJgGt9bVcagBAMOSTg4lT6xR2ssDYz3rA5F6d5G9hM1L6U/ifD4dulA
X-Received: by 2002:a05:6214:3d9c:b0:534:7db9:4c2c with SMTP id om28-20020a0562143d9c00b005347db94c2cmr73123949qvb.2.1674873390867;
        Fri, 27 Jan 2023 18:36:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674873390; cv=none;
        d=google.com; s=arc-20160816;
        b=wf7rpxjaedqUY/yOpttZLrLtlMWH0/pA8H0Cuol8nYpqfOHAFmjqzP3Jh3YpQczDg1
         qTwsH2YRGNB/iRZzJnLgwXHsIVIhYPSjYTezgtqCEKfDLAr6g7rP/G0agEt/sFMPyA/p
         Z71KOWZ/13UtBdOkZacdViMC/LUeDrFQ69QRQbAV0cHLI2ygqDCtxlecKUTqNxQwgLbL
         sar6uhBtf1NG1EQUiS2bayYB6FZIT2qsrP4o8Y0zNRxAXHchDMaMBUYQZpFrFaQisJu+
         bIiM2STJXvbaZgcCpXByTSKLV5JzH1Pk7Dwx9mxje+mn29NUblprQg7Vq4VTFcFSBGIp
         Z9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=eeoUmQMLdQ1WyosW4nOBrLnFFdxkhZVRkIm4TQfaRF4=;
        b=RCrGIGtzF3aADA3Rh24HIlDC7MTe6WypYSyuYGffNF7qNdGyKE06W9b9agTyd2ZprC
         d8/8vrYFMg3wtzAn4Infm4u4/zSIRl/lOMdRfxpcXkZQfJaveBP+wGuy2udI8RUXSmAb
         MAJGTszFpvZAkHERuwFzVDkJr1/VQSCnHluaX14dETK7uuj3CR/5VmHKNShqfvLileFl
         qIxzRvvDx1vDDZA1GMb6Hcx6dGZoPEXtk8Q2LPZN6ZN014KrQhUQu6eHh1H+WfAP1/5o
         8LPCaUDbo+AT715rRWP8WgIW5VUd6xfuvoZooA1Gp7gb28vQ+0tcrr2llXBdaFmZAnq0
         D+dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SmUiEc3t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020a0cf48d000000b005355fe4b06bsi3406315qvm.263.2023.01.27.18.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 18:36:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SmUiEc3t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLb4m-0002Pp-0C; Fri, 27 Jan 2023 21:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLb4k-0002NT-Kx
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 21:36:18 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLb4j-0006ty-0v
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 21:36:18 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 nm12-20020a17090b19cc00b0022c2155cc0bso6381411pjb.4
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 18:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eeoUmQMLdQ1WyosW4nOBrLnFFdxkhZVRkIm4TQfaRF4=;
 b=SmUiEc3tK4EmvCxAb7wRPgbVfZpHcdOLGEijc//CqAUQC12ZgVGKldSWM00DV/eVKJ
 01T0CS6qjSTXSdhwUzFIwN4VssVqA+PzjIPZUUVHfpqQ33uNCocUjhSlL8W8eSYmC0yp
 HxZJx7v7KUGCFx/t2jUi6dpprivWvFW5OF/Tsiwjm+Mjl2CWTup+Iqfp/taxn3yyp9s6
 f7lgB7Cqi9CzqyZ6eNJJSgnXok7FDayEGS0slyZw/uoTsTW0i30zo64qFr49IsmnOwZd
 ppn+iSV2B92auezLDWtz2bsRhOjOcHqEqmCYA0cjR3xQPFsGeqdOt1pTKIngWoM7ZWWL
 i1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eeoUmQMLdQ1WyosW4nOBrLnFFdxkhZVRkIm4TQfaRF4=;
 b=r50XSBx2/OIcyLuvUIOIZFNfCjJ33p0tvdZGheDkWJ8njSqISgQuADfH+mGdaitGu5
 Om11FWxKtliT2MQl3ZJBDxICkL3GfFaCkxgwMI7MDs6JUz7AI41h+tR+HDXXsbwbYkUU
 za/c3EDwcpvdqnuvSwbn+wsveu37APTWzPrwhoPlkWYbz/cs1s1QgG3EJn+6BUnA5kcG
 8uwa6maOM2pA1micvtf9byOIfnG+xQU9KT9TLKVUqPNhI0jxuVMNG0DLidUA9gol+IBl
 BmH1mNb98b5ooJPtBV4Ty7hIp2fDXB0TW2z8F5vw6KQ46AR3oPH7nMQbiUL2OyNyi1Aa
 6KpQ==
X-Gm-Message-State: AFqh2kq58S5oOPJ8HBHWJ0C+6GZctqyj3onCpGVPtCBGmDt99oJeTPiL
 KyRJ1YQ7ZpsVWWs7m1fFlEAGZjyAeIf9PjJ6
X-Received: by 2002:a17:90b:1e4c:b0:22b:aac7:9256 with SMTP id
 pi12-20020a17090b1e4c00b0022baac79256mr31659705pjb.28.1674873374840; 
 Fri, 27 Jan 2023 18:36:14 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 q5-20020a17090a4f8500b002271b43e528sm5634847pjh.33.2023.01.27.18.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 18:36:14 -0800 (PST)
Message-ID: <c6fe258f-6670-e5b8-796a-1d5c05fa103d@linaro.org>
Date: Fri, 27 Jan 2023 16:36:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 09/23] target/arm: Implement FGT trapping infrastructure
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: g2M8NGY6WsMf

On 1/27/23 07:54, Peter Maydell wrote:
> Implement the machinery for fine-grained traps on normal sysregs.
> Any sysreg with a fine-grained trap will set the new field to
> indicate which FGT register bit it should trap on.
> 
> FGT traps only happen when an AArch64 EL2 enables them for
> an AArch64 EL1. They therefore are only relevant for AArch32
> cpregs when the cpreg can be accessed from EL0. The logic
> in access_check_cp_reg() will check this, so it is safe to
> add a .fgt marking to an ARM_CP_STATE_BOTH ARMCPRegInfo.
> 
> The DO_BIT and DO_REV_BIT macros define enum constants FGT_##bitname
> which can be used to specify the FGT bit, eg
>     .fgt = FGT_AFSR0_EL1
> (We assume that there is no bit name duplication across the FGT
> registers, for brevity's sake.)
> 
> Subsequent commits will add the .fgt fields to the relevant register
> definitions and define the FGT_nnn values for them.
> 
> Note that some of the FGT traps are for instructions that we don't
> handle via the cpregs mechanisms (mostly these are instruction traps).
> Those we will have to handle separately.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h        | 72 ++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.h           |  1 +
>   target/arm/internals.h     | 20 +++++++++++
>   target/arm/translate.h     |  2 ++
>   target/arm/helper.c        |  9 +++++
>   target/arm/op_helper.c     | 30 ++++++++++++++++
>   target/arm/translate-a64.c |  3 +-
>   target/arm/translate.c     |  2 ++
>   8 files changed, 138 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

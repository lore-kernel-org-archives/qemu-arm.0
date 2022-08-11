Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp666199ejf;
        Thu, 11 Aug 2022 10:48:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4WcbY6rywCNplFR1urJW+eNxvdezoMjIAo7Gux5zq8Wed2a/nuMbt1hCcOk76nqPnvTevo
X-Received: by 2002:a05:622a:170e:b0:31f:83c:e142 with SMTP id h14-20020a05622a170e00b0031f083ce142mr201615qtk.593.1660240134841;
        Thu, 11 Aug 2022 10:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660240134; cv=none;
        d=google.com; s=arc-20160816;
        b=ixXKN75aRMHcRqlRxT3x+0+g4Zzr7Fvnt8efQMkXNBGA20Leczd3LqP48dfw7thQU7
         7hmTwJfT1tDnj7fX78vNqvHb5j1/YOxmIS5VYkZ+O0Dk/QStnMmiUYbhWRYBcmdxtL4U
         xBkmA1FTrZI7g4m46UGkuZByMcgSH2mAL+UnD7jBx3z7fwEg3VFds9UsKsozofeF8JgU
         pSE9Rb3dc/P5dL+81/cNR+bkVOaaAcL4zMR1cDHtmES2LU+xk8/2pllMgul7U3ymL1g/
         r3EHh5HNmq1EnF3mUEAculXVE9rittLF97HqvSt8S8Wg1MRZJ2FniUtTo10JXiQvpOUs
         FLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=4Qpm+Xv45I8XtRvHofzSvfjkYBnx/KYa7+CNEfmDsXU=;
        b=0sgnQUEaoUcjFIggFsY7fGpXs3LEQk4ntwq7hX6zVabkfKSNJMHvoGRLLt/z2iETaA
         gOa4nnwX/FIcv4n2XO6+R/RcXgLE/DXamObz+n74p6Hb15OrD/WPQmDbUua4eXG6ouTa
         n8n0wa33GX5pXCFZx6eyd8ldvgE7dRiWc3wAWtIeSisxr3bdHoXN0SSLZUtL95BHZMd1
         gh1UZKkR9f9Rnsba5Yr1EWqlq7d9ON/lZ8m7bvM2RabtZygOiW2zim3gRDr5Q3VHpB6A
         6f2JuZUrL3h+L3q9ry0f09x8Ix42Zzg6tVneSKyRzA7gbAMgzPFOJ79xc43YLGrdStmQ
         cnRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R02qBr5z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8-20020ac85f48000000b00342f7a2c176si32866qta.678.2022.08.11.10.48.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:48:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R02qBr5z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMCIg-0004vb-89
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCC9-0005TE-Ji
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:42:09 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCC7-0004md-O4
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:42:09 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 202so10929468pgc.8
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 10:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=4Qpm+Xv45I8XtRvHofzSvfjkYBnx/KYa7+CNEfmDsXU=;
 b=R02qBr5zvBHW5Xb3v6f2GCd6f06jYI93CVyhNDjNBkGD9J6PfyKpEMlXg0A15h1y26
 5TQjq5Jx1zdfTMcdZWH86gbWPyrVteqSfFXDo+9Da+V3srJjJQ93TpJRk/j66Y7elZC9
 68Jiu4XySC864p9VKF6e5kOhnMZeSa5RABKQ+cHpY/ILdXKIgvtXaWNF4jgfXD2WonEm
 c6yVcP+CViLUZWKzhcsGnu62nk07f8BN9H2sKs3KCBVhzITYkD7Demm8vjO2o2/mgd10
 ZVVY+i93LQFHS6Xp6HGMkH49U3bapI6Dn/lElAM8lbVhnbHOXZ2mjMTpO1wXgW09tXEN
 80aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=4Qpm+Xv45I8XtRvHofzSvfjkYBnx/KYa7+CNEfmDsXU=;
 b=Lkh5PkAsxvF0xFXUzXUq1ZTj92OlrgvptRo7/opZS+hF7DQ1MFVBHwXr4yu09JMaqB
 gdMeItRZMki+YHjsODCMeQxqPzTEICt+DgsdeZiv8JR4NnblkwZQAzzKeByN+fRSwU4e
 qns50xAuImTDZTu5G1aApWUMfL7Qw+J2HVa4lFnJ1kQ7TLWq1W/nta9qdboyW4zbdjFF
 /udXVBASWJL31D5KbGrVgQwzfqbRhHja6n4vCTmd3QT/ejl56Ye1bd8BWg+ILrgKziSu
 xtzp/P7HfZODuSqEhsWxaItGur1traiWMZb48ODUtsOH0R3iHNEWCUgULkci/3VQ48cB
 nCDw==
X-Gm-Message-State: ACgBeo1XV1X3iuV0wogC4ttthlGgj54MeKY9rrD58JKJEQnWeBjqEDlP
 hd/p5fs5OsPHrnJ9jxqCZG19Hw==
X-Received: by 2002:a63:1502:0:b0:411:4cc0:3ec1 with SMTP id
 v2-20020a631502000000b004114cc03ec1mr131985pgl.91.1660239726030; 
 Thu, 11 Aug 2022 10:42:06 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 e18-20020aa798d2000000b0053253b63e21sm130451pfm.3.2022.08.11.10.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:42:05 -0700 (PDT)
Message-ID: <764c037f-0573-58a8-cc45-be9826f12f67@linaro.org>
Date: Thu, 11 Aug 2022 10:42:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/10] target/arm: Correct value returned by
 pmu_counter_mask()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vBOYQJNXTbHa

On 8/11/22 10:16, Peter Maydell wrote:
> pmu_counter_mask() accidentally returns a value with bits [63:32]
> set, because the expression it returns is evaluated as a signed value
> that gets sign-extended to 64 bits.  Force the whole expression to be
> evaluated with 64-bit arithmetic with ULL suffixes.
> 
> The main effect of this bug was that a guest could write to the bits
> in the high half of registers like PMCNTENSET_EL0 that are supposed
> to be RES0.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index b8fefdff675..83526166de0 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1296,7 +1296,7 @@ static inline uint32_t pmu_num_counters(CPUARMState *env)
>   /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
>   static inline uint64_t pmu_counter_mask(CPUARMState *env)
>   {
> -  return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
> +  return (1ULL << 31) | ((1ULL << pmu_num_counters(env)) - 1);
>   }
>   
>   #ifdef TARGET_AARCH64
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

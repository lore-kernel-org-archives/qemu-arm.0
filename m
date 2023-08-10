Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp402070ejc;
        Wed, 9 Aug 2023 21:11:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWpuBSWifi1popDBa47+9cW0MERCWN83vIR3IU28C7kXYGyYqQsw9qEzldxphukJ53hDwe
X-Received: by 2002:ad4:4044:0:b0:63c:fb1b:6bb0 with SMTP id r4-20020ad44044000000b0063cfb1b6bb0mr1238018qvp.52.1691640703053;
        Wed, 09 Aug 2023 21:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691640703; cv=none;
        d=google.com; s=arc-20160816;
        b=VFhXBesh1rg4uRTbO/FjhyQbc/SZ9tEPx3A4GIpBQn8smfKLpf7zFeugtikGJdSk4q
         o+ASDn15kIFkA6KREdD4ThWnrcKwNnBbxC47xAZhc/n5wLW8BU2yh/Uum8TVZ319buKF
         12pLH8YLA/9CqPiqlP+Dt6jMdlRGSwqwcSUsHd5QjuiaTNSJ9budPAlkNmOZb+94cirN
         VfeUt9DWztBi5w4zTHJtqqhP1cSrXxPnsz/L6IQdHS82Bws32450lhiSBFmkxnf0edTm
         tOmtARV2AtMRB+7OiHfTibRq0N4Npbyd7I8ftEYUTDOC1xnSNUo9Z7xq3lvHFRvycQx/
         xUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zg1JHm/9miEGOdGkVJFDsHjJYtAiCkEEYl51auw6z6w=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=aJpBixpR7goPO4NiXhVhb+/wgmWH5h/JRmmRJd7djFygCGuIjWfJ6A6ogW4unIrWDp
         XLNLYls9lqmgxW9oBZBHLd9PYeJHWTqDLpE+PwcnsLOf/PvxIzniUWDi9usscBebmalq
         xzLmUrGm6eVFT8Xy7D2LWYKIVWLR5t7T83O2uchU8lg2thLIFK5HQp/RKHi15x04MhQd
         S7oR0YShvJDFC56lZ9ZmTww4zfgpVFynpaOOCHO9U8163Avr/iXs65z44s0bFr+OT9aS
         A0F/kASSBlg9Fvyu0tbIfQZcneP3eDo2WuS6eNoBSNGD6GHf06URh545qRKhNyMApEMO
         +vUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FoBbovVB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d30-20020a0caa1e000000b0063f7e25540asi300260qvb.222.2023.08.09.21.11.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Aug 2023 21:11:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FoBbovVB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTx1E-0004Ae-5S; Thu, 10 Aug 2023 00:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTx17-0004AC-Rf
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 00:11:23 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTx15-0006l7-O7
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 00:11:21 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1bc8a2f71eeso4311675ad.0
 for <qemu-arm@nongnu.org>; Wed, 09 Aug 2023 21:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691640678; x=1692245478;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zg1JHm/9miEGOdGkVJFDsHjJYtAiCkEEYl51auw6z6w=;
 b=FoBbovVBmo/k048fr0dPFg5Yyb3izt5g1eY36p4pPJ/Al9NwYQVGmHiRVtClCgky4Q
 seM3d65xnf0SUr4ydhDMW3F3yBOHBClvwhxy7O0GveakJyFLLuE2oMvNcigJnn5zZ5VC
 V9uANQfmaa4t/KdY5OkREOkej74eyk1SSmd63Gx9QWVsFFmPHFP6vQSZKVHQFusc1lV9
 bu4zLL2HeZN1D49Fbfw6yB9ZxNcyGSObmql/E63Lln36AWVZ9/RNb8nl5j47+bVwj4F+
 Q6mBeh/bfIkyxPsnLqAkzkmrHHujQQ2rSIpvBNdmU501HoD3FldzNdd2HB1oDWC0g8+O
 RPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691640678; x=1692245478;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zg1JHm/9miEGOdGkVJFDsHjJYtAiCkEEYl51auw6z6w=;
 b=HWjB4uCJ38wLbjzEzmd054UPpviXEf/zRAd8y/994xffshNO6XK4aPW0anLQqUiU7E
 YRQI1A7gZLubvT9zr9M00yNgoM/xESnNBhtXYtsBmT9Z7BfxbOvdKQrK/xOq7+6ogDFj
 Ly8+N2nmDHodijwalJDXlj1ZHJKengGiqu+Ize84McsFKXlV8MciJWa9kthInZlKs4Df
 8JL5wvbO+cNKyG0JaQC04SgdqMFTTB49+mC6vX6bRMew/uYaWIupaYkfM39qFTQFOc/t
 xH8yFsE98vp4floa7UtssmSdqwpihECKx96uwTEVGP5DS5Z8iluxqnZVm9PTxcC9IsND
 pvQQ==
X-Gm-Message-State: AOJu0Ywo6kdzFssEbwJ6QRo2YgZOh7iP15lUkId3mJeB5DAb4S7it+3K
 SVAnKoMg53W9Ofc0rl7ngLRtUA==
X-Received: by 2002:a17:902:e5c8:b0:1b8:3590:358a with SMTP id
 u8-20020a170902e5c800b001b83590358amr1212937plf.19.1691640677571; 
 Wed, 09 Aug 2023 21:11:17 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:6bf0:9674:6ac4:f74c?
 ([2602:47:d483:7301:6bf0:9674:6ac4:f74c])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a170902c1cd00b001bba1188c8esm404557plc.271.2023.08.09.21.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 21:11:16 -0700 (PDT)
Message-ID: <9ac45ec4-3011-abb0-305e-a5c266a41100@linaro.org>
Date: Wed, 9 Aug 2023 21:11:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/5] target/arm: Implement cortex-a710
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230810023548.412310-1-richard.henderson@linaro.org>
 <20230810023548.412310-6-richard.henderson@linaro.org>
In-Reply-To: <20230810023548.412310-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: GijW1gMuHLRS

On 8/9/23 19:35, Richard Henderson wrote:
> +static const ARMCPRegInfo cortex_a710_cp_reginfo[] = {
> +    /* TODO: trapped by HCR_EL2.TIDCP */
> +    { .name = "CPUACTLR4_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 3,
> +      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "CPUECTLR2_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 5,
> +      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },

Oops, duplicate CPUECTLR2_EL1.


r~

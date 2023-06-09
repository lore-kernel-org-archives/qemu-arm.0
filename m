Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp586158ejb;
        Fri, 9 Jun 2023 12:05:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4xtOHmzworBhIiEZOZnd7RGyIPaSuctl8x0+J4HQSJyPQYT2TspG6T0/Elg5sQnUgqUiTn
X-Received: by 2002:ad4:4ee9:0:b0:626:1893:6266 with SMTP id dv9-20020ad44ee9000000b0062618936266mr3295460qvb.9.1686337520129;
        Fri, 09 Jun 2023 12:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686337520; cv=none;
        d=google.com; s=arc-20160816;
        b=fBCYnrNgSG3Ur6JikM4CZUUGdOVw7llmcgbLNoid9X+Wxa9FEL8dKYV9NYxLojvga2
         PRgnweVCPP49nhEn/M6I8q6Ig1x/2xUym73FlDLyquAZA5c4JROey0Zs3FUYZXdgpvO3
         hVP4Zc9GvUT4JFPGVciz9lt6MKXDPu8inm7QLoJusCbrHfj8Lw26H/sNaXKX2Z22B7jV
         E4a6CK5ZBVgzoL4Y96qz46F/EwaiAaEgfXT4cuXglm9huFulDcHtyBXFibESWMAW04ff
         quJc/jyrv8Tkiqf9h7AaG7qS05uRtj/t26fCuRmzryrdV6HNpo9gypJ9sqad2p/qW8v9
         dPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+C8+d0S2bw00YZMFNjh1AFwTSdqeQQ3MkDo/fZGPraw=;
        b=GLESROZIMh02auiCahQz2fzGNr4xA/LZhZIL46lrasTw4anCxk1zd6HRbIs4Uj9RXf
         tea0vIy1/M7rQ75Y9FUrCdKfbtfpW6zVVJCNwPkQ+gO0KFNxDErfPaL+QlkzBtka6j/r
         WfWmezLa5dOjkvY78b3Ze00lfR8Q3IkpsQeU00JCJJj6f/GTOUVApjb/25q7FTUFaFqi
         vS4CV4oiktw1z9BURaOUTYjkudwDjpPNGm130KXEeE85Bvhdw9Kzfmen0IoAo/ZVFwbj
         yX/KGuTEVnka9mt8IGA5ns8YxkCY6r3ex0xFHphlzo9ZahqIQb5Cwq8wfF3wujdoFgbp
         4IhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/YL2PmZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a05620a078400b0075d0f2a3753si2609587qka.464.2023.06.09.12.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 12:05:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/YL2PmZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7hPt-0002dZ-D4; Fri, 09 Jun 2023 15:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7hPp-0002cx-Vj
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 15:04:55 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7hPm-0006mb-RE
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 15:04:53 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-65131e85be4so2204376b3a.1
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 12:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686337489; x=1688929489;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+C8+d0S2bw00YZMFNjh1AFwTSdqeQQ3MkDo/fZGPraw=;
 b=Y/YL2PmZrytoNAe6ol0hXfZA0L/+J2jaszdpgBdJUWadlXlUyE2PKI+hJhNQGVgeMk
 xC5hA/EySjTKgBW2cPvBEg9hLcne9wMvuUx49uiSRNLSrS1abCVW2WjV43PIgc5U+0xQ
 VyGQdWAw/bk3ccyQFIkJZN37Kc+cOH/MTfT3qS8E69cMn8ahAPPdJA4FtRnjGtKGbQSo
 5mwX4VDr79JPO6LxjK7lIf2lDIX8xCckr5pSaXAlP4uJeEdByVwnwkAqkiQb0jLan0Jm
 kE60e0+bDXo63a24qDtNtmMh8kTaibq8aT1vtLDm5y5DGqn5QKBJFQRLgtQZTxiqWOqF
 wRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686337489; x=1688929489;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+C8+d0S2bw00YZMFNjh1AFwTSdqeQQ3MkDo/fZGPraw=;
 b=HXqyO7z4TSrvU7g2oLhTNsYJAdLc/TOdoDQGMLVkiDwlbXT3N42SryTbsRxCMltwYb
 lzDIGkE5dO3Ln30vkIuU4WDR46DnFL7QQOXr8aY6u9g39M9YXIoTXG4nBD931TZH9JTp
 J/wkgoPtbJ5VtOPYgx5nmKMJkNTJm8IlPNyLaaf9ssaKWQVWeR4ebq7h2uxkFXQU44MB
 THijUQb72ZPRW+65dIYRmI68qIp9xFUBaSDhsKnV2L8MAUqOZai/WQOTt5wto0oynYLs
 iieLaM6IaTegFKsYe0pIu4DUHzbkVhKsrprBjGnS8kHgpgiJVdlLJG1pG7lUAwYO5NGb
 +i1A==
X-Gm-Message-State: AC+VfDzqKWThxlMX54E+FM6Q7605Xn/F692Z4AW7yUoAgvUwM9OHQUWx
 64j2IA7ysd6BjgY4spk6d66e3Q==
X-Received: by 2002:a05:6a00:2d0b:b0:64f:5406:d59e with SMTP id
 fa11-20020a056a002d0b00b0064f5406d59emr2840562pfb.17.1686337489346; 
 Fri, 09 Jun 2023 12:04:49 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca?
 ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
 by smtp.gmail.com with ESMTPSA id
 v65-20020a632f44000000b00543e9e17207sm3247680pgv.30.2023.06.09.12.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 12:04:48 -0700 (PDT)
Message-ID: <0e66e8cd-7ad4-106b-ae79-9606d5b5fc4d@linaro.org>
Date: Fri, 9 Jun 2023 12:04:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 11/22] target/arm/tcg: Reduce 'helper-vfp.h.inc' inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230609104717.95555-1-philmd@linaro.org>
 <20230609104717.95555-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609104717.95555-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: UZ0Rn3wXmpAp

On 6/9/23 03:47, Philippe Mathieu-Daudé wrote:
> Instead of including helper-vfp.h.inc via helper.h which
> is included by all TCG files, restrict it to the few files
> that require it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h             | 1 -
>   target/arm/tcg/mve_helper.c     | 5 +++++
>   target/arm/tcg/sve_helper.c     | 4 ++++
>   target/arm/tcg/translate-a64.c  | 5 +++++
>   target/arm/tcg/translate-neon.c | 5 +++++
>   target/arm/tcg/translate-vfp.c  | 6 ++++++
>   target/arm/tcg/vec_helper.c     | 5 +++++
>   target/arm/vfp_helper.c         | 5 +++++
>   8 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 9d85675d17..4d1b7ec6b4 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -813,5 +813,4 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
>   #include "tcg/helper-sme.h.inc"
>   #endif
>   
> -#include "tcg/helper-vfp.h.inc"
>   #include "tcg/helper-mve.h.inc"
> diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
> index 403b345ea3..9914f45b16 100644
> --- a/target/arm/tcg/mve_helper.c
> +++ b/target/arm/tcg/mve_helper.c
> @@ -27,6 +27,11 @@
>   #include "tcg/tcg.h"
>   #include "fpu/softfloat.h"
>   
> +#define HELPER_H "tcg/helper-vfp.h.inc"
> +#include "exec/helper-proto.h.inc"
> +#include "exec/helper-gen.h.inc"
> +#undef  HELPER_H
> +

Again, none of the *_helper.c need helper-gen.h.inc, only prototypes.


r~

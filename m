Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1516390ejn;
        Fri, 28 Oct 2022 12:48:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM69LaTyW9/izi8rvN/vaCEohVItWWDgSTAeAl3IOmsAVIFuQPSQ61ZVYCdnCgv3Cicr8eGw
X-Received: by 2002:ac8:7dc4:0:b0:39c:f95f:57fe with SMTP id c4-20020ac87dc4000000b0039cf95f57femr1018804qte.612.1666986491324;
        Fri, 28 Oct 2022 12:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666986491; cv=none;
        d=google.com; s=arc-20160816;
        b=F0bXBaUwx9v+dQbI0tMCuY4Gej8bEMB73cp4PIulMlGgGgyoGokjUtqyGBdz4ahgUs
         +r+USMnPI2/TBJADEi2BIM9GloDjSDkT4lsCvIqcj7JEAbLD+JCDhYMOnVXLPvTJLJJY
         /E0CYILYSsvholC2Hh+hkBaTRPV8pEipljkbhViBGAslZ8R4qOqgX1F1KJnZnNXbxsev
         DxwuF7ZL52zcegKlPFWJ2rBqDLsRv8suRtpsbN7fqpA4WbElieUcFK0DI43+TkdpJ1MI
         ItUBBtD5vvjqOH/GnTOeczFQosAwcH2QKwjzAM/eH1uxD9pFGPiRhuFwKzaDE5/17Q4/
         P0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ostfe6AwmweUUMw4nT2jwGJ3Aco28v/A4mF+ZvUoqGM=;
        b=SQzdW6nKUDgrVuYeH4luAkwXO/s92lfFADgEx/NTdXko4M/8ehYWwuTUxdzA13Vidn
         GCHI1DL4GWU3e7dKg6bb+xQ6M+6gaGDXiKdtJzVNx7mC7RSpm4whblDVHAZdX3eeH2Wr
         fvgC5JHNP2SEIQhsm+fuwM5uJy8e2jicWwpr03Du2tlMghw8PZn3H3Y7SJt2RChLxGEW
         xUGZXDASFrREcHixnXH5jyBYSNQ1HnSZsy+53VF7WN2VvEKkiFPg6HfjuaPcx7f8aEL7
         spUqx2dxCBAnUCxYKZkIsUzDKUCwIzBAhRfXuDvXG6YG6+Ln3CIfhTr++CbTidPOur1O
         ruEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cforzJH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay43-20020a05620a17ab00b006f9ddaaedf6si3324170qkb.515.2022.10.28.12.48.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 12:48:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cforzJH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooVKT-0007RQ-SH; Fri, 28 Oct 2022 15:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVK1-0007Hs-Ou
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 15:47:24 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVJz-0007il-Ti
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 15:47:17 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 128so5716914pga.1
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 12:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ostfe6AwmweUUMw4nT2jwGJ3Aco28v/A4mF+ZvUoqGM=;
 b=cforzJH3vCdRkJVqDsXgk+tmKLMmXR3DU0TxJ/aTQFq6oZR6jE2A/E1MK0iPlYnxSS
 39q++7pfDnL+ZCvaCvQ7QM1aLN82I/1d0TcTfjedHQfU4DJWbRzklnwVvpOqAzhHoFbf
 5TStm7UiAJfi30BY2cDxleOjTGWV+oGqxAYDPlJ6d59e+f0ZyXfX20f9O/V6kVRr8dGl
 lWYZrCMLPoZTzXBhnGsrVKX50/RCqtNhBKxMiqKQ3Tck02wVRY4eRqk+hW8Ovh/4NS28
 N/lPm6e1J+Qj3OYag3tl0HscGPuMewSEC3DeZUH9Vd0dmu5rJO6H4azcnpYwp090pbQO
 wX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ostfe6AwmweUUMw4nT2jwGJ3Aco28v/A4mF+ZvUoqGM=;
 b=tmTxXVQlfwTXEzfw/pguGXROdL5wg/W6AZK78MHXzIMGSFx0ilUAsfztPqWiACzvEB
 gkHBJU1tT8aYzz7OW5k78vgsm7kFt0BkaDgWXBIh1YXWdnptrQyyCfE7eRfb9EOcf8//
 uf+xelcZQnxUQnOjdiYN0jMsZJtTz4qP9pWhZQ33shCTnBy1/DRDO7UejeXuWRQE/oRx
 KEA0Uv3hHvVb1p5VKU6qzRlE2dhUGn8wE8PpJQx9PoQDeiws3ils2Exu1jhEEgVtnuAd
 JKlNhPL0AaRurQrLyGRpOoKPMFoBMyC2VujOPbefkL0OsZ9yBa5BPp1Ls1z2rtq8//KN
 +8pA==
X-Gm-Message-State: ACrzQf0nvEeCCPwpRLlOr23Z4mRMhIZwp5bpugJfh/6XJUsh80Nq7x9E
 Qd3bkAYjXP7nsj69C2wwqqTcLg==
X-Received: by 2002:a05:6a00:1889:b0:56c:3d4f:ae14 with SMTP id
 x9-20020a056a00188900b0056c3d4fae14mr676453pfh.49.1666986434497; 
 Fri, 28 Oct 2022 12:47:14 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 67-20020a621746000000b0056c349f5c73sm3178233pfx.132.2022.10.28.12.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 12:47:13 -0700 (PDT)
Message-ID: <18dbefb6-49d9-db35-5fb7-2ed05a994b6e@linaro.org>
Date: Sat, 29 Oct 2022 06:47:09 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 7/7] target/arm: Report FEAT_EVT for TCG '-cpu max'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221028134002.730598-1-peter.maydell@linaro.org>
 <20221028134002.730598-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221028134002.730598-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OMHzCMeI5CSU

On 10/29/22 00:40, Peter Maydell wrote:
> Update the ID registers for TCG's '-cpu max' to report the
> FEAT_EVT Enhanced Virtualization Traps support.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/cpu64.c            | 1 +
>   target/arm/cpu_tcg.c          | 1 +
>   3 files changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

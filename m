Received: by 2002:a05:7022:70e:b0:5f:deda:1b87 with SMTP id 14csp190362dlh;
        Thu, 9 Mar 2023 01:49:25 -0800 (PST)
X-Google-Smtp-Source: AK7set//b6SVQQnED/aRpPsSk6Seuk1qSWnQ8BJ295ExQ3OQq2h6K/Zee3e8AMige5Vhc9HNXgxe
X-Received: by 2002:ac8:5c82:0:b0:3ba:6595:8640 with SMTP id r2-20020ac85c82000000b003ba65958640mr32689499qta.19.1678355365636;
        Thu, 09 Mar 2023 01:49:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678355365; cv=none;
        d=google.com; s=arc-20160816;
        b=l+rcqxiNBJ7wLBfVJ6OrHeJcSIVnj1d1Q+jVtdL/Q4XuAh7lO656n4ExGK7pLf/30v
         BPIs6Uw2WV3GFZff2JYdW3+FskMLAbO4hnjPtr/gJ2iodqmm+V1S/IL8ALZsYTwtLS25
         7/sDpSHymvLlYmMMpV4PuSoFSzqshjEmTuumH1VXENbN5x+DflYDeXjrwg826E9JpV+W
         6kIOmLRbC2hnIe9DRbWxmj+QWqXts8JpGVzRrrvSAudwJwXi5HbmNuQtUi6/RLhOlxJT
         QC5gh37Mot4F+cz/2DXcB3r/kv5luyx5L6CaVZJ9alzBWTT9nmQjH/1ERYPpe4RGPOq5
         sdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xqlcXvsUw9cDNEOkwiK92qm/KTc7ON8TU8lXpZr/Y+0=;
        b=HdiSDHRpYYjJ59wxulHZnGU9pVzNXeorMCg27ynQnntzNGN5f9d/BTJafcdm7+U3X6
         kROQpQhXRwyTaY7WoSqLNOFX2n31ZeAwgE0CBd4jnvGFU7PrKbdHSuoBjBaWOryuG0do
         DAfhEQEdiri2Vs6Izo593CIc3EfH1RqAPulH7aeS8O3Se+02wyzLeFODD7q3T2jXL7Ze
         qQvbpCUBf4abpu8TdSiSUohqOwl+AZz6gFOmN432FpKBy1gwZpwhRNCxdEsxFkruf23J
         pewp2X/CkIWkw6Z1L/XnTZ0WufnyWKPwWWxfSGvl1hAD7HLPLoQOFoMmZLIBI7gz4dxh
         dOjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wRwRyU3R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s21-20020ac85cd5000000b003a7f1f84cb0si14389930qta.24.2023.03.09.01.49.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Mar 2023 01:49:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wRwRyU3R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1paCtQ-0005FD-8E; Thu, 09 Mar 2023 04:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCtM-0005Ee-6T
 for qemu-arm@nongnu.org; Thu, 09 Mar 2023 04:48:56 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCtK-000283-N3
 for qemu-arm@nongnu.org; Thu, 09 Mar 2023 04:48:55 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso793470wms.5
 for <qemu-arm@nongnu.org>; Thu, 09 Mar 2023 01:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678355331;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xqlcXvsUw9cDNEOkwiK92qm/KTc7ON8TU8lXpZr/Y+0=;
 b=wRwRyU3Reuy52GtTL1auCh5MpbVPVvzet0Pe5lFGjaL21F4sI7IsUSgXuqIE7RwPpX
 CfBAadBU8FPSEC/85aggbnxJnB6GEFVk/TspEfFE/D8YUHZH4xfn6ed2t6abPWHSrhb6
 R+3sJ3y3p5ILxRt1+jRleog+vfyep4IJVnUHa+zrumpEtGdTQSNFtTk0bCZsJWCBKkd3
 o6TG9WHYW4HvqmvZgPuo7qP3PXwwQvoAHZlMuzoyGovvVtCXUhapzpTu3kD1RIOGhicp
 Yp+0+Bxr/XGXOCnFE50/WCzg99rG3spKy0nD9lEyX5rm7sgGhWb5ONPaIOTkSz6tpJ8k
 rARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678355331;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xqlcXvsUw9cDNEOkwiK92qm/KTc7ON8TU8lXpZr/Y+0=;
 b=lMHadqCaVlItYoR3N9c95NnAUDCOifrvwD2zf8biISn/eGaJeUJL1Ha7vueOhGgrja
 VrbT/AVAuK/7WK7LCNE1eFrvTGBaocDHiiGGZ3ENWHKa7KOR3dsNZBccVI+QxzGosKkj
 Bs8n8C28YQpsa8GleReZZYvj3N4ic38PUpMtPMKJRJcL5OmBK2mrsXCG+3WEUDjttexZ
 BoX08GEIk5tyU2SNxLsHHcPc6HMjMjBthK8gCeBbQciHNmuJhgKSSjYSzgwOToPa12DG
 zXJuIIDnmIUVzYOGPhbMDYnsdtQO0kxs+RkN55tFbGqmwBCEao/3EeQFX4Wy1SUFf7De
 qFpw==
X-Gm-Message-State: AO0yUKUe7P7F5+FGEEzEjJaDuQcphfAuyx2t5WHgbIuIAB8iz46En8lU
 csXpdQdqfkUQ+ckBICwb3sO7QA==
X-Received: by 2002:a05:600c:1c96:b0:3ea:f6c4:5f3d with SMTP id
 k22-20020a05600c1c9600b003eaf6c45f3dmr18406980wms.2.1678355331091; 
 Thu, 09 Mar 2023 01:48:51 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c310a00b003eb369abd92sm2294280wmo.2.2023.03.09.01.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 01:48:50 -0800 (PST)
Message-ID: <d3e78433-e7b8-2557-041e-6916c91ca459@linaro.org>
Date: Thu, 9 Mar 2023 10:48:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 05/25] target/arm: Create gen_set_rmode,
 gen_restore_rmode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cVuEl/O6Vb5o

On 7/3/23 19:34, Richard Henderson wrote:
> Split out common subroutines for handing rounding mode
> changes during translation.  Use tcg_constant_i32 and
> tcg_temp_new_i32 instead of tcg_const_i32.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-arm@nongnu.org
> ---
>   target/arm/tcg/translate.h     | 17 ++++++++++++
>   target/arm/tcg/translate-a64.c | 47 ++++++++++++++--------------------
>   target/arm/tcg/translate-sve.c |  6 ++---
>   target/arm/tcg/translate-vfp.c | 26 ++++++++-----------
>   4 files changed, 48 insertions(+), 48 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2739855ejt;
        Mon, 19 Jun 2023 03:52:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qDzqZxa++c3RC1CMtO5Iuc1qDjc2KLcyZWRWZajPpJRwp0BcHECtIOjdFx0iQ+gMfKWi4
X-Received: by 2002:ad4:5945:0:b0:625:bb19:278c with SMTP id eo5-20020ad45945000000b00625bb19278cmr10037185qvb.2.1687171949883;
        Mon, 19 Jun 2023 03:52:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687171949; cv=none;
        d=google.com; s=arc-20160816;
        b=HfmnOmfplYE2FJx5WgS5TE+SS2hm9WzyvoO3iBuO/jG+uQkLwErSYbnHU06F1DhoWz
         Rq5tMhWUYhAp3MBzsYxsdH3gnV+bmqXMltspsgA+U5y43RdIveWi2fG0TvVNP7dByh4e
         qTIeTeXZJbFwFHjtrWUuPEtqk/x1EMwBNwyK7P6Ed12m30ubGVOKYlFWc1y9s9YV+ldi
         GO/fh9pe4mb2teEHa6R5/DvQYzbY4ZIrJepN5WbRcdENDHLGmDO8rCqUVE10vVHv3Whk
         FW2vHbd0yZn3Jq1a62xSf0INV1kYO91DZciDc0gDvd0QhRDvD+hpNQb3v+LPBz1uTrwo
         KWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=C1LXp2sElNMvaZ6Gc9HvwnoN40XblXy+VlnOvjsvqLc=;
        b=txS//Ogmh55eBb+qyEakWZSaj3X5KMYJWw+9z8FrOi7u9FRyTokA8cVaR45qY3FxwT
         NqL6Uxs/dO8qUh8L5JTl64zmi57PHo7tGWu18sF7Z5UCIQIFlBWdxVLEVKuMI7aBC3a4
         rBMnlR8sOZMiUJ1kB0sdVU8KGF8dxZkjHJ/v84SEma/xBUsLUwXi3AqLrpkR3azVhS9T
         Vt7Z+gIMvxND8cQ6udO+RSKXgRA8J1+CNPSoPE+TMDigHT5QXrGWM/d/0uBPiHsMEPdj
         +gxrV7IsdhazUfOtlJ1SVUApIJY8PowM5MTv+gucNiGIHwWqz1nKKStMIy3mrA1qLLWQ
         lCtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DrT3QWkG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020ad45b8d000000b0062b6cdfa0a8si13329100qvp.56.2023.06.19.03.52.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 03:52:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DrT3QWkG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBCUH-0005FD-MV; Mon, 19 Jun 2023 06:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCUE-0005By-Ex
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 06:51:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCUC-0006AN-3H
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 06:51:54 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f90b51ab39so17516325e9.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687171910; x=1689763910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C1LXp2sElNMvaZ6Gc9HvwnoN40XblXy+VlnOvjsvqLc=;
 b=DrT3QWkG25hUg+RPjqtbbldQOqxSGqLHBOWzNP6oV8ET2Lxz66cFFgudEDnSorV21d
 PNxHwDRtcjBckdc8JvIdr5vrewwXhnSsDTV+lw25qNMKNNsTWnh4xc9Aset+7HEslaMa
 cySW6b4dHsngWAvbcOvSKB31LfCuKM2W9ihf3uLiqEkyxUQvxBKL5S6Si+CivefeeHn+
 XEuqNqrFHJqOgU3NOAmSP1EzD331QHimZrg8nv2PiI3Vly3X7snetskII7Q37TRu6VmO
 rpavZ8zn6voK67AtfiU+7a8PhQRhsUjrf/HZ+VjL/9004STMmSP9nh7jwnGw+eUQJplf
 LCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687171910; x=1689763910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C1LXp2sElNMvaZ6Gc9HvwnoN40XblXy+VlnOvjsvqLc=;
 b=RQ4FOfgQfmFnsq1YvT/WmECDW/EBShdDivwPuNlfK2Omxyu1veRKSE5iCO7cSvMJk6
 itrey0MVpYOknU9+UNfWb2/HDN9ysir3d3ttKQB3ZakYUdRXAATYLRDSKNUyLxyQuzu/
 5y2WRkYggFEaMGRQWs2FddHiaOcdQLi5V8Jmsn3wau6pQ6kr8zjC+Cp9SKLPNhorH71F
 a1M4LSEPoDWMNpcwxAPDptWBm8g/VUJCSNCIey1l4/asq/AeWOeGMWayxCpfbqwKzwsq
 /JRxMqTEOGYAT94CSu1KyRh2v4PEuOEnS5EBB9aAL4/B/H+TgW9s41qLlFjUQ/oTCEhx
 byCg==
X-Gm-Message-State: AC+VfDyeR0X7Vf9UNYdlu3HK9MIQnM+ABkhtsoMz0L8TNqeMylKAxj51
 gHViBGwdHDXgKY7k3F699KtpiQ==
X-Received: by 2002:a05:600c:2942:b0:3f8:efc5:3382 with SMTP id
 n2-20020a05600c294200b003f8efc53382mr9420977wmd.31.1687171910465; 
 Mon, 19 Jun 2023 03:51:50 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 d17-20020adffbd1000000b0030fb4b55c13sm25060305wrs.96.2023.06.19.03.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 03:51:50 -0700 (PDT)
Message-ID: <5e5edc69-665e-2fb7-0dd6-9378b4a05ff8@linaro.org>
Date: Mon, 19 Jun 2023 12:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 15/38] target/ppc: Use aesdec_ISB_ISR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230609022401.684157-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: lWmJLPWeqe4a

On 9/6/23 04:23, Richard Henderson wrote:
> This implements the VNCIPHERLAST instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/int_helper.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


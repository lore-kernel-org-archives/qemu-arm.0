Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3805203ejc;
        Tue, 29 Aug 2023 10:04:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJZH3a8eLJl9b6o0wVRIT5bf8iiXg4SGdwoyD7pPEcMgCsfPIBypwAl9QE1elmEQIPrNiv
X-Received: by 2002:a05:620a:1a90:b0:76e:f38b:e87a with SMTP id bl16-20020a05620a1a9000b0076ef38be87amr17457211qkb.48.1693328683329;
        Tue, 29 Aug 2023 10:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693328683; cv=none;
        d=google.com; s=arc-20160816;
        b=c5LPQEpD1wNOy1bz+VCkzRQ7YJabweHmL/OV0ImWWeSQkWa3O5o+0MPjZdnQGrM5qt
         aAUiWNAmMkQi1cZBdluMAYdOWaJwt6i6+DFICUjr5ivnA3HAiyAFe5kQZoZSkHdFghDK
         VlYi6Zlv+Ry1ba1L8WK66A15vzdSgR/0EUgZbZPvb+2oLR5tMIOhQtw6YMY48kIiN++r
         +Pa6dVfD5pJk/xuY+xfCRzl5G6WyyKefKY83lrNuhm6rwPLiElP6wxpoXALHnBftKS3c
         IH1kACUzmqHwX5E7wxEeENQZWsTbuyg1VaSnjQNYRP/Ufewlx/Ct+v1d3zMZuHqzyZ4S
         3nGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2C4kv/XC66CsYR3g7xIMxzmcYJIxg/OjU+sR3431jI0=;
        fh=m6ro60Caf406s+3x8XRYfXkytlG/CXnsTlMqP0udiBw=;
        b=MatGNu23hx9IcZW0kBKzo8bxq5YvzEt9U0M/WVhHxav8w3rfPiLR+meK1ILHhcv9pR
         wN8VO12cw1Axw0DhktvUmHft6ZwMt4lWMZeeUvQnX+2eEXTYWhKndF5cjGmF3QrgkdJM
         v5e/Mli0bnXXowuv5vxUlV7g1wVg3IWS3OUdanTCp82VLbIbNeaTrokQQdNIipCyDcX3
         ZLx6Rd/yZI6ho+Utk2wTx7wF12hSuGi/enYmydtkEgtQfekejvNxbJA4SAoD+S09Fpue
         zxcLs2aQSJYGcIDGUSJ/iD1ZfQYz3Ub3Soy1pIGWxvzsJO5h7CQR6kVX+PI3jrDZx6s1
         TCCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j/Rifg7M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15-20020a05620a404f00b00767cf648a19si6384031qko.443.2023.08.29.10.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 10:04:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j/Rifg7M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qb28k-0004Cb-3j; Tue, 29 Aug 2023 13:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb28X-0003o3-Aq
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 13:04:21 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb28R-0005LW-8P
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 13:04:13 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68a402c1fcdso3205878b3a.1
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 10:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693328648; x=1693933448;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2C4kv/XC66CsYR3g7xIMxzmcYJIxg/OjU+sR3431jI0=;
 b=j/Rifg7MHfMsJEEO5QhDHdvy8TJ9i8qelkXH4kru3WgMQmCg3sCQDaFqUuBcf95D2G
 1dFgcpEks+WW2vYaPHH9evU7AUmpUi1iHwMoR8vFhYIH/R+HJ607wYX1jT0fplnNFLJD
 3zrG1lyeKnY7Q/OSyA5UJ8f24G3qGbVO8geohDOZ/dK8LMX+5s5Q5d95FpZ7gBwBAaGu
 Hr0wDiSmRdUQhvmh5JcXlgnW60CEIaodwhy0qhQWDjqeufSz5ECxUIzexvAU01de+tLy
 4jABkdKLtzFcVLQbjcGbf3m/p/8Gs2DpCl+oqLsjGD8kkPC3RzuP1qQ4VQBPM7+i9gjU
 dYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693328648; x=1693933448;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2C4kv/XC66CsYR3g7xIMxzmcYJIxg/OjU+sR3431jI0=;
 b=TBQadokYNZkN17b3HB/Iwzmnhq1YiZwcqVfTzR3AVj7RHl2bF0ixg6vHHRHTkXpGh3
 NSgexoi7fv4YdUfCgGMJFf01FEJrln9K+CyX+HiCbnTBtAqIhHXs16zuAk/Lo9c7WMGk
 IMSgSei4qkidkczfyQogWjAjp80SdbRp3TS+VfbOsKaqK7F+J0If054l14+gQm0ZyhqX
 irwH/CWn6rrd3/geWwJ+1w6KwcCoeG9VGRgPuKIKUK+YtIeSm5n4/3i6G/o8nvAkGqoe
 Vo+ex7I+ugJGx9AMclnJv8zdWzRw1viSzKvRbkW0r1CSGxPKZFrRrvkRyq90Xj7W5Tx8
 MZAA==
X-Gm-Message-State: AOJu0YxITof/76HjR4qt59XzxYfbFrCgDaz0G08Du2Rx++GMGCm2octi
 bCA5cNKT2M31ibZhSm57IgMcXg==
X-Received: by 2002:a05:6a20:1596:b0:115:5ed5:34d3 with SMTP id
 h22-20020a056a20159600b001155ed534d3mr28107554pzj.20.1693328648611; 
 Tue, 29 Aug 2023 10:04:08 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a62e711000000b00682b299b6besm8695113pfh.70.2023.08.29.10.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:04:08 -0700 (PDT)
Message-ID: <8158f004-e182-53cd-3da3-62a7144ae938@linaro.org>
Date: Tue, 29 Aug 2023 10:04:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 01/11] target/ppc/pmu: Include missing 'qemu/timer.h'
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230828221314.18435-1-philmd@linaro.org>
 <20230828221314.18435-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828221314.18435-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: IGQ/K0S1eheV

On 8/28/23 15:13, Philippe Mathieu-Daudé wrote:
> Since commit c2eff582a3 ("target/ppc: PMU basic cycle count for
> pseries TCG") pmu_update_cycles() uses QEMU_CLOCK_VIRTUAL and
> calls qemu_clock_get_ns(), both defined in "qemu/timer.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/ppc/power8-pmu.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

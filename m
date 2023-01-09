Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2469732ejc;
        Mon, 9 Jan 2023 10:00:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsHNxBXqfECtn9hZaaHxuNEzKlI1ADpBciaPlsM5jaBbwX291RRtbmbxwViRhhv0olDFQbh
X-Received: by 2002:a05:6214:4383:b0:4c7:7e73:464d with SMTP id oh3-20020a056214438300b004c77e73464dmr35622697qvb.20.1673287201397;
        Mon, 09 Jan 2023 10:00:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673287201; cv=none;
        d=google.com; s=arc-20160816;
        b=Ay6oUVQbD2WLU2dPVdQi1tT0ypYT95jD57T1mWnlLLHy/XmKiESZ5U0mIwX/NILMoL
         /Qu44nPjUIjK5Sr7hIiMhs2IOrJAsOaYnX9ZlA/mfvtYwJj3FoNjUCX9hp8+BmOHMTiT
         oQiy0ZROAiixIYc2hDew8YO2xa1YaFmymj74AApqk/um48hccQK0rWUcs7zaPSk8xMwK
         fGe3g71s9dDXSbTSNyJtSKkvQBizocdYi7KPGSlY0NiV+WWWAQQsPx+OQrUp6Q0dBpM/
         3mbRJ8khnVTyrxaRTccsQV9ybCyHSKFhrb2LBcw0cucXjRhBInEdEl49xVOhSoMRkn15
         6wHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tmI+4WR/xzy3+CxB+qI0dx25hS44O6VG+ewPfYR1kqo=;
        b=Gogyfg/IdW/KioIRvuBDMMgLecBNMCZZUIXuZXlfIZ42tyjCp2CyMpLSS8y3jiDYyb
         i+qQoD3vY1e4rQuZ4Ohmb9hnT1ClNU3zwlaNnIJlk8LaPl+EMnCR5Sfk8MhzmIQ+R+v/
         /ODdYz5gzLG+KSo8yy1+71NJKKp5uzDlxAImh2/JP6BenFCuIcFY1oTw4ypZMjD9kynD
         g1jerUkCrUVIPM1u9sia+cdUn96rcs1z3B0792xws0vE7kS74eGl/Co2Qc6CbmxHz09L
         +p56XT3RpmHelaYCSnOjpcNfqNtgwzC81dhWp3qR/Qf3E+rRFKa95Kr9f2gbqu8ca7QE
         QFDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G18at7xA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14-20020a05620a27ce00b006fbc8ec12c8si1294687qkp.441.2023.01.09.10.00.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 10:00:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G18at7xA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEwQr-0000R4-Am; Mon, 09 Jan 2023 12:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEwQp-0000Qi-Pu
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:59:35 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEwQo-0008LN-89
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:59:35 -0500
Received: by mail-pj1-x1034.google.com with SMTP id q64so9571274pjq.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 09:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tmI+4WR/xzy3+CxB+qI0dx25hS44O6VG+ewPfYR1kqo=;
 b=G18at7xAXlQQ9iiPO+yn9jBXvXlEgzT+VmcakBeEQCifbGFsh4ii6M8/jT55QDrQzU
 4APvuC/N7O/Ii2YsJBoroTofdrhkYJTPHlENhA+B2LpuY+FmDGY1YtAT0TfAthpk88DK
 sii9JWX8LPm2MGaC2rUTsewEFHVMkqHyephDr6Q8vk7GSkNQ/3qxww3QwV2QzhhmTLyp
 UO1tyCc09Al5xqrqvVCTYs2+CT6+VjJAa+g1Bi2fjRDoKqylTumFcfu+rJ0DKhypDhMU
 hZ4eNVsgWNTBojifRoOgpRwftgnpPoYdrpnkXzyxhc3XXEVppFztRzNpfRDQUMEnY4Z6
 vYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tmI+4WR/xzy3+CxB+qI0dx25hS44O6VG+ewPfYR1kqo=;
 b=dS31S6DaGy8VZvCrbSi8GUn9sJ9J0U2gYewV0NyWIUKas/1H1R6G0UoNFEQZWJP/xH
 VecmqjL90rZyN+D19O9UyHF3BqCXnCsiKB3/KgC3yhx7y4/k31OqNJAo8aalrgmGlVAi
 RxXsWDNRfSeKDsC/8RnFR/mwilQ9imTYFelZ2JqGWwbUIntRm+5LbJJK30Dh2kys7eY4
 lbDKRagcVU8MG3bdkPg/jr/lN4Q3PN0vNB4rlxLcTZ2NGzP0MUKJY9eQI+FnVF9l8+A6
 TAsm49czVieZZlP+R5z7UjRi/RTLqc/VwzUrmF1x6ksVyGHHg7vtv4P0yiu4El2NLYA4
 Ruqg==
X-Gm-Message-State: AFqh2kpHyC8Q9CMQuit5eIU0wdEK5KgNQN4s4dpEP41Kw9fQ26/eBj+M
 7zLMjYL13prbkVrAr9uIWCILaw==
X-Received: by 2002:a05:6a20:4a23:b0:b5:fc85:d864 with SMTP id
 fr35-20020a056a204a2300b000b5fc85d864mr1326387pzb.32.1673287172695; 
 Mon, 09 Jan 2023 09:59:32 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 l33-20020a635721000000b0047702d44861sm5328061pgb.18.2023.01.09.09.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 09:59:32 -0800 (PST)
Message-ID: <099810fb-6b1f-3913-1a35-4adb30c5ca07@linaro.org>
Date: Mon, 9 Jan 2023 09:59:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/14] hw/arm: QOM OBJECT_DECLARE_SIMPLE_TYPE cleanups
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
References: <20230109140306.23161-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8UfBF8zXzEcY

On 1/9/23 06:02, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (14):
>    hw/arm/pxa: Avoid forward-declaring PXA2xxI2CState
>    hw/gpio/omap_gpio: Add local variable to avoid embedded cast
>    hw/arm/omap: Drop useless casts from void * to pointer
>    hw/gpio/omap_gpio: Use CamelCase for TYPE_OMAP1_GPIO type name
>    hw/gpio/omap_gpio: Use CamelCase for TYPE_OMAP2_GPIO type name
>    hw/intc/omap_intc: Use CamelCase for TYPE_OMAP_INTC type name
>    hw/arm/stellaris: Drop useless casts from void * to pointer
>    hw/arm/stellaris: Use CamelCase for STELLARIS_ADC type name
>    hw/arm/bcm2836: Remove definitions generated by OBJECT_DECLARE_TYPE()
>    hw/arm/npcm7xx: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
>    hw/misc/sbsa_ec: Rename TYPE_SBSA_EC -> TYPE_SBSA_SECURE_EC
>    hw/misc/sbsa_ec: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
>    hw/intc/xilinx_intc: Use 'XpsIntc' typedef instead of 'struct xlx_pic'
>    hw/timer/xilinx_timer: Use XpsTimerState instead of 'struct
>      timerblock'

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

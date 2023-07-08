Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp183795eje;
        Sat, 8 Jul 2023 10:20:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHX5AiXCOGwXXNzIEHSWONkmafmc/VEXnx08Z37v2KQ/3lGKTRWac3troqS5DIWDFwTAPkY
X-Received: by 2002:a0c:b24a:0:b0:637:77d7:7c45 with SMTP id k10-20020a0cb24a000000b0063777d77c45mr2941786qve.45.1688836833585;
        Sat, 08 Jul 2023 10:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688836833; cv=none;
        d=google.com; s=arc-20160816;
        b=DQ1zsl7OqNfww31E4NcJGIekjgmNgR75KJbfWC6nRk4Sen7dclALxVpOubK7e4UP3F
         jDXvy/3jhTcy5n4EYmTRy8DVBysT3SpKILVMbb0gE/Sd+ja4iRk9aBeaoG9k93719a1m
         d4QSXu26tTMm0IKSmEwDCk01S6G2bQ5ZOgHKTgdtdffF1dxVjILPhxXCrwHLj0EFyEnn
         TnonvEqnA943t5z4Gmlwg321fkY86dgoY+slDT/hQBVSKV4G49Wih77pi6/xfnuxf1OC
         1zYwaT6jQwZIMy/LGE8LWdY6pJrjySXJ5hEUN+BEGFfiMnlMFHEDj/rGTJZjllm6SInS
         j2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MxhKU43bs1JHSSm0qPgBg513gg2gr4mB0L87lM7uzVc=;
        fh=j8pwsiah+H3QGMu65HcARaW+qpQzvNSIWsTdXEYkYfs=;
        b=HByc6ccobnNddqn87jJ0kR8MtwKLHm2JPrA3VxQDGpz2lUXJyKTtCM/Qpmtc7QWKL2
         FqsvznaCbuyHb1GrVN7m2mfNN5SWwKJyFYna1lgAG8Q1LcsYx+s+5Qa0R2SM5k8jyU66
         KniARoHvcO/YLrG1UDJqlJnmMBoBrIwakmxU4G/gaF5+rOl1noLD+uOZTd7oAJv3L1EQ
         7IIA6hzMWjnZM647bTqa0L7sTVzwuMJnFO21T4HJdDlqbBg095uw9hEBP5JKnl4PAjRh
         d6mytcS+8OPVKiFgvw/A8NeCbuHWE2k2kqqeVM1FtH03VpQRkrKPaZPAg5pkWiqE+lOr
         VkOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NTD3Tzbc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15-20020a0caacf000000b0057104cd4825si4086127qvb.68.2023.07.08.10.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jul 2023 10:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NTD3Tzbc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qIBbd-00019d-BR; Sat, 08 Jul 2023 13:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBbY-0000xx-MT
 for qemu-arm@nongnu.org; Sat, 08 Jul 2023 13:20:21 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBbW-0004K9-4A
 for qemu-arm@nongnu.org; Sat, 08 Jul 2023 13:20:20 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-992f15c36fcso398568766b.3
 for <qemu-arm@nongnu.org>; Sat, 08 Jul 2023 10:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688836813; x=1691428813;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MxhKU43bs1JHSSm0qPgBg513gg2gr4mB0L87lM7uzVc=;
 b=NTD3TzbcDaBttxDjvzKyx6unCgyI2PJiiG0H1fhXeZbn6ns9mkoMXyA3fTH+w7tfBD
 at6xQQM+H59gLVUJ7QIW94DDaWVe1wjosPOLNgH8SP1kVznH/RbwnQBeYWnRdWBaRUe7
 IDEsIdV/hmab9bNWalqBxoDohyLXhsjNfqo63HRc43v3LDVK6j7myY6zts3JqlOMPRZq
 slYJalyyp+n8vaLENVGQVghABxvdkgw97p00wapbsB3zuNY8G8aXpa9zy51wAB2n64wJ
 YlrHmK6+m0qeCN2XYjdbscQahSGXNiWhr4FZz9Fdz6NC89aeti5Wuet26B7gYjTD5LCl
 A7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688836813; x=1691428813;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MxhKU43bs1JHSSm0qPgBg513gg2gr4mB0L87lM7uzVc=;
 b=dG3kAEBUS2HZR8GZd7uwImqxPbvVByUkJl2+o3d/Cg+pHH4HIqOzG8BPt02OVBlAc4
 uwLbQV9sIBlhvEkdqmGli3npXJqemdZi2ExGwmevmabkMWjylfcwvSim2YkdnDIgtA90
 o/ybzEkCVELLSWhqEKjn/AWeGEwOuowJDSXVfBcSdO9pgQkws0IOf8Hj/5AVH+cDZMbU
 6bcRUrNjGlmy1RuRdw1X5XW+nOQ0XugSG0dfg5QRa0sGIuyYTQsNKutu5JPZkQ6v8/1g
 0XAEYaCG05IBzGv7DQF0uWU4CGRAckQ+vUpLcJbhqQKfnQ2vMmyWddych/7pTTCKTBuo
 luNA==
X-Gm-Message-State: ABy/qLbuRGYupedB+zG0LgC3b4yseUOwYAu7ckX/t/Gp84TL/Vnv255y
 +cLuK86/6ByUIx7iY6OTg5IMYg==
X-Received: by 2002:a17:906:5c:b0:978:ab6b:afd4 with SMTP id
 28-20020a170906005c00b00978ab6bafd4mr6995548ejg.43.1688836813661; 
 Sat, 08 Jul 2023 10:20:13 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a170906925500b00984822540c9sm3760146ejx.96.2023.07.08.10.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 10:20:13 -0700 (PDT)
Message-ID: <8d230498-06fa-c4a7-b461-19dcc047b4ff@linaro.org>
Date: Sat, 8 Jul 2023 19:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 27/37] target/arm: Use aesenc_MC
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-TUID: UUb3ZSkxP/GQ

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AESMC instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/crypto_helper.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


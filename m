Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp2402629ejs;
        Sat, 19 Aug 2023 03:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlb7ppZhRBPl7OH4idwNVbGtiLGVEEOVihKNnP/3VmVaRbnDSKZ9sBMJHLihqoE8ml/JRL
X-Received: by 2002:a05:620a:3951:b0:76c:81b1:498f with SMTP id qs17-20020a05620a395100b0076c81b1498fmr2262624qkn.14.1692441815048;
        Sat, 19 Aug 2023 03:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692441815; cv=none;
        d=google.com; s=arc-20160816;
        b=hHrq4KB2a2QDeVncIz8NRpKfDTj32s4pMiIFku79j1mdhttGtNTvNyZU+bekdQo7xL
         jF63en2zbW+OV8aJHYsPuGuQmuxLCf2VqxfNrGNDoXNiCyyA+xdtiFhiYxR/YOnlrm3E
         9lXjwZfAjyJu6e34DtvqAEU90nkxdLerAzFIxpbQ9Ud9S/g4w0//Gd4Q/dzqcZM6fkXa
         0aDLtTQvA0uf0yRONeTdN/T/8Y0A0tqUhVGoTk2Y+iaXw3CymeTxwS6yI1xqnE600eBf
         0xNyyT7NPr+TX5gh9RjinQSkaZN9Q6rRWu8vzU936PSTpl8PdkSPLrVsHhjqzVJMhSHv
         J9jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=R0Kz/ckJ0a2Pbv94nIm28KP31XHv2oTiqzWjS7OL91U=;
        fh=I3ROdjL7h0WWLArn7HUzKwjXf27njlP14FAmu/F64/s=;
        b=MaSKsxhJuB6Nq0hEbQ4dvQQZSyGzDTTWZPtwXZVInVKs9mEc0HPyrsojnMuthsVz0F
         XiGyAM4YfOxm7ArX4MkurHEARjxYaOpETd96WjxdHgm/hkhwHqP7ppo6xFUnsfg33liF
         BogiHGGfOGdsYWOpJNNrwj6JZOiaKsSkZc27DVHf7s02tqvO5FHgfj2JYklsIpHRUYHy
         fwIfJfTUSrlRew1uwA+kT0OGI9r0S7G4R4bmuYmmGnRwmZJjZxHm099CRhlc0Kebkbgc
         bUHa0jx0C/yZZbiwqCBtkQg7BYQOIfy0X3f9rZwULPeDvLtW/pVWi3M1aMfEwUgpeiEz
         skqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFdXrZH7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4-20020a05620a440400b0076d8bb2e9f9si2208731qkp.680.2023.08.19.03.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Aug 2023 03:43:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFdXrZH7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qXJQ7-0007E4-CD; Sat, 19 Aug 2023 06:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qXJQ5-0007DB-Gx
 for qemu-arm@nongnu.org; Sat, 19 Aug 2023 06:43:01 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qXJQ3-0006s3-7w
 for qemu-arm@nongnu.org; Sat, 19 Aug 2023 06:43:01 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-99c47ef365cso231245066b.0
 for <qemu-arm@nongnu.org>; Sat, 19 Aug 2023 03:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692441777; x=1693046577;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R0Kz/ckJ0a2Pbv94nIm28KP31XHv2oTiqzWjS7OL91U=;
 b=DFdXrZH7semUSEGVDVF9lNJ9KCkwhIF4Bc1U2uvFLOXZuSreWT+M/JzeOXsFAwjFCk
 ZdHINFoELo3691tUjJG4SIc3w4hHvuM11TPpewZB/nqDOWM8DdZObTsU0Jn5xWw9Hxme
 yxMbsWtUii2dIiUh6IeuhzDDa1k+OHpJU+1JwY98hg2TDq2VWkQT0pyLx3nMqVqHE7rt
 Lsd725GGYUUSBb972BgQv8aCK+BI4A1BXWihHK2KO56Q5BLpwAVQpew3VtfaQ37SfeYN
 SVSxpsQp0x0CwaUZotYTXlfAlFDx0MdFv+lkdB4fff94lyMgm2rTSpncFPEwtP2Hi9xy
 qtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692441777; x=1693046577;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R0Kz/ckJ0a2Pbv94nIm28KP31XHv2oTiqzWjS7OL91U=;
 b=JdeuBIhmLzTafqOQMKlwBl+HqX41wWKUbItB7VKqZpo7wpkz9xxVPQ1aBgyhpsMbQk
 wZXRdjFk7FNrOhN3vCEX3CoKuauXRMYpA3rouXK2h5BfupE8uH5S3qEWxJ2BgdD97jEH
 xix/xsMeH6d3H6cWqXjF2seaZTY+k0Q+/zLJAiTvam4O4ARblAIpgEUFmSBXqT+q7s+E
 LGTca77TjZXHOrMt1M1SRJBOWYmjO9pQTleLhbeUu2OAZpVpmMUXAR3L/wcaXdViQXWD
 c5buW82AMOt9tLlIK02AxrMHRpd8dYDaw5q0TmI6T3uDOOfJudsl8BZH15nlH/O7JecA
 0yWA==
X-Gm-Message-State: AOJu0YwdhECdzZx3PtbDqvlwuGFTXeFZa+9dsQ09OhSQ4u36SZTUrQiZ
 qv2BNhC+8qqclsT27ChFVp3G/A==
X-Received: by 2002:a17:906:1090:b0:99b:c8db:d92f with SMTP id
 u16-20020a170906109000b0099bc8dbd92fmr1444214eju.69.1692441776970; 
 Sat, 19 Aug 2023 03:42:56 -0700 (PDT)
Received: from [192.168.69.115] (cnf78-h01-176-184-27-220.dsl.sta.abo.bbox.fr.
 [176.184.27.220]) by smtp.gmail.com with ESMTPSA id
 o15-20020a1709061b0f00b00985ed2f1584sm2486701ejg.187.2023.08.19.03.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Aug 2023 03:42:56 -0700 (PDT)
Message-ID: <dbefcd7b-82b0-9601-c188-19ec68082b7f@linaro.org>
Date: Sat, 19 Aug 2023 12:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH] target/arm: Fix SME ST1Q
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20230818214255.146905-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230818214255.146905-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.862,
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
X-TUID: Kd1R652ifZfM

On 18/8/23 23:42, Richard Henderson wrote:
> A typo, noted in the bug report, resulting in an
> incorrect write offset.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 7390e0e9ab8 ("target/arm: Implement SME LD1, ST1")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1833
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/sme_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



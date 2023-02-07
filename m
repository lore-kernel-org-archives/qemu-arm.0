Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5877779ejb;
        Tue, 7 Feb 2023 15:07:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/XFLlqX8t8w9FKFCmQ6qM8nxJCPO02Hf0KZXh3xw4jvlDfHGFqPheYAJBvMTpIav8NiG5J
X-Received: by 2002:a05:6214:e4c:b0:56c:94f:ebcc with SMTP id o12-20020a0562140e4c00b0056c094febccmr5254287qvc.3.1675811259654;
        Tue, 07 Feb 2023 15:07:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675811259; cv=none;
        d=google.com; s=arc-20160816;
        b=SdGOdZuicaFpHw3PpwyFFt5Fb1gL+prlqasI7Gtgr8J9bBhzlj9tGue/4ImaGPyvoR
         yjdvPMi5NvT8Bh3Vi6wLyGexVxnDq5L8eREnGbROxJWHDmekJtfVcCiXB9+oP5I/6EW1
         VibVR0RCShFDdCeJmKEaRHKo6jMF/33ZfiFFIOq6WnqX/ppe2RwTVu4ag5zNApULzpvI
         LprrfEkBOPPH3R6jh/mOFu1wvF5bHtMRHhKrLYrRwIFoOrlcp7FDcpCw5BdNUdh93zLM
         jnuZXvBC4uVmDUFn6zkYKURutBB1HJjvhPZNhYd1F6KPA+HeP5I0xphdxOPecVBA6Gzn
         CH2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bhPqfErekPB3c4DakukzGYqWK9QgFk/hQmgTk727dp8=;
        b=qk+ds+jOK696klOFMpiEQKAgN2KfTU1Tak9MqDpb5B1wmT/4PEZ4hM9cBBg4NukOTv
         MzrEW7Zk+ziwr3OlOPTD/J3hfYeZK5YauogorR2r17St9fIT1wgcMATM99E7e/kBf8wS
         ddSgD/tUpAEWOQvujwNRqCThyAmEG8qefdnNmstfXMQ+wI6JzWIJiT3Z0aGzIgiPniGb
         KmWMk1a+zdJyhN7nMS5irROuxGdjXxsSGICx4xWIOF60int7AK3iwHyiU0fqP/vFgSeX
         eJxitUuMvwVWX3go5ypU3/46ruK9u2ORX4u4Vsd4D/BJPxMGx9iVrMeTp0/ydmp0Wo2m
         SCwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DY/uwrGE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020ab03d85000000b005dea723b91bsi5869325uac.185.2023.02.07.15.07.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 15:07:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DY/uwrGE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPX3k-0000W2-7T; Tue, 07 Feb 2023 18:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX3h-0000VB-Iz
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 18:07:29 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX3e-0005zd-QQ
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 18:07:29 -0500
Received: by mail-pj1-x1033.google.com with SMTP id bx22so13674282pjb.3
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 15:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bhPqfErekPB3c4DakukzGYqWK9QgFk/hQmgTk727dp8=;
 b=DY/uwrGEXFqcMwcHPgXjd3y/h1pj/+Rx/rbaNuP1nXWnoxkhI6UADPBL6rLs38zfdR
 Mf9LIkhq7fiDgWteaIP8EY+UteQSJWMajHaKm0AyfNi1JJdWBwqBgpnrWCyGfL+KnW4d
 tZgPEwty17fgbnDYsZjf/4sRe68Vwrp6hUGnbJ4UMyoQa9h8y4RnA9NrMx9RE2ALxN2m
 lRag/67bJ0QELOnGDOXzB1K8PuFnnV8v52rL3AUnKAJBP0QtLrXKUm1iSIDU/d4aYO7G
 CZeUvhFpBKOeFaCWZFUISbXZDM4ZV6daA/+3IbqHFdvoVMNO9Id8yV9yUIalO3erUjqh
 nspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bhPqfErekPB3c4DakukzGYqWK9QgFk/hQmgTk727dp8=;
 b=tj+vNHT73+Mp5OCbXNEMEGoYgzOsc9uG8Ek2cSZrrikr7ML8Vma9DTv/1S0qZrsPIo
 3IaccQYor3m4ccpP4Bl0NENDwGC1uQ15OMjLETiMy815QgaaxKv5+AQEejywbLWFpyif
 aboMc01YsfjOfi8728VdPs6i73xL2tIzb/VXcYKtIxnNwrtSrKD7Oan7PBnjrii3mN1B
 89GcpTo8sLIPbtb5QCrb6/uXVc/3fpx0hj3sY/7yTlJwweyoArLUg8SKwrd9hZfIDHEc
 6N4MwMhUCbA1C4wJYvfwZe1xYSjovBq/9lyRbuVo98rY/mCcbNBeBARzS7qwGXfTMMfH
 pmyg==
X-Gm-Message-State: AO0yUKWYNe0pPy/7niO2QuvOFnr+Ny4lLLO9LUyyqkHDW6zKQ3kw8qlT
 Zs3vLe5/JCt3kVACi6iDU5b9FA==
X-Received: by 2002:a17:903:41c7:b0:196:704e:2c97 with SMTP id
 u7-20020a17090341c700b00196704e2c97mr5189168ple.25.1675811244326; 
 Tue, 07 Feb 2023 15:07:24 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 g6-20020a170902868600b00192fe452e17sm9473153plo.162.2023.02.07.15.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 15:07:23 -0800 (PST)
Message-ID: <941b9ea6-ad1f-cdaa-c0e2-5c64dbedd744@linaro.org>
Date: Tue, 7 Feb 2023 13:07:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 02/11] target/arm: Simplify
 arm_v7m_mmu_idx_for_secstate() for user emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
 <20230206223502.25122-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206223502.25122-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: C7sA/OMsH513

On 2/6/23 12:34, Philippe Mathieu-Daudé wrote:
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/m_helper.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

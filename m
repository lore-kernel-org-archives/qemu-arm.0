Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1888418ejb;
        Tue, 6 Feb 2024 07:52:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE94au5XfM+RVrGmCAJctw9Ed3oB/fRPjw9yLa2mf9RNUTS4LamemAj9kvT4hLu5bt+HXt7
X-Received: by 2002:a67:f1d0:0:b0:46d:298b:2eac with SMTP id v16-20020a67f1d0000000b0046d298b2eacmr2679918vsm.17.1707234778664;
        Tue, 06 Feb 2024 07:52:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707234778; cv=none;
        d=google.com; s=arc-20160816;
        b=zuDuX8kGo3LN0z5syiRTCrdMiZ5GM/1c3qkfnFAuoVQixX9++G4GH+jiPOdqRzojDS
         KOWmwP0ETR4ISo4nJS51SD84my6i08feiPcUNkmgpKpvGgubv1655vIq0JIgeZvs6KxV
         gZV9G4M8qIUW4lPwj0uuK+FP0bGFFsnbii+MulNh+Eh+B4WjUfP1CaQX6Ckub6Qqk80t
         YuFwVwCoR0LEA9CLtHrT+PrlJEs2A7iyLFDe5cWJwta0/1dZVWvAkC/R1azFWGbfRArm
         3DglS8/c+PMxTOrg180NoJzhTiE/IyQkdtLdyipmUH/4JPQIYvcr8cNKqi9lMKhYbF4D
         DEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=vJNIPMWFYvxo/rqavYfU5tHLbXzkeRYSCKXwUEjXHcU=;
        fh=w3FE47toVk/W7ba3MDQNM4cZkMqruoO1wzeqUeHMLHU=;
        b=LKf4ZEEGZmDP/o5N4jQ2w8tDy2OfV2uv5xTRNPG6Y++Ajd4oc2K4x2EIWC42+WsPN3
         77Gz5GaAkl9OCFsSEbQxFTVwEnxKryfH5KLkmH4xPvvTneTeU1frHqkBTXZoB+0BIz2c
         gVN0YN6NOJKvRnCObWcYaKsBqrTna8zTRflP3ByK3DQWupHxZr4C+mF9/1wJ+gzZbjUT
         Q8beSIVaE0lKp/GVQrs3us89hiAesBGS3KV7H/cEPD4t4dpjcgxjB6ilWTueZYRrdj8j
         IWd5rWQsnjnW3JXeAyOtjsnlgdZ1D43YTeYsKOwMfQkSPHBP6uJ4pwQ4F5UJqurvo001
         RdTg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JUFyob4g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXyWe15RLkbTfDxbH/oV+6NszcSrF/z82bOYGexw6TFyp9MoPUr2UTLl33KUBdajqykKETD0XrjK4VZh4HSTgun77Y6MK/p
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2-20020a056214212200b0068cb008e834si2692471qvc.78.2024.02.06.07.52.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 07:52:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JUFyob4g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXNkY-0008JQ-1H; Tue, 06 Feb 2024 10:52:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXNkW-0008Ir-Ny
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 10:52:40 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXNkV-0002UG-8C
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 10:52:40 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40ff812442aso1742835e9.2
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 07:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707234757; x=1707839557; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vJNIPMWFYvxo/rqavYfU5tHLbXzkeRYSCKXwUEjXHcU=;
 b=JUFyob4g3tOsgtKSD2hPtH4LTQfqyUSonqIvicXzcRqGKqD7Np3mWcfB+49M7kaMqj
 p41QQ82bPKBvdnurhSyfBG/IQws4u7IsGD2Bw6ytT9ygDpKNHKRkeepP3Ccrp2TtFZjR
 vpbAw9BABko5RELMi39buDrQEehnwWlVe2Hr2pDYsCSwNy3oK3ejgYoe28A2Y5vu2guJ
 R327ehoEf6FJtfth9IhnVD6DN5LhlP+XHYkRdOk62PXvC1/lmFeBwi1iSITTFyNqcrFj
 NZKbhbNqy/v7j1h6EW9Rce3vrXQjahFnKkXatjjWNzS2cFzaAM0Uqoyl1Mjcq2o/TkYs
 AaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707234757; x=1707839557;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vJNIPMWFYvxo/rqavYfU5tHLbXzkeRYSCKXwUEjXHcU=;
 b=TElvgo+Radg4RmzXnUYrl9kqtPRD1RiEYFYqFtM1QX0GWXJyvD/qokrLWhiaV6dHpc
 o1CvBMGYhpA+UDbgZMaF4bKYKhryuW3MAWNMUmUGnWiztGSexClLssWVo1bXtJoGrv78
 GUEDFlHAIrWklS0jINoRq4aib6Q5xVEfUMBUBmpa5wUte1HLKczGRXaJgoSugKmgl7VJ
 UxhRmxvg2XFq+W9ke41AjURgAV8lTMLOZEIAAPFGH3u25kd1a65xmOsLxkWTKD6GmaaE
 KvMtKDYbTykKblNwN0XaCKEONQ4oFivrSa5v6sWgUqjL1DU3IQdNIZKFXxHG6FovI0iw
 8P3w==
X-Gm-Message-State: AOJu0Yy4HvNnL1g8wCw9IRljhl3xyivmsLWZOGA8SyQl+1vRJcTRzjUc
 8vDRd0WhgMkxbkugvuORBUY5naEdrrVYxXaByRgTH53VyQGlrySCJBGTC6/Tjsc=
X-Received: by 2002:a05:600c:4fd4:b0:40f:dd7c:9e2a with SMTP id
 o20-20020a05600c4fd400b0040fdd7c9e2amr1926301wmq.28.1707234756941; 
 Tue, 06 Feb 2024 07:52:36 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWbgrlrQ6YfE8uSXzgTw6R6JSKuGfLbVP/r5KzSkDNJYdIy9srxnJ6jyp6ncvy96HWqD5ePMg9+pS/R/NpkQepMW17BWpO2RnfsyN77CHq2r45WMbMqcMuCunk=
Received: from [192.168.69.100] ([176.176.170.22])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a5d4dc9000000b0033b483d1abcsm1620571wru.53.2024.02.06.07.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 07:52:36 -0800 (PST)
Message-ID: <0a2dd2f1-7787-4270-8098-e6c460d5072e@linaro.org>
Date: Tue, 6 Feb 2024 16:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] hw/misc/mps2-scc: Fix condition for CFG3 register
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240206132931.38376-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: LA+PNPiCBLpp

On 6/2/24 14:29, Peter Maydell wrote:
> We currently guard the CFG3 register read with
>   (scc_partno(s) == 0x524 && scc_partno(s) == 0x547)
> which is clearly wrong as it is never true.
> 
> This register is present on all board types except AN524
> and AN527; correct the condition.
> 
> Fixes: 6ac80818941829c0 ("hw/misc/mps2-scc: Implement changes for AN547")

Oops.
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/mps2-scc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)



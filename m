Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp812731ejq;
        Thu, 9 Nov 2023 15:08:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXc/gwYKAgQ9q3WZqEB92XBpy5OvzMG4IylXi+DAX3bcw4RGeAjkNp+jRPJ/p5JGyvNi1G
X-Received: by 2002:a05:620a:4620:b0:777:5044:8c2e with SMTP id br32-20020a05620a462000b0077750448c2emr7038426qkb.9.1699571285768;
        Thu, 09 Nov 2023 15:08:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699571285; cv=none;
        d=google.com; s=arc-20160816;
        b=xs3sLxM/RLAjGRQVkb7bPU3guHHEVsRJbhok0VTHFCsRfd2kQrJQV48iGmIu2oBaH6
         Sc8pq8Ln1VokwMO/ZwnnRKqjyEnXnTrm8v7hNVxSH/EJ6255jkLM38RgmAu0KWC2nZFP
         2DQvtjpgwKFKHKZzc2+Q9Tyq9EIHO+5jnj2GOWSwk3ULSzzDv15m5TBTsnmAKPCSPirt
         mmfcV0dbdxky4kCd/3rH8AXIdUJVih2H1fSV5s2Qi/vglYaIi0NiUTMfaQpczeP75OSH
         kSRhlDCNWYzlIGd0kke0XCdotm/kzvacEka73kf8MvR44qg1WNfJSon2SnM74iFJjPSH
         P5SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rEqoaBAI4OAYO1WRKf/xzDbGXzq3kD5M0df0KJ2oYso=;
        fh=PRoHjD/djUAHQXeMIrzpgUv27otx4sratw48fpw7M0k=;
        b=PqtRaCJObRXVMx15IOj2KJl0A13rg+7OoyW7yblz53fob+/ETmrmtNPxndYLle7j8F
         lieM3/mWWR8Js2mezlcX3/FtgTyLpXMylbTlEU2q7IYHi6xVLdFhPk85iG/LlYCo3FDe
         9lbGqUuWBZMPMNfKg5fcG5YUIwK2FNVKoodBBsMDQn9B6zI7SpaY/fENF4ZBGt09Bs9y
         zFHEhs34UGlEoJAg6C2GKuBGBQfozYATkNMYAsZ30s0Nhfit4qHFLfr360YuFF99snMt
         uZAbXHWZ8Y9cMIROwDLNDnNXS04uPkqJ3u1m4rzh3uQr9QSUyUZzvoSG9nymu6pK3hbw
         gD1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vczedZQh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21-20020a05620a291500b00774395787a6si3755372qkp.299.2023.11.09.15.08.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Nov 2023 15:08:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vczedZQh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1E7o-0000fy-J2; Thu, 09 Nov 2023 18:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r1E7n-0000fi-Uo
 for qemu-arm@nongnu.org; Thu, 09 Nov 2023 18:07:48 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r1E7X-0004an-Jz
 for qemu-arm@nongnu.org; Thu, 09 Nov 2023 18:07:47 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1ccce410660so12523855ad.3
 for <qemu-arm@nongnu.org>; Thu, 09 Nov 2023 15:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699571249; x=1700176049; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rEqoaBAI4OAYO1WRKf/xzDbGXzq3kD5M0df0KJ2oYso=;
 b=vczedZQhfVkqowBIZQ1Br80lYyLNClOCwS8DtrcS7gbLYgscKBmODRiR+OJppZzZVd
 RGePF1mgiheKQfWPgiTail5AeOK50aNfiU0KxzJoIKrPkhmhYVeTql2EFofP4MrwKOIc
 ywcHJ2tOgBEgbGZBUn3gSnbynY35BGwhg7xho2AdfS+x4G1cr8cb7yHRcHeL6QQ/prmI
 v7LHfWOYwSDmTdU3U/rlRhgLqAerVpI17U+fziLbyCKBKMsJDAiCU682+Ame8l+zC/+I
 Aoq5smFTWIT5Uw/mhagG+d9DHXBKCCb7VIZe5DKvo94TWAdhidoEQUbQ7AMRqYjBsfq8
 ZJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699571249; x=1700176049;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rEqoaBAI4OAYO1WRKf/xzDbGXzq3kD5M0df0KJ2oYso=;
 b=K0pmPCZ2DwlpJ4Ug4/7/xudK5X91B2E56DoPwHdxUT0TN6jjKIFy3LSK+83KiJ+4sZ
 3yHgyBwpvz93ExJeEELPwkXc1CFMt0Pp5te5HKurXpRSzafHIzrNUMXWIAQw1kH0AtvZ
 r/R2O5p6rkvskNbRtUFLnTaCg7CccOKQA0Ry77yVE0h5bEhjeqtHeNvU3dP5Ggii4Kln
 E5JEPihNDx8dk4UsJh5Ud7N7eftlFzWvXIbTo73Alpt2rsIzWNtynVU5OFTT4mO0vfIr
 PvkPXC/r1DnGLpSiettmJjt5Lmb5+1OZjBpyhevtFZKbbYkmBgpG3X/cGhYH6XE/6MhB
 4VZw==
X-Gm-Message-State: AOJu0YwwCAxMRzO+xw+jGOnWoJFjmuyU+FuHGJS2OXyGHLy2+wyilevn
 A+BSBLRYdizJ9CLIfmHVv1IVyA==
X-Received: by 2002:a17:903:338e:b0:1cc:7af4:d136 with SMTP id
 kb14-20020a170903338e00b001cc7af4d136mr5149683plb.28.1699571249612; 
 Thu, 09 Nov 2023 15:07:29 -0800 (PST)
Received: from [192.168.101.169] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a1709026b0700b001c5f77e23a8sm4025073plk.73.2023.11.09.15.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 15:07:29 -0800 (PST)
Message-ID: <936f6ab2-5e51-4162-a71d-79dde0833b42@linaro.org>
Date: Thu, 9 Nov 2023 15:07:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: HVC at EL3 should go to EL3, not EL2
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20231109151917.1925107-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231109151917.1925107-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: YQjYS782leUI

On 11/9/23 07:19, Peter Maydell wrote:
> AArch64 permits code at EL3 to use the HVC instruction; however the
> exception we take should go to EL3, not down to EL2 (see the pseudocode
> AArch64.CallHypervisor()). Fix the target EL.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

r~

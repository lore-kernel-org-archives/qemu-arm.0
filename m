Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp213337njm;
        Fri, 28 Jun 2024 09:12:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXsysmLSfy57c5WP6MYJZzwCshWX851ChX5FbJedK7iU0W+prU5kjc+VuzI6DI4bsGCPI3B8daDsYcOyvCQutEgE2iR83Vd
X-Google-Smtp-Source: AGHT+IEL9BcrJORyCyQ2gHvu1D3IZh/I1NsoY+ss1fvup31eSgUDq/eD2Beu/RIL30+I4gDLibT9
X-Received: by 2002:a05:622a:342:b0:445:394:64b6 with SMTP id d75a77b69052e-4463cfd2547mr77453191cf.23.1719591171860;
        Fri, 28 Jun 2024 09:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719591171; cv=none;
        d=google.com; s=arc-20160816;
        b=GezFmxXWXKK3RmgLB+lYH+Zrzp3JfZzLq3fQewKdJl3KeMl2imrAZTQ0YwO4fx9EEP
         jZ6paXEjjJ5GSv72IHqqyjtctdNs783AOVHOLmidj/ABZI4FNiS96mIm6at/1mUpHgLP
         c7gIpJ1p8wPsPMbUEYCMpwxagGA5Xzl+Ook+UzXPHItwdCZJTE0Fx12hW4uxh1QuE4O+
         Z90fPv3dtlbglJaX/XNBFzX+nDinZ0ErSMHpq7Jlynr/AoZUl+09Hfp7Yt+E7sLTgJOf
         K97+LKAw+sCkodLHAc7gov2Vwc+nrPIthPL5nPA7MUNe4P1uG18YqwzkzU3f7lnEk4sc
         eVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=+hsxvXqtrSDIgVBf0gClU+0HHZ86ZGBrtHH4Y5HH+hA=;
        fh=H0HMu0bVxZV0IBSRnZmHnzCzwC7+kAGojU7jUFbRlDU=;
        b=G+E6u6ku9CH0PkMvjmxM/wdyIQ082xxRTOanQbVhyYa5YMUgFV+W48ggcXU/i4puV1
         FNdgwdPnH/DKfNXQLRsOTZRGznAGOIJ6DnyoCYslc44Cl+EIbti3yXeCsfraJluWKJ4n
         SgBdAcFrql2QB3lh80QVppU4gCr11g8LtuRxu5w6FQZ5mTFPQDZquW2w3wYxKkoe7V0D
         dN/PtGQPfmL/iw8CWEMvfKqRYgVnByeH5gghuFPBrr9eMbf4ko49XQGnVJ6LL8SgrIKl
         taCT3yozNF7OvgmFDfELp0KJhaHH7Hc5BPnfnsruH0LMNM0GxyrHrrA/SfaBCYIOZGO3
         Dc9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V4ObzvIt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446513e01f2si22040211cf.220.2024.06.28.09.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 09:12:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V4ObzvIt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNEDK-0003g7-5r; Fri, 28 Jun 2024 12:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNEDI-0003fj-Sg
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:12:41 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNEDH-0003FW-1s
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:12:40 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-70685ab8fb1so602754b3a.2
 for <qemu-arm@nongnu.org>; Fri, 28 Jun 2024 09:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719591157; x=1720195957; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+hsxvXqtrSDIgVBf0gClU+0HHZ86ZGBrtHH4Y5HH+hA=;
 b=V4ObzvItnQ3kxClxyXr9kHVpk4bkK7LfXtCJYoS74ZjyNW9AQG5PMHk9jn0fevB1Yc
 m1VmVVAGeFSVDaf7CYcj/831Bc2fvj0NRfSyJejNNFBDOrdH86HyNg4Kq+HigmwrkCPX
 5tCCuJY2URSr8CqbWNdg+XEVUIuh30KcBNg7KwW5VbLe7N9g5cCzFrbpKm0rY9flFetp
 rNAP46c9YbS4iGXaVRRAn01acByw9zLlXcPlFr1vdr1zwrf0wVSwYdzOyYM3eNbmMzEq
 S139fyksvxlSxcRIcO9iFxqibqRhxAZYHWa8Q42l81SR4dH1LIgk/1Qsh93WrQ17zH/Q
 Y9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719591157; x=1720195957;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+hsxvXqtrSDIgVBf0gClU+0HHZ86ZGBrtHH4Y5HH+hA=;
 b=TKuOsqbi23EhttH+6qC9HP+VSBrLaXy4ksJGHTj5Hf/8nELTT/D3/TSZHGwR/3G+MN
 kU/wCMdriVUutad5l33Q/lig2Wxd+1/barsJBUPF1Fz3MMcKLqvkTFtB05Hqaiux+Z//
 w1K2FnpA555UR4Ltd7at1toklo89+TJgfb56beMQXxodGyvz1aGfF6n7jecm+BHZTPB+
 dtOVL1eS/joAE602CrciiGg8QtELy9fmdkbV6twXFWeliZkZhY/D2CFKPTGWkH8N9Umm
 gHNTWs+D95H1Ief8Eyuqz+LQv/kme9x9T5R2fnAPVM4DS8gJikYblUJhQVITRuOwA5ws
 WRiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa2brtjZMTBBxFp5ZN6fE3NVVLsKl+Uv/o/MGUWB3EsoeZXAiC7bnaZ+saTyqeUL0GDnrXj2ZZfarzNfF89jmTF72G
X-Gm-Message-State: AOJu0Yys+l2V8UhznYk9T2KiOMQ8gOErbM9gbUwzmO1BRNL4PLbu7zPJ
 OBFjBZepbHqN+HP+8EEW7G5JdHZ5r4S9pwACu5fnPOS2NR4wgcI0T6wJXCVJMrQ=
X-Received: by 2002:a05:6a00:bea:b0:705:b6d3:4f15 with SMTP id
 d2e1a72fcca58-706746b8feamr17435162b3a.25.1719591157068; 
 Fri, 28 Jun 2024 09:12:37 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7080498a3besm1780819b3a.196.2024.06.28.09.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 09:12:36 -0700 (PDT)
Message-ID: <68a00e63-9743-4b7a-aae1-a86ea5b1918c@linaro.org>
Date: Fri, 28 Jun 2024 09:12:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] target/arm: Rename FPSR_MASK and FPCR_MASK and define
 them symbolically
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240628142347.1283015-1-peter.maydell@linaro.org>
 <20240628142347.1283015-9-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240628142347.1283015-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: /e8W/yA5szRa

On 6/28/24 07:23, Peter Maydell wrote:
> Now that we store FPSR and FPCR separately, the FPSR_MASK and
> FPCR_MASK macros are slightly confusingly named and the comment
> describing them is out of date.  Rename them to FPSCR_FPSR_MASK and
> FPSCR_FPCR_MASK, document that they are the mask of which FPSCR bits
> are architecturally mapped to which AArch64 register, and define them
> symbolically rather than as hex values.  (This latter requires
> defining some extra macros for bits which we haven't previously
> defined.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h        | 41 ++++++++++++++++++++++++++++++++++-------
>   target/arm/machine.c    |  3 ++-
>   target/arm/vfp_helper.c |  7 ++++---
>   3 files changed, 40 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

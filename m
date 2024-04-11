Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp139635ejv;
        Thu, 11 Apr 2024 12:28:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjDGgC0Hg0rjZWLJH4zGzgTug1BzPLmqVG2QnMFYHY98+r8FHPs0cycyndPX1Lu8LbGyxskKY1/s7dLXKDBVGw4PC+d+q4
X-Google-Smtp-Source: AGHT+IG0ekOke1LJ3Hb4nJozkODSXfOtRsVsAQS3NzBDmfjymJq21+/mRR73Wp2U+FDjsatdKj4C
X-Received: by 2002:a05:6808:683:b0:3c6:d3d:5064 with SMTP id k3-20020a056808068300b003c60d3d5064mr542076oig.26.1712863698739;
        Thu, 11 Apr 2024 12:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712863698; cv=none;
        d=google.com; s=arc-20160816;
        b=Imt9hGFJWfQaxDGstMaC0NPzMiHCaqpfUm+SafwVZ2P2+0PBZFFDOh9GojPzzGmWjN
         l6ig4EVOrn6o4NFj9X/hMxYXwr9FOREmF/KlWBzT2eX8KoMXcWfxItTN4WuEyKRI5W3b
         p+ATUQotLC+1Pa2vcLikOviuLQ+eHEA/pzWq/ocztNYhFxX/0xjR1mpQUnGHW02fUA+P
         SeNdupuTIhk5EFRHY3+6aO0HWyez2NBVmJOtIyGW3GFejBjUbCPMi1zxUib3DsTpOHge
         ZpwuD/cWQqvpjITbODdIJYCB4tlSZcyNSGDNO+I0aSmUNEtQC203wYqflHntF1agiEU9
         UTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VDfFMBcnV9jSdKar7lujziopZr97R5f685OZFBgNJrs=;
        fh=zc7DcWj+PI63W3KV2+vdnq2IjIlol27qQYX78oAU7xA=;
        b=WRNbsjBfyTbdSaX/tfXLGMgORvqB2cF01AYsjwQTgIm/yOOr40QO7CvNBuU2zbIcmR
         F7eLExPWh/2ozSJf6C3AQDVahvfn4XrvbdJQkKvtTw/OcLVvgv/FcPxF1pqw+q+BEVgF
         kR2xgxDhanh3kYBx60wXgeJsXrO4DWANhHr+0jeYzzJ2cBLYvpALGu8fCUrpLRJWKAg6
         gmikCl7qAtK0o93E2xP5na7M7SrKBZQR/eiDzQssZeJKJe6rVAO/++oPd0QpuAFFO7hC
         DS2Uwb+wNs+XhdVr1YZdKGKx40WDj6T5OE66EnJsCuYMzHnsmRAWwGVkOfpW5Z2thbYH
         fH2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b9HzuiBF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7-20020ac87f07000000b004348cf76e52si2162072qtk.192.2024.04.11.12.28.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 12:28:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b9HzuiBF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rv05Q-0003bP-1y; Thu, 11 Apr 2024 15:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv05N-0003ZM-Ox
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 15:27:49 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv05L-0000V5-5Y
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 15:27:49 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1e4f341330fso2083495ad.0
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 12:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712863664; x=1713468464; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VDfFMBcnV9jSdKar7lujziopZr97R5f685OZFBgNJrs=;
 b=b9HzuiBFrbP8OBkDQqrUakWdCjodeIAZJsJXLb95BAUIdHUqxAoRSL54L5yok/KXz/
 GGiL/XfAw9anix/HPmZuF8CjhVt1ih7Fa3c798fDf51yE9vutQF23Qg6dTdUT0AZi7Iw
 /K5yrmg3rKIWebl6F+kGmuPTeEolhcTrWMPgqA2LMl3hBr+pVlu9JEZiw3X8T1OBF6jz
 AKonuvqDdtaPI+idpXiUofLX2C6nXdh6AXRoRs0iWF0sFUmDcuyF//ErjdA0tROGCM+p
 qUU2ZPoLISIiQyhgNAowIXlC3FozC+MItenTx1/2tnmNRiL5MmpKVLzK7GdGviZXYi9H
 m2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712863664; x=1713468464;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VDfFMBcnV9jSdKar7lujziopZr97R5f685OZFBgNJrs=;
 b=CA/1CkCfOebiXz/V/UD4fJziQt9+80r3Nhy468ed1d+JgCNJGoZTknO99AWbEZYoQS
 /+UQJnF8p6fZ7v4I7q4NgOdVYUxaNCo3lWINDFk7B8c55GsbPfQ0w9OJLuLQFvbTYHVZ
 bK5IqF2A862dKfFNllo2m5Mz/MZv3FsvNfK1d2nuF3jcBYy7jenOD1mo7e59pnpMJ3Da
 4g5F+no3W9khxcAkbH4Uw0mXBwnpk4G/YGEyAPJthFnzXRDntecjTm5ElMrXXAm+Tokq
 /fMJ4tXTVOBKslRWmRd9dYhuLwjElvkrzXyiGs16ugBYmlCyZl53w3pFmlkR1W+UGxz6
 EBrA==
X-Gm-Message-State: AOJu0YxQbF7p+8713Vc1I5OukorDO4ZLSRItawF+ODUJEkpqG/EntSRb
 HNhETWxRuXvZJsEtPlRJnGj+ptTYIj9BxnF8DA5HWxcAN19mxV7IhJzec5CUtHA=
X-Received: by 2002:a17:902:d492:b0:1e3:c610:597d with SMTP id
 c18-20020a170902d49200b001e3c610597dmr404078plg.60.1712863664117; 
 Thu, 11 Apr 2024 12:27:44 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a170902f69000b001e29c4b7bd2sm1518901plg.240.2024.04.11.12.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 12:27:43 -0700 (PDT)
Message-ID: <5f6f8b74-5093-4b9b-89ad-2f03feeada0c@linaro.org>
Date: Thu, 11 Apr 2024 12:27:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] ui/console-vc: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20240411101550.99392-1-philmd@linaro.org>
 <20240411101550.99392-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240411101550.99392-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: sKkotzdXWHp0

On 4/11/24 03:15, Philippe Mathieu-Daudé wrote:
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience.
> 
> Replace sprintf() by snprintf() in order to avoid:
> 
>    [702/1310] Compiling C object libcommon.fa.p/ui_console-vc.c.o
>    ui/console-vc.c:824:21: warning: 'sprintf' is deprecated:
>      This function is provided for compatibility reasons only.
>      Due to security concerns inherent in the design of sprintf(3),
>      it is highly recommended that you use snprintf(3) instead.
>      [-Wdeprecated-declarations]
>                      sprintf(response, "\033[%d;%dR",
>                      ^
>    1 warning generated.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   ui/console-vc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

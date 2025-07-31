Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1259C87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 20:34:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhZyX-00009O-Bi; Thu, 31 Jul 2025 16:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhYUv-0007VT-CV
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 14:59:28 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhYUt-0000DD-PL
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 14:59:25 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-24022261323so26594015ad.1
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 11:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753988362; x=1754593162; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WmOFoc78CJNiNKrPfOa45SLjxmlBQ7gJfXqtYFrLU0g=;
 b=fmU/BgN0kX0cSGmdwc19sOZm0Sroi7n/6rqk5b4yrJYv5OvBj+klmVxdpGZHetevmE
 rIfgIXrZlPvRBPGPRoboACYRjli7cVbH58E5cpi1AMyeWI6afr1cxRTa2DqiuxRNIFnW
 OQbl3TwS1GZ9blCjr0I+l/S25CWtl+TN/Sr2vfzl85rZ9gRxUD5MJU5F2+IkHIC0h5QZ
 BcqzOMn84wDMcsRCF9ufB+h2VA2E+weiP6TWFoPNIC11+28cS7jhsOfnj2SUMSsSO2ur
 ntBCgqxYO3m0GxVvnib5JbCmKkGzHDJsBEfOprzcJhsz0roBbH5KJXhf+kup2LEKwkNu
 YIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753988362; x=1754593162;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WmOFoc78CJNiNKrPfOa45SLjxmlBQ7gJfXqtYFrLU0g=;
 b=RAnLaLAunlDSFRaYY77671GbgKmDC5cbu5CAGG2Z00G9SdDMMWTAYm3anVLQHOPI9Z
 ZJFUOSIFF5QqgyHEEPsMKUjkr6V3MMz6zXbYZcBQVZVeehUvzBJT96YiEFPc+3ms7w3c
 OrWXC+1cXZsOUVcTiA3oY9RL/wumkHdNxSzb6ZMzTHNEZ3We1fs9VILOfeQqvPPdlKG+
 J18BGI1uH1Jzxrk22/12XgWYVCZy5wCm6U5SuPpKgHIQgTiOMAcsBuP66Cj5Z/QNVhPh
 wxa3+1Ylsq3QeNtEnSNE08CWsl56wDNGdjXUUQKt9ocbxd9R7Oxa0WIwoZAJpGvByV5i
 jNFA==
X-Gm-Message-State: AOJu0Yz9JAf9Xk5xwncRdqk+Sfx/Ii/oOmDXSxr+LU6I1uyBYTLbJ/Vb
 lCU/kxNXV4QxeibpDUMnrQr/w6e3dpKGH1Z9q7FMtPdUlKF2sFKQHrwANKad2IaatyhXWuUa6p1
 cMneU
X-Gm-Gg: ASbGncteZMQmvyAlDWG/lZARfgE823RKMMPft6+j6u+pTmvzbSCcwBJhvjS40RQYuM7
 llQ1pHTZ9DxUjTWSgiPSkxw/agvxSNGBxfjWBsaXWyReIDg5c0ErbdOfM7xebuDn98nNBeeuxcN
 NLdB/OAGWe1dyhLa38brKpsP3KGbzjsAHKt/b9FACANOtTM5hr1xMMxIWxpKPrSTftZkbYTJV2l
 /lGvy5zZWkQGj6sL1xjaytSoIcDr5kDaLSbwuuaec8YRcEwHR3PGzncxdqutk7MdnIBgRGGlE1p
 TC/z1n8rJ5eojH1pr+kA0unsSUdJdjAN/G09LMgzBu0yK1rV5t0Tt9aJSR0mPTrdNG09Ie1yVgp
 65wBDZkZcsfM6QvZBs6GGi8vflxgRRqbShn0=
X-Google-Smtp-Source: AGHT+IHI33S6TSWC1ANzbKh8+HwIdk59pD7IGFGt2KMAQAhYwgMhPrzYF2S3WVBopSZmsd6E25hNjw==
X-Received: by 2002:a17:903:32d2:b0:23e:3911:433e with SMTP id
 d9443c01a7336-24200a3bcfamr46667355ad.5.1753988362071; 
 Thu, 31 Jul 2025 11:59:22 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef67a3sm24277995ad.15.2025.07.31.11.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 11:59:21 -0700 (PDT)
Message-ID: <08ca2379-60a1-4f57-aeda-a28dc3fcb09d@linaro.org>
Date: Thu, 31 Jul 2025 11:59:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 46/82] target/arm: Implement FEAT_CHK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-47-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-47-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/27/25 1:02 AM, Richard Henderson wrote:
> This feature contains only the CHKFEAT instruction.  It has
> no ID enable, being back-allocated into the hint nop space.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 14 ++++++++++++++
>   docs/system/arm/emulation.rst  |  1 +
>   target/arm/tcg/a64.decode      |  1 +
>   3 files changed, 16 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>



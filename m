Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15719C83F1D
	for <qemu-arm@archiver.kernel.org>; Sat, 12 Jul 2025 21:28:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uahld-00087d-HD; Sat, 12 Jul 2025 17:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uahjC-0005xf-8x
 for qemu-arm@nongnu.org; Sat, 12 Jul 2025 17:25:50 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uahjA-0000TQ-K4
 for qemu-arm@nongnu.org; Sat, 12 Jul 2025 17:25:50 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so2532993f8f.1
 for <qemu-arm@nongnu.org>; Sat, 12 Jul 2025 14:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752355537; x=1752960337; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WMsAt7wuVqEZQNUYGLq4SBebg+9fhQ1gcuqkdbkWNUo=;
 b=nUIfQfYxm3gHp4NOc5nBGJkIyRhIYMuIL5PNKfgSM8IZUpW68ETU6683Sx6lBjVWMM
 i6RUW7zelhw9zGiI+k2v+SxNOkkhkXkzsUXyFvbm96S8FSGY+vDSGPGcEThgKTmm6I0S
 bGJ/Od9UEwUB7RDgJuYWYnuNWRwgzjVXuQWkqnVRzlSRxbyyztz3jrKYz1focOOB3fKe
 qPUfYCmePKwQBZ15wbIL0ZHzJ9qC034+Z+cNmwF72YiQGnaVmFQBbQ+Zhm4YWB+f5wxi
 1tknMu9T4cFuv5rae/g0gQrrgrZKXmpEu/u5HqERJL9sajoaJ/1ExGsnP0w+neqnfwOX
 vZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752355537; x=1752960337;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WMsAt7wuVqEZQNUYGLq4SBebg+9fhQ1gcuqkdbkWNUo=;
 b=HMY59R6z/wvb7T6i36lIebfe0Y1j9RVGVBxMeGvRJ7Lbj3ZVWu9lwSWAZ4KoAf8Z1G
 3Vi60CwUBrJUxFBirKR6qFlBJwCWoFIP/QkxtahqkHfclaePcT86Ohw+r/jxulJKm46+
 2kiEPqUzyHL5LYUmUXc1o8zqBkdyxd6FK9/C/dGJ103jPJmFSQnnLICUuiFI4VsLUyzM
 cb6Q08a8jlXPNDcUBYiWGn4IiqK4gbL0qQjna02JRPkQP6apV0+wDSLh9GXRWQmw9G0Y
 DISkvFQSK9alkjZ6voRyS7/pK7OkE6Ukyr1N0AO4BnexjtJ1bGva3Uqmm8r9R2Bmoand
 9B1Q==
X-Gm-Message-State: AOJu0Yx+7PS+Wz6K3mEryo61D+l44R6VPUoeQ3qWW0mIAy4UcpMdBbBY
 4yBCjCJhfyN1gUuQbh1y7iwf80F9/sEsuM5C+L6+nwpe2z2Aokosnx4IcE6bi/HcPOM=
X-Gm-Gg: ASbGncuhDTMXc+tm7pSuvnI3HO89JwNWiQTjuGsqWssWlU9NY5dRE+ihuQQ4vvGk2iT
 9Vens4Y2G2ZwM5BTEJkkXUjclnvmzJLJQFmhCtFXvne0YTAm7k/7ubl3+j5gaBm5k4AEA7LRpJ4
 k8XwYxMxeFDG82SMjHQ7KGf9TDoRjLp3dgHtGQZm5oBRmlxzD1yhdaUzUrs+6iCHGRX4oYHuPm+
 fN9qkGm5WIyGUk4zChDdVPcCdZBIMSIw+bkyJF9GOiKrAPCAq9XKVmpKqRxoRlD9XUO+zl+JT+K
 ygMHXeSq/4IV/ZTxKpYpDIBx39Ucll+FOj/r4DwlZ0xPWmsWjnyGdr9fwH13yS7dTJuVyNTtCRU
 yOQzATbBPrINqSBBQS6amMn1BlLzLvTQ+CeuxFNcoOaXgaFMxHS8DdClS4xhuHKYqBJfnR24v2F
 gtEDc=
X-Google-Smtp-Source: AGHT+IFI1CYF1RjqLrj9pyfCPTuENQFSCI2jbbkicrqoy+xn+dMCZCiztiECykRmwOOLlfNeak/TSw==
X-Received: by 2002:a05:6000:4186:b0:3a5:527b:64c6 with SMTP id
 ffacd0b85a97d-3b5f18565fcmr7127851f8f.1.1752355537208; 
 Sat, 12 Jul 2025 14:25:37 -0700 (PDT)
Received: from [192.168.1.117] (lfbn-mon-1-970-120.w86-227.abo.wanadoo.fr.
 [86.227.5.120]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d719sm8243181f8f.54.2025.07.12.14.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jul 2025 14:25:36 -0700 (PDT)
Message-ID: <9708e71f-9441-4d22-b9c5-0d550615fc30@linaro.org>
Date: Sat, 12 Jul 2025 23:25:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] target/arm: Introduce get_phys_addr_for_at
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250711224915.62369-1-richard.henderson@linaro.org>
 <20250711224915.62369-5-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250711224915.62369-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 12/7/25 00:49, Richard Henderson wrote:
> Rename get_phys_addr_with_space_nogpc for its only
> caller, do_ats_write.  Drop the MemOp memop argument
> as it doesn't make sense in the new context.  Replace
> the access_type parameter with prot_check.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h     | 18 +++++++-----------
>   target/arm/ptw.c           | 21 ++++++++++++++-------
>   target/arm/tcg/cpregs-at.c | 11 ++---------
>   3 files changed, 23 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3351BC87FCE
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 16:47:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufLZK-0001N6-Fb; Fri, 25 Jul 2025 12:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufLZJ-0001MV-NY
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 12:46:49 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufLZH-0007mZ-Ui
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 12:46:49 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7490acf57b9so1736989b3a.2
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 09:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753462006; x=1754066806; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BAxqerVC4EqnCfTP/KWr8tsu58fPn536wCloR/aHCng=;
 b=Ld5cJ4S1ekC08ND3r+xShVFnAdbH00+EzXWK7x2aWzOziUy1aaR8VZ1KXc5ZzYlep8
 JkCoPjVH++IXyNebWLK0Q1N5jIHoJcB/GEKMKC0Bwuesu8v3ebdsD9qd6wnRRGb1rHeE
 0wrU+IAH+a5veLHIeQXbtSoVGZDio8Rg8FeXqWMZfyVPlv7wk0/6rGqUl9jJmN1fW38s
 cuNrXR+reDDMa4wjNDOJkA7Wa6lYJhPeJ1IeajFy1ImYeBTQftKvChopYh2NVj9K2Nvf
 uDmAth/rxV+M9Sx4YIFT55e0Av4+CPVuwYgFKYuHAOI3hZnoBQXiCqrlbC5Z0WceV9wp
 PG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753462006; x=1754066806;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BAxqerVC4EqnCfTP/KWr8tsu58fPn536wCloR/aHCng=;
 b=suBsGngz6fEbVd6yhhDVxI4UTdQI7gzndz4v4+nmAnS2QG3w5jhY0+zomG1zGCLKiO
 ubnS9s37lWsGcjCPwSjCF0A8I7/PEYbRS3oEz2Ov4rvYkAC2QYy3pa02vEdJVkPF/67f
 RxjprG04tq4fXuyzwdL9JKQ3HsOX21MsO68+m5izCZX6bn+aVMTp1BnOdkEukSP8HQyZ
 dk2iz0hcjTq86nZzXzeAQ8ECTgR/pA+tyhN64z4+jJ45PUfzfH+jy6ESwQskstZ9Dh8z
 FX8BEZlqixATsYiZILBbZm30nTts1ReMH6r/v3JDopyPSiLiObzGcl2hIpA3mkGYw0oB
 mTww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd2/tBwUx5dN4wPiYq/kMi5BOjm97NLLNskD4mXJuNKQvDupUAHkOw88ycLMJ/EJKCewV6hSqoUg==@nongnu.org
X-Gm-Message-State: AOJu0Yy/BTzqKSonjZ9nsUpd/bYwEoHMguIK30IXibI+Y3yV8+KCpICX
 nS43MUaD6JiJ766LG8TgvGMB0D3uDQd68TOzifm6dLEfKwhxO63yYKNrx4bhDi72lS8=
X-Gm-Gg: ASbGncssGYX7wq+Xtm9IcpPC8EUjW1vcauF9ap/iTHjmev9JfoItT8+6TxImCxknNa2
 nx2Tb3JC6fmnuQ+TPPFOSFy2Orc4dEuR6LPq4JV3IvkVERYY940bbz6j18ZkEXEaM3/yvUdz7L4
 9k7UsuB8RQOnFoKNB25ETuQ3l157Oi/ZGYsdyrM+JsyBKLbUCtnYRTCMDy5Gihob1kOrIzEQpc8
 bQXdDZYe5bubpruCfcn1nmNcXh/vW6MT1tuW3abCRgOILT/6IOvuf2nFo/9MmWBXWykYeuY7dYh
 ELKIdCPtIEgj5RihWvhWU7vHO+Bg9EEh5t5nUWvQ/xGzPZVVmnUhYqwZtvHUAU6SxSWr6eqwFh+
 49nQLd/BXARgjHiX+LoaEynvTQnM7ACKpk7ec0+QYFig5TDvgPd1ahdqW9hIB2IT1G1j/TQBm+W
 4hMA==
X-Google-Smtp-Source: AGHT+IHsB4gST/hazShvbATqvfVKOxqQO5Sx5qIX2L/eohoa/VwQhtI7CfbhLFedNmFK7n9JpNoXTQ==
X-Received: by 2002:a05:6a20:7285:b0:215:df90:b298 with SMTP id
 adf61e73a8af0-23d7015a371mr4381918637.26.1753462006465; 
 Fri, 25 Jul 2025 09:46:46 -0700 (PDT)
Received: from [192.168.4.112] (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f67d84esm190985a12.42.2025.07.25.09.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 09:46:45 -0700 (PDT)
Message-ID: <0b0882e6-906e-4a76-98cf-91c9284c4a52@linaro.org>
Date: Fri, 25 Jul 2025 06:46:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 1/3] linux-user/aarch64: Clear TPIDR2_EL0 when
 delivering signals
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20250725142240.3760452-1-peter.maydell@linaro.org>
 <20250725142240.3760452-2-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250725142240.3760452-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 7/25/25 04:22, Peter Maydell wrote:
> A recent change to the kernel (Linux commit b376108e1f88
> "arm64/fpsimd: signal: Clear TPIDR2 when delivering signals") updated
> the signal-handler entry code to always clear TPIDR2_EL0.

Ah, I missed seeing that.

>       /* Invoke the signal handler with both SM and ZA disabled. */
>       aarch64_set_svcr(env, 0, R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
> +    if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
> +        env->cp15.tpidr2_el0 = 0;
> +    }

You can omit the IF and unconditionally clear the memory.


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


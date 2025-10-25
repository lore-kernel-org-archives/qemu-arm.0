Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EACCCD1BF
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Oct 2025 17:29:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCi4e-0003lA-7p; Sat, 25 Oct 2025 13:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vCi4c-0003kI-Dl
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 13:29:02 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vCi4Z-0004Us-Ma
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 13:29:01 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b6d2f5c0e8eso652162266b.3
 for <qemu-arm@nongnu.org>; Sat, 25 Oct 2025 10:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761413336; x=1762018136; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i8uNBJOD2BFm4Sw4IakR1TgSuUcxXiAz4M+GTDdgdUM=;
 b=m66/eypEqJCVo9vxtqeE8BAKG3FMKc8lX/eP1out28fQdjA6jUSfjU9Y9w8mT2P06b
 8gqfHmZZ3TIQlnGapKOEDPeisr0Mvan1iP3OfWxoYIDcJTDxKNfivXyjnU9rB4CHJ4df
 uQV3Q7Wb1OwTHI7j+qOOeBtcjzewp4GjtPd4jWFunnPz+pWfKWilWK4RX7bOhe61POUN
 iX+PN5qWIs9YA4jiRZb2t9hz9o+mf7vlXpL3wj5CevM9KC/BK34zcg9QYIOxgtExjy2F
 lSAckJ/5LinZoN97i/PhLJ+HzMCoT7XF+1NFl0fhiBG32Q1NPHDw+6+76PKkfQvVNvFZ
 8ZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761413336; x=1762018136;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i8uNBJOD2BFm4Sw4IakR1TgSuUcxXiAz4M+GTDdgdUM=;
 b=f6k4CrIxvji5ZrRnJAqMvco59TkREtIeNsQlb0Yp+vB2pEOqOWglgLzJsF933ylpUh
 03ufDWgo3R5SMIqz6NYi5DbU6m4tFdm1k1maF1hDLHq6ZRt8or0MV1zJ2kbD4uI6Hcl5
 w9aDvjTFCf7FSEtQmJE8cWbg0NGDuMBP0dtj8AssqFMsO5Awa2aJTzRTadA6FFI1EIHx
 7//5LOOqTUlMBJToHbtnBYR3YOhm/1y1fbyYGVkGAwzxMEvranVBQwpmt0mJuYJuW8NP
 4URk+1FeVam9HdwGQ5byuE0ouWqRdE32Sy3CjcDAcjqHY4A26Fx1/9py3wQbcO6nXQf1
 QDmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA1hz+9iSHiNmBrE6N8tomgYChqC/PTjBkz+C7yOz/obHCXPWdk+1AAnC4lJ2wDyGrMteWMTUGSw==@nongnu.org
X-Gm-Message-State: AOJu0Yw/E2chB5JNIlFc9F5IMbburfTNf02AjOAg6+i55HMvW925A1w3
 PSJrKsZ4+zxfYKL97uRtM1tb/nDJ3Stb5axpsqcn3u2mlPHLX05JxXfbEsTO9aoH8Lc=
X-Gm-Gg: ASbGncs7XeXfalGPw7e3P30KMWu6zoxiFXSnN0+jXJWGx8I9cCieEyuzS0hQoCUJn/T
 q4CGPVY2eZKETHfpANvMGDGsih8aLP/B6DMvhP+SY8Wmemp+aYtzy165or8izHu9t2wxqMDNe7v
 LW/RrpREmEcKRcsP2MAk4fwFkOrDD6fxI3JeZHpZ4JcrRykXfxuoG2MDzkONsIYZ6ilAhqeovX5
 yZ8p4ooNDsxptlgK8UUlpXF1VooQylMUyf6O1+cYEGvOlM+SMlRfWpBZvKzpmplAXLgaaqLkIlv
 fUKrA4l09bj99819QntYqbB6wxM5zuvmHGwlvzkAoBgHHwbP/ypBJUrlUkezbRypabgYME67MMD
 VhrximvMyKakdb1TlQSpV+RtHmygDv9Y3rMnOrk0su9F9xpwHHMuBxMnmvUDwd3Gr1+WwqX1Dra
 Isx9xbSOxUtmbFKNfQjbl5y5/id2ethtrwzFvc5gZhUaBC4R6czJ8tgQUW37NSyx09bjon3bJa4
 Q==
X-Google-Smtp-Source: AGHT+IGy9ZxytPWIMuBckxQJ8oSqCLWMqYUmlGMfB58x2kQNcPs+huJBsZr39MSgOuxjm2jG+9EZIQ==
X-Received: by 2002:a17:906:d54f:b0:b43:b7ec:b8a1 with SMTP id
 a640c23a62f3a-b6d51b0df0fmr1091063766b.24.1761413336477; 
 Sat, 25 Oct 2025 10:28:56 -0700 (PDT)
Received: from [10.240.88.227] (ip-037-024-071-028.um08.pools.vodafone-ip.de.
 [37.24.71.28]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d854395absm253098066b.62.2025.10.25.10.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Oct 2025 10:28:56 -0700 (PDT)
Message-ID: <a6daac4e-ef32-4ce6-a5f7-ff8f362f0d34@linaro.org>
Date: Sat, 25 Oct 2025 19:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/58] target/arm: Re-use arm_is_psci_call() in HVF
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20251023114638.5667-1-philmd@linaro.org>
 <20251023115311.6944-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251023115311.6944-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
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

On 10/23/25 13:52, Philippe Mathieu-Daudé wrote:
> Re-use arm_is_psci_call() instead of open-coding it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFD2C87FD2
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:55:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbFc-0004x8-Ng; Thu, 31 Jul 2025 17:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhb69-0005pd-7W
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:46:02 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhb67-0002Ed-Lg
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:46:00 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-76bc61152d8so1483747b3a.2
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753998358; x=1754603158; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yxtyRx8fKsPdu8DhCd389O0kPv+3onLsP51LDCsy6hk=;
 b=snVoZrhiIiXoYYBc1hwFSeew7GM3J8wgRuC+xbShZl65G98oAZd/MHqIVkddPz9ruK
 uh9W3VNlXAp8QO2Jz44KL30vE/mvjjZfZOOxxP1dihUQwB5hiSQZm9qV4zQbcNnmJ7A0
 OKM8YhMaxjKM49SMC+EW4XqW7b4z+nphwXR4P5yZXsWKmURtkGsv2fs6poxghO9l3HxM
 aM6U9CNEVVq0bfaIQEDXn08+q11ml0knHdpSkNfzgVyNSI5zoOT9cj7+de3KVoT4FDO6
 IvYoRaPVTEEcU5/XzBM53ZKp3/52RmOV7nmCE04fyAW9WonfofiuyJyLOPCUp1ryc+Y1
 zAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753998358; x=1754603158;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yxtyRx8fKsPdu8DhCd389O0kPv+3onLsP51LDCsy6hk=;
 b=mRzQlSq7bq3NpUFW3xZHJALAypFPljCpIP0iYGeJaH1DOoGEfM+UTaMXK0CGr7E/ja
 uBDMRNYEz/TAED6bEyrLBg8e9mILfLhB21HiUOiG7EWebrfj/NaFBTSO0MfZEerD/kZ3
 J6/busR8cjAQj1elFQYqklIOrl1R+ddIzz+YxZhdaEAotCL0dpSb+SOekEcEYv3W06el
 vSYgI8gQkq5dWRf2mAeGc0HC/qj4hceHk2pVlE9lC097MO3U9b1fg1FEdYptr6JAYCDu
 mGMWv84B5BACCR/iCO5UwHopLVBTMmwdveHlePoCuZ4T/sDDVWz/51Sw1iz4cdckqoXa
 1stg==
X-Gm-Message-State: AOJu0Ywuzagvz2hZox/zsCeSk/K9owbC1indw2InhUGuVMjqqzX0kWkR
 evWhb+J3j+/p66VbongBJfVEqyawLLid9ayCvC3oWtWEgKuJX7TufqVfzpIk4IhIduE=
X-Gm-Gg: ASbGnctONSpEfW2mG0JDruCMYFrPOsnkSPg8oBchGIkvso/NgoLol219uiWpOGWV1K5
 szxnYRQWhADjhIF4iYhkn5WCncMVqn0m/qQ0aAeP8flkrk79dFQ/JZhwtoxN/1HuN47n4qjwfZt
 P8Tn7iCPaokpmOj4oxVfXvthn44qD0Y87knYLf1g50bi58xCqhV8vqQz1h6QcGGgwbWZBjwJd84
 PHnYv5tD7Y5XqJUa6IL/kRZsfEch3IxeIjdMMOefQ6KQq3iEANyUKBx6S0uHIruObC5mykVgxlc
 nqR41XzcetPNNGSH3+M76aJHDLyUhMFD6RIQ7rks2gDmm+9hIakh4zhoWRKs9rp1ieXVkb5CAka
 r2hsfGWks2Zl0qEbqDC7V9ysyWPGBr3bPRfI=
X-Google-Smtp-Source: AGHT+IHqljx4q9Kx5rFufwrnf7pJwVO3YvKGTR6Rfz7PA8+8U/fYQn9YuZc1kx8eXDq7ahwMri5u4w==
X-Received: by 2002:a05:6a00:3981:b0:748:de24:1ad4 with SMTP id
 d2e1a72fcca58-76ab3067e9dmr12176170b3a.17.1753998358075; 
 Thu, 31 Jul 2025 14:45:58 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce8a838sm2486926b3a.32.2025.07.31.14.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:45:57 -0700 (PDT)
Message-ID: <de6fbd09-1c98-4f9a-8448-bfe1c171a152@linaro.org>
Date: Thu, 31 Jul 2025 14:45:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 63/82] target/arm: Add gcs record for BL
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-64-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-64-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42d.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>



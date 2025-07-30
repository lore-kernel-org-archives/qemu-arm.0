Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18831C87FC9
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:16:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhEAF-0003Sc-4F; Wed, 30 Jul 2025 17:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhE1J-0006H1-4n
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:07:30 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhE1G-0005oH-2Y
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:07:28 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-76bc5e68e26so353423b3a.0
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 14:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753909642; x=1754514442; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MR9fnJrcf5LYRap2O4RxYL9PFRGccXHyVg2jjgHuz7o=;
 b=WU2RxgYQxs+o8pgwYpatxbfaDY4IxqGW1Si+89t0si0NzMMUnWzUaZv+DvGSYyVWhc
 jBSMrsrSVCEmvP/Q2MS0hpXaDXuTXsfSjBILEpUJcmwuYRsV70Enn6Nyc1Hqdto226Xj
 ubBOrMShjCfXeY/epoDIKrE72FUH4XqP+9xt/l5DTBDoUqSIob3c0DvkG1K5GFDaObSf
 L14JJiBmFjk+wq+wURQ1AiW50G+ECe3VWg6GuFP2Bzy+J9b5pAvsX01mq+AyFvuZvDYT
 aaDhjFTgLHm5fITxh5RQrRdGrCHeNBAqp7xjidoB5s2ReN5oagmx8qLrJlpiL0e0wf4B
 OSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753909642; x=1754514442;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MR9fnJrcf5LYRap2O4RxYL9PFRGccXHyVg2jjgHuz7o=;
 b=XfJYeOnaKlu1ktGlj7Bw80VpxjE0v2NndPChV3czmD6ojnUiURAg0XMaLaDucM7S84
 XrU9lAY/yXUBQ/aPfuFxCkFhX7+wOXg+fDlGZJq4XVxYW4r4TEHRARFQUuLolelkPWNk
 USqnewt5bn/Lud6rUizcaISKB2kRO8+ydMrNjwoTS72sLwgZuCnTPwElCXzGMWFrkrh4
 FMN3nsDFabKntR2MTirbmJvRNT1Qx0uV4J8LwBjisR81jw12sAO1JShn45+FC78IPLLA
 jht9TVhrCex85D/YnjTb9BxAP6nKqI37CmUUVNEIX7g8qN1czOeen2aLP0KJM+bSpScY
 TG8Q==
X-Gm-Message-State: AOJu0Yxp431/vJVGZ/MCgbcDY+76EgYgeEbRVdKxZk37j8v6IhoPp+Ai
 oEiv54LrKKAX03DSRqll3gZR3dHIpyebWb+fgaMm4lL7njSZTlWVGfRCqOP4tdBXoZf95FhJR7d
 XzFLY
X-Gm-Gg: ASbGnctnf9lkc2uhZnbt7dcWY0m1eeX/yjNf+Tg89tBfFKc7SYBrUegO4qMKNiMJVng
 gxapD1WxAjYlN7+eke7eSV/ZnY4LK0I30XXQOOi4D3Ug85PM+ojKAgnYUaz4jStmO5p5dGHH0C1
 7DFZNfL/xj6/nDkkzz7w8yQWZYs4i+2HyFz7QJLKBzYSOgnsqx13KOGsKkHYgqpAuAjw7Kuzkka
 N+ceJWkq4K1wl4JagMW4cHVvRY0EBqHE/bT1EtyENJIk2x4/ECFya97p8rNqFMbOhh3KLF4V/jJ
 4y3xqBr1RhcgjTk7wImFYVjC/7pjepy/3mmJcujXrbq4fGqTXWjx+J9yp+w/d0tdPDuQAzuNjeE
 +N7NRNL8vH4RVzTx9u09k3ty42WdrqefcVzE=
X-Google-Smtp-Source: AGHT+IGiaMOln2OaB1DjP4Rl+Ua4s2rBYpW4C7aEH0ItEXJFUhECYf8QD3qUZpq6qr9VORadPs8Qfg==
X-Received: by 2002:a17:902:ebc7:b0:240:8cdf:f933 with SMTP id
 d9443c01a7336-24096a9dd25mr68415675ad.22.1753909642117; 
 Wed, 30 Jul 2025 14:07:22 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899b783sm321505ad.133.2025.07.30.14.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 14:07:21 -0700 (PDT)
Message-ID: <b3be00a4-9a7b-403d-a1fe-b10764502888@linaro.org>
Date: Wed, 30 Jul 2025 14:07:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/82] target/arm: Split out mmuidx.h from cpu.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-30-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x436.google.com
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
>   target/arm/cpu.h    | 207 +-----------------------------------------
>   target/arm/mmuidx.h | 216 ++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 217 insertions(+), 206 deletions(-)
>   create mode 100644 target/arm/mmuidx.h

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>



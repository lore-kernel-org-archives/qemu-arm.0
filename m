Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1840CCAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 13:28:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1m0t-0002HP-R8; Thu, 25 Sep 2025 09:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1m0c-00028V-7c
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 09:27:52 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1m0O-00042c-Ua
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 09:27:33 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so9694005e9.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 06:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758806842; x=1759411642; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NjMPQE377yWC4BwZprcuIrqn9Y8wpLi9x+QBGTW/6Sg=;
 b=x49s5KrzHg670rfu0xaiiMXiANVDLAEPQ6A86iU2xxUbFq9CY6yRpxoH63o5THfYKo
 nT5ZW6wcKFB3ZG1oT+PSZvPEBakxdN/zjFUxN3WReuemhUqtnH2CFpomvCgcrnbbT8mH
 xcM4gVWQu/x3KmtKOdq5D3JDSzI72pKsb5lCpsoj5g7l7psYHwyZd/zq8UuymMjwCXwU
 tASd9VDsjVbzXejyEhBxoxsUb0m0Q0zgZRD90K6LcWVMZjyfsXd7tf0p8KAkcmo7MSTq
 93wyDl3bXj4fB2/rogrHDEDfa+GQvZoTQJbpNVlI7a5IygSrafiLlTu0Q4BmI/Y5zd2X
 QoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758806842; x=1759411642;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NjMPQE377yWC4BwZprcuIrqn9Y8wpLi9x+QBGTW/6Sg=;
 b=IF2xz0cP90i8v0vzljwYuK6lF5Bp8ZyCiCTjFS3GLArEH1BHTDU9XvfinxN+70b2So
 bLLGTkiA6l5+bxgQ82BgO/M/GXelLCP41kRr0zgX2cWrk9cWQ66TLAVl9Q0PLT7uDjuM
 fudw00p2RMzc8x0L52Rb3xxHepc2K0h+Do6VBA+eqCJPw/Ph0kRQVe9EPygjF1fvL+5X
 aZGZYLS5BKYjm6KAeW1YBuUK/CWDcho9c8a2viH1059NDj4U8RSWOPQasMWJUxH1P8eU
 OF/SSHSoOVFE9IgpyMfsraxGSsxxKzi67z2pxwE4VWnxA8WjqzvaQcZ34H6af9OgSPmh
 6Cnw==
X-Gm-Message-State: AOJu0YxzaNYqT/ruO5Nq/PR6Oql8p7L+MHy8rZDvADmRFGOPOHX5tJpq
 scLtUp/bkDzJWkdx6V0OEjhl7jHLQBy1yYQ6xNh2wBbeqiXHFm068PHl8zHsA6+OJJQ=
X-Gm-Gg: ASbGncv1HnkYPgKAOiN7kVc93i30rJf0MGVZ7/hPUWS4m3w9UKLicuXe5Qt8rMX9bxg
 HalM8+iTaVMqLM1Q3/P8QU1gNMA4jJYx+v5jQNt0SnrlwCaOgxtQ3P6iiNe9coXCwXWPC44+xl4
 jEqhV9aszplWVLsQHLhprKGJEpRi5W1fgcJyuRf9kcSaxO6QAJmS9AGSM+ZOu3KIIJ1YFUCe+hh
 k9xGJ4T2qgvRpYOImr1aBttduLqpBABH+HEpTyZdV58ffjBXraAwkz8xdmMV0RMYFqPP/JNktr6
 5WqgziVlUIG0A7y3CaUHoKzWPbrt0Hsu5EoEg3RSJ5OC4K3SYuNB/vxPONBkMI5j/9NK4MFaDe9
 RP4pQmZBA4X0tvKFTti3YFmdjgid0iGj/ZIwyBkqbNC74iPFceFgiCN+bPVRJXu2BQw==
X-Google-Smtp-Source: AGHT+IHepAVNDYnXo+HoiFAVGkMxexzv2w/1SL4VQcKgBX0N/MySC4a1fq2OrNmSIhe8+cIJK50CQQ==
X-Received: by 2002:a05:600c:8b65:b0:46e:36f8:1eb7 with SMTP id
 5b1f17b1804b1-46e36f81fbamr22679275e9.10.1758806842258; 
 Thu, 25 Sep 2025 06:27:22 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e32bd164fsm18956365e9.1.2025.09.25.06.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 06:27:21 -0700 (PDT)
Message-ID: <f6585a63-a32b-4a8a-aeab-ddb68ab3bc87@linaro.org>
Date: Thu, 25 Sep 2025 15:27:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/36] target/arm: Move cpreg elimination to
 define_one_arm_cp_reg
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 16/9/25 16:22, Richard Henderson wrote:
> Eliminate unused registers earlier, so that by the time we
> arrive in add_cpreg_to_hashtable we never skip.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 123 +++++++++++++++++++++++---------------------
>   1 file changed, 64 insertions(+), 59 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>



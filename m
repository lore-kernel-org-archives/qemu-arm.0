Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D5DC87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:07:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhE09-0003uY-7L; Wed, 30 Jul 2025 17:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDkd-0004OU-Ey
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:50:15 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDka-0001iK-3K
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:50:14 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-75001b1bd76so153567b3a.2
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753908610; x=1754513410; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oim56ltJo3UqPI4TgWyi80sLMI+ePqNjeE9BD3Ds0HI=;
 b=MHxJSxq2l4sGcupxiU/TYYsJjM8E5bgh9ihhJ8LbHREKJAlczqo1eH9ApemqW5wgtm
 UgbzM8PInCEsje3solCquuGlK+Qj/xFt69TtP9a/3jALCuFoBntNT5bPr/RTOcBRuzn9
 NbqqGLxojUl+HKsIXTbygTcKoDh6Ze1tk47HEhPhjEgR62uH8J+jV7nF7gztjqH9y0XQ
 1/FJy7CNi008XLiLcYwUbZujgx0ULhR8KgjkGIzHlCy+fJ9EFsygGHrhtzk4j9qGq4Jn
 9d239e9p6vkcMq4kriMepsKihJU+bUW6kOfKxU84NWREaG08HhsxDMtjOgHBxXast6ZL
 A+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753908610; x=1754513410;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oim56ltJo3UqPI4TgWyi80sLMI+ePqNjeE9BD3Ds0HI=;
 b=fIPaGqmsXCxd7OZlcPuMcXDvr6dhdY5honY9BerggW5wZgHyyyvVv7RxY7hjEHw73b
 mGu0DLSHUxqpAGm0DBPFmEYi6T6w87suibPvHkzeLALMkYm6HLXUCcMJ5sXc9a+VK38w
 8je6ChkjeU2znQpz8yZnpMd22Khn7jRZijD/oxpvIZnYyYmT9D/E9s5H0Gp4DviGj8Ll
 bh9Szd145kVlOfEsUAhcVGpyhdn0j0if0B8RNynTeowMcnfIfXTjpy+UyYIofrjM9V88
 WifbqrxA3F3BN1jAaEPlFg7ZoNBTnCI6jbo/weyl5Q/wTp0z+4NAU85w6WXO9B+V65F2
 QdZg==
X-Gm-Message-State: AOJu0Ywt6iFg+jXDrgbHqFzzkI+jRoRpvFrQ0YdsFX5dxTm0TlHGLf9C
 lPdxvHnkuiws09pgV+d3MR2lTrlduX1kD8UzoxQZM9k2ktRqFuG6OZjhARxH97tvYAs=
X-Gm-Gg: ASbGncvpXkXXF09gjOpzCHEqEmt1E1jLvQciA2rG4Nkmf5B6zgZy7ptzzwctrMjZtIb
 TSe0+oSjMIjga+dZWZnjM1x4LksCMw10PGqpOeWgdVmPWx9/qgX5pERfHh3nFfFVrvz2iJtGie6
 jrulWPuueoKyWW9rW4p2FKgpMjfj0Rhv4I+LzS5StBSlEQ0SzRE2p47BuGAkmYx30aL+ST2aMl+
 ycLdZPJqSe6PYncpIEwVEWiPmBrOLyKLae48/R8VluHwPdSTvJeBnaV5xuqthUwsiZ8BhRUfg+I
 SWgFzDehfv5J4HB4P7o5N7z0tGI6ujlBsiRtChgfOuZAl94lms5tDr3tH33wQqgiwQNHPMsxPSX
 2KDJuSaqLFMZ6DQwgiFlp4haAiY0ts4V3+Z6arCCYPyMKQA==
X-Google-Smtp-Source: AGHT+IFP4M6kcfMsXU5TBlwmI23ut8DHF8iB6wobS9ADpRFV+Xg08bpCZcF/AGCrJVPU2crTof0u/g==
X-Received: by 2002:a05:6a00:7082:b0:73e:23be:11fc with SMTP id
 d2e1a72fcca58-76ab32f4c0emr5930988b3a.22.1753908610117; 
 Wed, 30 Jul 2025 13:50:10 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640b2dcdb4sm11333987b3a.100.2025.07.30.13.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:50:09 -0700 (PDT)
Message-ID: <3def01b8-022f-493e-bdcc-f6936b543573@linaro.org>
Date: Wed, 30 Jul 2025 13:50:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/82] target/arm: Implement dirtybit check for PIE
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-22-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42f.google.com
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

On 7/27/25 1:01 AM, Richard Henderson wrote:
> Both S1PIE and S2PIE have a bit to make software tracking
> of dirty pages easier.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h      |  1 +
>   target/arm/ptw.c            | 16 ++++++++++++++++
>   target/arm/tcg/tlb_helper.c | 12 +++++++++---
>   3 files changed, 26 insertions(+), 3 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>



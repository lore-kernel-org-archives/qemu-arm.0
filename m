Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE5DC87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:37:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhaxf-0005wL-G3; Thu, 31 Jul 2025 17:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhadA-0000CM-Ay
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:16:04 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhad7-0005l5-QY
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:16:03 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-31f4e49dca0so972244a91.1
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753996560; x=1754601360; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CmqTCUe96iESu0bw2yjw9CPAjvn6DZyZjgJveiBW7yI=;
 b=MWA/P0wuHfzwi6YYPXB1ZvmGD/wUv79LrArPC0OmSfGl/D6Gy0hF/Dt+pW1NiTX6mW
 WBZcVOzP41RRqG+3YdaqIR58PT1cho23UCtx21yF6zwFScWVDIqDoHa/zttDA6wIYd7q
 Xtpqgg21KCmduj7pmuhqcWVLxisKzv7SLLAdNczJb4amu6rV9JSONoyj/7K4OVLL789I
 ezA0NJPpNQoUez1z69s0q6jHG7XFKh8KiWKYPfZwWrX4i7lXgpy3x1ElHYOSgBhGXAf9
 54M8ldaaFu20RTrLRkWazJu7miES9AErkhoOkgjb1XcZhU7AgwcuwLIDL1YYbHqN6J0P
 fPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753996560; x=1754601360;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CmqTCUe96iESu0bw2yjw9CPAjvn6DZyZjgJveiBW7yI=;
 b=eN2Rc9XKOyVgK5ZOloVIJmvUZ4VxKqQ2GrhoEIZvwYS4ZMeV2mNPQ266C05fc5Zveu
 TSHsux0R08GalC+BoiuAMo6JDzlQZep00SPzp+h+Gag8yWJRqVq5VB+Rbzyra7Sh2f1z
 ajSre/kd/c3qk7O4FdtgJajt9kmlwCIupvMWl9lJ8eQGKuJccVbhiZflaKCtljeyl9to
 3uoQF1y0IDR+b3X6sjPxcw2FtqF8xzXmlWATgMylmIiShbRAsUMrQ/CRD2HBGTzMWBAy
 HcsKKmqi8CG9hlj3RsOjKk5KCGPwj6/RsF0imKU7sS37qJp6fBkVKWjxKj/hAOnU3/rP
 YTMg==
X-Gm-Message-State: AOJu0YwEI6Ep9UDXcSzUQJNVXnattRiza2804uy9c3jPOnCQ8mS+Lf6Z
 ZIAUV9wbcG4jLMONeV9wLAootD+s6XApOPo0UThXQ4Ho0kMQR824JbFwy0xw6JRqZ+U=
X-Gm-Gg: ASbGnctr6VFkiU2SsOVGiiVzM6xPEHn0FfULckg6HqxKy+AMuDn29Ih5wR20NMrvQK2
 mFmbKZGeIixCXpWpYjndl3JI0aOv2c9nSF7LktWUulcQtL7k9lMcL03wO76e9bmaqtTqnL+jD4X
 B/aicP9JphFxPDldjDvhkH8UEXkbAS9o1h+uE5UVtZhSwjwbbjs83zND2YUNZEALVWcQB6+Y8J0
 Bf8Q1+jAwpfa80OwIT/fxQiwIcuXnnSVqct4mFsJlCWwiztj3MbtYIAAMkw6LHUDZlS076K4wFy
 72aDLYbq9641w4IFZ2e4HAVzax78jVJBto/+QQvB22ifeUUERsmgQaPc5tiXou15YJN5058MGR0
 wgIT9acMqDKP7U8OJa/nE0ehg6dDOpN/3kK0=
X-Google-Smtp-Source: AGHT+IHcJgvUA6TDFb+y1YoFc8PSr2OHzUbFTvXWwYiXhDz0GOxI7JDquXCSqLbDOOJLEpKTPvg6LQ==
X-Received: by 2002:a17:90b:4c8c:b0:31f:762c:bc40 with SMTP id
 98e67ed59e1d1-320fbc0ad60mr478332a91.16.1753996557795; 
 Thu, 31 Jul 2025 14:15:57 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63ee49e0sm5558504a91.24.2025.07.31.14.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:15:57 -0700 (PDT)
Message-ID: <73ebca7f-570e-4627-8813-04a82871b5c6@linaro.org>
Date: Thu, 31 Jul 2025 14:15:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/82] target/arm: Implement get_S1prot_indirect
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-17-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102b.google.com
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
> This approximately corresponds to AArch64.S1IndirectBasePermissions
> and the tail of AArch64.S1ComputePermissions which applies WXN.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 169 +++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 143 insertions(+), 26 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>



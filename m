Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED52606A31B
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WrG2V+4Y
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJXfx-0007bV-4s; Wed, 21 Oct 2026 10:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xJXfo-0007Pw-1v
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 10:52:12 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xJXfm-0004uX-DX
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 10:52:11 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a1e3098ee2so9716555e9.3
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 07:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792594329; x=1793199129; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZQ/gvW9E7zS89ibjEbHB8l6zBjuQ5Vo1QKVfx9fO4Us=;
 b=WrG2V+4YlgVpgw/o6gyqLNNeS64+u2omLWEj/fu1Nl8Sa83SBZ5fMy6J6wz/mVd68l
 FakUxjxKQ1+jOUwVT1wf1Fmt3cQ9hXshBm3WyxJrdYx3p9f512fhOLFetSPGNXKyzrhw
 3gmeLPWHT3TzwQpWuJTWy2ab7DURYul4GGmlAqABHy+SzCWxAwCOdPyAi8e/WnxjHW/G
 mcA/LVscnemrCJ3gliRha6qAu1R9JsEF8UQg2DwiwmP8NDWEpNX/j3eZfwmhfFf77CtP
 usvlWAhuq48+qODh33kR2UveWEdkC2oAwDqEOOBrLgbEVQ88sHbPOnWjZwPGkC9ZSdbO
 H3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792594329; x=1793199129;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=ZQ/gvW9E7zS89ibjEbHB8l6zBjuQ5Vo1QKVfx9fO4Us=;
 b=vlAp4M0UkurJKo7zbpuGIzD1lRR7lhvsVls/FkXYMAKvP+7cdCpY8d3yO1MF5bbpfZ
 wCXNL2iqlziR4zjmU4VrvzY4e4ZkQldvEZhPa6eEu67vvrGaILwF8Pw+kDjzUWxGY56z
 4xAjAORXSuYebqymsAn3lZQuPXFiQ4ZwodDkKFYSSXQQCsM8lrjSQYgLXElTO0Dutx9d
 lw1L3QSl8K59yhyjBsq/HScTiU8Euj8MiUrtLZqQzpVRTxI7NTk0iGh4bEFd9mEUJjVk
 0ef6BajYUpbfEBE9a2YrrKdT6TU3Mt9MI6vCTvF6Hm8gAP4zkpW7doAkeUYAbFRbrDdZ
 5JpA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwL5W30vGG3KqGtxUtZe5BuOjT7lBCT9fd7Xmg3I+RXV722LCXW0UOPvyq8G6BrMsuvtiQbhSx7wA==@nongnu.org
X-Gm-Message-State: AFq9FYIvEIw4ZmEY1hRs63D0waFAtEyi4Q4e0wNSOyO4o4rTgktw5GoI
 upJweDWJOlifOE+tJjRrvlhQjPlxPfi5PaRvqTrruRx/IoRC5U+48itQCtRWGi0awW+XlJP+7cJ
 GdDPy39k=
X-Gm-Gg: AYBFou3EdE75ITl157iqxqlscEkrqq1N2bzhApHEAZGWhEhML24tGUfYhxDcfl6irmN
 ya2Ojnj0SpsOY/xnSpaK9WRmeaabBVWDmNY1b1bR6NyHjrT6czZauccCRZ6L1yl0uxe90cUs8QV
 wHm6xnOyAK5HlFpHesL5OkpfpVjqUe01hEyb6Wkt+NjzUolNSvCaWgJ1u2DHNar6yuJQJCCm8N+
 qRq6tyKQ4LYF3j9nuDlqyfOo4YEDIxeO/QWmX5WieOC3KAoK7N/a8KjF3M84E3vBTVxkNL2CMxq
 0eXmU14uotIcksd40AMiHsUXZv0Hb2EBfgU7b7KZbw5rA3NKDZSAZIVWffW8iGXoyg097hnxlRJ
 V4OjK5dzplUcFaYpJW884icDiheLpZGp4gKBeVVq3x/92nV/KNZmnawZizzHNS/EJX68HNtVL+J
 PlFAFo7GWeu85plsKu8SmgZv/f8wDL02EmUh6cy4iiRmFq0xUrCgsMVeaABS9cSfeUGJ3P3eW7n
 tPa0BqH0n3bkR5lwHGwBZC/XeDEXz7xOW30aaHmklSQ6oZYKZecytO4+4TV3jSJFrhFnAjSbaou
 j1r476LKURicKdgZxbK6eoIRjzA+TieqlseGEYtZvvXeFet+
X-Received: by 2002:a05:600c:3512:b0:4a1:e00b:a0ea with SMTP id
 5b1f17b1804b1-4a1fd8a3fd3mr46266925e9.1.1792594328553; 
 Wed, 21 Oct 2026 07:52:08 -0700 (PDT)
Received: from [192.168.2.121] (pd95f64ec.dip0.t-ipconnect.de.
 [217.95.100.236]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e2581eedesm5466317f8f.14.2026.10.21.07.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 07:52:08 -0700 (PDT)
Message-ID: <8f7b0bf7-c239-46fc-a20c-a5cd43b27f90@linaro.org>
Date: Wed, 21 Oct 2026 16:52:06 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] hw/intc/arm_gicv5: Ignore low bits in
 L1_ISTE.L2_ADDR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260914160020.327787-1-peter.maydell@linaro.org>
 <20260914160020.327787-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260914160020.327787-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/14/26 18:00, Peter Maydell wrote:
> The GICv5 spec defines that an L2 IST is always aligned to its size,
> by stating that bits [N:0] of the address are 0 where
>      N = 11 + (2 * L2SZ)
> 
> We were missing this check, and only aligning by applying
> R_L1_ISTE_L2_ADDR_MASK, so we would only enforce 4K alignment even if
> the L2 IST was 16K or 64K.
> 
> Add the missing masking of low bits.  We already needed to calculate
> the number of bits needed to index each byte in the L2 table, so add
> it to the GICv5ISTConfig to save having to re-calculate it later.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c         | 6 ++++++
>   include/hw/intc/arm_gicv5.h | 1 +
>   2 files changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (unknown [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587D810F996C
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 18:37:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAXlB-0000Me-8v; Wed, 08 Apr 2026 14:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAXl9-0000GS-7t
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:36:15 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wADde-0002ro-Ps
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 17:07:12 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so40875595e9.2
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 14:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775596029; x=1776200829; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=To1wsQYa7oLh+wmEwOgnUuZiDPGmaSipqak66Gx34i0=;
 b=QDI+lu+c4ctQBk2PrY6a5tlHFEQVOZCs1VKrEgKW4E6r0etNyGoWykOLD6oWo2JnaP
 ro3hd+MVAVKStcZJqOd56j3n978avSKqiEjxQqjyKsosjirCOn51jz9nSr74Ton+6W0d
 x6zSfKYGWpG+CX7mrZlaP58BfaOPSYznZoialD67Pf6r188+f0HMXuVhsfQfq5EVphDu
 /++BJcpedneHmDpvR9Yt0+9TeoNPaxhNznrHgPJB8VoeffdjYHwSQSS2pRir5H7tR9Q/
 qjJUi3mh6vi8Xt6PSo2UPdkxMbV4fYle/nSZNe4gOChyMFfjKIeTxBKvDvZY2nS4/sF9
 pf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775596029; x=1776200829;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=To1wsQYa7oLh+wmEwOgnUuZiDPGmaSipqak66Gx34i0=;
 b=Exnq7KgFLnigXu0M4N86nXDRMsz9ulk9+O/zHL6UIUdPZ53DidIprorHZBlCLgIda/
 3SHiYUH9ELfCFTgQ2vJY3eBuuvc7XCxzXQ2NFl9ZnDz7lWV1z2Z4ZILp484v4Ue6DGZk
 cZlxsV0CYGMiBaFSnUZFPvgHwVTnKGHtOKI+gq/wCDpLD7oyHaHqc5l+I0GUdXFPhinx
 B7O/iTM1MUe+1qYGRQg1yuwckdtx0mi0+OuIxc5hIEMwAQtDXuQ9T6FFakjuQUFlA8lZ
 bLhkP6EDy+dCbucoYIFUP56T+pQQ6KszlRKKJoOXKr9xALqk0kzlRYttnzxq4SvrSJ9n
 zKtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWluULaV+ch6Bk4vidlqPKMaVAJWcypToYgO0z4S+nwnnCL62F2eMP8XhKCcpvBHzLDGsh1oRfHCQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywm+WmXtZPikJ+eW8avmdQpNjyjFY9VtqRbF4ZHQbNYiO6ErrUx
 QCQKfWGmlNnhUxCTHHWn/tUXt8VMfbjaZ6oA2Y/VJOra9VdxR27ing27eUO20Wzm/rY=
X-Gm-Gg: AeBDies1ObUTruvZ+d9AvmUhB6ogDyZU6KwdcGyTyO7Wq7nkHr2hTmjj+GpqANNduuw
 6vJXsCIf1BNp86xfeyJtO1f+bxWuLtgv2/QNGug3akU9/3duL5s79VmJOSBcC3j8qr3ggmvkmPS
 pA02JkOvUKFBEO/m+oz9iptx7nOmGwRbeOBVvPH+SjjhDYyanwudyAARaafbr5rFQBBIuOWszo9
 DtHwnSWHBUaYN++SkrMOoegdUaxEmgDu0uADVdWNBCGyGb19iT9CzEv2VF7hiSnO3h4QmSQA/8v
 ZYl+GvUuRS7xu1OhfA3nRpxiDkA03rXeu8txB8k08zatVoG4nUXEnIy0iXqITpVCD0KysLVQapr
 PO+lMjt3pEuATYe4ETOi9Ul9tCIadTRyasUJahwV9yk5LVZ60wS+UrlydLTHuLNXs5nGLwQ8e90
 XnqM2vMi/ITZ6SiRT3iotqclrHeKMezj9tMP8uc7VhjtcNYY6gyD3PI9fQv+YTm9GQnw==
X-Received: by 2002:a05:600c:621a:b0:488:b675:360f with SMTP id
 5b1f17b1804b1-488b6753785mr94597975e9.27.1775596029282; 
 Tue, 07 Apr 2026 14:07:09 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488be75215dsm80800575e9.6.2026.04.07.14.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 14:07:08 -0700 (PDT)
Message-ID: <0c72fdf4-bdb4-472f-aa79-3142c89b1e8e@linaro.org>
Date: Tue, 7 Apr 2026 23:07:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 17/21] target/arm/tcg/arm_ldst.h: merge in translate.c
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
 <20260407195922.196410-18-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407195922.196410-18-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 7/4/26 21:59, Pierrick Bouvier wrote:
> Only translate.c uses those functions, thus move them back to this file.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/arm_ldst.h  | 47 --------------------------------------
>   target/arm/tcg/translate.c | 22 +++++++++++++++++-
>   2 files changed, 21 insertions(+), 48 deletions(-)


> +/* Ditto, for a halfword (Thumb) instruction */
> +static uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
> +                              target_ulong addr, bool sctlr_b)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    /* In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
> +       within each word.  Undo that now.  */

Pre-existing and removed in the next patch, but in case you have to respin:

WARNING: Block comments use * on subsequent lines
#91: FILE: target/arm/tcg/translate.c:6289:
+    /* In big-endian (BE32) mode, adjacent Thumb instructions have been 
swapped
+       within each word.  Undo that now.  */

> +    if (sctlr_b) {
> +        addr ^= 2;
> +    }
> +#endif
> +    return translator_lduw_swap(env, s, addr, bswap_code(sctlr_b));
> +}


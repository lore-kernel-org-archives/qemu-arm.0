Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AD0CA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 06:23:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uliPx-0007PO-2P; Tue, 12 Aug 2025 02:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliPt-0007MQ-Hi
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:23:25 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliPl-0006h7-W3
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:23:25 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b7848df30cso3408140f8f.0
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 23:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754979791; x=1755584591; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H7Ojc/JWGyzuIMBoj+pXveycxEURggfRtQJ21MWqBic=;
 b=e9WSaPhp8bOr638+BATr7mvCFEFBqKdmvsU0c2SPiLUEjpFcz7p73QkYcKbWQviTeY
 t0hC6+JfqX3URvsO7VIGGxe1xd5N1nABtbFivKDscuMyz7cCMx8RIvC5+yBJktOJLiD1
 /3HlTMJLrlCliQyHlfgaa+nHNmbrzGikX9EByIfPPlBbH9EzGw+MotoyTbGJjOJH8jDv
 zokONgoD0g8wzpN+ovuowqCbg1rSQ6SAH29tkOGe7juRghRJ7gYW7l+1jaZMO8r4b+lx
 KmmgQSDp7j3fZGVzXmrIG+lKyB1THC8rRYirGpIScIKasPLOHt+9GjGDi/oDDXrHKlpd
 ayhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754979791; x=1755584591;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H7Ojc/JWGyzuIMBoj+pXveycxEURggfRtQJ21MWqBic=;
 b=hLaHBIbh/B5ZYW44+ucRsBG8xX/X5hEWuvtaSHIEm6gm8aztquj2idhXULmmrWx6TX
 bM5ppF3H5q4nnP7iCBENFwyLGdhjykMGYmR7P/Zn64MuyUKKKyasV4KwKDZEeYvKVqp5
 aBkaNIULm0T6sSAyvV3BTUftznCA0lWDLlNd7OBsdo2XiAZratMr1to7+wo0mvpPEub2
 QyCLMoYsr7yzf3gmd6M7RbU2A8vnH6cTV0f/bnlr2EipOt0hk/A61UA52QIWLMc+bQ+r
 2hWzI5JpsKw6la199jJxkPNpFI3jrvlS93tUeF2NGZfBSDipVHM468hC2jlVhd81RxRN
 Bh6g==
X-Gm-Message-State: AOJu0YzdEqht2waIwwPHobT/XOTUQ3MTXHl7eig3ZSmkZmIS+kTXCAwa
 sZ0LogpAqGuI9qWesTnYvkYZi/Ct52+nP2l1j8Eo8JeBoelmmU3Dj8+3qBa/CetRktU=
X-Gm-Gg: ASbGnctlCYQO5c71mPTrLj6YgCjZvaRKcGP6zyIx60MdF/e23NQzeSb+TIajm9L+Gi8
 GVxK7rTURPgLXXJhspr9oYN0rXiI1VLGXkbvMLaouM5a6A7+NqePmhF6WqS4ih+F1N9SX/cFQVa
 uKJPtnJ4cDjguG+Yt1rJGM/IgtBjZ1Wo8pxku/FZUVPIESn/iliYISFZgu+G7IseigUN2I+GBEj
 xNBUC80UXJmALSuMGHbN2DvGr3oaS2Uf6XbeiYGuapoUpkWiD2L9/dJ47bebULaKdbgdHwdMQo4
 GRDg8ot8URWf06nSMpvGibWpltOP9kcH9wWXp2I+ax3MrO+xx5JHK/41k6IGK6O44KGnVKxz29d
 +ZQlWIZAm6LFZ/kg8+/mVrZTtU2LqGH6MXFqwLwU1KJe0kFrflmL6E+0FuOFFA9FDZw==
X-Google-Smtp-Source: AGHT+IFseucO4iV9CSDNs1VGC6v94KWoTqs6Nck27Gx7AxyvdqI6+ucxA505SiqIz4ik90yijpg4zg==
X-Received: by 2002:a05:6000:400d:b0:3b7:590d:ac7d with SMTP id
 ffacd0b85a97d-3b911148b2amr1820464f8f.1.1754979791344; 
 Mon, 11 Aug 2025 23:23:11 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0846777sm33280954f8f.48.2025.08.11.23.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:23:10 -0700 (PDT)
Message-ID: <882e4862-058b-447b-b38c-c9dc4c92270a@linaro.org>
Date: Tue, 12 Aug 2025 08:23:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/85] include/hw/core/cpu: Invert the indexing into
 CPUTLBDescFast
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <20250802232953.413294-29-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250802232953.413294-29-richard.henderson@linaro.org>
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

On 3/8/25 01:28, Richard Henderson wrote:
> This array is within CPUNegativeOffsetState, which means the
> last element of the array has an offset from env with the
> smallest magnitude.  This can be encoded into fewer bits
> when generating TCG fast path memory references.
> 
> When we changed the NB_MMU_MODES to be a global constant,
> rather than a per-target value, we pessimized the code
> generated for targets which use only a few mmu indexes.
> By inverting the array index, we counteract that.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/core/cpu.h | 11 ++++++++++-
>   tcg/tcg.c             |  3 ++-
>   2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index bd835b07d5..23eb849a9b 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -594,9 +594,18 @@ static inline CPUArchState *cpu_env(CPUState *cpu)
>   }
>   
>   #ifdef CONFIG_TCG
> +/*
> + * Invert the index order of the CPUTLBDescFast array so that lower
> + * mmu_idx have offsets from env with smaller magnitude.
> + */
> +static inline int mmuidx_to_fast_index(int mmu_idx)

(unsigned?)

> +{
> +    return NB_MMU_MODES - 1 - mmu_idx;
> +}

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3857114dye;
        Wed, 2 Jul 2025 07:36:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrcdcC8ST7Q7dcIvxA3RJQNOg9L92IWf+5aTGMSwXHz7DxHFi7pEr7JYdp5aakRJ3Bs9waY+hvtAb05A==@linaro.org
X-Google-Smtp-Source: AGHT+IGrNOQgCwvRylcc/GVncWIMNqwUR/k2Dex0G8aS57DXO0PorPVCb72rN4aX+Vn+W/0W0mvI
X-Received: by 2002:a05:6122:4f9c:b0:531:45f1:604d with SMTP id 71dfb90a1353d-5345836163cmr2569121e0c.6.1751467018280;
        Wed, 02 Jul 2025 07:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751467018; cv=none;
        d=google.com; s=arc-20240605;
        b=W1e9cfy3yYhsh95o3tZ8Op/AQhPTYtLuSxNDCguX7sSxbUS1+/dB8sSI+r30sKrLqI
         cKoHQJVb+1Lyndp/1AGYZtwem4kgUvawkeZFu2g5NaqjM9xaon3aiDnCGaO6ad+/mqbM
         WvsiWA3injqKMZkBFbVO457pwR4NW8Elxkqfp9R2P1fdvTQflQshkyebslK7bumFRuMo
         598Szzt3jMO3Xh643B6UQsHqi+uRBkCRaexC8QX4nNY1fyGzGQ0bihlfUJfewtM+45Be
         gdpoqIF9nQbrxqVTEqFCzc6X2h5d7LG14eRs4sjj/0avmv++jKulQCXWa/9n1YInWugo
         gSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2+8GShH3E8KBmq/FsvPdBW/hZXUOb5zDoDjj1YUqWSQ=;
        fh=MTgQjxL6pZd5hYrj6z2b2k1dKqnIefY5VwOX1rfk1wQ=;
        b=jU7Uyd9zkd0PlJBgUfawYkZb400/GCZrx2Qg9UgcKgKUx7lW8RmXZpkulzsE7MFGtL
         Hh7Qxbo/5mXD0oCFzF8+18MmTSwNUlmwZ2jTFo+AlNIvvf2WYnIYSqbZwDnT7cWaNdau
         B2hEMKx+ubWlkdhYyi9SvlRyvjBfqEMwq1fdjoOipgNZwf2Dt3pn5A1G5Xbs0cbLAwLc
         Jsm5ouiGfTbZOEAof/po8GwY66PJZ57EwGDpKcLjaCkxGXixF+fBhqErSPuWLrG3dTtP
         DQ4gc+UI/wwKt70SoQE7OtV/z3Y8aXtoZNs5YsyLdiPRULzqLf9jFbif8PIbqmpkqlPP
         8afQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5cx5OxI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-533090e3524si3373722e0c.18.2025.07.02.07.36.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 07:36:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5cx5OxI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uWyZl-0005TG-Fq; Wed, 02 Jul 2025 10:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWyZe-0005Ss-MY
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 10:36:34 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWyZY-0005JS-AZ
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 10:36:34 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-2ef461b9daeso4671987fac.2
 for <qemu-devel@nongnu.org>; Wed, 02 Jul 2025 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751466985; x=1752071785; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2+8GShH3E8KBmq/FsvPdBW/hZXUOb5zDoDjj1YUqWSQ=;
 b=W5cx5OxIYJY9lDlHDVIeSgM7RY7sI/8Xz9o2gukCSLl7eMHy+GvADvD7ZL+tXU5KbM
 Z8KKRN3ppDCLj4B8d8lcQbO7qEqaB422n6L8nBIVe0Mla/jYkW9pzVuCtVJzidoWwc5P
 aFOJKlzmYH2fX+hvYOTC/h+55TLplj2IFXs5R55MSCMy1CblOKBveLhZC5CFrioTLuVm
 2NXncXeXdEFSbWPa6ytT2IO75zp7pzkvbtYGN3Y1gB6+x/dysAcfMx/drNeu8jhRIiQ/
 uMwo5Eu38qJ+kEg9yy5YHBDGOXdFtUoPjq7DqF6UVpKumWVIfjvQU4tpeJ7azORlBePM
 3ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751466985; x=1752071785;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2+8GShH3E8KBmq/FsvPdBW/hZXUOb5zDoDjj1YUqWSQ=;
 b=pxt/mON80HyFix+xviKzdHseQccLO6wHqsYXUxTnd2A6YYM4xOQ8j9yrnQB+id1Ia1
 phiYP5vu1Pj73pcI4zCZqw+tSvEVuaH2oQKFwC5P2IMHbY4UKkJ7Gh1jMRCMywuqMXIP
 KR+6qMqOBEVzkQz4oqfZe54WhbBVE7K6NhqKLF6U36pWcNbljd3kgkMVY9aU1xhrCCbD
 XYJqkuR4aRdse/coKUczv5MAKO/+Bt8K11O0TAww+4ukoOY6gePnaDz98EgN8C4U0lKg
 UX61SgP9QnaOTy+KLs0j9GTO7GVb2vH41uTZaNi+L/ZoRg24Ss9khV44Nif4tVVkVpYU
 g9vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvQ2cdFsJm4tWRiTekJvwRbOGk4kv8GEAqh0hltfLdSkRCLfWQxgVnOXJkivCsRDMfbCtLou0T5AZQ@nongnu.org
X-Gm-Message-State: AOJu0Yx4B/XxjU4+Zr65PBeJ+mI2dWZf4hVpzCcu+/cOoNx+ngpRixNq
 azz+SNssuzgzrdaD4EH5PDEmcakW16YHEVAPk3TbWIZEQZWSuZlyTOGheGSqG+C9Klc=
X-Gm-Gg: ASbGnct9LUM4SonfqtNWo0OlAZViNjrujirMZy9A0AFYMv3tvMt/YF5vhlmZH8XRNXW
 o5UTH0E+RxoTHo/KJKUSAkmICs9MnGtf6geIY60ppgCB6FTXGfPBTciGhBocNSdfGDYdrmzd3TJ
 udtCro5yMmbmBH2JTOUZdDPbahwhataqezOD+OVcl4BcZV8VQ8zzLUaoULB7HNc/uMADPNXC3gf
 9ftF2d2L+J+Kyhw2MVDMr9OJl8GRwRi8tRYe90J1lmhon+V3unZDV/LbNx2wxp8bTBgKhHfAp17
 k9+T0Tzkq5OTE87rCh86twjo4uArsHr6ViTURq3PsoySlBoPVKapZrps0vI/duP4QS7/c3w3Z2n
 3
X-Received: by 2002:a05:6870:d394:b0:29d:c85f:bc8c with SMTP id
 586e51a60fabf-2f5c7be7b23mr2318902fac.36.1751466984697; 
 Wed, 02 Jul 2025 07:36:24 -0700 (PDT)
Received: from [10.25.7.74] ([187.210.107.185])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-73afb1039absm2532807a34.54.2025.07.02.07.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:36:24 -0700 (PDT)
Message-ID: <a8636b65-f62a-4db2-a6ae-961d40ab1dba@linaro.org>
Date: Wed, 2 Jul 2025 08:36:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] target/arm: Fix BLXNS helper store alignment
 checks
To: William Kosasih <kosasihwilliam4@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
 <20250702111954.128563-3-kosasihwilliam4@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250702111954.128563-3-kosasihwilliam4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nKJyH9ZB64W+

On 7/2/25 05:19, William Kosasih wrote:
> This patch adds alignment checks in the store operations (when stacking the
> return pc and psr) in the BLXNS instruction.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
> Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
> ---
>   target/arm/tcg/m_helper.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
> index 251e12edf9..f342d93489 100644
> --- a/target/arm/tcg/m_helper.c
> +++ b/target/arm/tcg/m_helper.c
> @@ -632,8 +632,11 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
>       }
>   
>       /* Note that these stores can throw exceptions on MPU faults */
> -    cpu_stl_data_ra(env, sp, nextinst, GETPC());
> -    cpu_stl_data_ra(env, sp + 4, saved_psr, GETPC());
> +    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
> +    MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN,
> +                                 arm_to_core_mmu_idx(mmu_idx));
> +    cpu_stl_mmu(env, sp, nextinst, oi, GETPC());
> +    cpu_stl_mmu(env, sp + 4, saved_psr, oi, GETPC());
>   
>       env->regs[13] = sp;
>       env->regs[14] = 0xfeffffff;

I'm somewhat surprised the spec says sp % 8 is unpredictable rather than forcing an 
alignment fault.  But anyway,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

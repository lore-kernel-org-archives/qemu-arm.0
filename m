Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C976CC83F26
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:09:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhE2v-0000zO-Qu; Wed, 30 Jul 2025 17:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDmU-0001WU-7F
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:52:12 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDmS-00029S-Ez
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:52:09 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-313910f392dso267263a91.2
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753908726; x=1754513526; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B79+X/k4ZYCKdRh7PXNpVVuSv9aZ8izmf7Xm6SGNCFU=;
 b=KKhBbpCqHThfXNtHdUNbmB8tRIvYBirskrcgvGB4Bgy0s/3lmhDquh5ja654zd0ppx
 99kTrP2xgULQHbCXduzaMUrqwOBQi5tgj6ukkxWwgxN+Zo8I7KVkg0ZiZdYHCeAsCsHJ
 0sZmmO6H5zAGzkf3BgBLo4H/rK24dEq0ZJi4nfH9n7B4SRdSMSQBHZDwePHnt6ddT84G
 hPppYWMtO/5o/ATRWzFHn0qYKrPypJGKaQeItUVDxRsMnSjcLMGyd0cRsUUxZWV6uHov
 hp/3rXByVibc1WGF+GmdcxDLrDrpVOSU4pMYNVFrMT9UKXXCHUgssUoCm8QIV5V+AVkl
 dXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753908726; x=1754513526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B79+X/k4ZYCKdRh7PXNpVVuSv9aZ8izmf7Xm6SGNCFU=;
 b=CEbJu3z/py7O97uM7Bj7P+UjJsmZyVR+ZJOV/sPCes46qbcWZ193e0WibORLIrx9pp
 9yK3foKwZnA4VlzwtFhZ8QSZ8g5MthV4uEUom4GrtzNFdge+MgSGouTkrfUl65IF8402
 wcZ/0PgwkgGU4jllAj79X88TZhiGk3CvR25Rl1Bj07bpYKoMifywPKtxJWsm9M7Fjgfk
 l5jn//QPecwGzD8WqQ8QbOrq01aLS+PD8ssij4hxBOglZCf+SvdJu8qIS92eQu4xceGL
 14eoeCgim5KEAuEWgp6Cl0euIILrFwAasA1ECLi5gfGdOdsP08fO1Euyuy0dEdckPHIp
 lLww==
X-Gm-Message-State: AOJu0YwGZMYZ/XGrrzvKUrsnxKm8kEj61e0Ke/mip1gF5Sp0fC0ibN7g
 Fa1CyE5VEYPg9xdx/ABQwZyuRhwUUoEMOrmdPN5A9dt0mwNL0UfDizHP3KCJw4RAjtq0vnFvvka
 Px+A4
X-Gm-Gg: ASbGncuG/9g+ldnxThnXRcvZf10LUX0pYaIXjNQnlAitEw/4R9zp+dfemIjVxdeKDbe
 hRgwtzo7EAJZ4dKxNRwEk4V3e5awKog7Ohp2vU3kVX8ieF89NZt1HhuvtfmrpkKm1tKx1Y53y4T
 soi/lFnQIq7mky22AvV5eeV0LiSwYDJrivSEzWbYPoO0mP3JCQzZBcMnOSX7dQevNrxpDsUDB4D
 KECOKima2PoAT1GQ4+Yjt1qAeh2C3V7NPdFXpl/nXvl8m1OEJKmajxIuxO18fqa2/PMVHlm+PdV
 EC63dcQZi4HOLniC9GcdM7srLUrIqFbiu2f3Mio655lvDMujeU+LMiyBmfm2X8OM9Os6eSLvqA6
 0L0zR6TA6AU207T/AlaXpfwaAsopDvYKY+C8=
X-Google-Smtp-Source: AGHT+IGIbG0lD8QwLXlOrNmtpWHh34OF+Rut5gIjwVpqjyuJOdheA17EbH9w+gv4nF5jyRCf67cnjw==
X-Received: by 2002:a17:90b:47:b0:312:959:dc42 with SMTP id
 98e67ed59e1d1-31f5dd9bb9emr7709692a91.11.1753908726045; 
 Wed, 30 Jul 2025 13:52:06 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eba6bcfsm73515a91.6.2025.07.30.13.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:52:05 -0700 (PDT)
Message-ID: <fcbcaa16-570e-40a0-8b55-6d7dc01fbe16@linaro.org>
Date: Wed, 30 Jul 2025 13:52:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/82] include/hw/core/cpu: Introduce MMUIdxMap
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-24-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1036.google.com
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
> Use a typedef instead of uint16_t directly when
> describing sets of mmu indexes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cputlb.h | 32 ++++++++++++++++----------------
>   include/hw/core/cpu.h |  6 +++---
>   accel/tcg/cputlb.c    | 30 +++++++++++++++---------------
>   3 files changed, 34 insertions(+), 34 deletions(-)

That's cleaner, and definitely help to see we're going to increase the 
number of mmu indexes.
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


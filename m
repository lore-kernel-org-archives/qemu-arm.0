Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B773D32D9C
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Dec 2025 15:12:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRXTR-0004ki-9C; Fri, 05 Dec 2025 10:11:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vRXTJ-0004YB-Os
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 10:11:51 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vRXTI-0001VY-5J
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 10:11:49 -0500
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-450ccefe6ffso1334657b6e.1
 for <qemu-arm@nongnu.org>; Fri, 05 Dec 2025 07:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764947506; x=1765552306; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m23IJjqqMukIBBgSiJZdjQOmsfWT72QFikpiERbNuhE=;
 b=k/ATWOdOgJlVFuJgab8FN7Qs8CG73iNO6RbMccjDALMYUfFJLKAPh4VtQPeugdUC5K
 o36m9LdSMJBkFAzwagALnoFruxtc/DQNAXcHDbFkbLa2qOfmYOYdiqz4EoqdYI9bYI99
 6+7qEYDcazTR0D3tjYowHHxDeROwqTPwb4VW1/kq+ZnXjujZnK2x0qdZ5RwXEG5XAt9H
 KQgFKuPR8bD5/teJHd+t7qMqB1LTjFEkCeK1g+pAxg3WHS3OoLPxkzpw4zbwDU6toKOr
 pwk3PD14ZvMJ1WZyrys0TVerTjir6LPtdGhJkNnaZY5a2j4tWU8NbFg99ou/wYSAo3E4
 Py1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764947506; x=1765552306;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m23IJjqqMukIBBgSiJZdjQOmsfWT72QFikpiERbNuhE=;
 b=w5KK73Sc73KWIq6OZqUDSlta4349AsQihgcjMpsstJHevHc4yy0bpq47GXmhDRFVFQ
 tCPFIfSnkm8yP0VKn1TjKmgzsH0QWm2CDdTo4YpH3g/FQOUHfnpF9/cya8X+44dEz7iA
 VoyL+gFu/6lH5QzbktmzmDk0uiH4b9L0QkqoutOjAwthzJaTIqO3D9i9IPRrFgSbuiHF
 4A4TbDCAHR1lDjSFJxBIWysigwZ91EkkWLZPrw22PnEwoY3ptJkag8sgGJsvdVYBD6VT
 Iy1uYR/q+gwf61vJSNSVOLRTBryzN4boPtVdnKKPtpSzUCgaWg7W/zY1aKHGbVkqPNtF
 401Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0QIdEyX9DudxQMKS7blHChp6nE58JpG3R2PpBZr/1hQU5yYw444+fOwqEmGCcHDKmFIyJYH70pA==@nongnu.org
X-Gm-Message-State: AOJu0YwgGTk3/uqvYQAphhF8SYr8auc8wJy6/A6LrFtFiywwP/8mqGMz
 MTcqBUMnlaH46d3W3xm6MChsffDssUaAuVe/WAp59rpvLoYyQYtf9dn1u1VkPTrRs+o=
X-Gm-Gg: ASbGncubryjfMTxA5c7H3zIOkM8ib6OagWG9QC2sGG+bWnXb2iwq9FOVqhzL10y0yZC
 C6tkI+VKspm18mC1WHvlviDdkK1DSvKy/c5XHFEo9v2ZBmJEYHusTVsmKGq2AtuRUqL00iNqtXy
 L/ciretQRVTtBOB6KJjhvJFHpEOeAIDk4Pn7NtAT61Q6yt8BZRMRsZFLxYPrKcgayEo/nWY5mGe
 FIaNC6XZJyGQo539ySu4KkBVcG9XxjTfA/24OwQN/FrTA1OIbVf/Q1QuWYXYQoEc+/K8FJ3NPb8
 qXFi+aDyla5xxJ0JsMyuU7lNsSsHU+tYXLiGFJ5/+9GCPzYuuH3z3SYBAGqabZfQQI0ybNN+5OV
 PkvN0oFZG0FimU6hIbTEr7DB1scHCVA+Tc97TsPTF57IsRX6g4RnwMNWW0kfQoGVwpgL0qKqh7S
 xafgRok0Hvfry/gLgIafmcHDqqbNZFm/mm4ZmfSnoK8RTqVy+t80VS7WsynDktUioI
X-Google-Smtp-Source: AGHT+IFuQD+VlFU7dW8yCB6Ih1dPSnZYtwo5O2x+ErBih2+ZUEu51gKIr65nLwUU7gh0QmvMzOVjPQ==
X-Received: by 2002:a05:6808:528e:b0:44d:aa31:d929 with SMTP id
 5614622812f47-45378e937b6mr4280160b6e.20.1764947506441; 
 Fri, 05 Dec 2025 07:11:46 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3f50a727d7csm3630333fac.0.2025.12.05.07.11.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 07:11:45 -0800 (PST)
Message-ID: <19527bca-4209-42d2-bedb-18dff9639987@linaro.org>
Date: Fri, 5 Dec 2025 09:11:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] target/arm: handle unaligned PC during tlb probe
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Jessica Clarke <jrtc27@jrtc27.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20251204203540.1381896-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251204203540.1381896-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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

On 12/4/25 14:35, Alex Bennée wrote:
> PC alignment faults have priority over instruction aborts and we have
> code to deal with this in the translation front-ends. However during
> tb_lookup we can see a potentially faulting probe which doesn't get a
> MemOp set. If the page isn't available this results in
> EC_INSNABORT (0x20) instead of EC_PCALIGNMENT (0x22).
> 
> As there is no easy way to set the appropriate MemOp in the
> instruction fetch probe path lets just detect it in
> arm_cpu_tlb_fill_align() ahead of the main alignment check. We also
> teach arm_deliver_fault to deliver the right syndrome for
> MMU_INST_FETCH alignment issues.
> 
> Fixes:https://gitlab.com/qemu-project/qemu/-/issues/3233
> Tested-by: Jessica Clarke<jrtc27@jrtc27.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v2
>    - don't mess with MemOp for alignment check
>    - expand arm_deliver_fault to pick up alignment issues
> v3
>    - update commit message
> ---
>   target/arm/tcg/tlb_helper.c | 21 ++++++++++++++++-----
>   1 file changed, 16 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


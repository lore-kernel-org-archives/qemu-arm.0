Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E38FF8868
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 20:27:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHSXw-0002wj-Pg; Mon, 27 Apr 2026 16:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSXl-0002vC-Ao
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:27:02 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSXi-0001V3-Od
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:27:00 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso148399025e9.3
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 13:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777321606; x=1777926406; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=14z3SWAZq6VsdhfKrHZ6vAgiBGTX5CT5yX0Gz4AAiNo=;
 b=rm93+g7+qZnEudTv/zT7zwkCyDijlLrimSSrDolS2zj04spTs/JIRl40VLIrrYJEuj
 fVjp2o1pHBH4NS9wl5MHy4ZhCxYLxNBeHeRa4RmMx7bEj2ohZHDC1X/BFPtXeR7/jHiS
 XJVUyUEetUIbU5jO3UauDtzupJ62xhspKCjv9dWG0+xjcrTE7Y/q98w0jM8Z/anFKyuI
 7psnUUpgXoX1zrrBhfTW8t9DMz4yXvBsny6cKUkQQMwER40e0c17F+K0PFPXrsas4x6y
 vtBI3nCBGlRznpWluNHu98AUNb1XYFoWgIdCoaUv5Hb9fMe9SLl6vHiUqLNcBDeclQ+P
 OAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777321606; x=1777926406;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=14z3SWAZq6VsdhfKrHZ6vAgiBGTX5CT5yX0Gz4AAiNo=;
 b=ldrjV4sjQWmB6OadXWik+EE8AOKUVsnyGW2ecG0AsJaeSc6rk5KR9lkeIK0S4Ubh2x
 7huHEgMjhx+JjAbReN9xhLOzLc9XCYOU6rWYMPP39BBnX9gmznyYxm+zq6eLlEVYhIng
 0SuGPlFKUiAfr+TyvQlJSoSpYsC+2c2k74FQxXFV9TbTGHAaX6HmyJINNV46fkoBPCzX
 kbBzyjLNKvedv/32KWHSF7mLokrv457ihQWpv8Tq5UkeC/pr5S/LgStjkDmkKs1HOsXK
 03WUW0GIKZGGIXAGHAOLBJ7BpcYXnD+CDaEVK5+xGhHSXKsiDM5Sxkf+MHCbzvqhIC9a
 FYng==
X-Gm-Message-State: AOJu0YzzoSWGTsvjg6t+DykaCEPN2CRFOXaH0r9UltIcIL7M1cNsCAxz
 YmlxGfqh27ACVO8Z5HeADrVNBtzggO6EMoL9i6Lm3HU9zuakedMqq1IArr/N/L+p78w=
X-Gm-Gg: AeBDiet2YGm/Xosa6SzOYKLYMKC9QIwDtBdv03gK0OV/J4bMRW3L6mrL1DQYUuY5yPE
 OSH2fcPyJ69EhZaul9Cxz1d2rH9wQM39EJ8zW7AHOyXqSOckn+VLf0OmhlnDuxZWCBQ86O6loeO
 4+SMSL+nhAJxhwxWdf+RYXYF2UHKl8eKxDTRr5gNskdrlaAABF3N7kgQZVkygvo2YR58L6cH7B+
 wSzwZSKwAegXU1Acfc0gfw14CXji/pERMFSKrfBAhnRmZxjq2pH/DxXa30dKdwv2Fk4GXN25wU7
 Sg6d7sS+rJvEcoJxGXtDW7hehDssGSdX6d7t1oZJJhhMko9blg9D3p5yruub964W5wskZnOJcbI
 PXAnJASmEcmPw/y0dejkj0+Nb0snXZy8GAj7H86h3/8oE62wEtrNbiJSo6ExK9ItkCuOjfaz58U
 jlBkAaqY/0wx6E3TUmC7SojnW3jaGmfsN9loDBk2FsjmLM0UU2ZmSnja/lbhJzB7wc5BGt75DPm
 Ded
X-Received: by 2002:a05:600c:a11:b0:488:be58:bb5b with SMTP id
 5b1f17b1804b1-48a77b1a2camr2469075e9.24.1777321605678; 
 Mon, 27 Apr 2026 13:26:45 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a775f776dsm2555925e9.28.2026.04.27.13.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 13:26:45 -0700 (PDT)
Message-ID: <9c7f50c1-9116-448e-a2b7-67d646fe77f4@linaro.org>
Date: Mon, 27 Apr 2026 22:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/84] fpu: Reverse the order of softfloat-parts*
 inclusions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260426134002.865628-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 26/4/26 15:38, Richard Henderson wrote:
> Define the widest addition primitives first, so that
> they're already defined before being used by the
> narrower muladd primitive.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


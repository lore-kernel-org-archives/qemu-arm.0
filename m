Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77476FF886F
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 06:06:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHbZc-0007aT-RS; Tue, 28 Apr 2026 02:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbZa-0007Wy-NR
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:05:30 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbZZ-0006hy-8A
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:05:30 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso94017015e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 23:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777356327; x=1777961127; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6dtYK/6yKO/129p9+Qv/iJGnnfRj+4f5l+VOq2cO9PA=;
 b=ojNVs06hp2AWefcfuwDgE8dNAo8BZzeVOwvSnRE89Rqlki4C1BZ5Z7sRjZ1Xj2So/U
 qrgMykgc4/JacfnuieJ3ZPHRCiHwC0lLU401REzwztJ3Mx+3p2dWaD0pcNj8y3zj6WNO
 kk03QyufdAWDUlmw7x05krCZk28F7zaRcVMunIsStz6xxdhKsSGazGf2HTaihNYZeW/u
 WLu0fZpgMMO0WdVFKquY1sFe7ynDXqo6gP6ZBboXcjJUxOqk8XAiMGM09DRCMhZDzCb+
 7aIhZXmUZub05rf2JYDR5roFzautWfkaINN5ex6b99nmgO5iaf/Yzr6WWH/l5H+A9X3U
 dowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777356327; x=1777961127;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6dtYK/6yKO/129p9+Qv/iJGnnfRj+4f5l+VOq2cO9PA=;
 b=Ihduh3nrPPijBzu5BRI9nUIDM55JbtSNctHYWLZvGPsdgx4sZVPqb1rS5SS1HAnld/
 VKeCXfgQgOLEgI3+C/79/jJHT+qfriddNCtCoScZgRvmYDjOmyq6ie12c3sA5G+W2xeF
 BxeXdzfXIhQtLn1cphUeM9r5whYtpm7Y+4Rao3yRqp/cXtKpBKHKB/ONumihUwVtGfBr
 DsR0T72a62VhSf+mJVAJn+2J006Qvnkjvnh+fUN17cnlasmrnHlkLLCEZO5PP6joWtfN
 Z/r6CPUwXpb2lImJDwhbZ2ZSYuJubLJgDTogy3oPThs/CRDbY56gAJA2d+2tRy6YNXbv
 KjGg==
X-Gm-Message-State: AOJu0YwYIn5+nB11MryAhugJC5oY3xfLwNaNv1ZC4vvynrhRBBLewaVH
 CCc28JGfSqbeeLAbVMrsYT8G9TJYtwnlfut5iWZE2txp5kCee//i7RCu2jqMVsUJfn8YvJNcac/
 /u+QbVLk=
X-Gm-Gg: AeBDiev8CHlzqYp1Hs0Ap6ltE6+tP0jjgg1yvNQysZGxRqTgE8LrwtET6c4kh3PdMZU
 y7ZZ5WdiF1MPYMZgj9lhpamwSGOOroAhYPoc8SCdgbiRpTlsH+tfbQIxe0GFt4gMiyEcu5atqSv
 8xhkJjVYcomal7/d3QLgaqcHoqb4LAhBytuyjWG7CTIALyn9BHNRSseEwT0O3ZPje42Gq4Eqjlx
 921fCYDZf9S51EwoEo9iGZzvu9u8wc2YR8iIH1QY9X2aVErXhIFgnzVtuSxWcyjqObvm5pbLpUW
 nETM/JAHL5c2RU8dcrQZNX/emejTKNej3m8jGrkwfapvm2O67K5MQJGfiskfkyHmVhP7fBHPDPs
 bRaYlfgGKjTuZp6rzSzVMMapIpAmprvBSlZ3btCqIsEDX3QDwWwobjg3KSyUfpEL4kv2ph1b5Qd
 q3UhcEzXq36qcsp7tHhL8DpuuxEJUjywqcIIw/jqsWyQARfbbhHZwBRmverCovPkhGwInnIHf6R
 RMT
X-Received: by 2002:a05:600c:4593:b0:48a:599a:36fe with SMTP id
 5b1f17b1804b1-48a77b1d78cmr24260765e9.24.1777356327039; 
 Mon, 27 Apr 2026 23:05:27 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a77af1bacsm27777695e9.4.2026.04.27.23.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 23:05:26 -0700 (PDT)
Message-ID: <2912ab24-2c53-4c52-ae17-9bca6433462e@linaro.org>
Date: Tue, 28 Apr 2026 08:05:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 76/84] fpu: Export parts{64,128}_compare
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-77-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-77-richard.henderson@linaro.org>
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

On 26/4/26 15:39, Richard Henderson wrote:
> At the same time, constify the inputs.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/fpu/softfloat-parts.h | 5 +++++
>   fpu/softfloat-parts.c.inc     | 4 ++--
>   2 files changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


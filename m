Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFB2CD5BAB
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:28:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkg5-0006Hi-Lr; Wed, 20 May 2026 13:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPkg2-00069Y-Sm
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:25:51 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPkg1-0004JO-0b
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:25:50 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so29978245e9.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297946; x=1779902746; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=76MIjdywsXqnAuf1auuHWIEWqINU+6XmcxF9CkbdaQY=;
 b=S4bZReSP83B5yHWmlwPqOh5O+d60MfQ7NpCyhkMJ72B55vEfD0BH2D3YHtSVl965qy
 G4DWO/IFVMv1t2kwE8ArZA83JQWUkRfm0zORoA0Ot5KlHemjf6dZY9thdqoZngXcywoS
 OSPGtWTSm4sCx1nXqXZWUU0yaX+A7rzeHYgiWJM+zoSxbOtsI5DM505U1Ugu0pnjaAHG
 JkJM9+1tIivbL74KkLn79hvXZRtUjRWtjJIm1H+AsTFJxHlqsmsA59RXxcwNW5LMYZQg
 Ykw0FyI3MFj33ZIv7RrGlDUBZL/LWlnn3SmcXKOgCKxxX3j8aLAH65v9x0u9MQf14stA
 QYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297946; x=1779902746;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=76MIjdywsXqnAuf1auuHWIEWqINU+6XmcxF9CkbdaQY=;
 b=rNxjyrVT6JlqIkrp2RUug3r9QG/0lM/XtcV9c1z7db6vBuqd6QLvkyPYZScbHIh+2H
 /3jECe+ornupzXNIWLLj5tuGEi+9ItEIA3UdU81714gj8tbVeU4Hk3dUAfbu013V9BXX
 D2vW9sobQJjkjVzFxsoOe4AtI/4TDEVVREQ8oXnq0YgohEgXdSGPfxYOFFudGameywc7
 SudwDgL3nbhyPj+LshApqj2wazCb8gy+8sS9is1HHOeMr+hdwkaG2nsg/CUd8n4Hc4/8
 /cbjcpvoGR34dOj8v5Xvke6pFNtji9zrI8iB3Tk/FNHmvR0vS7cgYUF9V08Lr7R0jJxJ
 Fzng==
X-Gm-Message-State: AOJu0Yyolr49q71m6aFfgjKJp18YomDWEf16W3fagSRNOX/RX9FX9l9k
 ZDCM6J6JROetT6MWypsXAWHM8cd7Npvi04zGqtHIhSH0Ea85r4l9l9cwuYJsj7bRq40=
X-Gm-Gg: Acq92OGragGr1EuB75+nUOSnk/ya2FIRRlTyXK4bJh9T/336DzJFdOt5854G68cXxq2
 SmV7MXSH2yCBiO8Gdysy2v5wYVYYU174QEZDbJLus9aYSb7fsAiMZ8H66rNXmGXetP5LR/v/LKo
 6Hazuo8Hm6MACT2bnVHxAW2brKfNyFuWailzj5VyKAy6zxjS0JaEhlC0g2ILo7/XzOtIXeoAwHq
 joeGC3K90WY6KNe/Fw/qJ3C+KE21cM0Jnzcb0jSBLBHXRzdQLCSvyhQGMUT9U89brpNhk4we8by
 5NxOhiNtqbDOtQIergg2JStPBvOW8oW4DcQvQzfHmQW9hewBD0aNSMwm+B4JvAXRB7dpXHyyTX0
 NQdymIyJsu+N+Zl7GkcOeXpkrBAL4nX40aMfFUBVEYzfiw86c89PiXMLUyKjV7VdXTcp9ooYVAF
 fFYZdPC6umpx2pXxU/CoL1u3/IdlOujyeDS0IpitwKPw5YWRjeni98LNSIrKQzWhKh3g==
X-Received: by 2002:a05:600c:34d5:b0:486:faa8:9e4 with SMTP id
 5b1f17b1804b1-49033d60f57mr6207375e9.12.1779297945512; 
 Wed, 20 May 2026 10:25:45 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033dab0besm5001215e9.15.2026.05.20.10.25.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 10:25:44 -0700 (PDT)
Message-ID: <33e768f5-31e0-469c-a725-e47ab3129c7d@linaro.org>
Date: Wed, 20 May 2026 19:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/30] fpu: Introduce exp_scalbn
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260520171820.848839-1-richard.henderson@linaro.org>
 <20260520171820.848839-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260520171820.848839-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 20/5/26 19:17, Richard Henderson wrote:
> Avoid exponent overflow as well as checking that we don't lose information with
> opposing scaling.  Use it in partsN(scalbn) and partsN(round_to_int_normal).
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c           | 29 +++++++++++++++++++++++++++++
>   fpu/softfloat-parts.c.inc |  5 ++---
>   2 files changed, 31 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


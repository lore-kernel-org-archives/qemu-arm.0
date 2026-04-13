Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1A6F531DC
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 23:16:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCQW3-0004Fh-IQ; Mon, 13 Apr 2026 19:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQW2-0004Eh-2X
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:16:26 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQW0-0001oB-I6
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:16:25 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-483487335c2so54395035e9.2
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 16:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776122183; x=1776726983; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FNa31vdTTYesinZWygZld26nKJZMhIK/aY6KMecDXbM=;
 b=G+arRvwW7kLegvfH32dUlUyCvx+1o7oyiQeTZP+uqCCRzChhAZqO/nkunO5IRaxuE9
 vLCeTigoVqojd6/K9N9OPxThhEGtwtJDK0CDyd1CeHxt3LsieJi/yJbmQmBqwqTpWSHX
 9OKLZO8LToX3vvTbjDcaW6V+yN8/VbmTqKcoRfn1X/mGrTXGFx1XqhG2Bm2BdnzgOcip
 3fyqgvsmnW0fVWxJtgNApiskQrk/kPo/rNTljRE8LC/XvkoM0pnCMTWkOX1j1hfT5kze
 arExvgerdlOlR3nv+JnwJkAun1XgDWhsuZ8csReqnJ/A3g/D4voVV7eNpBkVVubYgkeW
 jUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776122183; x=1776726983;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FNa31vdTTYesinZWygZld26nKJZMhIK/aY6KMecDXbM=;
 b=Zb1gj55avYBg0sm2SI7TTEZDjTVNi7yRCh2FsFF2MVM7Nge0j01ptxZ5bvD1/xhbIJ
 3ZWfcCoXTJFinqU6WPSkPSDewdJqpTqkIkzvXtaEDwEmIsIJk1uOzEmcPIJp7xS9lVPh
 v/jgHg4lBgk1cvUCU25ki9JTqaumy+nj1rbrNHyVxwGYkrQqfxzQdmecZpVKjnLEnMbG
 brwy+xAR1D27/Zoi5yqLlFeU9u7xt9/kWcakalvSgjEcZ98CzxA7E/Fc4rBm8jX56HQC
 M7jhgknC7AxT/e7faQRP3NJ+uMNE4T5f0NoYvQ7JAOW6fV7/KwJg1ZNYKrg7BTAqw3Ox
 aLmg==
X-Gm-Message-State: AOJu0Yynu7uVi1nuoBtvCYJkuKQkLk2CiJkoMooTFe18SyFd81ecqSQi
 sguEoUio97+C80AQeJHFwHtpp3Ofwa+BE1C+wnMiAjg+G0ihRVBo+iUzhGmdbHqV1o0=
X-Gm-Gg: AeBDievFzey5idisiitLkxcqXzVjLdCjbkNNQEHGSArpBXHkk/DbYiuLBoqBB1eb5q9
 K2i4fI9xSNjEcP5VD28cD+KaXz678SKVAbFm2YO2vFw3qfWtYw+XBX2JKF3ODHsYmvQZHfIavKk
 EMNS6XHXSOxKBrL40X3KDIzELxKSswElS8YnTdvAbkaVPl98N0AjtwcPiA3KlkQqMPy1PCuKxoG
 LTgqTj7cspJUccrmDsX9b+x98qFfrByUPcyzTWVsIMkiOFxMw0MQ+imGBdaEp0lbw1YYloUFBjm
 EsteCKBoXR07wujtBA+U5y0hINJUyFsCSb5x6dVSLSvROFg6vfZ6T/CZPjn9RfMUGGbPmjLRiMm
 K+ZhAGQVlB+iT13LtfKgIOXHhkCIxvOVoj7lBgVknsMI32/k6Dn6axORtmNMyMEr9WMjpPocBZD
 GRvowAHN5278NCMs7Lj8KH80rSizmS8XGGzGUxuOL/IwjpfPGB7d2or3WSycEZIjYMeA==
X-Received: by 2002:a05:600d:d:b0:488:d243:8da9 with SMTP id
 5b1f17b1804b1-488d67b8cf3mr154477575e9.1.1776122182920; 
 Mon, 13 Apr 2026 16:16:22 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e46a85sm37084974f8f.24.2026.04.13.16.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 16:16:22 -0700 (PDT)
Message-ID: <29c46071-e19f-425a-bbeb-8dc6fbd78d4f@linaro.org>
Date: Tue, 14 Apr 2026 01:16:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] linux-user/arm/nwfpe: Use thread-local storage for
 qemufpa
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260413230251.22537-1-richard.henderson@linaro.org>
 <20260413230251.22537-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260413230251.22537-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 14/4/26 01:02, Richard Henderson wrote:
> Fix the thread safety of the emulation by not storing a
> pointer in global storage.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/arm/nwfpe/fpa11.h | 2 +-
>   linux-user/arm/nwfpe/fpa11.c | 3 +--
>   2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


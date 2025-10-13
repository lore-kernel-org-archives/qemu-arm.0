Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94C0CCD183
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Oct 2025 13:45:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8Iqq-00046S-Qs; Mon, 13 Oct 2025 09:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8Iqp-00044S-Ez
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 09:44:35 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8Iqh-0007Je-Hz
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 09:44:35 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-63cf0df1abbso2451881d50.2
 for <qemu-arm@nongnu.org>; Mon, 13 Oct 2025 06:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760363063; x=1760967863; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BAGXyK7tz1U/Aykx0FVIpMivs1OHmAVxS7OdT8Q1bBI=;
 b=u8Wlf4ndqs8oMto2CxGIR6CA+JXv4YbkcLTuPyzmRzbWDo51SAYxstDyTNdvsoLEJq
 CFlYCuN+UE6CPgCkdaNEKXWaWR2E65RnweqP1KKuqpZfE4NNGYnjnajEYSrL6W9I0nYO
 B1sQvI3eF6JT9lXI3Q2qOEj0+o368rXwwxk4tfVzWNyf7CLTQAdYXh/VhNto8dHkUNLI
 +0/8keqCNP3aJcPOPydD6k+3JLfhCuFBoPVGvboXcs9QCik6aCrPv0VjsLfPvj4jIk7e
 VtX94742HgLdV17fomaLVidtMSujpbw/Q/+57W+sb4r2HY4o+1/hzEiezAmlqcfV0dnp
 hZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760363063; x=1760967863;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BAGXyK7tz1U/Aykx0FVIpMivs1OHmAVxS7OdT8Q1bBI=;
 b=N16eYGovrNNVmKqgTy8F4FS8kG0NZu6GvH66E34me4phwtcK6rK4sxjTSLKgm4T2cg
 oN1F7S6GMzcbQYEEitabZvrPvvLPc+yOuf/qD5bfFkZ8SMSvG6LdAfgd2D5WOhGiDl2N
 RHHYVjw8qLpbqzef7uoQ2v7X32KAXZzHn47gEz75yAaDQf0hzSWm6JnjwJVk1hXSE/Zm
 UOxnOyEAZJJqOTcGv5TMhtsmiC0SLM4HRulYiiAZlOZaQCnjKLEUg2mmjqbDg4m9QB8R
 ivvFmgblyV/0g8Z3v2ImGk4WKXkE7u1Qua88qiaqyN3oCFFAe8iISjeljO54i2sYlRq6
 Uyqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWbtDQTvr7s4dBVjzOGOzYGFxK0PftHJrIij9COTmO44um0aV7pku5QsTFFNjqqu2YBwCX2IEK2w==@nongnu.org
X-Gm-Message-State: AOJu0YzALiEc+c/pKBFTnDXWmyOsL5qhnFWsGkDT4wbiBvcHrz4ZKtyq
 b7H0GLGfRy0nb6CMH3sV7t63lr96EDJAWBtxG493IQPoT6/VchJLKgKTlOyH6Qec7oLqKjWoFAV
 wtf9VOWLTbRmlE1lr80GcvjoBA6PsC1VVNsODO/yxyw==
X-Gm-Gg: ASbGncsK4d4xjvsK0rQUvKfcMjHeYLzTaGKcEB6Tk8eeeji4GFZE/C0ozFT+Z9ix2eW
 Ky2OlRLY4P4eo77wFm/9ujlfYl/kNWAoFgfDyD3Qcf/k8Dz2YtALARod6VPaSIUkonIgb3vMAQP
 v1R94Jyf5Jni+E/vrfyhS4AFuk/xxCvGgBy4TJLl36eq5APvHSZtc16FdHjoXD0JaMlEgAjW7qY
 BAigcRFH6K3yrKEwFpyNJRL1VT1yDBikLQC4M85BA==
X-Google-Smtp-Source: AGHT+IFKmTL8zz436WWy5ETIXB4P8iMmJJBDkypskIMAkQosyAHlEe73AhCUDXF/UNERHaJV3my+GENlQzs+WkUS+Hc=
X-Received: by 2002:a53:bd52:0:b0:636:5bf:2e30 with SMTP id
 956f58d0204a3-63ccb8dba95mr14472075d50.38.1760363063211; Mon, 13 Oct 2025
 06:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20251010201917.685716-1-richard.henderson@linaro.org>
 <20251010201917.685716-5-richard.henderson@linaro.org>
In-Reply-To: <20251010201917.685716-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Oct 2025 14:44:12 +0100
X-Gm-Features: AS18NWAheio6E_cLD7kKcc6waSAb1n3BbpI1QKEZLuU_2zJFzxZ4wVCz1G6VYWI
Message-ID: <CAFEAcA9+ZNZ1x4L_V-UZcX94TAZx+3kBwQFzCoPfeaToAUdNfw@mail.gmail.com>
Subject: Re: [PATCH 4/7] target/arm: Drop trivial assert vs attrindx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Fri, 10 Oct 2025 at 21:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We just extracted 3 bits; the <= 7 test is trivially true.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index d4386ede73..54c45fc9fe 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2320,7 +2320,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>          /* Index into MAIR registers for cache attributes */
>          attrindx = extract32(attrs, 2, 3);
>          mair = env->cp15.mair_el[regime_el(mmu_idx)];
> -        assert(attrindx <= 7);
>          result->cacheattrs.is_s2_format = false;
>          result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
>
> --


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


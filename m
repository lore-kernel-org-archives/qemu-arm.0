Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271C0FF8875
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 18:43:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wI9sI-0006Ke-B3; Wed, 29 Apr 2026 14:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9sG-0006GJ-V3
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:43:05 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9sE-0001Ug-Ro
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:43:04 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so850665e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 11:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777488181; x=1778092981; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NqcYmg0HN0ISE9jriVaAPy9WKvFvuqscYoo669QaoJA=;
 b=GsbemXVqAUaIR3UbsF7F7pL96meR17FTDyacuNPuyOeuwnwFEdkW501CqJ/j/YXp0x
 pJtCrNjCwBiwyJYaLZTGrfh9qIQW6V7JekDfJsWX/4fIBlCQ/ekBGs1cRmX9cilKrq6s
 q3KhZ2z54MTt5XQtghyQtN+wj8kL6+mIsyweqJeX4WKELamSqgZZ0a0APi1W12ncqFnQ
 AGq+ILK92epvTA4r0N8ZdW+7UpteZ1kyo9AV+VBSAgXYHuCIDzcE77sOgA0hZwuT6vUD
 aytxGS7SZ+dXI5CEXfuEeIWgbWMT+7ocriDiEmHnVjRw6xyuWBcGIUh+VtnyZOcJI9ee
 Hxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777488181; x=1778092981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NqcYmg0HN0ISE9jriVaAPy9WKvFvuqscYoo669QaoJA=;
 b=FfLQKwj3z8g9hVsA7s+Zmw4XHga7JTishsUMrl9JfdP4shl7eYZJVOzIhTcMk/VvjE
 fGoLRWFaICpr2vi+nxfjLCMH1OgfwdZWNNpdq7mmWvYEpFJvdeDQXrzmXh4FubBVnILs
 l0cEEE9Qp4PvyiPzg7fFonsuhPLoY13WyK+HhzYKy5lPyouTuPoMGZQt5jG+F0ULRR78
 46hIZNhDwKqE6PmfU9XZ8PLR2Tx3jAeR6jtCntcoYEmUU/LmcBmd2xNklhlOkm9Rhxq2
 GqpgHItZ9o3DxrmWO/ULQj0BmOcdXFFs5mjshzvanc1Uo74QfwJ+ePvYYyXw/ySJBaYE
 KsfQ==
X-Gm-Message-State: AOJu0YxC8HOmm2CKFA4Q1cg2205FfpnSpgXJ6wGA7+GJIg2Cp50tDixA
 /ENkAtQDGeJWFnAp1FUK5C1m+PgkPQ6ccBr3asDMSeeoqrqdohIkUltXR5cZxidYOZg=
X-Gm-Gg: AeBDiesB7DAI19oTycJE3awu3OLSqQPKtFNStMIe0psKhC1syHruwnnK1vsq8/LAWw2
 o/fAloTUnv0DWSGav69uJQ9hTRqVEMAkmZ8j9ts+JeWHuGeYBnWyyUf4ovNucrQN+5jSW4cC3bl
 NX8ukSVNZf2tfHlL1PD8QEgUyQaeMR79UtZbWHHqjoWwdCzYi/OzbRNYULouutRfd+Mc3etiVpk
 Z2ImqcmF6B2aPO56JTdXMDtuliKxz5CrxwQD1k6WMormNlOfRFZvP1siKoR/BEWODNSdMcLsdDS
 rLsMZ+95qgqsfL+ZdMZgAuM1y0qtc/js7jDiJ6XlQqaikMznuF3cg1+tAHn2cTVh13MeZysYTMS
 1q6F9M6VnbYQL+NSLu26Ys0z2FfrpL/8jj1rRmV8nVS2peIzIdfNoSWmNfHWr027eOksDjkWdGz
 dIJDNYxRdDTPxsHkHFwpPIdQC1U+61UFGU0vcwJ6INhcLfL1hdGd8wODkTtG/tRUOoB9P/xUtql
 jj0
X-Received: by 2002:a05:600c:630f:b0:488:9fb7:376d with SMTP id
 5b1f17b1804b1-48a77b1b815mr141801815e9.28.1777488180548; 
 Wed, 29 Apr 2026 11:43:00 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a822c832fsm16183185e9.10.2026.04.29.11.42.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 11:43:00 -0700 (PDT)
Message-ID: <5824e3fc-8938-4b76-b830-d49bd6e76b7f@linaro.org>
Date: Wed, 29 Apr 2026 20:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 34/84] fpu: Return struct from float8_e4m3_unpack_canonical
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Inline float8_e4m3_unpack_raw at the same time.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


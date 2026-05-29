Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74D6CD6E49
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 17:27:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT0zm-0005eS-9D; Fri, 29 May 2026 13:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wT0zk-0005dw-9t
 for qemu-arm@nongnu.org; Fri, 29 May 2026 13:27:40 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wT0zi-0003wu-Pl
 for qemu-arm@nongnu.org; Fri, 29 May 2026 13:27:40 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-c85773f46b5so402815a12.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780075657; x=1780680457; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GAWccsJkx68H38nFzgCXTzlNqiVsQnVapIdV4XjbSLc=;
 b=n2WiD0MPO792mt6lHhBdlhhAiZaOGrxiOEcZ8YPICwH3lxGYyy2wG4Rzez12hKndd8
 rnDjKJ4u67Wgm/BzqEtLaO6TQPkR/Qm1L/gLVdHQh/Jdwz4hQAofC/XdPMXk0DUT+TOC
 okHlAhmeRIae/Tn2n0+GCvffaXHcAPVGKrD81yMbUWqK7yZPRtXcw+lNypkkp7Gg3MMW
 fdfC4K2//IQI4E7n/gLoE3ZcDsJUyNgr7MZ3A2bVICHvESpVtl2IIXqRra24tTuuqc6V
 JZOfEEygX0QmWXWP83HKeK6ncqUXOmzfJ9YOxEmUXEgXRyHhEloVo2mnyMAXN38rtH1S
 1s1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780075657; x=1780680457;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GAWccsJkx68H38nFzgCXTzlNqiVsQnVapIdV4XjbSLc=;
 b=Q1cImFrfS9aVU4pSvrSlaAGOcdZD/FfqLDS+1UUKbH+6QgjUmQOjtVjPC6HziAmJ5U
 wkqPfSRKAWDdLFkbd8r3n+uvdu/SkrE97HCdkbK3G74ykyzPyE2EPP70cC1sOtjGJ6RW
 Zf8Fm03dyXVTcQEaV1c3wmwMVWl9cgdnvhj5SQSL3RiP1H5v7gOZhbrRtmUodAolWKcP
 +yBuo9xHvygM349v824Uf9BLWoluVnUlh+CygZEjSD7CQQNRJ8v+5qC/YPbVkdZKSQCU
 3ztDljzOdTpNQpZ5X9U9JFH3oFg41HSxWS2uU/Fw4C4a4knnlVuvXJlAvntEVreRheEb
 RNug==
X-Forwarded-Encrypted: i=1;
 AFNElJ/gtZsI0S1jAgncbW46V4QuTZ1o8ukHDO7WsCeXq1oVlNlbpBvL+JvgpGSZ0Mzvwcx/7KXabz2UUQ==@nongnu.org
X-Gm-Message-State: AOJu0YzvkZMddLS5MBdIsftKexxyPM/nLHDNPaR/XQgpHMQ66jc6vm+y
 dWez+Iv/2YG4UCfBTpDxhVsPGxejsnefQhOt9/CsQOjCGQF4GzxcNzrQMVY+up9SU/A=
X-Gm-Gg: Acq92OHHdi9sr99wS635iuKXTh0gpi4Rz3l1pdFRZNXNg41+N2+shB4bX9SiJZSSmdX
 qJ2Jz6o9U+Q2d/Xta9uppoe/BozIPXovA0vZ7UWe8knJJOYokWIHQKxdz4v9fjv3EW2Rxit32Kh
 XXTJfp1vbjDghARWmjCCrzc9RI/yzs1vSHMf//qRY0Ayc9SkbQruIc2iHRvBOeeCH+uvaZH+GhW
 yg0D1p0+3y6PMTmLHHROTf1Ap/KlOS+oMyi7eLZ1szqtAGLId/mO40ItQNJD4g0JjniPmEyO5gs
 W3FepN4DDuyVsDrjy2HLsqulfGxXzYXpXorDFMVrTrTg9OvJZmwP2Rp/P9Mjf6gXl7w/trArSqh
 g+YPOJSe/iH5RT9GrJQcK+JZ9Po4qiFjSDSSs3tdw8/qkj46M4tMiaK7+1j78nba4Rg33ekMu6F
 LT5nQp/jfNIMUB5ZRGrJ+B3zPmiEYVeCpFKK6UIVK2AmMFvT0=
X-Received: by 2002:a05:6300:670d:b0:39b:bc11:9ec5 with SMTP id
 adf61e73a8af0-3b40fbb0aafmr4246269637.13.1780075656943; 
 Fri, 29 May 2026 10:27:36 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c8583333e80sm294077a12.18.2026.05.29.10.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 10:27:36 -0700 (PDT)
Message-ID: <78b42dbe-1261-46e8-9aa4-cb6b38443fc3@linaro.org>
Date: Fri, 29 May 2026 10:27:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] hw: arm: use logging rather than hw_error
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260529143624.158935-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260529143624.158935-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 5/29/26 07:36, Peter Maydell wrote:
> These patches switch a couple of older devices away from hw_error()
> for "guest can do something wrong" or "guest uses some feature
> QEMU doesn't implement" cases, replacing it with qemu_log_mask().
> 
> These aren't really very important, but I was at a loose end this
> afternoon and they do let us close out a couple of gitlab issues.
> 
> -- PMM
> 
> 
> Peter Maydell (2):
>    hw/intc/exynos4210_combiner: Avoid hw_error for guest errors
>    hw/dma/pl080: Don't use hw_error() for unimplemented features
> 
>   hw/dma/pl080.c                |  6 +++---
>   hw/intc/exynos4210_combiner.c | 29 ++++++++++++++++++-----------
>   2 files changed, 21 insertions(+), 14 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


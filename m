Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1A1C87FCE
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 20:27:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufP10-0002DN-Mg; Fri, 25 Jul 2025 16:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufOxY-0002fP-03
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 16:24:04 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufOxW-0001S8-3u
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 16:24:03 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-748e378ba4fso3311082b3a.1
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 13:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753475040; x=1754079840; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JTuumkgFOey9hX3vvE2OZMKLe9YWvrTZUKA/vxEnCkg=;
 b=c8AbbcXuQaKzruuaebWoA2RrI9cu0t+m/dWe/Xw2BTtGvsHeW84arX3q8yfYUmjlkt
 1Uojtv/27nmLQJkkTHBHzI4nzQSG/+bATlEt8ji+eHcyClgrRtE8H1wqHIO07RSJlbj8
 ntvsl37VnoJFPQQgIROVb2oqDkoo9XSwr2t3nuEiM+KolUzYWYvySl93ptY9KDhxY05a
 +i0HlsSXll9ZzaYtxSgdcETphOI+fzNfbdbtTjhn7f+H8WOwKi4wNvY2hRcboeM5pnG2
 wVETWQs/aBgKcyeYKrWBCu+3ZmAXTpdSCOQ1a0suuN8/PbXvsBAZdR/zQ3ZR2NTROq61
 A1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753475040; x=1754079840;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JTuumkgFOey9hX3vvE2OZMKLe9YWvrTZUKA/vxEnCkg=;
 b=a2LlqHmDr3mQC0YBr0Xm7GXCLOer6dUAzMx5FuK/r0QYIkFMEWcAG/Vw8ODyghKTlt
 SSF4lO1MYzqyj3KCrW6mCa9A3RAh0pEdVOK3Q7Yn+4GGow9xH75VIVJfQ0LrOaRRYEWw
 qiVai7Z+a7IOEMnJ1h0hGaPo8JMSBlkh3LfeNAFeyIgHVv9NwmShAx85uSGUvBubkLWV
 W9Mwpt0h+8bfIE5+nNGhjPxDa1m0yU9HbEE+BFlgUJYqhLdEgA+zg5LQAnXkDkmKUSQK
 i8EyCHncmPD/QGqrzhy2L2pfKl4jsl4Pf2PBlTiY7sdyvIgSFwUdMKtKofb0VGLf9k1i
 uPhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSvr2obQIVmzHza1I6/3xGSCbz9ZKGPbkSk3KSNDjqsgmDQqYAQFx4DnG8cYyCZp4MWQUpJjb8kQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzd3IHdS2jSy0tcMtBN5XLOiGU7kw2L8pmcbSK9nuNUEpjG70Af
 gj+4uGDfuqe8Ua8gJ4o08kkPhYm7rX9RzY/Hw6Dv0EvHmXhar3m0ub4i1MSl/8jQXIQ=
X-Gm-Gg: ASbGnct/BFKpLO+1QIgF2VXQrrB2DdlRARpehDoLJBY5FNUl/HBykQXZHhZ3wPQEjiq
 kRWj0Dt/dLdm6jGAG9r4LXEY6HpVcUU9KafSrdQZcuPPEleY4ULkggKdC+zWfKWRewbBaIcb8Qe
 ek2J27B8brnvKvE8jwE5hftABVLwEKno9x6h2blvnBuVjF+TGKc3eyIvBt4HH35VppF8S59MuaF
 bx8JOsFbthJadT6e3Lb3NBkOlNJ5V2oIrst/q5Q8NedR4Jvq4d32K+I1eFoJfzm4HQ+SfqkN40C
 cYOTzqkg/0kDAmKdGH6Y5s1cNrB+UFC6e9fSuuRA6p3+5eT7452L264OhF9av6ztX/UojwjeeDl
 SsVFzaAwoo6qmgUVgTbXLzZ7jVpJayt9vpxbFx088RhUzapzjgRwsdmEmiAUqL/mBpS2IAwGaY9
 RP5Q==
X-Google-Smtp-Source: AGHT+IEA6s0V2Ji7HqTc/du0kYggNoG2JNE8Mh+e7z1FMMNUg0fL4ugKRLwslHC0plSq/Dbhz/rqXw==
X-Received: by 2002:a05:6a00:1741:b0:736:4644:86ee with SMTP id
 d2e1a72fcca58-763343da65dmr4833278b3a.14.1753475040354; 
 Fri, 25 Jul 2025 13:24:00 -0700 (PDT)
Received: from [192.168.4.112] (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640b8b0911sm342813b3a.124.2025.07.25.13.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 13:24:00 -0700 (PDT)
Message-ID: <91da16cb-45ee-446b-97df-95ef956d1386@linaro.org>
Date: Fri, 25 Jul 2025 10:23:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-10.1 3/3] linux-user/aarch64: Support ZT_MAGIC
 signal frame record
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250725175510.3864231-1-peter.maydell@linaro.org>
 <20250725175510.3864231-4-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250725175510.3864231-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

On 7/25/25 07:55, Peter Maydell wrote:
> FEAT_SME2 adds the ZT0 register, whose contents may need to be
> preserved and restored on signal handler entry and exit.  This is
> done with a new ZT_MAGIC record.  We forgot to implement support for
> this in our linux-user code before enabling the SME2p1 emulation,
> which meant that a signal handler using SME would corrupt the ZT0
> register value, and code that attempted to unwind an exception from
> inside a signal handler would not work.
> 
> Add the missing record handling.
> 
> Fixes: 7b1613a1020d2942 ("target/arm: Enable FEAT_SME2p1 on -cpu max")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   linux-user/aarch64/signal.c | 93 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 92 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


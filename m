Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78B0CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 10:35:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBseS-0006YL-Ki; Thu, 23 Oct 2025 06:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBseO-0006XI-Rt
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 06:34:33 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBseK-00075D-PV
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 06:34:31 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so495207f8f.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 03:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761215665; x=1761820465; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Herf6G9OYYXgEMxMbMK6HRs11hJAEUesZ+KdZzANJ38=;
 b=DOD7xWGhRTt/PvTACFc70l+1FIV+erFcqxmhdTg6ne1uilMa7azWH1pOnUslKcUzEK
 2/ae+52Hp/GujAJ8n16QzDs9uco5PRW933rasjnFL3aPV6ne+ImTFhZf7EvUmAG935W5
 gYDwasEIHNerUn64ORJOYck7paDrW8pXKKZTSNQ59kK2YuQMmvJZRG5UcCxK3v3+335S
 E6UZ0zvfOJnlUP75GzJ5Zi7YOqHfUBTNv0UN1+LdAfM2He0eZihIwxcFMa6SRoec2463
 DLCN6z3aeZaf3byX6RdtZhj/ezgUAytLUGRKNWX5uf2dwrvFR0yfCtaYbtX7gJkvdFcv
 OHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761215665; x=1761820465;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Herf6G9OYYXgEMxMbMK6HRs11hJAEUesZ+KdZzANJ38=;
 b=b14P1H4CfHZBGgooEY2RZIZoPe8t6iowj62HIVEhakss//RX7PET2xIYZIKwAhEf9v
 h0+KGDkSsIWiwNlMJF/uWtZrTBG8+4JCs5S5+QwXBJumh4qBHQBa0KB864HysA5YNx38
 1Oeo174jUmpj1nTbCJSQPTPoCNpf1u9ufadLRstyJBLbKvGofPo/0T+pUPi18OAfj1Cm
 r/GgT9cridIzaXYVlxMdGz2fQvFdC96N089NM02PBPW5vW4jjVc6EE3qAxtyct50SUWV
 g+IEQIjFKsZ36lHVNkdbI1QV/VfUVYzRWIIFXp5mWeqGbeIUWQCgM9YfNB1vO/MzqFzR
 0qYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW7uYfjVcVEqzXR9UwJiBJK+4gZtUzoihPay2dT6Ne8SqIz7gPdItSrwlbbv5PQjTHEssyfWW8EA==@nongnu.org
X-Gm-Message-State: AOJu0Yw9gRlhiyXxbVJRpfcrSww13mRqfNzB+AYRo6xJKEN8Tukchauo
 d1n2R7PIeinO4vMhBhy1Wir8+/jjjDlCPwdxpHSnGNQCpVZeeCsIvKh4KOrFfV/Y2aaORKt0Goy
 8c0TcRUo=
X-Gm-Gg: ASbGncuwoexV1MdrIO7HmXZvLSE5Aj7iMGR/XsbAD1/BNf1XWHgN5faAzFqjwWEHC0G
 zOUaHoR2Ciy4FWDFLsYaxQZQ0eIbkBCklLy4h+Lm9Wmj2MbLQSDkgsRLQ13e2oTPm9FgX7u9g0A
 MKM/ZruPJ83zdyVkSD6T9mPBb5+STmeK6Sucx74mYTwCZuJliJJwzP7koIAbUsSRsNMLM3FOteX
 zRa0u716J3a6Yxw25/tMYYyBwXo6qZSR/7jbWm0naVyePhhIaskG2L6wtKQOZFTvDpKKc6eQJB+
 JqxRZnwzPYzqdpEKKwLh09XfagLtFCoQrD3b8793SvaLibsiSuzkomTds9XYToRRi2Tjj8reN3E
 5sLjrDjz8hg0gkqKqoxw9DYU/qHE5E2LF5o2/GJk1MZhNz/7x+xo0V3DsokIbCfIQhoyXNeOd9W
 8nYQAK7cvFuKXbf+Cxb0XG1D3mK6OGGPEaM474GswJaNo=
X-Google-Smtp-Source: AGHT+IHQ4GIMmKMJHlPADhCkgXORbpzWpN8glVx/2ABfKnoswXCNNrcTs5sGwdLb9mRPbosH43zguQ==
X-Received: by 2002:a05:6000:22c5:b0:426:ff7c:86d3 with SMTP id
 ffacd0b85a97d-42704d4423amr17482338f8f.13.1761215664707; 
 Thu, 23 Oct 2025 03:34:24 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898acd69sm3276609f8f.24.2025.10.23.03.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 03:34:24 -0700 (PDT)
Message-ID: <c1037a81-ffb9-40d9-a76a-45cbb33bb09b@linaro.org>
Date: Thu, 23 Oct 2025 12:34:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Add assert to arm_to_core_mmu_idx()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
References: <20251023101339.1983809-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251023101339.1983809-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 23/10/25 12:13, Peter Maydell wrote:
> Before commit f76cee647c ("target/arm: Introduce mmu indexes for
> GCS") it was impossible for arm_to_core_mmu_idx() to return an
> invalid core MMU index, because NB_MMU_MODES was 16 and
> ARM_MMU_IDX_COREIDX_MASK was 0xf.
> 
> That commit raises ARM_MMU_IDX_COREIDX_MASK to 0x1f and NB_MMU_MODES
> to 22, so it's now possible for a bogus Arm mmu index to result in an
> out of range core mmu index (which can then get used as an array
> index in the CPUTLB struct arrays). Coverity complains that this
> might result in an out-of-bounds access.
> 
> The out-of-bounds access can't happen because we construct all the
> ARMMMUIdx values we will use for TLBs to have valid core MMU indexes
> in the COREIDX field.  But we can add an assert() so that if we ever
> do end up operating on a corrupted or wrong ARMMMUIdx value we get an
> assert rather than silently indexing off the end of an array. This
> should also make Coverity happier.
> 
> Coverity: CID 1641404
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



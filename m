Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D151C109B468
	for <qemu-arm@archiver.kernel.org>; Tue, 31 Mar 2026 13:20:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7Z0o-0002h6-PH; Tue, 31 Mar 2026 09:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w7Z0m-0002fc-BY
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 09:20:04 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w7Z0k-0004dj-II
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 09:20:04 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4887d4c6234so8325445e9.1
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2026 06:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774963201; x=1775568001; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vpZWb/Xr06j6y+c297zVddDxDkXuJByamNTk20R0bTE=;
 b=pSELSrxnL9FaHGeTnq0adAOu4e4aqLhZF4vXr/3vJ0OnH155etC3faCnZhERL+ZAFs
 +3gDp28/73gMri/La94t/DJoLVeQYSBwfrDqnrrDiWbPJbWcZzuYnxPMDO38+PmoD/T1
 PZLwnm9ojgPo/DR4Me9PfC6LwZVo2/jXGayFsI620wJtaIB1cOTwfYCdUl7dHnyC5sqL
 jPPpkjNFZGevB7VYu2T9bjJmpMzJJdx29C9uD+dwd5EAlDou/cnCroZeWpRKXsBgyDxA
 +juvyxBPI2yvFPoeZuZ4AmPaQmB/IWqJCCDYLiJR75yZGfhhMu+thH6MV6l2wCqVxBmw
 IrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774963201; x=1775568001;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vpZWb/Xr06j6y+c297zVddDxDkXuJByamNTk20R0bTE=;
 b=De79aMpSjUQqHdpiAPoE8zPHy4WWIFMYoGyTWBXjKSndDagGBD2mTkUF0Lunv08F2L
 557s7BTlzh6si2URjIKSKtGoKgXipDmmpUI+7LMuHRG1D00z8JdPUK6/+/ec6LYI8bcu
 zsJ4Wol3bNIYIw1EPFcQtckxHA4lFOXAyCIFxWcT7Szvgh7bghyJPRGuIZsY+0lk0eQJ
 rk93rNFjJ9cVu8oG9k6xLRnojeaSTb6aqrZ8dkJLEimSBGjK9j4CrWcVMePuqLEVlvdd
 dluSjzeUshY9IQtd0GFR/7aaBNmM0nEuMrMAbBe1XNZRYnRb+nAh/lQKL9q3lo6O9FGi
 98Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBIh4TSTojoxG8Pe4aA7FcGfArGoC2uyHj5kgDRkB17QhTAJ7iNyGgD6iwVMkZz2y5XfpeHcKw0g==@nongnu.org
X-Gm-Message-State: AOJu0YzTIznkVQUCega3rt+JlnweskLE+bWv/BVlY1o1bOzwD/yOVPqf
 5ANpJEvA0AB5hzVJr3/AngZF+lC6lDRuvYMm47r4nvfE3Pw3ylrdPQWwWTR4HCGNPiw=
X-Gm-Gg: ATEYQzwUr1PFCeoa3juIygYYnxaK8vVhFiZuv1CUTM/dOXn+gT+j11V1w+rFJ2bqx54
 ECCSvOiUmnv0tTu08WMstImJdaL3Bsw8lcd8F1JDtkZCrxiIEsZrJHZRYUylYSqfSy/Uvrbb7/1
 LcjCkDrG/HjO5enEYVwc4J+QZCo/jaCI40uMTPAtDQkfjetJXy8uRztPW8kWdtL3zAcn4imUFBB
 Zr+4JFd7QGwx2YLUhbuxK5ZOfKJhmpW/gBZC56yp3BOcTZfKEhqS2MP+ci9Z6TossHgpQczayIG
 b1hlT0MILGA4mZVTkhbVbbFLP1beSnyLQqsG5S1Gslzg7TciIFK+R3/cmbAeIDl0cmTYdXlDLqi
 y1GxwkkNKjfvoXRJUVe+OIVqY4jc3kmc8kHNvah5yNEaU/9jtdwsfz8hwUMal0JKvv/gOrJehy+
 LkLlj8DdG468X3k02O3XJ8q0ffG0lHjv+ak5j6ZsulN96RhGdpuWYZ/RmbE6k0VVB1nvh8
X-Received: by 2002:a05:600c:8b63:b0:482:f564:d613 with SMTP id
 5b1f17b1804b1-48727eafa46mr249847485e9.15.1774963200790; 
 Tue, 31 Mar 2026 06:20:00 -0700 (PDT)
Received: from [10.193.39.66] (43.149.216.82.rev.sfr.net. [82.216.149.43])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887c8797ecsm33572065e9.8.2026.03.31.06.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 06:19:59 -0700 (PDT)
Message-ID: <16410351-5181-47ed-aac4-f3a90fe80568@linaro.org>
Date: Tue, 31 Mar 2026 15:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: do_ats_write(): avoid assertion when ptw
 failed
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20260331092305.2062580-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260331092305.2062580-1-peter.maydell@linaro.org>
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

On 31/3/26 11:23, Peter Maydell wrote:
> In do_ats_write() we try to assert that the cacheattrs from
> get_phys_addr_for_at() are in the form we expect:
> 
>      /*
>       * ATS operations only do S1 or S1+S2 translations, so we never
>       * have to deal with the ARMCacheAttrs format for S2 only.
>       */
>      assert(!res.cacheattrs.is_s2_format);
> 
> However, the GetPhysAddrResult struct documents that its fields are
> only valid when the page table walk succeeded.  For a two stage page
> table walk which fails during stage two, we will return early from
> get_phys_addr_twostage() and depending on the fault type the
> res.cacheattrs may have been initialized with the stage 2 cache attr
> information in stage 2 format.  In this case we will incorrectly
> assert here.
> 
> Fix the assertion to not look at the res fields if the lookup failed.
> 
> Note for stable backports: the do_ats_write() function is in
> target/arm/helper.c in older QEMU versions, but the change to the
> assert line is the same.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3328
> Fixes: 9f225e607f21 ("target/arm: Postpone interpretation of stage 2 descriptor attribute bits")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Not a regression, but it's a very safe fix, so this will probably
> get into 11.0.
> 
>   target/arm/tcg/cpregs-at.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


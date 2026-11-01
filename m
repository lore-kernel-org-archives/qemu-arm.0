Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEF5606A31A
	for <qemu-arm@archiver.kernel.org>; Sun,  1 Nov 2026 01:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pW9Hyaqa
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNKHE-0000SM-VG; Sat, 31 Oct 2026 21:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xNKGu-0000Pj-90
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 21:22:11 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xNKGs-0008AX-Ax
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 21:22:07 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-8a058f74a54so668381b3a.1
 for <qemu-arm@nongnu.org>; Sat, 31 Oct 2026 18:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793496124; x=1794100924; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cHqm3+TeWj+8hzvxCLGPdnSK1V8BMMlAVyJoZ3/5zAc=;
 b=pW9HyaqaDJye/D/CH6kdM7/JMvA6+qa7JuUu4RBg6WK5dsC6zFRK1KpG55aP0E0zqq
 nNYxpDP1dusvpavMMwdgI6CMq10la5qE8xgmGoSol+ciJAgNH3Bws2TLNTOvtvni3haD
 d2+BKsLbn10/RFO23bDcUZ6KD2Zt9hBhhBA5IKb0adTjYLFFqCkoobJGwED9WNzW6T5f
 YIs0iupd1HRocguEaogD+5ByS7GXE16Wu54fEji5YWyBf0r67PumpHUe7qoZaeoDC1YJ
 0ecIUMYwACBNcWwogc/QjAvVZEN6ZxBQ/NUaAr3A29VZGRxza4bdrIl6o0gb04toz621
 DZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793496124; x=1794100924;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=cHqm3+TeWj+8hzvxCLGPdnSK1V8BMMlAVyJoZ3/5zAc=;
 b=G2IcMhOwCYwhmoQHQB/430FXkUHgMs70EzD6IWyVSqvTlLz/3a3ml02fGoKfkWnjOM
 GGa6kH38fRw+FsAKXoHYVzLAF0QaauZfp46t3MrtKT7pWpgOAW+MSUo28Wv1YwBAId10
 1uVkiwGO69KE7UOgla8cd1+y86PD7pQcbi5Ohhxr7Uxuw19juwPjKRpTrJvuqlNSBKI1
 nJHum/f/Qx/m5N+e0WRg9Y9Jd+G69Wbf8U7f3v8JuQiawjfXGlI7e1sdjXxlpWGWJwhX
 N4dMxAb6k6vMGbM2LHFF8cNzFJbfT2kYSNuBtLtPIOOjTXtcymaTv43ThQ1mRi5wdYZk
 350Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwxzPfjslQl37uTcV8jfgi8SnfXw8sHVGhXS3YTozleMcnozhphRTfG7LrTWSmaMuAbpePgD02QVw==@nongnu.org
X-Gm-Message-State: AFq9FYKi684zhqPrsA2QhwK9AD+VUIVCIUZdYWXJXEENJyTpFeMheB2O
 ++QFAUESIjZyjMAgB705919NCwjn671qGkZ2/c2QFsW568QATtpHKiZhoR7YP+TXjho=
X-Gm-Gg: AYBFou0eOmhHc/Q2xRIdI7uJmslvvQG06TPgAaL60Pl2du9y1zD3P2UIRy45/J6jHR+
 qyh80lmJql/JlFGY/+TVLNtK6dwpNrnB6s7CwNG/OxjGAi7MVci9lCmC/l8P7A1d5PsbwLqoIbA
 W7CUO6MUVDTHq9zZ+r+ATQfi5iEMRd36lIteogp1qOxGeA9NvjKMy6OyzzK95l+zWeP6B4dymVT
 cjZfgL9hOXA8asTGqxcCuPmeIQJe/eXhfdrfl8WIHASIE0VQLsu1wobTRZnTIBb1nXWWIclGSq6
 vj0Iq20kPWlTSBhf60BkSvcOkLX3WlJBWT9g25S+PeiQqnO/BYVJEyZoITPrW3YbsBSpUATgH+m
 j6NczvIB1px39Py34GkPJ20GtuniL0SXTss2mxIwrPKujrAAZ56OVKii9k92Ca6a/DQwuvqVdWd
 mhnWtt2c0+VUMRfSZTk5QvFT/eaGp9KGlVyiqkgAy8R4hPYthh410j3D2yHzY6Y/binmTYus4lY
 CbThs9Eizt7I7Xo2ctVUhY1Al5v9vV9ZVzAdvYbXLJFD3YvajbeYqFdk1L2u5H6hHD+t4aNBIYp
 FeDhBysP/C7uoBqMt2SlJb4lK3bwm9fHs3eYsoy19Bn2vOx0YxzjNfkVkxdVmuKnWnVJGoo=
X-Received: by 2002:a05:6a00:3987:b0:886:a737:e0fe with SMTP id
 d2e1a72fcca58-8a9bea67183mr5122999b3a.23.1793496124392; 
 Sat, 31 Oct 2026 18:22:04 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8aada2dec47sm922146b3a.36.2026.10.31.18.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Oct 2026 18:22:03 -0700 (PDT)
Message-ID: <bdd52452-f683-4677-b5f6-5b8101a4585f@linaro.org>
Date: Sat, 31 Oct 2026 18:22:01 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/34] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261031065823.191966-1-clg@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261031065823.191966-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/26 23:57, Cédric Le Goater wrote:
> The following changes since commit 4075aa42daecf701cd3869da8b3271dc3c04a4b1:
> 
>    Merge tag 'block-pull-request' ofhttps://gitlab.com/stefanha/qemu into staging (2026-10-30 15:26:36 -0500)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20261031
> 
> for you to fetch changes up to d83158a1e9f6fa74cc7ae3bdac9e4fd5077909a2:
> 
>    hw/rtc: ds1338: parameterise the register map via a device class (2026-10-31 06:52:19 +0100)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * Fix AST2700 SMC segment end address decoding and DMA flash address mask
> * Add Winbond W25Q33PW flash SFDP data
> * Correct AST1040 A0 revision ID
> * Add AST1040 FMC and SPI controllers with SMC qtests, and stub
>    unimplemented devices
> * Bump AST1040 functional test image version to v01.00
> * Add the AST1080 Platform Root of Trust SoC and EVB machine,
>    with functional test
> * Adjust Aspeed documentation with catalina-bmc and sanmiguel-bmc
> * Remove unused SPI flash controller from the SanMiguel board
> * Add PCA9545 4-channel I2C mux with qtest coverage
> * Rework the DS1338 RTC

Applied, thanks.

r~


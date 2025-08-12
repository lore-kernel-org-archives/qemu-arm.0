Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E77AC87FCB
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 06:26:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uliSi-0001u0-V4; Tue, 12 Aug 2025 02:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliSg-0001sw-Ms
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:26:18 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliSe-0007bl-Ad
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:26:18 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b77b8750acso3103542f8f.0
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 23:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754979973; x=1755584773; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MaZesIfsMfFiMIqO7r3EVg8Euj+Lu2UnTUbnzTqaLUI=;
 b=DMG4+kLdcTM6nHGqFJUXLfeDXot7jk/EHNNNHLVnFrO1Ad0N1bY4kuJPsWsFDG2Qke
 cYZByCXVySy6rp17ymizdkjq6KuWpylDyiJ2msgvwbIDGoPHWOVr+3b7p1i97Su5D77M
 TtB8p5L799BDUD/UKpBkVtfH1+wslSNVtsj8Rz4FWOPmBx7NGCr5JONfDIIvopieo8B8
 6HgCHVUGfiZloIt5FqhFWA85JoujI4nyg9LZ6m8tSE0bnW+sv2B0hWIrgtK93LwSleBM
 heKizj7l2hKgXbekXRQHr5LxN7N4jRHd9SluWP7pu/OzYf449ce/B7GSk0HAglVV5gOX
 pahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754979973; x=1755584773;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MaZesIfsMfFiMIqO7r3EVg8Euj+Lu2UnTUbnzTqaLUI=;
 b=AGwUP7cqRAZmqmPwoyuYDljZYZYzN45FRqY6u1UHtHOwtMERWDFNFZb7bT88zfNa1h
 VdP8AanqWJ9pLCw7m1QsU2w9trdZrkrMRZrK3TqLJlOp8WqztMsEtfVWykOGjbIDetrL
 yfiBcoLid6/t3my85BvTbeefrmwp8nNncUUzd+UN+GqKmvUOdOOEgsb+kosqmfcs+wiR
 wg/6MRG+O7FM4JBegUXFJLTmouiKwWmAr+D4H4R+Rgp50nTu5pZYbEGx2LFKUN/siWvE
 EsDcp5p688JoKY3cjeqrDrblwCpP8dSxI1Nc34ABQPohWsQMHdPdsC89k9JsfWRNccji
 4nxQ==
X-Gm-Message-State: AOJu0Yz5na7ju0T2yYKOjspYSklv+ao6djvmBf1jO5f9iT0/4SDtgQ+A
 OHloNF/WPIE1Qvfp/0MSw2jhxhYhOLMCYWqLyAYn9aHgVXAgkOU7u4w3RPMd3IzP8XE=
X-Gm-Gg: ASbGncunn5e//1dMQMHRGntJCjgSouo7D+MYJXmwHM7eb5ds1tV4vO8c+GDRhscugJ/
 NhkVL571tlQspS499CbBXZredtzay+MgkP7fLjEhcnfVn4ioUVu9YT+ejg5R5qj3a5ajRtZ6MW1
 QsN+RENL5ejY46egDyKi1WA1hg8RHBLoCtqEsXLHLOKejwrBRQQ+MLFcVzTEZL6pxvhiw1n+tcc
 O3EMZ0QgkTnWm5sulwNlaqzlH8tVBopbx5Tm2GyYMqW11a1HuKeks8jXD+M20RqOpr8UpwnOD0q
 CZO92RsokSB3iIOiG4We1V5mVnuGVmbEzpDWHDowxaqyhDExozVba9rpeiYXWKhzX/6LHTRpZd+
 o9vKK8TahRYfU7MA0m+HsvAZcXwdxi8o8TDrbWOqnbBTIMvTv0SzwqKipk3HIvsAP2f2Gs5tpVW
 LE
X-Google-Smtp-Source: AGHT+IGIHjzsp5mHSDzX845fNj3QIun4CKGDIGmtOFUoFgqB1C6G4qkkQ9q8qsQc1TO1VApMWR6i4w==
X-Received: by 2002:a5d:5f4b:0:b0:3b7:7909:5b22 with SMTP id
 ffacd0b85a97d-3b911160834mr1716920f8f.8.1754979972783; 
 Mon, 11 Aug 2025 23:26:12 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c470102sm42759081f8f.53.2025.08.11.23.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:26:12 -0700 (PDT)
Message-ID: <3abbb8de-bbe6-4404-9714-50b487c46a8d@linaro.org>
Date: Tue, 12 Aug 2025 08:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/85] target/arm: Expand syndrome parameter to
 raise_exception*
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <20250802232953.413294-24-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250802232953.413294-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 3/8/25 01:28, Richard Henderson wrote:
> Prepare for raising exceptions with 64-bit syndromes.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h     | 6 +++---
>   target/arm/tcg-stubs.c     | 2 +-
>   target/arm/tcg/op_helper.c | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)

Maybe re-order with previous patch?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



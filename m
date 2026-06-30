Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0F5C43458
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Jun 2026 17:17:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wec4a-0001B7-TW; Tue, 30 Jun 2026 13:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wec4Y-0001AF-Jd
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 13:16:34 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wec4X-0004Ab-5m
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 13:16:34 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-c8b49639fbaso3020742a12.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782839792; x=1783444592; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6W4I20UPxqNeXaKpYptGY6h3bqMXPS1EFmGWlS7RNjI=;
 b=tI+JAW3RcHMD79ZbehiFymVpHNUS4FNiJzD9RUgfhzizdAUUq8Y65EdXf4iFw6P9ZI
 upXVI1LsHKjjH0BuhXc3/A9j06RK/GfwSvzQxXg0e8K1IlNJD26Mit6A5HqnSVe84XEP
 /qN5CNQOVG33UG5TYN48ZBF1f8RJG/TYA9VzOio1d8sBZ9KSiPaHqCnrRohyfcGPbd6R
 2ZqZ6lF7X5/ilcj3aWI5llL6Gx+PDbW6+2r7cbf/cx0knWphYYoR95zrFozeGAtXAsf3
 2HW6NgFb4d7Af1eYSb4aRxL5uI61WyGKjlcDh1dXMes7l2J43UDk103+ghhmVxuO6KeL
 iXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782839792; x=1783444592;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6W4I20UPxqNeXaKpYptGY6h3bqMXPS1EFmGWlS7RNjI=;
 b=iueg7AsbXY2IwJhgdk4VTK+ppsc4pqk+ObP1elM8qn8gu++wTmd4pvRh0nTv+UKN2g
 I6FIk2WHkfDO8tCihKPrIrfTuBy7l0BgLxJXZ6lgU6Ng49AvHoY3nsSSJ6ObkXig/Uvr
 haGM/UhA3eayzHURByysRuAB3MJLzNIu30pmDoAHpis3hlGeY8wFM05a/14Ha1Jw+h8T
 sH39t9cSkXGUPVWugmiZLPaKqasN8Dt01HsKaPRtC5H+BbyqPM9uBBpHifJIv9V+PpEb
 B67EUEIJFdx4xiuAJ8Hpss7nVp0IUTNZfSUa3JFXhW4j5MVuJbdr6bh17+zWK0CHsizQ
 rqcw==
X-Gm-Message-State: AOJu0Yy7hRPd8nFNo0dMOS7LGLVkbsl+8D5J+QFwtRbaurrgDHyb5t6V
 RH8W1pm6l7I9etwSDB9BLiVBo1XQGtZtZUyzQgtQpMC3YSDyxaibLbaMCvUFDTWbooM=
X-Gm-Gg: AfdE7cmpA0dls7Avo++uafuPNS1B4hi3hcgh9dnkZK3m1Z7w6TNhrmzxU7x9/DSOwz8
 ZHeoHdkjVkrO5Qz7AURIny9/WY9pUbOxHmpauZBaSgsLFK/Elj4i34jG4/LIJp3Sj9IOsaEtDU+
 MQHNkJVcmDUOv6AMkmCqgmaqQ3kKyITkYCvXOVVLC9UJwc7bUF4xyqAcwhPlVKq9J7zpfliTsFc
 nX64leb7QuLTSlxOvDFkv4qf+Dthv2pL2c69c3Hs0EHm2qHet0qCMtzKOKsuRPrscduWbbQKzWO
 jF0DQV/LrEDURqrXt6i6AjGKYQbVkaGDNxI/I08XHh/StBZZ58PPDWMLxQoDGFHwhBfDmcOzAIx
 s/VkXXWupHvZGMmLjrZbASkyUWVjBqHHs4oD3ycljhKhK7afrpbaeJ+08+y7vQVb2rokVjMp333
 40TFBTO2QwRK1oB2LIXv/DYPevAdImaur4QF7k1rHhwqnE+TXCpvk2ujkPlg==
X-Received: by 2002:a05:6a21:138f:b0:3b4:b340:411d with SMTP id
 adf61e73a8af0-3bfc50e7854mr4111243637.24.1782839791153; 
 Tue, 30 Jun 2026 10:16:31 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c9bc011254bsm2028027a12.24.2026.06.30.10.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 10:16:30 -0700 (PDT)
Message-ID: <d7f02bdb-4096-4f29-b479-dc10e119aab6@linaro.org>
Date: Tue, 30 Jun 2026 10:16:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] target/arm: Implement FMOP4 (widening, 4-way fp8 to
 fp32)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-8-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260625223200.763198-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

On 6/25/26 15:31, Richard Henderson wrote:
> +FMOP4A_sb       1000 0000 011. ...0 0000 00.. ..00 00..         @mop4_o2_s0

                              101

Oops.


r~


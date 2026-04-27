Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5F3FF8868
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 20:33:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHSe5-0006iJ-HM; Mon, 27 Apr 2026 16:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSe4-0006fb-0X
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:33:32 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSe2-0002v3-Er
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:33:31 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso72671675e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 13:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777322009; x=1777926809; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OdH8vBgTogkdfzV3sx7qVuVQ1u0wH+kzn6JUPF4PydE=;
 b=ymyMQ933GLk+b1AZ7nlRBPxxW+tkhd67460FzbbVmIWw2P4BFO8ZTS8G1WQ6IXASlf
 OJatElGt3+4DSDjMndO3Y5czVohsg+fYWbt1f9AUXeFL6pJ5ZviWhMyQCYBpO0rWyLBw
 RostUyWxQxMO2rboR+3BEiPtGdYV1riQH4ceO26999kBOCjF4MhISOAmtr7A1qU5ZNOH
 99bFBjjZjj04MFwXo2fe3Es11CpotGK1VKbJj0GyurK8Xv4YRtbnt8IZVAzoC+AxRef1
 44lAQbdB7n3jktu+jStMa58QJWKcMZU+PqxX0CjVa+G+jBlGHwd6JydhKAtg1cEy6bLt
 3bcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777322009; x=1777926809;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OdH8vBgTogkdfzV3sx7qVuVQ1u0wH+kzn6JUPF4PydE=;
 b=IUaJm7hAsXLEJW9QpY5WWKRtNRLcU4rNMwIvjMZ5QnYj8w4vMCKCA4rhvbth6KQtjd
 j3QU2bgF877/T92oT9N8ehyb2BDG8H4rA0IXVcznBRYLKF5PD/UDHLCAq/PdCyhcSYzz
 e5IMMXowxrvEGQg7r3xpj5MuzPvg54xZ91FSzGqE+atZElUY69qCpyrmyq5Ve6wlcBfJ
 Fbmazo14HUsOe8qVqryj06WrVoIfHunbCBQAH714esjGaYbJLrIYQvMqyeydWQvIIbi6
 C3jKIBKQ/JH8dPeLrpUjyZC2crAbqqIY+mT714Dk4b8SNTo5jdnmHceqDCJb0+g0OS3V
 N/BA==
X-Gm-Message-State: AOJu0Yz3xh590/+8lCCejNScrVUkyuVyqMRGKHievDVzEksaQ9+bLM2m
 sf1JryDjKSzXLuLFn0AlxZe1a3Owkc0pnZxo4tCWlG4lgL8BJOAbsCo27sDef4oOZ3g=
X-Gm-Gg: AeBDiesTgJohu2R/7WY6Bh74+WGZqRI2jmPUM3My42axQdYLVc+beJe12ewUN57EY+N
 PJDKE+kU9STsJvjgugSgtGSaUVA0gsyS/sasZk7lalcfCiNRBMAbTBgBPBBClSYERBi9nGCV3nC
 Ddjcd+OIFlBVb9dNstvkutIrV+myYXexe/BJA4xrsJpelbTHVPFSg0y2MqByzMqGBSthYlAIQa4
 iwSl320aIY5WtDBuOFLmiO2N4e3F71qTU7554VIcL4U9Co6s954AiKHXKM+V9rodGUpneWGtj9n
 A9HaXdSrfeGgnMj8RnbURuFylFo4h92QJwHIr+WJmGopS6WVvEWMHX20oGFRG+1M+W6nT9lqLBb
 LEy+cFcnd8gwl4VXwj+i9wMWYcz4tls4lvjb+f/X/jaD+fgBBL/mG4oUJ187ezgu/mi14mDdCv8
 THLsr7yistoLQIOSU6aS6twOgXEov/CkHIhiy3+8llxmbf+WmXrCSPfEE7/ahTm45eLgnF0unRF
 8Lw
X-Received: by 2002:a05:600c:34c7:b0:489:e696:8362 with SMTP id
 5b1f17b1804b1-48a77af18ccmr3369845e9.13.1777322009025; 
 Mon, 27 Apr 2026 13:33:29 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a77aeb223sm3731025e9.3.2026.04.27.13.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 13:33:28 -0700 (PDT)
Message-ID: <a59673a0-015b-466d-bebe-745cb6a4d038@linaro.org>
Date: Mon, 27 Apr 2026 22:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/84] fpu: Drop parts_sint_to_float
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 26/4/26 15:38, Richard Henderson wrote:
> Use parts{64,128}_sint_to_float at each call site.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c           | 18 +++++-------------
>   fpu/softfloat-parts.c.inc |  2 +-
>   2 files changed, 6 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3064CAC5B9
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 23:01:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3MrW-0007Or-EV; Mon, 29 Sep 2025 19:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3MrU-0007OD-Ne
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:00:52 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3MrS-0006hc-PT
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:00:52 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-27ee41e074dso48502725ad.1
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 16:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759186848; x=1759791648; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9sij2L0ue0j1dvYOyUzy5CprzafB5sSEoG0JUCJiYFk=;
 b=EMIUGPclPMQwLBq0tvLMkmXfK7RZ6wVhiIYEu77TZqGnRuAYnsUsIeEljVdqszJiVr
 D+jrpx2jXt+Gha5AD+qUlPx/HiJLMwyNRKvtAroHGfmybug/jR6exz+DhwBuMmvbv4Gk
 fWaS2/4FNzRv15weGe52gy4ZxcSUjwxOgSy41pf81Lxcxwi8+GyknzfmRUcUGVmNivkv
 u/vGdHn8vSBMdw5eIIvBlqo5r8DUOG3HDF/CG+8UhHvDCpCvFSOMN/Cmp/ouHUoGyJr6
 iF5S8REpDNDMjxdkXdcflgjqzkX99/PEZgV0TO/kXlRUKdW2Q9q/XhG6Jp2TooFjQwYR
 jKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759186848; x=1759791648;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9sij2L0ue0j1dvYOyUzy5CprzafB5sSEoG0JUCJiYFk=;
 b=QBYuo8hdkVdSxG7oIfkPlzBR90XfRNd9jGC466w6WhqW4qhiO9l+a6Te8drN/XoETQ
 Qb7M4tRiehQh2bIqLBKLkrFYvMFgaaUlkes4lT1Msp8CokpkGcRtvn+kFPIYZYPOrEhf
 zX0aEH/51E0se1jwZt/mYX+PKld9nxhLMjbETx0DBQ2KZRkyV6iaWY0DjfcHztKJvd+S
 RdG0es4eKmAc4A37r9FerEfiL7wh8m8ZwmjZgS1fKg1W+gaLveY4TIlpmFfCtxPHvhWs
 nupq6Bex/oaHBFjU3CVDGn7OSO2sFlRt2mUCpAu/MQRyRrManaLiRH0TpTRYTO0+3Yce
 aaeA==
X-Gm-Message-State: AOJu0YyRVCAs9s+IabZrhBgaIPIc3VijdJpAvUAVG2zvlX0ZQwfqxeJq
 LOwz1i/FKgoBY8qBQvsciHbh5MpDK/zbUOv/3IdNxAfADuFA6Zm9pZvOoOny0o06zrU=
X-Gm-Gg: ASbGncs4PiWIKnqSD1ESrLT22D0J0JtkFCTvLlH7YLXw6kab9Q8cu7TjAttFOe7w3+M
 6P+ppjzPymspV8oOjp7/AifYiJ+luTACVXuUlUD31IbVpiM9yLXSacj9ehT8aPg1/OwW5eBEGrS
 STmQktkkhYy0DMMHLD9M/gjVE+gKueDGgMGfAtcv7uZkCBpFpt560Y3QWrG2WENgpSX9/nZe9Gg
 m40poBrIPWkSymsaPEBXbFQffB01kUAw9a8mqku0KMR73jkVD/zysBcHaCO28UtBJ76+Eyd1hsy
 y7DtB9s3cM720jQZLhx85X3TJQ0yEmvaSzPE3fAlakkwotPjCQ4ivI95TYjUZJwqL6uALS7rWJZ
 v9MSKSJzm4YKMJJQp9f4TySFARWqJNVgNn7bTK5ngsJ5gbRBbkhEYAoV+
X-Google-Smtp-Source: AGHT+IHgWTi/kpJphKnCl34pUOdnSJLe/jVQMMvHdCV8VwEWVdSjpme/BXCrP7mUuVEOU7TuKbRmww==
X-Received: by 2002:a17:902:ecca:b0:269:8d16:42d1 with SMTP id
 d9443c01a7336-27ed4aac32cmr177688635ad.50.1759186848477; 
 Mon, 29 Sep 2025 16:00:48 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be148e8sm18314777a91.16.2025.09.29.16.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 16:00:48 -0700 (PDT)
Message-ID: <bed5e780-4fbd-4261-a8d3-ae83f6c5bfd4@linaro.org>
Date: Mon, 29 Sep 2025 16:00:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] target/arm: Add GPCCR fields from ARM revision L.b
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250926001134.295547-1-richard.henderson@linaro.org>
 <20250926001134.295547-3-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250926001134.295547-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
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

On 9/25/25 5:11 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h | 6 ++++++
>   1 file changed, 6 insertions(+)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>



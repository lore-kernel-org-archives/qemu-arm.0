Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706E3E87823
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 12:59:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnG05-0008Rn-II; Tue, 03 Feb 2026 07:59:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vnFzq-00089V-Kp
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 07:59:11 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vnFzo-0004fG-UZ
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 07:59:10 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so61644035e9.2
 for <qemu-arm@nongnu.org>; Tue, 03 Feb 2026 04:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770123547; x=1770728347; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UTf2zZnUfVI3aL4eHfZEebz0gWBjca7U3XVGGAlNN8Q=;
 b=avXMZIlfvu43f2+IdKBLQGVAMIgvgqeVsQvCkqnRBn76GCdua6IwXKCkZhq6FKVz8x
 QvAmYZuObuJCBInT0kVqHdNpGzd2vnHh5tXQwgLfby4EK0/Z1PYeb23Uf2nNygzPF22E
 eWN7+CGrSZaxa0ht3igO/Wk+L96DEdOGc8WOYOAIBIldlq9BGYGZAUI0eLxYeEIoYMyu
 3beTq6iZ+6uVhiQZzYxrsPwE2Sr2ys01rxiLRkAp4BfR5/ZtGUzYwUbZPZjLDeqOPEQc
 ocaIomSNSW68nAotvMXUr8QQhs63pcjD2n0TuWrDMXMDCv+7Pcu+mJWG4/Npnqe8dZy1
 xOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770123547; x=1770728347;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UTf2zZnUfVI3aL4eHfZEebz0gWBjca7U3XVGGAlNN8Q=;
 b=DbPDQsE0GYwfsjWepVKGdHRhFScJCshof5ALdmP6vt08RSyi0tGCACCQs2ScXnqj13
 Ng3LG75DtXxHrMM+qRQrzvNCHDL/9QgmiZEs6r+wgORFWhX1aDlkiKIXY+qdNv/iNe8w
 1JoU1gWqf30OoPJjG1NYZ9zy1vcJvuNecabjvfK9m3dIvizTWYDqNjKvT2zVCvt8iqXJ
 EyCZLVPsCgn54CxyrYTQNn0KWP3dqr2GSEjdJFAnWf4r8OHrL2qRpSHae/gi0aTb1H2l
 eWD2FyGkQ+fYIHHjeXQvGAdMxtGFd7j3p6qU2qY2HwCmXbNNJ2+PVX/NqS3TADMn7axb
 ViDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtnQ34P7W9MaXF9Rh0QI72fu93JpyDHOSMncDq0olOO952omyqGAQyEQnWIiKENPqjrTfdStXx9Q==@nongnu.org
X-Gm-Message-State: AOJu0YxA3NzeOPpUl1jvPWJ9iDa4vSma1RnN+HLwwy72tEX6/jTYAyCq
 27WEz+n0dnwaiDj3kv45LfGFKKFnz9lGgP1dDJriM2pXaYGphzJ/qKrcZNhWlCzofDQ=
X-Gm-Gg: AZuq6aL8yPTenVFekRV6xmuRsL8rvnNKowwBip2UsjmoolULIlNY/AZ1U5vPCMBmIBY
 aSvk5pvm30PoV08xCyM7oVOF8FsMOOC9XuwwCcvwEm26YBsvFmlIRlxpOO80VK4UHp+z/+0tm0R
 CO1fqQfsME4xNlbBS7GALAw5CUlZDRWfy+2wzYNeQGMxy8mGyU0NX0PwudZkYI+Mem1hkD2xqky
 +BDCb4BXknrmXl6Of2pqz9Jfo4LiNaZa0U7RKm4oF4GJzsIXk/hWgV0mdsBO9TbroF8N8opfeIk
 gwejEESwN3AgJA5MNMu0RL20hodWGMC4g/dL+jOTDv1s0kBVrsQZgsK+c7WGbHTJNxtaG6zAohE
 QTl5+WpYQ+Y/TPzk/9hpNSxsnhNammYWKVSUgI1jubnrEsJLMfJBDNVabGO3f/0VUGAYXaJ2rjz
 ci9em+ah8mpyHfxzRs5DF8aTq93d2u5FxdexuEfyJ3TYh4ph6RxdpLNw==
X-Received: by 2002:a05:600c:608e:b0:477:5c58:3d42 with SMTP id
 5b1f17b1804b1-482db45fcc0mr198438545e9.10.1770123547255; 
 Tue, 03 Feb 2026 04:59:07 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483051287cfsm99465215e9.6.2026.02.03.04.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 04:59:06 -0800 (PST)
Message-ID: <3f1ce23a-ce10-4725-b885-8cd6838f229d@linaro.org>
Date: Tue, 3 Feb 2026 13:59:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] target/arm: Handle SME-without-SVE on change of
 EL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
 <20260202133353.2231685-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260202133353.2231685-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 2/2/26 14:33, Peter Maydell wrote:
> aarch64_sve_change_el() currently assumes that SME implies
> SVE, and will return without doing anything if SVE is not
> implemented, skipping a possible requirement to change
> the vector register state because the SME vector length
> has changed. Update it to handle SME also.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


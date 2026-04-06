Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594BBFB5178
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 22:46:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9si0-0001bC-2w; Mon, 06 Apr 2026 18:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9shr-0001Te-TG
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 18:46:12 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9shp-0002yt-LB
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 18:46:06 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-82cf83bf375so1757354b3a.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 15:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775515562; x=1776120362; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aA/IE560uSHgVPD/2um/9U/x5rMxhaZPgmWdbT6P4aE=;
 b=TtwAWfBZ3DFcKPv/Xpcm5xGq4ww1QdXFgeEdEmhnUYRhFPR51Q7rINcjQAS25cnSlT
 Kmud1ladsH/17SmSoxS0Hk+/STXoO3HCJPi8EFD9O6FYu5haQQ1myTdFanC9hwOx7CZH
 ZQdt5fcNDramSwA2cMwVXWkN+2t3M4KaIgMEKgmgc2fu+5xSHWrdtWwFV1fbBysOSe1R
 qySvE02Sqs1OFjB4y0n9j6EayrdfTl/MTT93ZUtDtqwMIQyhna0KrjUtERbsPXJMxhv/
 CRlhi4bYJe0xxDOue7PBREMuG7hfzKt0FN0VHK4BiRRVUoCK4W59wlBg6MtW3+kDrqMC
 GSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775515562; x=1776120362;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aA/IE560uSHgVPD/2um/9U/x5rMxhaZPgmWdbT6P4aE=;
 b=KDgYdh1Zic77X57VW4kRu3LgRkoh2WNZOlnx/Eb7aBR2QBbVeP5qwpL0r7C3fUQ7sp
 0gPHdtMRBqwZ41vPjOJKxq/FvfwtzOa9eDQJa/8/AZBTjtfBx3dH+hXYMKOxgXVX8yWr
 jwTi+iC0ot6o2rK7ueHTkWF20AwCpxcko/jaa0xh76n4Bk7YL1b4EsW+97p1HUJ3QVM3
 YXfdewc1yb0AppJ8E3WTXjvW7+QWZDM1ICQ6UaH2oiXW2dE8tqoYXsQLgoSap4tG2ZT/
 PfKsG2ptorVUpXDYI6RhsdsC88HdFye44gnaTuyechpK1Gklruwh1lDwh4UhKqL6DAmy
 3JlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0+OdCBxLVYvCOnLN8gnuA4N+KqLntrcoxUqwfa2PvjsmARM4M9DK4kVQY1EpI3W0iegJbLZIoMQ==@nongnu.org
X-Gm-Message-State: AOJu0YzyDyp1nW/MBmczGqFXT2mzq4vtXBSwfdLGPBvfj3ApDISeLPWk
 P6k8VCCOev6iCxHi7kbLF8/Ih9Noc84ov9nmk+/hcRW6nC35Iw5SEjYLzj69jfR1il4=
X-Gm-Gg: AeBDiet5N/PVyGbYfa1Pkiufbim+AhjkuG6y2/HUa8b3QGw7r/9UpFHo3t8BOvFhZ5G
 EcvLJZxHHyM+BnElUvrsMn2FAnMn8KtAS3CU2Ztvr5R6Vnw/5TS0RFifnFsibS7fNNI0DK2eZ7v
 Q1qv+7vmDnKgpPmO7cfly49kLOO5epUS9VhhFCGfuY0wyrLnFi0wd9x6a45IpFlXg9O7rx0RO04
 /5ZU6CIRM5SaVIqpHcVYkxJmXida+mBo3+AHlfpEzUShea0Q6/E+24Y8+ZxLfPWvFQuUmLIVyiH
 ZrMUqtck6Jky9CXezwRig0O01h0weFOh/DB+h/fUb/ohFsjK/9QKDDl0X8k35nfmLwuCXat/VhQ
 PDEn24rI/bBkxZ1i/sjQPDl/neFAaEKK4j3e+H6ApCQNA4BnZSCJjwGGnl9yZxtG1exTIP/X2Yp
 135EjzBM9VbCf8iJXW+Yyhh8Loq6T0RpKOw9nJw4WgxX6pp0Lia3z3UugetcBnody9J9U=
X-Received: by 2002:a05:6a00:2282:b0:82c:da94:eb54 with SMTP id
 d2e1a72fcca58-82d0db3472bmr13748476b3a.27.1775515561675; 
 Mon, 06 Apr 2026 15:46:01 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82cf9cf065asm14340562b3a.8.2026.04.06.15.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 15:46:01 -0700 (PDT)
Message-ID: <4941d436-847c-438e-8e58-30d6664d865d@linaro.org>
Date: Tue, 7 Apr 2026 08:45:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 20/20] target/arm/tcg/translate.c: make compilation
 unit common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
 <20260406182609.193886-21-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260406182609.193886-21-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

On 4/7/26 04:26, Pierrick Bouvier wrote:
> We removed all target specifics, and can finally compile this file only
> once.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/meson.build | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


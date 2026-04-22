Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901E5FA1FD8
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 16:55:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFaql-0000ca-37; Wed, 22 Apr 2026 12:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFaqh-0000YU-Ou
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 12:54:53 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFaqe-0001Rz-4n
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 12:54:50 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso49207065e9.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 09:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776876885; x=1777481685; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dyX6iB+ghmF0Liu8wzTVBQQmwfbY34crzFr77oC5wv0=;
 b=x0ZAh4yIKWMg7DDADun/MF5G4vci11WYesvGFLHtQrXeBDjTmUh9slrWNgV7npBR8D
 79gWd3hWcX9YPS2b/vNyphbieOXE5lL7KyNdN8x+zuA26ktVkcScxeOBecL3fCJnpY2r
 KgTbYMydlAJArfrgtCySEAEQG1oPC2G9YQJ2crTz8TmrkEjMQ1eOkE/0Hh0KCFi1FBtU
 Dx+Z33XzS40uGP/cZhX6s8gyBwofLktiftgitgi145PcW7uBMo2yiM6LcBBUXt6ovEmL
 Zs57uLAfNQ2WPERkgs6zwC8AfNYuyQhoAkzMAssizq6sXgCDGD+kTQzquh14HJgbblOT
 Gpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776876885; x=1777481685;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dyX6iB+ghmF0Liu8wzTVBQQmwfbY34crzFr77oC5wv0=;
 b=Rn4f875D2ICNvPe7Q/NrJ/IDObN8gy9/XEPuLgvnK3yfev0GKDsgm4SXtx4TJHPojV
 6RvNrmhQzye8kK4lJL/hy8Zb8WFMEKricjg2THnAQNO0uEvWBTAEwA6fkcCtFx36Md16
 8uBPiOaydfwqn6yAkrJ79UMBuy/URYHkV4nKSdJobh/cg+ThJu1uyVfOuucQZrCwwm3M
 aJI9Mo5I7AjnD2B0cfnMJorbz/TdW8kzKrlqHWgubFqpmPRMSpA0iywCtNh8ukjG22WN
 W3k/CwmIPB48L4cPG7Hh2ADrFPiS2lSSPLvIfGZUG2XzeMZ+PWG+uFAgfROg/1NuO3zo
 ItKw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+LngtbjZcPfVVyTf5D6PQLiUhunf+ec9mdO8JF+ncbDHQFQ7o5PSG7OmNbZw7SQNEqnCO5m0lPag==@nongnu.org
X-Gm-Message-State: AOJu0Yx5R6fpnXmPHE6ysPV/PCEfcwrTSXaMR4JMGXidKskiOk0JLaec
 6NCb6QS7kyvcUUxwNiMeYSaGqwKXfzQ60boINXtNH/AqcL2d+eHNX6bsessBvQ9bpxQ=
X-Gm-Gg: AeBDietuQ5GD1NLfdjBeocEhpl/oaAlS8lgfJ6WLH2bIRSuENCM63vtG6JWAHJKbMUp
 KLpOKTWQgiCDmnAHG1x22IrloyZuvcST3KiUgf/Iyk07f5uf/tSAmdeaM24zm5STuwrMIlWfk0h
 SNF+ZtTas3wwIwYFWhVKrtanUjICbbvFeJxb9/j8VOws+n/3BfcsZ1uDHySwxotvbzPsXllgMM3
 HbH1pf1lEbMdh5zBMEIFi/IxJ21XTgYxZ9tlZ2XdDgi/dU5sqgzQYLFB84vUol2j5Qe5OrdhOX4
 KWctIvNdXkWzdCjS/D+K8StQiJXlD1Ey54EmKKcerkE6h1k17wsVjwhMsl+jhJSmhWBkP9czK8z
 +rTJMdKmHYWdXmA+uVoms2Nlcgc3Q/xH/p3oHERxWUbhbEjwr7pjlCtwv4OrQGQqbZQcNSVaE+/
 8pWTLe3EHLRV3VuT9Sb3QHHwqOHaytiSqE7UnsgaTaqpaGAvXMed9ttuRId+Qj38c9lUVkxEG/m
 6Vm
X-Received: by 2002:a05:600c:3483:b0:486:fba7:b150 with SMTP id
 5b1f17b1804b1-488fb7787d7mr309014715e9.15.1776876885245; 
 Wed, 22 Apr 2026 09:54:45 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891941e05bsm90327535e9.36.2026.04.22.09.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 09:54:44 -0700 (PDT)
Message-ID: <080d3c06-a90a-421e-8254-0b834c146784@linaro.org>
Date: Wed, 22 Apr 2026 18:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/32] target/arm: make hvf use syndrome helpers for
 decode
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mohamed Mediouni <mohamed@unpredictable.fr>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
 <20260422125250.1303100-20-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260422125250.1303100-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 22/4/26 14:52, Alex Bennée wrote:
> Rather than open coding a bunch of shifts and masks we can use the
> syndrome definitions.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>



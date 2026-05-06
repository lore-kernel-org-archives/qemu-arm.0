Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D544CD3436
	for <qemu-arm@archiver.kernel.org>; Wed,  6 May 2026 10:13:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKZGD-0003Ma-FK; Wed, 06 May 2026 06:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKZGB-0003KU-JL
 for qemu-arm@nongnu.org; Wed, 06 May 2026 06:13:43 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKZG9-0000ZW-Rb
 for qemu-arm@nongnu.org; Wed, 06 May 2026 06:13:43 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-44c4cc7c1cfso2932089f8f.0
 for <qemu-arm@nongnu.org>; Wed, 06 May 2026 03:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778062420; x=1778667220; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uaZx03CmQiN0K38OryTeYiCrZWGJOnPslRps//CuQ0s=;
 b=jnWBgXWDsBiquXTUsD7a6ZDkSijJ5EUtEc4WMP39dgmOZhtVq7/4BXej0YWotl+bVz
 0ck2TrV4cCI8aozgWECmzkLE6NtsRurphK+dlbv6oDarhdQu1j0EnH62RAmMfNbwo+qh
 gsJvEE2C4CH6JsdIPrUimVbl8owM/y1sLLQkms+0WQJAAHV1Uc273QEcf/Qd660sf5sG
 h0FQujku5D6NvVdHxLt4y9dR9FCh1k3oC42a3wUxB4OVIxeGjV1oACVEyUKw5lDqAdT2
 b8Gfh9Oj1rOT853x9Q3HHwcBCBBP2Mqjsl9IiK1SU/XO/Si5EexK/AIqRYRpdP4q/NnA
 q62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778062420; x=1778667220;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uaZx03CmQiN0K38OryTeYiCrZWGJOnPslRps//CuQ0s=;
 b=B6wQWSYLIZzO6tVpCBUvzpvprr8WVTJAniLMUy2bgpN0KVrpS6ubGNEOHMX5vfxzKd
 LyXRV1vXlJQ2lpXRboqZy14k1B9CvpxIlSN5hpTX9gl0wTBLLvu9LzT4WhCtemYKZy57
 nrxJ+LHR1XQY0rbYWh8QHLs4+27BJ0a9PBkHSY96vObZJl63brOoxoZuZEc1sxz0ppcY
 uY8S6QdQc6cE0Fd6bjUbDngiRRWBUdhIKjPoCCVozGGdUqYzkEPKO6vBYl4EUV9Nair7
 IGOKY7Ki5oVUvXY4qRUjG06xqVAkCA17WQxBq/p3WQBGdXtm/0E7xGFbHEF93vXPXAe0
 4whw==
X-Gm-Message-State: AOJu0Yx2m/9VZrBit4WXSnHSTUbDww9heMajpBiOAzjG2IGqdYP7DjMG
 NVGiAp/qIhlTd9l2fQZUMtwlaPrA/WSC99KC++1tYpJhyvfD+6XaAimLEPuDPWPb81Y=
X-Gm-Gg: AeBDies8PG1uVrI0SfaqPBXPHkM9oDBSvJoIQC2j1y15dE0S1QL/YhAjv8Lf8qS+8Mg
 txwwE/u7bjfKSdVH5yEC55Z/G7xGqwbjdU3qkGKtvYY2qINrvmtVBLywfKO5momLNiivEU3CJsq
 oEO1cTGS+STGBDG9CHTuP9zvUad/HtBPi/t7hp6R8n62ghQ/EPstpSOXwaIREEpkd761v61RYaW
 IGfeV57MmC6mdHhRJrhUq11yZ9kvYAX9fbzeqPD/pU3Swp/PR2unKtc/tTgT4DmtpxoJO373N37
 1ds+DV3faL9Cm5Kc0tJn7MBKpPxTmFVsX7NS9QOMfOywvTr0mLWMd3Ca636R4468m6PCkXHWgGC
 62P0JXkSCvsOON1McsY2wG16oS5ZoYHaei4QJH/FOw9JuzQJwzDhbp7cnkqhm2LTZBksslFQNfH
 HNLD4K6jWfSqSBIkRVSrxABbP7FiWrTVE+rQnp82kFj7pxrjZNUV10jgzvDMvn7QATlNKMpuHO9
 ZMx
X-Received: by 2002:a5d:5f53:0:b0:43e:a69b:d810 with SMTP id
 ffacd0b85a97d-4515d9a0839mr4650662f8f.38.1778062419935; 
 Wed, 06 May 2026 03:13:39 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4505238e7c0sm10436481f8f.3.2026.05.06.03.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 03:13:39 -0700 (PDT)
Message-ID: <f753b8a8-7111-411e-83cf-0ea2ec1c0d31@linaro.org>
Date: Wed, 6 May 2026 12:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] cocci: Do not initialize variable used by *FOREACH*()
 macro
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org
References: <20260415215539.92629-1-philmd@linaro.org>
In-Reply-To: <20260415215539.92629-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

> Philippe Mathieu-Daudé (8):
>    cocci: Do not initialize variable used by QLIST_FOREACH macro
>    cocci: Do not initialize variable used by QSLIST_FOREACH macro
>    cocci: Do not initialize variable used by QSIMPLEQ_FOREACH macro
>    cocci: Do not initialize variable used by QTAILQ_FOREACH macro
>    cocci: Do not initialize variable used by RAMBLOCK_FOREACH* macro
>    cocci: Do not initialize variable used by CPU_FOREACH macro
>    target/mips: Reduce CPUState scope when used with CPU_FOREACH()
>    target/riscv: Iterate vCPUs using CPU_FOREACH() macro

Series queued, thanks.


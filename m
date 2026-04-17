Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D9BF8E4A1
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 03:58:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDaLl-0000mP-MF; Thu, 16 Apr 2026 23:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDaLi-0000ia-Rd
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 23:58:35 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDaLg-0001Jx-W1
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 23:58:34 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so2627375e9.2
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 20:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776398312; x=1777003112; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1//i73+3jJSLDhQvS0mxohAJ4AYjIlkbCa6T3BwrqBw=;
 b=GrDANd2D62my3Y+CIu+Ht5wKTRnp1w3TN1QM+U96CYjbyeZCvQ7yi/8+fc0jdnBI2X
 qhZpLB4CFIg9kcqhD4sXz/B3zLHKkMkmqzWaY04+nZSbaRPybRv55nNUdQkzWtEgm+DW
 HWAn3UTqU/esh0R/Cbm519YDNc8hYHrOIAiFyDwyPrNo+Nthad7/oQa0CkQ1mFk/pv85
 tbOHy+RNAHnujB7Xvxv2IrDdlw7KHeP73vZeSBrJs/81nOD30lKr9gxsgFbEnGXXbFVp
 YF3x5EiixqpM/Lv2O3gFqlqBU+78MenRHkbO4u58EKShwsZMpLJM1+qkYoyTWOxNbyWh
 g0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776398312; x=1777003112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1//i73+3jJSLDhQvS0mxohAJ4AYjIlkbCa6T3BwrqBw=;
 b=Vp3mOlpJIX2oDXXsP21pDru4IDCWRafutyaJyiZgGT2ejp7c1X7/8nos3V0tbv8GmR
 glFJp6dgSJauyjoA8YCHrCmx89It2QH63yT0dNjCFrGKagiP+sVovKahA8SIZylt14r5
 fms6Tl4H+SyXJ2rApBnefQKUv1AMv/91aenHaQyZTSwqJlq8vP52O+iMR2y6Kx6C08dj
 Q5ZNIV3nNRGd8FPRRe8r92o8l7HPP2NFfZ/fg57UZYeX2MC6vd6nUP5/udz3Vqj7gRg8
 SYzEQlX5x/u26HWexq5SZzAmUZhfnA1PBFxXBecTkYxExlAMciFxkja6ifbT436jV+1F
 YayA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8FDHjZ45YwlPdFntvxDxq1CblMyD7/29pICZovK2/b/cSXZN6cE+nSOMSI+N9FngC0ci4GMM0mKA==@nongnu.org
X-Gm-Message-State: AOJu0Ywt0OFII2k7DRwt9lMdvQGMNCak0iBqmpBQeHbnTpS+5rRySPdM
 0ce4ewi0mtBuy0cR2rBioC/qccNAlcJ2qhfcI6ALwSyO9wLe2VfiO/LKT7kxT3C/WVk=
X-Gm-Gg: AeBDietZEL1g4vro3Mvy9+u6zLcSmhbHcSeZIPWAOfG06eaqK8FHeA1/956vAD1mQR0
 Ddtw5BwyT/VpQU4ndj85B6UU6Vz7+5bjEngFKiYrE8br9lXKA0vRvX4Bq6wds6vDapw3gNMGsB/
 4/Ll/o/YI1eJMATuqYWWa032e0ZiWe8Owz9Oym06zVzIq2tbyKx0Xm3tuO+CUjfRDm5FuW3R3N7
 5NHjUQ8yXtGAUZ4AlfTguk5CdkJPRGdNbOo9JuU6/Iy//EXrPqPgxIqig+w5juYTUcnBFfTr/VA
 ci3pK/f66mJrHJOFhjhFFa8IP4Ww5tesvpCpm+/OhVdVpp/+aIKEYKcrvRE+HBOmOwQrOcHzX2I
 thVYFfspWZTXr5p2r0gFAjbTJiPCxyXsuwbC06fj5hCdpkcShxBfzrF7qbibHy5mkpTnQR4wiM4
 DRyvd6A2TeyEvf5SX52N1X0wPoddx/RGrEDTJs7oplUWq14KiSuT5kA4bCnAO1pWMyRoWMalFyX
 URQ
X-Received: by 2002:a05:600c:4e4f:b0:488:d6eb:e63c with SMTP id
 5b1f17b1804b1-488fb778703mr14867895e9.15.1776398311660; 
 Thu, 16 Apr 2026 20:58:31 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc16f784sm9939205e9.1.2026.04.16.20.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 20:58:30 -0700 (PDT)
Message-ID: <4a4ab25c-aad9-4383-bf39-00a22cd5d287@linaro.org>
Date: Fri, 17 Apr 2026 05:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] target/arm: Remove MO_TE to compile MVE/M helpers
 once
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260414005348.4767-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260414005348.4767-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 14/4/26 02:53, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (9):
>    target/arm: Ignore endianness when setting MTE tags
>    target/arm: Explode MO_TExx -> MO_TE | MO_xx
>    target/arm: Hoist MO_TE into mve_advance_vpt()
>    target/arm: Hoist MO_TE into MVE DO_VSTR() macro
>    target/arm: Introduce mo_endian() helper
>    target/arm: Replace MO_TE -> mo_endian() for MVE helpers
>    target/arm: Compile mve_helper.c once
>    target/arm: Replace MO_TE -> mo_endian() for Cortex-M helpers
>    target/arm: Compile m_helper.c once

Series fully reviewed.


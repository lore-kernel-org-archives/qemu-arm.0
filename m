Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D396CCA468
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 14:11:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3b3r-0007yI-Df; Tue, 30 Sep 2025 10:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v3b3p-0007xv-UK
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 10:10:34 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v3b3m-0007cd-Ao
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 10:10:33 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-28e7cd6dbc0so2000125ad.0
 for <qemu-arm@nongnu.org>; Tue, 30 Sep 2025 07:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759241424; x=1759846224; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bETngk8oWz+y/33qWB/HDZmhP+JNmoYsAVGClEUh47w=;
 b=voqhVb+lsItXJzYRkNVz+L4/IGEdeVwgCDk0e68ZKCccxYx8T5dUxuY0AKG/qzmlqa
 24IJ5N/ZxYym5B5uIgw0cZ/J8DtgC76hi9Ntu9/jG8A8fcYqm/f8ywttMawP5qu8k4A8
 YDqHt1iKezldZv66CTc2ApMZ9VrvZKEhfRTVcFPn+z3cr9AdA5NpshOE6EhEMkflPoUm
 nJ0wTd6p8WgLRdYmKZnwXtC8EuKtiLNl/VhRHPabys/EH7329kY7DdwzxAXbePP9E7zu
 YUr2SryBuTgAPmdnu4InmBsh9NdVM4+DLWohUXmpmtZsGJRfMDBlb154NCFDdw/agLmF
 EvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759241424; x=1759846224;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bETngk8oWz+y/33qWB/HDZmhP+JNmoYsAVGClEUh47w=;
 b=NKKjOwbI5a4tWU0Dl8nXx2N/6dPrWb8OMSu5rSBTWUZB9RlqP+GCrJcG67dkiJxxiU
 wuUpjOriG5c79QNkPbgCg5hHFSp2fmsggDbhukiSFfWHnZShGn3TGLsF3dsGEA/Sgtik
 5c4/bLxFWVzbI9C2jsODfp9Xn5Iqw9OZD+QkelEg3waevSAiCTATRhE9gX9mxMceN2wq
 /j/kakJPohooNybs9aqFFv5sn9QHVEgTckLrtTpT/IYj5k6xqVPDlNM0JbNoK9kX6aex
 3VM9XAjiQw4Gb1uZoH9f8Xe56gG57DIxHSnu2LzbNXCQis240r/WZf5IBvSddhByC0Qm
 FA0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2MWpS0yPORkO9eikUV/0mcoAgMRIL8esZbnf5yydDcHb7MM1Y3PEJNOn6AISgpWgJPTBaFaNjCg==@nongnu.org
X-Gm-Message-State: AOJu0Yxc2eEcXBV5fTmLleq62b92lFzOMtvM++f1e/EGs9TatUXVntMO
 k61wXjKwe0CdF2wVXluiK+XSzJNvndCLMuzdZeHol8IX7SZAtaBwvMNJCv6GnYIiOhc=
X-Gm-Gg: ASbGnctJ7/hFOu+Aio8vbLg1eDogMCBWHNGSFg60vSw+wN3/EVsmamp8K2PO03IZw97
 JKwygZNXvjRkISVQTvZpOoNiOWdX44GynPLwLGPmwpsEFR8OejvaiumqC1RKeZK/lJUDEfLhwzw
 SC3Uh040rnJCAeVv3ZogvchqDMzCoZ6icXWfz+q9dZOKUwijHGOuWbanqIX5zEqRFDj0qtPRQbJ
 01s46+kzIf4cDYx6zN0OmMHoFRJAgny5kEJ7i+t24JYxKwYQhYSiVVbOrWm/vS1dfYs31ZmfHiw
 kO/LPRodhd6utaXf3SGTeVktFfFDj76ccivQxRX0RiNbxr44npDe1QT3Wl1g2ZG5UlIA6+PTHii
 dugrd20ZC5kWLyeMducuOkJVQc0nguQeTgzr1M+g0IG6IC9na8bbbxXhqB2xzopn3lAUlieE=
X-Google-Smtp-Source: AGHT+IErJx1XZ6G4XHiiKMynK/kRIYq5365OOuUPI+qdl/lVAT6zeq0u4gvFtRJ8Mg3qECuI1WNOZQ==
X-Received: by 2002:a17:902:ef03:b0:27e:ef12:6e94 with SMTP id
 d9443c01a7336-27eef126f60mr169096575ad.55.1759241423797; 
 Tue, 30 Sep 2025 07:10:23 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6725bbesm161575605ad.60.2025.09.30.07.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 07:10:23 -0700 (PDT)
Message-ID: <7ea1d69b-cb73-4a9e-ad5e-e821740632fd@linaro.org>
Date: Tue, 30 Sep 2025 07:10:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/32] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250929165230.797471-1-clg@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250929165230.797471-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 9/29/25 09:51, Cédric Le Goater wrote:
> The following changes since commit 4975b64efb5aa4248cbc3760312bbe08d6e71638:
> 
>    Merge tag 'pull-loongarch-20250928' ofhttps://github.com/bibo-mao/qemu into staging (2025-09-28 09:01:35 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20250929
> 
> for you to fetch changes up to 9ec30a07483640ecb8417fce3dfa9273f7a036c9:
> 
>    hw/arm/aspeed_ast27x0-fc: Make sub-init functions return bool with errp (2025-09-29 18:00:20 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * Introduce a new ASPEED OTP memory device model integrated with the
>    Secure Boot Controller. It includes a new block device backend
>    ('drive' property), is enabled for AST2600 SoCs and AST1030 SoCs.
>    Functional tests are included
> * Changed "ast2700-evb" alias to point to the "ast2700a1-evb" machine
> * Introduce support for Aspeed PCIe host controller, including models
>    for the PCIe Root Complex, Root Port, and PHY. Enabled for the
>    AST2600 and AST2700 SoCs, and functional tests are included
> * Refactor Boot ROM support to improve code reuse across the different
>    Aspeed machine. This is in preparation of vbootrom support in the
>    ast2700fc machine
> * Improved Error Handling in the AST27x0-fc machine init functions


Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/10.2 as appropriate.

r~


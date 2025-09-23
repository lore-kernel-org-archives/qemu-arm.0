Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FD8CAC5B1
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Sep 2025 10:40:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v10RO-0002H6-Mm; Tue, 23 Sep 2025 06:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10RN-0002BY-9b
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:40:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10RD-0005ST-96
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:40:09 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3c68ac7e18aso3014363f8f.2
 for <qemu-arm@nongnu.org>; Tue, 23 Sep 2025 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758623995; x=1759228795; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u8YM2IxWb3saSb+1fZV7H/zMIxhPS36gWBt/3ozk18M=;
 b=kSvw9+HRzlEMMVAhi6t4vzKVqYp2bwV0ykuJnhd5Bk0iDyv4ORBDxdc4zUX+xl/fwG
 hVbjtjN+rLDx2dz3bSeIiMUeOye6z5H0BnR00LTG1nGBFgSZ0bYoZKht29YucldoFKop
 8uWupE5oXGm/NyG7cm6Do/3ZQs9puGFYj8PuGOBZCM5+Zd/Hdeh7bsIydPFbIsKKrkCv
 qzWsWC+0NUfZuurf6uPN3TwXo51ynTNlt6rgWiRjWN1M9Obk/oWRAe+56yh7+uEB10w4
 QfXPwWBaY7QITl57gwci4OVz7Q3+SZ2xYFBKxFlB+lH4k2kOnBruxbI/33kuUccOOzZ/
 sQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758623995; x=1759228795;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u8YM2IxWb3saSb+1fZV7H/zMIxhPS36gWBt/3ozk18M=;
 b=uwYEGsvwK+TMLJJ4h0le/4D3yyRT8P3jiZaJaHWt/TT9Nfmmvo+fB6Ja93e4VS5Yha
 90hXeTnjzuIR2fTqj/xxI9TaBPjynJD9LWnOmU9mGW5TRn44wrkBMSZ2oYg3xzQDsOHh
 7qT3RERfJqSzRY987b2DQIs5OoCzQqUi6BuProXJ078u6Rv4xCyzR5iH4J2oA/jZZSye
 mC6hab5gCgG3C/GX6cG0jDFtqJ973ziwJtXMxXY5OSzj5k8czyUh/Nc8xYV96sQm6dSJ
 Mf/qBYecB/y96vLSCsT3K5As7FinKxVrnnQkmaZF2fTkoRdveH9d5L9x3TqfzBL22I1k
 PLrg==
X-Gm-Message-State: AOJu0YyEsReX2fYm6kYS7Idmu9dBRAly+DWVxjSAYZm7EUOKJ8Sjhv6/
 Kscw0f3eWJl5R6C36xu3h1qcfDPUPj51VgnkPIYpnj172J7FHYYv2mklefHDktNY3wtHAYEQOSd
 WMA52efSlcg==
X-Gm-Gg: ASbGncvk8q4bTfb93wWo8NqXFZR6UodscIl8b01pm7odzVdq4Nr0UH/d83suVeVoLLh
 hNKQBr95NPysohCdiQWlj1g03Ylr2JQSfuHis28w2avkRchYmg26ElxARp/Mr3dQ8Tyjvodeo76
 CqA4jaP/6fUMoPirKEZ11KRuIwTP2MFanblrIGbvqUKPClZxmBtRixkvWDaCJ+8Ky58zMr83GiF
 DasCfABlLFm2QTYZN5q0wRmorL5zwTRT8zAoRePSsm7wbfISVyH1mfbCrC8sUVMGbmgj2a+1wso
 lYn+VxJXbSpZ7JO7vMDEMCag7BeoJKbbSOENN1h0aKdFSRFwoGg4mJTQVGDUWE3Bh5KaX3ss/a3
 ytgARiCOsVzvFk3szDuH3YRcwM9bV4+ZbQAQBRUVWH3DUZptXef+E0HpW9SxYGptPPw==
X-Google-Smtp-Source: AGHT+IHo7q5++QJUDrHr48xLTBou9FjtZUriGyQGdDK7HxS3cp+ZFWfi8cFj63qSZ6g22iL9ImkzUw==
X-Received: by 2002:a5d:5885:0:b0:3ee:15a3:7b9 with SMTP id
 ffacd0b85a97d-405ca76fe7emr1378520f8f.30.1758623994971; 
 Tue, 23 Sep 2025 03:39:54 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbc7460sm23740177f8f.31.2025.09.23.03.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 03:39:54 -0700 (PDT)
Message-ID: <f068ea22-9c41-4b50-98f9-5fe1a9150350@linaro.org>
Date: Tue, 23 Sep 2025 12:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/36] target/arm: Move compare_u64 to helper.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-3-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 16/9/25 16:22, Richard Henderson wrote:
> We will use this function beyond kvm.c.
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h |  3 +++
>   target/arm/helper.c    | 11 +++++++++++
>   target/arm/kvm.c       | 11 -----------
>   3 files changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>



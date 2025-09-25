Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DEECAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 10:36:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1jKn-0001qO-HX; Thu, 25 Sep 2025 06:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jKm-0001ni-P5
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:36:21 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jKd-0004w7-As
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:36:18 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45ddc7d5731so6504345e9.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 03:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758796567; x=1759401367; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3OfzMW5lLM/EXdOC0fuMVWQHdWJM9YCUS/UBTOqtv6E=;
 b=oCKrhcVG8r8msZykmFcjvX1Qdns0tGcgHd4CUdnJe3D+GjTHe/ELMiR3lm6YsMrNRY
 enM1FE3tFIYRtuWb+gnQC2Zh2CgCMUg8kXMXRGj2KgqtOmiTgxneatlYWhnT9HdrvVfj
 wVwvF5T069N48TSiagonsZ8VEkHyKyU9ELZo+cU8xTYDQCmCHVCsp0AnIfBTP5pUWgGJ
 Nd4XmqZGUagbuk67/cD77t2N0GRhPANnzzNDC81a/P80BnR8ArvhaxWRhnX76ixEAvt6
 nOasf0CxDrmeqrOX9y/82zJCD83kzJm2woqPA00irwL83xj24mfzQMyPOC1goUXEY97X
 HjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758796567; x=1759401367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3OfzMW5lLM/EXdOC0fuMVWQHdWJM9YCUS/UBTOqtv6E=;
 b=qH/kTBOddnCNLEA1w1U0EFs3oBBDHHYZkoUDiNMN76mf+qxMxcGX9ZGhsgaQPapV/3
 3zJ7nRkWA2UTiRWUnDxiTE+GegQb+1vKuVDFGN2CIREZnbSmVWcTbRreCEnOUa6rSMup
 V7jUK7Z07VGaXEwUWD+pnlqG96urq4mNYFvv7XZDepiHHJ6ZuaplNdEyhJ41rnoj4Wqr
 iOInt4J9WUrvbdl+sqtgRm0CgW0hg6x4buu4QKMURz78i7dLbqzaAycLAbjf6jdsCNON
 2loVjSL0QmOn+llMumzlYjivnnj0XGr+doM1ZBlYOoeph+J8KwyOO76lmom+Q1jsdZMk
 xadw==
X-Gm-Message-State: AOJu0Yyt4vzk/udvbWVUjRtXeeyeMYdUlQIn3XeHG8+IGUx+RthT5kI4
 1E8u4SJpFOOdJ7AEjp1jwbMjjIUNAdUAWEe1M50hX7gRKqBO9gzhIn6yXL1kuZNL3/c=
X-Gm-Gg: ASbGnctOTSmjEbZJwf7HV6FmVzud3d1fqEOs7nB6SIn7Den+VgXUZiluVSaDMwAkMfK
 XcQ2HNBM4wQkFlS72rMfGD7zMAfb1g+qdCQWfU7/u6IIZ1Dd7Aludlsv9KbZwmV4jJcs7tKOn1X
 FXf6Wl81ap5rqsx9LvxzPth0LKttxd5wtV0dZO+Q8iKyQkg/M6Pbe8a6VuMa9xNOVEZRvZe3ke8
 Rm/eTkz6awaHBbBqzwLdhU6eBSJBe4KldFN8dw9MwH5eNUh8fExQLjGvREDsykH2zgWFuhSlI19
 TzrSRvJ/YG509FqS7lnu9TY1UqMf3mevxsi574nW+aQls64pnbBXnAzvQmNnnfxDIWTE5o+q4UR
 GsX0Jy0NP4cmXi6bzJglXqADYXXHH6ohidG+YrbqFvtwNSt0YnO8w9bEDZpk+87REPg==
X-Google-Smtp-Source: AGHT+IFTEDY0omLluZvSwlk6DEeF/jmiZ52SqAPII7nOUbdzAU6B/A6DG+R4Y6dfTWVTU+3XC0Hh3w==
X-Received: by 2002:a05:6000:178b:b0:3b7:9c79:32bb with SMTP id
 ffacd0b85a97d-40e4ff1991bmr3040816f8f.44.1758796566601; 
 Thu, 25 Sep 2025 03:36:06 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb21esm2493351f8f.7.2025.09.25.03.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:36:05 -0700 (PDT)
Message-ID: <fbe997af-daab-4104-a0eb-e29e18d21037@linaro.org>
Date: Thu, 25 Sep 2025 12:36:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/36] target/arm: Use raw_write in cp_reg_reset
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-11-richard.henderson@linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> Reduce the places that know about field types by 1.
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>



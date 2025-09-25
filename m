Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F19DCAC5B0
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 10:32:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1jGI-0006kN-6e; Thu, 25 Sep 2025 06:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jGG-0006f3-15
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:31:40 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jGA-0003NK-Fg
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:31:39 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4060b4b1200so908196f8f.3
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 03:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758796285; x=1759401085; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HklLCn9E23Q33wTYeMm2Mv4+IKkn8uukZU2RkF5mMBk=;
 b=b/5G3FCf+1+lRoNf6oB9BpCoHaGLeF/DasAdq1rGr1Du0HB6YMuA7jpIlEYn1/8dv6
 mGXYfvoLj9vLFdM+qxuKN9WbRAyU7YSzb4OYUGj8S/TzviiFYD1TigN8I+VkoDz5qMtx
 33IC5bb4Xax0I7wGMGe0k7nfyq69FWYDIGO99iI2bE+mc79q23Tgb4LyPNJpbdhMI537
 3fVXOSKk46lDD45eiyqyuaDIg9ywZbZO57DtP7tS35vByN77u6dcmreS0MGrF62PKLZL
 DgslwaWezfie5Ap+l+dlfqXTRjmywiS500CZYB0TlBmFeFf8ELEsuYK7TtF3637LSFXr
 TyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758796285; x=1759401085;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HklLCn9E23Q33wTYeMm2Mv4+IKkn8uukZU2RkF5mMBk=;
 b=h+j83OIX92S6wiDCpwQs2xZTcs+ifS887RUc/kAwdhjmEbZVCtsvGb4+iQSnez3MZ6
 +dH+tGqahsGbu4qkGRNafSyYZFTo6L4K12CB5s1kvrWvpDly8L7i8Z+bFUn2bBj8Z7Wb
 gL6PtuI/BvbMWumPvvPY55PqVy+jqmE/KwVFPSe4wlUHnw6tkrEGhECSB2bNRphplM0V
 qS/SNzYfUZgLEOWYRL83U3sooDkVKTtBLcDBmse47EqzKLW1AvB++I6G8+yEPwbhvHjZ
 l2mQp55L8ibn0DdLwtTf8ZHtSr+Khwavm0W4n7w1gaxkOkLeAsuPOrf64vy8cjKn1JMZ
 dMiw==
X-Gm-Message-State: AOJu0YyuZufM8vTTEshq7y5wQBHRCnDPxXiCiPlsVrQ6SFbKyxaYYPwI
 OH/0UVQ5EN1j2mlIMFwy85mFamdpCb0tmZKOuif3O57NB/PHwnkgRAxCECMjxW+zxOY=
X-Gm-Gg: ASbGnctQKWlYHjdPfr9QtF2Xgde+gmZcHffvfweAnGKiA8TyTTOA2k9oULdejTWsXPt
 opqrwm9Oprfo7+3fiu/vZZ4xrM01xmt5/mgENTHKLtCAV7q5sbTLax1WCQUIFQjFsszlR768Lg5
 CDnhUFk3qi980gEO6IAN7adSh+enyqpOq1VkXg8U82wZl83G08SMzP67kJTN+a1HHX7ftk0tAPC
 sSGPDyX49Lkwi43310oLpHMlVsZytV9BLxjAjmUYVhHS36a6yLvgDZ1LPu46k9zWfIAMvposoJv
 b+b1xKGLgv9dJQBXXUxpgamCj8/3Qd4FuEjLr6ZYkAkbNHj1tu8qN9SeCAHeaz0n1U4zI9Fi1Lm
 zGOtz9FF96mjujWoY3L1hELZ/ouKZxcn9TTnYEOFMXz9O3I7I51ODzkXh9ztgWl9KLQ==
X-Google-Smtp-Source: AGHT+IFcH9sov35xAOG8ya69GJvqn8wVkkAkuzzcQtWu8b2ggYJB7+WgfD5cSNFPJNpgxR3xFJpxWw==
X-Received: by 2002:a05:6000:381:b0:3e0:34f4:3225 with SMTP id
 ffacd0b85a97d-40e4ce4baeamr3004721f8f.45.1758796285429; 
 Thu, 25 Sep 2025 03:31:25 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb9d26ef7sm2575241f8f.26.2025.09.25.03.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:31:23 -0700 (PDT)
Message-ID: <dfbdb7c1-392d-42a3-93f0-6319a4684992@linaro.org>
Date: Thu, 25 Sep 2025 12:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/36] target/arm/hvf: Remove hvf_sreg_match.key
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 16/9/25 16:22, Richard Henderson wrote:
> Use conversion functions instead of table lookup.
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 35 +++++++++++++++++++----------------
>   1 file changed, 19 insertions(+), 16 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


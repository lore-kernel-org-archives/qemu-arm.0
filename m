Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CF8CA0EE4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 Aug 2025 12:24:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uohrF-0006b1-DN; Wed, 20 Aug 2025 08:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uohrC-0006aO-1B
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 08:23:58 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uohrA-00020V-9W
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 08:23:57 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a286135c8so4601155e9.0
 for <qemu-arm@nongnu.org>; Wed, 20 Aug 2025 05:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755692634; x=1756297434; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8HeI1uRcU/esmaTJY9hjzK554PMX4M+9+ftf1EGxeME=;
 b=kl2zBosiA9K5eLnMhFpNHGvYXBRfuV1cr3C+pXr8bquujqdlrZO7i6pGtAZD6lPReH
 48Ygg/vXlarzZzUGrOdYRqkAtfG+RJ/Nb4lpCeJctX+Aj6/iN6+Pc367hhAbr2ilO4aP
 BgEv5/ynaB1iljvueTTS1t4GqJoZJ3mGCZUHSIBPF0OgLLBllJWo1QaDZ0wc93ilbOeP
 CYccddmGp/+sYVpzliKZY5mH8Y6sbZav/qc9wyWXMCTVbx4Of3l2wXO3jd/rjCoMCjLY
 G70t8/ul4CxYGRoa1GXfyqib80PDwp4YtA2+kRu2i4bvOMv6ZcwnaVWm3fSvxVa6UiY4
 jrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755692634; x=1756297434;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8HeI1uRcU/esmaTJY9hjzK554PMX4M+9+ftf1EGxeME=;
 b=PGoC4ZT2u+XBrM5GmkHQ3EClkJRBHXquZ3kKQ9pelhTEUDbd8AadDR0tZUVfdKIZ9V
 kpe/2IpAf+jNfee1IslZVsWK2mydDG4Jir2LUcv88dTgQHL6u16s151vZ9ufhCNn8wQ3
 Z2pDV+QvvNfqG/znV3OoqJ4vc/68hQTzBB7eR2LpuGbBscP+vYIU39W98Z7IW2aymXNT
 YJLWo/boTsaLGsCfU/K+B9nLhIAWyzIqYYZRunZ/JCjypGj/463dcH7iP55EZlkxSneN
 /EH9znAitYWS6qpW6Fie5YuHwoT8VD5DikiD6oHiSGMTn6NUt+INjzdTD+Jrn/hNkMqZ
 nmQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6TmqWuRQ5azsGMV3qMShHnuW3vr5utsCty6qMb6HBuL8G6iNSvrf9YnnbG3Zk57Mg/yvTeORh2w==@nongnu.org
X-Gm-Message-State: AOJu0YyKuQPRxkFLs7xx4gBSv/lbkEtOooQCOuAaxI926nYdgvk7Afe4
 hT2lNl4g0aG9LVeQPLIOXIR48L6G1zRdDFoSGgvtgFcF73X1sT5vT/ImkOdcSgoakLw=
X-Gm-Gg: ASbGncvHwubaPp102JKDO8j70X9gYUYb7+Tuv1oucCM+HIGiZVEdNe05mMRmsmsOBZc
 w9LbGoWp5wK/JR2kMUedhmat0wuGxd+2llrIaozhAk+bxJm8cqjX9tfd9iSWvMJ1W9iaxa6b2mp
 m+ZFQcVUGneBttsklIw+wwpjUjUyPhHAm7uAQCNI0X9jWKVowBboi1iIeB+62Nse8IAqiSir3Yt
 ppsyJbsX9NfAj8fB3r4L5TRvR4I28NON3XvG/A9gUk/OPcQjwfRLBA61KRDUeXBal82rXkv9KAS
 ZtEaktEuS0gNt2UMxVF7/bHAfCxrOdm4UjV3XtsRo8Eu/o6l2J4K4vDBMhOjkV2MTiVCYzZ3Qvm
 i7Iq8OfgqI+1zDJW98G5cvLE2P4WVR8OnMJj5S9vkktmuCHz+s3PYhwOkun4hs0cbtopuQzo=
X-Google-Smtp-Source: AGHT+IGgPaxUHS+/LmoVQEweQHbJnnVyEhrOvNLz9iMHIeceRnv3Af1NP9JgI0S/ppmL69brV7F47g==
X-Received: by 2002:a05:600c:3f16:b0:456:1146:5c01 with SMTP id
 5b1f17b1804b1-45b43e972abmr58129315e9.12.1755692634173; 
 Wed, 20 Aug 2025 05:23:54 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c0777884e8sm8201592f8f.45.2025.08.20.05.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Aug 2025 05:23:53 -0700 (PDT)
Message-ID: <5f62e29c-ad26-43d5-a479-c862862e95be@linaro.org>
Date: Wed, 20 Aug 2025 14:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 34/47] hw/arm/xlnx-versal: use hw/arm/bsa.h for timer
 IRQ indices
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20250820082549.69724-1-luc.michel@amd.com>
 <20250820082549.69724-35-luc.michel@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250820082549.69724-35-luc.michel@amd.com>
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

On 20/8/25 10:25, Luc Michel wrote:
> Use the bsa.h header for ARM timer and maintainance IRQ indices instead
> of redefining our owns.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
> ---
>   include/hw/arm/xlnx-versal.h |  6 ------
>   hw/arm/xlnx-versal.c         | 28 +++++++++++++++++-----------
>   2 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



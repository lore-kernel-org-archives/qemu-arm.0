Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5CAC83F26
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 20:51:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDm7-0000Ax-VE; Wed, 30 Jul 2025 16:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDZd-0005Tg-2p
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:38:53 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDZO-0007NB-S2
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:38:52 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-74b50c71b0aso149075b3a.0
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753907916; x=1754512716; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7gwIN55fs+OQWf7RqDB+KYKzCJLXeuv1KGiZze9XsPA=;
 b=nzj6Au69EkL0XykN656FlAxR7jxNXK0/piGTUx3sRSnvrA1qy77yLxskgDHR7yKq+B
 Y7uenjnPRp7lP49jJPvxxb9Vz6S79ehhl49o1HXrF9H3GPo2INZYax5jQBzKpoisqAGe
 z2+GyR6j1AOki6PwC6VPROVeY0iULIGz7tCaP2w1PA3N4F0DEXkeQdez5iY9/qRlPRnJ
 oV9Klj0/VNlolMI2OHvpqCNxrk/cqMRc3Vd1JOktqDkQaJmXo56BqJDC5a7nz7BV9Z1w
 Cxlu0yLccFW3dy3FncVkYUsgpitTqvNDMK5nbMi9qNKh/Unq9kM4zWqCBHNOVhF6vV9D
 /XDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753907916; x=1754512716;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7gwIN55fs+OQWf7RqDB+KYKzCJLXeuv1KGiZze9XsPA=;
 b=ZxQ4SKGKMH0u3ZzrmRRlsSDksghvdGo5wWIBhdQs20GibCEeBNX/8HC3n2MfxI+Wv4
 2BECM1ZZzkw9b5VCF50BLf/Ht9Hu7+F9ZKJDkajMBWsjosOhHymI98AFE8bRyz1gOBZN
 5OEJPbej5U96N09nQEv6raN0J3wovkK/DfgLJwJT8QUR98o7PsXhylZ9GlnrZ7LlsLWe
 xvRTZBvbY8IA0UloxrOows/hkDNaho6NfMoY6jiE5nOhYneEPGOHfIZVVGoB1zt160/X
 t2b5NNEbyXIgB6/2g8jZdq8jKLPNQdzy5EAJ5znU55X6OI79LTY8XU9ekIW2iDr5Ho7r
 2ncQ==
X-Gm-Message-State: AOJu0YzEeuKSnQ0Ql9GF4VkUisdosdAghiMhNDbaZaKIlN26RhGQTKqX
 x5osXOJhwzd85nEfSybWHs7zm61bFH7XpQaR7taxZ0DEueMWQzdaGlQH1+kddM0dtnMWutFQtI0
 E/Dpo
X-Gm-Gg: ASbGncuvCxcJu4Qz2WaqxQCCqFTnLs3zDTUhuwoNiIiL9rTUFbQZ7vmfr1BQeNCnXvF
 7ls1mRavNWJuMcWm6E4mTgB858p/cpmRXj3l1AqNcq8rNRKuzhcfX3UvJQDBH+cfMcdTnKSz9Hb
 N9RYfe7Zb7oZa4+wDJMaFVGGAt52ipHFFiAqn8MnofXIfnTFxmIl8ekvz69QnWMzFjCqzQTvESY
 n5Uc41tY4UAHttEZobfwA5hRKX8t8CrCDengstzPZqkm8IagSwaEyWWxnIi+PuItTsEWx90NT6X
 7ipXkTVfLlyHduak4cjc+Q90Ogkm4mR9qIrOOVZH+RoBvuR7H8xa8n6PAKpybK2OEXfpuaf+8BD
 6IAihR5LxJ/vu4R8TGS4Lt9+Djs0HNrzC0/U=
X-Google-Smtp-Source: AGHT+IEMIRxEq5fsMGWCUQ+bkm57ETVj4vddJ+zXtrDI689VoYoarH1ujGf3Kggnd8POvyEJ/dEsBw==
X-Received: by 2002:a05:6a21:339b:b0:23d:6889:f1f0 with SMTP id
 adf61e73a8af0-23dc0eae27amr7977418637.37.1753907916318; 
 Wed, 30 Jul 2025 13:38:36 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640872a4easm11418928b3a.24.2025.07.30.13.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:38:35 -0700 (PDT)
Message-ID: <a2fdb3bd-1a67-4238-bb62-3fb71f4b3f2c@linaro.org>
Date: Wed, 30 Jul 2025 13:38:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/82] target/arm: Implement FEAT_ATS1A
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-10-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x434.google.com
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

On 7/27/25 1:01 AM, Richard Henderson wrote:
> Implement FEAT_ATS1A and enable for -cpu max.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h           |  1 +
>   target/arm/cpu-features.h     |  5 ++++
>   target/arm/tcg/cpregs-at.c    | 44 +++++++++++++++++++++++++++++++++++
>   target/arm/tcg/cpu64.c        |  1 +
>   docs/system/arm/emulation.rst |  1 +
>   5 files changed, 52 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>



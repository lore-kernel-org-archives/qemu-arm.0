Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D11BCA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:29:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usOgW-0002VC-Vs; Sat, 30 Aug 2025 12:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkFn-0004hF-N5
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 17:33:55 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkFk-0000F5-QZ
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 17:33:55 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45b7d497ab9so7060365e9.0
 for <qemu-arm@nongnu.org>; Thu, 28 Aug 2025 14:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756416823; x=1757021623; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1gWxpHyKEj4tPIOvIfIseg/VE5rC6C7cQ29V0XK0b3c=;
 b=YjUupWR/9hY7eKPmh1GB693fw6rFs89FwuguuP3asGAvMgxP4ngIUrRjNjV6MN1g7K
 amlLCB+iyMpSWSklaK5QtAy5UKaA/3yvpzg3tYX6XfsI4RaIK0FqO7F+jnoaL1VAAY/y
 eDzxGCSoKUM9LOvGbG2uahrCTFkpoV0nUb14XbzkHf9QdOOsb5kPKaP02i2g+8agNh9k
 lwP5i4NB4U6lM/FUiaxt4oLxXBvsGk1JDIfzSLWEEqzkDU1F7DQM7ji+RnlfsrXdqQS9
 Fm7r0JEQUxbGJA8MempQRf1eFr8bmXVJ5sbGBEKlRBHqy5wis2IZf9fX0gjAsMtxCOzI
 twvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756416823; x=1757021623;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1gWxpHyKEj4tPIOvIfIseg/VE5rC6C7cQ29V0XK0b3c=;
 b=VzmoQCesczuZWkLji1w8DIEfWhqspIkQb8DmqjitOYZMflDdLSq+mSeuEQo1WX4Rgh
 at34a5JPCOmkwP2ivvpTQpc29ZhiZXbOHzw/NkKIGBhl5RvSlrQxQxYAr0K720dNUuCf
 VzWMtW+uNACfjpymNHV6pBEdbH9Zr0VqwmduGxZubrFKAIaGAWUN2cIOuSbQ5iD9+tx+
 RhOVcTBUvOBRbZkWhp2ul8DcwMBcNG1jQsodu/iLqmBmDnyORkZCeLbBMMfBynRLoHNg
 xcjHdbtIqRanIfUTFRX0wRJ2JKvSqdnDY02j+/SyOHHuiR2HLAR9Psodtn8QLQSisR07
 NPCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXW1j8y0DGeXC8kNxC2/eW8rpEdDA1Gc2c5ao06/qeyiMEEbeWsdM1D5E2Jo4b9xlOFq5/UHE8Tw==@nongnu.org
X-Gm-Message-State: AOJu0YwupURBEauXk1rn9nvYeRvM2QrMqjeg6Egmb20+Dv7UGbgZnJcY
 xC0mWeQ2LDR9pJtJ42+9shECLu4XRoF9q4C6aucoi+NA+ud5kqul1nOoWLU8Qv3G/SeLpXhjYRO
 TiwvL
X-Gm-Gg: ASbGnctvDRMwnHMF9+DrhP2b2vK5KCtnTmNn19S6TKpUY13op9Lcm8VpY7IdYNzSz1n
 +fm9+fqZlt4WCuoxT6DJ9mtWc3dqU9TLqA2AFm0Cm8SO0LFYtz6+VIVlIedC2OT4r6Mw4AEcIy1
 jOohpUKqLo/yyL0LyahVO/YHmywynRajkjSBZO9rpHGg8bEG00Dkp3veBCReQgM8kFkoPamyhmF
 rjP2khUJTaMIKz/IBfwibSfVN5dW3jCT+2tXEVYxIN+EZN2Q788mO49XzxMlMfv7jINlLZsolmU
 fJf+f7euvP9bumLHE8QjRxCPONZgCzH3oIGO03kgTSLaeqNXsy6M/lfuGvjRuEwBBaF7wmcv1mu
 4UAFtRDusT7iTVp/BdmFxvo8s112weqzO2nOJFQ2kjbWaZDvIun6PBpK/FYtaDGkNjbYOejG1cQ
 5a
X-Google-Smtp-Source: AGHT+IEFczyYM1HHNVWdVvqlSWDiuRIFmZd+LZnC47rc2oOxEUtejZ5NjHHs42MvDybFT0imOL3pYA==
X-Received: by 2002:a05:600c:1f83:b0:456:1c4a:82b2 with SMTP id
 5b1f17b1804b1-45b517ad803mr217863785e9.10.1756416822736; 
 Thu, 28 Aug 2025 14:33:42 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf33fbd6a2sm714749f8f.52.2025.08.28.14.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 14:33:42 -0700 (PDT)
Message-ID: <38b5ddc2-e2cc-4be5-b5f0-efe3de43043b@linaro.org>
Date: Thu, 28 Aug 2025 23:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] target/arm: Drop ARM_FEATURE_IWMMXT handling
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250828140422.3271703-1-peter.maydell@linaro.org>
 <20250828140422.3271703-6-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250828140422.3271703-6-peter.maydell@linaro.org>
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

On 28/8/25 16:04, Peter Maydell wrote:
> We have now removed all the CPU types which had the Intel XScale
> extensions indicated via ARM_FEATURE_IWMMXT, so this feature bit
> is never set. Remove all the code that can only be reached when
> using this flag.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   bsd-user/arm/target_arch_elf.h |  1 -
>   target/arm/cpu.h               | 19 ----------
>   linux-user/arm/elfload.c       |  1 -
>   linux-user/arm/signal.c        | 67 ----------------------------------
>   target/arm/cpu.c               |  8 ----
>   target/arm/machine.c           | 21 -----------
>   6 files changed, 117 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C200CCD184
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Oct 2025 14:38:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6rm5-0008Pa-1M; Thu, 09 Oct 2025 10:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6rm1-0008P2-Ov
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 10:37:42 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6rlw-0003mz-TZ
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 10:37:41 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so558349f8f.1
 for <qemu-arm@nongnu.org>; Thu, 09 Oct 2025 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760020650; x=1760625450; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LLCpjzMmNrwt1at3Iya+PNQW03XJJcDmu76cQ+jSuBc=;
 b=E1ifQVYXryl8nbhpQ7P2yXtkwnS/hiNSFliIPb36YpMk1LK0Lgk1JW4mNIe1/K596N
 +oblzH6DdUs3qHo41lkBFimZMLCscOFWtcvdny2UB5ZESj2otr47Kq5AVgVW9Ux5ceCF
 j8V+5qfiFQYyzMQqjsT/OAbk+D89nb1EkkfGrxyXW1F4RopYCfBRgfrefAIzUeuQVkUp
 2TFotaWKM/qE82fbxw052ztqH4v0Ma3NDFrnIfkrWaTlO/4AT2iYBPRUdcXzoG2x3bhR
 YuofYQdghuI3JO+CwJKYAIdsaWw5yWqW0tayvimXB3IHCKqSWG3iYOVFbv4V6cdlpnwu
 AzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760020650; x=1760625450;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LLCpjzMmNrwt1at3Iya+PNQW03XJJcDmu76cQ+jSuBc=;
 b=aPVmkYIlrbGFUqQKcUbONLKr59SEv/0eJyxLVwRoj/MQd2ZNujf0613Xx/XrTOhFkp
 dnr7uzdM+wlOr3kqQMaXeiIH3TmXwuueHZz+ayyYPCpaT4eqmCETniZZ04WaGMe2U8/0
 RnCpR6saMAyXgjFw0MvkMQK+diQ+5UWlxXwe7nOBApN9PbCCHTs1HkNy30IS2Ef6Jny7
 mMUB4I6aMTElu3GUCUkPQ5ug3pPfGCiJ3ijVfTTa4ydBrQUNfMAK4VqmLZx0GZMNRAw/
 NaJR7Yr5XQ3fvqnE73U76a/oAfSR8GsuBMIlrAU2SH9SlYWE1j5QM/Su8GGLRTxY9HRY
 d3zA==
X-Gm-Message-State: AOJu0YxMJ/XuwoMssiRCfgCeCO3VjOv8ccg77FvKSfZDXK8YyyGkccb8
 a3AOA7m96+g5a26mUrsNOCS3xLdTDpLX4XmxBU/ndtrCqKDmCKcQZGbry1Zrm/yxzW4=
X-Gm-Gg: ASbGnctshJJweR2+pOQBinYM/bggV8rePEvpyseHgTXrjGowgmWJpItAthGieMOBL2A
 ApNqe618E3e3VRYUycBC7vJQvmBEI1Ws3+Yj0vizbQBFetNtHhjHqPnZ1fWe6Yvmhu+3vjidg0H
 nifwvhn8RJi90X50QZkKTJAvcfHTVT+9Tajw9Rxoa5zVgRB1aHVYnnuzMaGTiLa02mhZC/6f/LV
 fXBlbe6UUIzK9A+TVZDfiFfbh7JmVVIl3WZjUbBBhuZNoGdCNZAxqiiLHUcSQZlIoGvrGE+Lk3m
 5J0hYEgIB6JIb7B5S7TWYH20SPxs3lTW8Yn39l6Etr6cJUFIROTGTYd6n2rO3GjAuJQFTIZnQc3
 BuNi+U0amy8K+6VKxQiunc12yT34TURR3sCfCMp9RpBDQqjhjm1V1dqcHmD0/+mdbSgNGlSdtH0
 oTGLd3PYnCtD+WuOPc2wrtdsY7zMaB
X-Google-Smtp-Source: AGHT+IEgyG3oeDZihU2EyXIHAbfS6uyOxjbTH5/kQwVkCKU/tITY3lhUHHosw22TP/q2bMMPGEp6xg==
X-Received: by 2002:a05:6000:2681:b0:3e8:68:3a91 with SMTP id
 ffacd0b85a97d-4266e8db27cmr4886022f8f.60.1760020650591; 
 Thu, 09 Oct 2025 07:37:30 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6b77sm35135600f8f.6.2025.10.09.07.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 07:37:30 -0700 (PDT)
Message-ID: <af099e7b-dcdb-4e1a-a26b-93c39f7d39aa@linaro.org>
Date: Thu, 9 Oct 2025 16:37:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 35/73] target/arm: Export cpsr_{read_for,
 write_from}_spsr_elx
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
 <20251008215613.300150-36-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251008215613.300150-36-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 8/10/25 23:55, Richard Henderson wrote:
> Move cpsr_write_from_spsr_elx from tcg/helper-a64.c to
> helper.c, so that it's present with --disable-tcg.
> Declare both in internals.h.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h      |  2 ++
>   target/arm/helper.c         | 20 +++++++++++++++++++-
>   target/arm/tcg/helper-a64.c | 20 --------------------
>   3 files changed, 21 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



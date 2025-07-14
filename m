Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45475C83F1B
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 14:40:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubKLC-0005WA-3A; Mon, 14 Jul 2025 10:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ubIlF-0005z6-39
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 08:58:28 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ubIlB-0003w8-Ck
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 08:58:24 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-72c09f8369cso1339910a34.3
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 05:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752497898; x=1753102698; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CrCt1f2GP78Tba1HZzoGya3Pie2iZyg4IuKHkDRggtI=;
 b=ajSpzTQixJGMgZGZs0ZmJjlc/3tBoIu+wL49Bvb7W7fSBHHnzSpEIInN+woFMw19qr
 a7VSPCuhAYbU3smpQ8fiuQM4YSENOJAM9G8uSgdG/+ORYT7DDKdqp/Rxxrpe8DE+gbh8
 mv5YxluzV053BuonNEz90CUwc5ar9QYpKV7uUE1sCYspACJCXKPfKByt/OUedmCdo+dr
 yq0gmJuXCcPRQEEGsKpazsbRdJdGzgVH3qbxbjSW9zK3+teNs1wDuHb+ofghjcXJFOmq
 FuUK5jucYS0zVuIikRKY5T5evDQJCMOJ0q8/sueZXLOBAHmeWB3HfOV+kq8bpx2jI2OE
 6f6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752497898; x=1753102698;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CrCt1f2GP78Tba1HZzoGya3Pie2iZyg4IuKHkDRggtI=;
 b=KFC4ZQt8rF6cG1IF5caFZhfF0+b/yMrBF+scrablHZkc2Bhr4hLYgeAf1grwyvCoxn
 WBcc4bBUKWZv7VfgjM68vymhzABQ9w7K+caNpNfmlA+otsKIUXUyijU6/ugzSZGNZMOi
 AsiYeCEGZMh+JMwH4prhedrN0d2/VBnzd7Nmr+7yTEpAgUn7q56lbbstVNMT0UYSf59k
 ud2jQmKcTXJywdILjVVDTNJEifzHmBdLRLMDqzA24Hrhz5M+ax7dJtl2s/MrwQ8t8nwZ
 9lqYsTeAHFquClaHgO8Q7lKgMOhR4yHbNhtEE11SDxGZ3/fZ/gMtIkXswSaJHdDJk+Tf
 IfDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGojcpFMcRZI2UMFnWM7rWCFBOczX0QOW/40zI5g7/mNsq+U+6f9ceygNs5Vn6VIChmeGxw2T/zg==@nongnu.org
X-Gm-Message-State: AOJu0YyGk2K5zewg+55ZwXN/MOQimHlx6yLcJj9tbn4gSA1LlWL2+ls1
 +pyZMhfXNqLNzg6CRdE9vq0aRZQh2wiyAVsfFeIOxRP05JKqna2z0JiCJiqQhBBleDY=
X-Gm-Gg: ASbGncsnFqPYugdvwBzQ/+KtaLT+OTxcDu5IRMnpzJsewXcCQcqXDF8qx+q8/ESpjya
 AopV0pTiRfa6cLYf2gwN+qqzHJv+XcO+NBiyQRgrcmcNNKQsy4CanHxS3kR5Jre8J4vlNC2b6vx
 Vp++19EXQKDnAj7Whs44CKQuhzQyOKxdEsJvpeSzsRaRrY4VBKpLcr0brivavAnRD4EC1NFQbaH
 3swCq8EW2a09nYk+lKPIdg13zRZ/4LcWJ4gsJaY9ElfSfsGCeqoezC4s3l9+PNxPXiLPBMLUEaS
 3Y+CdZav72Jim9hd6/ryQGbGU4H064JsGL6W482QCb/DDIbWrukEmCSjOJsohJPkNBxwHAVz6jw
 aASLnedUwmLti4JNe19j6HHxT6juOiuCIipTZLm0287y5Mz5l0/UlcMt67QetKX0R7LzcJ4ILkY
 O1
X-Google-Smtp-Source: AGHT+IFwMYmiYmYdrlThntJieSU7SPATuB3z4suxOYR+VlJbtTt2lPkFNYNDq4BkBNiDkkTkrWs3bw==
X-Received: by 2002:a05:6808:524c:b0:40d:547d:397 with SMTP id
 5614622812f47-4150f5ba480mr9388435b6e.23.1752497897835; 
 Mon, 14 Jul 2025 05:58:17 -0700 (PDT)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4141bdc823bsm1532992b6e.24.2025.07.14.05.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 05:58:17 -0700 (PDT)
Message-ID: <f18a652e-b64c-4a33-bd60-63dfa93ffdbd@linaro.org>
Date: Mon, 14 Jul 2025 06:58:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] target/arm: Add FEAT_TCR2
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20250711140828.1714666-1-gustavo.romero@linaro.org>
 <20250711140828.1714666-5-gustavo.romero@linaro.org>
 <21bfbfaa-f0df-413d-bad6-b69688ac381a@linaro.org>
 <65e20340-e164-4424-bc60-52d78b9a17b8@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <65e20340-e164-4424-bc60-52d78b9a17b8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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

On 7/14/25 00:21, Pierrick Bouvier wrote:
> On 7/13/25 2:59 PM, Richard Henderson wrote:
>> On 7/11/25 08:08, Gustavo Romero wrote:
>>> Add FEAT_TCR2, which introduces the TCR2_EL1 and TCR2_EL2 registers.
>>> These registers are extensions of the TCR_ELx registers and provide
>>> top-level control of the EL10 and EL20 translation regimes.
>>>
>>> Since the bits in these registers depend on other CPU features, and only
>>> FEAT_MEC is supported at the moment, the FEAT_TCR2 only implements the
>>> AMEC bits for now.
>>>
>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> This causes a regression in tests/functional/test_aarch64_device_passthrough.py, by
>> continually trapping on an access to TCR2_EL1 while the HCRX_EL2 enable bit is not set.
>>
>> Unlike the similar SCTRL2 failure, it's not 100% clear to me how the guest and nested
>> guest kernels are related.  But it is clear that the outer kernel does not does not
>> support TCR2_EL1 (and also doesn't manipulate ID_AA64MMFR3_EL1 to hide FEAT_TCR2), but the
>> nested guest kernel does support TCR2_EL1.
>>
> 
> The same kernel is used for host and guest.
> Maybe it's related to kvm support?

Oops, no, the patch fails to enable HCRX_TCR2EN in hcrx_write or SCR_TCR2EN in scr_write.
The same is true for the previous patch with HCRX_SCTLR2EN and SCR_SCTLR2EN.


r~


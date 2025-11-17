Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCB7CE8D6B
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 09:26:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKvUx-0006z8-EM; Mon, 17 Nov 2025 04:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vKvUh-0006kX-Vw
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 04:26:02 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vKvUc-0003q8-0h
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 04:25:52 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so10403715e9.0
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 01:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763371548; x=1763976348; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mFfW462Y/iakMr/l4Tt+HXwdKdlpDZCZkodF9gQKPCw=;
 b=HDDycfX/t5kWkq0kg6ZMGnMRDm93LGMuQ1ORgH+I5IqStvjZugqgNELX7uWDHHW66h
 sPOwOfmWs5DSl0U9BidHmjT3Iep6O3ZOjhGKGrBELm9Hxc++Yy2cqN6YhiYb1aDScIdF
 7Q1lljuXK6Ln3zDCm7uVxZ20F+/TPxIgK4CmFIuP9Y/yatlaQKeOCAvRzmW76PGhOWBn
 Ch397S5n6W0t31wyDSaBqJ0COkCW5K2SjmJDufZg8U3onL6bJZClAIznvO8jm9XMwpx6
 7Os+HSchoQV2kCkDAMC0bZ2tkFEVJi6f/8qcgf2ILOmw3qCZfRHShmumittoDtg6gMJg
 lwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763371548; x=1763976348;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mFfW462Y/iakMr/l4Tt+HXwdKdlpDZCZkodF9gQKPCw=;
 b=LfemKiBfuHG5srmLfn9hXBIKgx95K7xVi1vGR2CEnVJSDmwW6NQvIsRaYmAFo0KGaR
 u3deTK3g+CHVegj/MKc4Mq+71TfNb1KE6mlk6uTRvqkgY9Tvbnlsj9ysAroiHZBcsPmM
 1SFpgx+/y7Z+2CmO0b9RS6JDkjBjCh5EWAjQ1r62QTjy/jv3q7b05dBCjIqWrwtpqMfv
 RnLaDBacJ/9DLPqji6AIQ8gQHZzTIqkqNjPBcTzepYg+I9TtFT4R1zccT6l3SJFyOwdW
 VfACh5cAyOJtTOxJN4sidK7VvADMLRPu9rTAPO5eOqzHqYC9EB9Q7g89bnAv31kqoSZj
 3sjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8/RRBoJyTkppEDumTL7nnc9ji5Rx6CG8x8Vqj0M2gdNEeVj1oAmxJW6R2nP8pbQBghPXujysBaA==@nongnu.org
X-Gm-Message-State: AOJu0Yx3RvNcaTGdX+QJFjDHkeeCPFWeXuLtgHDXS+u26HTr/UEimnQK
 HyeDM2+c26Ao89RcFW2S1hlTWIv5Eisc/kyzXlPC8TWgBQrKkSi5BZVLQYnQ71M2fJo=
X-Gm-Gg: ASbGncvUeo+6zgbe23/GS0sjN/RD+cGLP+nQwpCtO6wTS2/oUjRsHatUYF4Lu/cEluw
 QDC5TdcdmdbBUlMxE0W030/Rvkgx5jen7CTYknZvzOypsI+QFW9mtkZfm+5gNTn2ohMokbfiY96
 6bTZlyC6iA+2xPA3TkSq/bhqjkwAzsCqdbty86DYu399YiWYEbeziSC/nl7cJ2QHZsg5F0jZlLl
 SP1vVwSeMcuVbA8L9yr77Ll0y97BYJTrqrRZPJe7yTLDv8UwQePAy4c9/e5qLd1bmpcwIxfv48L
 zp/hd4covacd18o3R737RkwfqwVrZy66hS1UatCBLq/DyEhciLdwya4B4R2jH0heIE3C6+zp4H6
 23nQNN1BNqT5x1Jzg3f9QsRzZNjcrIfSwCgOWVmZDnBZfeL3WCweSfkXG5BDrH3F9Hvg9Qo/v9n
 UepSyDROYrAW+ACzeShvmSzxUg4LrlCkmUIBe0ijT8ytEnwU6u0avEUw==
X-Google-Smtp-Source: AGHT+IE2jQi76y8DqP/oGTI6OnlRQCsiULwqZCPoRse1LTbw7mS8RAZrYRztLzyDO/Q2ytl9BA0n8A==
X-Received: by 2002:a05:600c:4452:b0:477:8b2e:aa8f with SMTP id
 5b1f17b1804b1-4778fe6a42fmr95870675e9.15.1763371548128; 
 Mon, 17 Nov 2025 01:25:48 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477969b3c12sm133408435e9.13.2025.11.17.01.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 01:25:47 -0800 (PST)
Message-ID: <210fb81a-bede-47a4-b5f3-9f9f7ce3f2aa@linaro.org>
Date: Mon, 17 Nov 2025 10:25:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/19] target/arm/hvf: Consolidate
Content-Language: en-US
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
References: <20251114200422.4280-1-philmd@linaro.org>
 <b0b2fdce-9f4a-47a5-bba0-209f2c8ac0cc@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <b0b2fdce-9f4a-47a5-bba0-209f2c8ac0cc@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 15/11/25 03:22, Akihiko Odaki wrote:
> On 2025/11/15 5:04, Philippe Mathieu-Daudé wrote:

>> Philippe Mathieu-Daudé (10):
>>    target/i386/hvf: Use host page alignment in ept_emulation_fault()
>>    accel/hvf: Enforce host alignment in hv_vm_protect()
>>    accel/hvf: Skip WFI if CPU has work to do
>>    accel/hvf: Implement WFI without using pselect()
>>    accel/hvf: Have PSCI CPU_SUSPEND halt the vCPU
>>    accel: Introduce AccelOpsClass::cpu_target_realize() hook
>>    accel/hvf: Add hvf_arch_cpu_realize() stubs
>>    target/arm: Create GTimers *after* features finalized / accel realized
>>    target/arm/hvf: Really set Generic Timer counter frequency
>>    target/arm: Only allow disabling NEON when using TCG
>>
>> Richard Henderson (9):
>>    accel/hvf: Create hvf_protect_clean_range, hvf_unprotect_dirty_range
>>    target/i386/hvf: Use hvf_unprotect_dirty_range
>>    target/i386/hvf: Use address_space_translate in ept_emulation_fault
>>    accel/hvf: Simplify hvf_log_*
>>    accel/hvf: Move hvf_log_sync to hvf_log_clear
>>    accel/hvf: Simplify hvf_set_phys_mem
>>    accel/hvf: Drop hvf_slot and hvf_find_overlap_slot
>>    accel/hvf: Remove mac_slots
>>    target/arm/hvf: Implement dirty page tracking


> For the whole series:
> Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Thanks Akihiko :)



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF43BC83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Jul 2025 10:06:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ugKjg-0004D1-5x; Mon, 28 Jul 2025 06:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugKjK-0003Wd-R5
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 06:05:20 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugKjC-0000Nt-Vo
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 06:05:08 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so2829718f8f.1
 for <qemu-arm@nongnu.org>; Mon, 28 Jul 2025 03:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753697105; x=1754301905; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x7vd2hxTUcPcrz7+xzupNRwXlmiEluhmpOL87fjXIEk=;
 b=E3oSmXs5xjtoEcTZdO3C/GpDSg69Lh3NO3FFW11Y8N7nqWnFw8+uXLtJx2Ey1uPLNX
 8uyPG45TtPsb0z+OXYeffhtnTHx/jbwV7g0JzPwewa3vvS6i67ECWu0j9LJOCuZ0GRHl
 t7uwNyVtztdkJu0g7rXAkkutrau2K1d2d+cQOui5tg2edJNgSA4o8TpdslnlhCF+IlFr
 QosdbpILElZ5W+oUUC9tFOYaJaLHMmgcq8wgl+m37/xYKt5AQysMg1Dcvt+aXOno38/h
 Quxc8XQFbjLU/I/8rNRe9A+0i5uTNR838JMJm6bknhEwUVoHHM1VBQDr3lzHghFBWnh5
 SBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753697105; x=1754301905;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x7vd2hxTUcPcrz7+xzupNRwXlmiEluhmpOL87fjXIEk=;
 b=LzGrttOD4nbiFhFhEx7Vkben4/FjeKkGrUHiWfWdz67SXlgdgzSfgPpmA+6Qw7g1Ai
 80l6KjnbPQvhL2j9Il3/KQg3rgkptgON0vC1zsOeV4q5+1xGK9KJDb3QjLs9vKIb69I8
 Y0+ogrRSId+0QPlUGwIE+5yShu4KlvldwRf2gFkREaxPq6U6Wj2W9WoCepedSCSBy6fz
 LfM1uwMC8Yd+H/06zhKZ2sHgiwrpfMnricbhLSZ1qFPBuX5TS+XZ9ruaqy7+e+PMV5yK
 xo7bqLAb4rflqwLj+ghFle3t3y8k8xcGrxTgHMom73V4tfQn94E8TEK+iQ4EP12efVY1
 9Bkw==
X-Gm-Message-State: AOJu0YwDKY3DD3pZHchBkntzlCMhH6cvldkSXFGfITqEFmGZZ9LPwcCj
 Wu0bOOKrgIOsW38M4jvzP7PIoG999uHmA8o7U8J5p6ArYAvmquJIchYC/iMaOm5zxm3ay73JNzr
 7fQTX
X-Gm-Gg: ASbGncsZcVLpc/L1vQM3ec9UTpZgJ/iUNWhqpcp43NeKmR3UBbr95x5mY3WKF7JQ8K+
 g+iiqv9JUVyRN6ODW8e8XkRu40bRniNar5T2PTQWancWCYu4V+gVRqsEnpmEivxdGsDadpBHlSs
 Nf8NCBzykX21NUbgem+UzOPvN+cpycSOzo6i7gp4RGJh8kg4vh8XWteQnfdA5RjRGpgX12beGMb
 wLr5DgzGK75b3/GkJtzHm1G3rFGyaJAAA63kX4uN7kjR+jgqk8o2Q7JTvEJinOdrrgBqgtt0tHZ
 mTZphvkNOhNPzgHt1FyJNWox+46EXW7CTLmzdZyLjFkj3fTeeENG+LXBEbiiWuribWftIB46F/h
 mOauPYoRJJIZjtRp9nddFeoJFwaCKPa4ni0XxUMmHD2pE2noknCHjdmeLfdrRrHeCBA==
X-Google-Smtp-Source: AGHT+IEs+8m/HSy60Yj1uqhx4HJ1sA+jHICgSj7CrEPkqDIH0Kz80PkkBcAvmQCRvmh/kZPmle/eBA==
X-Received: by 2002:a05:6000:2882:b0:3b7:8146:4642 with SMTP id
 ffacd0b85a97d-3b781464b28mr4623057f8f.20.1753697104574; 
 Mon, 28 Jul 2025 03:05:04 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705ce775sm150195165e9.32.2025.07.28.03.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 03:05:04 -0700 (PDT)
Message-ID: <9a0744eb-e0c2-4ba0-a6c1-af7952878ce8@linaro.org>
Date: Mon, 28 Jul 2025 12:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] tests/functional/test_aarch64_rme: update image
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250727074202.83141-1-richard.henderson@linaro.org>
 <20250727074202.83141-3-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250727074202.83141-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 27/7/25 09:41, Richard Henderson wrote:
> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> TF-A needs to be patched to enable support for FEAT_TCR2 and
> FEAT_SCTLR2. This new image contains updated firmware.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-ID: <20250719035838.2284029-3-pierrick.bouvier@linaro.org>
> ---
>   tests/functional/test_aarch64_rme_sbsaref.py | 64 ++++++++-------
>   tests/functional/test_aarch64_rme_virt.py    | 85 +++++++-------------
>   2 files changed, 66 insertions(+), 83 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>



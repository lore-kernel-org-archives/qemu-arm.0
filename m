Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CA8D1D494
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 21:06:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdxDJ-00050r-5U; Thu, 08 Jan 2026 16:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vdxDH-0004zU-LZ
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 16:06:35 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vdxDG-0004Am-8Q
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 16:06:35 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7ba55660769so2110142b3a.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 13:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767906393; x=1768511193; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P3+NrpNsjxsLWRQOrNBstuZ1sjXhRugz9uv4luMT32Q=;
 b=FFqIdrPLStFn5J02kxFSCoYunQWZDf+87XEPYRlCKN5g7Bhh8I1L7l8IL9mIZA7SD3
 vTrwK3Xh7MU739gRQNpXlULcKB+/FLIfhpHr3nnR96yuQpeozmoiNP3tC0iPRE2PZtqm
 IXNBvAN/YgGCSSr3CWc+XGeXYnrRZQyMVuAlEIe7Nj3EyKKEsCBwHQLzv46/wvXMJT4X
 hT3+bTBAu+Pyrkdqhf9c11ZSlrOHwqksLTEJyyjB49XQNpxfVq7Av42SWPFEESWxGfUS
 ooyglrikbPVWqV7+PS+aDYME91YdSZaPRYLNkw/gRBjnrLhTF7sWcOa7gfcOiyWM5P/k
 FH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767906393; x=1768511193;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P3+NrpNsjxsLWRQOrNBstuZ1sjXhRugz9uv4luMT32Q=;
 b=K+CswjOCLiXl7wvlNDoTZzPT6uv0Ibh03ae/oktelnS2vww7DQ11QDaSECvkgl/Lcq
 OXsYhzJ+VkVHs+9V4BSJ4Cj8uf7N6FgX/sx86q/js1xk7nem+8YFB2sOth2Gr/+BEtDN
 Bvy7oOXlQ8vXSeB/0rhb0GAXiiZKq1NKLEj8ea0TXMNfknd4FuATGM8amVLgtZnq+YY4
 Uxrtr4XJ3m59kjpVc5w7QQGhP4jdHyodHnPlZIyUdE6nDTeEQRfxhGM29IZYMThF1Ga9
 PwSSBAL8tcKqqZZCLdtxJrH3xp1Jpvl1usfnBB2zlY987I7fqNUklbnMLoIJnv5Lu16S
 uU6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXAf5A0UGS0/dKJpAwQFD+ReoQL8V1kh7GfMoTo2Hui/mBu4O2MD6HvRFxv8YCyoS2X/s5vfqewA==@nongnu.org
X-Gm-Message-State: AOJu0YwR9Ls8V8pyeqsd3bXwEyZ5wWoT5bYraaG8hfh/mzhqdpu1qR+G
 rAmb6Y/E9gFXGm2rSl1za+51GwRWZJJwudxLiiZB+Kty0k1Pe3R7s3gM4xr7I+7zpsY=
X-Gm-Gg: AY/fxX6C5fHvqw/j5CLeHAgMqJ2QfSshsc7wxbGf5jcwnN/dOG4YFPJ1q46AHG/Xwca
 ewyvK7pQh6OAJ4XzgR6rwKjej1fhCKjFe4hhRTcwGjc3OpW21kkfce2CwIvZiJbU0Lv3H4fkT/R
 v7hQmOZGfdRPaO7cE8U2HfC3VvZWp/JpwPfWPET8tf2saas81W6+7XMMD94B4IDzHjae+IIowgu
 Jk5kmL/VDmZLlw7mbImBU94SdY+QUy6nOAu13ODoFVT/wo2y/aNnsAftWBD7WNymDmriFmc+f7O
 pfZ6pg23cMR1ptzQEYr1EeVvpRGQM22ULt01EUZ7nIm93sXqzscL296vQZwmgh+YpDMULxEB8YC
 SJmQnXMp2oQyNHX60eNF99hEfJAi5mpQ2kSBL1QpJWIRh+gJWTppwvMixbEkryzEr/t/usfTwAm
 /lPaF18VZN17S2XSe9CLQBFBApBA84XaveWptTpgOKV3FKExuuZEoKZdVND5MXRaT6WzA=
X-Google-Smtp-Source: AGHT+IGnZoCu3YjEriyrGGGXJGacETGOb40WgN3Gt9dBxdaP2FhfyxB6Fa2fBA1rw+BbaIKhPGL9tg==
X-Received: by 2002:a05:6a00:f93:b0:819:7f1c:5594 with SMTP id
 d2e1a72fcca58-81b7f1014a6mr7065466b3a.45.1767906392685; 
 Thu, 08 Jan 2026 13:06:32 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819c59e826asm8506124b3a.54.2026.01.08.13.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 13:06:32 -0800 (PST)
Message-ID: <fd731d08-aa55-45e3-bdc1-471c449d6ccb@linaro.org>
Date: Thu, 8 Jan 2026 13:06:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] hw/arm/smmu: add memory regions as property for an
 SMMU instance
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 tangtao1634@phytium.com.cn, richard.henderson@linaro.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20260108210453.2280733-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20260108210453.2280733-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x429.google.com
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

On 1/8/26 1:04 PM, Pierrick Bouvier wrote:
> This will be used to access non-secure and secure memory. Secure support
> and Granule Protection Check (for RME) for SMMU need to access secure
> memory.
> 
> As well, it allows to remove usage of global address_space_memory,
> allowing different SMMU instances to have a specific view of memory.
> 
> User creatable SMMU are handled as well for virt machine,
> by setting the memory properties when device is plugged in.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/hw/arm/smmu-common.h |  4 ++++
>   include/hw/arm/virt.h        |  2 ++
>   hw/arm/sbsa-ref.c            | 16 ++++++++++++----
>   hw/arm/smmu-common.c         | 11 +++++++++++
>   hw/arm/virt.c                | 13 +++++++++++--
>   5 files changed, 40 insertions(+), 6 deletions(-)
> 

v5
--

- Use DEFINE_PROP_LINK to define properties for smmu.

v4
--

- set smmu->memory property based on plug callback for virt, thus
removing the need to use global get_system_memory on smmu side.

v3
--

- solved issue with user creatable smmuv3 (found with
qtest/bios-tables-test, subtest smmuv3-dev), which is not created by
board file. In this case, smmu->memory is not set, so just use global
get_system_memory() instead.

v2
--

- Fix rebase on top of master
- rename memory and secure-memory address space with
      "smmu-memory-view" and "smmu-secure-memory-view".
      If someone prefers any other name, I can change it.


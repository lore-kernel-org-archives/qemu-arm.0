Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C34ED4335B
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Dec 2025 22:21:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTp2W-0007PX-Fo; Thu, 11 Dec 2025 17:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vTp2U-0007Ok-N0
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 17:21:34 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vTp2T-0003H7-3R
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 17:21:34 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-7f121c00dedso742614b3a.0
 for <qemu-arm@nongnu.org>; Thu, 11 Dec 2025 14:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765491692; x=1766096492; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f5xjuMkaaczkaNqjWZ/VAUt1Oj5pKOGI3NKeSFWso6A=;
 b=PLk3ICziswE/zoU6QPOcZxf2pSmdladN/qNIqARPUgVhtoNSiPphZMQnavt2HG+8cs
 7M6fHr/Mr1tXky/+YYBAB/oQZzUfQno4xOj39Th8G+GVqN0OScQu5OVCcwJ1Md/CdD6F
 e2E04/hJdo27N+FoHVcpKLDXyop6ZA8shX65FZxNH3UMEgeruZ8ZpTQ7vIeX/ZkqIMWT
 ZKDXee9DINE9FC4fRdq8xUr4LLTl2AdZJLPGjcThnVVCfv3DrU7YV9OnN3PsW5fwnnZP
 ZlAN+5srYP/FpEryiYpNVr+dunXTwX21g9kq487LZMUGRBsQT+MOoOJDhpfza3tGlmLM
 Gg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765491692; x=1766096492;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f5xjuMkaaczkaNqjWZ/VAUt1Oj5pKOGI3NKeSFWso6A=;
 b=hiTXKigzitxTuJTCRbtDa3cDa3tW+UarFILzm9YWbRdqY5UrLoj6LvEj0lO5ArwEJ9
 kGk8my/ybjZhcN9WhjrxDb6YL5dNTcpmpj46b7lQADqmoYGWoehVClk5mPcVktkGf9UZ
 r8HtYX+IBDsBJE5wHLY9IcbVeO6+E8YKQ26/rFEaTqq5ehH/yY7BQ0eyuuN7uqpaJVAZ
 js2LPq27z6xQ+k+bzmaRMDsr8v2DxhkSf5S8sTE/fIBx2k5rQxY1R2bXBripRW2IpEOI
 48VpvkiPgwfx9kaNm8iDln6EjWNhLaE4aJvHq+JwpEsehE4lA7Qst5DynM79Xo5qdoGV
 u+DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXziTYKhVuICNz+pNrPRJn68bUb93m5ZPjWl4WRWiA16O/R9B2QehYxXvk9U0n8XzJYkpbXllyNLA==@nongnu.org
X-Gm-Message-State: AOJu0YwtVl8NB7oLaBAHG3rqudPZfyIdra1XV9laRqUXJ21di5+ZH97L
 y/xnoYwH6J79ZSlEKw2awoy9oyJqz/m6xlbNJIWCmSEUCXLcy6zk9bfyBPmfVlh60VI=
X-Gm-Gg: AY/fxX49qiBi7fYcPO84gccS09xhafQfAMKsabgeMIqvJhXsKmkXkw1CnUvi/n4LwD1
 8pIyx45CMsrudFStgzU7AyrKGFZDFWPE42KASwRdawOGDq+g4/l4NZSTBHEOyTC1CVjLfVoOv//
 0W/+TB5dfCpZCOOgESfQB9nSizZB0yCc8X4A4uAHuflWDyXZ4pQ3KWGhid/lxKHWdd3vrN8FaPQ
 yuekRPsLTl3BoRWvNvKlTxL30YfQ92jxxGLuz6eT28SAOAHPwXjFIBOZmBQQGr2wwOVv026bNWt
 vGiUhgx1o4wZ0W2olNFiw42IWU8f9gHw3ihDtrcVzm9m39eAybI7idCv/xkSFrL0TQjU4I7Ih4i
 tqQEZPtQ7uyMSMcpJ2w04VCN+rONQnt5o+U/Sts8gcM/KVD5LrlsoqS/Bs8pklqNVD6l3ieTwu6
 xuiVgzm3ipxLPmjOVRy1IoNbN4AA0nTkU6SdMoC+tlXPRdnv4FnoqKAMI=
X-Google-Smtp-Source: AGHT+IFNm2y4AR3PKe6mILZegPOntdSrjY8+8FE6ss/f/ggJ2n72H1LfJXEQ+9yXsL1OC+ZWe0Sqwg==
X-Received: by 2002:a05:6a21:339b:b0:366:581e:19e9 with SMTP id
 adf61e73a8af0-369adfb3027mr31088637.19.1765491691535; 
 Thu, 11 Dec 2025 14:21:31 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c0c2c582e86sm3167497a12.33.2025.12.11.14.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 14:21:30 -0800 (PST)
Message-ID: <ffeefd82-43a0-412b-bbe3-31018d0321d7@linaro.org>
Date: Thu, 11 Dec 2025 14:21:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/smmu: add memory regions as property for an SMMU
 instance
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 tangtao1634@phytium.com.cn, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-arm@nongnu.org, Eric Auger
 <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20251211221715.2206662-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251211221715.2206662-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x436.google.com
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

On 12/11/25 2:17 PM, Pierrick Bouvier wrote:
> This will be used to access non-secure and secure memory. Secure support
> and Granule Protection Check (for RME) for SMMU need to access secure
> memory.
> 
> As well, it allows to remove usage of global address_space_memory,
> allowing different SMMU instances to have a specific view of memory.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/hw/arm/smmu-common.h |  4 ++++
>   hw/arm/sbsa-ref.c            | 16 ++++++++++++----
>   hw/arm/smmu-common.c         | 24 ++++++++++++++++++++++++
>   hw/arm/virt.c                | 16 +++++++++++-----
>   4 files changed, 51 insertions(+), 9 deletions(-)
>

This hopefully solves issue discussed here:
https://lore.kernel.org/qemu-devel/20251012150701.4127034-9-tangtao1634@phytium.com.cn/


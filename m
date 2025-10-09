Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9168CCD185
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Oct 2025 14:35:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6rjI-0006Uh-KB; Thu, 09 Oct 2025 10:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6rjA-0006Oi-Ix
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 10:34:47 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6rj8-0003Jo-4P
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 10:34:44 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso674302f8f.0
 for <qemu-arm@nongnu.org>; Thu, 09 Oct 2025 07:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760020477; x=1760625277; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kgMwGkd+Ax0NoqUH0H8flhJ/YusPGA+qr4CkKTY9Z3g=;
 b=MEJBwFYI8IjMMevarfWjV7wEPkKRRlg9dhdYX7M8RSQXIooxABDES7DQk7zRG4BdcB
 sPcxuMn1PZAo6SgpBB4nY5/rwUjzA8Go8w6hDvBFd84g0Vw0CPV9WmwXeBKk2xomlr8D
 ify01R+OWmvhI9ucUnLQyAlzr5sgGWqBIxjBLw8v1786CmcxqPyrJg8aiEX5R2OMjUY1
 eUS1pwkw/phyzlDpPqDwaCyfRCsXTyBxYtm2O0yxYwfm3i66En8vSuFpILTT/ab/4lMZ
 ATs9F8cflKbGE2EFBP1Ah9T/DwEBQ9dFmDHVlCO99bl9iduSVxWdZsKxKPwuOwAEdCJG
 it9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760020477; x=1760625277;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kgMwGkd+Ax0NoqUH0H8flhJ/YusPGA+qr4CkKTY9Z3g=;
 b=PfRu4ocZ67miqG288VQMaCfTFWC9fbTkw8K75AldAWr6PtnM4maDBThWj2RMWqZLvX
 fhwfT0TTS3gOrd22yWH9339QAShDA7iX1nORAYDCLzfFA7LfIJkq/sx+GAF/HQDNQQtK
 G7HfI4+tbTo8zggMP6xd0D2UddpGOTtRo7fV6KW59zx2KqW6w17RB9HLTVDzJNVNVC0K
 rOes6JmbSox/JvnBMpwEGNrTXGyKaSP4mUKr7V0Jyi+XLsMz1SmjgkcPVED6lURboOP6
 6fwRfRuRssL8mNpK9pT0M34OXqSXS7XZz99dlOqOBYtOzMGT5Yi81pjgUq41f365jUsD
 tJbA==
X-Gm-Message-State: AOJu0YyLQ5En//tVm8Xb5PmnWmrzyoCtcz+LvXmvtaHWH+L65rGp8F26
 GF1nqF6IJYC9LVLzN+jaT9trt/1dnKalpz767Q14VPEunsjxnvx5MZbhwvVCY3SmjNs=
X-Gm-Gg: ASbGncvIPdwHKIcWYirq+ShPrwpFq4jlH5zHAeo3mireMB6h+RXHVp3ZyWRtfftqLR1
 ujEkyjmIf+eOXRwXVdy6FleU0vYJWZuDsobetaCAP38Wa5GJH3liTXSc+5rszZHo0oFyjeG5VEx
 guoPbU++TAA9xWJPF/DGb22DeLm/SLqME4znukl6411YVC0xpN3asiL8qgclqrDcp6uRLnleaXf
 yHn6rF0hcsrM4U9ekbcAfGGCDzoXRv0WKtteD0lIrAQIHC/osgVviIfCG/eI+T9V5pRNDFA21wo
 I5jkcGL2zUNbpy8MTzHv/A9xaOiAQJUw/58f8xNszrGS+z2VzG8bdv0R31pv/tZ3qxwwkct4/5s
 Mzc+NGb5lNOA+nc3LqBMRFmZ3jqesthazPvg7RI6wtJ9D9330omHTVHFplxFQlANYLFq7wGYriO
 4iARS10c2DKtphp++EKg==
X-Google-Smtp-Source: AGHT+IFdbQ5nDGQHn3QprqsYdtQSHh/EGeTPw0GnpFcNPnI7RUrhJBGzPjQHm8QiNFtiwOIECbFpZw==
X-Received: by 2002:a5d:5d03:0:b0:3d1:6d7a:ab24 with SMTP id
 ffacd0b85a97d-42667177c28mr5237002f8f.17.1760020476750; 
 Thu, 09 Oct 2025 07:34:36 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482b99fsm568695e9.3.2025.10.09.07.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 07:34:34 -0700 (PDT)
Message-ID: <3a320d0a-215a-40fb-8d8e-eca99703a264@linaro.org>
Date: Thu, 9 Oct 2025 16:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 38/73] target/arm: Add arm_hcr_el2_nvx_eff
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
 <20251008215613.300150-39-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251008215613.300150-39-richard.henderson@linaro.org>
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

On 8/10/25 23:55, Richard Henderson wrote:
> Implement the pseudocode function EffectiveHCR_EL2_NVx.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h    |  1 +
>   target/arm/helper.c | 10 ++++++++++
>   2 files changed, 11 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



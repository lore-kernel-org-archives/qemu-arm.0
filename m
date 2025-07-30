Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5347C87FC9
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:28:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhELc-0000le-FS; Wed, 30 Jul 2025 17:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhELR-0000dr-Nk
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:28:21 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhELP-0002mb-8F
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:28:16 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2402bbb4bf3so4834565ad.2
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 14:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753910893; x=1754515693; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v78dqCYWBiNRyb3HUPd8tmeHfEqRKcyHyBF1df/n5Vg=;
 b=OOqebQZ5WRro59RQDpRnnvA/eCXNleSjLIVnysUcdo4Irr8LRjeZTRn7BqaWCHzDDj
 VJSgSY3hyAWgGQeSqNn26c4MOAZIBo0i5dhmIO8IZeus07Z9xQ3LfTc4ltNIJ4kgy38g
 yrWTg3XXWWaVw8/0158oQtM/jdOLHBtvK/dCHmJEnxtPiRC50F2CmtRbRWqgr3Fiab6v
 el8qKudDo7CXyPPrztMdNrBcz7kSgAY7+6JVs4LgH2OSk/DwygeUG5fhZDjaP2S2qvRS
 1sZX87soOv3uIzr//VdKPDvKoDfe0Pe4rEFTwvRBHQ0he37WFhqr5uAbcRqdcoupDPbm
 hbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753910893; x=1754515693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v78dqCYWBiNRyb3HUPd8tmeHfEqRKcyHyBF1df/n5Vg=;
 b=xDXHj59HINtOaenFClZ01ByBAK+H8tnXabBkYevrR1ewHsqaBdCRiabAQ94E1L+q7J
 brcqc2nvmbc87TWpNu9qJo3Ga9sNAteENmS+kNwRMLb7y7WSk3bHuZMWxjzLEv9zY53e
 1j39srKgavDhlVwVHRQVSuuXuGEqAXvfk8U5NGi6/uAsepukmmRuVOwSKLGLoqCvHKTP
 PbDpr3i4wPBhobxqfYjBAs+j+fj3/FFuKRZ6lbAKx+cF/4aqlMAaaV2KLjTKwkzDVc0N
 2hnyRStSW4eYaKos7mE+w9N9oJxA17yqIRE8HTveRq1FIsoJFpnoifLcbhMQ1prBctGs
 YWqA==
X-Gm-Message-State: AOJu0YyeGBpXxM8KFXlc0k8Rc7+5SC79Vpe6kUsdPwqZVnPNF7EHeVXL
 q19lBi01kAUzgdLmmfvvmF07UTbm2iOsjiOj79Q4+0SQabEZIhnMFQ5J+oO5DeZQhOEYlAp9Ol4
 IN4iC
X-Gm-Gg: ASbGncsVza5lUCBp66VgEwpUZT5qV+poEaaJG8uRJ74BwFKVyTz2Ivt/dBQ+GwamGRx
 6dAY5r9s9a3+51unRPULiF+la89EvGtuTmSYD5rUpBK/zaKIc0XcnKSyA9iecJ0lKUjbaXk+jw4
 cWcVBWdZ/ovdy7ulDJja9/7RcTuunASN83w4DldomUv8cSAUL3IA40h6eCveKqV5rArUKRrTclP
 cfubuR9BQJtEJAURjr3QqegUq8YwPjpBP1gaaeYqe7kBsoMaEmE822xKm3mgCbPnAA8uAIAkWp0
 nsqx1zESDLa7eDEJZzQcMciuGe5R/FApMCX/HrRh36Hip6su2IAybhiZ/5WromYasOb4+NF9z7Z
 +gelXOilv/Z0aiaxn/Y1R6fi2mtojzcleHGY=
X-Google-Smtp-Source: AGHT+IFMhkMJ21N/PEKv8S/xGcu/Q9yOzH5z+FRDhuZXEl3Zqbj/lF53jLIgAT1Q/lXRgqdFWrpedg==
X-Received: by 2002:a17:903:22d0:b0:240:1850:cb18 with SMTP id
 d9443c01a7336-24096bcc7a9mr64400015ad.53.1753910893425; 
 Wed, 30 Jul 2025 14:28:13 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aaf87csm551995ad.176.2025.07.30.14.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 14:28:13 -0700 (PDT)
Message-ID: <4382eb8b-9399-49bb-bb60-56334fa38ec8@linaro.org>
Date: Wed, 30 Jul 2025 14:28:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 40/82] target/arm: Introduce mmu indexes for GCS
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-41-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-41-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62f.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/core/cpu.h        |  5 ++-
>   target/arm/mmuidx-internal.h |  8 ++++
>   target/arm/mmuidx.h          | 71 ++++++++++++++++++++++++------------
>   target/arm/helper.c          | 15 ++++++--
>   target/arm/mmuidx.c          |  9 +++++
>   target/arm/ptw.c             | 20 ++++++++++
>   target/arm/tcg/tlb-insns.c   | 47 ++++++++++++++++--------
>   7 files changed, 132 insertions(+), 43 deletions(-)

Finally getting there :)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>



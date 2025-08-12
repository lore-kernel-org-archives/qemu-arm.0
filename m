Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A09CA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 06:23:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uliOy-0006i7-Ah; Tue, 12 Aug 2025 02:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliOs-0006fY-Js
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:22:24 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliOl-0006Pw-TD
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:22:21 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b9141866dcso36764f8f.2
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 23:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754979730; x=1755584530; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U80tQRzzMeHvXCfuLUWdnMALn05gCIwvOWs1XXm+OfQ=;
 b=Kxm/I3pY5dlOhtQHQQjKqDpo5erDfeA7X84FPtrUD54QijOTN19H3hm1+vybW9/XOV
 e60XuQzi/JEumiYzNWLPp4tLLbb97SBk335DkU34bOEyCu+890xSH1EVT5FI/F2TKkgA
 okvP1Lx64b9a1wmXJBs7MuUpAEp8kLmc07I0nX5aR7Y7Jmh/Na6Q668XHU+Obi5TDSK+
 Ry4wOm6dC53oemHkGvDsSyYRyjM2a022A8H2ywsDONXOdZr8I6eb/YU+/70wORovSmH/
 EyNaBj7tPVdEdKizCSikjwa/uBKQMEQlfHGH8csx/rHJOFLlQ/sMBq+MWqfALkz48Hou
 Z4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754979730; x=1755584530;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U80tQRzzMeHvXCfuLUWdnMALn05gCIwvOWs1XXm+OfQ=;
 b=ABd5jzHQYgi363kWJjf/494+Rg7qnyEFnogTV/d//ELMNBQ3oV2Y9byfsUtiCtMqFF
 dJtMHRQQRhZwHvp93l1DQ211/bwqEg8aDkZLA19KeNUys1zrRwH3Y2A4itqzv8TiS/4k
 QR6JckU6k/VmQm6e5v9+KvOvV5dMb75dZZh5oqTO5a0eXMW2AAE/t7goG97Th3XrjEWc
 Qu3DZt/KOFnrUH9G+2uaIXvdKkcma1ZXTmQ8WYGdohWQHeya3NH04H5JHbsYWcfE6uNN
 KnkeTimkuhrCULPdy7C8LDy8la35pN5+JrCcLxzUfcfs9964LpmhRYVopPTFzyWb9PN6
 vaCQ==
X-Gm-Message-State: AOJu0Yx1zhFQ1MxXWp0VByyb+zoz++hXCgwKy1eJTd94iVH9XI3u8CYW
 X+/mI0Uiyp45iv7N5O1q1jOrAg4ne57sRQmCA3yki3CKgR1RV9i3YQW+eP7SyE5P9Ko=
X-Gm-Gg: ASbGncsETiFDsDBcshPWKg845fNQ13acGAqB+73NLJoWXtIoRIKod00Bl88HJPBo3cP
 Qok9PlTIWDxc8yD6risa8N3QF3OxzY/UzcFC5KUpt2EsmRyY4FSqXFDMQXo0saJeuwPfzcbGEZM
 6xoRzGsWwgMt498/FS3YTHT7Bbm2fU1XP0eM4Bjbh0gp1h4IC+nz9XvGFec9BQrimjQwRpqdSMG
 ISvmT1IplDts5xpEVB2inr4VSdNStZGbP9saHyYmIwM3/ApU0bBAvPsBAb6I09vx0xBq3WQ5o+e
 F13vfKUET7/vxi/dnhgyK8iyxsAcXNRs3BEkkeU6YLMdmI8boVkMl/lVdhb2ixFeo2x8ojwikf2
 Ep8nv439ejkCi0DugkRC3R7+XkXhr+kWjmYd25tf6b5qFpBZ6RNVfbm434mit0VGuIg==
X-Google-Smtp-Source: AGHT+IH6hLGjvsAG4FhK4+mOSSANR8QXFfyV1EpIiM9jnIEytMRw98n4UbeZT0UrG9JymIPi8Foegg==
X-Received: by 2002:a05:6000:1a8f:b0:3b7:8851:659 with SMTP id
 ffacd0b85a97d-3b910fd9b66mr1622627f8f.19.1754979730489; 
 Mon, 11 Aug 2025 23:22:10 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac574sm42988810f8f.5.2025.08.11.23.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:22:09 -0700 (PDT)
Message-ID: <a56148d4-0076-47a3-86cf-90e870c101eb@linaro.org>
Date: Tue, 12 Aug 2025 08:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/85] include/hw/core/cpu: Introduce MMUIdxMap
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <20250802232953.413294-27-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250802232953.413294-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 3/8/25 01:28, Richard Henderson wrote:
> Use a typedef instead of uint16_t directly when
> describing sets of mmu indexes.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cputlb.h | 32 ++++++++++++++++----------------
>   include/hw/core/cpu.h |  6 +++---
>   accel/tcg/cputlb.c    | 30 +++++++++++++++---------------
>   3 files changed, 34 insertions(+), 34 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



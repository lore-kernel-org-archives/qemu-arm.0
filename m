Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C138CC83F17
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 17:18:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZuuL-00039U-1o; Thu, 10 Jul 2025 13:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZuXM-0003zR-Hq
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:54:23 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZuXK-0004m9-U4
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:54:20 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-40abe6f8f08so870965b6e.0
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 09:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752166457; x=1752771257; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hJa+dfx0FhCZ0oSO3ILPk/P2Hx7kikYQEZnDI/5C/6w=;
 b=Z6XQVsz29z7+QttO6vj7Xez3mCKtKSPvQvyR1weGsgGFwyLFDHUiq7UsZEcBz2tiBI
 EzioCfvlB9p5nDIRfL5txsk28QHtDw6tbIHVdm3m9jC2Yhc7eAMJ5FMl+8FdXcm2rZEu
 c8D6fhvnAGXCtTfLudOpRFKeX5tzy+rfHKzYa0h0AT25RPxPMQWMbKq+WFdTB03GH6bp
 D3M+XAtbVomjxjeUZnuf4NiqUolpGLJ4jdlsjJerIF3acPps8kdPYdgwVKqX6UCR8akx
 iUQoCH4sN3uLOLykMPpKi3HynCJAkfLEI2ph9WUDmHKK1Q2Ctlj4uc7uPztuoamtmyUJ
 zQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752166457; x=1752771257;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hJa+dfx0FhCZ0oSO3ILPk/P2Hx7kikYQEZnDI/5C/6w=;
 b=FrujiBXOVJq+4kWq1wwfdrp12y6oWPQTev64FRdPGzZ1CJVqbdRLBuJmD6MMASYJIm
 fYFfRMUILh8q39YcpipsXt1v/WUk98pAca/orU7JjwvJypE2G9oyqWLVKNN4fgn854Fm
 cV/4trI2bzgXyKqsD7HLuglm4bKQNprAxc79xpfj0jwuWhQEcBPBVOqIbDWqmI8mxGTe
 nPoptqguU+o5eDOPNfuEyt7HCMRN5UnqwtgkmI2YatYORJuxcVJCuep5NryUiN0tb18n
 HjZPh0EG9/bAFlED36tOPFKMkpQwy5z4qCSyAsSDErcY5SkMPgHcBmLwuQsl3/161agI
 OP8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+FKntGXmFTOriAwLMiMTzL+fMTgj5fmQak+gmVE5guUa6i2Xi7cAg8aXS27+yPErmSJ9K1dT37g==@nongnu.org
X-Gm-Message-State: AOJu0YxnmA7InK/fMgnW/kd/bLjsyK8VQAXC9FX/Ib3hGvjVoqG6HIwC
 9s0V6ThKmyIHAj7gOm0/R8GHvqjmYwef1Gz6HIfEL1G/vc2pFtLMPbGzRTGw6CkSKtQ=
X-Gm-Gg: ASbGncsMfBe7aQ5kEz+52QhzR7kR3Hs6WsvE9nTbjWBgZYGxqyp0Ad9B+s5Vh4cDYwl
 93ohdOFIEcZXopt/c3w5q6deTIaU1TQO6CH4G7TIl3OAvKC+WdG/4vYmsn1jhL+XNfKcTeiUKey
 0Z0pFoO9xa8/mN8PzXo2/KZ9odlNAjnYuUhGRlRDucFD/4hfugKSwWH9TJGrO8YelW5iJr6ayK9
 hkqMY1YitBehHntVHFsoY9EP8SPwi7HnCdBzWJ6lpNtgs91WWl9lrssMxdYjrlmcejUP8IMYQOg
 Ts42KVjPYl7FnSlP+fJYgeUMC6c7oy4cLgl8bdTf5tCeXXVyCQcwGcm9UUAnI+YltP/BqueOR2L
 cwDQ=
X-Google-Smtp-Source: AGHT+IG/rDNo150/OnH8Lgrpk1OGHt9kqb9g390KBeXMR75v4V2KtEntlBQB95XYWmIRx8UzbzVOzg==
X-Received: by 2002:a05:6808:300f:b0:40a:52f5:f2ad with SMTP id
 5614622812f47-4150d749172mr241663b6e.8.1752166456799; 
 Thu, 10 Jul 2025 09:54:16 -0700 (PDT)
Received: from [172.20.0.130] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-414197c52a6sm256407b6e.19.2025.07.10.09.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 09:54:16 -0700 (PDT)
Message-ID: <f256b198-6150-48a3-a97b-5f0c2cc072ce@linaro.org>
Date: Thu, 10 Jul 2025 10:54:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] target/arm: Implement FEAT_MEC cache instructions
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org
References: <20250710163858.1094780-1-gustavo.romero@linaro.org>
 <20250710163858.1094780-6-gustavo.romero@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250710163858.1094780-6-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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

On 7/10/25 10:38, Gustavo Romero wrote:
> This commit implements the two cache maintenance instructions introduced
> by FEAT_MEC, DC CIPAE and DC CIGDPAE.
> 
> Because QEMU does not model the cache topology, all cache maintenance
> instructions are implemented as NOPs, hence these new instructions are
> implemented as NOPs too.
> 
> Signed-off-by: Gustavo Romero<gustavo.romero@linaro.org>
> ---
>   target/arm/helper.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


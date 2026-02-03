Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC49DE87839
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 15:32:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnIMv-0005bj-FV; Tue, 03 Feb 2026 10:31:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vnIMK-0005Ve-N9
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 10:30:34 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vnIMG-0004SQ-NJ
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 10:30:32 -0500
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-432d2c7dd52so5987777f8f.2
 for <qemu-arm@nongnu.org>; Tue, 03 Feb 2026 07:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770132626; x=1770737426; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xF2HJ0Wyame1SxI4aiwvIPgw7Y/YuhEmLO7iSwUxlNA=;
 b=MPcXenMO/no//BC1+4fjxRMnklkM8Mj7renWHQ6/KAYuP6iv1K3w86NVGc5BnKqm6h
 nLkzSrfZHtzN12eEFITCLvXFEQO2eBx2gaJVS1coXdkqZ5oEvHErKihEbh2iEkv3cR9n
 4UkXCQ8/4pac+7s0ELIs8j2ETnJjU/DMoNrhMKQgVMgu+fkCZZQ56NlgXBqbZZGSw67i
 tHtm0x2gBsiaRW7yjBX83hCKqnaWKdKIXxbHmee1pgW8Z0/AZ2XJKJRKscWRIH8VBawq
 ZNp9e8Eayvalp2zqwjB4uGSCHwAKQVleMT4Bl6zBf80HYJ5Z9Dw4gil6cbNEAHtoEk2E
 cpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770132626; x=1770737426;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xF2HJ0Wyame1SxI4aiwvIPgw7Y/YuhEmLO7iSwUxlNA=;
 b=bOnKsj7RxAPGUQslLKjCOUnTayv+1PjQOStjtOD2oK+e2sHR3oC4Edi4JHxQsEcEWz
 gcjuqVefWaDZSwQSpnGOfw6TT94VVDXYpl95tJcJFHCyt7xAcnzDSrzcpfRGdRMFGQon
 Rm5a8kiSVO24yDpzDi2OwvzY1b3lNrdpSXRW6YmV1NlFwG6qCWr+yxAmAQH+IGWul8np
 34rlPk+3xwRMh2cOjPEKbXOCGoSFL8UjHl4rk2jIX2RxwqhsvZ1FalslwrWM1/JXLO6H
 gYRIu5Mv6fGP0lOps64xPHuT+ZmBUEIT36L9Qio3y1IsXyl8FOLoXUih6NFYSrgceXgA
 TuUw==
X-Gm-Message-State: AOJu0YwwAQTbTwrnTkjzQV6CjNmiXkCUKFl6slKqDW7TDTNMvs2rYoPM
 vLSzRXs0tHP8SOIg732fNeanZVUg+PuJOkQ5Iqxtpw7dl59Qyu3FW821QOuUEYhrIWk=
X-Gm-Gg: AZuq6aISldsjMpHnZvtWq2cCN+aQkpbtDG0MHyoDx8BciZrZ3FPokscC1GCPFL18OjP
 APxi1gKtH9M2l8suYrraAtXFy0ceWKp7IVEldtwiuJw+V3HVsKTIwpCw794kfpCmyhLs5mBLMPJ
 oE/JYGycsgfFwE5oSNZkm+/OwNeiIzJ/rKRKDHqhiHmpAahhXDic/ukzpKYeI18zQH9wCwfM1uo
 xMfEpFkNiqA6n6mjNlqXHU+hZipRN14sHD2xgCQGaSeUoOpZd0c4q/J5k4H/IG7bawxbhBzcxC6
 uE4KsYb9rHvvRtVB5Ixr23UyDTjdEJa2gs9Tk7lDnyw0dLK7hqlVOx9Z+ImcruyPp1dbp4IBWlx
 cGn1dntSJQtl2gdHhtiIrSm80GLPBTkt4H/TBDQAnL7Quf2BgcV6Mqj6hCyZXbGVsBwQgGZapgr
 YPGXS7KmNajDGttXJVEso9rg8WGjY7Q/mIr95oFZqPHaow3SpZZhqRaQ==
X-Received: by 2002:a05:6000:2404:b0:435:e493:25f with SMTP id
 ffacd0b85a97d-435f3ab2207mr21143506f8f.34.1770132626085; 
 Tue, 03 Feb 2026 07:30:26 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e132303fsm53112667f8f.36.2026.02.03.07.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 07:30:25 -0800 (PST)
Message-ID: <415e6eec-24e5-42dc-8678-737f541408a1@linaro.org>
Date: Tue, 3 Feb 2026 16:30:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] disas: Have disas_set_info() take a const CPUState
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org
References: <20260202222412.24923-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260202222412.24923-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x443.google.com
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

On 2/2/26 23:24, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() handler take a const
> CPUState to be sure it is not modified. In order to do that,
> first constify few callees (ARM & RISCV).
> 
> Philippe Mathieu-Daudé (7):
>    target/arm: Have arm_feature() take a const @env argument
>    target/arm: Have cpu_isar_feature() use a const ARMCPU object
>    target/arm: Have is_64() take a const @env argument
>    target/arm: Have arm_sctlr_b() take a const @env argument
>    disas/riscv: Make rv_decode::cfg const
>    disas: Make disassemble_info::target_info field const
>    disas: Have disas_set_info() take a const CPUState

Series queued, thanks.


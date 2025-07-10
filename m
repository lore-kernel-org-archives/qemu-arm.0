Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD00C83F1B
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 17:15:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZur8-0000Mz-8G; Thu, 10 Jul 2025 13:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZuVb-0001oM-Dd
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:52:32 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZuVX-0004fX-IK
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:52:31 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-73caf1152bdso531072a34.3
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 09:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752166346; x=1752771146; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bjnXLV3Ph8zKIBKaU+MzWaqCrcAIschWvrB1OUGre1s=;
 b=rxRnoX9WJJM4yU1IckONQcMEDe/xHaJRdw5WN7QwFr4/FEvXqsCYYs9emE6j8eMbJk
 UM6ZVzZ6zXlkUnKhCL9rhVLduMDnqiNuCPedevSrI9Hbedt9K4BYEWKK2HfNuQJgNELt
 EvUYYwuw9AHH1cBRdM8kbrLhvis1WJZHOO2ZAXmGpDwex17WVlf5eZV4SzTJJu5btqse
 rkGwCCZH4YUNOpelcB1Cx8K85/PrwKh0J8NFBaseYy5YTrtz3URkiP785ujIKl9D7I/d
 RglRr8BFj3jMApXp6CLOsp2GyT3cpuoRJritZxo3sulK1AisdOzytlPYKjRjq8NnQ15I
 CnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752166346; x=1752771146;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bjnXLV3Ph8zKIBKaU+MzWaqCrcAIschWvrB1OUGre1s=;
 b=TnAHbTxg13/vWRZK4WG0Pzswyxg9eClTL8n8Uns+ud+faVmlc1H+g1ICa9J4BReYRX
 fEJUg4LcCerkFGscIGsUNAt/5tJRl9W53aDGWEh0QBrzHxSqfpmJC20SCdyNWKyoMFtJ
 Varl/R0pt1s7wnmz3+Sm7kN/qxZTfQ/X9jTVDp+2DxC5DX9Ec5sR9YC7mOgAFsJYAcBE
 hskoA1RRYohOjrbs0Pf/61MQuMsrpDSw6pD9IVzucsjXbSIT2eF0VB3YL3p2s/R2IO3I
 ijW/RYzmT06tuDFyrrb9cDx1I4CjkNup4+f1GNWJfSO2rKYwQzD0yibh9AsOh/27zq7b
 4Sgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6S2a2LZlQs8JqJJNiUvVe9itN8+E0Cn87HIv39TivEb6JK7rm9JgaS1oqM2hERPV/xmOIsagnjw==@nongnu.org
X-Gm-Message-State: AOJu0YyrS3GVmVqzLIsIyomKingP3kLsLXM/M6hkmBa/UhaSuPgTho0V
 kU2zCnNhAo9uFAfMf9r3xbTeiMHAQwOKKDrvBXzKndw1eFItpuP5YyfBaH3//Rv1yVs=
X-Gm-Gg: ASbGnct0utZf2odqoYf8h1eZWd5cuUWY+WpIJm3q4grx7NpUkU4Wlhm03Id3RH9FiWx
 cqZJV6kvJ4EFNo2fqiC28lqj9MRsJE12WY1qR3HRp+ToomTAC6q+tmReoVpSskJNyCpnaJZLu/s
 eI0N/lv/3M/rgwgVf79uc/Ak5J9GnvmbR7mzGBnie6kXOON0NGtbbMuaM1+F0qGCGc0hZ2k3nCJ
 RvG9hrLN+dNl1je+Je8bZKY6CSIKGVgZS047g+WKt7D/hfm+LJAa+cNamDKi4eXOodZnW/9sqkg
 F5hLS/hpyIEcDTkVgJCvJZs/BZ1vchgrXhjHk4cOSwDBBNUae+GJrZgrr3RMRpN3QWN8i3BL2/O
 BU6HvR52MYB68KQ==
X-Google-Smtp-Source: AGHT+IGRKeapE5fQKp29OdUeBUirnwsDw02u5wbtnFdLtBNuxXUMdeBwMV7+Rz5P1zAPkXRhu3v5zQ==
X-Received: by 2002:a05:6830:6609:b0:739:f863:c4d7 with SMTP id
 46e09a7af769-73cf9e3bee2mr207711a34.12.1752166345698; 
 Thu, 10 Jul 2025 09:52:25 -0700 (PDT)
Received: from [172.20.0.130] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-73cf108a6ebsm265420a34.15.2025.07.10.09.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 09:52:25 -0700 (PDT)
Message-ID: <7ff43c54-1640-4884-a16c-793eaad0423a@linaro.org>
Date: Thu, 10 Jul 2025 10:52:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] target/arm: Add FEAT_SCTLR2
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org
References: <20250710163858.1094780-1-gustavo.romero@linaro.org>
 <20250710163858.1094780-4-gustavo.romero@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250710163858.1094780-4-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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

On 7/10/25 10:38, Gustavo Romero wrote:
> +static CPAccessResult sctlr2_el2_access(CPUARMState *env,
> +                                        const ARMCPRegInfo *ri,
> +                                        bool isread)
> +{
> +    if (arm_current_el(env) < 3 && !(env->cp15.scr_el3 & SCR_SCTLR2EN)) {
> +        return CP_ACCESS_TRAP_EL3;
> +    }

Still missing the arm_feature(env, ARM_FEATURE_EL3) check I mentioned.


r~


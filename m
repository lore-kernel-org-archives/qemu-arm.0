Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C9310A62FF
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 02:50:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w5xHE-0004o5-UN; Thu, 26 Mar 2026 22:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w5xHD-0004nk-MN
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 22:50:23 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w5xHB-0007hD-UZ
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 22:50:23 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-35a09e0dd63so1584047a91.3
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2026 19:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774579819; x=1775184619; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=camePBxxLlNw3wfIKbf+1cElaIRgdEKBayvsMnE3PzM=;
 b=eDDaqYwUVQNQdeYNJDWDMg26B0E9uojju5j4qU8zwBcYEa8t2uZvpoqKiaSik3kS50
 0ohJwXEH5d2sCUl7JcKZm3qbsdS8TJHgIdK0pXUA5ejWlNssyVP+e10ftfXFMMHUEpBT
 orbUP2NwEid8tzL9CKot6ZFv8rCVPv+DyEvaOP3dcx52TK/tpghhH2giZobzy30RU8n6
 LvL3nTXkZtahr7JuXSEHyzFuw8Gw4t1sSyZI2AKgmFqkMeeCEC0JSv7tWaQGcpikr0UX
 mnDF93vMR1ZWIqdWeeTHPsVO8TxDquexdPcPZqCQwxJgZbsY3+W9hudhs8dbaQCjehhU
 UBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774579819; x=1775184619;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=camePBxxLlNw3wfIKbf+1cElaIRgdEKBayvsMnE3PzM=;
 b=ck163KGhNa3V6v2XCRWJW+cvRAkUjZ6oWO6um+WMUg+/jgjs2DZD2DSE7PdFpoDWa9
 Sk2pQ0FwxFglSnLXlviMwxnm4Q4NU0/9PEXpZtKCd1UhNQzFKLV8+4tXOkTM/pOszNhv
 8OoErkOSD9znigTYyYLncDSVo/FgG7AFBwqcx8LiL84PEJaGvSqrna9nxalmaMrtayvG
 mG7Jqt6ozM+nJLuT200eFUuLeSKJyY89/2uWyS5daiR3JRXrU8fUcPGKFRAxf4LeH43i
 GXPaR0DdwQwrZ+/ang19eeCEw/5zqlg5yKMiNBgBLUhC2IntdoTIsLbnMrCFMA4c4b8F
 iSTQ==
X-Gm-Message-State: AOJu0YyJm0yNGkhUE6Om15644uXUDWHvNq5ELAmsv1tupiDSJiaQi0MG
 H+bI2XOQVTNSONH7Ssd/f46cGlnwHS+kxSB/lFXvhdnCiFEHSIa2fm2JSqzrKZAxbfU=
X-Gm-Gg: ATEYQzz+zR3JUvp8I/RfR/ZY1q3KKXgoZ7lyuRxCc4R//MGfOq8MIdRB4rFSGvNkvtm
 lwbk9EFxj5y2Q14w+FNAv3AoQBEgGzpDZVJjK1JSZSe7aFUbR6Q3VVXJLtDQV5yy15uK9gWHAu2
 cDE2KCMIFhlckLuezxb4jfHLk+NDub9GORU1bx7aAGKtlF2kO3YDwjFMzZ2AexVpADok88MCtGF
 8KTJzVbXA2P9RRUQMo8rZFBAXNnZDFegO2nkFyvlQDn5+/qtYrUIbsfYLCcok1LNvXnwyHw5uOe
 HpgziGq9ilFYuiQXTfIHTzMKqAlRm0kae+AksY2njIfeE00bSGM2vDRZZmWlWAZ/WFvJDY/RynJ
 1EuXypuiYNDhoEr/0BIgALVWBznHkOtx9cglWSFIt0r4aT5V4co4GZyAyiDyWwui+4ptFQfUo3t
 ni7ToDHNxA6oyRF12eIrpTxcyM0Yc9rZ4TBxnSun63pw==
X-Received: by 2002:a17:90b:3141:b0:35c:936:d4cc with SMTP id
 98e67ed59e1d1-35c3002fd1fmr900670a91.14.1774579819320; 
 Thu, 26 Mar 2026 19:50:19 -0700 (PDT)
Received: from [172.16.11.156] ([103.100.225.140])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c22d8c500sm3062454a91.10.2026.03.26.19.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 19:50:18 -0700 (PDT)
Message-ID: <7be1406f-11ca-4422-bb3f-bc344d736ad7@linaro.org>
Date: Fri, 27 Mar 2026 12:50:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] tcg/aarch64/tcg-target.c.inc: Manual replace of
 I3310, I3313
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260319-aarch64-tcg-instruction-format-rename-v1-0-8a13bf98f8ff@linaro.org>
 <20260319-aarch64-tcg-instruction-format-rename-v1-2-8a13bf98f8ff@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260319-aarch64-tcg-instruction-format-rename-v1-2-8a13bf98f8ff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

On 3/19/26 22:12, Jim MacArthur wrote:
> These are not formats in themselves, but extra constants to OR in with
> the existing ldst_imm format.
> 
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> ---
>   tcg/aarch64/tcg-target.c.inc | 64 +++++++++++++++++++++++++-------------------
>   1 file changed, 36 insertions(+), 28 deletions(-)
> 
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index e9f86176d2..1f59d40a77 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -458,8 +458,9 @@ typedef enum {
>       Ildst_imm_LDRVQ  = 0x3c000000 | 3 << 22 | 0 << 30,
>       Ildst_imm_STRVQ  = 0x3c000000 | 2 << 22 | 0 << 30,
>   
> -    Ildst_imm_TO_I3310 = 0x00200800,
> -    Ildst_imm_TO_I3313 = 0x01000000,
> +    /* Additions to the ldst_imm format */
> +    ldst_imm_to_sign_extend = 0x00200800,

"to sign extend" is wrong.

C3.3.10 Load/store register (register offset)

Perhaps ldst_imm_to_reg?


r~


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2BDC83F03
	for <qemu-arm@archiver.kernel.org>; Wed,  9 Jul 2025 13:48:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZV9T-0004Xe-Do; Wed, 09 Jul 2025 09:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZV8E-0003w0-8B
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 09:46:42 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZV8C-0005UA-AU
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 09:46:41 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-73cddf31cb2so492604a34.1
 for <qemu-arm@nongnu.org>; Wed, 09 Jul 2025 06:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752068799; x=1752673599; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2UX7BPaZX+G4MUKFrT8rmfDY73rzszJdU+KLzT3HOOc=;
 b=XwQqvrT2JEe8xH39SyWZGDbsR8tS8fPUODKyi92F0gXpJcc5mW+H+8wssZi7oN4TbT
 fF9TsBIU38oKjnAuJtLVgvySrMpfNPWXRcsKzZ4MGc3CzFnlKO7S6yj5fCRycjOi4rgG
 8joFNQ4dG1GXKp0vUROQqB3AMKJZmSgdlg1gBRYsoyxUhs8w6FWCVfjzkh+RtV9g2a5+
 WYgPC92O/+wMX/xubVXDcr01mjE3F55UghQgHmCEi4ZszKA9s8wZ5uPvzWgKOpU+ZFmc
 K/7O3EyhFxkCuxLK2Ip8LkHVaBngvXJFjbZ0qCfFhV/DCwj9lnNB8fZ5hyMHWRy+jhS8
 MlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752068799; x=1752673599;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2UX7BPaZX+G4MUKFrT8rmfDY73rzszJdU+KLzT3HOOc=;
 b=sc81oUWTv6SsmRPUWyhmY4E/nq7/1OTIV3zJPALFK9o+i54rSkfhZfJNJMkuewUYKU
 YDecak7pGZtFkrpVeAye+Xcjdj8QiwiIg8vVLgYR8LT7o5P6oKWoG4SG/58ZzhoSapXl
 iKE2Nu8m+LJkEgOpz+T3m47Fc82jN11YbY+L3ZRjskSiIEDqxlUgUmm1wzGdhAxXA8VE
 arIBKTp0QacG/rThnjJezgs+d71NEWmWyiNJp0uqJAoqgVFLBrjeCAprj29GyaSX0O9v
 xs/LTwd7OZEMvmL0OnUegQzT0S/ZMpxg2T6ChxPmcQ/e7Ko8/Hpj2nOhknfm+95t6/G0
 muvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgP06wa2RTaMHDTxn6HQsT5XqXJiv6+RSgiPHJmaFZn1ZjyxtqobeMnibgr2CJgOMhnTgO63XkMw==@nongnu.org
X-Gm-Message-State: AOJu0YzlbpTNr7Yr0jUddZTDdoLJSUhaZhE/HeQPNRIBtYnC+qatZKBN
 guGWV7VH8Fwvg/olHLzCefKzjj/JpVRToGDX598aJwvoKMC2Ji0dTiBCP6YFg9Xn7PQ=
X-Gm-Gg: ASbGncuwFDPW/aUBbjceX5D/WnFwlA+HgVLixajo3AEFRN5XXtp59vreGOt5H4xj9Tv
 bPO6vZDTKogkpb5CnlEtkP8Jn+dkkwDYd3kOBk622tjZUAEeTYPpL+ODrG2I7jZVS+IaPlWJn7N
 lBXUHvO9tbIYzOapNvNA4F30YXSSdw2KBqDMITZrbVQcQt5YEjCHBkK2bE7/tO1r5aAdckS+tYB
 R4k3f4wqQE258IS390Fl86jUuh5k1mZIDZk52kv2iiQ3q0QnwlZhMO4gnV1Ue/gWYEkGvAs7pU/
 PqiyVw7wJ+r6GT49FuW4o4wy+A//qOoE5IdOKtYR6bfwx1U5EbNaE6i/cS5u2Xdy3skzjRUn3Mu
 vbqQ=
X-Google-Smtp-Source: AGHT+IEC1a8IAPoyiAKN2hZIXWYKVtogw9oKfY/U1cfRMsILBVzfABC8gMN2hA6jVPJL+2WLfcd/KA==
X-Received: by 2002:a9d:6049:0:b0:73c:bb23:3cf7 with SMTP id
 46e09a7af769-73ce635d4d8mr1823978a34.17.1752068798989; 
 Wed, 09 Jul 2025 06:46:38 -0700 (PDT)
Received: from [172.20.0.130] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-73c9f75dbd2sm2398581a34.27.2025.07.09.06.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 06:46:38 -0700 (PDT)
Message-ID: <0986b734-74cf-4b4c-9dc9-766824d3a47e@linaro.org>
Date: Wed, 9 Jul 2025 07:46:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] hw/intc/arm_gicv3_dist: Implement GICD_TYPER2 as 0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>
References: <20250708115238.667050-1-peter.maydell@linaro.org>
 <20250708115238.667050-2-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250708115238.667050-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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

On 7/8/25 05:52, Peter Maydell wrote:
> The GIC distributor registers GICD_TYPER2 is present when the
> GICv4.1 is implemented, and RES0 otherwise. QEMU's TCG implementation
> is only GICv4.0, so this register is RES0. However, since it's
> reasonable for GICv4.1-aware software to read the register, expecting
> the zero for GICv3 and GICv4.0, implement the case to avoid it being
> logged as an invalid guest read.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/intc/gicv3_internal.h | 1 +
>   hw/intc/arm_gicv3_dist.c | 9 +++++++++
>   2 files changed, 10 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


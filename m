Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAB2C2A072
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 04:29:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vccDr-0008Uk-G2; Sun, 04 Jan 2026 23:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vccDq-0008TX-BB
 for qemu-arm@nongnu.org; Sun, 04 Jan 2026 23:29:38 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vccDn-0006jD-Sc
 for qemu-arm@nongnu.org; Sun, 04 Jan 2026 23:29:38 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2a0fe77d141so156793745ad.1
 for <qemu-arm@nongnu.org>; Sun, 04 Jan 2026 20:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767587374; x=1768192174; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ReBQO6iEVhGHetLBShgz7qNhZiTkVSuU8pAjASl99Ls=;
 b=TsDLTzYvYa/wZSzA8L/lOCOgTOrw5fTGQgxFtT2H8qHYc1NnDyNtFCs52P1ItK1u3Z
 1rE6oXohQZ3pRRvmPS6PDnraDbUR437LgAAXzNTtRKbJnKGSjs9zXh9GEW9umnuc3w/e
 /dzVioOIbsDJW+HoZJJfIdTAf0hT9uw29NW2umnT2KFYcQ59OlVzYJWns35O9Bip9LZ0
 VxvXehlUj20r4k72EI0T2BbnR9TZ/ycxjXzLSaMCcuWrR6M0W3R5GyYO2waZBPxmTQk/
 WB5B1Wj0ixHU1/nz7gF7UrHC+/c2DqgijoX//iS2m9/2eQjDOcZ0KElUC4nCoeBZQq0D
 fsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767587374; x=1768192174;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ReBQO6iEVhGHetLBShgz7qNhZiTkVSuU8pAjASl99Ls=;
 b=gBQG0C6cDRvmXP8XA9EBXCXz/DmCcRZUh9irl9pjipC5V0peCFelL/ikXO8dZ+amAz
 FMMZ2Hs5BTBNeovKB+w5sXjfSuARZB5OugeKKgLnO2TpqIpOwQwFZMb3T1kTMGFNEk5g
 83hkpZSeOus6+npwRe20f37YTS3WVD5XTDGb3787lOChYALE9paJMFGRiW/NZhzXun5S
 f2lWhyQ1qu1mM9GeQAanNSkAjKjLJVX+oYSOHpY0CC0nkIhUPgtiwnHcJz3j8hOGtA2X
 cbwVQhl18CIbbJNwv/5UQ4vy3bibjwtNqTB2Tmo0qKWwuJvhaV57xaYrBFy+Rnv3oh6L
 6cRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMUvG93+SttDIcNa+V1EtORKtEtKf6etrSNUUIm0+mAQwJn1jYu+EqPw1g8jz+e7niMDs1CmwXDQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw1dUE7b4wNZHqJ4pc4O+PmLHNPKaO7HP+XMGxLc6xvV86Jbp0W
 uGm9P0EHp29eBGhWwW4IJYyQOqyVS9ZFIcen+8MDD+XTXnwnOrnWqPO8EFZKYnOO8t8=
X-Gm-Gg: AY/fxX791UnkdQoiKoDy+jI/oc4LzWV1UrHeIkiT1iiz8KjSRohpsY7C3vHbNvKHQoG
 hWigM3R4L601fONPije4CtYQpqscp0OsFBjwEOLRYKcsP0TNlxNCCxnJXEAMshsfkdsCg8xmsXF
 VlddL6ihjCS9nzb30JyDEZ5Y3WWijVq5z3pcMOy7paKtFVGaMWlNQ1eW1F2E0/ajq79Ctgad/Hh
 S1yx0edcaDRthjvv+rGIB/NRshmG5Q5GV6BklqezVvyiGyNQ/Y1hauIiwX6UfAjCIe+Pctw7IM2
 06gSoYvTS3YGu5/DNe2luNJ9yLw9tE4Z1QtALgx5UWGYFunXYzGwP7GL3nS0a93xEPIDQcq1Y79
 5q1EwAYOTVprJz/YGtSSy2txi/3ce09+aRaJ5Ve88pRyhxXn/E/ktLyzJF/rDmK9+MDxSFjWVhm
 gHoBrmrdtvwKiZdFcKqraHKQAQko48ZQ==
X-Google-Smtp-Source: AGHT+IEmb0iLTHokOIPzVM5WptPSh6UXZkQNTkt8+ASO6Cm8HeU581bQ9oqhLVEtLnmzVhSYsInMcA==
X-Received: by 2002:a17:902:da85:b0:2a1:10f6:3c1 with SMTP id
 d9443c01a7336-2a2f242d304mr453735035ad.26.1767587374235; 
 Sun, 04 Jan 2026 20:29:34 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d5e467sm364098505ad.83.2026.01.04.20.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jan 2026 20:29:33 -0800 (PST)
Message-ID: <00ed6a0a-a058-4289-a515-37678f0843a3@linaro.org>
Date: Mon, 5 Jan 2026 15:29:29 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] target/arm: Correctly trap HCR.TID1 registers in v7A
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20251231170858.254594-1-peter.maydell@linaro.org>
 <20251231170858.254594-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251231170858.254594-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 1/1/26 04:08, Peter Maydell wrote:
> In v7A HCR.TID1 is defined to trap for TCMTR, TLBTR, REVIDR and AIDR.
> We incorrectly use an accessfn for REVIDR and AIDR that only traps on
> v8A cores.  Fix this by collapsing access_aa64_tid1() and
> access_aa32_tid1() together and never doing a check for v8 vs v7.
> 
> The accessfn is also used for SMIDR_EL1, which is fine as this
> register is AArch64 only.
> 
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 24 +++++++-----------------
>   1 file changed, 7 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


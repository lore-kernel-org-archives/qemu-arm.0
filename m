Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E8CF8E486
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Apr 2026 23:12:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDVsf-0000CP-C3; Thu, 16 Apr 2026 19:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wDVsd-0000Bu-Pw
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 19:12:15 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wDVsb-0001oT-TT
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 19:12:15 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-82f37c09352so835746b3a.0
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 16:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776381132; x=1776985932; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/dvvYZNuIIL0udKkQ2r0/fW6xAgZnL6SZ1paVP1amiA=;
 b=xhKbLwV481pbq04jMKmog/gJGDL3QFm3q7q0jeFsnVeARzWxu8KFemGrFo8eMYNRYP
 P6IJ6s3yVkAqYW79pl0PsmWM9hayRaYTELWEdMpwpKZpCGZkVYC9sWlepFxog/i5baAA
 4upAoax1+qbt1A+5wOKpvizmQN3h9grsr1KzJW42+wIM+ooa8HeCoEA8KlHqt8SCdY3w
 hyVI8Hk2XtefIbJwAEAmcELm0qk+rit/TzqEU5/IJJ4kasoC2FX3HHDuKgMtoUeOPejl
 dG5Yg995NVmAfyaRG6tVwRGL1dCdN5mOjJGtFa9gfDtWFxN+roT4vboWVbx1WACjIS1M
 sAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776381132; x=1776985932;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/dvvYZNuIIL0udKkQ2r0/fW6xAgZnL6SZ1paVP1amiA=;
 b=m1Bs+dNWVqA6pca2i5lwJUCt5HUdq1ZnJPNSDMJBuPDTRlK3WjCpLDyEeN8fVtBPHp
 uoyndaOfYw+J/hs6l7TbhMxINfwhXRpJpMJOHeDmc0MAXdUAgFX1pcDvtQTgravghpxR
 2NZ1qi52mz7TuuwRWJEg40gFBHXjIp99CFRQ06GXCd2vylVZ2rqAnkVCl0DrcCYprjST
 ICEp9i997qYs48k2PvOrSK0j63Pv+lFsnIfIXCMMz8BCFHh4v3lshmXi90VKPJEhaQaY
 24GY1hkdt+Gk3aBr5GMP1LkK7clEc3KqT+qGnU3XQFWtxsFgpORKOT5lvqoiirdt+d4L
 V3dg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+1cuQ9+yMYf2ydb23H8m3TQCjYPAJXJOjRltbqAhdhhwjVONju6AOIp/RyiIw/TyGdR/UFyIEXuA==@nongnu.org
X-Gm-Message-State: AOJu0YyOUCTbCVtmJlVfX+1975byQ3y7ZctmqISwvbYk1IWKq7YKLbo8
 2f+c6lFmQqJRZYQABHEc8ssxADN6u6cnR0S19zCD5hPuioDsEfKRcp19er3CbTS1fug=
X-Gm-Gg: AeBDievTiDJpANypNVQE4GO2EqNme8GARcey1wO9xhzDNnIdODt2s3TyCU6SJbIclgJ
 dbnQ4KARpu4HaBLpmpwV57QB6Tg0nOZeubefFb7phEmJ/Hu8c2v5HowIIkBsUaYBJ/rTkfhCR41
 JxCOxZLy7cQNEiPXaM4jZGSLP6ZSEZorJ+eNd2HUil3ns1jJGMZbSi9Voil9Xj3t/9KprngBkt1
 ivD1KqxYvdpI3BgLPp2Y8W8rCiPuTQi/BjYmITKbBw2XSkciTG1jPW8ZLCAv5MfNurF/4OzROw9
 svb+/+FOFthv4EvWBvuCQlQpTqsw9N5UT4aVVNysjCJjrwBYoNBit9liap9/qTqvGZTcMQQGOOQ
 qkIrkcNOp3ZbUg0McGLOra09NKJ8lWC9BRpqmh+D1WmWFFBBI38U+/EMdHJHZGdYjbVnwG8Telc
 qLJXy4FDSi/tGLDuqYtZ5Hz4RFk51d8mFGwJ0pUjJCthXN2oKPT/IK6YvpsGsa
X-Received: by 2002:a05:6a21:6d9d:b0:395:acfc:b679 with SMTP id
 adf61e73a8af0-3a08ca743d5mr302050637.18.1776381132226; 
 Thu, 16 Apr 2026 16:12:12 -0700 (PDT)
Received: from [192.168.20.21] ([115.186.231.75])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c79581a3020sm5576844a12.20.2026.04.16.16.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 16:12:11 -0700 (PDT)
Message-ID: <8d640a27-01d1-4f74-bf6a-8acfd211ec89@linaro.org>
Date: Fri, 17 Apr 2026 09:12:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] target/arm: Clear AArch64 ID regs from
 ARMISARegisters if AArch64 disabled
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
References: <20260416165353.589569-1-peter.maydell@linaro.org>
 <20260416165353.589569-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260416165353.589569-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

On 4/17/26 02:53, Peter Maydell wrote:
> If we create a normally-AArch64 CPU and configure it with
> aarch64=off, this will by default leave all the AArch64 ID register
> values in its ARMISARegisters struct untouched.  That in turn means
> that tests of cpu_isar_feature(aa64_something, cpu) will return true.
> 
> Until now we have had a design policy that you shouldn't check an
> aa64_ feature unless you know that the CPU has AArch64; but this is
> quite fragile as it's easy to forget and only causes a problem in the
> corner case where AArch64 was turned off.  In particular, when we
> extend the ability to disable AArch64 from only KVM to also TCG there
> are many more aa64 feature check points which we would otherwise have
> to audit for whether they needed to be guarded with a check on
> ARM_FEATURE_AARCH64.
> 
> Instead, make the CPU realize function zero out all the 64-bit ID
> registers if a TCG CPU doesn't have AArch64; this will make aa64_
> feature tests generally return false.
> 
> We only do this for TCG because only TCG really needs it, and for
> KVM it might be confusing to have QEMU's idea of the ID registers
> be different from KVM's.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> v1->v2: limit scope of register clearing to TCG, as I suggested
> after posting and testing the v1 version:
>   https://patchew.org/QEMU/20251002101648.2455374-1- 
> peter.maydell@linaro.org/20251002101648.2455374-2-peter.maydell@linaro.org/
> ---
>   target/arm/cpu.c | 35 +++++++++++++++++++++++++++++++++++
>   target/arm/cpu.h |  3 ++-
>   2 files changed, 37 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7126CD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:26:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkeB-00048e-Nk; Wed, 20 May 2026 13:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkeA-00048J-ER
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:23:54 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPke8-0003Wz-QC
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:23:54 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-836ed29d1e5so2268244b3a.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297831; x=1779902631; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d8zEbFzN4GE9idsF7GuF8QKRv6nn7yIYDKh0297jS1o=;
 b=ZAqcQ5KyBq55VYC1GR61gnzY0dfck6UjUQssuaantW8ig6jLdRi9AIDZf1Ldm675Sh
 vnUO0tGOaih/mEEsgB0lkB5urHQK0bPYiKU9CJvc9Lp3bWhUHnsDPSxf9dfIKPHECwI5
 +u5HNbs7MjzP66hR2T0uUr2SpkNB4ZOXl8vO2kC2Z4/uvuV29OFe43akDCKxnb/mQLk3
 I7hzKDTOIh5/xIhm1/QWT4SurMfDJwPSCFbUvK40KKJm29fjiHLRasTRjXF1b8nfFvQ8
 IlYYhAEmUVSZNjnD/RSTmZtdQMHvc+Fewp5HXytrihsT8ppL8N2xi1y+dq5DPZcmQGjY
 fLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297831; x=1779902631;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d8zEbFzN4GE9idsF7GuF8QKRv6nn7yIYDKh0297jS1o=;
 b=QM1JXgZMtauKLuo9qZKP6adSaGSWcQuqiJ1D4imttYN5ZXciMd7maUq36oonU2WHhd
 W99Leg3utSMc1elfe5VRxgnbx0FRbNeEk2jje8xZvJEuG66CicwhGjpDx94ddMonqpBy
 IIVOQykYHxzb27iJE2czhIqVx/RCijBwbdKm2/9rGnxVrcq5BgWMhbzM/nyqOyZoKmN4
 AbOpM1pgv+ZzLfSZQRK8T44rhdUEaxAqJyPv441J/R1FmBfG/I8LU8YlRaZDx72S3meY
 hiwnQ6TSTbxG+e51YIEwkGumPaWhsAFWTlUzFxhbCrXiMsSSpkmFnHmM23eOOb0gxaS5
 qdKg==
X-Forwarded-Encrypted: i=1;
 AFNElJ85KkvEq4cf4lC49ua8FLzurr0wUKW6M2C4W5AFNbRS21o/oY1HC028PT2cRErv0WkJNpd0FE9fSw==@nongnu.org
X-Gm-Message-State: AOJu0YxfZ+8SgSDs4vyakmg0seDGgtBGeyl5v/idYb5XrH207NFi1vYw
 DB35pIhL4pqfjlxWpedolmbZB60EW2taPjxBO0kYNLiih0bDbnVgEZuWNOACfnaD4Cw=
X-Gm-Gg: Acq92OFBUelacM5p9O2GusrBJXZh5qtcfgkeUrilBTTCv0vdGhUBZ7fXOOdXzH+V2tG
 mEu0e/ZH/mrq/ZdHKMO0SZYU7B0BF9qVIUwPjzcW5XG3NnAdFyl4zjM7zmqqWfo4IXtVbB5ftGw
 chXtxkx83ybISI9D9gR/Js//1kno+GKSEm7VDpMBBpwwdmUu3AtL7U+sKFm/xHXKCg+Sr2anjAB
 Z7qofIu8M1u4jem9xslkSJBW1iSg0YVXEQ5rzpELrLRW8H37ekMe9r26E/gtpbdkchaD3QY8EXg
 4KMB6wk09ez36BQhsBPWsZoqS/EGs3upcEGeVDvmER3/33HtFfH9MqtIiwnG1QueIesT2+3Lgua
 SiA1cZa2fZ532Wleg4P1GaEX3VvqXvGMsiXePTO0XnlkzuOdjsR0MqqrypZXLG0NnPK/RLGL6ae
 Kpld+Q+0kjWi6lguV/3Hn+Ik1U+IpS4NZSGArlMYOECCPQd+4=
X-Received: by 2002:aa7:88d1:0:b0:835:6bdf:c87f with SMTP id
 d2e1a72fcca58-83f33c3353bmr23806083b3a.9.1779297831108; 
 Wed, 20 May 2026 10:23:51 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f8b9c2ea5sm8006074b3a.13.2026.05.20.10.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 10:23:46 -0700 (PDT)
Message-ID: <c9f4dcce-388c-4d36-9d8a-1fbad9cb933e@linaro.org>
Date: Wed, 20 May 2026 10:23:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 45/63] target/arm: Implement FMLALB, FMLALT for AdvSIMD
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-46-richard.henderson@linaro.org>
 <CAFEAcA_Qr+D+qrTd7q0s8Ka0YF5NVM01dDMHm3irQDxiZW0n6g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_Qr+D+qrTd7q0s8Ka0YF5NVM01dDMHm3irQDxiZW0n6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 5/20/26 09:33, Peter Maydell wrote:
> This use of float_round_nearest_even_max prompted me to look at
> the uses of it in fpu/, and it looks like the implementation is
> incomplete. Most importantly, although commit 72330260cdb420 added
> it to the first "switch (s->float_rounding_mode)" in uncanon_normal,
> it missed adding it to the one later in the same function, which
> I think means we will generate wrongly-rounded answers for
> denormals. A fix is probably:
> 
> diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
> index efd130bf16..6cc9429ebe 100644
> --- a/fpu/softfloat-parts.c.inc
> +++ b/fpu/softfloat-parts.c.inc
> @@ -450,6 +450,7 @@ static void partsN(uncanon_normal)(FloatPartsN *p,
> float_status *s,
>               /* Need to recompute round-to-even/round-to-odd. */
>               switch (s->float_rounding_mode) {
>               case float_round_nearest_even:
> +            case float_round_nearest_even_max:
>                   if (N > 64 && frac_lsb == 0) {
>                       inc = ((p->frac_hi & 1) ||
>                              (p->frac_lo & round_mask) != frac_lsbm1

Thanks.

> 
> There are also other places within fpu/ which switch on the
> rounding mode and have no support for the new even_nearest_max
> enum value. Those ones have a default case that asserts or
> aborts, so at least you'll know it if you run into them.
> They are round_to_int_normal, and roundAndPackFloatx80.
> Is it worth extending the support for this rounding mode to
> either of those?

Probably should, since it's trivial, and then we wouldn't have to think about it.

I wish there were an annotation for default: that doesn't suppress the 
switch-missed-enumerator warning, for use with g_assert_not_reached().


r~


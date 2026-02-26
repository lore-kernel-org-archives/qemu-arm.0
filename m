Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5A2FC5927
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 10:34:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvYgh-0005ha-8g; Thu, 26 Feb 2026 05:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvYge-0005h3-AG
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 05:33:40 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvYgc-00067t-13
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 05:33:39 -0500
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-65f71ed7c6cso1342758a12.0
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 02:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772102016; x=1772706816; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a50vn565+HHWHNtpAnMWwLQRnfJLyrNr/JVZBxH2Ee8=;
 b=wpjngdsnI7xmHLjJjwvKij9nIp9/phQJVYkcJ+kTJTAKpv2qPEhr2qsTIkpBBI/eJd
 Mb1P5rQeRe9491JJfx8HIUHxd7a31+/RhpZt8L2j96kOGPT3Y03KjpMpKziXathEdPmC
 JQEHaP2idmY5AF0+HJMrceQ3M+i9IkF2B2ZXqBzr6GRI7cR2h4efLGKGux1UOumelvYD
 aHkl/w2+RbA7KCpRLdnnc/gfw9ITkljo2iQ+eUiTsOAWfdjOCvYjNzWLy7YXwNCk8HMX
 s4x4WpxE1xM+hh4hT/iAApJWKGe7Z9x6UsWQLJvzxeATTtQspJv+iQ8ka5u3zDW/wF/m
 QqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772102016; x=1772706816;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a50vn565+HHWHNtpAnMWwLQRnfJLyrNr/JVZBxH2Ee8=;
 b=WD5+YWLnz+XXsHaUGepMKAJTerC7Iu1hfurR0gM85Kmj/QYFLDsGzaNPC7K8eAheyj
 2qJbJ5ldb5pkALDodF9s9yC8192sGMEnPgAglNunMoz+SjKwG/WIxV1ttDatqAmN0ZDj
 BoHzyTS1K/638VL1rsVSoEKoj6hGU2yCZNE1LVCvn7w3gZcxQSaVxy/jokVFlZ/RFqaB
 V9tv0ap/t4AcHaTZ9YiBZIyAcjdCSIclkwJ9Lpl58P1Gjoep2eLiMYKbu2xLyBR3i8a6
 JtG0jdF8sYmvRRPYjXNO9GFys+ibyHZRodvk12lJ5ySvqfhnTy0ITlCA0Os4vUG+L5PJ
 iwqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoy+QhVLMdrCtp8c+Y/wxXz7oAM7+hcSMbFlG+Lt9Q3Z4wQoGupXPlCzf8Sg8+YqB3irw8JlXFNg==@nongnu.org
X-Gm-Message-State: AOJu0YyflzzG431lX1pvydxh7hBWa4BsSvu0NjvjR51ZcnJJr2TbGMo7
 YjF3aH1fpMNMf9onyNhNelWgLj8SlhlAJGTLZ7x0d5ugzvujh4MYATIaR7wUBzro9p/8ZZe42XD
 wKVZuFH8=
X-Gm-Gg: ATEYQzxkLjWKgzV+ABQvHDpFSKEfpAkGvfGccSrHqX0CYmdSy00BIOZNDfOwGsP8IWh
 zyb7WT2UWwYZUQmE8tHTALAyPdqJDfPZOnQjl8uZcYyfJkB1QtUw1fB+3i76ro4qsQNH1nNaXst
 ltRvs4wPKbKrvyfxsycRkO1ZejHh5Awh9Gcj3WaY+Tfl7FO4xDWTQ3BnPnrvknJnnM0+41iu1Ng
 Du5FtaW+dxwW4qAqkMbgV/vQzF35WrAyOsoiuKdYPACDIVbpd4uAM0YO4uncftWCa3RGrrBZc8M
 fntQLnC3E1/9XQylWrYKqsiPn331EWgq7jFRzo0tEMAYaLwSaMOsCf3XjilZjSIf/7p6UZvU0Ev
 7CDs7M7Imluw9v8fivtd0+4SAU4WfhjSHEVq0lqx1TXV8YSza0kQdkciaWnM1jH//CpQHrj4YE4
 vVg69cF3jPp7mW/MLA4HEMUvDKgkh8tOua0A==
X-Received: by 2002:a05:6402:1446:b0:659:3d99:4bf4 with SMTP id
 4fb4d7f45d1cf-65fa476ebefmr2361406a12.4.1772102014612; 
 Thu, 26 Feb 2026 02:33:34 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65fac07c09fsm352199a12.32.2026.02.26.02.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 02:33:33 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 464F05F7C6;
 Thu, 26 Feb 2026 10:33:32 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH 3/4] target/arm: pass rd directly to wfit helper
In-Reply-To: <CAFEAcA8km4H10ZseUd=D6KWTpHQptUaL0D3dSrg3-LGWY1bcgg@mail.gmail.com>
 (Peter Maydell's message of "Thu, 26 Feb 2026 10:29:24 +0000")
References: <20260224154347.344219-1-alex.bennee@linaro.org>
 <20260224154347.344219-4-alex.bennee@linaro.org>
 <CAFEAcA8km4H10ZseUd=D6KWTpHQptUaL0D3dSrg3-LGWY1bcgg@mail.gmail.com>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Thu, 26 Feb 2026 10:33:32 +0000
Message-ID: <87qzq7ztdv.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x541.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 24 Feb 2026 at 15:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> If we generate an exception for WFIT we could also fill out the rv/rn
>> fields of the ISS. To facilitate this pass the register number
>> directly and read the timeout value in the helper itself.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  target/arm/tcg/helper-defs.h   | 2 +-
>>  target/arm/tcg/op_helper.c     | 4 +++-
>>  target/arm/tcg/translate-a64.c | 2 +-
>>  3 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
>> index 5a10a9fba3b..a9a062cf777 100644
>> --- a/target/arm/tcg/helper-defs.h
>> +++ b/target/arm/tcg/helper-defs.h
>> @@ -55,7 +55,7 @@ DEF_HELPER_2(exception_pc_alignment, noreturn, env, va=
ddr)
>>  DEF_HELPER_1(setend, void, env)
>>  DEF_HELPER_2(wfi, void, env, i32)
>>  DEF_HELPER_1(wfe, void, env)
>> -DEF_HELPER_2(wfit, void, env, i64)
>> +DEF_HELPER_FLAGS_2(wfit, TCG_CALL_NO_WG, void, env, i32)
>
> Why the change to NO_WG ? The code change doesn't remove any
> writes to globals...

I thought that was the right way round - it doesn't write to any
globals, but it does read so the helper needs to ensure globals are
synced before the callback.

>
>>  DEF_HELPER_1(yield, void, env)
>>  DEF_HELPER_1(pre_hvc, void, env)
>>  DEF_HELPER_2(pre_smc, void, env, i32)
>> diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
>> index aa14f15eb62..28a1c7243ad 100644
>> --- a/target/arm/tcg/op_helper.c
>> +++ b/target/arm/tcg/op_helper.c
>> @@ -409,7 +409,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
>>  #endif
>>  }
>>
>> -void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
>> +void HELPER(wfit)(CPUARMState *env, uint32_t rd)
>>  {
>>  #ifdef CONFIG_USER_ONLY
>>      /*
>> @@ -428,6 +428,8 @@ void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
>>      int target_el =3D check_wfx_trap(env, false, &excp);
>>      /* The WFIT should time out when CNTVCT_EL0 >=3D the specified valu=
e. */
>>      uint64_t cntval =3D gt_get_countervalue(env);
>> +    uint64_t timeout =3D env->xregs[rd];
>> +
>>      /*
>>       * We want the value that we would get if we read CNTVCT_EL0 from
>>       * the current exception level, so the direct_access offset, not
>> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a=
64.c
>> index 5d261a5e32b..073454b9195 100644
>> --- a/target/arm/tcg/translate-a64.c
>> +++ b/target/arm/tcg/translate-a64.c
>> @@ -2064,7 +2064,7 @@ static bool trans_WFIT(DisasContext *s, arg_WFIT *=
a)
>>      }
>>
>>      gen_a64_update_pc(s, 4);
>> -    gen_helper_wfit(tcg_env, cpu_reg(s, a->rd));
>> +    gen_helper_wfit(tcg_env, tcg_constant_i32(a->rd));
>>      /* Go back to the main loop to check for interrupts */
>>      s->base.is_jmp =3D DISAS_EXIT;
>>      return true;
>
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> You might squash this in to patch 4 if you like.
>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


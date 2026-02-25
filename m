Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3062AFCEE86
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 11:23:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvCye-0003Rn-F7; Wed, 25 Feb 2026 06:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvCyc-0003RS-B5
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 06:22:46 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvCya-0004sS-Nc
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 06:22:46 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b884a84e622so1018875366b.1
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 03:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772018562; x=1772623362; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WyRzuQqlfJGLtLUpa2ZW73Zsgxxmf5qHJt2LMRdBEJI=;
 b=U2gF2bBBgmhHLZnO1LIdEkv7cMfXbvf1vdv/TE2XAyIgS2ONt4rpcjPex5DtRvp2aM
 YVF8ojeyrh+vYaSsZix5YO6WCiUV7r5oU4SnhGMQtNZuP2CRKogYQaDrPu2sHoWSv+lP
 4pOe6YklF59PzpA0KPWkWpKqRWCWNCYgak/lbxTsj3aaByLxsF7BGzBqNFkGA1vdHKNg
 25+Vpd00pGbdGf7gCjMxW7nto6nUquhnel0N1OW0lDjiE9RnvnfTbPB/zbqLMmSw8ET+
 keGZXpwspIVxbteQmbBgzNa1lRzv+ZjEyQnUUm+ZrK7DwhnVAoSouydep1/l1eLdRGrF
 MKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772018562; x=1772623362;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WyRzuQqlfJGLtLUpa2ZW73Zsgxxmf5qHJt2LMRdBEJI=;
 b=mMnbjQKKzoKLKTHKHDvhQmEayV0vGfD75JI8Fx1zi/HYVuoD8fj5mZi79vCCLH92h3
 98W/klTxLLU8MrSi3xl0+52KNJWTddAa96jRyU9DRMqcYrE1OEqWU2kIpd4oN5kgTSq6
 53i+b7reyFuXjjN94bt8sVSFWlZ4sKht0eWHcj8w9leYTYdi3/dtC+r1yTsoDvaT3vQi
 f1g6tCxG5x+Cvwm8XQMKMvKCeq/F4jVOAMKIt622fASXRNE/qjVng0LtReZZfaikpIgZ
 Kxzf1CHl/lsdgeGo0FvvdmNqWRl+lZdtJ9Od//CjQqxKDsW+Z5UEHvRMKk9Bvpef2r+x
 iAyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvckluHaM3DTUPuQYfAvHLnnskTghxsiAUOdIZ7cI6K86FJEu/O8eo6ctRUZgld9WvdlrFJfhOuw==@nongnu.org
X-Gm-Message-State: AOJu0YycDxtjkmlC1cMAENQfMF7Ma7oSihbE255a+8KI3q8UoLeW57ZF
 E5zU2OCterwkGWbM5yjCbJxCAXlnOcAzbEYPnR4xazs3smatG8OxVf7pXDmSD8lOolA=
X-Gm-Gg: ATEYQzzKK5XaXkVt4nXpwAECDv+nH3XFuCBoJRDaV7T0xO8nOraWKK4llIeB0xI/HkH
 +JEh143nZH2N0iKAnvOOTgLKSpfSsOoCl47K3vOIlyA9MoUaTajdm+rVDq7+7VoVo61wVRDTlaQ
 hvDzibgDrOd7GEB75+1KMhyqdb9eXuilTPbBp0Rbo8SZQV8FmlvdqO67q65SbDmsWuRDLNk6GdP
 VXEdpA5v6ppZSRGehOEiraTSZUcivzETHfPHPDGRbVKawiYk34qB4gwjm9F28BzDyTzi6gWj3q3
 0tAxwfhgfZqdIE5J0dyOsReVnG7v2BHS9xnZgF5WsB3gT7EuRRGF/y+/vLIa+VlaHc3cnlU0i7U
 s4r+LPsTcVAJuinzneSVBAuTrpBI6GYciw22bmqCTekCaGNZKZo+6+V1ZHMlhMph9YOzRZCqVQh
 snzDPe/J1S08GhpiUEhsaazJuD4+s5uTx6Pg==
X-Received: by 2002:a17:906:af9a:b0:b8f:a174:3186 with SMTP id
 a640c23a62f3a-b9081c17ea7mr889326366b.57.1772018562249; 
 Wed, 25 Feb 2026 03:22:42 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b931f81b914sm138892066b.7.2026.02.25.03.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 03:22:41 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A1C545F834;
 Wed, 25 Feb 2026 11:22:40 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH 5/8] target/arm: extend WFX support for A-profile
In-Reply-To: <CAFEAcA--YmCZ2+BBy1kM_VjeER4vbX8VMBbSA1aqUQ9-jWp5tQ@mail.gmail.com>
 (Peter Maydell's message of "Tue, 24 Feb 2026 12:26:41 +0000")
References: <20260224121014.279248-1-alex.bennee@linaro.org>
 <20260224121014.279248-6-alex.bennee@linaro.org>
 <CAFEAcA--YmCZ2+BBy1kM_VjeER4vbX8VMBbSA1aqUQ9-jWp5tQ@mail.gmail.com>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Wed, 25 Feb 2026 11:22:40 +0000
Message-ID: <87pl5t130f.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 24 Feb 2026 at 12:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> This commit extends support for WFI, WFE, WFIT, and WFET instructions
>> for A-profile ARM CPUs, ensuring proper architectural semantics and
>> full ISS (Instruction Specific Syndrome) field support for traps.
>>
>> Key changes:
>> - Update `syn_wfx` in `target/arm/syndrome.h` to include `RN` (register
>>   number) and `RV` (register valid) fields using `registerfields.h`
>>   macros.
>> - Refactor `HELPER(wfi)` and `HELPER(wfit)` to use correct AArch64
>>   syndrome values (CV=3D0, COND=3D0xf).
>> - Implement `HELPER(wfet)` and update `trans_WFET` to support the new
>>   Wait For Event with Timeout instruction.
>> - Update `HELPER(wfe)` to implement proper A-profile semantics,
>>   including trap checks and event register handling.
>> - Extend `event_register` handling to all ARM CPUs (not just M-profile)
>>   by updating `HELPER(sev)` and `arm_cpu_has_work`.
>> - Declare WFxT helpers as `TCG_CALL_NO_WG` as they can raise
>>   exceptions.
>
> Yeah, no. This all needs to be split out to be anything
> close to reviewable. In particular "report the right
> syndrome info", "make WFE/SEV not NOPs on A profile like
> they are on M-profile" and "do better with WFET" are all
> separate things.

Yeah it was surprising it didn't follow its own plan which did have a
nice breakdown of patches. When I do my human spin I'll make sure it is
split up better.=20

> Also, this doesn't change any of the places that it needs to
> change to implement the places that architecturally set the
> event register (see R_XRZRK in the Arm ARM),

I was having trouble finding that but searching for just XRZRK finds the
subscript text:

  The Event Register for a PE is set by any of the following:
    - A Send Event instruction, SEV, executed by any PE in the system.
    - A Send Event Local instruction, SEVL, executed by the PE
    - An exception return.

These seem easy enough

    - The clearing of the global monitor for the PE

Is this the LSTREX monitor?

  - An event from a Generic Timer event stream, see Event streams.

So this looks like sub-timer events that trigger events but aren't timer
expiry events? I shall have a look to see if the kernel uses this.

  - An event sent by some IMPLEMENTATION DEFINED mechanism.

I assume we don't need to care about IMPDEF cases for our current CPU model=
s?

> so it will
> break code that uses WFE. Notably for A-profile this includes
> generic timer "event streams", which we currently don't implement
> at all.
>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


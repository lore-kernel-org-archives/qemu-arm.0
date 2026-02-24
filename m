Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C414E9B25B
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 12:27:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vurVD-0003zq-1R; Tue, 24 Feb 2026 07:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vurVA-0003z1-T6
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 07:26:56 -0500
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vurV8-0000jo-1g
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 07:26:56 -0500
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-64acd19e1dfso4574599d50.0
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 04:26:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771936013; cv=none;
 d=google.com; s=arc-20240605;
 b=C4YB/KH+FJfwEfUbaFNEh7q3e8DT5/RVjWaoGyihROpAgsHtWQRm/BA2tqaBJuoDO8
 pmogiIWok5kKTk/nst5/W80M3CqQtLLzsN55z5RruYF+XRaEr7aODA85iHkzFaXetwUR
 wiLoj0RPfR0f6wPcxJ9qp1hYWwKqhu5H2wDc3hO7U8vAgP2ykds0+gW4oPWVxKwDt9So
 H7MuMOLiiWyxKAnLu3OfrQyO0OQob0qjTvAJW1KeXWVXhlIJZr3gcggbnqf0GGhcfciy
 piHid0memdSnzcdZ+eNElTK+FVYB5NqgfVLMh/CkA8HSdrTSLYBhMGtHsTE/dlBr3igk
 e7mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vvoWfGKVGQm9ko9EEIC0W9a0OGkgQTcvXEztcIldwGs=;
 fh=bjo26QaatubEJOABd4/9DEudrElXjqsLLC0/8cAyoSA=;
 b=idraZBlFjpx7FbLfmNHfIfbqpw2exSVlF1F41GuGg/fIE91CTmJ7N6WZ+Pzxh0tBGY
 Vcpw6NoR+Y+EObCQuHPT2Bc+4IifriUd97UmUTOxYsVjMgFYyOJhk8wLvtnXoykLlyfZ
 LYpdeEmYNa+7B9L71kqplHJQBcjBJG1FNXM0/8rfX52C8NaAzbsyv5ShqeWBWr8uZypi
 F2WneipRrOq2nKR4NWqcHKZDnVJhi/+lQ862dSzwEMkJGtQ+wsqlki/HZ3Sxt5ufNVWw
 hv6PJh4+aXmridi74Lgxk8BEyjNryC2evzzCJ5EnEf/rovmmz4Z2S+MAt+wsYWdQFLkU
 zsEw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771936013; x=1772540813; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vvoWfGKVGQm9ko9EEIC0W9a0OGkgQTcvXEztcIldwGs=;
 b=npLAgqE7Peyl3zsXr4kjEA84I8B3ZDBbVBRh0eshebty2/NhJketiEHvlF/JX6/ey1
 HGOeO5dgyvzWgsseH2twdWH8o9X6Yu71xAVZO+8aWg070uJwyvZMpEGjbvLN6Rz147wM
 0uwf9q6kgsyXnA5gHIKH7WdjNX1iPZNaZyDmWfRmfGXbfQrAOnI4tvGGvua1p/gXCdl2
 xoEWmo15G02flNED5Nnu77C9XmWaCmoT6tp3AINxXODIRGtGiHSBmveLnGR+OxLjqDNr
 wdwYu4KBnR333yTiyKD0w/u08sXKdhcf2tTgMScjYJfYpezN4mZdUejCnWQFqD3PRLq4
 YoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771936013; x=1772540813;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vvoWfGKVGQm9ko9EEIC0W9a0OGkgQTcvXEztcIldwGs=;
 b=DgEdSlPk0QvK4pXtaAjb7XrIvrvS3gu4H4sBFDuBH7pVhj/CSOw5HiHEZW+aZvwZtC
 s/nTy6X7DA+7jwUgRQZ/Bc3azUuXvhXQj0G0F299IPmiKt9uiQwirf6AGN8f2L4R1xD7
 flcdHAYjSd6gvuOLBxu71CYoICckRJN2AKzR60H9WCr8/jXwo0cnAwIEDjtABIWYTFo/
 la1xEU6/VGdDm4oZ0CFniRhYXRAQ5ijzAdjDADlGvp7I0gijZ85LZ7ihQYJec1GMJf1h
 3d0mq+OvFENR9anyiGp5MkQOlYJR9eMwvtHoPMUCT2fE4CRBnoKRH2pdSUPxYbQ5kJK9
 L1Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiy1pc4ivxN1KWLm9EL4Tj5lOxKjsgQTzP1fFL17QDbhSWlP9KBYl3MbrqwCoJDTrqY+NsfIEPyg==@nongnu.org
X-Gm-Message-State: AOJu0YxkhorCQzxiZmerJFEL8tiz3CnR0a4enetcMAYt6sDMX9MfWrvK
 aB/gGOwiFwh6OXqB/1kcHLxfrrCDCCOBTxxhnBkbobMPUQo4fiq7sCWnrSdS8QKoxEB0LstYdh3
 sEF5NdO4gn8N4GOB8jYVyjHskWqoObUVffKNvJZI2Fg==
X-Gm-Gg: ATEYQzygKHc8TELCXXTyW0dwSUVpIE+qLjGXaj4u+kktXFns1krJa4Dfafkm92KF2uA
 gYvJnceq6JwTJIRJI28gagwvbegThKI4A/D56vVxCkNQuesI6gKDrEYDH4P0kjFB+E7lwWsDvOp
 W0rm1DRfvBOi/vHm8O5QLkhk4jcxystMll7kLIv4yTX8vYOTC6wml7nb2Dc7GrYZIKm1QAPymU3
 pur3OC3svklK4iIkcXuCoGGPdez+r3ira6uVqn881Zslvn90ZQLFVMEpE2XLqlimP9vdDa0J/bg
 45k+BVLtwUZQno5OhfC26EFVjQ/IXcScha8+eloFFx9COSR18S07Mf3ip9PTn8SSj3Ykf+EOT1i
 U/Q==
X-Received: by 2002:a05:690e:134b:b0:64a:d716:c8b5 with SMTP id
 956f58d0204a3-64c787d5303mr9314935d50.18.1771936012612; Tue, 24 Feb 2026
 04:26:52 -0800 (PST)
MIME-Version: 1.0
References: <20260224121014.279248-1-alex.bennee@linaro.org>
 <20260224121014.279248-6-alex.bennee@linaro.org>
In-Reply-To: <20260224121014.279248-6-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Feb 2026 12:26:41 +0000
X-Gm-Features: AaiRm533j8zDX2_W69viuybZop_pjQHvzltY8QSUE_Gekc6F8p7hu_LMlDKkSOM
Message-ID: <CAFEAcA--YmCZ2+BBy1kM_VjeER4vbX8VMBbSA1aqUQ9-jWp5tQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] target/arm: extend WFX support for A-profile
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, eca <noreply@eca.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Tue, 24 Feb 2026 at 12:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This commit extends support for WFI, WFE, WFIT, and WFET instructions
> for A-profile ARM CPUs, ensuring proper architectural semantics and
> full ISS (Instruction Specific Syndrome) field support for traps.
>
> Key changes:
> - Update `syn_wfx` in `target/arm/syndrome.h` to include `RN` (register
>   number) and `RV` (register valid) fields using `registerfields.h`
>   macros.
> - Refactor `HELPER(wfi)` and `HELPER(wfit)` to use correct AArch64
>   syndrome values (CV=3D0, COND=3D0xf).
> - Implement `HELPER(wfet)` and update `trans_WFET` to support the new
>   Wait For Event with Timeout instruction.
> - Update `HELPER(wfe)` to implement proper A-profile semantics,
>   including trap checks and event register handling.
> - Extend `event_register` handling to all ARM CPUs (not just M-profile)
>   by updating `HELPER(sev)` and `arm_cpu_has_work`.
> - Declare WFxT helpers as `TCG_CALL_NO_WG` as they can raise
>   exceptions.

Yeah, no. This all needs to be split out to be anything
close to reviewable. In particular "report the right
syndrome info", "make WFE/SEV not NOPs on A profile like
they are on M-profile" and "do better with WFET" are all
separate things.

Also, this doesn't change any of the places that it needs to
change to implement the places that architecturally set the
event register (see R_XRZRK in the Arm ARM), so it will
break code that uses WFE. Notably for A-profile this includes
generic timer "event streams", which we currently don't implement
at all.

thanks
-- PMM


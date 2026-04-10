Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91B8E99056
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 08:48:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wB7Ws-0002pg-Ib; Fri, 10 Apr 2026 04:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wB7Wp-0002mu-EW
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 04:47:51 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wB7Wn-0000nc-St
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 04:47:51 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-7a4f9cf2b4eso14951457b3.3
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 01:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775810868; cv=none;
 d=google.com; s=arc-20240605;
 b=H8eOdlkHw9VOZquvEuosXbyvti1/VXv4YkTrVOHpCdN0JrRbCA55raP/WOvIXEZ5Vi
 mytYrSGrUskfqBvMVHquVBGt7VQ9O5pL6Kp0LQR8+LeZs/dP2+zxhtljsv0SSpmrGy6i
 /ornpEjRQgc2WeQuRdspSDcfdhjwm2YGYdo/bjH5yGF+rts9VvN/eBSB4yC5zjaY7ZGP
 X89hggm2SFX64IoI4Q13D/9qUItksHKXVQOJBkKqcZCwoUN/bgPPNz8I/pW5AW9yypTM
 cZiH9qUFsG7CX+JiQjCRptu90fnNWvNzaHGooj/3Jg7X4DlWHZOCdWHTfSNKJAZz4C70
 2xCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BhjrxvBGZe8DQIDMBzkcOYYo4DWG36jOiMgcpKt8AK8=;
 fh=WLOmnip/rizvcWN7CZ65CZXiCIqb4Ki+KecAEbPtJIc=;
 b=NX2Du0RAxfKxLuQZ++6nPZUJHvWA+Y/X/8wFAVnyVbZ8oIi7238IQ5sYZViL5oK9DT
 VBrlZ4tD8gdH3LuTCD3qFAjDAe1LpgfMsu0ocS4oiTVMv1c+kzr3hK/FtCqDqr2S4I5i
 7s9N+28U8Rm5JeaRiWT6mib1Q9FbY6HGclmBWiHQAC1tC1F8VdrABJXjye+eT3YSOnLG
 O3vq96yvjGpMCR4+oH7Ay8lRF0sEIeLUj+psH6Ql4YRbAFwfZIYp1DtZGSL6NFuS98Ak
 Qiipv7VxVh9kL4vcOr5mHxahwXUNSgwNqhkgznj3R+8waEd+86hyMHe17rzP1JDkbJRs
 MQnw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775810868; x=1776415668; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BhjrxvBGZe8DQIDMBzkcOYYo4DWG36jOiMgcpKt8AK8=;
 b=MpsBVFcWYzSgJiyLnJW5MC+d27QnB2KahdvW9l6K73+ajZAXyzdyoOiJgWjV5IaQIq
 dx02GhoYqOhfZqRZbyk1HXKxM9bmttzRRoQFxv16CTvlhw52JJZPpMlhROsYNWczuLRw
 JnhVL+LCiz6txV5jf9H/7YqueoWlhL8XNZqluTPiR0jXgKj02kJ+gPWEOeVd5gqp+CuH
 NR3I5bo8hIJ6G4nIqzZlkJqILFFCLDG4jv8/BKWwJZ2wxz04WNGaVIh1NkZhG4ORixqZ
 GFWU8oaK24Ix6h4rd007V9yPYx4OrhrGh77gHn3a53PgXDJS+RpU2o7vP7Gyrm+qLpUh
 /ukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775810868; x=1776415668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BhjrxvBGZe8DQIDMBzkcOYYo4DWG36jOiMgcpKt8AK8=;
 b=mOQ07LyhyWN2y8AAxJ5ADYO9BkC12PYGEGBrrYccv5ALSdub2WCl+qppIvdaQZX5+E
 vthx3adS5BanZoKwTftVfPbrsgmEAIlpmuF1rOSUzYGQAPQzgoyJPxX6It42pMxTCBV5
 1//y2uz4fsPn8iqEnEbyur4867cU2/0tdr5yXX2yE22JU+obqZf1DgeLG7cVQf/bnZmt
 4N63ejALtdjiPArjWhj4bCDuN5V/TlRqzY3kp/WW/PA8F3Ov7hSSLjiJXppTq/ci6x/5
 AgTFV+naIbSKgvfHtbUcokwzLHeBceD9kN+j2KQ3gHSU+FmCWR3Az40qbNpt3paEJx5b
 2UTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXANZ9hRDmtRGWfVJWGCtJ72roX2VQ3RCiG4pKfDeDj3gB08S6nVHeV57eQi4KJFcKPqw0jsx2JCA==@nongnu.org
X-Gm-Message-State: AOJu0Yx9B1geE3b376DenYszT4J1hU8qQyn4cyNeKX9rNkWTfdSshkrW
 xNl3o+VFi8p3msyPYx0n/9fSp9k1OgsPot4e1efzxDOPV66z1NJ2tib/icZkrc/UHg94+snPV5M
 BJ4RUlfolYURVmcLCBAs4fBlrVicqyW4l9ttu8aEoZA==
X-Gm-Gg: AeBDieuY5lM1HkheyL4c1Cgh31+rW7rtClj81pPyXYHWpVaEup/lEmAa5Pv7EcYA1FC
 n6pH22sikAtGB/S5eYMLrR00WvI48Y1S7CtOkpb+O365Gbj/dxd7Wa7P+zfhnbpa3x61fA91+JQ
 ucolixFI9nlX2zRUTeNKE/CLvSIF/L/JNeIzFYJdCDtSAZJhIRO8NdGlpVkRuEpuFXZJyhMsIK2
 oWkvEyUDJ4SbDi44ROYuklJNUKXmlIi+06HY6N/Jn+U58gcdSHKgPgwDOvKLwtCTeRVKE9jq/AW
 PBQtw7styCr0x425FcynTHUlBmk2lXIveOL10F8/6vt2Nb8onGRQUGAO7yGtVpR5fdo=
X-Received: by 2002:a05:690c:6710:b0:798:78fd:fed8 with SMTP id
 00721157ae682-7af71087669mr24478797b3.33.1775810867695; Fri, 10 Apr 2026
 01:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
 <20260320130607.2071996-25-alex.bennee@linaro.org>
In-Reply-To: <20260320130607.2071996-25-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Apr 2026 09:47:36 +0100
X-Gm-Features: AQROBzDCzp5PsRFPUykgKuJP4fPvHYOFIzKsMC0Zt7Ar8jPmCyFNwNgMSLFk2V4
Message-ID: <CAFEAcA83X2v6iTQO-r-xp-sRku+KNQb56QhLtvgiCMpOxqFCyw@mail.gmail.com>
Subject: Re: [RFC PATCH 24/35] target/arm: remove event_register check from
 arm_cpu_has_work
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Fri, 20 Mar 2026 at 13:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The generation of events are not indications of work to be done and
> importantly for the case of WFI instructions not a reason to wake up.
> Remove the check.

But an event *is* a reason for WFE to wake up, which is why this
check is here. In particular, the thing that tells accel/tcg
that the CPU should come out of halt (via cpu_handle_halt())
is whether cpu_exec_halt / cpu_has_work returns true. If we
don't check the event register here then another CPU setting
the event register won't cause this one to come out of WFE.

If we want to have WFE and WFI wakeup events to be separated
such that only WFE wakeup events resume a WFE and only
WFI wakeup events resume a WFI then we need to do something
more clever here, so that we track whether we're halted for
WFI, WFE, PSCI-power-off or whatever and our has_work function
can check the right condition. (Side question: are the only
cases where our arm CPUs halt WFE, WFI, power-off, or are
there any others I forgot about?)

Incidentally, looking at the code above it will need fixing
for A-profile anyway, because a CPU in PSCI-power-off should
not be woken up by a WFE event. We get away with doing the
WFE event register check first because M-profile doesn't use
the PSCI powerdown stuff.

thanks
-- PMM


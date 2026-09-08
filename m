Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B603C79F82
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Sep 2026 15:51:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3y6b-0000GC-69; Tue, 08 Sep 2026 11:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3y6Z-0000Fm-M3
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 11:51:27 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3y6X-00085B-Eb
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 11:51:27 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-855a66e5b5dso38001997b3.0
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2026 08:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788882684; cv=none;
 d=google.com; s=arc-20260327;
 b=JVqjZ/JFlqoJD/S8NcqIuaJA+bkXzzivwSFJ6Di7DNtlofVvVjYOLomyqzMCBZG1QP
 0oO0b/DQ+Og8fkl6sb53IiVSDQAdcGowWQZrqYdzAaNNaGr5uoCWoIRAfrYVZKz6ats8
 pANuoW/AH+ForWv/vkyKJJ4q0SY1AIQgtgMjkglhvkQydlYcpJ70NopjeiIRLv/rMdtD
 C3/hz6+o61TEt2YwhGeNyOUK9qrmvbcBZQnkE1+t3Lp15nlsv3uyJHLgc7BP3vY6QccY
 FM4OTJYay1Fry3nhWT51sE7SQZgZ0ezgnU44eL/5EN2aRuU5naf93HcWKcHGHNBYPRbA
 iptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=iMSUhya9L1kjCNqSNxSRyD9vraXGuJKfOwQ38jodovE=;
 fh=yz0wyUK8HRzmO4lb+/KCnat01pPLURToAQO0zskTYoI=;
 b=eYWtjPsLOF9IdfdK62mpZ3aX48684rzC0+AsYuRhPMooqTCt29nmTh4N9LrUSVOtDh
 ikGHaT6SSsRbFAycBOpcTq+uw6kXZ26/SkDO9fTimvpBZigoDKePemGGumaQMcQnwt1z
 jHZFbiVvDyV+XW3SwEAPPpseHb+BMKOThxCdUuKZqAjxnSiZYdXZwbw65C6i+JbPe3Tq
 9MZ7Z08XFckaPcYi3o25aHfXk/qEiw529tDDlBNBA0UgzGMG4/vdcxUuQ3Rfvhm9Df/U
 c04nah+Y2u3g2vWbJb63dtHjP+pNRM17KA6bHKpEEdgcD8LEWPm7aixahmqrxZekYNiR
 PEWw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788882684; x=1789487484; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iMSUhya9L1kjCNqSNxSRyD9vraXGuJKfOwQ38jodovE=;
 b=JUE0rfYtyzC95QBZ3xz1rSWrVVxeTCcS9ija/ClsxX1IkPZ0oiquh4hIyDNrcdW9Jl
 LUMa+ns0yha8xu9EFb2Vr05oJ/r5aiyggMpy/nsxMah70aQSTsYxGPrUyLuLI6WfBl60
 fcnMkej34to6AFVCszh4CiBgj723WGXsPI7swp/spgmFD2Jw/qKmaAD3GQzb5V9me8mP
 Wor/QomdmLq5ldK226KwUEuDLkKRq5MR94vP2NV5rlJvAaBAHhOZKdjvLrtv71lMYeHC
 SLRQeb/mfUswgobacqqWcBSUHYnTu+uglembaOXD7Y2eReWR+4e8BqirsvLKxcG29/4N
 Fc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788882684; x=1789487484;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iMSUhya9L1kjCNqSNxSRyD9vraXGuJKfOwQ38jodovE=;
 b=kNEx5Qj5DlfCqBse1MDwNJPhtgv4gBDc6rk8zo0Z1rXqZK9uoPF3H0FctoUGLVGniY
 kcYhLz3aoti0lTRI1u85V6ySgZ/6puHXxNCFALGN9YaTQBWjFvb+xgjP5TtGKabSnZdr
 Fhzc3VF0Te55cOsz13vJr6PfrcWw7rqJsK1gCEAZq6J2OyCjSiP3FIaxXBrD821WhvkX
 kSrvR/FUKtby624K5AVjc26yyAgFrO3BUCw7HmGifzv5xyilDz37cLYyNka6nsK5ZWfc
 csBryRNeutUbdLxw2B+Th9wwxzlEfWmdV3gd7YIZRLk1/7DdQsU9rAQymymVhy/7HRCK
 eOLQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzvS6CluhRBm9uhfDhuQDsoxF120NGjsk8QwIdPI/MJ9XUS0c/QPZdYcZ/R4qQGbGb8o6btIaU5sw==@nongnu.org
X-Gm-Message-State: AFuF++miMgoFhxqvFD1aRimaz+Fx6h2bJ9CLP/Ik63MCctE3QQY3EV85
 TnmBDYRq6ytdkOjm3mNWUVH+nZXDMT21TbE0VeuigoiqZbhwZp8phDmjR/+GrS7Y3Kd4UCVm4In
 RyYHNRIzmS4pHuHIqx1otTUiLWIKGHnIMolFdP2QC8A==
X-Gm-Gg: AYBFou1wFqGfr6ZXWLCNi7lYjua+4WMN3Rldfj2KeWRhS01IrJnPChYmddxz9UERx5N
 CHIRx0P7nijLDOlwd05xep4QmhMSklzW0itoHtzMeTTwOZ65WFvISL5Z2jeO0Z75h95V95sMkEv
 1eLpY2us/BPfXcLaW2OEwIK0ZgStM6f8S3qpC6z7XR6Kyx4s7zZWymLTiz6O8lnMw6ysM+IKxUs
 azHgC6uX1t63RffB8+JVSGgjszOS/3fy2gA/NBHAFCLVU0bYxHLU5Qc63PFrJc7V9FVWVS60KMP
 zLjacL0K5KtgdzvC0En8HtqpkMgPWhWVv6mwWJXj+iudVwaWZz/I4Wq0oL/lPn3pch3WvRgnUJd
 KqZVyZjsOwz/jvgbjoFVkTAekL1nVr2ssTibFvxAJ
X-Received: by 2002:a05:690c:4a01:b0:86f:8707:1682 with SMTP id
 00721157ae682-87125448905mr128150607b3.5.1788882683810; Tue, 08 Sep 2026
 08:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260902165956.582901-1-alex.bennee@linaro.org>
In-Reply-To: <20260902165956.582901-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2026 16:51:11 +0100
X-Gm-Features: AcwNN1WHXR9H2SYPfeucCTOX1WEAQqGcPhoh8q_G0dXyXkstzs6RFMkj29nSq5o
Message-ID: <CAFEAcA_hbEUYO+0vSDZDGtyp8uo+The9q_Bkry2WwJY40EVvTQ@mail.gmail.com>
Subject: Re: [PATCH] hw/char/stm32l4x5_usart: Accept character input upon RDR
 read
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Samuel Tardieu <sam@rfc1149.net>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 "open list:STM32L4x5 SoC Family" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Wed, 2 Sept 2026 at 18:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Looking through existing serial devices this seems to be a common
> pattern so it makes sense to me this is the right fix and matches the
> API description.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4389
> Reported-by: Jan Brittenson (@bson)
> Suggested-by: Jan Brittenson (@bson)
> AI-used-for: fetch issue, apply proposed patch, verify build and qtests

I think the fix is fine, but given this tag I'm not sure what
you want me to do with this.

> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

-- PMM


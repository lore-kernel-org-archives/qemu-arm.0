Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3C5D4115F
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 10:16:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgKPA-0000ZF-NE; Thu, 15 Jan 2026 05:16:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgKOx-0000XI-6T
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 05:16:30 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgKOv-0005rr-GH
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 05:16:26 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-6420c08f886so979447d50.3
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 02:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768472184; x=1769076984; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KbDjkZE+DRIN3rMtdRZHNhQRuCYWbOmG1xmVKoOjFNA=;
 b=iao7D7ulnapLDiA0nW3dS22a3Vdbi4iB4B0oLWZog2EL+D6/EnJS9vaGZ3vPHJTUIp
 t4KaBWT4ZB0/B9fTKctFgRDK5h/kD8x0A5Hz07VgVLELbIrXu1SPBKPlLxw5tE/G5gP6
 jHZyQhrScYdaJ19YqWOghnaazjSNuH/58ujITLfocwewo7ROlvKfhyegMY1dXd6Wx07n
 pg+kjnH0BxYuxfVBKQpXNMBmzuSq1WCJ8e6x+Lp9dru3p4Q/o54K/87mhKtO2uGvVk+l
 SYYbgAVoFYMLSga4oS/P28HFqNPVu9iJ5xYx8q2tZh70DzXiL1QlmSGV2/r3g4lD8lHr
 Z5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768472184; x=1769076984;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KbDjkZE+DRIN3rMtdRZHNhQRuCYWbOmG1xmVKoOjFNA=;
 b=HzfmDOj1IdUz79XvmOG4hZBCgruFItPL6TMssFQBG+s8B/VfOLLKsg9bQLZT2BgM+/
 DS6qJSuDuewJaFvImGAH4QCuoAhFz0eKmKvR2EB1OeheUHiBVlaeR8RRIojqpG5p6/74
 90EPVv8Q5TS9LgMqPSl6W++zWbcOArLp8vT3i/B0wq8j04OBeda6GcmcLbNvhIGmEbeB
 AKqJ91PuUfkNzYABurtqh3zpic1N0BjFZ3f4EAQtOA5Vu6+0xJlePAeOZx3UjZvwBLli
 +iVeYLtursTw7A6heOdHPEmQpvQ4nOG62Xlx2s+kWpaq8Fw855n//BTgnkj3HWIBaVdN
 /HAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCkYGKVrFMx8h5P/yDdhDgaCxnKQIXNXEOh6pJmbhDEVj6IXptiQdAsA7DAYV5balfxyBVahVmAQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw6K3eQMr3FwSdG6FJ8Yg0GyVy5+nR3rvOIoueRRlI/sEO6bVGu
 4bTE9CzUIdLXdo0Ig8/cemafRV9sUmyE5BedcwGtBapwIP2g+voGR9J2jbsOjrixHZ9pt2CiEnS
 qOLycr9sNjxBXgnWJGJBVpyBbE4J1InCq8TWHSbKrAQ==
X-Gm-Gg: AY/fxX5kW4vZr8svZokAZuuy0R9KljQFCvFs9DUCRAq31nVGHBRoUoXRp/bjaFqlUxh
 JGQI1O4xXkYfADHgk3i9Bh9kNxaArgxDxnwbHeLl1h9s0dW4jYQrSLGzUdJSnyZhC9Z9F0Mm31E
 m3kMc+prTLXLv7KTwQMrul56PpvBZNvS7uoy8wTcLfAy3vCyvxUPbW5gTYnHmU6yClP47HzOsdR
 IqHcT9ulwGS+kAQMSQ9W0O8hLbF8CUSt2tFzvY91e2gJcVPFgjeHAyr3zwocCdqdcBCod1N9JWY
 VboXTWxcdhw35ajzD5aCioM=
X-Received: by 2002:a05:690e:4007:b0:646:7b87:753 with SMTP id
 956f58d0204a3-64901b17308mr4015733d50.74.1768472183334; Thu, 15 Jan 2026
 02:16:23 -0800 (PST)
MIME-Version: 1.0
References: <CGME20251223120242epcas5p44b454df5afd0d517a4562a545ad11218@epcas5p4.samsung.com>
 <20251223120012.541777-1-ashish.a6@samsung.com>
 <CAFEAcA-UFgxLx8uYM10DoLXutMMNVQaq9xWBjZS5BY6RL1eRnw@mail.gmail.com>
 <tixhu4eob36aeq5cbbvtudkpzvdvigiztii4bycwuj622m5ngn@vt7rf2iln6jz>
In-Reply-To: <tixhu4eob36aeq5cbbvtudkpzvdvigiztii4bycwuj622m5ngn@vt7rf2iln6jz>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jan 2026 10:16:11 +0000
X-Gm-Features: AZwV_QhZDHFYhuHm42QtfoldJKCbRtu3YKzbJ7tvGFpmY0i5eB_LgoBqLF9O4ns
Message-ID: <CAFEAcA-DtfMjEg2SUNeMNRHfxmyYBuJ9tn2fR0LQxfNVrVoyUA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Implement WFE, SEV and SEVONPEND for Cortex-M
To: Ashish Anand <ashish.a6@samsung.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, saurabh@samsung.com, 
 y.kaushal@samsung.com, vishwa.mg@samsung.com, ashish.anand202@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Wed, 14 Jan 2026 at 14:20, Ashish Anand <ashish.a6@samsung.com> wrote:
>
> >It looks like there's a missing piece here: R_BPBR in the v8M
> >Arm ARM says that the event register is also set on exception
> >entry and exception return.
> >
>
> You're right that I'm missing this. Looking at DDI0403E_B & DDI0419E (ARMv7-M & ARMv6-M)
> Section B1.5.18:
> - "An asynchronous exception at a priority that preempts any currently
>    active exception" is a WFE wakeup event
> - "Any WFE wakeup event, or the execution of an exception return instruction, sets the Event Register"
>
> So does this imply that even in ARMv7-M/ARMv6-M (not just ARMv8-M), the event register should
> be set on:
> 1. Exception entry (when exception is taken/preempts)
> 2. Exception return

I hadn't looked at the v7M documentation. Looking at the v7M Arm ARM,
the text doesn't mention the exception-entry case, but the pseudocode
ExceptionTaken() function unconditionally calls SetEventRegister().
So I think this is likely a case where the manual text was wrong and
it got corrected for v8M, rather than being a divergence in behaviour.
For QEMU we should set the event register in both these cases
regardless of M-profile version.

v7M's text is also a bit confused about whether the SEVONPEND
bit affects only interrupts, or all exceptions. v8M seems to
consistently say "interrupts". I guess we go with "assume this
was a mistake in the v7M text". If you happen to have convenient
access to real hardware we could test the actual behaviour, but
if not I would go with "only interrupts" for both v7M and v8M.

> >>          case DISAS_WFE:
> >>              gen_helper_wfe(tcg_env);
> >> +            tcg_gen_exit_tb(NULL, 0);
> >
> >Why is this necessary ?
> >
>
> I think this is necessary because helper_wfe() can conditionally return (when
> event register is set), following the same pattern as WFI.
>
> WFI helper can return if cpu_has_work(), so it needs tcg_gen_exit_tb()
> for that return path. WFE helper can return if event_register is set,
> so it also needs tcg_gen_exit_tb() for that return path

Ah, I see -- currently the wfe helper calls the yield helper,
and that always calls cpu_loop_exit(), so the helper never
returns. (I'd assumed that because WFE is conceptually a NOP
for us at the moment that the helper would return.)

We should add a comment similar to the one we have for the
DISAS_WFI case:
    /* Go back to the main loop to check for interrupts */

thanks
-- PMM


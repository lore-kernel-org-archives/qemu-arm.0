Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B638C87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 19:36:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj0yV-0008US-VX; Mon, 04 Aug 2025 15:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uj0Ag-0007pm-Nh
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 14:44:33 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uj0Af-0001ih-9Q
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 14:44:30 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-71a34087749so29379447b3.2
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 11:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754333068; x=1754937868; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LYfDK2WoBDzVxhHbT0YQl1jcG3OnJa9W81AJVrD6zGE=;
 b=d+scO/NCUYm/d0UbyoOOKfFGrfzCJXZWVEz92bilxtuH0ir31LraAbG2I6CEfSkb6J
 +USpQn6RDp6p9IYNejYN1B2bo+pIhV7r6qqKX7HoRBblEe8PPHPTAHRo23kkQ/b2hX+h
 8N8WJCaNeg4t6NZfuyTiRaMb+iV6z0vjqRTCZmecBgotbIha4Z5T0ZonnvoL8Sg2MPwW
 Xt+6y3lzK71hf+jturAeHouaMyIZAvvqCxwjG3wfIF/Hf3xz+8D4sDhNG9ENxTYknuJ5
 xIkSeauDLdq9UxhqA1thdPwUTp7VT8nDoe1tDMNnbP7gjFuKhrI94cauKZtngF1hNBzn
 8rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754333068; x=1754937868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LYfDK2WoBDzVxhHbT0YQl1jcG3OnJa9W81AJVrD6zGE=;
 b=pGSZJaRH2dpUxcYCBnlbjFGxpZ/Pv6cd6e8h0oC+N3F73gRl3sr/nrkKwkSPf1icxt
 Kk6+hgZTd99Jd5Qrdpyu7YBnURGYZohMC5XTPBFkSzGtbgW3SJq5MGFJhFUxkO8vlG6w
 kwwPT9fyWWxsIIvhL4uFVAG0YLES32927vDanxdGW4vDQPoUhijccBUT0fBM4dgVa87c
 UzyPZ/HUnabRibdep8XUPI75eS8mxuTE2P8w4oeh5/GwtIOE5FaZCU4OIRe7VfzyE1hV
 apRqV94kcCEiZG/JKVnyxUADuq2f5wCRp4uAGbfjdfQTfY5U1OQagY3m18ldy4eTQHBq
 o1UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCz+oE1+BRXPjonEZ11qqsRbnXu6++LzbELAM+iynMtoz3MjnIhWJBUkLUN8XM01+Mn8RY+gYd9w==@nongnu.org
X-Gm-Message-State: AOJu0YyIMLDLKSpM/UYKJEOJKrErpRugeOdexouWxdsFHFFhYqxn0MEb
 Uk1s1hmtiR/mjpERfW8jOMFnScDOS/PJZDVb3lt7+pvjyaJmjJNVzQy3yqtN554uJMH6YxaXDSy
 B8gO2cpp10rBgzdpFBSmEGR+l5NnK//HeW9s6dkL4RA==
X-Gm-Gg: ASbGncsW35YQJbcfwksjdmN8xy0zK3LNDJsFUVpZjMjHqL7Ewz0DwG78VmgZgWxuivl
 eawVbLtJghqWnru56nXE/ukSDkBMhWSHb7bWcTmCSbbNZxhe7EWuFgZvOqmS8TA3SeXcFVkll9m
 wkYij6qkdZJfEwpZdWDGry/3FytIdc0A1N07QggIroEDsZz5XYb3wtlXnznsKI3pO9OI8huflNO
 jneY2d9
X-Google-Smtp-Source: AGHT+IEVLmTRrExs+lKMpI/JYCkYjKe+NnsznfAGHHVbVMggRdIY6kseJHwL5LZX8ekoaFDwzD4yrjWm41UeAWQ8G7o=
X-Received: by 2002:a05:690c:48c8:b0:71a:f22:28ea with SMTP id
 00721157ae682-71b7f924854mr138636837b3.40.1754333068008; Mon, 04 Aug 2025
 11:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250716095432.81923-1-luc.michel@amd.com>
 <20250716095432.81923-41-luc.michel@amd.com>
 <CAFEAcA_WAAUeLe9Kee4cmCC9NsDnHTOgwmiGvHje0Po+SGW6mw@mail.gmail.com>
In-Reply-To: <CAFEAcA_WAAUeLe9Kee4cmCC9NsDnHTOgwmiGvHje0Po+SGW6mw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Aug 2025 19:44:15 +0100
X-Gm-Features: Ac12FXxIYtgZ5CUdB59OyesDftY2zH1N3QHXKf4jLTx9qejzu4aW9FPZnGM2AY8
Message-ID: <CAFEAcA-8_589P9PBfSh15iPj+T05MyEQ56QJ1=wfy_X+8aqBPA@mail.gmail.com>
Subject: Re: [PATCH 40/48] target/arm/tcg/cpu64: add the cortex-a78ae CPU
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Mon, 4 Aug 2025 at 13:44, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 16 Jul 2025 at 10:56, Luc Michel <luc.michel@amd.com> wrote:
> >
> > Add support for the ARM Cortex-A78AE CPU.
>
>
>
> >  static const ARMCPUInfo aarch64_cpus[] = {
> >      { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
> >      { .name = "cortex-a55",         .initfn = aarch64_a55_initfn },
> >      { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
> >      { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
> > +    { .name = "cortex-a78ae",       .initfn = aarch64_a78ae_initfn },
>
> Do we really need to specifically call this the Cortex-A78AE ?
> Is there anything we would model differently between this and
> the Cortex-A78 ?

Looking a bit more closely at the TRMs, although they're quite
similar they're not identical -- for example the 78AE has
FEAT_FlagM (as advertised in ID_AA64ISAR0_EL1.TS) and the 78
does not. So we should keep this "cortex-a78ae" name, with
a comment something like "This is not quite the same as the
plain Cortex-A78; we don't currently model the latter".

thanks
-- PMM


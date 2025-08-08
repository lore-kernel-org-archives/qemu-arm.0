Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E10C87FDA
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 16:15:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukPkj-00057M-KX; Fri, 08 Aug 2025 12:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ukPkE-000405-QK
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 12:15:03 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ukPkB-0001BP-E0
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 12:15:00 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-71b71a8d5f0so26254917b3.3
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 09:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754669698; x=1755274498; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=prhq8y6zrjCUBFremScXMjEOI9QfXxVZfKJGjxYC6cc=;
 b=Qf8jUcAAq4S3blSD9UoLAErO2lp87sCGDX3zmcF6nlDo3JjXqLCUm+jTvWbDrKzkpa
 S5KPpliZImvLF1c2JV2xBDnjX1vE0DpRFVrsAWtJCs5o1diHneFzEs8gvo41UtxkGZlo
 3E5aw3C+Q9m5EbZQXe0DBmVYaT4QyIigQGbxH2XYf2Ol4h1EgYpzy7z37lhSb+SCKORI
 hsT4gpv+J4sjuUrG6g1swS6Zbx7PxJnA+zwBP0JBnXAtA64YffP+S4yyGvwgTbFfGtIU
 G1NDupULPio8oUG/Kpj8gR5A2WMQKCbpdwGJXZy4s/jnH7zToIsMDp+672FYbfRodbZu
 2yJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754669698; x=1755274498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=prhq8y6zrjCUBFremScXMjEOI9QfXxVZfKJGjxYC6cc=;
 b=R580MMBa5svho1S4usRQyI5WzeUuhXOEQeKhdbd+QXvdrszhxt7wW+batenN8XYFZ2
 FG7oZgcuZv6IwlO6tLaQhvMQMwguaFL4mkiGGu8tBt+2bCjR66EmIk9RYFOTwC6c8/Sh
 ltoXb3+QN7h06461oPOJB6dE8uEwc0sGP0zT0E/iO/F90rwhQrgLUj56i4QVBYKJJiAZ
 NbXJNzvci9k1k2UDYMYPYB1rPAwOMQqBaM6LQd7axKJvVwn8OJSryAprAyoAhBpRKrlG
 lT+/cQ77AiN3uAxzDANkfC0BMxOPJ8YyURyERPIr0HUSGfnfsm8OjNwlQssLWpTkBh2z
 IN6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtHifHI+X6g6j6h8vRqXTqr0Z6opuwAKnNIWKL8/gxpnYsXnWMisKk0dmChIQqw07g5hOkrCNpww==@nongnu.org
X-Gm-Message-State: AOJu0Yx/CAe9/zImPjuaBPuq4E25eX33LCyM4ddPQ/Hnaf3dr577msU7
 ailfJfQ7riIaJ5Y7KG88ZFE6BLP8T022ltCG6edyfyT0U6EJH6X6/BmgsTfr4K6X+anM8GM+4Bt
 Tp6CHTnpz6F0uHgq2uCBAu4woORh+M/oHVWEXx5C3wg==
X-Gm-Gg: ASbGnctby1Hu8vQQ+BPhvJ3VRob8adXk1PGMpzLUQUTzdpHsp4xnKfPq+EQlZYNPf1q
 VPPg4g5MQXacYnyejYKUQroxCT9tw4NwPbA5lqjQjcE6QwE4bRBLWRjvM6mCtz9GUXakuw/Gvty
 KUVjteAxC2XMpJNTWgju3JU78RdgQsIZ4tgq8pcB8ZMg0AONqy4DPevTQK6VxaImCJ566Py7uHy
 0gjwnpJ
X-Google-Smtp-Source: AGHT+IHUT1+Y9HPlCiZ6H2ADeNjK5a+rUJP2zG7yWxXv478IRdXBRnBjJe+FDqpioeX4w8a7QmMuundAVB918321a4Y=
X-Received: by 2002:a05:690c:4885:b0:719:f41b:820c with SMTP id
 00721157ae682-71bf0ed9de3mr41356707b3.39.1754669697780; Fri, 08 Aug 2025
 09:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250808-gdbstub-aarch64-pstate-regs-v1-0-14ba70be1b3d@linaro.org>
 <20250808-gdbstub-aarch64-pstate-regs-v1-1-14ba70be1b3d@linaro.org>
 <CAFEAcA-2Zt7HTDX_bdBHjJyQS7o=csE1x6eDymyEPkV3K+pXrg@mail.gmail.com>
 <CAAjaMXbZK=n_HJGrmuGv1DZZ3AeaX7-fK-soFto4J=w-9=vdmQ@mail.gmail.com>
 <6190716c-09da-4abe-94e5-2b713855f0e9@linaro.org>
In-Reply-To: <6190716c-09da-4abe-94e5-2b713855f0e9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Aug 2025 17:14:44 +0100
X-Gm-Features: Ac12FXxE3pBrpoQOTw6jsOUOUbSesaOvooiMP4QXm_rxvmUEBiLDF3d2m5Bi6c0
Message-ID: <CAFEAcA-QcjtkAUUUGVvaUVrJBqP3NvSX0DuXQ==MGcPrjNtGQw@mail.gmail.com>
Subject: Re: [PATCH 1/4] gdbstub/aarch64: add CurrentEL register
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 8 Aug 2025 at 17:11, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 8/8/25 5:26 AM, Manos Pitsidianakis wrote:
> > On Fri, Aug 8, 2025 at 3:21=E2=80=AFPM Peter Maydell <peter.maydell@lin=
aro.org> wrote:
> >>
> >> On Fri, 8 Aug 2025 at 12:30, Manos Pitsidianakis
> >> <manos.pitsidianakis@linaro.org> wrote:
> >> The debugger already has this information in the 'cpsr'
> >> register, so it could implement convenience views of
> >> the subfields itself if it liked.
> >
> > Yep, but consider: it is a register, architecturally, so it's nice to
> > include it for consistency. It's redundant only because gdb has cpsr
> > which is not a register. So this is about more about being technically
> > correct than correcting an actual problem.
> >
>
> I agree with Manos on this.
> As mentioned on a previous thread, cpsr is not even supposed to exist
> for aarch64. So adding architecturally defined registers, even if data
> is redundant with cpsr, should not be a problem.
> I'm sure gdb folks can understand this too.

I'm not saying this is the wrong way to represent this.
I'm just saying we're not the only gdbstub in the world,
and it would be nice to have a wider discussion than just
QEMU folks so we are consistent about how we represent
PSTATE (including what we want to do about the new
bits that appear in the high 32 bits of an SPSR), before
we commit to any particular direction.

-- PMM


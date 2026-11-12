Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7AD606A331
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 09:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TZK/4+lJ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRR9O-0005RV-BE; Thu, 12 Nov 2026 04:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRR9N-0005R7-2m
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 04:31:21 -0500
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRR9L-0008Lj-GW
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 04:31:20 -0500
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-6767d92cde6so4570578d50.0
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 01:31:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794475876; cv=none;
 d=google.com; s=arc-20260327;
 b=jpSYUS00qpLfxQRUrxyfoB+5SLWdZ17ABfLqCkIYZXw7kpsb9FOBy/2a28ynPE5/1x
 xtnmoqCPlFsby2bCclVDPBLzERLG7zvRPBM+dp4u6QJnBix0LeIFmiYazicTRw35NUhW
 1U67ajBNVkYGogCaTEC94ylwTKaq2Id61swP+Zu//ZSYbUaZa2+wVNXF2pIzsYMbEM1V
 g4B6wCWNy6s6tefJOn5Quza4EhDwioozbJS1Ts+YcmV2sZuWHfxkrURJdRDHBReiQXfh
 EoGA6YsYvNgrmq6gWYF9z9i4sbRRNLP1c7swEvEJ1UGAOp3Nuq3MC0k0FAuAz/lgOOq9
 y1xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ei8dH+lQVjN7xvZrUNzulVpjahdWK5/bbzW8ZyK4nJk=;
 fh=hOT0zOYFLDkOd4rl0dO9cn9yuIYt40V0FxIKgGJtxGA=;
 b=lgbg3AiF82vwW3iZA5WkbrDAVxOEDBo7vOLRtPDPF8LeRjJqWTNSuDLjDp5/dsvu1g
 GI46SfZpr1lb7sPfnjE3UqHtx/y59e9An6/BnAjvMMY32IWknLCcK97kbmQupJdwy63c
 np3kMIlzqvZVnfFh4Cb0HlTYQEbIGqzsYWRpLMqvj5ydXIgmzwIZa6q/8s2GDLVC6khy
 wyXyLQdAiSypBEqO3QRpS/LZqIRdbRsEos6z0zge6h03syPt1Jnx7ewywJuwAjyQW9GS
 WMoxNDmyOI6X03+5ThpCOlAtqtOI/agD/+mxPQywRwBOWbYm0BSS8jUo2kDBx8k4h6KG
 tUTQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794475876; x=1795080676; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ei8dH+lQVjN7xvZrUNzulVpjahdWK5/bbzW8ZyK4nJk=;
 b=TZK/4+lJbiOmuqw4Yt7YbBQ1gA3HrjZWJH8jmipDUcUNZVkYe8gCOO2MkUe1he/72n
 7TwmrwSXQVEnLmIOYs+9R8xCQwjrSKxxWix79/zLRKxiAL2WQWnH17LxLEeYxrZLXABc
 1DOYAwnTHYas/u4sS80VLHAjLnpz7VP8SvW3EmRFiJH2C6aH6FUaF7doikvEGdR+q2h8
 RZE7a8Y0JhJbVEqqckMZAcUs1+mHub9b9vrGWzTMGNat7AfbN99g0096f7AxsGpdxXZ2
 4LYGDds5YKQarVE5/Eu7dHBGbyC6G+74HbMTURH3hnXi+W1EiSgMB47FK2QMCYKQrp3h
 f1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794475876; x=1795080676;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ei8dH+lQVjN7xvZrUNzulVpjahdWK5/bbzW8ZyK4nJk=;
 b=2aiAFZfHOZKh0faXCfvbb5GXZu4jXrn1n9JUijGof9RZ7SQb7lHM808V89iHBQEFM0
 AYAGx0TLklCOTHvLLYfLnQeXDFCcSjmD+wsheiNICe/vTjnRZWbr8bHwcztni4Yg7VcQ
 V7qfI5CuuxGL4fO1gr45TbNem6Xo24hDrFFWuwW9NaH0kYzjXcAptvmOeo2pGqmo38C2
 0egd0x9a85WI4nboKDVUtpzkCYD4FS8doVC7+cs0/yZw4CyQFusEa1uZEGgVrHKsZ8+X
 1yKqXZTwQyG/ZUPKqiDEHZ2Bsims0SGJvyryC4JJp7cywXK76JFC8NZG731+5e7AJQn3
 +iog==
X-Forwarded-Encrypted: i=1;
 AL+hErE9Gsen/hqAXr7H6toZC1hfJgvOsUlGc1CZXZOk9AtKHAGnOMzca2s9aqXc06krHxJeKYb0MdhR/g==@nongnu.org
X-Gm-Message-State: APuU4Z9JXYexHqu4gViBwn5ocz20H1TFn9N7b5/357RJWZIkYoomaF1G
 CnfukC/hGa1ZzI+Q43VYjWAV7DD6t7lGLLSdiHg0AgUpztsq2vCAUddTfAkwkuX9vLTwe2k6aPt
 7EE2N7UC2CRTX3iW9sa/IAsKVDO94rVDIqBeJrBAL2A==
X-Gm-Gg: AYBFou3X3fuUaR6B3A2JBkvAVc+7Nx7Lu4t3RhUMYEV8Lgu+PyybKqfJmBqtbiJLtTb
 QIFFTu9y2PWnAPK0bl2oGbAIfU0605ecw4VvGXIt4QRNXZyVqTwyTwNSgsTdn8cAzEgcqoV73I+
 bqNRkPTsemj21J780lPNCnwlMhjcO6BXhNkB0aGVPfYQsugsX8UChy3f1wqklmp+MUE3ZXQnQI5
 a7qWdmlFBIbXeFfWwjsEjGOPWijJiJpZ9knorkQR4NdN3oo8PxVdFC+ktgHif8v7PpDKHWwMp27
 UN+gJFO/Kd6drluSWvZKsyR17nSRWqT0QnBwF4SXwpR944yojVl6AiApKobmRz76CyxjBKCWKhL
 2c/Mvgqyb4PU5aGp6U/kFlHhgPuqeOsCYVcnG1oVqqzUMXJCYMUIVPPigQjNh2Km2Du4pGrxMzn
 VegfH8Uxdimq2uK4RysvhQR7z87moe4/N5ys+UoRgwrA==
X-Received: by 2002:a53:a74f:0:b0:67b:f91c:10b5 with SMTP id
 956f58d0204a3-67c67fdfee6mr2823993d50.98.1794475876355; Thu, 12 Nov 2026
 01:31:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112025159.473997-1-patrick.lister.dev@gmail.com>
 <0384a52a-31f6-4bbd-9de8-8efe73610e28@app.fastmail.com>
In-Reply-To: <0384a52a-31f6-4bbd-9de8-8efe73610e28@app.fastmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2026 09:31:05 +0000
X-Gm-Features: AclHuK9o1ZFb6zJeR4-pm6DWlpcG08b32X5ENGmHxfFB3Vx0UUm9PpdFEohX-II
Message-ID: <CAFEAcA8bim81-aKR=whfBaaT92EUAWwwNS8QFAq79Je4Sm+XwA@mail.gmail.com>
Subject: Re: [PATCH] ARM: nwfpe: use task_pt_regs() to find user registers
To: Arnd Bergmann <arnd@arndb.de>
Cc: Patrick Lister <patrick.lister.dev@gmail.com>,
 Russell King <linux@armlinux.org.uk>, 
 Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Keith Packard <keithpac@amazon.com>, 
 Nicolas Pitre <nico@fluxnic.net>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
 Ramana Radhakrishnan <ramanara@nvidia.com>, qemu-arm@nongnu.org,
 Riku Voipio <riku.voipio@iki.fi>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 luis.machado.foss@gmail.com, thiago.bauermann@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 at 07:59, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Nov 12, 2026, at 03:51, Patrick Lister wrote:
> > NWFPE locates the trapping process's saved registers relative to
> > current_thread_info(), assuming thread_info sits at the bottom of the
> > kernel stack. Since ARM moved thread_info into task_struct, that
> > expression points past the end of the task_struct instead.
> >
> > This breaks FPA instruction emulation, as the user registers are
> > never read or written and causes out-of-bounds reads and writes of
> > kernel memory beyond the task_struct. Any unprivileged process can
> > trigger this.
>
> Thanks a lot for chasing this down!
>
> As I understand it, this means that nobody has seriously used or
> tested OABI since 5.16. I last tested it myself in 5.14 when
> working on 4e57a4ddf6b0 ("ARM: 9107/1: syscall: always store
> thread_info->abi_syscall"), but it was quite hard to properly
> test it at the time, even getting an old Debian rootfs to work
> with a modern kernel and qemu was nontrivial.

> I've added the maintainers for the Arm ports in gcc, qemu and binutils
> to Cc here, I believe all of these still have some level of OABI
> support that they kept just because Linux still handles it, but
> that can then also be removed.

QEMU has already deprecated its OABI and NWFPE emulation as of our
11.0 release in April this year. We'll probably remove it in 12.0
in April next year. (Our deprecation policy only requires two
releases of notice before removal, so we could have removed it
for 11.2 if we'd remembered, but as we're already in freeze it's
a bit late to do so now.)

thanks
-- PMM


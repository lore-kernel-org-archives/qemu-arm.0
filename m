Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683EACD8C92
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 09:37:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWWQN-0005WD-El; Mon, 08 Jun 2026 05:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWWQM-0005Vv-TX
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 05:37:38 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWWQL-00057i-CZ
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 05:37:38 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-66061993121so3694279d50.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 02:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780911456; cv=none;
 d=google.com; s=arc-20240605;
 b=FegQcXWdcUPaGxt/O6GVEDJJC0KNgMoesKYCAFGR+wfcaD63cJyX9z2KKJGVmbfPew
 OYvLEoqa9S6DdVVUy0/aDTSNIceO5Rez4RsdrUpO9whmV5yyBtV8qEdFc3uT00WsM9c0
 V7HCteO8XZ5KFTKkOhq6T3f/kx4WHDzpdOPym+mSSEW8uSNqqo+yUvXH5cbRd4SYAW9N
 cdl+T++PwVisj4RgBikhar1hFOYrgAeMF4OPg8Ui7lIre6Ra+81nEQ6JDySZg1Y9cn3r
 9IRRgcxIz5kVU3ttGuJMja5C8C/UtSoPJ4P2T22kB5sy0nFM8Ai4ZUL3lhK4mWBfBv6G
 gIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=J5L1JFcEbvERzC9sMUHEuhDP6qO9bjuPMoCnatQ7p9o=;
 fh=oG+53MsbmDmhmmXFFz1mQNyImwWicRcBuUgrcYPHlSg=;
 b=UagGeDX4Gisp1kOWmQKtGO1gefuoAfZEykGKD6LOIb7gvHT9BZLZ/BI0Ik4lzYBf0h
 JDnRTMlyheS6tyc3Dw+KtpXmUC8XMMGp88LWNRyqhB284baWgwAc9Q/cSmvLkmK6ZIUS
 rcFW7j0d59sEnaDku8176DUoMhTcraYCzsg1A7Jw/A/VpUxnTccdHzR4Uuxcv1Ke5qQk
 KoxlSGDbprGQwXdC+vjaPOiD/rZTuDnxFCV9oBrsGKeA8VG7nVfKWIpwCWTyNdRrujDk
 MfOlqiUCQifjjJTLO4cQEYdVvKxrehVJBIdiNOalx0f+e6HjwGO+QgnjBMtHNoP0DLhm
 Sg6A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780911456; x=1781516256; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J5L1JFcEbvERzC9sMUHEuhDP6qO9bjuPMoCnatQ7p9o=;
 b=vuCalg2Ya6Hn87VliHEjbiooRkJ/ge0bp5g31blmkh6Xdp7CAzZxZNn3HwKH/AEowe
 pqctREOozOSfMYcDl7+qVKqlFNUaRH30wbAqXIFvIg6d5G04K28E2lDeunCUDo3A00bC
 akdJJ4JduXaFEq5MHp4LyRQjDR9gHtEx5WQ4xyAhVJchWuE7cIj7Dzl308XGkevLpS5J
 /iwCSyhmCn37YEfeso5uAuuc0HcigM8Yzf6kfw53e+RP1ehwmNsJQfGnm4byK3WNzWow
 V01EeUnPcUb0ozkFcf55Pzl2qalmkKQ305Q4O/QXWIxtQGDR1pwOR9mw1Qv1+zOKuQmy
 4Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780911456; x=1781516256;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J5L1JFcEbvERzC9sMUHEuhDP6qO9bjuPMoCnatQ7p9o=;
 b=Li26FpUb+S0tHjj3kcSuggBRauCuWiZRXdi+nC9NEUhG2JIzZewyY8tGl0UOSL9Y+X
 fif9n+bp0jl7uCecP1kEEOKlQ2Ey8JxhP7rLVsoEroPoGpmBngg0hrtSUoo18om2pEJ8
 EosK6VFUExglygdHUJ4w1jYtMzQLhrLTEEcEKqq9C27NHgLGUKQPTNECGw+y2ZeMwOn5
 tQc4Sv15NQAjU+uBf9sMNY4h1Nf5MFpZnJ3P2I8oJfanC0DNUhtp7VN9goxqgDGzg7CT
 GaQVJHQeyWgfzGtnFRLr33lh47efvaI9czPQkv2peAEka43o7n5lVdA1sWjCw7Es9z55
 ODKQ==
X-Gm-Message-State: AOJu0Yz2/pDY2OcOaNvQ6SZLNDUQCilNV6SyzOCkF9ZSyE+TzY1c9F2E
 sSnv58rD5n1V1ezM1wviOy6O1fa1QMVdqU5fGjQQmhcPKxYad5WIJvq4Mton5sCfEYD+4ExIMNf
 dtPLpEgUbAsho5zv/AipQN4kQy1abtNOwPznCKMtTMA==
X-Gm-Gg: Acq92OHQihDVhF41JZC+e5CYfwkzu4MsqFqpzn1IERjNdTAGcc8Wvi0vNcUal6hJljb
 xcGqFm9AYcuWuHeGCIN05o8Qdyoce2rgEVjXk8oSOfmKP547iRSqeK0BLfRoOZHiObIUQXiAjBf
 jTbCK1KQ6SsAoKxwX92CekkTx8D1wX0TKNhSq+Rjva1+vPIMEf4GD39vWtRoxIY1rHwEjT947Fu
 wejJNvxw57qWEqotvjKouIF1eLAocHQTwdawAC+yttOSyWya7/J7vnlpBmaOYtEUQHpcbBMz31y
 3qfe6NueKWySIKg46EAPsnVxl5NXK3zjJWPYrWkeCOtbhLAqNRPCa84BhqF+epLlOgF5SFW6jeF
 EQA==
X-Received: by 2002:a05:690e:bc2:b0:660:8508:5c15 with SMTP id
 956f58d0204a3-6610779e086mr11012601d50.49.1780911455764; Mon, 08 Jun 2026
 02:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260605034729.2874861-1-kylefoxaustin.github@gmail.com>
In-Reply-To: <20260605034729.2874861-1-kylefoxaustin.github@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 10:37:23 +0100
X-Gm-Features: AVVi8CcI9Ri40NPGHNuqJlFE6tU-04vN5237IiSyt5BxVqNfiKETCrUY6erp-1U
Message-ID: <CAFEAcA_=2j+jHuqcCF0S9X=4q3dhY8=EKJuGCkuuUSG1jaO0bQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: align down misaligned PMSAv7 MPU region base
 instead of dropping it
To: Kyle Fox <kylefoxaustin.github@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Fri, 5 Jun 2026 at 04:47, Kyle Fox <kylefoxaustin.github@gmail.com> wrote:
>
> When a PMSAv7 (ARMv7-M) MPU region's DRBAR base is not aligned to its
> DRSR region size, get_phys_addr_pmsav7() logged a guest-error and
> skipped the region entirely (continue). The architecture calls a
> misaligned base UNPREDICTABLE, but real Cortex-M hardware does not
> disable the region: RBAR.ADDR is only bits [31:log2(size)], so the
> sub-size low bits are simply ignored and the region matches against the
> aligned-down base.
>
> NXP's i.MX95 Cortex-M7 firmware (and the MCUXpresso SDK demos) rely on
> this. The M7 sets up a deny-all background region (region 0, whole
> address space, AP=000) and then grants the peripheral space with a
> 512 MiB region programmed as DRBAR=0x4c800000 - misaligned, intended as
> 0x40000000. QEMU dropped that region, so a privileged access to e.g.
> LPUART3 at 0x42570000 fell through to the deny-all region and took a
> MemManage fault (CFSR.DACCVIOL), trapping the firmware in its default
> fault handler before it could print anything.

This is a guest software bug -- software must not rely on UNPREDICTABLE
behaviour, even if the hardware implementation happens to do the
same thing every time. Other M-profile CPUs might do something different.
The right thing to do here is to fix the broken software...

thanks
-- PMM


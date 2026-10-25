Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE759606A31A
	for <qemu-arm@archiver.kernel.org>; Sun, 25 Oct 2026 09:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KyNkmqsf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKunG-0000yq-DF; Sun, 25 Oct 2026 05:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKun7-0000qd-VF
 for qemu-arm@nongnu.org; Sun, 25 Oct 2026 05:45:26 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKun6-0008VW-7D
 for qemu-arm@nongnu.org; Sun, 25 Oct 2026 05:45:25 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8a83d2706fdso17110307b3.0
 for <qemu-arm@nongnu.org>; Sun, 25 Oct 2026 02:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792921522; cv=none;
 d=google.com; s=arc-20260327;
 b=g3P7lY870YFehZ8My1Kc78Wg7nomV9mrw34c+G7ULZoL6IXigsGSSZqlN66aIRqxWd
 0LLQRfwSVU/EYQdxeBZhNod+/9jObS2i2GDlB+YrmOp5LC1QE/zrBYsYe0o1sppcR26K
 JvNP+pIB244c/DpGH+B7DljoCDqaov/k7Zaw4GDoB66trriwKn1zW6M6E2ejGyttiUwe
 vuHUmwaOZeqmm+M7GI5rETtkECAcZJlVfLi8dq+qzrYRTZmSFfPpcfJw3/6kXo/So2xV
 KXlfuXmVspjw5PlIWJfdygYeSwU5X4Qs/XFx3M1zHW3LFs6YHp40SbqdLZQRhJrYIoBi
 T71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=DzjKs/qrm8rgcb7Xg6xh6iKM2RJ6CCIhXW7uGjEg+NQ=;
 fh=kb+95f4Doq9V+Izrxf32XYLKCjrKtK0+Mq+F6Awsbos=;
 b=TmOhanmIwjwQETMCWozkPGD8vEFjM0b97KhaOkFUsIW/k9b4+y5FXMmBZNNfet421D
 ZzbusSDykfZdsXg+Cu6VKe5BDJr58oo0WBUoteWcgAbcd/1luxg0WyNHbOsTjSIOEI9v
 Zxc/nd0vauQQyUMozDwogughU35lVPYXP9UfJ+g5jQgIrhW1sEKNOXUpXrqVHMVYtWm8
 WBreMfTd8+DGVc7cLHqzTgfxIrLB41rP6/24D0UV5ogoVzLUqm2yGaSKSMioWXPOTTqm
 Q73CucPFFIuIRhde7ZP9taENsvwlHZjcTRKt6vBKM5wLdsxhFY5Y8v8bzBQ8B7NTvfqP
 UM/Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792921522; x=1793526322; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=DzjKs/qrm8rgcb7Xg6xh6iKM2RJ6CCIhXW7uGjEg+NQ=;
 b=KyNkmqsfFi0YPImZA7l5pfY2rOqAaw3lhZ1KRsYmKfYLOxJV/Duvzlh0HpJU8rxJEU
 zrkWzk5HKp6gvq+rrL+ts5VKD0waD6vAbID6zbmsghkspUFZxRvp4zMIMlsOVMAZfB/d
 TToaXz5HWx/EY0xFWKZa9AxRWn7XofH+sHuRZvVvepIJRmtzQujhQOe+fmCtOyZsx1nB
 JJ5vSVXWY/ZK0cnLCamEMAlFf4YHQk2EoZYQz5+GLGwg8NP/1LGOp2VjfLDlTqeoj4+T
 weZr8MJyfPCrdC5dwru2iSRS9GOrvQPQnoZOFt+BtymxkEHzs1pvJv/fQsK2nlQqV6pi
 EzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792921522; x=1793526322;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=DzjKs/qrm8rgcb7Xg6xh6iKM2RJ6CCIhXW7uGjEg+NQ=;
 b=JIo/V61ZmbAB2y0pXPc6UkhQwPHKIa/+5R8ujh7h27CTZTVAengKlPhFOem5BqMTN2
 WRJJ9oB3GOizJh+f5Ew6ZpnbnVkf0PiwXKUetXBuB/e7Z2IC/wtWnNP4IgwGOpfzOg0Y
 JuzoXklkSD1zLNZy70tKisP+soQlH28YLUpEp4XnOoZwjVBNGaMQp6N1yk6rzkBMryn/
 rfkv1jldUFfFuPmmmdl4DuBh5tAcrPYh5ZI5Ia/TCYJXhkRpGiEeWA0SERkiIR6v3xnA
 tLkWUU8VZcV/63qmZik/1Vm+R5pi/DmCigEM/zzXFMsjZmVWZU2zrly+fizxjnxDDj1O
 BtZA==
X-Gm-Message-State: AFq9FYKv618I6AAYhzKpHE71nGRV5fo5Lfy2ZlMgjolGmEyA2ZIWhzvU
 pkdQ2+TDcd8b8GcWoAEaG4dWGhM8vdRpOEL/L2xVKcv2ukkq0JmVbE9jOKSour8bPCNh2ZfukHK
 2mP1khilwegJwOjRbmQ0dDZxsvFd9RRtrh1yGN4/MOQ==
X-Gm-Gg: AYBFou24jNQCsvz8j8UMLXg3jAmsZ4aKVWeYoDMg21BoVGOfGKGM10MmU/Q0jjYOzE6
 0qzEAAgGv1i7oWwhrKr5LBw4hQmuMY2FmhxnOlqpn3bR5fU5cXs5nX1kTz58awOPvGTMi2UJzzN
 e5vC16b+f0nbz7GKrM6N79x0CDVoZxhHwxhhYTOsvWK9DAc6gFo0Os6yaR+IVMAKEzQj5ZuzS7z
 +UCipK76PezCHUMpF8PYSQtSTX+V5Qiku7s2EFlaezVkAqJXNN1NfhWb5C9ejAnC/fLSI3n2G4y
 /KzBUzaacASIEvyq1GRcJjMXA6aX75hwCybNw39MpAxlCebn7Y78ZOJ6DOyIJnUqbRZUM2Mt1Ke
 dOQ4BI1eNaX9gY+ZbFanzorBvt+U4OLCf0LAIe100kD1RfjviEt6x6XlXawSzpRLqs4PNQD8bM6
 kPDuVyFyXNet1VhXETZsRD
X-Received: by 2002:a05:690c:60c5:b0:8b0:fb9b:8d0 with SMTP id
 00721157ae682-8b166c01ca7mr22452467b3.50.1792921521977; Sun, 25 Oct 2026
 02:45:21 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019162217.3272337-1-peter.maydell@linaro.org>
 <20261019162217.3272337-2-peter.maydell@linaro.org>
 <25d0ce95-e964-496a-a3bf-2c5f9fa1b78a@tls.msk.ru>
In-Reply-To: <25d0ce95-e964-496a-a3bf-2c5f9fa1b78a@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Oct 2026 09:45:10 +0000
X-Gm-Features: AclHuK9KOxkkFAKlhiXd_9oDUsqydvHCIeUvBOzUQv7w3jxj5rqR3AbOMwCynoo
Message-ID: <CAFEAcA8MQw9bcAG+7ft=cxZpFrSCWvXpLerXrH=beBBdhvzM-g@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/intc/exynos4210_combiner: Fix group register range
 check
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 QEMU Stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 25 Oct 2026 at 05:43, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> On 10/19/26 19:22, Peter Maydell wrote:
> > The exynos4210 combiner has registers arranged in sets of 4:
> >   offset 0x0: IIESR0 (handles interrupt groups 0..3)
> >   offset 0x4: IIECR0
> >   offset 0x8: IISTR0
> >   offset 0xc: IIMSR0
> >   offset 0x10: IIESR1 (handles interrupt groups 4..7)
> >   offset 0x14: IIECR1
> >
> > and so on for a total of 16 sets of registers, which puts the final
> > IIMSR15 at offset 0xfc.  After that come two registers which aren't
> > grouped, ICIPSR0 at 0x100 and ICIPSR1 at 0x104.  The entire register
> > memory region is thus 0x108 bytes.
> >
> > The logic which separates out the "offset is in one of the sets of
> > registers" from "offset is one of the ICIPSRn registers" is
> > incorrect, and so a write to offset 0x10448100 (which should be
> > ICIPSR0) falls through into the code for handling accesses to a set
> > of registers, and indexes off the end of the s->group[] array.
> >
> > For an input offset of, say, 0x3C, req_quad_base_n is 0x3, because
> > this is in the 3rd set of registers.  grp_quad_base_n is then 0xC,
> > because this set of registers handles interrupt groups 12..15, and we
> > will index s->group[] with grp_quad_base_n through to grp_quad_base_n
> > + 3.  IIC_NGRP is the size of the group[] array, and so we need to
> > check grp_quad_base_n against it, not req_quad_base_n.
> >
> > Fix the bounds check, and add an assertion that the code path
> > where we are beyond the register-set range isn't going to
> > overrun its array, which we know to be true because of the
> > size used for the MemoryRegion.
> >
> > Cc: qemu-stable@nongnu.org
> > Fixes: 8e03cf1eeb1f9e0 ("ARM: exynos4210: IRQ subsystem support.")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4709
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/intc/exynos4210_combiner.c | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
>
> (This is now commit ab6579bf73b in the master branch).
>
> Hi Peter!
>
> This change has been Cc'ed qemu-stable.  For 10.0.x series,
> I'm also picking up a previous commit,
>
>   b6d36a1af79 hw/intc/exynos4210_combiner: Avoid hw_error for guest error
>
> instead of adjusting this change.  Please let me know if I shouldn't :)
>
> Overall, it feels like this a niche device, and it's unlikely anyone
> actually cares for the stable series -- actual users of this device
> in qemu most likely have their own local builds of qemu anyway.  But
> sure thing I might be wrong.

Yes; I cc'd stable on this mostly because it's an array overflow,
but as you say it's niche, and this device isn't covered by
our security-policy as it's TCG only.

Picking up that earlier commit is fine if that's how you'd
prefer to avoid the merge conflict.

thanks
-- PMM


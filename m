Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBBDEC1E9A
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 10:58:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnx3w-0000zA-0c; Thu, 05 Feb 2026 05:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnx3u-0000ye-DE
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 05:58:14 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnx3s-00006S-Iq
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 05:58:14 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-794719afcd4so7917697b3.1
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 02:58:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770289091; cv=none;
 d=google.com; s=arc-20240605;
 b=T+2Wq9tgcz0MVatxDDh/ob1VeGqYuHQ+r0So5jX0pQvpPd4MJsL89hwZyB+y0KwbQV
 jQFw3efEgI/qI8IuIowLzktHD1mprYrfB6qJ4YCixXKqUuv75uC0yucjGmWEbc0k5Jil
 ymc5l3PCdElMMX2oNAQICG2p9Dw1TKno8K/y4PPicB0+/wrdnxJCqz6oEPMa5wtOUSkZ
 yxHsSAkoAUhm2rRRD7DXsxv0vbNb8mj06eHBNyTIbTt3TpnPKTrODuEsLNXMkOR9bHPI
 I+OtMgF1aYax9VHPk3EFKehVwaNCKrqEZZE6Rs1Bk8DPJql2kIlyO/TACL7k+KV76mKP
 87Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Xi1iokQkGw8GZF0xxDEjxZdLtwNuhyZxehAKTgy2E8s=;
 fh=peZ5D0tHB/lEcLS7h/PELKCa2thvZbdxQvo0+rlsOWU=;
 b=fP9WKTMfTh1v5FsHgJ45gXBvC+D0rVWzVTaMiYz/3nMtyDTA0gyrZB58g1Wf+0Zv+g
 6EOZ93XgcxGomlKc+WQlDOdSOH58vHakM8t78wTeTdNJUrjom51VDoHhOtoaGU2eMYkL
 NprzwAxf2VBrnhG7kibjw6X+sBfzadU4734IEAqoEaxsZd1+PesY//L2pjOHiRAuXtWe
 aO3RkWWxxqX8N7KD+uDdOys2tBedcaCLz3di5FvKTL9auLDWX1vzX7OYdgoCrK/CbdC6
 B+T42DeVIallIrEhnTyTiEXcGDO+j/8tOcAgDmnMJMYRPA3vYx9fM0NOGLKveWYQyVQA
 CZWw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770289091; x=1770893891; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xi1iokQkGw8GZF0xxDEjxZdLtwNuhyZxehAKTgy2E8s=;
 b=mUwArEEr1fvp1njk9EMru50pWNlAtzg5fWPc7n/sMeYceYYycocio1oXYWKEwTYSKn
 zIc2TV3XYMZweuso9UGiyBRRbrIXwMIgaO040CV2UPCGoRhgRWVlVfeql6Jl6VRq2jPo
 kqRVcect9DqsPajswvlsfn0ry+q1aDl4pk0P7vrnbVGVlKtSjNS8fnKvYTBAPY2+J1ps
 7J3MMRmcZ0UCZxGuZIU5mQhnj6CJxOVQukWHUT3+ivr3cLYsdDj+Y1cAkBthuSf29HH6
 MyjDv+u0Wbet/4pStjxgxWucE0xtk1qjTz81thpnCvypUz2NrbbVWgIzbMspU67n0y5E
 qG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770289091; x=1770893891;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Xi1iokQkGw8GZF0xxDEjxZdLtwNuhyZxehAKTgy2E8s=;
 b=AVKLv873fnMdu3G1GKPT37H5VnQf/ZA+hKasXv5wOMsFce2Ptv5ssUJZOsY2VHU6wF
 Jjs3fcE5Ny06+FCIil9zO47+VSVGNeB/gI4Xx7Gpw5jh8yJOe8ucY/CZNCCG39pQNGAd
 9+fA0twM/WwazIJ+uCcEhj184yyyzZ2xzDN5Nda+FDjbQRzXsY1IE/Uanzvj96ot83r2
 AOuOt9APaHSz0n2lVSE7gvsOZgp1eurAxObJuxCq3D77c9iOVfKbo3woKvXbzYhmzfAH
 c4Pix3RPriyQaAgiZiEwtjcuE3mAo/coGyInNgQyrjl9p/x1F8hbNyUaQmYycmTiN2tM
 MPzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjVYxl5nwVOf19IYgox3ytRoJKfmTd6n+yWOIvXE7C1CaTwcFLZ2nf0FWNq5iAeKags6p3mgY3oA==@nongnu.org
X-Gm-Message-State: AOJu0YybjAmTWwkqBN9lfzZ9oyFcYJZ1o00i3pqJzsVXOis2AG/klnAF
 XKlvxgdBIAwt5pd/7/GEEr4D7+cOBd0ZiUXaeULwhcDrAWnKTzm0g4WwDuebt1Vx8OvuwQXb7XM
 GdAcWkTYscQfgfmJU4ZXy41t3oG5gCEUZ9Tq5y1IQTw==
X-Gm-Gg: AZuq6aIqD93hULnTIXLRAPs6iNVdd1kYzXYH8/sWHjo8RYWEAWNRAyGaSIY6cz2Kmcf
 Dpc3cV+EMh1qYZRCiGpkzrh2ezmjxXkRO/V47JG0zjO/HBSiQT7t6ZnvYL9GmaEROv2lHNdqC/B
 8b/x+XMMXeHQWLVCD8WvXjUD2wES68/MWzx1DeFsvhPqVIX5GwNIoAHq68pR0CmFVXXIege+50T
 mnjrbr41yT4WF7amQESKdlqQZyYLNzpLaNwEXzk9JLv4Zh9p54qQZYt62sr+H7wtXRN56nsfR4V
 1en9
X-Received: by 2002:a05:690c:c190:b0:794:8853:53f7 with SMTP id
 00721157ae682-794fe84fc60mr56277547b3.69.1770289091115; Thu, 05 Feb 2026
 02:58:11 -0800 (PST)
MIME-Version: 1.0
References: <CGME20260203130603epcas5p4dfde087764b1131e855c39ac9ceb0326@epcas5p4.samsung.com>
 <20260203130257.3263336-1-ashish.a6@samsung.com>
In-Reply-To: <20260203130257.3263336-1-ashish.a6@samsung.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Feb 2026 10:57:58 +0000
X-Gm-Features: AZwV_Qh8xYUWFFL590jYYEvEnv-pkCUAabxE_KpJP4kNfDiKiIDUC2N_0xUoxqc
Message-ID: <CAFEAcA-kV4JmjwmbByYAf5ws7No0HP372cjRWsnH6mbZwvouRw@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: Implement WFE,
 SEV and SEVONPEND for Cortex-M
To: Ashish Anand <ashish.a6@samsung.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, saurabh@samsung.com, 
 vishwa.mg@samsung.com, y.kaushal@samsung.com, ashish.anand202@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Tue, 3 Feb 2026 at 13:06, Ashish Anand <ashish.a6@samsung.com> wrote:
>
> Currently, QEMU implements the 'Wait For Event' (WFE) instruction as a
> simple yield. This causes high host CPU usage because guest
> RTOS idle loops effectively become busy-wait loops.
>
> To improve efficiency, this patch transitions WFE to use the architectura=
l
> 'Halt' state (EXCP_HLT) for M-profile CPUs. This allows the host thread
> to sleep when the guest is idle.
>
> To support this transition, we implement the full architectural behavior
> required for WFE, specifically the 'Event Register', 'SEVONPEND' logic,
> and 'R_BPBR' exception handling requirements defined in the ARM
> Architecture Reference Manual.
>
> This patch enables resource-efficient idle emulation for Cortex-M.
>
> Signed-off-by: Ashish Anand <ashish.a6@samsung.com>
> ---
>
> Changes in v3:
> 1. Changed event_register from uint32_t to bool, as it's architecturally
>    a single-bit register. (Alex Benn=C3=A9e)
> 2. Refactored nvic_update_pending_state() to accept VecInfo* and scr_bank
>    as parameters instead of recalculating them from irq/secure. (Peter Ma=
ydell)
>
> Link to v2 - https://lore.kernel.org/qemu-devel/20260121132421.2220928-1-=
ashish.a6@samsung.com
>
>
>  hw/intc/armv7m_nvic.c      | 114 ++++++++++++++++++++++++++++++-------
>  target/arm/cpu.c           |   6 ++
>  target/arm/cpu.h           |   7 +++
>  target/arm/machine.c       |  19 +++++++
>  target/arm/tcg/helper.h    |   1 +
>  target/arm/tcg/m_helper.c  |   5 ++
>  target/arm/tcg/op_helper.c |  56 +++++++++++++++---
>  target/arm/tcg/t16.decode  |   5 +-
>  target/arm/tcg/t32.decode  |   5 +-
>  target/arm/tcg/translate.c |  29 ++++++++--
>  10 files changed, 212 insertions(+), 35 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 28b34e9944..0be8facb8e 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -221,6 +221,29 @@ static int exc_group_prio(NVICState *s, int rawprio,=
 bool targets_secure)
>      return rawprio;
>  }
>
> +/*
> + * Update the pending state of an exception vector.
> + * This is the central function for all updates to vec->pending.
> + * Handles SEVONPEND: if this is a 0->1 transition on an external interr=
upt
> + * and SEVONPEND is set in the appropriate SCR, sets the event register.
> + */
> +static void nvic_update_pending_state(NVICState *s, VecInfo *vec,
> +                                      int irq, int scr_bank,
> +                                      uint8_t next_pending_val)
> +{
> +    uint8_t prev_pending_val =3D vec->pending;
> +    vec->pending =3D next_pending_val;
> +
> +    /* Check for 0->1 transition on interrupts (>=3D NVIC_FIRST_IRQ) onl=
y */
> +    if (!prev_pending_val && next_pending_val && irq >=3D NVIC_FIRST_IRQ=
) {
> +        /* SEVONPEND: interrupt going to pending is a WFE wakeup event *=
/
> +        if (s->cpu->env.v7m.scr[scr_bank] & R_V7M_SCR_SEVONPEND_MASK) {
> +            s->cpu->env.event_register =3D true;
> +            qemu_cpu_kick(CPU(s->cpu));
> +        }
> +    }

I looked a bit more closely at the SEVONPEND language in the Arm ARM,
and it says

# When SCR.SEVONPEND bit associated with a security state is one, interrupt=
s
# transitioning from the inactive to the pending state that target that
# security state are wakeup events.

So the thing that determines whether we are looking at the S or the NS
SCR.SEVONPEND is "does this interrupt target S or NS security state?".
We have a function for that:
 exc_targets_secure(s, irq)

So we can determine which SCR to look at in this nvic_update_pending_state(=
)
function and we don't need the callers to pass in scr_bank to us.

exc_targets_secure() requires it to be called only for a non-banked
exception, but we can call it only inside the irq >=3D NVIC_FIRST_IRQ
condition, as all interrupts are non-banked.

This should simplify the changes you're making at the callsites.

thanks
-- PMM


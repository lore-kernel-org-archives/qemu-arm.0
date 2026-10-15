Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C67CC6B3C
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 12:55:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHKz7-000395-H7; Thu, 15 Oct 2026 08:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHKz5-00038e-3G
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:54:59 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHKyz-0001fh-2V
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:54:55 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-8b09e07e149so20696047b3.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 05:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792068892; cv=none;
 d=google.com; s=arc-20260327;
 b=LcSxJSJvQAuu+SHMMHUn2SOGAA6Os97/9R+/CdF/aaglmh1CZ0dJtXRppd+kNARPQs
 CHKxcddULQzpfE/JAI+/CPKUIKMYaYG/Mlkld6G5ZSSYvP0ymiGgelCFYUGSRGmJVuqE
 VvhwkdPw2oLK/6Xv3fpMzzI6d7aIUJcmsLBx4rRyZlIMNhXM0OdG9bwfMQ6D34o5pyym
 IAiQD+3y39HrJ+oGOMBYKLo65GKhUeyTj7HHPUYRYYThM6a35gySEMf6PoU4PgjCBKxj
 caMYFEDb5P99FVzn6KfqmMy+1BNMYq2CIvX8kfrSzrm4h6LnDNeFWC0mSh9MxGma20nU
 3YkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=EzHAMvP9BxKQxCHJGe87zu+8IsD+1Q9fbM0xhQ1SsW8=;
 fh=c0+vsn/z0lkmAV98qpyM5NNxRbaOm2y1c5C4JPWlypE=;
 b=r6ajQzzncyA4bDtQTiXvk4sefFzbXXuj7hrV6xNT6rMUbfwB6V8rWm6prSdzrteN1m
 iTJXRn9nu++vuTt4mybsg6m0XH08TE6WaBB68p0K8ph5S2K1Q3dADOks9zoCtTLedPgP
 R4aUxuxspDM+BzyHqADdNccxyOQevDHV93x1GQA9Us4JQ0uPlwzj17f+8akeTJpZHWUe
 0igt5AJJAkDuyxOGuLlZ0/e7b59wMzOe7qtrxsiDjm72huLFpK8HtXHL4oMPONMRkvhb
 2Ph9XwKtCVtHGGfZvUrFP6lcJ6DRDaek2zoGMAz/T9We5jHvWN/9o+HObF4msjNi2jDy
 oKjw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792068892; x=1792673692; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=EzHAMvP9BxKQxCHJGe87zu+8IsD+1Q9fbM0xhQ1SsW8=;
 b=L5LvsI8bxBji7Xvq+grAcNACyREZj5vSTRZwfnTVR7ZGCBlGeIFMUpdistFmwZ31DY
 nIamRTgZEWRzBxJTDCviKe/FIWI5iuRRY4q4x1VfTiejUXN+BL5YgAbKRbw1yDl4zLln
 657hy7XrV7vfgK+7jxEikCg8nuQ07u/qC+PtBBnzn0kqm3ScpqGlSkJ69OMG9iJqevsj
 fXniTiX5B3gX5duoLPkQiKyq2RPMn7bkqkwaUCgJKsg/1RL8R9dMtCqAaaPI8wAzmJkC
 zk58YyZMHeik1v4g2uyGP3egnos0aO05drUPRsPl4nh1qeiwpdoSg2ENr3FB8YKkaeC5
 mtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792068892; x=1792673692;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=EzHAMvP9BxKQxCHJGe87zu+8IsD+1Q9fbM0xhQ1SsW8=;
 b=PiY8/rggnicbcYsrYn07nGoEWCoSdof8GYyvs3Uaw25qh4JdrAZQycsB75xvM4QMM8
 BRQVLKhxI2y/FB9kEpq5kmoBVh/xFoNtxS42SEbewt/jTvMnMVURRme54Qa9J/atwoQZ
 5MEVy7YtrDufPWCg/42RmqY335ipFSyGBUihZCZZqVEuRrVuumIp89Xi0V/Dfo/gofjc
 ezD+K/PuPN8GWWr/QMuATVhywwOUgjPcyV8v8tIPq6jhNjtlvRuVpjiTrtZ5z86BLqmn
 7OaPLjoF+SDh3kSWwg5pM8Y292IIg2cakey3++eH/uPOYwEGAe9eL3mLN6znxkHIryJq
 +X/g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxO/cDMOdZ7B51iXsfbCULIU2AHHP8G7c6LsIKiJxOFlPf5vXMkbcswoAn7HYeQvm5HRgYRNWBCgA==@nongnu.org
X-Gm-Message-State: AFq9FYKHJtPS1V29Qrv3OGuiothd8hCDxI3YwxEMu5iiUrbSsQT08QZf
 Rj7Qvnq9XyJG6o1NN9l7Dfa9cpdM6AdEn9kgd05MXjJ+7UV51n7ATNmypjOWKFyVyYgvYUjOxyP
 mCql8Jv7cRmG44dgmHJlH7shk1z8YzpF18PR7xrNQkw==
X-Gm-Gg: AYBFou1ISebhGl6sKJvOdCbCUdt4dXOZWoTOmf9Lxg+y9EEuiLI68/B3q+bZzKhgo/P
 OJxEB3211QA73ji8l1d/xigzoOhi2tKjEbE2yfzR8N45/z28vts8/o6mu9+859hMiRqEXefO8ko
 u6nZyGXNjEFRRUi7OgJ5AhJh5UHqUP7V6qS1AbSib40Kmn7DCUgMsZQo6wZRMFxrs+EityIGuti
 0/1SPo2mrH+fIWh0LqQ2EreF0o8v1YsfncHLVoKpVqmH6pnqFwY9XdX6kMdK6AQ2n99xPV3Rv3m
 xata5xT35FxNWS+h2MsWeH8lk0FAAtE5QDLtp3aG/m6x/de9qVIK9/GjpcMoK+kdKuS2IkijpAG
 BduPOO7yBK3YitbaP33vTVI+hHhtJzVxPfv8GFBs=
X-Received: by 2002:a05:690c:f8d:b0:8b0:df71:44d1 with SMTP id
 00721157ae682-8b0df71509emr1685087b3.6.1792068891512; Thu, 15 Oct 2026
 05:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260725012635.4925-1-marcelomanzo@gmail.com>
 <20260725012635.4925-2-marcelomanzo@gmail.com>
In-Reply-To: <20260725012635.4925-2-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 13:54:39 +0100
X-Gm-Features: AclHuK9BQS61E8q2PCnlho8Nn1K7oVpfy1_mNMXy_HbmrCnrQCo9yrWfUGcvvl8
Message-ID: <CAFEAcA8H0iD5ps-CigPxyOBLE_hLCekrzmP_ySEs5uqLGLHsyQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/misc/bcm2838_rng200: add BCM2838 RNG200
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Sergey Kambalin <serg.oker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Sat, 25 Jul 2026 at 02:26, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> From: Sergey Kambalin <serg.oker@gmail.com>
>
> Add the BCM2838 (BCM2711/Raspberry Pi 4B) hardware random number
> generator: register model (control, FIFO data/count, int
> mask/status), a Fifo8-backed entropy buffer refilled from a
> qemu_rng backend on a ptimer tick, and interrupt generation once the
> FIFO crosses its configured threshold.
>
> Part of Sergey Kambalin's original Raspberry Pi 4B series (patchwork
> series 829638, posted to qemu-devel in 2024, never merged). Ported
> to current master by Marcelo Manzo: header paths moved under
> hw/core/, class_init()'s const void *data, the Resettable phases
> API, Property[] losing its DEFINE_PROP_END_OF_LIST() sentinel, and
> fifo8_pop_buf() gaining a caller-supplied destination buffer instead
> of returning an internal pointer (adapted bcm2838_rng200_read_fifo_data()
> to the new copying API, which QEMU's own fifo8.h now recommends over
> the old fifo8_pop_bufptr() this code originally used). No functional
> change otherwise.
>
> Boot-tested: guest probes it ("iproc-rng200 fe104000.rng: hwrng
> registered"), /dev/hwrng exists, and reading it returns real random
> bytes.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>

This patch mostly looks good, so the below is all minor stuff.

> +static const VMStateDescription vmstate_bcm2838_rng200 = {
> +    .name = "bcm2838_rng200",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(rng_fifo_cap, BCM2838Rng200State),
> +        VMSTATE_ARRAY(regs, BCM2838Rng200State, N_BCM2838_RNG200_REGS, 0,
> +                      vmstate_info_uint32, uint32_t),

There's a VMSTATE_UINT32_ARRAY(), which is the simpler way to do this.

> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static bool is_rbg_enabled(BCM2838Rng200State *s)
> +{
> +    return FIELD_EX32(s->regs[R_RNG_CTRL], RNG_CTRL, RBG_ENABLE);
> +}
> +
> +static void increment_bit_counter_by(BCM2838Rng200State *s, uint32_t inc_val)
> +{
> +    s->regs[R_RNG_TOTAL_BIT_COUNT] += inc_val;
> +}

This function doesn't seem like it's really adding anything
compared to opencoding the addition in the one place we use it,
especially since that function's style otherwise is to open-code
s->regs[] accesses.

> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index c9a868b3..90e178ed 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -442,3 +442,13 @@ iommu_testdev_dma_read(uint64_t gva, uint32_t len) "gva=0x%" PRIx64 " len=%u"
>  iommu_testdev_dma_verify(uint32_t expected, uint32_t actual) "expected=0x%x actual=0x%x"
>  iommu_testdev_dma_result(uint32_t result) "DMA completed result=0x%x"
>  iommu_testdev_dma_armed(bool armed) "armed=%d"
> +
> +# bcm2838_rng200.c
> +bcm2838_rng200_rng_soft_reset(void) "RNumG soft reset"
> +bcm2838_rng200_rbg_soft_reset(void) "RBitG soft reset"
> +bcm2838_rng200_enable_rbg(void)     "RBitG enabled"
> +bcm2838_rng200_disable_rbg(void)    "RBitG disabled"

We don't generally try to line the start of format strings up in trace-events
files (it doesn't work if you need to add something else later as you end up
either breaking the line-up or else having to edit more lines than just
the one you needed to change).

> +bcm2838_rng200_update_fifo(uint32_t len, uint32_t fifo_len)    "len %u, fifo_len %u"
> +bcm2838_rng200_fifo_full(void) "RNumG FIFO full"
> +bcm2838_rng200_write(uint64_t addr, uint64_t value, unsigned size) "addr: 0x%"PRIx64" value: 0x%016" PRIx64 " size: %u"
> +bcm2838_rng200_read(uint64_t addr, unsigned size, uint64_t value) "addr: 0x%"PRIx64" size: %u value: 0x%016" PRIx64
> diff --git a/include/hw/misc/bcm2838_rng200.h b/include/hw/misc/bcm2838_rng200.h
> new file mode 100644
> index 00000000..05bc87fa
> --- /dev/null
> +++ b/include/hw/misc/bcm2838_rng200.h
> @@ -0,0 +1,42 @@
> +/*
> + * BCM2838 Random Number Generator emulation
> + *
> + * Copyright (C) 2022 Sergey Pushkarev <sergey.pushkarev@auriga.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef BCM2838_RNG200_H
> +#define BCM2838_RNG200_H
> +
> +#include <stdbool.h>

Don't include standard headers -- osdep.h pulls them in for you, and
every .c file starts with including osdep.h, so every .h file has
them available too.

> +#include "qom/object.h"
> +#include "qemu/fifo8.h"
> +#include "system/rng.h"
> +#include "hw/core/sysbus.h"
> +#include "hw/core/ptimer.h"
> +#include "hw/core/qdev-clock.h"
> +#include "hw/core/irq.h"
> +
> +#define TYPE_BCM2838_RNG200 "bcm2838-rng200"
> +OBJECT_DECLARE_SIMPLE_TYPE(BCM2838Rng200State, BCM2838_RNG200)
> +
> +#define N_BCM2838_RNG200_REGS 10
> +
> +struct BCM2838Rng200State {
> +    SysBusDevice busdev;
> +    MemoryRegion iomem;
> +
> +    ptimer_state *ptimer;
> +    RngBackend *rng;
> +    Clock *clock;
> +
> +    uint32_t rng_fifo_cap;
> +    Fifo8    fifo;
> +
> +    qemu_irq irq;
> +
> +    uint32_t regs[N_BCM2838_RNG200_REGS];
> +};
> +
> +#endif /* BCM2838_RNG200_H */
> --
> 2.47.1

thanks
-- PMM


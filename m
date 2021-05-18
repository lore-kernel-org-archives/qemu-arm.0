Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp433775lfm;
        Tue, 18 May 2021 06:52:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydwo40opY00m+N+U6sMCIttw18s3k6ewRfTdKw9VTlrWlkhPPvTh2uF6rNCtg/c56kLeXx
X-Received: by 2002:a92:c243:: with SMTP id k3mr4533117ilo.81.1621345954198;
        Tue, 18 May 2021 06:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621345954; cv=none;
        d=google.com; s=arc-20160816;
        b=pAwlwshkMyX+23iLIaTh+cPFRKjhSt4ah1h6+4+oAzgT4eQPa3CRXU+szbiHKqhs43
         YRVpZVEmR3CJ+7rHjY5kLOtwBNidxDtF8j7qxU9r9PRk8PZ31uJQeM0p3i1eUgqgRL3B
         wWtRsYLtfjgITbB2/AC/zgyYvM8nIM9MW8BIf96ygwO6SY8SjcPH80CmZlbUMQ4lbMeJ
         PTN3sOQu009Vm6lolhg9QVX35y/nn03+jeQhX2irtnObkEswTI4ceNmHSYCE8fRHzROy
         gLZRvsD1noPVyAMu0LfQG8pFQHAxdde0yUZCJc8QkJZP+8xU7oxvL09ftpwC2GoAJucJ
         mnGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ja/d/Q+97Zk6pXltEKTyRT3wk4Xx8CBnNgj3Zz9dhMA=;
        b=CesyUp/GRr3hK3rK9f5LcXz30GvYdPAZyefG6svaUiHrpDoIQVCdK8nV/+6J/zGhb7
         ylhk4p0G1bFseEchC3q9ZxoNNEoGa9gzgRh0K3EA1scp/1QWLB9psQZKHn05Dp5eEkL6
         uAEBm3CGt2ok95+VoR16PL8kngcBIquGNBgAMm/PwGaTgxJtLyGGAHTHF8WJAFPsG7ZB
         G2Rk0m3i9b10ltGmcjfrxzy4BkKHlaG0+QSpzTHip3X0/d8gRaGhbWW3T6s66VuL+SDr
         aZ1oRfhpTRVxcq/BeUMZHEODN6XRTDcM5kH0sC1C8FVVOjZ7GHo1i4SyGhUPBuCD2Oi2
         TBQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tJkFsfjI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si21472805iov.92.2021.05.18.06.52.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 06:52:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tJkFsfjI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj09B-0005G1-GR
	for alex.bennee@linaro.org; Tue, 18 May 2021 09:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj092-0005BM-2r
 for qemu-arm@nongnu.org; Tue, 18 May 2021 09:52:24 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj090-0005Gl-6r
 for qemu-arm@nongnu.org; Tue, 18 May 2021 09:52:23 -0400
Received: by mail-ej1-x62c.google.com with SMTP id n2so14680534ejy.7
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 06:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ja/d/Q+97Zk6pXltEKTyRT3wk4Xx8CBnNgj3Zz9dhMA=;
 b=tJkFsfjIzMGLqrorgI1P4wRHJQ0sL43K1p+o/9cPBVAioj0Aj3K+byG8nBPhnWCC2j
 bkj0ZXNCt7S5QVe8hMYt3IsLKs8D764JN8WeJT5Xx8rIqMsSNCnxG1BiJGjN43M3x01i
 0HGVenQKeiVfAtRfZyWHFiiZWnIKoggBsvkiNfC/6GDZIKkb2yzlFktLwH7Q5DInS6a+
 c5u95+eDOrewrl6f+S/jzhitX/zp8BkOKXAo5vgSTbOe6Tzg1ICR0+4sB3LI9rNmYkmC
 DBb2J+Vye61tJ4nTgTegzV0vZCDogdJu9BE6m41ur1P4lw0TvIJ3msOduRhyswI1rhwx
 L1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ja/d/Q+97Zk6pXltEKTyRT3wk4Xx8CBnNgj3Zz9dhMA=;
 b=uIaTALrczhuC3Rb8ePNDuIhtqSoiJo0ENfw/TjNV4JzhY/AAOgT5Iz+f5cgVA5KVKt
 dlPVCblbbKvXXMnLtWk/Gz97csKUngjEK72txz94lKNvp8wQm/5/UWkq+PiW+isX7/AJ
 J0a6tnVvKnit1lCf0zWKkoQ2UIZ70NHjvFfQ3H/CnwrS7hpaLP5ybFvYg6k6T8jescWI
 +OBcVa/11Hq07I+6o75uPqDXe4/AIZmqppbOIXp37PNxkmlRyiLpXfUcXenvhAzuG/J8
 IzbAoMOKxgNWNTQ5KeWxcAhqjwqaBrZ42eeAywna+nyZauCbRc3CRjLFJ1DZbOh3MGQz
 4DUg==
X-Gm-Message-State: AOAM530gBVZLds7+t2hB4DpM3Cwq3bK7gk3T4nQd5EUmCM+CtfE2+rri
 scVTaXAfDMTbK7Nf8PT4H0Orf/aOPWP4kPCfXyCn6A==
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr6229605ejb.56.1621345940649; 
 Tue, 18 May 2021 06:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <20210429234201.125565-2-shashi.mallela@linaro.org>
In-Reply-To: <20210429234201.125565-2-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 14:52:04 +0100
Message-ID: <CAFEAcA_PGXKWy-u-cdOxEf+govTO1fLCoT0RRPQAyh=BkibnJA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] hw/intc: GICv3 ITS initial framework
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q8jMGSfgZmHS

On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added register definitions relevant to ITS,implemented overall
> ITS device framework with stubs for ITS control and translater
> regions read/write,extended ITS common to handle mmio init between
> existing kvm device and newer qemu device.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c                | 239 +++++++++++++++++++++++++
>  hw/intc/arm_gicv3_its_common.c         |  11 +-
>  hw/intc/arm_gicv3_its_kvm.c            |   2 +-
>  hw/intc/gicv3_internal.h               |  88 +++++++--
>  hw/intc/meson.build                    |   1 +
>  include/hw/intc/arm_gicv3_its_common.h |  10 +-
>  6 files changed, 331 insertions(+), 20 deletions(-)
>  create mode 100644 hw/intc/arm_gicv3_its.c
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> new file mode 100644
> index 0000000000..7b11330e01
> --- /dev/null
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -0,0 +1,239 @@
> +/*
> + * ITS emulation for a GICv3-based system
> + *
> + * Copyright Linaro.org 2021
> + *
> + * Authors:
> + *  Shashi Mallela <shashi.mallela@linaro.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at your
> + * option) any later version.  See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/intc/arm_gicv3_its_common.h"
> +#include "gicv3_internal.h"
> +#include "qom/object.h"
> +
> +typedef struct GICv3ITSClass GICv3ITSClass;
> +/* This is reusing the GICv3ITSState typedef from ARM_GICV3_ITS_COMMON */
> +DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
> +                     ARM_GICV3_ITS, TYPE_ARM_GICV3_ITS)
> +
> +struct GICv3ITSClass {
> +    GICv3ITSCommonClass parent_class;
> +    void (*parent_reset)(DeviceState *dev);
> +};
> +
> +static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
> +                               uint64_t data, unsigned size, MemTxAttrs attrs)

Your indentation on function prototypes is still messed up; please fix it.

> +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> +        /* set the ITS default features supported */
> +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
> +                                       GITS_TYPE_PHYSICAL);

More odd indentation. Second lines of function calls etc should line
up with the first character after the '(' on the first line.
Please fix this through the whole patchset.

> +type_init(gicv3_its_register_types)
> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
> index 66c4c6a188..b4dddb16b8 100644
> --- a/hw/intc/arm_gicv3_its_common.c
> +++ b/hw/intc/arm_gicv3_its_common.c
> @@ -50,12 +50,13 @@ static int gicv3_its_post_load(void *opaque, int version_id)
>
>  static const VMStateDescription vmstate_its = {
>      .name = "arm_gicv3_its",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
>      .pre_save = gicv3_its_pre_save,
>      .post_load = gicv3_its_post_load,
>      .priority = MIG_PRI_GICV3_ITS,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(ctlr, GICv3ITSState),
> -        VMSTATE_UINT32(iidr, GICv3ITSState),
>          VMSTATE_UINT64(cbaser, GICv3ITSState),
>          VMSTATE_UINT64(cwriter, GICv3ITSState),
>          VMSTATE_UINT64(creadr, GICv3ITSState),

You can't change the vmstate like this, you break migration compatibility.
Why are you deleting the 'iidr' field anyway ?

If we do need to remove the 'iidr', there is a mechanism for saying
"ignore the UINT64 we get from a migration source, we don't need it".
If we need to do that it should be a standalone patch at the start of
the series.

> @@ -51,7 +56,7 @@ struct GICv3ITSState {
>
>      /* Registers */
>      uint32_t ctlr;
> -    uint32_t iidr;
> +    uint64_t typer;
>      uint64_t cbaser;
>      uint64_t cwriter;
>      uint64_t creadr;

This will break compilation of the KVM support code on aarch64 hosts,
which is still using the 'iidr' field.

thanks
-- PMM

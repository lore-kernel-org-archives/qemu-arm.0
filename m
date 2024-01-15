Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp272380ejf;
        Mon, 15 Jan 2024 06:20:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEG30yOlmyNjfNwNdrhtzj3xwNFCbtB4iVEdvhZJcUzYhAw6UGHnR5SRUCH41El4ZhW+p/3
X-Received: by 2002:a05:620a:d85:b0:781:e452:e33f with SMTP id q5-20020a05620a0d8500b00781e452e33fmr6721003qkl.100.1705328417611;
        Mon, 15 Jan 2024 06:20:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705328417; cv=none;
        d=google.com; s=arc-20160816;
        b=HLzUb5wgpbDKZFH+35cWRRvue3dPH2elYUMx+t0M4J/7yt6CzizUsJ3aONGEB/c4ZO
         ElYnS+vi1Prt/hTa/vsoERGd/mMDAgKIh3S8EXxKj2Ip4F48wXeb5YzEZizizGmFqBfy
         aix6YWAN2swY5eBHHMtXU4iVjrw0CmqtSlGJXS1ZxFfyxcUHGCrJtnYl8PJXTX5ufY7B
         8Ni2mM4fqDCSE8yQgOEFT2gshid6bAZiL5nssPLVgJFzpJM9q572LqdAcPteLtpK5U88
         FQWO2ZGwesPblbfVThccAC0KCx6lII6LcKdcc/TnPv/ig8wAmSLaLpspPTixtQsXJMvO
         5YIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=RocVOM2E5OVyv8T7N6cot2XBmdVPKoRvT9l6F16ZNdY=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=EMpT4MukJbg/ZXOsLVe3WOkmfyDZANzSuoFP39Q7gmRORif3zlWGgQ8h2A2HG2wv8X
         Qa9RkRI3hN7pKJNnyuF2CM078HsKzP64lv3SYJHyZv0g8jKCd3nplPM8yAqXNHMTCTzF
         YWUFRYssuayFVIRxyuBH5jSmCWnwG0a+sBqZrrYKP3dUKG75Bsq1btEfKs1866uJg7G3
         lvXHZ2VQ9qm8h83cyqOTpHZwsic+WeS3O2I35y3Sg4g+oKuPitXAK6nPmsbE5Up62Dok
         8WylUk03T8AVhKyKD+n4Dx0guTAXEKWk3tSR6Lgr3q06Rw22gsH+0258aJlBtEKgiS/C
         SyCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TEKU1ptg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q26-20020a05620a0c9a00b007832b15c5b7si7736466qki.719.2024.01.15.06.20.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 06:20:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TEKU1ptg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPNow-0005ZD-Io; Mon, 15 Jan 2024 09:20:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPNou-0005Yu-T2
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 09:20:08 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPNor-0000f4-3M
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 09:20:07 -0500
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cd0d05838fso99025961fa.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 06:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705328402; x=1705933202; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RocVOM2E5OVyv8T7N6cot2XBmdVPKoRvT9l6F16ZNdY=;
 b=TEKU1ptg+gSjrHqRAvFTUWQcrQ+UxDKgqx/ukEhTTrDDJw7eIfPlI0dK9S2XaMU2PV
 0tBpeIL/cW+S+EVTWDLq1Sl5njQYcACk7/qHyG0rKP2Mkd+MgXpN87qVd71coEQjLkGX
 nRyAziDlqE5xlTRile56sWcKWHd3pkrUufrIdePPsW7ImOsh9RvBJaLe1VRMPscwUZCO
 Xar92srWOiTTXdfUkKv5pWTzKdpA562n9qk44T0nAYZYawPRCpAXuSxksfcszMxaL0JY
 keVOYPN30ovOj4uo3pAycYbb34bMiesHYqIS+yaVkOWqziXm9MQRYIDtu1lLFn5J75+1
 AhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705328402; x=1705933202;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RocVOM2E5OVyv8T7N6cot2XBmdVPKoRvT9l6F16ZNdY=;
 b=QvbRqwJAkX9aMa/Da1NUqcb5OFt1KBzgdXhc0xTnmJ4JOXTRPl99bGCwTdin1GqyKc
 lfeZ4P08Cj2KxdrSOFSAeytWCLJZO7wayw4NGwb2FIPD7JgS303QhkyDOUjvDSnXGmG/
 QSPmBB91xkv6b/bZ0FGkEby517DBnlLhCoIe9pPdtml4EQT5WAa8YQMwqEH4OPly6EM3
 2+jejd9gDDrwNnQfvl9BIQDANhyEWizE5C87EUxLVHGBP1EqEFB0UmJksCsEts42Wma6
 L1q+MgPPbGREgMlMqQMoSRu7nAosMC75QApAlOFS0OCtDs8DIx03hh+x2Vvy7TyOqYPs
 qnnQ==
X-Gm-Message-State: AOJu0YzuIR/3wUWD58v67+n2w9WX1IwVFsaJUQUzOrxLgjtKL4iwxVKK
 3xoEerIp7W7qe79ce4bM2hND7HhzF9phA8n/OCcZLs5W6pD+Lw==
X-Received: by 2002:a2e:5c44:0:b0:2cd:1d6e:74c9 with SMTP id
 q65-20020a2e5c44000000b002cd1d6e74c9mr2274120ljb.48.1705328402214; Mon, 15
 Jan 2024 06:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-18-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-18-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 14:19:50 +0000
Message-ID: <CAFEAcA95Ou+8RNyTQ5X_Lmibq2TcyhU+pO-fA9w0u+1NH1B6EA@mail.gmail.com>
Subject: Re: [PATCH v4 17/45] Add RNG200 skeleton
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KjQZeWjiY9Dt

On Fri, 8 Dec 2023 at 02:33, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/misc/bcm2838_rng200.c         | 152 +++++++++++++++++++++++++++++++
>  hw/misc/meson.build              |   1 +
>  hw/misc/trace-events             |   9 ++
>  include/hw/misc/bcm2838_rng200.h |  51 +++++++++++
>  4 files changed, 213 insertions(+)
>  create mode 100644 hw/misc/bcm2838_rng200.c
>  create mode 100644 include/hw/misc/bcm2838_rng200.h
>
> diff --git a/hw/misc/bcm2838_rng200.c b/hw/misc/bcm2838_rng200.c
> new file mode 100644
> index 0000000000..8f64e6a20f
> --- /dev/null
> +++ b/hw/misc/bcm2838_rng200.c
> @@ -0,0 +1,152 @@
> +/*
> + * BCM2838 Random Number Generator emulation
> + *
> + * Copyright (C) 2022 Sergey Pushkarev <sergey.pushkarev@auriga.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/misc/bcm2838_rng200.h"
> +#include "migration/vmstate.h"
> +#include "trace.h"
> +
> +static const VMStateDescription vmstate_bcm2838_rng200_regs = {
> +    .name = "bcm2838_rng200_regs",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(ctrl, BCM2838_rng_regs_t),
> +        VMSTATE_UINT32(int_status, BCM2838_rng_regs_t),
> +        VMSTATE_UINT32(fifo_count, BCM2838_rng_regs_t),
> +        VMSTATE_UINT32(fifo_count_threshold, BCM2838_rng_regs_t),
> +        VMSTATE_UINT32(total_bit_count_threshold, BCM2838_rng_regs_t),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};

We add this vmstate struct in this patch, but then the
following patch deletes it again and opts to instead
define the registers with a simple uint32_t array.

The trace events are also added in this patch but not
used until the next patch.

Since this device isn't a very large one, I'm OK with
you squashing together this patch and the next patch
if you want, so that there's a single patch that implements
the whole device. That makes the patch more than our usual
preference for patch size, but it's probably less effort on
your end than moving code between the two patches so the
second patch isn't deleting parts the first one added.
(You can do that if you prefer, though.)

> +
> +static const VMStateDescription vmstate_bcm2838_rng200 = {
> +    .name = "bcm2838_rng200",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(rbg_period, BCM2838Rng200State),
> +        VMSTATE_UINT32(rng_fifo_cap, BCM2838Rng200State),
> +        VMSTATE_BOOL(use_timer, BCM2838Rng200State),
> +
> +        VMSTATE_STRUCT(regs, BCM2838Rng200State, 0, vmstate_bcm2838_rng200_regs,
> +                       BCM2838_rng_regs_t),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};

thanks
-- PMM

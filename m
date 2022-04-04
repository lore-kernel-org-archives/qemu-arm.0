Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp289577lfu;
        Mon, 4 Apr 2022 08:47:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNXJUE4ohzWK8C/TpU+5jA7NRHikPOsKdU04me0tf9lNZtXE0VmOcfXgx3RuImKYNrvsuA
X-Received: by 2002:a0d:d886:0:b0:2eb:23c2:20a3 with SMTP id a128-20020a0dd886000000b002eb23c220a3mr588177ywe.170.1649087256456;
        Mon, 04 Apr 2022 08:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649087256; cv=none;
        d=google.com; s=arc-20160816;
        b=ltdg3gQv9kf1yYSvJxVoMDEj720NNTz9VvSnw6NAe2brIgbpW5/Kn/9hiFAoby2sSy
         S3sbL2wf+oNcUjQt9wz8LBFQhV7ys9HBz55pSmVJARL/1bXNmlTJc3qxEwwOmL7KLQJJ
         WlY5zrTeCB9y8TEkU/wIvMx6W7gIKjPSfrIdOlkmR+IbNYg7gnaPZDME3FQ+CCsIa5mo
         nnsRjlZbVmVguYBMu9mIOD8CqOQtl7jJtAANK/LWQl6nlgFtA+FDqNa2TCaGX6VCFckW
         pQltkbF5a4H33x3F3jVQOFAp0ggvhM0CXotsN2m93SEkGo8a4Wjr7Tl0jBP5kw+DMCgq
         Tw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=V9NOnD3vVpSF0JZLEe5MPnWt14DUTgg+N2g8DWuSWEY=;
        b=r+zXy/ImjNbKyrFbbJpMHMkwVt3JtBbyJr4gNq6AXAroLgtpaySdeW00Burb9/hcca
         RxKLdTQIoYUQ9Eh8FVxmmWE5qQdwoDqwxI+s+sw62PBGA9oYbapOuW7XazD5jJM/6+EL
         rEckhyv19RjvktgaAMR1S9jrs8UOF1bS+Kguef8qguWhfm9JOXoHXFwOf5biREMK0BB0
         G4IjZnKNsxGH+q0qJosyKYWfdKEnCP6wQgHDHWOsl21NPQjfFgWFb8zStH1JIe3IjAar
         5KfgunZQ2Z1QgwWU1YWm5UBn7OmE7Cc++2rmt+Cv14TVsACx3REtqgIamyMAhBieJnAX
         we8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lHL+GHh0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2-20020a811f02000000b002e5d98d5676si8695155ywf.9.2022.04.04.08.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 08:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lHL+GHh0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbOvX-0004nF-RM
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 11:47:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv2-0004kt-Eu
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 11:47:04 -0400
Received: from [2a00:1450:4864:20::42b] (port=38873
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv0-0000Rk-Ku
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 11:47:04 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j12so7542983wrb.5
 for <qemu-arm@nongnu.org>; Mon, 04 Apr 2022 08:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V9NOnD3vVpSF0JZLEe5MPnWt14DUTgg+N2g8DWuSWEY=;
 b=lHL+GHh0QL97DP6ASJTVgnwd/Kl1XpiJf7wph62L1RX7yFIXCXndXOn0k6iL7WnKzL
 h1l0g38UY/r0pmCUQ30aT/feCNeMVwLYV/FduVfCbCYLfNSAiR8rVSkrylM1S78/Sh+B
 NGvjHhHnVq8tNmfmrA9FceHDVn3NBQcLBbD5lMD/kfsA3Zps//YnMqQt+631yeA3yE3C
 ty5uulX4tmfGJfkz+tGrfxXvZv7zcIF7qovk8Rv/eBNE5IxE9ZGtzURooTjp4v/HD+u5
 wFqZAEv1/K4UJQ5f0XOyBAH369coOaI//JAUzQV0Bjcy18SOXnCcx8TQt0+OE2ocsLvN
 uH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V9NOnD3vVpSF0JZLEe5MPnWt14DUTgg+N2g8DWuSWEY=;
 b=3eLQxNUoDO140NW0wSjnCV3w79L6dyoF3jzvv1BmJVijmCDywj2JIWQYcAdjItimAJ
 A0wln2v/lg7cf8x97ooEAjEhjHQUAuY9m/atFIr9a7BpCLOYGdEDOdz+cKeF2xGHbg1p
 J2ReSg5tb9A2f4np5kVcHheJ65+cC76GddFGfwdP/rXSrMJo6CLs0Pp0OZGzQNpyuILj
 G212UGz1475bIGgqaO7YHSCftvcK8JL8ccHQgq5uh65knw/D54CEATm9zkRZ/NZtZjK2
 deXw0/1sEVczcOY7booqL9sH2kAaA0oETiqCvCXVSD2z1IPJl7TSpEtX8dPAAH75l3n/
 Cc0A==
X-Gm-Message-State: AOAM5304BEgH9+zhIqzXLmEeSezmNcsj/tbBe26PDdzl0Pvxs+pReNjt
 bDy21wHUiRmtVSpN2QGFtqrc+Ig7f8uXAw==
X-Received: by 2002:a5d:47a1:0:b0:204:9f5:e72f with SMTP id
 1-20020a5d47a1000000b0020409f5e72fmr291561wrb.656.1649087220662; 
 Mon, 04 Apr 2022 08:47:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 00/18] hw/arm: Make exynos4210 use TYPE_SPLIT_IRQ
Date: Mon,  4 Apr 2022 16:46:40 +0100
Message-Id: <20220404154658.565020-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gwnK8e0Skwhg

The primary aim of this patchset is to make the exynos4210 code use
the TYPE_SPLIT_IRQ device instead of the old qemu_split_irq() function
(which we are trying to get rid of). However, the current code is
quite complicated and so we have to do a fair amount of refactoring
in order to be able to use TYPE_SPLIT_IRQ in a clean way.

The interrupt wiring on this SoC is complicated and interrupt
lines from devices may be wired up to multiple places:
 * a GIC device
 * an internal combiner
 * an external combiner
(a combiner is a fairly simple "OR multiple IRQ sources together
in groups with enable/disable and mask logic" piece of hardware).
In some cases an interrupt is wired up to more than one input
on each combiner.

The current code has a struct Exynos4210Irq where it keeps arrays of
qemu_irqs corresponding to the inputs of these devices, and it handles
the "wire interrupt lines to multiple places" logic in functions which
are called by the SoC device model but which live in the source files
with the combiner and GIC models. This series moves the logic to the
SoC device model's source file (because it is really part of the SoC
wiring, not part of the individual combiner or GIC devices) and makes
use of the TYPE_SPLIT_IRQ ability to provide more than 2 output lines
to simplify things so that each interrupt line connects to just one
splitter, whose outputs go to all the places they need to. In the
new setup, these splitter devices clearly belong to the SoC object,
and so they are created as QOM children of it. The Exynos4210Irq
struct ends up unneeded and is deleted.

I have also done some conversion of specific child devices of this SoC
from the old-style "call qemu_new()" to the new-style "embed the child
device struct in the parent state struct". I haven't done a complete
conversion, but only touched those devices where making the conversion
was useful for the TYPE_SPLIT_IRQ changes.

I don't have a datasheet for this SoC that describes all the external
combiner and external GIC wiring, so I have mostly kept the QEMU
behaviour the same as it is currently. In a few places, however, I
have fixed what seem to me to be fairly clearly bugs in the current
handling. (Largely these bugs weren't visible to the guest because
we weren't actually connecting up devices to the affected bits of
the interrupt line wiring.)

I've tested this with a simple Linux image, which I think is basically
the same one as the 'make check-acceptance' test. If anybody has
access to other test images that would be interesting.

thanks
-- PMM

Peter Maydell (18):
  hw/arm/exynos4210: Use TYPE_OR_IRQ instead of custom OR-gate device
  hw/intc/exynos4210_gic: Remove unused TYPE_EXYNOS4210_IRQ_GATE
  hw/arm/exynos4210: Put a9mpcore device into state struct
  hw/arm/exynos4210: Drop int_gic_irq[] from Exynos4210Irq struct
  hw/arm/exynos4210: Coalesce board_irqs and irq_table
  hw/arm/exynos4210: Fix code style nit in combiner_grp_to_gic_id[]
  hw/arm/exynos4210: Move exynos4210_init_board_irqs() into exynos4210.c
  hw/arm/exynos4210: Put external GIC into state struct
  hw/arm/exynos4210: Drop ext_gic_irq[] from Exynos4210Irq struct
  hw/arm/exynos4210: Move exynos4210_combiner_get_gpioin() into
    exynos4210.c
  hw/arm/exynos4210: Delete unused macro definitions
  hw/arm/exynos4210: Use TYPE_SPLIT_IRQ in exynos4210_init_board_irqs()
  hw/arm/exynos4210: Fill in irq_table[] for internal-combiner-only IRQ
    lines
  hw/arm/exynos4210: Connect MCT_G0 and MCT_G1 to both combiners
  hw/arm/exynos4210: Don't connect multiple lines to external GIC inputs
  hw/arm/exynos4210: Fold combiner splits into
    exynos4210_init_board_irqs()
  hw/arm/exynos4210: Put combiners into state struct
  hw/arm/exynos4210: Drop Exynos4210Irq struct

 include/hw/arm/exynos4210.h           |  50 ++-
 include/hw/intc/exynos4210_combiner.h |  57 ++++
 include/hw/intc/exynos4210_gic.h      |  43 +++
 hw/arm/exynos4210.c                   | 430 +++++++++++++++++++++++---
 hw/intc/exynos4210_combiner.c         | 108 +------
 hw/intc/exynos4210_gic.c              | 344 +--------------------
 MAINTAINERS                           |   2 +-
 7 files changed, 508 insertions(+), 526 deletions(-)
 create mode 100644 include/hw/intc/exynos4210_combiner.h
 create mode 100644 include/hw/intc/exynos4210_gic.h

-- 
2.25.1


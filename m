Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3B9C624D0
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 10:23:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1i7l-0001rO-87; Wed, 02 Sep 2026 06:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x1i7X-0001eM-Ko
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 06:23:12 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x1i7V-0006o2-Oq
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 06:23:07 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-49b8687630fso6605905e9.3
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 03:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788344583; x=1788949383; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=oHhC+Dy7z0A9DvfUjOcIXs/AZONrXynxz8OTOeYjHg8=;
 b=zsAlXIH3r0qphdJvqds3kSAMcytaL0UWFjJ0p7oywfIFPcJwgpi5u9E50A4LGXOdyO
 FRRkeAVcd/QSfNUgwbvb9x81GMuqQ7z3xudv7YwlMCytEKBYgkQWzyz4pIEzwrtoqNI6
 RujrOdVHjQBxO8Oa05i1oM640YzUFiMk2cmmFAViSzCTi6LLCGnvOUBifLVC95BcOlQn
 wA2oW34NOwvFSn3N/3h6lwHN+0ZUnJ6mZ2WdMiBjcZPm1osf2d1DwGjIOiCdFsj+4g/X
 JR3Ec7BGTyhrwOOPWWuZSiUYCoXNx5AMMO4u0Z5NjO7ozrADrv3ttx2rqNwbOieGlRNv
 4Ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788344583; x=1788949383;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=oHhC+Dy7z0A9DvfUjOcIXs/AZONrXynxz8OTOeYjHg8=;
 b=p8+D/PCq/YZ+A/Ogv63XPvgz35lHo5Tszo9P4zIqp4WgPHCWEL4R891JlBlucVeCnN
 Gifw325op21DpBE0nMnzfubwV2Ei8Q3ovv10dLLBIGgdoZ7y/a4BVwLjrpRJ9j3wE2Hh
 c4K3X1nI7wY9E3VovN0Oyh9s23bCyfQctRcehNPtSq2AMm82Os38+qGsgYuY06I0Fru4
 WH7veHLGw5NDp5/5bvpC+ZjT7S/7i9p3nwNuRdgI46O3LlaayB/icBv8ncccawuOuJmT
 vHCZ3lnfS2aMb6vcmbxRaUp2su58e5lQXa9K2fM3Zd+Ddq7xiY0ostziyOKK8ZMRRy1t
 eLnQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrrdqEnNYnHUpm01NlQydVrTrnlarUTcIVJ/0YECfG7lpo9iZCzL8oan2yo+capykrFnVtNWy4W0A==@nongnu.org
X-Gm-Message-State: AFuF++nB8zSSjcxvnz17vH+bQT2HNGUnCJvVB0hSxA6Gvl4tW2IhKDNR
 IgMQMGoXMY4HU+gBYQHgnbZovQZrOXFmsajVSgYq4DOdo9zOUfcsZUqzlxnhEQ0WQ1I=
X-Gm-Gg: AR+sD11lvM20/4GNuKR8UBM/R8LV32VqAj/rMh6dUMPEylCi0E6RHHUTZ3akJl1xmeZ
 mbSbzpBwJN9t2WSB80NcRnAdgWutJxRXJsHuBldGSTqq7lkEBKXps1CviRAwOuRBQCAIfi/J8D4
 5pq3D14CI7BzewNjhFlVXn21NmqeBT2QMyNVkW1PrCpn59mI72gWd3fnBM4Hq4WO/FH/v/u+Ukc
 iLTN3yfEKRC4lDDgWi8d20QUxcExUPgzhJlrdOrkLIlq5VJq4CAxPV2NebGG6nzVeln1pOfClBz
 bqcgcEAkx33vHXxcu8RnhcU5JFb/mCG/MmPLXjSzLiiPSf6s6cqYhhZOXcGObqEwnClapwQq/Qp
 OWdkjWoFlP/WYOx71sZ7TMcwJ6sqyVHQ1/sjJioSrW7xwOXiSJIXi4FfWRkxkwH+ipwNE11EnGT
 nVG0z+6GKoeQ6p4F6EXXktg4K/PLIRsXXwE1kAvC9Zkd0OIbOwo329LJyyxz1Q
X-Received: by 2002:a05:600c:1d11:b0:49c:c0d4:53d9 with SMTP id
 5b1f17b1804b1-49ce582a54amr63932265e9.14.1788344583405; 
 Wed, 02 Sep 2026 03:23:03 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce46422desm56080955e9.1.2026.09.02.03.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 03:23:02 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 40F715F85F;
 Wed, 02 Sep 2026 11:23:01 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Fabiano
 Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH RFC v2 07/30] hw/misc: add RP2040 TBMAN and voltage
 regulator
In-Reply-To: <20260829234308.33725-8-gilles.grimaud@univ-lille.fr> (Gilles
 Grimaud's message of "Sun, 30 Aug 2026 01:42:41 +0200")
References: <20260829234308.33725-1-gilles.grimaud@univ-lille.fr>
 <20260829234308.33725-8-gilles.grimaud@univ-lille.fr>
User-Agent: mu4e 1.14.4-pre1; emacs 30.1
Date: Wed, 02 Sep 2026 11:23:01 +0100
Message-ID: <87bjagrlyy.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

Gilles Grimaud <gilles.grimaud@univ-lille.fr> writes:

> From: gilles grimaud <gilles.grimaud@univ-lille.fr>
>
> Replace the TBMAN and VREG/chip-reset placeholders with the RP2040 regist=
er models from the development tree. Expose the ASIC platform indication, d=
ocumented reset values, write masks, regulator status, and APB atomic alias=
es.\n\nAdd focused qtests for both blocks.
>
> Signed-off-by: gilles grimaud <gilles.grimaud@univ-lille.fr>
> ---
>  hw/arm/Kconfig                  |   2 +
>  hw/arm/rp2040.c                 |  14 ++-
>  hw/misc/Kconfig                 |   6 ++
>  hw/misc/meson.build             |   2 +
>  hw/misc/rp2040_tbman.c          |  92 +++++++++++++++++
>  hw/misc/rp2040_vreg.c           | 178 ++++++++++++++++++++++++++++++++
>  include/hw/arm/rp2040.h         |   4 +
>  include/hw/misc/rp2040_tbman.h  |  25 +++++
>  include/hw/misc/rp2040_vreg.h   |  28 +++++
>  tests/qtest/meson.build         |   4 +-
>  tests/qtest/rp2040-tbman-test.c |  32 ++++++
>  tests/qtest/rp2040-vreg-test.c  |  79 ++++++++++++++
>  12 files changed, 463 insertions(+), 3 deletions(-)
>  create mode 100644 hw/misc/rp2040_tbman.c
>  create mode 100644 hw/misc/rp2040_vreg.c
>  create mode 100644 include/hw/misc/rp2040_tbman.h
>  create mode 100644 include/hw/misc/rp2040_vreg.h
>  create mode 100644 tests/qtest/rp2040-tbman-test.c
>  create mode 100644 tests/qtest/rp2040-vreg-test.c
>
<snip>
> new file mode 100644
> index 0000000000..e8480fc258
> --- /dev/null
> +++ b/hw/misc/rp2040_vreg.c
> @@ -0,0 +1,178 @@
> +/*
> + * RP2040 voltage regulator and chip reset emulation
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/misc/rp2040_nyi.h"
> +#include "hw/misc/rp2040_vreg.h"
> +#include "migration/vmstate.h"
> +#include "qemu/module.h"
> +
> +#define VREG_VREG          0x00
> +#define VREG_BOD           0x04
> +#define VREG_CHIP_RESET    0x08
> +
> +#define VREG_ROK           BIT(12)
> +#define VREG_VSEL_MASK     0x000000f0
> +#define VREG_HIZ           BIT(1)
> +#define VREG_EN            BIT(0)
> +#define VREG_RW_MASK       (VREG_VSEL_MASK | VREG_HIZ | VREG_EN)
> +#define VREG_RESET         0x000000b1
> +
> +#define BOD_VSEL_MASK      0x000000f0
> +#define BOD_EN             BIT(0)
> +#define BOD_RW_MASK        (BOD_VSEL_MASK | BOD_EN)
> +#define BOD_RESET          0x00000091
> +
> +#define CHIP_RESET_RW_MASK 0x01000000
> +
> +#define ATOMIC_ALIAS_MASK  0x3000
> +#define ATOMIC_XOR         0x1000
> +#define ATOMIC_SET         0x2000
> +#define ATOMIC_CLR         0x3000
> +
<snip>
> diff --git a/tests/qtest/rp2040-vreg-test.c b/tests/qtest/rp2040-vreg-tes=
t.c
> new file mode 100644
> index 0000000000..b08bb16765
> --- /dev/null
> +++ b/tests/qtest/rp2040-vreg-test.c
> @@ -0,0 +1,79 @@
> +/*
> + * QTest testcase for the RP2040 vreg_and_chip_reset block.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +#include "qemu/bitops.h"
> +
> +#define VREG_BASE           0x40064000
> +#define VREG_VREG           0x00
> +#define VREG_BOD            0x04
> +#define VREG_CHIP_RESET     0x08
> +
> +#define VREG_ROK            BIT(12)
> +#define VREG_RESET          0x000000b1
> +#define BOD_RESET           0x00000091
> +#define CHIP_RESET_RESCUE   BIT(24)
> +
> +#define ATOMIC_SET_ALIAS    0x2000
> +#define ATOMIC_CLR_ALIAS    0x3000

You don't need this duplication. qtest's can include QEMU headers.

As an aside you might want to look at the hw/core/registerfields.h
helpers which are good for defining registers and their fields and
generate the helpers for you.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


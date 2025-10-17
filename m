Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2B6CCD195
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 15:12:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9m7M-0005ml-Mf; Fri, 17 Oct 2025 11:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9m7J-0005mS-1a
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 11:11:41 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9m7F-0005zS-R2
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 11:11:40 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-6360397e8c7so2228163d50.0
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760713891; x=1761318691; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WLPXgJeVat7oDNY1CZ+cXvPctPFHchcSnpArFIUPAvo=;
 b=SCAqCx2joZh+1UnCCF6DGduKcWgnVuOP9wVfeit60uwe+TvMJGbEb+ugFJl5vH55Rk
 dk/TqJzEPhpgfhjs6dlDxxQTnKghtGunCoeWaGou6ti908wkJqCStA0FGW0wikrXwrbe
 B/XUICXaKHQuyh8kXWRO+29RaEOq+sPPe5czoXvZHFIe2eZa7+d0HYMPdOXRIEtlVX/G
 JG0kSVykcP1oGSeZSQTdvDFfYRcKPkcxgFuKIsw+NBGe52UoQULoTjlpmjsii0vtlW4V
 wj1H5klq1pKLWWxpaKLR0oOwDvRtg/BWUH1lcfsjRqYI2eY0DdpYdZ4aPQhrvYEO3WJG
 0OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760713891; x=1761318691;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WLPXgJeVat7oDNY1CZ+cXvPctPFHchcSnpArFIUPAvo=;
 b=jZm5hOTYhPZ3o6fu2L/kPK0wKjK0In7Q+rjSlOo560rZKgyb/Rgm2awjXxsqBWI5GQ
 5yx3XFr6HGU2qABaz/BvydXTrIEyWmbBRwhTHeLZ3c+kQyPRL1aNii52PB42T7yGuB2u
 DtQrCQ22wnlHuDgCVHNs4jcvO9zs9P6ZgDh0NmewkQMewc0BPADnFwU9bVeBMNhoWZ0B
 nlDW1I7elDbNxOcBMetTpge/eaCBYHkqNEgl98DgSzzeRkjuXqPrN2GLCFetTST1KNbO
 3WD6H2Wui4LQsVXW0kCiXrT2dLm7P0tt8GDmfBI/Rp0q1SZ+64S+6wwq4rNzDmPyq7E/
 bcrw==
X-Gm-Message-State: AOJu0Yx95kp3spYTjvmXjQEqdNbsnYiupI1s1m2d3Q77gxLPCIMGIvL9
 1n2FB1FPTnBka9B7E61n/Qj74dBSKu3iB+Vw8Q3OfYJknnmhxmUU5ZTiQrZtrZwiyi1huW6s1tG
 mD0aHncdl+aRvmt9mIJPwoZorRPEgg+yP++WQsIkAV07WTUAP+okw
X-Gm-Gg: ASbGncsa2KC4hXrBgyYJckDpKpzM4FctJJ5D5BnxJzDHronXpnTE7VvXp0jvjQgSM/l
 VsAo0EG+L/KbJhIcVpRCIh4Y0bkZPEUA2TqMARndTclHggSaTDSzaTUSeMPd2HIIY1u/A2EUKc3
 C7OS2C0E0ZVRA+cYajCOA/2I+ar0dNvdGlPPE6TdXh8oeF1cX8J3IcbuZMLd7hbFMykK8S/SEeU
 5YsT80JoGzfn6hDRNZeVAmpbeOyJt9ahacnN8DXgeIj7n44BG+fmzU9e+kcQg==
X-Google-Smtp-Source: AGHT+IGfob1Vl5LkyZJefYGukGPbhexB362aiPrv7wVjXM1ieNI1YTCv6K+U3EwQgRv/GPMMlKyu2gWoCjjISvMQBGU=
X-Received: by 2002:a05:690e:14c1:b0:63e:231a:cb5a with SMTP id
 956f58d0204a3-63e231acc2fmr751556d50.48.1760713891322; Fri, 17 Oct 2025
 08:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251016122132.737016-1-peter.maydell@linaro.org>
 <20251016122132.737016-3-peter.maydell@linaro.org>
In-Reply-To: <20251016122132.737016-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Oct 2025 16:11:19 +0100
X-Gm-Features: AS18NWAa9NvZBNarUD9X2a3av_-e8MwJYcp2VzyC8KSX4I9KZ9fo7EGn_PBk9cU
Message-ID: <CAFEAcA9o6zTXn-=YmZizZ7rephox_FjpGs3Z8+PmJLeUNKcsMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests/tcg/aarch64: Add test case for SME2 gdbstub
 registers
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Thu, 16 Oct 2025 at 13:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Test the SME2 register exposure over gdbstub, in the same way
> we already do for SME.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/tcg/aarch64/Makefile.target      |  9 +++++-
>  tests/tcg/aarch64/gdbstub/test-sme2.py | 41 ++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/aarch64/gdbstub/test-sme2.py
>
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> index 55ce34e45ee..9fa86874534 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -164,7 +164,14 @@ run-gdbstub-sysregs-sme-tile-slice: sysregs
>         "selected gdb ($(GDB)) does not support SME ZA tile slices")
>  endif
>
> -EXTRA_RUNS += run-gdbstub-sysregs-sme run-gdbstub-sysregs-sme-tile-slice
> +run-gdbstub-sysregs-sme2: sysregs
> +       $(call run-test, $@, $(GDB_SCRIPT) \
> +               --gdb $(GDB) \
> +               --qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
> +               --bin $< --test $(AARCH64_SRC)/gdbstub/test-sme2.py, \
> +       gdbstub SME ZA tile slice support)
> +
> +EXTRA_RUNS += run-gdbstub-sysregs-sme run-gdbstub-sysregs-sme-tile-slice run-gdbstub-sysregs-sme2
>
>  endif
>
> diff --git a/tests/tcg/aarch64/gdbstub/test-sme2.py b/tests/tcg/aarch64/gdbstub/test-sme2.py
> new file mode 100644
> index 00000000000..1d189ac01ca
> --- /dev/null
> +++ b/tests/tcg/aarch64/gdbstub/test-sme2.py
> @@ -0,0 +1,41 @@
> +#
> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

This is obviously wrong -- I used the SME test case as
an initial template, but forgot to edit the copyright line :-/

Will fix in v2.

> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#
> +# Test the SME registers are visible and changeable via gdbstub
> +#
> +# This is launched via tests/guest-debug/run-test.py
> +#
> +
> +import argparse
> +import gdb
> +from test_gdbstub import main, report
> +
> +MAGIC = 0x01020304
> +BASIC_ZA_TEST = 0
> +TILE_SLICE_TEST = 0

These constants and the argparse import aren't needed
for this simple test case.

-- PMM


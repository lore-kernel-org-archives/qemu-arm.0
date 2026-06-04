Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC381CD6E4A
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 07:29:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wV2VW-00088Y-4S; Thu, 04 Jun 2026 03:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wV2VV-00088C-1e
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 03:28:49 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wV2VS-0007l4-Q9
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 03:28:48 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-84237c55ef9so177351b3a.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 00:28:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780558124; cv=none;
 d=google.com; s=arc-20240605;
 b=WNN84rBhqjwI/EgnhcVboMwWZFAaZA5NW+UTw6i+jIXJneJ/1wAc5p7QV9ge9FzVs6
 HxBIC3XwBGZIVeHWwljiMs7tT0QV5fa1zCJW27XjjBic1ooLVPghDo00tqXodj+LEk6R
 pXUYgifTGyJhTLV1bVsNGgZuiGItC3GKEIL/IzWqozCzGEKAlXHym34R+J7w8b1/FPny
 PXJOVgg54pSk0ntaRRWmvATD5GWzyl2yOQMi8ucuhrswv1wpBTBMzjjUm/vwqRWmh6qb
 m6ja/0ZgJuHN6Y6gUyEgmtJjphOyT4ur9KwSIMgEnAu44+qJzyOcQi88kMVOeO2DX8/y
 CFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=VpSRCwgDLMji91ZXDpZd4bhHuRUeCACFSqRLsM8YCwU=;
 fh=1wBrW+lq1wwyIu2Hym7g5Iq6pecFZUYuG3O5IQ8FYnM=;
 b=WgdBOUEZZ9VApvpvSgf7BNEhh/dKwlZ1BVfysCwYGbX61brS4Y5KByeEV/Vl4HOERH
 LBi5jGbbH1QCUx7k0l+wHjyG/x2d09fK5yUx74dZ4F+wETplURc88YKjmTKZ1XmvzKzv
 yr8fTFaQ+R7taxSWQmwRUdgONwPo2tg2VRMJ9qIsEXh0B2OZvTj8o4DzRXrgK8eP/qid
 79G2zmlyYMytyFpXoXec7qleF9nl8gXoY8A5vxC5qDukMq+1z7MZQxFvQbmyA+vF9Evx
 qVn5nTyDzRWMLYv/+UrYZMNrgd1lOa3oJK7CbZi99gNbldmiho0tVBxUMcZMhPoaMGiA
 Rl0g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780558124; x=1781162924; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VpSRCwgDLMji91ZXDpZd4bhHuRUeCACFSqRLsM8YCwU=;
 b=UGI7CUpAw2C0Zd72AnsgvoRi7aK8yVmWjUsXH98OmmwsUNeTI86c6F34BNe0oNSEXz
 RJUUT4sUz3h35Y3xPiEtjnT13wVQMOyr47LUT/XICZbjsu8uh974SgGJA8QjMU/r4vst
 +dUqQAxhkTjRGD8TC5qQC8lrIx7jTNXvyRxpF0VdfUas0z3UoeDG3phd7acPbJ2jJhtE
 PxeZy1d9pskQ5T19Nt03vtgepKR7jnL167ksGyHstpfFiPWZ7Fc1oBemAqK3lXFBL7hf
 KfLm4EgsOqg5r9KCTiCGjymaArDz+F22xbtSsiyBAGSeM6kVvcaF6e7m2ZYFJYXFGqFg
 Aqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780558124; x=1781162924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VpSRCwgDLMji91ZXDpZd4bhHuRUeCACFSqRLsM8YCwU=;
 b=mEVxSvBqpmRikb2c0mAiK0vgf1hVkc62ku7ny31iiW5u/9ccnqZqxwsqZXia+cGi+U
 Yb8+52o8oCz+3oSVQ55TIxL1tYVpEK1vS5QwLeNCvQz+hnGZlmwuvU7jwT63lHvsAN4r
 nT6RajKciKXpM04eqSL6phQrtMNJcqQLWo0poRIAh+WtVfuiGeBpy9CHMg2aITDebLuS
 viV8Oenq1+JKvAHvXLFttpJjHfz2x2KiMRggkA5750zhtI8z4nuIcKN7ap7by1hEwm4U
 R0q0A0uCGQ/loLQ6uxDQt1RCeTW1DQyBUK/tN/KZgG/800fd5q4dEPTifo6KDolo6Ao7
 Uxig==
X-Forwarded-Encrypted: i=1;
 AFNElJ9mhW64JaspnLn61Z4ViLpOpgKkJg4Uw1j1CzT1a2H8vMNpp8Bi04Ijr0K9pR1XSHHH7iNfiLBQ6g==@nongnu.org
X-Gm-Message-State: AOJu0Yz87hnB7Ccv2hg2XOzuPYM7+HOwMJLpzJyQZj3q3kOvXWSJpeT5
 QOIjOD0ce9+D1kGO96RHIvWLQ6vSt/Y3VF5KeomsJx7Fdfn87RPsjzETD/UtwkmvVaRpKusN5Yc
 WMN5gNegAnFs/iJJtMk1Wwx+E729lNP8=
X-Gm-Gg: Acq92OGWNx7Gvv6d2GWs4pE2/FApsYSlpGdb5zuvgewsGHZC9wjf6HELIQAq7coQxPQ
 CDbkgvKJQsK+XxqErA09Z2VO4edhECCyTurHZTAxK7K+C2YqUv5suix+Alnoa1xKYJV9MfUVKnJ
 F7GljEdbkT3Pgq5EthyZEc3v6A4Q7o34cftCg+Qij+s1agTiDEd1/ryy5Pocbtn30ziGwzMgXnL
 EMNEDRCpBsladNNeIQ8LjWTZ7yplksvkA8vwErDEbfDLog1NUCJv5zN4hKLDHrUxAWQhTm3c5Ho
 FkxkDUZK/Gd6mgApvN1lFa2p89145rc=
X-Received: by 2002:a05:6a00:22cb:b0:842:5b63:6116 with SMTP id
 d2e1a72fcca58-84284dbdf1amr6652336b3a.7.1780558124415; Thu, 04 Jun 2026
 00:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
In-Reply-To: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Thu, 4 Jun 2026 00:28:32 -0700
X-Gm-Features: AVHnY4JUR6Lj0SzYmQiULv7DmT4fq5rgboebDItbD7b-eIiHnHz4gjLO9JqoBFs
Message-ID: <CA+1f7BA1Xbmb5atHKfFpd5K5VoXKo1zCmf4M6cH+PkQPifPXug@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] target/arm: add support for MTE4
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=brookmangabriel@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hello all,

Friendly ping: I have an external deadline this Sunday, so if anything
needs to be addressed on my end I'd want to know soon.

(Re Peter's mte-10 segfault: like Richard, I can't reproduce it, but I
am happy to dig in if Peter can share a way to reproduce it.)

Thanks,
Gabriel

On Fri, May 29, 2026 at 12:52=E2=80=AFPM Gabriel Brookman
<brookmangabriel@gmail.com> wrote:
>
> This series implements ARM's Enhanced Memory Tagging Extension
> (MTE4). MTE4 implies the presence of several subfeatures:
> FEAT_MTE_CANONICAL_TAGS, FEAT_MTE_TAGGED_FAR, FEAT_MTE_STORE_ONLY,
> FEAT_MTE_NO_ADDRESS_TAGS, and FEAT_MTE_PERM, none of which are
> currently implemented in QEMU. This patch implements all five.
>
> Testing:
>   - Included for FAR and STORE_ONLY.
>   - The MTE_CANONICAL/NAT test from v2, modified so MTE_CANONICAL is
>     enabled in user mode (removed from tree in v3).
>   - A bare-metal testsuite that sets up page tables for S1 and S2
>     translation, to test the Tagged NoTagAccess fault.
>   - The bare-metal testsuite also was used to test LDGM and similar
>     instructions not permitted in user-mode.
>   - The bare-metal testsuite also was used to test the mtx related
>     patches.
>
> Thanks,
> Gabriel Brookman
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3116
> Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
> ---
> Changes in v7:
> - initialized "tagged" in combine_cacheattrs (MTEPERM), per Peter
> - alphabetized MTE4 features on docs, per Richard
> - moved comment in docs, per Richard
> - rebased onto master, incrementing bits in TBFLAGS since FPMR_EL
> - Link to v6: https://lore.kernel.org/qemu-devel/20260511-feat-mte4-v6-0-=
8557cc1313b9@gmail.com
>
> Changes in v6:
> - Moved certain functions between patches (Richard)
> - Added G_NORETURN to canonical_tag_write_fail
> - Updated ldg and bounds check functions to Richard's versions, tested
>   these
> - Link to v5: https://lore.kernel.org/qemu-devel/20260504-feat-mte4-v5-0-=
232a648e63c6@gmail.com
>
> Changes in v5:
> - MTX check feature split into three commits as per Richard's suggestion
> - MTX passed down to instruction helpers in a new argument
> - allocation_tag_mem_probe checks for probe in MTEPERM case
> - tbi helper combined into tbi_or_mtx_helper
> - MTX checks added to sme and sve functions
> - bug with type conversion in LDGM helper fixed
> - fixed multi-page tag-check bug and multi-page ST2G bug
> - removed erroneous changes to _stub functions
> - reorganized PAuth & MTX interactions to make them more readable
> - Link to v4: https://lore.kernel.org/qemu-devel/20260309-feat-mte4-v4-0-=
daaf0375620d@gmail.com
>
> Changes in v4:
> - MTX now interacts with PAuth.
> - Canonical tag checking only takes place in canonically tagged regions
> - MTX bits enable tag checking
> - MTX bits are placed in MTEDESC for access in mte_check helper
> - Separate feature bits are used to delineate each feature
> - PRCTL functions renamed and refactored as per Richard's suggestion
> - Link to v3: https://lore.kernel.org/qemu-devel/20260105-feat-mte4-v3-0-=
86a0d99ef2e4@gmail.com
>
> Changes in v3:
> - Added prctl for MTE_STORE_ONLY to linux-user
> - mte_check is no longer generated on read when STORE_ONLY enabled
> - Implemented LDGM instruction
> - Removed "long" datatype as per Richard's suggestion
> - Implemented masking for VA range checks when MTX bit enabled
> - Implemented MTE_PERM, with NoTagAccess attribute
> - Removed user-mode test for MTE_CANONICAL, since can't enable in
>   user-mode.
> - Removed TBI from mte_check generation logic
> - Link to v2: https://lore.kernel.org/qemu-devel/20251116-feat-mte4-v2-0-=
9a7122b7fa76@gmail.com
>
> Changes in v2:
> - Added tests for STORE_ONLY.
> - Refined commit messages.
> - Added FEAT_MTE_CANONICAL_TAGS and FEAT_MTE_NO_ADDRESS_TAGS + tests.
> - fixed TCSO bit macro names.
> - Link to v1: https://lore.kernel.org/qemu-devel/20251111-feat-mte4-v1-0-=
72ef5cf276f9@gmail.com
>
> To: qemu-devel@nongnu.org
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>
> ---
> Gabriel Brookman (15):
>       target/arm: implement MTE_PERM
>       target/arm: add TCSO bitmasks to SCTLR
>       target/arm: mte_check unemitted on STORE_ONLY load
>       linux-user: add MTE_STORE_ONLY to prctl
>       target/arm: emit tag check when MTX without TBI
>       target/arm: add MTX to MTEDESC and DisasContext
>       target/arm: add canonical tag check helper
>       target/arm: add canonical MTE check logic
>       target/arm: load on canonical tag loads ext bits
>       target/arm: fault on tag store to canonical tag
>       target/arm: skip tag bit bounds check if MTX is on
>       target/arm: tag is not a part of PAuth with MTX
>       docs: add MTE4 features to docs
>       tests/tcg: add test for MTE FAR
>       tests/tcg: add test for MTE_STORE_ONLY
>
>  docs/system/arm/emulation.rst        |   5 ++
>  linux-user/aarch64/mte_user_helper.c |  11 ++-
>  linux-user/aarch64/mte_user_helper.h |  14 ++--
>  linux-user/aarch64/target_prctl.h    |   6 +-
>  target/arm/cpu-features.h            |  15 ++++
>  target/arm/cpu.h                     |   5 ++
>  target/arm/gdbstub64.c               |   2 +-
>  target/arm/helper.c                  |  36 +++++++--
>  target/arm/internals.h               |  40 ++++++++--
>  target/arm/ptw.c                     |  60 ++++++++++++--
>  target/arm/tcg/cpu64.c               |   5 ++
>  target/arm/tcg/helper-a64-defs.h     |  16 ++--
>  target/arm/tcg/helper-a64.c          |   7 +-
>  target/arm/tcg/hflags.c              |  25 +++++-
>  target/arm/tcg/mte_helper.c          | 146 +++++++++++++++++++++++++++++=
------
>  target/arm/tcg/pauth_helper.c        |  18 ++++-
>  target/arm/tcg/sme_helper.c          |   4 +-
>  target/arm/tcg/sve_helper.c          |   6 +-
>  target/arm/tcg/translate-a64.c       |  45 +++++++----
>  target/arm/tcg/translate.h           |   3 +
>  tests/tcg/aarch64/Makefile.target    |   2 +-
>  tests/tcg/aarch64/mte-10.c           |  49 ++++++++++++
>  tests/tcg/aarch64/mte-9.c            |  48 ++++++++++++
>  tests/tcg/aarch64/mte.h              |   7 +-
>  24 files changed, 484 insertions(+), 91 deletions(-)
> ---
> base-commit: 2db91528542672cf0db78b3f2cc0e22b36302b38
> change-id: 20251109-feat-mte4-6740a6202e83
>
> Best regards,
> --
> Gabriel Brookman <brookmangabriel@gmail.com>
>


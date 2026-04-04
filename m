Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BE9E88D73
	for <qemu-arm@archiver.kernel.org>; Sat,  4 Apr 2026 01:21:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8ph8-0001U1-3l; Fri, 03 Apr 2026 21:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1w8ph6-0001SX-4P
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 21:21:00 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1w8ph3-0007Aj-9w
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 21:20:58 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-824c9da9928so1446954b3a.3
 for <qemu-arm@nongnu.org>; Fri, 03 Apr 2026 18:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775265655; cv=none;
 d=google.com; s=arc-20240605;
 b=hSdd8ZuKPAipk15nxy4o4iJUjm6MB3ER/Zqhjljwdl5FUsnTydl9fCGqwlKjWkfeGS
 CijLvrIWi+YfhprMGUmLxTs64EumBWwgC39/hNwagpgIFlQBLBmPulEujo3ESwDl68Tm
 XIf7AOC/qA0AXuhcua0cs9iuRgRi7EDcJN6dqY7pml7EAYnLTIOAVbAypjzsDXwCudOu
 3pTaQI0Saewgaz7aMKa62ABDjiCUYzeqqOKnlHnPVDm4/v6cYGQFKRm5VxqU0OhoMc0D
 nVXbXrDYzd4fJws0uCZxwLG7HnanMU95TkcRUc9st/UMTZ/OBO21awLvVhZmhEjNyWGl
 NUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TU56CpD/bUIsLCO+ssIVA0ELn2ozWGbl9JCsr/6X3UU=;
 fh=wAMnOZrAFyAppIvz9IOX+WKKBFSJy3DEqX3yBWRRxT8=;
 b=GqPtcOHDniHkiCkqLHwOZGF8N5u2PllBgl0Qkl7zIG7ACTBpllDrrNlOQNJwHNwNsN
 VB2bOShb+i+HACl9FSQRWS0B9kbJmSu9/qHSACQkNLmpAip6Evp3njikGN9vB9T+WMjT
 MKdMBCRIhcjKAcaoKPBCBYbRJX5SgVGaP+Rq+yuJcfiwZdpAN8JeJDL7NFHdj4247Alp
 B+b/2sr5iE391omxDhh9fJTmXhJ7okIo59yTBnCawdVP2fLN4mosuPHwVXekTp5zXVbL
 ZPHTWEfm2hCuIClJVcOsR/5xqfqnGLddItvNtTV+FnxiB7X0SgofUJ5Y+zsOJZTIEdzv
 feSQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775265655; x=1775870455; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TU56CpD/bUIsLCO+ssIVA0ELn2ozWGbl9JCsr/6X3UU=;
 b=LxFb4oMEy2R1I+JRYGFl9ZJiQu742qi+7ktNKUg6+qVABRAujZ/v2TOwn8uz/nf1Qm
 m+0uLPyx4uPknWDbTzJHXuiZaPu8h0yNh/XPGwDmjFdZfO2sGi5m7tyYHF9yO1Dc9HZL
 GjXCyJsLLYwKt4qkJzwx1GYE55Ma54Sndtrec9w/SKz22M3s7Dglq6UAu9TYrB7zeqLw
 qAKJ86eqlJ3B7wJcC8+Y/bqBD75KWBpve13Ny5QxssWNgKNeMfVps65jUdEpOHBDYJI/
 DGksiFi/OtxHUtHkgwrJTyde+uiAJ4YrAqGJM8dwy4wVaC46YDe0mMw7ueQ6THxiLWsY
 C4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775265655; x=1775870455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TU56CpD/bUIsLCO+ssIVA0ELn2ozWGbl9JCsr/6X3UU=;
 b=h068lqc1d9L1zSE/70928sR3bVWZXX1I27/nskraHny3z7KGQu+vglyRw9Ebz8DMkN
 aTYXfqejgWa8av9O20yg9OnapmlJNnfvhz26kU04e2pXd08GGJlXQ3vqi/MK0ehvQc01
 uIj02/DrX9zW7g/rhI2J8h4op2kKGPC9j5zVrnqhBv3HQV2MHWHF5jBg7UcLVC2U7b2v
 EUU5WYdHR/DRZfvzKlEuE7Fj6HDbSU1oA4dMei3Ahbq3F3M2GH/AyjLPUtpJ4GkDCiFE
 83O0BuWK8Yh3CajN3lPA9zbypPp6UOUqtf3IKHd5WnxAeU+kh9mbo8E033zqbL2kv0as
 T2Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlwbpDmtBE27uUNqSO2jtAyp+RLU5VTe7v5g+fOFADO6pFcR0Vm7QnlO34xg7CCdvcQhcfOJmVoQ==@nongnu.org
X-Gm-Message-State: AOJu0YxjcuzIMcEWX7rbexucPl3VE0FsZcxpOfEr2pjMwStGO6Fr8DF2
 3sl5m6hIt7Jx9AWvRji3fdnpKWMHBxn/2uw2yrRpQ27OZfdnvzrB9HCToCmVboRYqGy7m1wVp5w
 TILdNWtmYMkjohY2frou3G+hhZsskQTE=
X-Gm-Gg: AeBDiev6UJosOtq2HeaH9EgtPOyaAIaN8wN6fUJfwl7GPOjP6ElXfhlkGMwzXTXfEVy
 /H486c4vK/LFu0WGOl7A1Ybc32My/6ZTsDS05La/PrraFvRs4rSkp5ZND3kgPHJLz7YVXmLNYAg
 CIYpgP04K9ZPb07eQ/pihz4QyIAmv6gOjGMlHGlO8LrP4hFD3XD3QyK5c6mU22bcZJ/Qz2OjzBO
 393qhuLAVGbpIp63g558rIEjJ53YFBqDgU4yH9cRGE0hyBvtKvYRrCLlBLC/mO0OF2jQoX7j11f
 yoxH6e36fw==
X-Received: by 2002:a05:6a20:430b:b0:398:6ea8:21d2 with SMTP id
 adf61e73a8af0-39f2ed8d9e7mr4910109637.19.1775265655184; Fri, 03 Apr 2026
 18:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-feat-mte4-v4-0-daaf0375620d@gmail.com>
In-Reply-To: <20260309-feat-mte4-v4-0-daaf0375620d@gmail.com>
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Fri, 3 Apr 2026 21:20:43 -0400
X-Gm-Features: AQROBzCWaxYDWGWKJcXyLohHjWQjQ5Qxfu1DJW8a_H6bSkQOgxsYW082IQjCIDw
Message-ID: <CA+1f7BD11AnJgPqMPyxHYx+y6egw33mCz4R0Hqft51mNWCvPVQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] target/arm: add support for MTE4
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=brookmangabriel@gmail.com; helo=mail-pf1-x436.google.com
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

Ping.

https://lore.kernel.org/qemu-devel/20260309-feat-mte4-v4-0-daaf0375620d@gma=
il.com/

On Mon, Mar 9, 2026 at 6:00=E2=80=AFPM Gabriel Brookman
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
>   - The MTE_CANONICAL/NAT test from the previous email, modified so
>     MTE_CANONICAL is enabled in user mode.
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
> ---
> Gabriel Brookman (13):
>       target/arm: implement MTE_PERM
>       target/arm: add TCSO bitmasks to SCTLR
>       target/arm: mte_check unemitted on STORE_ONLY load
>       linux-user: add MTE_STORE_ONLY to prctl
>       target/arm: tag check emitted when MTX and not TBI
>       target/arm: add canonical tag check logic
>       target/arm: ldg on canonical tag loads the tag
>       target/arm: storing to canonical tag faults
>       target/arm: with MTX, no tag bit bounds check
>       target/arm: with MTX, tag is not a part of PAuth
>       docs: add MTE4 features to docs
>       tests/tcg: add test for MTE FAR
>       tests/tcg: add test for MTE_STORE_ONLY
>
>  docs/system/arm/emulation.rst        |   5 ++
>  linux-user/aarch64/mte_user_helper.c |  11 ++-
>  linux-user/aarch64/mte_user_helper.h |  14 +--
>  linux-user/aarch64/target_prctl.h    |   6 +-
>  target/arm/cpu-features.h            |  15 ++++
>  target/arm/cpu.h                     |   5 ++
>  target/arm/gdbstub64.c               |   2 +-
>  target/arm/helper.c                  |  36 ++++++--
>  target/arm/internals.h               |  47 +++++++++-
>  target/arm/ptw.c                     |  53 +++++++++--
>  target/arm/tcg/cpu64.c               |   8 ++
>  target/arm/tcg/helper-a64.c          |   9 +-
>  target/arm/tcg/hflags.c              |  25 +++++-
>  target/arm/tcg/mte_helper.c          | 164 +++++++++++++++++++++++++++++=
+++++-
>  target/arm/tcg/pauth_helper.c        |  14 ++-
>  target/arm/tcg/translate-a64.c       |  15 +++-
>  target/arm/tcg/translate.h           |   3 +
>  tests/tcg/aarch64/Makefile.target    |   2 +-
>  tests/tcg/aarch64/mte-10.c           |  49 +++++++++++
>  tests/tcg/aarch64/mte-9.c            |  48 ++++++++++
>  tests/tcg/aarch64/mte.h              |   7 +-
>  21 files changed, 497 insertions(+), 41 deletions(-)
> ---
> base-commit: de61484ec39f418e5c0d4603017695f9ffb8fe24
> change-id: 20251109-feat-mte4-6740a6202e83
>
> Best regards,
> --
> Gabriel Brookman <brookmangabriel@gmail.com>
>


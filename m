Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F32ECD4F3D
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 04:07:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPugC-00047a-RM; Thu, 21 May 2026 00:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wPugB-00047A-0h
 for qemu-arm@nongnu.org; Thu, 21 May 2026 00:06:39 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wPug4-0007o7-3s
 for qemu-arm@nongnu.org; Thu, 21 May 2026 00:06:35 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-835b78c3797so2415372b3a.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 21:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779336390; cv=none;
 d=google.com; s=arc-20240605;
 b=L0RdzRH5rbeNW2Ft2HLLJLCGDJdmTtJSB9lYgLt68Li0yvR86GXyy+VhCt8ZNA54kC
 BZ7IZQ2n8Ks0hWf13LbkzW+agbk7GkQm/ttXQuXCxSMyCFuW/C45Ct0oEC2s89Zs50OR
 73qZKD4Df7YdJnG79yt1EF2gmFqT+qMV1BUEtNFq907NxZI0MKWvBwbrp+qc1GjPpd79
 PseXRe92lFuRLEg3mAcHJnI/YZiEwMXqfCXdeIgJKYCL8U7X5ygCjgH1JA0kbM3hJidF
 HpkKNINyCVzSNbkBvguEnkY/kZPCRC7QHZ2xYZnjXNPVqpL2W6cgAnV93wQHmCQJhTQS
 iIUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ejvFriw1FMTOseWxJMjltUsSxWejtkja8ZGck09p6Y0=;
 fh=r0EEz99lCRiGY4ZueN9EZ/V4wEjitAhaBGXaskyYCVM=;
 b=aRSGMiQGVTw8Is2PId8GvFTHaA8hbjaVfftgxeaxGQzGfG/0O7Uw8IAtZ+FTWLURRo
 xBEAVk2Mg9XZ5KMm4/QUiUw1+K1KbosmHRBugBzyWqVm7s7ISYhO3PxmnwvCRzWakTRR
 7YBdDWlTP1EmGcxzvnVKpM+Ep/sHcS/2xp9eaDc1H4BV8HXlvNaB62KuFQgIxz4N10MI
 omctVcTdqpZOf+IyIymjaQ1l/pIW5FN6VtsbKt0snaUEoT476ayCBtIUyXNcgLxXlsp2
 HRvpmVOnaqXePL6JHSWoLgRxHZQnN6TA52HB/ovqcgdM3VCHLYrf6ufRs4DdrZX/EGQE
 hYbg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779336390; x=1779941190; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ejvFriw1FMTOseWxJMjltUsSxWejtkja8ZGck09p6Y0=;
 b=dCL2aJbPhwG/VrKfTeRrv6/Ym3e5hCFl4sPary/6xgZCQg8NJ5VgQjHLgycurYGDTe
 32gyQphOx61tfLLezdvZU33I2MweANr7B2/vBpfFEMhRIXPyABggoSKGLeaXYzdIZPJ/
 VaukfoFdjEEsMnpS473CQWs8DvuiS61HGoOf2QOuOx56jL2HihwoO64O0HfVOR+LUgcU
 yh6aB0yZUwnSR/Q3hWN0D6ffJOg7tf3vIdD+tG81osJgWR2vc2rvzIMfheMHGgL3LCBt
 nXFdtOBVDxNjnqu8bkwtOt1thC8vOfPv7Axcrt3zFY9Ej/5m1AiZGtK+0bvYjG6uValR
 uSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779336390; x=1779941190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ejvFriw1FMTOseWxJMjltUsSxWejtkja8ZGck09p6Y0=;
 b=hlmV1K+Z/nmaNGcep+nYMt7hZOAu4iy/TvyZWoZThkYUikGJ5tX1plj0dmnUuCOJdk
 a/1T1KUPvQYswD6CnxpJp6wlljLEE4bL/HTAYnYADI6BUkmPWrxj02A7HHvNazd1beXP
 GCTD1cHwkLLmI9kv/JWnz1C85owKAwAdDGBF5MlMW69ofxmi+KBsk8W/be99bgsGtd0/
 G04L8x/vESU1kpHkoQk6KVFQEyHH2Yd/6xTr2/cbMjm5/u1GqnG/f7f8JOBT6Wy6h1Ad
 MgR1k498wru5y+vcKrWyJC3N60ugyu3Mvwb7k1jj6B+TTw7v8IT+mbKfX5a2QR60BxXK
 /jLw==
X-Forwarded-Encrypted: i=1;
 AFNElJ95DlKg5xNEzipJcYWXn0kW+XudxX22PiigE6SKSb/2lZmakCTjNx4YhKQqTvzBEroEQKguR6feBg==@nongnu.org
X-Gm-Message-State: AOJu0YxVxZ+jW7EApjwKDmLi+mQKtKMHipud9mDK/6VuQ/9LvdHjI8AR
 lcshJw8M3b58RmBMfXHHhJozOdIW/GRAnnzc4TdIXprTGdst7rK3UDS7ANQSx99M4fPyFp+5zsv
 JszPhYJTVvpgbuqONiWjZNEoWL5HH8p0=
X-Gm-Gg: Acq92OHG6si0LVCt2G487jEaWMU9GsHmmeWOX4f1JXGow+qDWepOSRLoGeZgbHwbifK
 H8dQb2k+nmSGvcW6fPJaN3MsgKdTaS3J6q1RmuN94seHy1dCxPm8FzIrFCe5SgtWD8ITObeR6j4
 Y4gHwiVMhy0xoZ3Z/WqBMJkW3xdlUCPKRaJyQ9ykZCU73LVeNd05+AAjjm0chKJbikp12R5A0hX
 dpM4KT9oZ9ijvz2FeyzqFwTROopEaFurR0Z1DdTA7VRRFtx/fjGeZkuatJaOapbLZCX0JuI42ty
 CNMjpdzp2ovyW8kLTGY=
X-Received: by 2002:a05:6a20:6a0a:b0:39f:df57:ee7b with SMTP id
 adf61e73a8af0-3b30872e716mr1449138637.21.1779336389952; Wed, 20 May 2026
 21:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
In-Reply-To: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Thu, 21 May 2026 00:06:18 -0400
X-Gm-Features: AVHnY4I_5vg1QUwLw-03cypjxT3bhZ68UlvEGNuaE5d9DoMmkSOODyxiPNQl7zg
Message-ID: <CA+1f7BCt2-L4PomMK+boHS6Od1odN6SP0rTVJ3Pd10rFhVNP-Q@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] target/arm: add support for MTE4
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=brookmangabriel@gmail.com; helo=mail-pf1-x42a.google.com
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

https://lore.kernel.org/qemu-devel/20260511-feat-mte4-v6-0-8557cc1313b9@gma=
il.com/

On Mon, May 11, 2026 at 10:01=E2=80=AFAM Gabriel Brookman
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
>  target/arm/tcg/cpu64.c               |   8 ++
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
>  24 files changed, 487 insertions(+), 91 deletions(-)
> ---
> base-commit: ee7eb612be8f8886d48c1d0c1f1c65e495138f83
> change-id: 20251109-feat-mte4-6740a6202e83
>
> Best regards,
> --
> Gabriel Brookman <brookmangabriel@gmail.com>
>


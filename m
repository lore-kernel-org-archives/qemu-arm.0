Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B620C79FAF
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 18:15:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vcp79-00013k-OM; Mon, 05 Jan 2026 13:15:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vcp78-00013Q-4S
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 13:15:34 -0500
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vcp75-00034B-Vv
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 13:15:33 -0500
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-8b22b1d3e7fso16933385a.3
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 10:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767636927; x=1768241727; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=laEytkjtDoTdVDUiy9r9GgJkRFNheGSxDE0euvSHkWo=;
 b=Mjd2WYJwWL2/l640Gt2deH4Urk9IuOeQzZiMrD1n3bFjBVOIl0ZZJjqRfK5ojUWJSE
 9j5prO81QfNMKys2SiNcc1SZNjifsujAeOZcDNi8ALHBxTjS2S5cTvcbaoadU2zmpd5l
 YV4xcXhdY3JB1QGeiPaxDVzqExfqqGLRhkFWdsBufx0+XmY9HBe7G1P6s8is+9YhMPmH
 uzZKwVTzOJabXYvmgr5hknoE8lk9qbEtnbLGugxaXGAlSWLl1CC3Fufpqh58ED7uS4Au
 hMbS4yVKH8arXDuDJLbKL4TSpqcUHHnl0uBuVGoiNSvWJdei3KerU/CjarMGx+m6qx/3
 IO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767636927; x=1768241727;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=laEytkjtDoTdVDUiy9r9GgJkRFNheGSxDE0euvSHkWo=;
 b=YZhLafYIky/vmq70tNVrYNdV4pbSS1bgQ1ii15ukGU3ZMmCAu4HC7ZOwWKbE0qf635
 MjUNNq/EMD2t2iCfJCP0QalZZQwBVDS6SZi75aG2vK6UP8Dh0SfoGUOonLzNAaIeyvpT
 DjjHEw0VUZfGqX/v6Yj0ixTfv3Pc2A+ZLcmru/nH9X36FEmVjKn8694AheFlq68wKfqg
 bcgULn0ChEZsZzqaf5Cq38VyQOrhXh2wA7hUbjDeQKxtQMg7RTenoVGziwRzz47Zqfaa
 51KsNzWZ1Sa7H6Z4sexeKbDZvr9xKKqgRFck+/GuzTZ77uZEsaazNfMSO+rvnYR27UQ+
 Z8YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgpYD3DxCONMk06HnU/fuuKR5HTi7vuoWux7o6EXsjds0TDqyk1XJnZrcu/wOgflJ3vIYF8SvGzw==@nongnu.org
X-Gm-Message-State: AOJu0Yz6yivUTKgyGq7KkpcXwFM5P+BB/3GSBHoFa6Wq3VzEVHYBQ3Gi
 KbRyhWKIQBhOKcm1TgLS1f/pIpwMHmKpYXsaeHiBgkVJaxxuIJIuc14u
X-Gm-Gg: AY/fxX6eW4SKGLF6jSa/SqfsRoOrBb2jzDUR1ORi/LTjM6tKqKLzYHVCVwLtFclZkpB
 dJ1mYNai8KKyzcToFOndHprFqH549s58lLHaNofc7BgHM5rw5Pp02TMXfqSLPzj3ebaYDlvydZD
 EqgvfEZw/uilPdVcoabdd7ulNsd4mlEl6dkvmcz8+oi4T+XZ2fVzpekEqz9zpmaUNtgMmdQqXkV
 LQhHyhbXZoVB6TCsGJB/1ksfWZa6XOOW5/ajCrG5PFes0EOGeZTykQxFtq8jF5rp6VnQqR0YJ8l
 gIuoVGQfVt8kf9lYARU0imgztm5YIF8vUjzS+WnJT0yERRUhLfnZHtuu3AuqagnukK6g72whu9j
 YGUbRpjaFUcPAkIZoPWx4G/7TKLlG7LsQFsmEOQK8YCa+/4SA4l1janjtCzRZsoTIqQhWCm12i4
 Jqh2xVhq+z7ScDB0ouYCBcZ00p
X-Google-Smtp-Source: AGHT+IG4jR0Lnm/KoXtpGB3WnQP7WxZKIRbpBqFCi6mW2/wTPgvJziEJduQtdWIMKAgzvfuXOsUQOg==
X-Received: by 2002:a05:620a:2a0e:b0:8b2:f82f:c630 with SMTP id
 af79cd13be357-8c37eb4d88emr77905785a.31.1767636925698; 
 Mon, 05 Jan 2026 10:15:25 -0800 (PST)
Received: from [192.168.1.204] ([185.213.193.254])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8907540e24csm3855706d6.25.2026.01.05.10.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 10:15:24 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Subject: [PATCH RFC v3 00/12] target/arm: add support for MTE4
Date: Mon, 05 Jan 2026 11:14:49 -0700
Message-Id: <20260105-feat-mte4-v3-0-86a0d99ef2e4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJn/W2kC/02MTQ7CIBBGr9LMWgxMW7CuTEw8gFvjAuvQkkhro
 CGapneX4Ibl9/PeCoG8pQDHagVP0QY7TynUuwr6UU8DMftMGZBjKwTvmCG9MLdQw6RquJZpoEM
 N6f/2ZOwnu25wvZzhnsrRhmX23+yPIk9/lRCFKgrGmUIybW9QSdOdBqfta9/PLlsilqQsSUxkp
 5VAfCijlSzJbdt+mW9NWOEAAAA=
X-Change-ID: 20251109-feat-mte4-6740a6202e83
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767636923; l=3551;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=Kls/xHW940dGOiq44zrEHD2sUvNptOrfAbqft9aed94=;
 b=srGu/3NcjUtbsIOXanq9ukaLwRp0GILe784IPFrHzBIUWt87W6ZXmqOlSFCGjmNVKyd5VAugo
 J3kjSbY+q/9AhrX9ZlsDmyUFA7iQi3+Sdz9/GS8Cu1EtEq65CRfkp5v
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qk1-x72b.google.com
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

This patch implements ARM's Enhanced Memory Tagging Extension (MTE4).
MTE4 implies the presence of several subfeatures:
FEAT_MTE_CANONICAL_TAGS, FEAT_MTE_TAGGED_FAR, FEAT_MTE_STORE_ONLY,
FEAT_MTE_NO_ADDRESS_TAGS, and FEAT_MTE_PERM, none of which are
currently implemented in QEMU. This patch implements all five.

Testing:
  - Included for FAR and STORE_ONLY.
  - The MTE_CANONICAL/NAT test from the previous email, modified so
    MTE_CANONICAL is enabled in user mode.
  - A bare-metal testsuite that sets up page tables for S1 and S2
    translation, to test the features that rely on those. Didn't include
    it because it's unwieldy.
  - The bare-metal testsuite also was used to test LDGM and similar
    instructions not permitted in user-mode.

Thanks,
Gabriel Brookman

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3116
Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
Changes in v3:
- Added prctl for MTE_STORE_ONLY to linux-user
- mte_check is no longer generated on read when STORE_ONLY enabled
- Implemented LDGM instruction
- Removed "long" datatype as per Richard's suggestion
- Implemented masking for VA range checks when MTX bit enabled
- Implemented MTE_PERM, with NoTagAccess attribute
- Removed user-mode test for MTE_CANONICAL, since can't enable in
  user-mode.
- Removed TBI from mte_check generation logic
- Link to v2: https://lore.kernel.org/qemu-devel/20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com

Changes in v2:
- Added tests for STORE_ONLY.
- Refined commit messages.
- Added FEAT_MTE_CANONICAL_TAGS and FEAT_MTE_NO_ADDRESS_TAGS + tests.
- fixed TCSO bit macro names.
- Link to v1: https://lore.kernel.org/qemu-devel/20251111-feat-mte4-v1-0-72ef5cf276f9@gmail.com

---
Gabriel Brookman (12):
      target/arm: implement MTE_PERM
      target/arm: add TCSO bitmasks to SCTLR
      target/arm: mte_check unemitted on STORE_ONLY load
      linux-user: add MTE_STORE_ONLY to prctl
      target/arm: removed TBI bits from MTE check logic
      target/arm: add canonical and no-address tag logic
      target/arm: ldg on canonical tag loads the tag
      target/arm: storing to canonical tags faults
      target/arm: added mtx to translation logic
      docs: add MTE4 features to docs
      tests/tcg: add test for MTE FAR
      tests/tcg: add test for MTE_STORE_ONLY

 docs/system/arm/emulation.rst        |   5 ++
 linux-user/aarch64/mte_user_helper.h |   3 +
 linux-user/aarch64/target_prctl.h    |  11 +++
 target/arm/cpu-features.h            |  10 +++
 target/arm/cpu.h                     |   4 +
 target/arm/helper.c                  |  27 ++++++-
 target/arm/internals.h               |  31 ++++++++
 target/arm/ptw.c                     |  45 ++++++++++-
 target/arm/tcg/cpu64.c               |   8 ++
 target/arm/tcg/helper-a64.c          |   9 +--
 target/arm/tcg/hflags.c              |  25 +++++--
 target/arm/tcg/mte_helper.c          | 140 +++++++++++++++++++++++++++++++----
 target/arm/tcg/translate-a64.c       |   8 +-
 target/arm/tcg/translate.h           |   2 +
 tests/tcg/aarch64/Makefile.target    |   2 +-
 tests/tcg/aarch64/mte-10.c           |  49 ++++++++++++
 tests/tcg/aarch64/mte-9.c            |  48 ++++++++++++
 tests/tcg/aarch64/mte.h              |  15 ++++
 18 files changed, 401 insertions(+), 41 deletions(-)
---
base-commit: 159107e390609f71b78268a4888563dcdce6ac65
change-id: 20251109-feat-mte4-6740a6202e83

Best regards,
-- 
Gabriel Brookman <brookmangabriel@gmail.com>



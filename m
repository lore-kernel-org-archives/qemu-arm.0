Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2F4C44515
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 23:25:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkrti-0001RH-LX; Fri, 17 Jul 2026 19:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrtg-0001QF-F8
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:12 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrte-0006wt-Pa
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:12 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-381216921aaso8271286a91.1
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 16:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784330589; x=1784935389; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pf35ft1B1D/t3qmeAkjFpsZffjZXUqazoEptkfpvL2w=;
 b=UTMqvPJowLmnqUZ2awWLBf3bocTUdxpABi23HS2tl4Vs4Y5yRvHTF5m0BDHtlnKHmh
 TZyFExTsdab6VYYj6ITDXcD/v2FTzbsuGfi8cAvW2gFSd35cEThitiHhl4vUpHn0Y+QK
 lR4JjGONfkCLjP4lMrC+gcmDOhHh//NXhvyW4mC6EnwrliIqb0M5bhloMZwzFwu1zDo+
 d+T5Fc2N4zNy7h8zSRbpE6Ky0wpLdMLSh7/ed0v7RPzgMijFAtLgIdlo6i/RkyFD5ThG
 asMlY/fLB42dFWc6XzSStWGzVympgA9z9cwPt/K3WlDeZvlSpSKsqnL4Et+sd1Q7Jo6a
 6W1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784330589; x=1784935389;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pf35ft1B1D/t3qmeAkjFpsZffjZXUqazoEptkfpvL2w=;
 b=TDGZi9Rl3yO9gGlDTNIBN65A8bV1onb99g3KL8iZPey0ZqJ8c8KJKt+K3kBQoXCxod
 2u2e/FN/8N+JJ20V5rGIyuRGlZFfuKvGEunXNcDt6jxaMrqC69ofWtF0CHK4fpfTwCl9
 n4NsdMoi8prr2isIcqDvhuugxnouuWZ8w8EgiG6gmW9MmRPQ8mUPB4F0kYgDLfgGNHiu
 N7+ExSqm0FArS/xiXlwhlG/wIGFbiTZIy85L9HQ51LjA2/1pPzGNNTWRtnvNdtfy8PIt
 h4vJ/Dbzf2wUkWzzcQF0PURHxt5SzqMCbjLQSM8npbxcvIAQITV2nxL2CnvYz9DfOBho
 A9BQ==
X-Gm-Message-State: AOJu0YwTlt3rpGZqdMibKv9WEs8gFmIMjBmMM7iWdDb+EmQi7LuiVrSO
 LchU9xBF0Hn1nHdk/G1e5f71ulqHmshF5ybi9vExI1KdDjMj+qrGpJKiKQN77te0SAvP77y6svO
 poXfO
X-Gm-Gg: AfdE7cnpAHEW5MUijWqFqoN7b3xuox5i/JWH+1bngcmXfGUUowDHxG+A5c4SCMtqAiT
 tkb5J2+TDSJKyTqYT/SlMa+QD05qIipaYUl9Pa/XiZr0i+8i0OKQPvYYu54Q+r7QgzV73GCG3N2
 /xmKrgCTa64Q+XozGcsmuFtw5IhtcVfM6NzpPwdwL82NaXTgBpIS48ZKnQxF4AiWRIalm+dVOy1
 z62ku4soU/L/L+3DaYKjTsD0646iOWDrgCWh/iPYjWxlk3PhP0aRwq4C6FmqE6qSKaNGVLoglRc
 VlqXAy3haSgviY2ZuDBDf2+3u4HM8lQ9CLeHxJhTsJ7T6ivjeCdfZufBUYMp2HPstzRZcVdTmUG
 KPPNqStBB8sEzJ8rEQ0RkeMW0XokmphenM6NC3McCun/1yV/kBNELJ/OgmUerqeje9YY9eLT+nF
 ZlV7rSrnE=
X-Received: by 2002:a17:90b:17c4:b0:35f:b6a1:8d27 with SMTP id
 98e67ed59e1d1-38e4b431495mr4497943a91.18.1784330588549; 
 Fri, 17 Jul 2026 16:23:08 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce2a18a47sm8186261c88.8.2026.07.17.16.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 16:23:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/17] target/arm: Various trap fixes for DC ZVA et al
Date: Fri, 17 Jul 2026 16:22:47 -0700
Message-ID: <20260717232306.378988-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

This started as just addressing #3005: raising the unaligned access
fault for DC ZVA on pages with Device attribute.  But then I saw that
we weren't correctly ordering the permission fault for MTX, and that
we could avoid multiple page table lookups.

While these are bugs they are minor, and beyond the one patch already
separately posted they are not 11.1 material.  This is complex enough
to warrant a very close look.  I hope that the code structure is cleaner
than before, so that should help.


r~


Richard Henderson (17):
  include/user/guest-host: Include exec/abi_ptr.h
  target/arm: Fix testing of raw mtx value
  target/arm: Move helper_dc_zva to mte_helper.c
  target/arm: Raise alignment fault for DC_ZVA on Device memory
  target/arm: Imply probe from allocation_tag_mem_probe
  target/arm: Simplify invalid page test in allocation_tag_mem_internal
  target/arm: Return struct from allocation_tag_mem_internal
  target/arm: Generalize probe argument to allocation_tag_mem_internal
  target/arm: Drop TLB_MMIO check in allocation_tag_mem_internal
  target/arm: Probe second page earlier in allocation_tag_mem_internal
  target/arm: Expand dczid_bs in DisasContext
  target/arm: Split out helpers for creating MTEDESC
  accel/tcg: Clean addreses in the user-only probe_access api
  target/arm: Drop clean_addr_tbi before helper_dc_zva
  target/arm: Pass MTEDESC to helper_dc_zva
  target/arm: Create helper_dc_zva_mte
  target/arm: Rewrite DC_GVA, DC_GZVA, STZGM

 include/user/guest-host.h        |   1 +
 target/arm/tcg/helper-a64-defs.h |   9 +-
 target/arm/tcg/mte_helper.h      |  18 +-
 target/arm/tcg/translate.h       |   4 +-
 accel/tcg/user-exec.c            |  10 +-
 target/arm/gdbstub64.c           |  10 +-
 target/arm/tcg/helper-a64.c      |  50 ---
 target/arm/tcg/mte_helper.c      | 643 ++++++++++++++++++++-----------
 target/arm/tcg/translate-a64.c   | 189 ++++-----
 9 files changed, 530 insertions(+), 404 deletions(-)

-- 
2.43.0



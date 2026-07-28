Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B3BC531F9
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 11:17:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wofnZ-0001RZ-BK; Tue, 28 Jul 2026 07:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wofnW-0001QW-P7
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 07:16:35 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wofnU-0005co-UW
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 07:16:34 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-49553515a8bso45596005e9.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 04:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785237391; x=1785842191; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=VOFBP/T90PBYUvVnaOb7OX7hosCDnhBkxoYr0mmJGQo=;
 b=wgpxRXZle7WXQ0a6QCHrc9C9hFEqGh28ZmHMks6+iTei4zilMbxFfPQj/LpZZ3Z/Hl
 ZJDQuO1/8g+OppD2HqxAgaCUkQKqTRl9D54cEqy9AcT6CANQtLgqQoMifYCPYH+58kca
 GXEguco9aXH285g8VXEu6eJ8bCB6DweYz8Vz4oa+Es5EPsZusmlCBQDbJJshCoB6q5gm
 guSNjBBQEReGIHpA8dZk/u8ziwnH98LoTGaKwk3cQ3Jcvo5CJwS/VOrWrNwcfeTKkXG+
 J9dDv/E2l73V0oTKWAZmGxqlpDlQXwxB+4hAIA7WjQqCybbf0rZ/thEGx1Ni2Z6Wpbya
 RbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785237391; x=1785842191;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VOFBP/T90PBYUvVnaOb7OX7hosCDnhBkxoYr0mmJGQo=;
 b=PG4J7SYJPsu4s+Gy9Pn/yw6NFK+BcHsyEdpLc2/LOExe2cGdHkpht9f9Tv1zZu7Fhh
 6LFS6PpiAUlJRAClxDUB43h1frQtNm93Oxv2GFOAj/Z1a7jfjQ10ppOTfHYleX53i+8K
 r1U/LueXonwTpJxKaskjEQ30e/y1PFmIhyfpRN7Yyo3/8xxypeQhXW+3dzOjEENSch8n
 9Rjrtft0dXB4E5a664WmmJ964nFRPzaR+HHnrNPQFQIp+l7g7FYkNCm1tg+gl+FcT4Xy
 deA7fCl28IpTKJKl2fwxq8IU2tXKmS5guzE0r9MIyd+LAoTy1Q2P6u8l+Y6u5VdqTHiX
 Tf7Q==
X-Gm-Message-State: AOJu0Yyq/DtVe5eb8c1v4rpVqfWNqKbtNW+ijMc1e6i/Ic+LcbDv3O21
 O8+EpXkEQA9QPtP+O2SxRmLqkmkgr3wgZMOFzCfScRLtTXW/29zwg+4gYlIcfspoy7o0dSb4lon
 zv4jn
X-Gm-Gg: AR+sD12nf0h42y+WmMHzeF7C2pY7pvCiE4FZzaPPS9GHHOFLH8GvJl6+LkRHn4k/A5V
 Wd4eIpIAD7ljzcVB+/9QEwwMdYfY6nI47vKcmjTmn67LzqGGNIW7HEU4qNr8+G959KMOe4WPUno
 jU9g9sTOm5wyx8gaORIDqg74bdmsZ1yLVlONhHs9PPcn90B33duP54hGU1GcWSkup9oP4ar9gxS
 zdwl7NUCgisK+XsKOQzbIS90EKwv+4dtYfmamTn9nd293JmDfAwfV1khhI0OGt38I3lyMRAtkd1
 3ZeaJdVlZUHJHkFAvqdQ1G9/jsZLP0tUIvwDI38vC/aPjqXn40CxA1mAntxXLfVG3SvEMQW+9VY
 MLvnAnodxG+zIXaPdgLbVxxw6rOCj3SRxQ8TW4IaNtALzGfYHOzn7Grmr1NS7wFK0qEJksjlYb3
 /Pbpevu2WsXlPN6N2gOq2VAiTum/3vjRw5qPw/0Z0Sd5RB+WXCWDZ2H7IfFhc3tRPVZJCQLsG8c
 gKZfVC1BvYjVyuSxfTBgA==
X-Received: by 2002:a05:600c:4fd6:b0:495:48d7:f178 with SMTP id
 5b1f17b1804b1-496c64394dbmr21014155e9.11.1785237391062; 
 Tue, 28 Jul 2026 04:16:31 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957b5ed646sm284546255e9.0.2026.07.28.04.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 04:16:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for-11.1 0/3] target/arm: Fix SEV/WFE handling for v6K and
 earlier
Date: Tue, 28 Jul 2026 12:16:26 +0100
Message-ID: <20260728111629.1705308-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

This is an extension of my previous patch
https://patchew.org/QEMU/20260727151325.1428686-1-peter.maydell@linaro.org/
("target/arm: Don't NOP the SEV insn on v6K CPUs") to also get the
architecture version checks right on SEV, WFE and YIELD.  (That then
means all the insns in the NOP-hint space have checks in them).  RTH
suggested that a mismatch in the condition check between WFE and SEV
was more important than I had thought, and I agree.  A guest might
choose to have spinlocks using WFE/SEV regardless of CPU architecture
version, and rely on them degrading to busy-wait loops on older CPUs
because both WFE/SEV are NOPs there; if we make WFE actually wait but
SEV a NOP then that kind of code would deadlock.

Patch 1: same as previous, already reviewed.
Patch 2: add checks to WFE, WFI and YIELD.
Patch 3: trivial comment cleanup.

thanks
-- PMM

Peter Maydell (3):
  target/arm: Don't NOP the SEV insn on v6K CPUs
  target/arm: Make YIELD, WFI and WFE be NOPs on pre-v6K
  target/arm: Remove stale comment about WFE/SEV implementation

 target/arm/cpu.h           |  1 -
 target/arm/tcg/translate.c | 48 ++++++++++++++++++++++++++++----------
 2 files changed, 36 insertions(+), 13 deletions(-)

-- 
2.43.0



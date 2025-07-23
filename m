Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC050C83F1A
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Jul 2025 16:55:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueckE-0005rE-Tw; Wed, 23 Jul 2025 12:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ueckC-0005oy-OK
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 12:55:04 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ueckB-0006ym-1L
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 12:55:04 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4561ed868b5so417875e9.0
 for <qemu-arm@nongnu.org>; Wed, 23 Jul 2025 09:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753289701; x=1753894501; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F/Asf+Y1MknVy76NZ7DRn/3ApqUbhXVRqNzukmfWwdg=;
 b=cg2hXZoOrud4EzNPljt68S6b0Q+RyGXNstzb8X8AB/m9SLGWhzm+mnKgvUHMe1ncuR
 4R2ee0oeXbO79xEoxRDWVZR6owBIqDs0mdbApQBQjXUfBpaHwtVYGtSgQf0UHC724ptE
 1qxXoBEaJlFPtphVgKxT8wQuXTgOqda2yZy9qlNYZwJ4riZH+xNX37x4lPq1tiesxJYm
 gl2yQuCr9E/LOVZvowZ9WK8FRPCKrWPvcp1YJiIsnWDFHNDvIcAHg8MJYioFJukVjQNd
 84S+mI8KSc0cs5VH+HESbzSS4SQ8VtUsFuKwxjF8JzBHXOrMAR4JLJpg5rwr4Mr8qJnw
 nTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753289701; x=1753894501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F/Asf+Y1MknVy76NZ7DRn/3ApqUbhXVRqNzukmfWwdg=;
 b=SiFc/NUZ1Fgzy954Qh5Lok9X6B32MY7U4BlKlDaL4Hp66AZ2zsUc2LfLCqSHnunakQ
 noFzRHpV8xOElzI6NZD8WltbDOC6CkMZf7jQMlvyDFI8NsdpQes2gT7K343p/tFAHtTE
 fQKj3x0ZRoNMUxj7QQokxY7DvnlgmXnwFApQQtdClHZbsGYlf5+pcduSPI+8XN/lW6kf
 cvPoRlZV9pdAPwTOR6oZEpc3kba4cvryR3HhkK2Mze8O7vgK7SjQ3ISnLdT/2skMRKxG
 SaEgVjwBcUxxef1jm74WMsys03R4Ovs82xqvGX8A+5SSxjXjV7dXTnVro5Fkh1Tmxt8x
 OJAQ==
X-Gm-Message-State: AOJu0YzxONriSCmsu5pO6VJlPgTqL0HIhrWKAPbLy+xfdghthy/b0Q7E
 8L7Sd+XEyfM4RiTrvt2Swjtcnag6bTyqkN43LbfFTYC5ppGG3scuM5P39vLmmdtEeTXnaJqX2p4
 tn1zk
X-Gm-Gg: ASbGncs+Rf+mNCOYO/3cnE/vx1dW7286GoxRSDoNH06EvbhUUuPcCM2eyYjp+O00KpV
 ZKuDP0x/KTTEU8V7eg5iq/rYKVRii82o+SMYL1zAaCGYGQtqVUWW5E+wIJCGu33Cg+RWEm7DCZ3
 dPO+oaVAUc9EB2CC6CXqhME5d1ZpchQyeyjZyu3sim6qrF2QKIXKVg0H2dj9oHcO4f1ykQxNbz4
 Ntr32RZ9Bz195STKqxrxyCrNEiA4QeGagKzn11M7gjgC4Jx2CG75HTA5S72nU+BUMkTRv+d9kJu
 tpN9QQbTaVmPfIBFOIMIbEwrVQum0NyFddAPoKiaNRtF5r0XpK2i2+M+KBRDjB26+pn4+WIgH1K
 MdEBb9WYqIGgY8B5K70b4zdg1QQJv
X-Google-Smtp-Source: AGHT+IEFwcpZVT1O6S9eVy0VN456dxjprFjeusjJm/SsFs0RYOJHbHRumON3voPNpCzeHX2WlIDiaA==
X-Received: by 2002:a05:600c:8b30:b0:458:6733:fb69 with SMTP id
 5b1f17b1804b1-45868c9dbb1mr36277575e9.14.1753289700901; 
 Wed, 23 Jul 2025 09:55:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458693cd224sm28559825e9.21.2025.07.23.09.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 09:55:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-10.1 0/6] target/arm: Fix various SVE2p1 load/store bugs
Date: Wed, 23 Jul 2025 17:54:52 +0100
Message-ID: <20250723165458.3509150-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

This patchset fixes some bugs in the load/store insns newly
introduced with SVE2p1.  The first three patches are all from Richard
and have already appeared on the list: I gathered them up here since
they're hard dependencies for this (and for patch 2 expanded the
commit message to say which bugs it's fixing).  The last three
patches are from me, and are fairly straightforward bug fixes.

thanks
-- PMM

Peter Maydell (3):
  target/arm: LD1Q, ST1Q are vector + scalar, not scalar + vector
  target/arm: Pass correct esize to sve_st1_z() for LD1Q, ST1Q
  target/arm: Fix LD1W, LD1D to 128-bit elements

Richard Henderson (3):
  target/arm: Expand the descriptor for SME/SVE memory ops to i64
  target/arm: Pack mtedesc into upper 32 bits of descriptor
  decodetree: Infer argument set before inferring format

 target/arm/internals.h          |    8 +-
 target/arm/tcg/helper-sme.h     |  144 ++--
 target/arm/tcg/helper-sve.h     | 1196 +++++++++++++++----------------
 target/arm/tcg/translate-a64.h  |    2 +-
 target/arm/tcg/sve.decode       |   12 +-
 tests/decode/succ_infer1.decode |    4 +
 target/arm/tcg/sme_helper.c     |   30 +-
 target/arm/tcg/sve_helper.c     |  185 ++---
 target/arm/tcg/translate-sme.c  |    6 +-
 target/arm/tcg/translate-sve.c  |  103 ++-
 scripts/decodetree.py           |    7 +-
 tests/decode/meson.build        |    1 +
 12 files changed, 872 insertions(+), 826 deletions(-)
 create mode 100644 tests/decode/succ_infer1.decode

-- 
2.43.0



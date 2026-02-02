Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21816E7FDE0
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 22:25:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vn2LJ-0007wW-K8; Mon, 02 Feb 2026 17:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vn2LH-0007vj-PN
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 17:24:23 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vn2LC-0005d6-Re
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 17:24:21 -0500
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-48039fdc8aeso29739155e9.3
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 14:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770071054; x=1770675854; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dNkFLEId1hGGGjWWQdqVQsN/0wECLMxRnLUqfwiZ/dc=;
 b=v0/ynZJtzNN99LPw9GzjQF4m8J2Tm7optNnIEy9XzqFllGYgeVr3LcqmlAWsLEg7Kn
 317MA8AxFBP6Shfuoaln+4i/GNbRwctHhdGfzTnHOmMwUbnJiKkRxyxqmg+iUEYSoqaT
 myF4eoGC6obDvu6RAa/fSf0nVWzzWxpZnJwphHf7E+oEoyXSfn9XpBr+NJhfx7xdeqDr
 pBXvEFmbXJR8nf89paxIwF+HsfoGLUD6jobqbJxO39N40/svgENfqAZ73u2Dpwusbdc3
 W4njJvXbx5EFkemVfyg3u4bp2ZWFFwWvIX7eQOAIjY+jWtlgqEjmavETKu8Jf4uCE+l/
 auLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770071054; x=1770675854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dNkFLEId1hGGGjWWQdqVQsN/0wECLMxRnLUqfwiZ/dc=;
 b=pPloTjSuIHGREd2Adsg+tyrCDzKwNeinub/9B1A/Y0D/5GchA2BlXWSAeAb48KeITK
 mAkyJvfT9ShLSNFMi1RdNJx8Ldr0SKYbTZBp0dDiD53CdVuPDnwgECa6A6oDK7vG9oTw
 zt0zL82n5NEjdly2QxCRburfaNHxyLrprovCFADHImdkEHK8KsJU9s4Ois4eUm9Onvee
 dXpWVktDqy0UFBXH5J2g3l3lqD4CF0N51vvNAw9WQO3DEimf08/sODOhEgdBH2ZLIBfj
 Ijey6gZLD54XrPX3qJHa3tktbjy6J8fr3RhfpAiMDNXNsF6S1nXKPCwI3MR/h/ylTMyG
 ibyA==
X-Gm-Message-State: AOJu0YxKKleycJM1bECcjl94IqVYBd/kJ1cDUucbI7aoyTYlzjIJT3W7
 AhKMc8gGwzuaEhcz4cfTF9pr2nDzvHr45InAzj/d768OoEkXWcFSruO9TrbKJbjoQwc=
X-Gm-Gg: AZuq6aIjd61mzkO3EtymLdrRrTpogUpqYVvyH+16wvekIPg5vXuh2LZ/FsPv8BXO1Pr
 SCGteQbgIpMDr0GOwt3WuxwDyEiG/Ic6SQ5Syj4x0cUa31c4SXRO2DIz5rokT67Q0QQtiOzV9hm
 oSOr0fXlYcYELbxo6Km3YNj9UjCZ5cqPhzx83+2tFqHfr+0TVH/7kGl5M2LIzTz6Qt7EETs7o31
 y9TLG603IsrKtgSk5UhibnA9P3V70OxlQtuC7mdjq2a88Zhik/dXiBy4FpPgNfE7gc7v2ujV37G
 0DIfQgiq8U+Tw7zokMdcF2gGmq5Y9LWn3kc88L3+7Qsz7g2f0stf6TWv8Ozu7b9MB7gyua1FOEB
 Ryxs/sTN5Vu3emBE8TNt1z9+Hm0PokPbQFFrCV6e5PMqoi+72RiXeGlI/U5AyG3zLWYRN8glTi0
 dwVfdWKY70gMTZxT7ZiSmL3NKjmoH3EBtUCIsevsBCES9qIvAwGjyr23RRgcV2
X-Received: by 2002:a05:600c:350c:b0:47f:8c05:786b with SMTP id
 5b1f17b1804b1-482db48d476mr162100825e9.28.1770071054399; 
 Mon, 02 Feb 2026 14:24:14 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e46cesm46734796f8f.7.2026.02.02.14.24.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 02 Feb 2026 14:24:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/7] disas: Have disas_set_info() take a const CPUState
Date: Mon,  2 Feb 2026 23:24:05 +0100
Message-ID: <20260202222412.24923-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Have the CPUClass::disas_set_info() handler take a const
CPUState to be sure it is not modified. In order to do that,
first constify few callees (ARM & RISCV).

Philippe Mathieu-Daudé (7):
  target/arm: Have arm_feature() take a const @env argument
  target/arm: Have cpu_isar_feature() use a const ARMCPU object
  target/arm: Have is_64() take a const @env argument
  target/arm: Have arm_sctlr_b() take a const @env argument
  disas/riscv: Make rv_decode::cfg const
  disas: Make disassemble_info::target_info field const
  disas: Have disas_set_info() take a const CPUState

 disas/riscv.h             | 2 +-
 include/disas/dis-asm.h   | 2 +-
 include/hw/core/cpu.h     | 2 +-
 target/arm/cpu-features.h | 2 +-
 target/arm/cpu.h          | 6 +++---
 disas/riscv.c             | 5 +++--
 target/alpha/cpu.c        | 3 ++-
 target/arm/cpu.c          | 6 +++---
 target/avr/cpu.c          | 2 +-
 target/hexagon/cpu.c      | 3 ++-
 target/hppa/cpu.c         | 2 +-
 target/i386/cpu.c         | 6 +++---
 target/loongarch/cpu.c    | 3 ++-
 target/m68k/cpu.c         | 2 +-
 target/microblaze/cpu.c   | 2 +-
 target/mips/cpu.c         | 7 +++++--
 target/openrisc/cpu.c     | 2 +-
 target/ppc/cpu_init.c     | 5 +++--
 target/riscv/cpu.c        | 7 ++++---
 target/rx/cpu.c           | 2 +-
 target/s390x/cpu.c        | 2 +-
 target/sh4/cpu.c          | 3 ++-
 target/sparc/cpu.c        | 3 ++-
 target/xtensa/cpu.c       | 3 ++-
 24 files changed, 47 insertions(+), 35 deletions(-)

-- 
2.52.0



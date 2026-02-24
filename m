Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA17F4BB7A
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 19:31:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuy7l-0001xs-UP; Tue, 24 Feb 2026 14:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vuy7C-0001ou-AO
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 14:30:42 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vuy76-0000mx-Cg
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 14:30:34 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso50272535e9.2
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 11:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771961430; x=1772566230; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJvVqQyy5oZSysZTNN5WiY/fDfYfGZ0/GLOLav4S0p0=;
 b=dMLueoFUkyd5sXhbZWxq2u0onNkQG/x8pVVlB146Kjw+fjTOLJGacrH6e4GM5L21Yp
 Afpa/6CGnM91j4GWdgSVkXj4IvCGzGNnJ4CoK583KLP7aq2B3P/ckauZiIkxb7kZKBU5
 IWRsgxkyrzDQW51AWmb+mTxhTGoO7c4/LRMeSeApN4VBy2nicz7PhrX1aLElW3xxEmVZ
 B9asdROL0GpKbf5jIBAs/B/Wek/x5CaJifeBxx//EhCeK787ADiUkJm5jjOQma5zNIMy
 ORYQBsY5qnd+qVKEAmqP/NNH91Kkz8nv0yHhAUcc/HuzF9KQY6FSouBK2MxGRKtpN/u8
 K/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771961430; x=1772566230;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZJvVqQyy5oZSysZTNN5WiY/fDfYfGZ0/GLOLav4S0p0=;
 b=ViwP5ncL4lCy6uNX+kSZzY5imdL57CSQcHVITNfk8BDUkXiygR1Jv3qrX1GbM8C1Db
 NmvEkg20LuptTNIdz6jm1/Aw6Zppjc2Elfi6Bu6xC8kmVV0In5zd7QgTDxMzjUTyQxOQ
 4ASRhqi5sNlZKya/iUuywLirs/WOY9YVujGm2ymq14n6lIZnf62shyF3s3Qy4+MftBe8
 EWYVF/TcLkP3PvJdV4P+eFTRHWVHTNpulRX3kjBlCUWkcHUMo6RQ2XcK1E/6bfqRXFT0
 6vrLqWyuqwIrxQdvsZaiTLpx/SorqHBXB7c65YXAahSlFpK7SzdF8N8furE/XG4pCYjP
 yl8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy00Qrn/BPzNuhDCNd5SydVkFTHkOBwZieErC55x7ZepffC2R/MQqJdXjr7zJtfzENdlafu6/myA==@nongnu.org
X-Gm-Message-State: AOJu0YyEo6dEmq3YFBP0bqJ1bTlO7ls5LU34X3zYMWFI7klb5vJbaFMa
 E3ePzdZkXa3SdocACAjUqohIgidLAYzOl523cica0kgRMkwGe5WdzFLkUwitR4njOFw=
X-Gm-Gg: AZuq6aLGv38RHUpe+eorksATmKmViYFTPLCjL677O0AGjysFfc5fFHJXaRA+LkSFtqW
 gS5BVaYIuC8XhDOe+jT6C2YtrbkTweYqQfQ1tczvNJsbytWsJptrfgZH64/e4NquYlFMMcrFzcv
 SrTpeqcshkaMB86O/DN8mEp06KGUkwe4XFw30tso+UMsg2MFqDleHEtmTr/kkSlpvnQ37egi5UF
 JnRlWCqPBF0cu5MCKUHQhsA8dHV7eMeQnfJ+yTnRgLHFR/5QWnNp/9I9xnEi2cSWN2ZV5CLxNDr
 cRrdbefg3fRt/9CGL0x9sFsrj+6QI/s99QukGP9FNP9BCf33HZFK2lxzqhCBOI7MvpAti2/ubgL
 lF2ByF+vyTvz6lLak/z0gZNEBtQVKZ0XkdTaoh2WbgUhIUjf8qLfvp3W8unC7P9cti9bSnn1mZH
 f3ycDGuLl0gfDmhBE+gPM+0LqBY6HFsk0Ohjq0I1kJ+gigbfx7m13iY9LHWdBLw/6++V2NroBH
X-Received: by 2002:a05:600c:c166:b0:47a:935f:618e with SMTP id
 5b1f17b1804b1-483a960a0e8mr236645985e9.15.1771961430508; 
 Tue, 24 Feb 2026 11:30:30 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d40004sm28474648f8f.21.2026.02.24.11.30.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 11:30:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 0/5] target/tcg: Rename some helpers common to various
 targets
Date: Tue, 24 Feb 2026 20:30:22 +0100
Message-ID: <20260224193028.2370-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

TCG helpers are declared using the DEF_HELPER*() macros
which imply global symbol scope. Unfortunately when building
a single binary (containing multiple TCG 'target' frontends)
these symbols clash.

This series takes the dumbest approach, renaming the symbols.

There are still around 20 symbol clashes (usually FPU helpers),
but this series is good for my proof-of-concept.

Philippe Mathieu-Daudé (5):
  target/tcg: Rename bitswap() helpers
  target/tcg: Rename crc32*() helpers
  target/tcg: Rename unaligned_access() helpers
  target/tcg: Rename raise_exception() helpers
  target/tcg: Rename set_rounding_mode() helpers

 target/arm/tcg/helper-a64-defs.h                 |  2 +-
 target/arm/tcg/helper-defs.h                     |  4 ++--
 target/hexagon/gen_tcg.h                         |  2 +-
 target/hexagon/helper.h                          |  2 +-
 target/i386/helper.h                             |  2 +-
 target/i386/ops_sse.h                            |  2 +-
 target/loongarch/tcg/helper.h                    |  8 ++++----
 target/m68k/helper.h                             |  2 +-
 target/microblaze/helper.h                       |  4 ++--
 target/mips/helper.h                             |  6 +++---
 target/ppc/helper.h                              |  2 +-
 target/riscv/helper.h                            |  2 +-
 target/sparc/helper.h                            |  2 +-
 target/i386/tcg/ops_sse_header.h.inc             |  2 +-
 target/arm/tcg/arith_helper.c                    |  4 ++--
 target/arm/tcg/helper-a64.c                      |  4 ++--
 target/arm/tcg/translate-a64.c                   |  4 ++--
 target/arm/tcg/translate.c                       |  4 ++--
 target/hexagon/op_helper.c                       |  2 +-
 target/hexagon/translate.c                       |  2 +-
 target/i386/tcg/excp_helper.c                    |  2 +-
 target/i386/tcg/translate.c                      |  2 +-
 target/loongarch/tcg/fpu_helper.c                |  2 +-
 target/loongarch/tcg/op_helper.c                 |  6 +++---
 target/m68k/op_helper.c                          |  2 +-
 target/m68k/translate.c                          |  2 +-
 target/microblaze/helper.c                       |  2 +-
 target/microblaze/op_helper.c                    |  2 +-
 target/microblaze/translate.c                    |  4 ++--
 target/mips/tcg/op_helper.c                      |  6 +++---
 target/mips/tcg/translate.c                      |  6 +++---
 target/ppc/tcg-excp_helper.c                     |  2 +-
 target/ppc/translate.c                           |  6 +++---
 target/riscv/fpu_helper.c                        |  2 +-
 target/riscv/translate.c                         |  2 +-
 target/sparc/helper.c                            |  2 +-
 target/sparc/translate.c                         |  6 +++---
 target/i386/tcg/emit.c.inc                       |  2 +-
 target/loongarch/tcg/insn_trans/trans_bit.c.inc  |  4 ++--
 .../loongarch/tcg/insn_trans/trans_extra.c.inc   | 16 ++++++++--------
 target/loongarch/tcg/insn_trans/trans_fmov.c.inc |  2 +-
 41 files changed, 71 insertions(+), 71 deletions(-)

-- 
2.52.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316BEC982D6
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 00:43:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7Mgd-0006Xu-UH; Thu, 17 Sep 2026 20:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7Mga-0006QA-VE
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:42:40 -0400
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7MgY-0001O5-Ru
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:42:40 -0400
Received: by mail-pj2-x0e.google.com with SMTP id
 98e67ed59e1d1-396ccda24afso140854a91.3
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 17:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789692157; x=1790296957; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=90/FusH3Z8KQc7ISP6ygzwWI/+WeHsR+O58sQAvgyZs=;
 b=IqPWeC+Md+bT1tkI8FKAGOfeYlRZ+rl4F/quqoLrUhm4OZydYrkUVqU6L8Rx66QYsC
 Bf5MtE85lPho1LR7umQRboLWOCdEP23vNInTgUjcTa+rFlLqI+19Z9L/YsTonL+IVQUL
 qpk/MP3oT7Ei8Gyv4f1hUNmyl+pAHVLGIErIMfxFjbTsJghL9A185dfZHvsVpGV2T4pY
 Rl5NMfS48ilvvSdBtrfzFl8BIpX9J8pQsaytPYKMuxvQsQBwjiBmK3PQjc9sMju4vrge
 dvY3eQtEgh5sVQFcP914hw4LrLpAla+Yc2Y8ThK/0sU1KqCTibnt+Y9ddSUPpdGV2+W/
 3hEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789692157; x=1790296957;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=90/FusH3Z8KQc7ISP6ygzwWI/+WeHsR+O58sQAvgyZs=;
 b=hUosW0oGLM7tcP8paDBYmTVNhXjkkPbEu/o1g9T1YNeNXD9pC4wcpPAMbHMTVFfULD
 e51TuPkMqN5uXRM4YG3EYIMLkHH8Ndfw0nmARFzwfRlLNTtx866uzU7qR73BJf3nChZP
 e7O9LmUL2CjBqHWaQ5k7HCZRPmLpK+uo219ac140JuXkRBO/ICWhhlfJk/OxzJCOZHCq
 H5IsK9Nq7IKn/fUB7Wm3NGlMg0zxH4flASy7aQbW991OjGlgJ/mUG9VEUZra1oU7+E6o
 2ps90OVobQ/KYNbkQWObC5U0fyg5MNLvy5iqRaN/dv1PNw84+ITRcVacrDJRJ7J1cma5
 /9VQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwLRWkdnrIfKU7/heHpgqeg1/JU47QvR27y3MTGFWQhsp6SiEL2gcqOeaoWDYKr4qGjlOEy0FP8gQ==@nongnu.org
X-Gm-Message-State: AFuF++nL0zzjISyerD3Be+6IbsUr6J913gLEJ6oP8onAYIKolq8DyasG
 wdcrjcS7J+W6MzVbsK1GV3nS5rkPsVQBTvRfr9+niq6ujl1felKdMrnq
X-Gm-Gg: AYBFou2NT8XO5babhgdFbGFWqEU+rWfzVji1egPZBiCcTeavsDFQULMEiIkYF2aZtNl
 Mici25gB1uzeVmHwONUjghKcIXAa/2KmJ8PR00vFNSeiM/A33SfBHjiM19CboCemdhDGlny5R31
 Z0oco46YewZwptpWpuRS8TKS/xd74gJRnyMMnDO3s6HZi02lrwM3JIkwMBgpdU8+0EUEL2hTu0B
 KD9VjVyZaxOdLDO2f8/r2t0NnXhGg6nh7lmGdUU0K8aojwNBP1h9xkJj8jrYtZt9RSAm+la0+6Q
 3uQGI3ZA57ofUQ20gkQU+LbXm245bNI2d6CiuXl5+bXCCyagp0f48dIwMi+svtwCl6a0KumQuWs
 8pKnI/6mfCy7VRPc3tj4ShDlmH6Kfn0ITcvOwa9gsHzOQ55tHMIUUV7JXAVzK0CVZ9oXNlNHZ9w
 ZTzYjKM3gSYD5vmAh/y10hQy2hkve/DcDZYPX5KR+KIc6SzWbKNuYaLnwOWcde6A6598gIbx3G+
 dsFawmq9IYoQXE3MdJhmS2yMcdSNun87A==
X-Received: by 2002:a17:90b:4a03:b0:36d:9e0b:3801 with SMTP id
 98e67ed59e1d1-39e54d38c48mr2685938a91.8.1789692157337; 
 Thu, 17 Sep 2026 17:42:37 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144cdfc3df2sm600286c88.5.2026.09.17.17.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:42:36 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Nicholas Piggin <npiggin@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 00/21] accel/tcg: share raise_excp across TCG targets
Date: Fri, 18 Sep 2026 08:42:02 +0800
Message-ID: <20260918004225.827-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Many TCG targets copy the same two-line raise: set
cs->exception_index and call cpu_loop_exit_restore. They also copy
DEF_HELPER_2(raise_exception, ...). helper_raise_exception is a
global C symbol, so a unified binary cannot keep that name on more
than one target.

This series adds a shared C exit and a shared TCG helper, then
converts one target per commit. Joiners call gen_helper_raise_excp
and drop the copied DEF. Leftover TCG helpers that still do extra
work take an arch prefix. C wrappers keep the short name as
static inline where that is enough. The shared helper only touches
CPUState. Translate may store arch state (error_code, PC) first.
Guest trap numbers stay below 0x10000. TCG loop codes such as
EXCP_INTERRUPT start at 0x10000.

- Add cpu_loop_exit_excp next to cpu_loop_exit_restore. Set
  cpu->exception_index then restore and exit. host_pc == 0 skips
  restore.
- Move helper_info_* extern into each gen_helper_* body so a
  comment on DEF_HELPER attaches to gen_helper_*, not helper_info_*.
- Add TCG raise_excp (env, exception, restore). restore 1 exits
  with GETPC(); restore 0 skips unwind.
- Convert RX and SH4: name guest traps RX_EXCP_* / SH4_EXCP_*.
  Join privilege, illegal, BRK, and INT on RX, and illegal /
  FPU-disable on SH4. Prefix leftover rx_wait. Keep SH4 sleep,
  trapa, and exclusive.
- Convert the remaining joiners one arch per commit: m68k, or1k,
  microblaze, sparc, loongarch, hppa, alpha, s390x, xtensa, avr,
  arm exception_internal, mips, and ppc. Store error_code or PC
  in translate where needed, then call the shared helper.
- Prefix leftover TCG helpers that still do extra work:
  i386_raise_exception, riscv_raise_exception, and
  hexagon_raise_exception. Prefix leftover wait as mips_wait and
  hexagon_wait. Tricore raise_exception_sync does not join.

Yonggang Luo (21):
  accel/tcg: add cpu_loop_exit_excp
  helper-gen: move helper_info extern into gen_helper
  accel/tcg: add helper raise_excp
  target/rx: convert raises to raise_excp
  target/sh4: convert raises to raise_excp
  target/m68k: convert raises to raise_excp
  target/or1k: convert exception to raise_excp
  target/microblaze: convert raise_exception to raise_excp
  target/sparc: convert raise_exception to raise_excp
  target/loongarch: convert raise_exception to raise_excp
  target/hexagon: convert raise_exception to hexagon_raise_exception
  target/hppa: convert excp to raise_excp
  target/alpha: convert excp to raise_excp
  target/s390x: convert exception to raise_excp
  target/xtensa: convert exception to raise_excp
  target/avr: convert debug/break/sleep to raise_excp
  target/arm: convert exception_internal to raise_excp
  target/riscv: convert raise_exception to riscv_raise_exception
  target/mips: convert raise_exception to raise_excp
  target/ppc: convert raise_exception to raise_excp
  target/i386: convert raise_exception to i386_raise_exception

 accel/tcg/cpu-exec-common.c                   |  6 ++
 accel/tcg/tcg-runtime.c                       |  6 ++
 accel/tcg/tcg-runtime.h                       | 11 +++
 include/accel/tcg/cpu-loop.h                  | 13 +++
 include/exec/helper-gen.h.inc                 | 24 ++++--
 target/alpha/helper.c                         | 11 ---
 target/alpha/helper.h                         |  1 -
 target/alpha/translate.c                      |  9 +-
 target/arm/internals.h                        | 27 ++++--
 target/arm/tcg-stubs.c                        |  4 +-
 target/arm/tcg/helper-defs.h                  |  1 -
 target/arm/tcg/m_helper.c                     |  3 +-
 target/arm/tcg/op_helper.c                    | 43 +++-------
 target/arm/tcg/translate.c                    |  2 +-
 target/avr/helper.c                           | 24 ------
 target/avr/helper.h                           |  3 -
 target/avr/translate.c                        |  6 +-
 target/hexagon/cpu.c                          | 13 +--
 target/hexagon/cpu.h                          |  2 +-
 target/hexagon/gen_tcg_sys.h                  |  2 +-
 target/hexagon/helper.h                       |  5 +-
 target/hexagon/internal.h                     |  5 --
 target/hexagon/macros.h                       |  2 +-
 target/hexagon/op_helper.c                    | 37 ++++-----
 target/hexagon/translate.c                    | 11 +--
 target/hppa/helper.h                          |  2 -
 target/hppa/op_helper.c                       | 15 +---
 target/hppa/sys_helper.c                      |  4 +-
 target/hppa/translate.c                       |  3 +-
 target/i386/helper.h                          |  2 +-
 target/i386/tcg/excp_helper.c                 | 18 ++--
 target/i386/tcg/helper-tcg.h                  | 42 ++++++++--
 target/i386/tcg/translate.c                   |  2 +-
 target/loongarch/tcg/helper.h                 |  2 -
 target/loongarch/tcg/op_helper.c              |  6 --
 target/loongarch/tcg/tcg_cpu.c                |  4 +-
 target/loongarch/tcg/translate.c              |  3 +-
 target/m68k/helper.c                          | 12 +--
 target/m68k/helper.h                          |  1 -
 target/m68k/op_helper.c                       | 19 -----
 target/m68k/translate.c                       |  2 +-
 target/microblaze/helper.c                    |  3 +-
 target/microblaze/helper.h                    |  2 -
 target/microblaze/op_helper.c                 | 22 +----
 target/microblaze/translate.c                 |  3 +-
 target/mips/helper.h                          |  6 +-
 target/mips/tcg/exception.c                   | 22 +----
 target/mips/tcg/fpu_helper.c                  |  6 +-
 target/mips/tcg/translate.c                   | 13 ++-
 target/or1k/exception.c                       | 31 -------
 target/or1k/exception.h                       |  7 +-
 target/or1k/exception_helper.c                | 13 +--
 target/or1k/helper.h                          |  1 -
 target/or1k/meson.build                       |  1 -
 target/or1k/translate.c                       |  2 +-
 target/ppc/cpu.h                              |  3 -
 target/ppc/helper.h                           |  2 -
 target/ppc/internal.h                         |  9 ++
 target/ppc/misc_helper.c                      |  1 +
 target/ppc/tcg-excp_helper.c                  | 21 -----
 target/ppc/timebase_helper.c                  |  1 +
 target/ppc/translate.c                        | 23 +++---
 target/riscv/helper.h                         |  2 +-
 target/riscv/tcg/insn_trans/trans_rvi.c.inc   |  6 +-
 .../tcg/insn_trans/trans_rvzicfiss.c.inc      |  3 +-
 target/riscv/tcg/op_helper.c                  |  5 +-
 target/riscv/tcg/translate.c                  | 10 ++-
 target/rx/cpu.h                               | 13 +++
 target/rx/helper.c                            | 16 ++--
 target/rx/helper.h                            |  7 +-
 target/rx/op_helper.c                         | 46 +----------
 target/rx/translate.c                         | 19 +++--
 target/s390x/helper.h                         |  1 -
 target/s390x/tcg/mem_helper.c                 |  2 +-
 target/s390x/tcg/misc_helper.c                | 10 ---
 target/s390x/tcg/translate.c                  |  2 +-
 target/sh4/cpu.h                              | 24 ++++++
 target/sh4/helper.c                           | 82 ++++++++++---------
 target/sh4/helper.h                           |  4 -
 target/sh4/op_helper.c                        | 43 ++--------
 target/sh4/translate.c                        | 17 +++-
 target/sparc/helper.c                         | 21 +----
 target/sparc/helper.h                         |  2 -
 target/sparc/translate.c                      |  7 +-
 target/xtensa/cpu.h                           |  1 +
 target/xtensa/exc_helper.c                    | 13 ++-
 target/xtensa/helper.h                        |  1 -
 target/xtensa/translate.c                     |  7 +-
 target/xtensa/win_helper.c                    | 12 +--
 89 files changed, 399 insertions(+), 577 deletions(-)
 delete mode 100644 target/or1k/exception.c

-- 
2.52.0.windows.1



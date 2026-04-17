Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E382F8DFF9
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 17:33:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDn2t-00074g-7r; Fri, 17 Apr 2026 13:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2A-0006ik-Ql
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:30 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn25-0001x6-V2
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:12 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so8715705e9.0
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 10:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776447068; x=1777051868; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4/W82uiyT+afBorDkCWoN1foEc6B52fL1ZLzDNDfnx0=;
 b=lMYbkDNgyc47x32M628ZZVAzTEOa8SJwVuI2HhVwCGi4yFFZvZ+Md7ZaL6dJHb0UkB
 1gka3l+CpIeQODkJOrfeK14itQGKuKHtEO32CCaW0lC3QuRgjsu0abS/SLm3PEnRniST
 +0uhlk7ua3BOhpKdeSbb3wHrsYL2sJoPRvzK0irZp4ygt+g/25R2ugh6kkfW68Iu5wb0
 xXIhu4rYbrY8XRLuTdhW3GH687S9uXLNPiZ6MoDrsC78WmLo46h9ijST1ORcdHrDrdIW
 2FtTScp5NEobEly1zOH3RgA4WoD/D53qwyt27cCrt3dwKCO8/aiHGEEZ16f2ublI3Eth
 cxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776447068; x=1777051868;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4/W82uiyT+afBorDkCWoN1foEc6B52fL1ZLzDNDfnx0=;
 b=XL9xfRv1f1yLiy6d/h7O70Tu2/x47iXWibVGkVEEpLUbMO4G3oA/uYytEFIl8KtYhI
 yZrMuIRgH5keTwbEowiQJMv3S6K/oCVAZ9H8zJqDRYsIX5j5QLBMJploZ/M2xa5p106R
 ztjZ4u6NK6YKn9OK6bPzrUYqDFdfXOk6Rpy+G1F4Ehah9nrPjyxccSQiX7LU5VmCQyAe
 xv82KnwG01g7Xbr2LGjEbV/qyQIzR+7kG8YvqqK0NKBlmPnn03XSBcDnEjEofd51WxX4
 6KnR8om2jaAPyyjyeLOkSSNr6mypJcz5P4W9IKEjGFbTtCphhq0eYARg8yX9JaDkn8tE
 Kr7w==
X-Gm-Message-State: AOJu0YyBa6UYQsOybHW3ELztlYnTQEZJTVUF/oKHZNNJQkBWHg68DKXk
 ywyxrAuDP0FV/DgKv2YDpfKQBcaiAY37CgpJvZ2VwFRmjoa0IHGdN+8EM9j1edJI8l0J4tJOSLf
 DjMmmpH8=
X-Gm-Gg: AeBDieuc2uYDIjqWhnkHml/Gw+Z87uI78g7qWee88FufCKgIIheQCp0K+Ebd75tdQY0
 PODQh5fhp4X+Hr+VJ3blGnjijf70cKvRCbI8oqQ+A2lJrnqjcIKtZqOUOch0EZWEA+ZNKfdF/KL
 HlcjLxZ6cz2EQvoguAwSp2OiGxLJRBG+22M/trcv3KPdXE+ouU9GYKurFC5LTwr2Xc4FhUHTyl5
 YP/R0+hc6spCaB8ng0Lf2DgaJXCh/csIvCwDBb62bO69IvaGncodTmwqkuGyrGtA6RGlgjJKkNj
 liTaGEb5HNmGCQEoI9D5t8CaFq9keoCzbujbIYlVYeHhHgadLaFhvkOWTobQAjB6c8aeSjilASq
 M3uuyH/4m9b1JJoi/Y4eLEdrA5dQkP9nonvo3frYNyMwrf/SZmNkuCbypStFyrlAziyt5PY7PKr
 yHSGbSJHd+vRrBRMoEJ9xCkFX3oi5zhcYdJum43HnatH45r86ipvKIrok0Iasv7554xqHfxtkDi
 ZJ8cTlDRUc9bcqzQgoYnOySllPSvMIfEzgJ19PeRQ==
X-Received: by 2002:a05:600c:c085:b0:488:c530:48a0 with SMTP id
 5b1f17b1804b1-488fb784843mr41389655e9.24.1776447067968; 
 Fri, 17 Apr 2026 10:31:07 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4ffa8sm5819650f8f.35.2026.04.17.10.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 10:31:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 00/17] Handle sub-page granularity in cpu_memory_rw_debug()
Date: Fri, 17 Apr 2026 18:30:48 +0100
Message-ID: <20260417173105.1648172-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

A while back we added support for targets having memory protection at
a sub-page granularity in TCG: the target returns a CPUTLBEntryFull
with a lg_page_size field that tells TCG how big a block of memory the
translation covers. At the moment we only use this in Arm, for the
M-profile and R-profile MPU which can set protections on small regions
of memory.

However, we forgot about cpu_memory_rw_debug(), which still assumes
that translations cover target-page sized regions. It rounds the input
virtual address down to a page boundary, translates that, and then
puts the offset within the page back in again. This causes problems
for the Arm MPU case, because if the MPU is set up so that the memory
at the rounded-down address isn't within a valid region then we
incorrectly conclude that we can't read the memory at the address we
were actually asked about.
https://gitlab.com/qemu-project/qemu/-/work_items/3292 is a report of
this for the semihosting case, but it applies also to general debug
accesses.

This series fixes this by providing and using a new
cpu_translate_for_debug() function which takes a non-page-aligned
virtual address and returns all of:
 - the exact physical address for that virtual address
 - the memory attributes
 - the lg_page_size the translation is valid for

To get there, the series starts off by fixing an inconsistency in our
current get_phys_page_debug and get_phys_page_attrs_debug
implementations: most of them can handle non-page-aligned addresses
and return the corresponding non-page-aligned physical address, but
some cannot. As a result most callers need to work around this by
putting the page-offset bits back into the result. The first seven
patches fix the targets which weren't accepting and returning
non-page-aligned addresses (riscv, alpha, microblaze, sparc, x86,
s390x, ppc).

At that point, the "page" in the function names is misleading, so we
rename them to get_phys_addr_debug and get_phys_addr_attrs_debug.
Then we can remove the workarounds in callsits in the monitor and
plugins.

Once all that is complete, we can implement our new
cpu_translate_for_debug(), either with a new translate_for_debug
method provided by the CPU, or falling back to using
get_phys_addr_attrs_debug or get_phys_addr_debug for CPUs where
protections are still page sized. Finally we can rewrite
cpu_memory_rw_debug() to use it.

There is potentially some followup cleanup we could do:
 - the only caller of cpu_get_phys_addr_attrs_debug() now is
   cpu_get_phys_addr_debug() so we could make the latter
   directly call cpu_translate_for_debug()
 - more ambitiously, we could make the 10 callers of
   cpu_get_phys_addr_debug() use cpu_translate_for_debug(),
   so we only have one function for phys-to-virt translations
   instead of three
 - even more ambitious would be to convert the 15 targets
   using get_phys_addr_debug and the two using
   get_phys_addr_attrs_debug to translate_for_debug, so
   we only have one CPU method for phys-to-virt translations
   instead of three

But I thought this was a good place to stop and get feedback on
whether I have the right API for things first, and it does fix the
reported bug.

thanks
-- PMM

Peter Maydell (17):
  target/riscv: Make get_phys_page_debug handle non-page-aligned addrs
  target/alpha: Make get_phys_page_debug handle non-page-aligned addrs
  target/microblaze: Make get_phys_page_attrs_debug handle
    non-page-aligned addrs
  target/sparc: Make get_phys_page_debug handle non-page-aligned addrs
  target/x86: Make get_phys_page_attrs_debug handle non-page-aligned
    addrs
  target/s390x: Make get_phys_page_debug handle non-page-aligned addrs
  target/ppc: Make get_phys_page_debug handle non-page-aligned addrs
  target: Rename get_phys_page_debug to get_phys_addr_debug
  target: Rename cpu_get_phys_page_{,attrs_}debug
  hw/core: Update docs for get_phys_addr_{attrs_,}debug
  target/arm: Rename arm_cpu_get_phys_page()
  monitor: hmp_gva2gpa: Don't page-align cpu_get_phys_addr_debug() arg
    and return
  plugins/api.c: Trust cpu_get_phys_addr_debug() return address
  hw/core: Implement new cpu_translate_for_debug()
  hw/core: Implement cpu_get_phys_addr_attrs_debug() with
    cpu_translate_for_debug()
  target/arm: Implement translate_for_debug
  system/physmem: Use translate_for_debug() in cpu_memory_rw_debug()

 hw/core/cpu-system.c             | 57 +++++++++++++++++++++++---------
 hw/i386/vapic.c                  |  4 +--
 hw/xtensa/sim.c                  |  2 +-
 hw/xtensa/xtfpga.c               |  2 +-
 include/hw/core/cpu.h            | 56 ++++++++++++++++++++++++++-----
 include/hw/core/sysemu-cpu-ops.h | 39 ++++++++++++++++++----
 monitor/hmp-cmds.c               |  5 ++-
 plugins/api.c                    |  4 +--
 system/physmem.c                 | 38 +++++++++++++--------
 target/alpha/cpu.c               |  2 +-
 target/alpha/cpu.h               |  2 +-
 target/alpha/helper.c            |  3 +-
 target/arm/cpu.c                 |  2 +-
 target/arm/cpu.h                 |  3 --
 target/arm/internals.h           |  4 +++
 target/arm/ptw.c                 | 37 ++++++++++++---------
 target/avr/cpu.c                 |  2 +-
 target/avr/cpu.h                 |  2 +-
 target/avr/helper.c              |  2 +-
 target/hppa/cpu.c                |  2 +-
 target/hppa/cpu.h                |  2 +-
 target/hppa/mem_helper.c         |  2 +-
 target/i386/cpu.c                |  2 +-
 target/i386/cpu.h                |  2 +-
 target/i386/helper.c             |  4 +--
 target/i386/whpx/whpx-all.c      |  2 +-
 target/loongarch/cpu-mmu.h       |  2 +-
 target/loongarch/cpu.c           |  2 +-
 target/loongarch/cpu_helper.c    |  2 +-
 target/m68k/cpu.c                |  2 +-
 target/m68k/cpu.h                |  2 +-
 target/m68k/helper.c             |  2 +-
 target/microblaze/cpu.c          |  2 +-
 target/microblaze/cpu.h          |  2 +-
 target/microblaze/helper.c       | 11 +++---
 target/mips/cpu.c                |  2 +-
 target/mips/internal.h           |  2 +-
 target/mips/system/physaddr.c    |  2 +-
 target/or1k/cpu.c                |  2 +-
 target/or1k/cpu.h                |  2 +-
 target/or1k/mmu.c                |  2 +-
 target/ppc/cpu.h                 |  2 +-
 target/ppc/cpu_init.c            |  2 +-
 target/ppc/mmu-hash32.c          |  2 +-
 target/ppc/mmu_common.c          |  4 +--
 target/riscv/cpu.c               |  2 +-
 target/riscv/cpu.h               |  2 +-
 target/riscv/cpu_helper.c        |  4 +--
 target/rx/cpu.c                  |  2 +-
 target/rx/cpu.h                  |  2 +-
 target/rx/helper.c               |  2 +-
 target/s390x/cpu-system.c        |  2 +-
 target/s390x/helper.c            | 20 +++--------
 target/s390x/s390x-internal.h    |  1 -
 target/sh4/cpu.c                 |  2 +-
 target/sh4/cpu.h                 |  2 +-
 target/sh4/helper.c              |  2 +-
 target/sparc/cpu.c               |  2 +-
 target/sparc/cpu.h               |  2 +-
 target/sparc/mmu_helper.c        | 10 +++---
 target/tricore/cpu.c             |  2 +-
 target/tricore/cpu.h             |  2 +-
 target/tricore/helper.c          |  2 +-
 target/xtensa/cpu.c              |  2 +-
 target/xtensa/cpu.h              |  2 +-
 target/xtensa/mmu_helper.c       |  2 +-
 target/xtensa/xtensa-semi.c      |  2 +-
 67 files changed, 250 insertions(+), 152 deletions(-)

-- 
2.43.0



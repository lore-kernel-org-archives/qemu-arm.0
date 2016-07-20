Received: by 10.25.21.156 with SMTP id 28csp1960438lfv;
        Tue, 19 Jul 2016 22:03:28 -0700 (PDT)
X-Received: by 10.98.47.132 with SMTP id v126mr21890693pfv.152.1468991007902;
        Tue, 19 Jul 2016 22:03:27 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id j71si1263732pfa.161.2016.07.19.22.03.27;
        Tue, 19 Jul 2016 22:03:27 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1750856AbcGTFDU (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Wed, 20 Jul 2016 01:03:20 -0400
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36466 "EHLO
	mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750796AbcGTFDT (ORCPT <rfc822;kvm@vger.kernel.org>);
	Wed, 20 Jul 2016 01:03:19 -0400
Received: by mail-pf0-f195.google.com with SMTP id y134so2685470pfg.3
        for <kvm@vger.kernel.org>; Tue, 19 Jul 2016 22:03:18 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=usGoOnL6psFVcYHrVmPNOctCgGb2lNlD8XBK4p4TBPo=;
        b=BdJeSl3ZfrFXpS27XYq5JV8Pgr4LoLQhRLFLZIryVSn+y7yVck7bOCOS0UNSKowfTM
         8bfhESez+QG478dYU2+0Vwtsr/T/aDWXWcO9xhHf4W9pHsw6JbUWjJz2wH2T+8BBQSn5
         2qzbx9G3Yuej1NKSp8DUNHFZpsMVyPWGQ0qbNuC92tHgN8c7HTb/aIjqphiK9+LpWc2k
         36Lxt6w7EglEJ0j97u1bXTL9X08g9BebGc5f/c866ud/gnOUuXESxj1gohudbsvMOUUA
         sBlblo0+lNT+pT9LTvN+quN1nJxfNUkO3cJL92qDrdtdcJ/QH3i4/v4m21aoQagonl2a
         s3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=usGoOnL6psFVcYHrVmPNOctCgGb2lNlD8XBK4p4TBPo=;
        b=XCMMmhfmZL4yVT+bRtNU42GdMaGSLt1gzvBl9O8WNww5xqOKW9hSHTiWy3kTqwR+cG
         eDn7EbIiRo5/hWZMymG6JWcHzUa0pyZRPQgGBWTvBAc5H3UgvsoDtI0xyyr+L5GNJDlN
         ieWvJTN7ocCBl2m6ZiDEds8Q9u5nA3JHCqRnmdGCyEU9aSsQxZgbgWHbaWLj+J8eFTo+
         NBDRUoVBpilxL1oojTfPfWZ03zimI7qfSsXzMBrPaAvonQ2RqzIZ1nz9rj+CG1+qBlPm
         /MWf/1VAgrJ6tzDMs/hwrBBUoBPiBxlR0UJ6t4VdZ8BCMTjhvBurOsFpTrEpAxPbE0Co
         RFpg==
X-Gm-Message-State: ALyK8tL84pRAqW0x0qcN7DR9wlG8qo8LUZ6mlQMzrEpl3YQP679nf3eaJoY8DCfdqk8q7g==
X-Received: by 10.98.103.214 with SMTP id t83mr61765339pfj.158.1468990998188;
        Tue, 19 Jul 2016 22:03:18 -0700 (PDT)
Received: from squirtle.localdomain.localdomain (c-73-225-163-254.hsd1.wa.comcast.net. [73.225.163.254])
        by smtp.gmail.com with ESMTPSA id c66sm1031757pfd.24.2016.07.19.22.03.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jul 2016 22:03:17 -0700 (PDT)
From:	Andrey Smirnov <andrew.smirnov@gmail.com>
To:	qemu-devel@nongnu.org
Cc:	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v3 00/10] Support non-direct memory writes in cpu_memory_rw_debug
Date:	Tue, 19 Jul 2016 22:02:50 -0700
Message-Id: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.5.5
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: NNtiHruyp9hw

Hi everyone,

This is the third version of the patch that implements an ability to
write to MMIO registers from GDB stub.

Changes since v2:

	- MMUAccessType is renamed to MemoryAccessType

	- Minor formating fixes

Changes since v1
(https://www.mail-archive.com/qemu-devel@nongnu.org/msg382431.html):

        - Single patch split into multiple patches

        - MMUAccessType (extended) is used to differentiate between
          access types

        - New function address_space_write_debug is introduced instead
          of changing address_space_write's signature

        - Rebased on top of http://patchwork.ozlabs.org/patch/635235/

        - Additional code cleanup patches


Andrey Smirnov (10):
  Avoid needless calls to address_space_rw()
  Change signature of address_space_read() to avoid casting
  Change signature of address_space_write() to avoid casting
  address_space_write_continue: Distill common code
  Rename MMUAccessType to MemoryAccessType
  Change signature of cpu_memory_rw_debug() to avoid casting
  Convert cpu_memory_rw_debug to use MemoryAccessType
  Convert address_space_rw to use MemoryAccessType
  gdbstub: Convert target_memory_rw_debug to use MemoryAccessType
  exec: Use address_space_rw to handle reads and wirtes

 cpus.c                        |   2 +-
 disas.c                       |   4 +-
 dma-helpers.c                 |   4 +-
 exec.c                        | 116 ++++++++++++++++++++++++++----------------
 gdbstub.c                     |  12 +++--
 hw/i386/kvmvapic.c            |  22 ++++----
 hw/net/dp8393x.c              |  58 +++++++++++----------
 hw/virtio/virtio.c            |   4 +-
 include/exec/cpu-all.h        |   2 +-
 include/exec/exec-all.h       |   2 +-
 include/exec/memory.h         |  11 ++--
 include/exec/softmmu-semi.h   |  16 +++---
 include/qom/cpu.h             |  15 +++---
 kvm-all.c                     |   8 +--
 monitor.c                     |   3 +-
 scripts/coverity-model.c      |   9 +++-
 softmmu_template.h            |  18 +++----
 target-alpha/cpu.h            |   2 +-
 target-alpha/mem_helper.c     |   4 +-
 target-arm/arm-semi.c         |   2 +-
 target-arm/internals.h        |   2 +-
 target-arm/kvm64.c            |  12 +++--
 target-arm/op_helper.c        |  14 ++---
 target-cris/op_helper.c       |   2 +-
 target-i386/helper.c          |   7 +--
 target-i386/kvm.c             |  11 ++--
 target-i386/mem_helper.c      |   2 +-
 target-lm32/op_helper.c       |   2 +-
 target-m68k/op_helper.c       |   2 +-
 target-microblaze/op_helper.c |   2 +-
 target-mips/cpu.h             |   2 +-
 target-mips/helper.c          |  14 ++---
 target-mips/op_helper.c       |   8 +--
 target-moxie/helper.c         |   2 +-
 target-openrisc/mmu_helper.c  |   2 +-
 target-ppc/kvm.c              |  13 ++---
 target-ppc/mmu_helper.c       |   2 +-
 target-s390x/helper.c         |   2 +-
 target-s390x/kvm.c            |  15 +++---
 target-s390x/mem_helper.c     |   8 +--
 target-s390x/mmu_helper.c     |  10 ++--
 target-sh4/op_helper.c        |   2 +-
 target-sparc/cpu.h            |   2 +-
 target-sparc/ldst_helper.c    |   4 +-
 target-sparc/mmu_helper.c     |   8 ++-
 target-tricore/op_helper.c    |   2 +-
 target-unicore32/op_helper.c  |   2 +-
 target-xtensa/cpu.h           |   2 +-
 target-xtensa/op_helper.c     |   4 +-
 target-xtensa/xtensa-semi.c   |  10 ++--
 50 files changed, 272 insertions(+), 212 deletions(-)

-- 
2.5.5


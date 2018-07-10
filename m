Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3745514wrq;
        Tue, 10 Jul 2018 09:13:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe2O5ob1SoaMDHVSW9C9Lp+VaboPFFZxeM88Ncvz6QeqtyJBqXIAfszDmin0PKPqlTH8qYl
X-Received: by 2002:ac8:703:: with SMTP id g3-v6mr23624110qth.381.1531239235979;
        Tue, 10 Jul 2018 09:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531239235; cv=none;
        d=google.com; s=arc-20160816;
        b=dQJTdlQeWepMZIP0we/Sul6dX6o43REXmb9CA0ZNA+wiR7XaM3Q5ktoEQAPgk0R5pz
         e9GnDoOiLvE6/lceQbAaEqWH6j2aRGblCWX62apCCsOI6AuYA3aQtd2qmBSkWM3BMtH8
         Rg5q1k3x7URPVju4UCIllN4D4o5ubmXn6vQFD91GH/9pZ4L5gN2t/de0QG53O/7gr8Eu
         kviKLx7bqESkmQ8LIcPyuKbfcXeEKKd4L0sweYQoKZua+D4YEeWKS0Ob9A2Sj7SwrahA
         EXQhnPrnbhJYJEW8xHHMaIFlpCXRabnPUj0ob9Irz2Q5uq1zI7Qvh4GDpUDwG9KxSAfQ
         KtuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=v7TSRM6ZzBvQnXnx1um6JQ8mmU5UJZQhL/IiDLHlFGo=;
        b=ZK+jhP3HNyb6Rm4u3/3hui4l3Gw1OPCV2PsfT0xQBJfWrBs3DaI8/OdgsaQlmxyM7E
         ooXj4llSRSP6h4A2iHJAvkZujKybNn35egzCXvJiPRri0uo7js4PbrDxGnk4LvcFQgXa
         yJrk5445vzFIGImOsISj1SpBp7ARnlgpCtE7y2t9GFaUz0pjoY0vdti8XqzgIhPkUE+B
         BHFv3/AdeDxMB8lLevoMtrRMi7a4Vp5+AlaQFzNXkK5mjZ4+sfTPsJBttXpY9ovl+0kD
         ZVf3qFGpaIfj/nGz+qrXrWuYJW5nRvkMUyna89J7Ji4OtLVmdB0NucNUJRfrYOFeZzJI
         K5LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q30-v6si18122316qtb.403.2018.07.10.09.13.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 09:13:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48717 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcvH0-000684-Uf
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 12:13:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcv47-0003Ze-EH
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 12:00:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcv41-0002Jf-4d
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 12:00:35 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fcv40-0002Aw-NY; Tue, 10 Jul 2018 12:00:29 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fcv3n-0001oT-3d; Tue, 10 Jul 2018 17:00:15 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Jul 2018 17:00:07 +0100
Message-Id: <20180710160013.26559-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/6] accel/tcg: Support execution from MMIO and
 small MMU regions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WOd7mQ5ybl+X

This series adds support to TCG for executing from MMIO regions
and small MMU regions. The basic principle is that if get_page_addr_code()
finds that the region is not backed by a full page of RAM then it
returns -1, and tb_gen_code() then generates a non-cached TB
containing a single instruction. Execution from these regions
thus performs the instruction fetch every time, ensuring that we
get the read-from-MMIO and check-small-MMU-region permissions
checks right.

This means that the code path for "generate bus fault for failing
to load an instruction" no longer goes through get_page_addr_code(),
but instead via each target's translate code and its calls to
the cpu_ld*_code() or similar functions. Patch 1 makes sure we
can distinguish insn fetches from data loads when generating the
bus fault exceptions. (Aside: I have assumed that all cpu_ld*_code()
loads should trigger iside faults rather than dside. Hopefully this
is true...)

Patches 2 and 3 make trivial fixes to various callers of
get_page_addr_code(); patch 4 does the work of generating our
single-insn TBs. Patch 5 can then remove all the code that
(mis)handles MMIO regions from get_page_addr_code(). Finally
patch 6 drops the target/arm workarounds for not having support
for executing from small MPU regions.

Note for the Xilinx folks: this patchset makes the mmio-exec
testcase for running from the SPI flash pass. Cedric: you might
like to test the aspeed image you had that relies on execution
from an MMIO region too.

The diffstat is pretty satisfying for a patchset that adds
a feature, but it actually undersells it: this code renders the
hw/misc/mmio_interface.c and the mmio_ptr related code in memory.c
and the xilinx-spips device all obsolete, so there are another
couple of hundred lines of code to be deleted there. I opted not
to include that in this patchset, for ease of review.

NB: I tested this with icount, but there are potentially
some weird things that could happen with interactions between
icount's io-recompile and execution from an MMIO device
that returns different instructions each time it's read.

thanks
-- PMM


Peter Maydell (6):
  accel/tcg: Pass read access type through to io_readx()
  accel/tcg: Handle get_page_addr_code() returning -1 in hashtable
    lookups
  accel/tcg: Handle get_page_addr_code() returning -1 in
    tb_check_watchpoint()
  accel/tcg: tb_gen_code(): Create single-insn TB for execution from
    non-RAM
  accel/tcg: Return -1 for execution from MMIO regions in
    get_page_addr_code()
  target/arm: Allow execution from small regions

 accel/tcg/softmmu_template.h |  11 ++--
 include/qom/cpu.h            |   6 +++
 accel/tcg/cpu-exec.c         |   3 ++
 accel/tcg/cputlb.c           | 100 +++++------------------------------
 accel/tcg/translate-all.c    |  23 +++++++-
 memory.c                     |   3 +-
 target/arm/helper.c          |  23 --------
 7 files changed, 52 insertions(+), 117 deletions(-)

-- 
2.17.1


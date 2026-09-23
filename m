Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7404EC98302
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 17:11:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9QVJ-0003QG-LE; Wed, 23 Sep 2026 13:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QVA-0003OC-Oq
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:11:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QV8-0000zY-FY
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:11:24 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTYt1595296
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=mpy8GfzB6U3h/VgxUJ724l
 x7Y140GhQDd9gKEjSCAzc=; b=avCVbfmYyqKtfzXDijpV31HiOl+O8GOFSaSw3m
 hL5nRHq8xmQf9Xhy4Ho7GsBSjvrJo3enXKM75sn1aTZpcp7qEziMF6cm7ndY2wyl
 Tp6lnFFH2oNz47bWL+aviwGgb4lOjt9ohtQKucBE61srJGOsnJ8Gql8FfeqaHaQY
 596My5cszqq6oSkp6hbWmtDYDprwCYsueNffT11IGST6vy4jIVcsIydIdGAGy+pG
 xwMVN0DYFJDpNHYGNUHmWYRaQQH2vOVFwjYcJM8dC/Vbcr18cTs/zFKYNC4DuJI1
 p7wV5P0aQEojxgxaD7aTxbPDBw2e+qfUHW+QqXRfVNGTO5QA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxs390-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:11:20 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-97cc09260a3so65546241.0
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 10:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183479; x=1790788279; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=mpy8GfzB6U3h/VgxUJ724lx7Y140GhQDd9gKEjSCAzc=;
 b=hq8my2aALbsfyFDrL4pDZ4Y3ZUpQUhajopPJL8e6WdMFdu5M+0N5GiOWbiG5fpYQQG
 gS+JQTR5WEWaypJG7H8OZE4vDlf6s1+r4bGkYGRz5YEeDW616NndUBCol2p5J0DnblC3
 +I2bOIMCQYru5WRsgWmkHBJwE6w/791gB69mBR1hNowP7AMTz0L6NfjDg8KlNsfeU+tW
 ytkrWZpOvcCTfhW1L96PACT1e1Z2UeFdy/l9b73iWxiyVsowqNqmtCrPjH+z6CbkOex+
 vu6UIkIve0+W2YN1VpVecyW2w85ScYDsEcTBMkhaSNq7IjiqtwscDT/B4atmtw4qgasA
 yGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183479; x=1790788279;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mpy8GfzB6U3h/VgxUJ724lx7Y140GhQDd9gKEjSCAzc=;
 b=ReC1Z5mkGxkRxLLAn77ibZDRJrIFdm0as1c/X8vqHo42eQtG8LbmTewOCBtV91Spyo
 K+s3PS9N5ZRfJsFKDC95qYepAOy23/upS3dJS8OGtMBTZoE5CjVVjkapYTMKaBOhKxjU
 M/HXLVaFChIXYpu4D5CrspcQ6cMw0QTR/lzHdUC+qhSu8wt0d4qSwvEsRBXYHJ7ldDnT
 q51erXw7QiUNzU55E4gKfItvigw6pw94UNB4glEov+VLaa7V/IA/iUwUhcjrlh8WdI4m
 EZMhSaxlVd56rMTeHAz4JaNvu+oUNAmqFoVHjRHrwQptERjAncLgzGPOEs+9dSJNqLAh
 ZkpQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwgRpLmNxfaHra0aOZ1Zicyr6bTY7pSxm5hiHtYLd1XBlSWiK0UGE41mY3PkR2njbobcxtsTmMCvw==@nongnu.org
X-Gm-Message-State: AFuF++nHPLCE0WLLF1LHN0keHZmIzdqu2AQ8fsj2Mh/oYGS/vW2syD0M
 JS2UQJ+pI3NKEch90rVaAMETvYZ7owqu3NgKZ6iQGfxfVDTIDQDKKihukkJldhoByXXfkA6kTeU
 jMz0YeBVmVWhbcuhX5pimxQKVNLeKvzNFGJNM3TDgqUvY795Z65kMr8Q=
X-Gm-Gg: AYBFou3ddzhqTxLXyZyNi9QIc7696rU30HzSfcNSfjDqF450rfS/8PE43W2SBKiApCf
 7WHwprBonsoLxFQvuRjCoB1gYSPMdXtnelGQZH444uqHlpNbtavnslZfzYZSqv7KQV9A5K9TXNx
 w9QsOP+hSmXpxUteO4L4T5uORKQMfDoHafnYkCGyNtOhpahDIRRkX88cxs4m67T6uOkRdRLQRst
 UCFwlCOJCJO/cohIaU1MNLG7EWSizqNF8mIaMZSuckGiawsN2s18JAcPpgm1tZdlLCkK2gDdxhT
 AZtZTSElxKSkR4jSPWWXUPywUS3ZRwgovJ/YNoYwXUUzdnb4zwS9O3DpUjE4bFiF4bjBoaEVSHe
 ZPEKs5CLznengL5QpVFK/uTo3nnXldjhuzo+l84/I
X-Received: by 2002:a67:f818:0:b0:7a1:f2b5:646c with SMTP id
 ada2fe7eead31-7aaa0f22399mr5116858137.41.1790183479325; 
 Wed, 23 Sep 2026 10:11:19 -0700 (PDT)
X-Received: by 2002:a67:f818:0:b0:7a1:f2b5:646c with SMTP id
 ada2fe7eead31-7aaa0f22399mr5116838137.41.1790183478755; 
 Wed, 23 Sep 2026 10:11:18 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5cbd134sm687575e9.9.2026.09.23.10.11.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:11:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 00/21] accel/tcg: Make halt-to-exec transition explicit and
 remove cpu_exec_halt
Date: Wed, 23 Sep 2026 19:10:54 +0200
Message-ID: <20260923171116.31276-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: c83F3HdZ1wQE6mIofWvp2d-89KViIPQm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX63Rq4Nm4mwrW
 iK1Gr7+2Lz10krdJob2u3lk5WEmNtgFyQi+J5qxUBAn56pHqvNyw146EchydzodvHP8NQbK4mFk
 1FVoGjNRNBP0v2XTqR9fqFVaPSZ5o3HVMSzzbLL4wkF7Kcdl9oKdCGmptozQH2sFu3sy/kZDM9V
 yO2WddkcX7UCd+S7hsR6yitqXF6CUTS+TSvCSsKSh9ROiIG27K3nl0NbnpKINKYZwWBPci5xWjS
 way6HrZbyv2Z0EkZ5ay9VdJ1E/7kg3/aOcm3iQFBjFXF+mqhr8Q/tsBPmstQx8w1VXiACdHfETL
 DCZvTMRxZLEiL9mGHDN3vGqW7Gt8uXgi/Qr+vUX4IdDODzxSPS9mVYyEVznoYf+aKmdYeZlcDKz
 iI2PUdQEB8PRDcnIVN0DEJ+UsVbwat+uDvh2Zg6Ag/4qFniOi6B2Qu69bGTbMJWapwbMZ/laAR3
 Egq2h4cH5B+DvCDWdjQ==
X-Proofpoint-GUID: c83F3HdZ1wQE6mIofWvp2d-89KViIPQm
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab40838 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=lXy-g8FGwViYJ1dSwUkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX8O8AW8TNx2x9
 FLF4vM8rIY/n2/q5wt3iEYd1D6XUr1NsVe78Fl9NJ0EhvhGxIWW2fpLTTS5a908QaOb/hFWsNIj
 0Vte6s70UJaEz8ZSuOGV5M9yVWqXsFc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Missing review: 4, 7, 9-12, 17

Since v2:
- Make all ARM halt_reason accesses atomic, including WFI/WFE helpers
  and halt-exit handling, and read event_register atomically.
- Keep the RISC-V changes focused on MIP: skip empty updates, add a
  shared accessor, and convert existing MIP reads to use it.

Since v1:
- Collected Richard R-b tags (sometimes commit description updated).
- Documented the BQL and synchronization requirements of has_work().
- Renamed the callbacks to poll_during_halt() and leaving_halt().
- Addressed Peter's comments by removing racy halt-work assertions,
  documenting the BQL contract, and explaining why x86 #DB delivery
  through do_interrupt_all() is safe without the BQL.
- Addressed Paolo's comments by making ARM PSCI state updates atomic,
  kicking remote vCPUs after power-state changes, and ensuring x86
  APIC polling runs before cpu_has_work() with the BQL held only
  around APIC access.
- Sanitized s390_cpu_get_state() for atomic accesses without BQL.

This series was inspired by a previous thread on the list [*].

Refactor the CPU halt-to-execution transition logic in TCG as
something more explicit and composable.

Core problem: TCGCPUOps::cpu_exec_halt callback mixed concerns,
it checked for work, processed async events, and handled state
transitions all in one place.

Solution: introduces two dedicated callbacks:

  * poll_during_halt(): Process target-specific async events
    before checking for work. Called early in cpu_exec().

  * leaving_halt(): Perform target-specific state updates
    when transitioning from halt to execution.

This separation allows the generic cpu_exec() code to orchestrate
the flow cleanly (process events, check for work, transition state).

Only 2 targets need to be migrated (x86 and ARM) then we can remove
the redundant cpu_exec_halt() hook.

The changes are expected to be purely refactoring with no functional
impact.

[*] https://lore.kernel.org/qemu-devel/CABgObfaDAhrpnVqQaKgG6uxPQe1YDu77YOsUEx9nqrN=3M2cGw@mail.gmail.com/

Philippe Mathieu-Daudé (21):
  system: Document has_work() synchronization requirements
  target/s390x: Use s390_cpu_get_state() consistently
  target/s390x: Make s390_cpu_set_state() return void
  target/s390x: Use S390CpuState for CPU state APIs
  target/s390x: Access S390CpuState atomically
  target/arm: Un-inline arm_set_cpu_power_state()
  target/arm: Kick vCPU after updating PSCI power state
  target/arm: Access PSCI state atomically
  target/arm: Access halt state atomically
  target/riscv: Skip empty MIP updates
  target/riscv: Add riscv_cpu_get_mip()
  target/riscv: Access MIP atomically
  accel/tcg: Refactor poll-while-halted flow in cpu_exec()
  accel/tcg: Introduce poll_during_halt() and leaving_halt()
  target/arm: Split leaving-halt handling from arm_cpu_exec_halt()
  target/arm: Convert cpu_exec_halt() to leaving_halt()
  target/i386: Use an acquire load for interrupt_request
  target/i386: Split APIC polling from x86_cpu_exec_halt()
  target/i386: Split leaving-halt handling from x86_cpu_exec_halt()
  target/i386: Use generic halt transition handlers
  accel/tcg: Remove the redundant cpu_exec_halt() hook

 include/accel/tcg/cpu-ops.h         | 36 ++++++++++++++++-------------
 include/hw/core/sysemu-cpu-ops.h    |  6 +++--
 target/arm/internals.h              | 11 +--------
 target/i386/tcg/helper-tcg.h        |  3 ++-
 target/loongarch/internals.h        |  1 -
 target/riscv/cpu.h                  |  1 +
 target/riscv/internals.h            |  5 ----
 target/s390x/cpu.h                  |  9 ++++----
 target/s390x/kvm/kvm_s390x.h        |  2 +-
 target/s390x/s390x-internal.h       |  1 -
 accel/tcg/cpu-exec.c                | 20 ++++++++++------
 hw/intc/riscv_aclint.c              |  2 +-
 hw/intc/s390_flic.c                 |  7 ++++--
 target/alpha/cpu.c                  |  1 -
 target/arm/arm-powerctl.c           | 13 +++++++++++
 target/arm/cpu.c                    | 31 +++++++++++--------------
 target/arm/tcg/cpu-v7m.c            |  1 -
 target/arm/tcg/op_helper.c          |  8 +++----
 target/avr/cpu.c                    |  1 -
 target/hexagon/cpu.c                |  1 -
 target/hppa/cpu.c                   |  1 -
 target/i386/cpu.c                   |  5 +++-
 target/i386/tcg/system/seg_helper.c | 17 +++++++++-----
 target/i386/tcg/tcg-cpu.c           |  3 ++-
 target/loongarch/cpu.c              |  2 +-
 target/loongarch/tcg/tcg_cpu.c      |  1 -
 target/m68k/cpu.c                   |  1 -
 target/microblaze/cpu.c             |  1 -
 target/mips/cpu.c                   |  1 -
 target/or1k/cpu.c                   |  1 -
 target/ppc/cpu_init.c               |  1 -
 target/riscv/cpu.c                  |  5 ++--
 target/riscv/tcg/cpu_helper.c       | 20 ++++++++++++----
 target/riscv/tcg/csr.c              |  6 +++--
 target/riscv/tcg/tcg-cpu.c          |  1 -
 target/rx/cpu.c                     |  1 -
 target/s390x/cpu-system.c           | 26 ++++++++++++---------
 target/s390x/cpu.c                  |  3 +--
 target/s390x/kvm/kvm.c              |  4 ++--
 target/s390x/kvm/stubs.c            |  2 +-
 target/s390x/machine.c              |  2 +-
 target/s390x/sigp.c                 |  9 ++++++--
 target/sh4/cpu.c                    |  1 -
 target/sparc/cpu.c                  |  1 -
 target/tricore/cpu.c                |  1 -
 target/xtensa/cpu.c                 |  1 -
 46 files changed, 150 insertions(+), 127 deletions(-)

-- 
2.53.0



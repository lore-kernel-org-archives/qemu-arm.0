Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995D7C5DF87
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 10:50:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxMox-0003hF-DL; Fri, 21 Aug 2026 06:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMov-0003fx-GP
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:49:57 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMot-000335-Nh
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:49:57 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9MAmQ2006587
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ZNFCI4C2NoYEsjyBhYlm7b
 UDKocJg7C3gcE3cL9lgC0=; b=inoA4b5T/LPHtIS4f1VO7h7CRRwTTue9SAWjaf
 D6gH96ee1RnNsutm8lX4ZFwqv3/KQz1iYQneycMS6LzX/qKrBpFI3KWl7tLIYi0A
 xcq53SbGUPPiGzlRIoowMxWlKolv00tzgs9Ftmj4Oe1oBvyJEcWM1fZs04+1e8V6
 NW0sHRM3t9hkpUcfhuVaOusVBuKuc1QSTsPjNd7cjFGNzpK6FP48rxlHM+8EVg0y
 nl1eUXifkcb8kDriQWfqweqHoUEsNpyPSNEjN/3mvNC2cbeTNvyEEzM7yVCQtj0M
 Th+lqKsQwkVzFwmdgh/q+X2etzakj64MrlezD2C3KgxP6Ymw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddh62c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:49:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c0408254aso26614131cf.0
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 03:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309393; x=1787914193; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ZNFCI4C2NoYEsjyBhYlm7bUDKocJg7C3gcE3cL9lgC0=;
 b=cEY5/yKKPRiCWCjxY+tCl0yT02ZG0SuO7P0ZggKMUyy2GGQwDbzU9Fb+QQyR9D/lZm
 nRL8oiDRlPdcERDGQO5VSbdNym96nho75xnf4RyzjqRiAPOogf0RRF2n7VUzycCFdXDP
 hL2jZ32hkGu3UqMPbMAOisdy1TIi8BRprnNSBkJXc+Sc3enVywXjGSR4scNEDvXCTdBo
 JTTXNlPBF6oLVl1+DxqUiXOtOtGAp5G1/fncB5P8G06cCg1yrtj+H63e/uRwY8f0lyF4
 z8w74H13nIRRI6waRt+VybN1vbrvE/d7wRnB6nYd8ghxqU4dLeWKKJZ3hHnBSc8IvPzY
 GQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309393; x=1787914193;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZNFCI4C2NoYEsjyBhYlm7bUDKocJg7C3gcE3cL9lgC0=;
 b=leRUdXuct5Dhp9nRY9G3R/x8dKkpXSEmFuEQjltpc1rsGeMbBHgwATxUt4p1b6Cd2F
 VffUP+e45AOTevaEt8e02Of4+blkrsIO+rEMpujJirypkv/mziv3ULF346EGJwFmNM7H
 TCr0/Rt/w7mmUHfNkTLwn+aWrjSFdMzqWqSH0yirjibMZVZWsyZIk1psnQ8OprQtec0b
 J7FBfiHl2LnwYVMAiGsuhf/f4mMswIYFFrkOpzI+fq2NgUj0kqDEc++RWOs90bDOI+2i
 hWx7nVh2OtPnVIkBM6otJR9TyItJsvlVfHEBZ7uSa1h5SIVIz+yu8zIEWHlfkUAXpzMs
 /99w==
X-Forwarded-Encrypted: i=1;
 AHgh+RpadciPZJ7+PDvj8EYOKYBOKEjAwoefRwDKpmao0ym4ykb9DGg5cDu+rHqfKMCd/AIe88mlwA/xfQ==@nongnu.org
X-Gm-Message-State: AOJu0YwSQja2ljY6/r64swk7hBRYG2c61e30E93rLWr7skNcJRGJYxjY
 a72uqWBDAmai9evrJyvNQ5940+i4fwDyhYTHHwCp4jBFrPf7mA/meqAFdYYH8fEjDMPkUUNCzDk
 p+XMZ0tlNYu/pog6aY2YqgIM4yOLztpXmiOkoSevrRZ3NCpHRU6Ul+6A=
X-Gm-Gg: AR+sD12u1KtBNkWMkdtqht7rw6LdsCk20d26Zd5BoTgTVvFIyDfg9NQ3bRwoovsbldo
 7rCJKO059Vlf3KEJUa9EibEflz5/q72CCD2NHujeAEQvkB2S6Hr8yQF5nt3bI4Obx+CyuzNosYJ
 Ezkuz5BqMajMO+r/k7jxz/WuhXRWB/nrBVZ54fkqXLtov9MD8XF7dB0pUpEgSHjfm3T3Ej/ahpS
 r5raSn3hbJVahyGn8r68qSJR09QTGqSxWfdEOn4Xv+gs+WHBiyP73HENH3aKDUK7Rkpgd2yGMWe
 4uDqDByY9Qf/fn+fwGfBWky2bmKgJLU2PsTWbnryTaaj8ARiv83am8Sl+C1vwLQ4MpxRlbMfSj1
 dePkqHkVO3iBzkQQMUYOpZ02oSkxtPS9wus2yCae0Hg==
X-Received: by 2002:a05:622a:1b28:b0:517:6fc2:4760 with SMTP id
 d75a77b69052e-52de2fb21dbmr130260201cf.9.1787309393384; 
 Fri, 21 Aug 2026 03:49:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1b28:b0:517:6fc2:4760 with SMTP id
 d75a77b69052e-52de2fb21dbmr130259871cf.9.1787309392987; 
 Fri, 21 Aug 2026 03:49:52 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14b8050sm17287766f8f.19.2026.08.21.03.49.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:49:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 00/15] cpus: Constify @cpu in SysemuCPUOps::has_work()
 handler
Date: Fri, 21 Aug 2026 12:49:34 +0200
Message-ID: <20260821104950.32108-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfXyUxgPgcpQz0L
 dENoajKLbAYDfAgRmPt2/f/CCoVgn9ThZG1y8vSzv1SsQqLEfb84g4k5UUPOFbSgb6ARik0mqvo
 OlApWPfJWz6cQpHEg57fHQZuUettReU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX3IA/o4atrL40
 wcDtQmaY+qkYkEPJRPfj2EwP/oVHB5BUY7pEUJJrVzNJD/eJM6zaU3HzQ121zxUSzfmNeJmU8mQ
 jpvVHN5Kb1MhAES9ykhg/NiDJQJ757vg3SnAUeDBY4evzx3ru8mYmN14VjsEwJ9VQ4dVFk+meze
 RT2QovMUFbV33GYlLbAt75ucx6Afo1LhSZGRL90AtnyK5fcd/r70uzjEu6GeO1ZgHMdrl/ef03J
 vNL2BdlAEYRDZIP2Yv7TxPITqZm5zudgywCi1agDF0SVRUvFTehzkYbpqT1LFytk05qI2N1m/Xq
 APpfrssVcq9BSrrnMD2OB1CQ4gDlydAfT0N7ehGz8Sv3IHlcisB5Q9G6jPEYJJDwxcKCk1IdjC7
 bVktDEy3d1mlJ5Giiy7bIteeKdMtrFd47PIap4m9M0LnNHD1rFyf+FFRYBRZs9sLZaviL81sdUu
 MfFXvbMldGqhp9A7Byw==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a882d51 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=JaqPAoXzzHJsSOSiC2EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 3h4wxc78He3eC4RvgllCZQ947mN7P-VH
X-Proofpoint-ORIG-GUID: 3h4wxc78He3eC4RvgllCZQ947mN7P-VH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210081
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

Missing review: 4, 15
(I plan to merge myself once reviewed)

Since v2:
  - Reorder _Generic changes first to maintain bisectability
Since v1:
  - use _Generic (rth)
  - no more RFC

- Patch 1-3 add const-qualified variants of cpu_env(),
  env_cpu(), and env_archcpu() using _Generic() macros;
  consolidate the redundant env_cpu_const() alias and update
  linux-user to use the generic accessor
- Patches 4-14 trivially add const qualifier for various
  cpu_is/has() getters
- Patch 15 finally convert the SysemuCPUOps::has_work
  hook and all target implementations.

No functional change; purely const-correctness improvment
to enforce has_work() callees don't mutate CPUState.

Build-tested.

Following checkpatch.pl errors ignored:

  2/15 Checking commit efef90983aa7 (cpus: Add const-qualified CPU environment accessors)
  ERROR: spaces required around that ':' (ctx:VxE)
  #46: FILE: include/exec/cpu-common.h:89:
  +            CPUArchState: \
                           ^
  ERROR: spaces required around that ':' (ctx:VxE)
  #62: FILE: include/exec/cpu-common.h:101:
  +            CPUArchState: \
                           ^
  ERROR: spaces required around that ':' (ctx:VxE)
  #90: FILE: include/hw/core/cpu.h:605:
  +        CPUState: \
                   ^
  total: 3 errors, 0 warnings, 64 lines checked

Philippe Mathieu-Daudé (15):
  linux-user: Uncast void pointer argument as Object in
    target_cpu_free()
  cpus: Add const-qualified CPU environment accessors
  linux-user: Replace env_cpu_const() by generic env_cpu() equivalent
  system/cpus: Constify various CPUState arguments
  target/avr: Constify CPUAVRState for some cpu_*() getters
  target/hexagon: Constify CPUHexagonState in
    hexagon_thread_is_enabled()
  target/i386: Constify CPU*State for cpu_*_interrupt() getters
  target/loongarch: Constify CPULoongArchState for various cpu_*()
    getters
  target/mips: Constify CPUMIPSState for various cpu_*() getters
  target/s390x: Constify S390CPU for cpu_has_*() getters
  target/riscv: Constify @iprio argument in riscv_cpu_pending_to_irq()
  target/riscv: Constify CPURISCVState for various cpu_*() getters
  target/sparc: Constify CPUSPARCState for various cpu_*() getters
  target/tricore: Document architectural interrupts as not implemented
  cpus: Constify @cpu in SysemuCPUOps::has_work() handler

 include/exec/cpu-common.h        | 29 ++++++++++-------------------
 include/hw/core/cpu.h            | 21 ++++++++++++++-------
 include/hw/core/sysemu-cpu-ops.h |  4 ++--
 include/system/cpus.h            |  4 ++--
 target/avr/cpu.h                 |  6 +++---
 target/hexagon/cpu.h             |  2 +-
 target/i386/cpu.h                |  4 ++--
 target/loongarch/cpu.h           |  6 +++---
 target/loongarch/internals.h     |  2 +-
 target/mips/cpu.h                |  6 +++---
 target/mips/internal.h           | 10 +++++-----
 target/riscv/cpu.h               | 29 +++++++++++++++--------------
 target/s390x/cpu.h               |  2 +-
 target/s390x/s390x-internal.h    | 12 ++++++------
 target/sparc/cpu.h               | 12 ++++++------
 linux-user/elfload.c             |  2 +-
 linux-user/i386/cpu_loop.c       |  5 +++--
 linux-user/i386/elfload.c        |  2 +-
 linux-user/x86_64/elfload.c      |  2 +-
 system/cpus.c                    |  6 +++---
 target/alpha/cpu.c               |  2 +-
 target/arm/cpu.c                 |  4 ++--
 target/avr/cpu.c                 |  3 ++-
 target/hexagon/cpu.c             |  8 ++++----
 target/hppa/cpu.c                |  2 +-
 target/i386/cpu.c                |  7 +++----
 target/loongarch/cpu.c           |  4 ++--
 target/m68k/cpu.c                |  2 +-
 target/microblaze/cpu.c          |  2 +-
 target/mips/cpu.c                |  4 ++--
 target/or1k/cpu.c                |  2 +-
 target/ppc/cpu_init.c            |  2 +-
 target/riscv/cpu.c               | 17 ++++++++---------
 target/rx/cpu.c                  |  2 +-
 target/s390x/cpu-system.c        |  4 ++--
 target/s390x/interrupt.c         | 22 +++++++++++-----------
 target/sh4/cpu.c                 |  2 +-
 target/sparc/cpu.c               |  2 +-
 target/tricore/cpu.c             |  3 ++-
 target/xtensa/cpu.c              |  4 ++--
 40 files changed, 132 insertions(+), 132 deletions(-)

-- 
2.53.0



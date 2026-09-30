Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74330CA5FC4
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 17:50:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xByRH-0001OK-C0; Wed, 30 Sep 2026 13:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByRF-0001MI-0Y
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:49:53 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByRC-0001I7-SP
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:49:52 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHf0aY480249
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=2VMj1JVwFAs6N4Fu4O6qf7
 jOa/0EQUdj47OIiZixAyo=; b=JfxS+Vlmal/R+FbrH4t87PnuoYp9y2gcOK2e3o
 KO7TrSrlKkbMP4CIomhm/2LmUmi8c5YtFZz67IvUCZR8/XXmuLDCeHxYgaDilJRH
 0xEl5W9CzIfPImU3NRbTgqYuVBvsXqeNtu8oKU9CLSw5Z5YpFnSVY1E0wv4kzCUR
 ElwLbvxan0bmyyioixg46oY/XzXOu1wdIrpksIKdx3Cs5ZKkzptXgA/23lTJdXFj
 DsHNXK/dFJjW+sho5GEk/E19Ye5lOtGG9LLxTyXfcvJV65qaEZ8QEwGbAg+I8Wq9
 luch0bxT8xECxBf+Upb9FSz2nlNO07o3Jo65zBPk2wb0zN8g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h155vrmqq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:49:49 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-988b5c59668so2516973241.0
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 10:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790790589; x=1791395389; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=2VMj1JVwFAs6N4Fu4O6qf7jOa/0EQUdj47OIiZixAyo=;
 b=XHZol/OvD13lrD/fPhd34Ez0b3Kf79pBCWAt1sWsiB+89//ZefRJibrM9BK7ur9rge
 FzxBi6QcRhA2YJwPTEhtVoiQ9qmKq4n+JETDCoG8S4Zc+meo11hdGtXPiScpmYgAlHCP
 TQ+yWMm6aEPfxg5DD2MmTuILVKSuvV1is2TCpx8kNNtyLSgKCleCuXtKOa7d9FtXJNKP
 55/QDOemqLLGIxBnkgXMYZrw3CirJyNCqit59P5x1G6lzVjswy+2i+bUheDOtMea6203
 X2fpt0VRtTPlK0oQI4Pd+xHpMkBJ/ztcU3V1f3ytaEnFzSfF6DNXry4NaSeJJfPseBpS
 4vSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790589; x=1791395389;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=2VMj1JVwFAs6N4Fu4O6qf7jOa/0EQUdj47OIiZixAyo=;
 b=nVRzRWNmLsPz7fHajt8vTqrCELbJ/aCsBxDxb+dpjZwVaijbrgnrhxjFb8kGNhgLbt
 TtS3tNFabpIThnyvHVyxOe9gbZ5vdXG2mDU6PfQh4pEJHK89VtXgUQBptnYERJ3Ex2vY
 YY8ifShU8ICLDszg9XT09PU8T45+HN2TFZ0n2YAj1bycic6GDOqYcdJjbONw9H8VC5wZ
 dF/vlGTE1Thl8Sj4I3SeJicua+ttU6wTyz7sPQXkpidWWKuFUoE5AiBEAzYbw7CyC+ST
 Qq29U09YmVLA0NycnYiVAcAYgnreR+suYea24w65OxgY8IVWXdIlQrF85BQS/7igbMa8
 iCwg==
X-Forwarded-Encrypted: i=1;
 AKwUvBypFXZQO7EOHdx9CcP5EkaNoFLL20iZjryZUY16YLYb4EXoiNTSC08dgP7D3+zPOm57zvzI5PK0JA==@nongnu.org
X-Gm-Message-State: AFq9FYIN5xTlw+4hS6f2fpn3iU3Hc5+6aA7+WT1kSjB9oxF9+tHjl4IX
 +PWyKA9VIyWTKtJWgJXhMfpZ5+X1BWKbH8IGQz8Jpl4y1HRm6N8oRZRxlAcXhq30uBnYgxDp1gK
 vznu1dbpiZ4nfVvO9/12s2h1fd/Tf/zlgnehOVlTCCZFrv+s6wgM5yqg=
X-Gm-Gg: AYBFou0SIqulDTOc2Q445n9x2qf0lJbYj5JDMMZNUR/rT2FhjCUq4QZ0ePmA+jb1sx1
 p3yLkvGJtq4KHMmBheQwGMdNJLBQvVApLiHsGTvRJ1p1wiPkHhz7SjEMmuqH+8UfT6AjgBCN8ES
 s/RuLfoIOkL6RpDXiXbchvAH8l2p538pUe5qha/LCbCimFVXuS/aUW9601Kuy+i1eTqreF2yAX3
 qq10mFTWYx8dE98mB6XaZc+hq3iZZrnr+xh2zDPvjdXdXAKYDbql5F26R19QX2P1aFQsbYffKLC
 FYHdYPsrAhP9Sot0iQCC/0Shl8dwjr9Cmc+RFKfbyMg3P2FC5jcxW4M26+tdM5MUmtdGt3iErOL
 F+rBkt19a3/NnuH6dpXc1xEpfFRo96Fhwsql6wtSY
X-Received: by 2002:a05:6102:c4e:b0:7b3:4199:2dd4 with SMTP id
 ada2fe7eead31-7be73795a33mr713468137.20.1790790588775; 
 Wed, 30 Sep 2026 10:49:48 -0700 (PDT)
X-Received: by 2002:a05:6102:c4e:b0:7b3:4199:2dd4 with SMTP id
 ada2fe7eead31-7be73795a33mr713456137.20.1790790588223; 
 Wed, 30 Sep 2026 10:49:48 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01eb60804sm12222585e9.1.2026.09.30.10.49.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Sep 2026 10:49:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 0/9] accel/tcg: Make halt-to-exec transition explicit and
 remove cpu_exec_halt
Date: Wed, 30 Sep 2026 19:49:36 +0200
Message-ID: <20260930174946.82195-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfXwesenHigBy6n
 osW+NN7SF7IAb7Bjb3niFSNEMRtHKBPejlJsaMjniZZRxhzuJcgPSDwoSxxAiycZfj8eJpLd9Xx
 KUh3tqhv0Xg4rSyM1CHJhMOflsyS4ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfX8/50V6Ehcicq
 xs+pFeOxppTYYwmz5wGa9Ctsv77t7/5ilNKXwwRaFAbCiP4jg6lAsvEK4LaavAeWAYGw5Yq519R
 nawP/uj7x4p0WvsZkGoKgkyYy5Emlrp0R4Y7Q2UMAD5qUtp5pg2T/e1cMAN75G8r76KSJPK5CFH
 ts3X1bktm8bQIpV8QUnlWJo7tjdmMGEdw8HrLtEBG8K5R6Vk05+eGUoRCD8khKsXxhIPeYbe3Xg
 kuMf2Sg0yGLdECmKHjFGf1AffEMTFZCK/kSiSAFd8U8BLx+boZ1Zh/YWD7VZFG6bhR1tco84lBr
 1gDqBi32/c717oDJHQRGK01uEPq3AtWwgZII4CeFmZkNO1rpFVc+yBgJ+9BmnZvZvEBmkok+9BK
 uhZDE2XJwVWkAKP/bZm3e44LLmBgsNqXNBfADciDmsry9lSz0BXudtsu2SKtpH/v5Fkf4/yJrye
 +T4+tyvPZJmI3w7sHJg==
X-Proofpoint-ORIG-GUID: j3snAXdtwTbOKyv5eKl9TqfoIDq9UW2h
X-Proofpoint-GUID: j3snAXdtwTbOKyv5eKl9TqfoIDq9UW2h
X-Authority-Analysis: v=2.4 cv=ZYOIpcVA c=1 sm=1 tr=0 ts=6abd4bbd cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=NrQd3uPfcZAIwh0YapMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300071
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Missing review: 9

Since v3:
- Rebased (s390x, x86 and some ARM patches merged)
- RISC-V posted separately as [1]
- Better describe ARM PSCI power-state update issue

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

This series was inspired by a previous thread on the list [2].

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

Testing: Usual CI.

Based-on: <20260930174508.81497-1-philmd@oss.qualcomm.com>

[1] https://lore.kernel.org/qemu-devel/20260930174508.81497-1-philmd@oss.qualcomm.com/
[2] https://lore.kernel.org/qemu-devel/CABgObfaDAhrpnVqQaKgG6uxPQe1YDu77YOsUEx9nqrN=3M2cGw@mail.gmail.com/

Philippe Mathieu-Daudé (9):
  accel/tcg: Refactor poll-while-halted flow in cpu_exec()
  accel/tcg: Introduce poll_during_halt() and leaving_halt()
  target/arm: Split leaving-halt handling from arm_cpu_exec_halt()
  target/arm: Convert cpu_exec_halt() to leaving_halt()
  target/i386: Split APIC polling from x86_cpu_exec_halt()
  target/i386: Split leaving-halt handling from x86_cpu_exec_halt()
  target/i386: Use generic halt transition handlers
  accel/tcg: Remove the redundant cpu_exec_halt() hook
  target/arm: Kick vCPU after updating PSCI power state

 include/accel/tcg/cpu-ops.h         | 36 ++++++++++++++++-------------
 target/arm/internals.h              |  3 ---
 target/i386/tcg/helper-tcg.h        |  3 ++-
 target/loongarch/internals.h        |  1 -
 target/riscv/internals.h            |  5 ----
 target/s390x/s390x-internal.h       |  1 -
 accel/tcg/cpu-exec.c                | 20 ++++++++++------
 target/alpha/cpu.c                  |  1 -
 target/arm/arm-powerctl.c           |  5 ++++
 target/arm/cpu.c                    | 20 +++++++---------
 target/arm/tcg/cpu-v7m.c            |  1 -
 target/avr/cpu.c                    |  1 -
 target/hexagon/cpu.c                |  1 -
 target/hppa/cpu.c                   |  1 -
 target/i386/tcg/system/seg_helper.c | 17 +++++++++-----
 target/i386/tcg/tcg-cpu.c           |  3 ++-
 target/loongarch/cpu.c              |  2 +-
 target/loongarch/tcg/tcg_cpu.c      |  1 -
 target/m68k/cpu.c                   |  1 -
 target/microblaze/cpu.c             |  1 -
 target/mips/cpu.c                   |  1 -
 target/or1k/cpu.c                   |  1 -
 target/ppc/cpu_init.c               |  1 -
 target/riscv/cpu.c                  |  2 +-
 target/riscv/tcg/tcg-cpu.c          |  1 -
 target/rx/cpu.c                     |  1 -
 target/s390x/cpu-system.c           |  2 +-
 target/s390x/cpu.c                  |  1 -
 target/sh4/cpu.c                    |  1 -
 target/sparc/cpu.c                  |  1 -
 target/tricore/cpu.c                |  1 -
 target/xtensa/cpu.c                 |  1 -
 32 files changed, 64 insertions(+), 74 deletions(-)

-- 
2.55.0



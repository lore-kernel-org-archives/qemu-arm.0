Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4961DC624CF
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:53:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LAU-0007RO-AA; Tue, 01 Sep 2026 05:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LAS-0007Qi-QX
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:52:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LAQ-0007D8-NI
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:52:36 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68179Cis2061542
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=i5URzrrMYiQnzaveB3AHsG
 WR3hO807T0gheZvZpHFGs=; b=mkyXYw5seBK1mpaBG2GpLgBZLM1PVFxlYNVYIi
 iul4Sntp11jd6p0vwoVHsW1aWmSEhVIDo7biYgFXRJda9oQ5+/TcwEYoRyGzs5F0
 lzQCNJOApBYeVE9Cq3k16dH15s9UnNiHXBOy5m10gX4ulIxfCcrYHAn3mK4FhIVQ
 fJr2uAEpEqw0dJPqZaEOfR7jqp+6/fwHN5EHj5ruginR+GPxwSA4pW5rKU+WiNAC
 Gw2KH9d1WtmfG8Pcs7I5zkCbi34XUzC1QcTBHVsqmUVlRNzRpGHvBvQ4CRP937KU
 B56GTpXxsFsMPFuQhROB5GdmmPjZrBxeln/SqzfuLeGqOJuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh1drb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:52:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-936708f129aso598160185a.0
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256352; x=1788861152; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=i5URzrrMYiQnzaveB3AHsGWR3hO807T0gheZvZpHFGs=;
 b=dBF3WmjTQzp3WVqjMRYYug81gODEAJQ+LgKWSwtL8IlpBbW+b2VM1WZ6oCV2KvOlXb
 gLcB3pGlkQaX8W1RGGv0YU8Wzc7cNcy2XhFr/aznZetXBVcM3ElZ4KhVn+Qp1McqQTaO
 wLhdqFZ1NoIkH75FuIvu4yEIm882kXo25Dd5eTYuT9skzJ8x30RpkLivNlgkFyGcmYVM
 B1xWMJ1uQpENf3qxBJsnY+Az4Fy8Fc+T+w5ZUj5gLXu7CWxae3BqMlQ3438MBsohoJOL
 DAzifVy680wRb7U4KMRoRHC3Ya0dCueni9Xid7/n6qT/obfSp/osixurMr3HG+muM1Bx
 Ug5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256352; x=1788861152;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=i5URzrrMYiQnzaveB3AHsGWR3hO807T0gheZvZpHFGs=;
 b=jLRE6B+0NlY8U05SJbiBsPgq1R7SWdY2FWNOQfYckCEUJ/h1uSMKdy1av3d2/lffVd
 RmpjD7YD79Sc8UroYiYqdYTpdkBERRhphuJAe9ey5z0Hh9tB5OWYZ+ff0QtcKehxJL/2
 99SFJvtzra7O6BxqyJjTItKvR+ZFkwuJHnHUdn59b+gQdnNWPGOxI/yZxvhRn3PvvsDi
 +D6i7zNHNShlTka7WB+46/3+hfkx2tLGiZlIZPKshRouFthMevwRijP0LDsogqcjQS2w
 lez6sSnUqGNub4rzkCUI9N/u1r79/bz7QjIYFIysCkQuxqnFNrEXP3ZAZIPzifOQPakf
 qGyg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqjVg0KMbIj44qKeeqZ5j42ZegAXMPGDc3/URAALuJlALMve8J4mGcrOhq/MLbZWGilmpl/C3njbQ==@nongnu.org
X-Gm-Message-State: AFuF++nEvCY0RAwFnErulZMMQxJPLBXU0MUAiIOD10hCfuks1jBDmr8r
 mHsp9VyxFaHXAPrIyQAD+9RdoPFpxuvgo26DAVHQrOywsBoHYhhCojfQCERfYOTxMiLMPj2EYwe
 y+7sF6Q4gI4yIYjZPlXQHhS9N31k0I28EDeiCSb+Fp10XKA84/ZWfa6U=
X-Gm-Gg: AR+sD11c6yh9LALJBhWe3vhqkbVYKpn8qWJLp6TVoeD6hKKVKaLewQ2U9Oj6gO1RWhw
 7JKe/U9Lh3codqcpCmfsxBUhgG9tl4gDnRxhRx0d8wosGT57WU546GoUjp6tbJZzFtGkdQExyFh
 SURdcv0aQAFRJC1H3hikrgWINI5Vq5XlJ3l1NEsxYoL91f/3SOLQVzS8exbWsduBH/R9fzW5YJ9
 rCIqecfW5ModR/d1Cudpn620Z4DiBGdQ43B4TUIouck4CAJtQXw/c/uJ3s94Yo9qZSwZTddSYkh
 Dq94Yp82knM/Y/ANlM+5NhIvcvMs2LgiRhK8qdwvBw8xQwBX1aU+ZhPKZab/yJd5KWHFzzbMJ1q
 D4+W+8HXlCX8Zmn+dRCnxprCa/g3caQipy/29FmFW
X-Received: by 2002:a05:620a:1a13:b0:939:2d94:667c with SMTP id
 af79cd13be357-93948103974mr956664585a.21.1788256352140; 
 Tue, 01 Sep 2026 02:52:32 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:939:2d94:667c with SMTP id
 af79cd13be357-93948103974mr956660485a.21.1788256351490; 
 Tue, 01 Sep 2026 02:52:31 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b91c5790csm294575895e9.0.2026.09.01.02.52.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:52:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v5 00/21] cpus: Constify @cpu in SysemuCPUOps::has_work()
 handler
Date: Tue,  1 Sep 2026 11:52:06 +0200
Message-ID: <20260901095229.72018-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX2ov+GCZuf2qY
 OLW4lU1AASrTbm35lVMx5fjRqdi+Kpn+Bh995H+dsUGatBavHeyOlx7DS7eJxoXrplsWSUIITxg
 kQaB6l+wKwV+zWroXC2Lbo2MQvNqUIA=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96a060 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WgZ0fXF2DweS4szHog4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: uRYQhR_zgd_p8FE0C197c3ubQQ3Xpibn
X-Proofpoint-ORIG-GUID: uRYQhR_zgd_p8FE0C197c3ubQQ3Xpibn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX6dnAtMXc/751
 iqx4qQIfTylWFQoi78Z6PjQg7xxIstdCgcIvuPu1iDRcOR1jVOy2bJ1kNkQxpyCWNLpkVSD4aZI
 9PGhWTxD9TgBV4JK8xrmJZx4wJftoogvpK3cX+uXGEyGDpJC2jgZemOqx0N+d0Tu+ZAGsH6P+vs
 y1wT+bh3WmoT0Uo3Z/T6xdsGok2NX5eh94w+lw5tlQWWYfOslI9vr+t0OD42j4VOOxQliP/b6+n
 AKHZrXXVBIbZyL+rno0uJ7HGGtim1CRhemcMYqLibkWVgwXD8u3b5HTQMAizR5HzzCgUJHyXyB0
 eSU3QEMPRl6onRCsy2hJHpW+mhYGn79EtGR+RCe+aNryznsNT/uTI87NY58Fy8/t450sqas3qzI
 iL1aNERQ6Yroqd10Ptr/tusuqYxRl/ocAgXTmteYq6bew8B20BthWqTtChtmdH9SgEGxQfnL2+l
 +ZpJfL8ycdCIN7vGHvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010087
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Missing review: 1, 6, 21

(I plan to merge myself once reviewed)

Since v4:
  - Split 'Constify LoongArchTLB' (Bibo)
Since v3:
  - Fixed _Generic (rth)
Since v2:
  - Reorder _Generic changes first to maintain bisectability
Since v1:
  - use _Generic (rth)
  - no more RFC

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

Based-on: <20260819145649.23439-1-philmd@oss.qualcomm.com>

Philippe Mathieu-Daudé (21):
  target/i386: Remove const qualifier in ptw_setl*()
  linux-user: Uncast void pointer argument as Object in
    target_cpu_free()
  cpus: Add const-qualified CPU environment accessors
  linux-user: Replace env_cpu_const() by generic env_cpu() equivalent
  system/cpus: Constify various CPUState arguments
  target/arm: Constify CPUARMState for various cpu_*() getters
  target/avr: Constify CPUAVRState for some cpu_*() getters
  target/hexagon: Constify CPUHexagonState in
    hexagon_thread_is_enabled()
  target/i386: Constify CPU*State for cpu_*_interrupt() getters
  target/loongarch: Constify LoongArchTLB
  target/loongarch: Constify CPULoongArchState for various cpu_*()
    getters
  target/loongarch: Constify CPULoongArchState for various tlb_*()
    getters
  target/mips: Constify CPUMIPSState for various cpu_*() getters
  target/s390x: Constify S390CPU for cpu_has_*() getters
  target/riscv: Constify @iprio argument in riscv_cpu_pending_to_irq()
  target/riscv: Constify CPURISCVState for various cpu_*() getters
  target/sparc: Constify CPUSPARCState for various cpu_*() getters
  target/tricore: Document architectural interrupts as not implemented
  target/xtensa: Constify CPUXtensaState in
    xtensa_replicate_windowstart()
  cpus: Constify @cpu in SysemuCPUOps::has_work() handler
  accel/tcg: Constify @cpu in cpu_mmu_index() and TCGCPUOps handlers

 include/accel/tcg/cpu-mmu-index.h    |  2 +-
 include/accel/tcg/cpu-ops.h          |  2 +-
 include/exec/cpu-common.h            | 29 ++++--------
 include/hw/core/cpu.h                | 21 ++++++---
 include/hw/core/sysemu-cpu-ops.h     |  4 +-
 include/system/cpus.h                |  4 +-
 target/alpha/cpu.h                   |  2 +-
 target/arm/cpu.h                     | 55 +++++++++++-----------
 target/arm/internals.h               | 69 ++++++++++++++--------------
 target/avr/cpu.h                     |  6 +--
 target/hexagon/cpu.h                 |  2 +-
 target/hexagon/cpu_helper.h          |  4 +-
 target/i386/cpu.h                    |  4 +-
 target/i386/tcg/tcg-cpu.h            |  2 +-
 target/loongarch/cpu-mmu.h           | 20 ++++----
 target/loongarch/cpu.h               |  6 +--
 target/loongarch/internals.h         |  2 +-
 target/loongarch/tcg/tcg_loongarch.h |  2 +-
 target/mips/cpu.h                    |  8 ++--
 target/mips/internal.h               | 10 ++--
 target/ppc/cpu.h                     |  2 +-
 target/riscv/cpu.h                   | 53 +++++++++++----------
 target/riscv/internals.h             |  2 +-
 target/s390x/cpu.h                   |  4 +-
 target/s390x/s390x-internal.h        | 12 ++---
 target/sparc/cpu.h                   | 12 ++---
 target/xtensa/cpu.h                  |  2 +-
 linux-user/elfload.c                 |  2 +-
 linux-user/i386/cpu_loop.c           |  5 +-
 linux-user/i386/elfload.c            |  2 +-
 linux-user/x86_64/elfload.c          |  2 +-
 system/cpus.c                        |  6 +--
 target/alpha/cpu.c                   |  4 +-
 target/arm/cpu.c                     |  6 +--
 target/arm/helper.c                  | 41 +++++++++--------
 target/arm/tcg/debug.c               | 18 ++++----
 target/arm/tcg/hflags.c              | 35 +++++++-------
 target/arm/tcg/m_helper.c            |  8 ++--
 target/arm/tcg/op_helper.c           |  2 +-
 target/avr/cpu.c                     |  5 +-
 target/hexagon/cpu.c                 | 14 +++---
 target/hexagon/cpu_helper.c          |  6 +--
 target/hppa/cpu.c                    |  6 +--
 target/i386/cpu.c                    |  7 ++-
 target/i386/tcg/system/excp_helper.c |  4 +-
 target/i386/tcg/tcg-cpu.c            |  6 +--
 target/loongarch/cpu.c               |  4 +-
 target/loongarch/cpu_helper.c        | 20 ++++----
 target/loongarch/tcg/tcg_cpu.c       |  4 +-
 target/loongarch/tcg/tlb_helper.c    | 26 +++++------
 target/m68k/cpu.c                    |  4 +-
 target/microblaze/cpu.c              |  8 ++--
 target/mips/cpu.c                    |  6 +--
 target/or1k/cpu.c                    |  6 +--
 target/ppc/cpu_init.c                |  4 +-
 target/riscv/cpu.c                   | 17 ++++---
 target/riscv/tcg/cpu_helper.c        | 18 ++++----
 target/riscv/tcg/csr.c               |  3 +-
 target/riscv/tcg/tcg-cpu.c           |  2 +-
 target/rx/cpu.c                      |  4 +-
 target/s390x/cpu-system.c            |  4 +-
 target/s390x/cpu.c                   |  2 +-
 target/s390x/interrupt.c             | 22 ++++-----
 target/sh4/cpu.c                     |  6 +--
 target/sparc/cpu.c                   |  6 +--
 target/tricore/cpu.c                 |  5 +-
 target/xtensa/cpu.c                  |  6 +--
 67 files changed, 352 insertions(+), 345 deletions(-)

-- 
2.53.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E68FCA5FC1
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 17:51:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xByRa-0001go-Bd; Wed, 30 Sep 2026 13:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByRU-0001Tv-Em
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:50:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByRR-0001Uk-Qw
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:50:07 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHfAVt1110277
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ivKXbJVdp1NK7x91XcxNYvkjqxRlN7x4uLPtErdpCvo=; b=VaYRc7/03M1vhhRX
 ZQG4dIbj1k7m+8LxYVAsb7cqAeU+u6dJJZ3kPOyMWNff7yQah2aDWQray1lJ+Y1s
 2O4C+j5fymuw7p2CwSBWVZomocurZcHnvZxEY1Om39rzQvc3E1cPXpE/SQNeSczm
 0YHmaGrJpi33UDtakXg81t2vQMDNCxEpALlGgoNvOqB4cK9rjZ223t9dW3xDxfjI
 gQcjvgKO4Wb0fBxPcD5HAad4h4pxfVYc60NS8P7ttTuBc01OBZjgv56WUgkUrH+Y
 ktmcPhHeH0V9UappCMILbY9KwQwh+sTjoxkEms3HgJlcXtDSHjCr2BsVxcbf/7qu
 tQz38w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh829y9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:50:04 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7bf45388253so298530137.3
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 10:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790790603; x=1791395403; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ivKXbJVdp1NK7x91XcxNYvkjqxRlN7x4uLPtErdpCvo=;
 b=UzjMf+/eQTE1mFNHF6HC67/d3qu9ubU5Swxy314rmlukIbBVzK+yXwClYz7kLqFZuq
 iYKfqcwvIweZO7R++8tS0Lp3+TLL9kU8dmQ6c8fWAoaIX6KShEu6nUe4cT5ew2P/QIrc
 uadmAW2nw5ubEtVEg6C8oWTCC+xhLTary52OPEPMNwGQ+8BTHDC5U4QBW4otV6AZr2BN
 CjJ2iCHqlkMzyJyZbmm3xIVd//HPcMHoZ04+B1NLOMlUPh4hvUa2o5e47jz97XzZkPmJ
 O9rhUfBWfOKKEzFiTw2CCOwUHteEAEWpPS8ZWzF+fMaG0FHdOdk+3g1EMyR+EEBu3NVW
 gDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790603; x=1791395403;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ivKXbJVdp1NK7x91XcxNYvkjqxRlN7x4uLPtErdpCvo=;
 b=daZn+P9Dar/ZNRstepl3RMqGBXF194roDCNWtMYqQ771FTSBTJTWDLF0lMI9DlihEH
 uJIdUhbiDa/cpw4nFncH9XN5LgC8uvatVgpi9SdUJXI7PE5Bnu+ClYyD753F2VfmzLfn
 zsoMcSFW3Q4KezuQoryNw8rmho5TAAoMOZth0rq+04ZAnV2gCN4JfJVBI8VV8CcPfy6t
 a5QMa/gS5Ggx4c0cscbxmRGvnG3l4nBHOWq+Ic7rxgrFXVYlbT/2GuUIv9vfaqEJtmdM
 HUZn24xc/MvIB3cg3ZlgjZY7FM5NZCE7/5RfGwQiqg/ZkqmArJdBx89DhI+Lj90Phqwy
 39Ww==
X-Forwarded-Encrypted: i=1;
 AKwUvBxceC5WG9DIO+Hy0keKDDPtZVaRadwIKH/H8wnM72fOn4bPVkxa1Xh8V1qkYYpEVta8wIMdUtsA8w==@nongnu.org
X-Gm-Message-State: AFq9FYIcRWHX7fW2CHb1cbwr29EBJ1gPNTOEQuexD0XzaG63XcXbxfuC
 XRs3Dhqq+OiNJgDwz9OEN8VSiO8LpKwJU5nG4EI2QePC2r3hRGJLnCPJCWl2yQLyYXsr0EDTdwT
 HlnNcPjgMU5vQKEweRx7iOSxI/iYuEDhJk48TycsX4cx50pQcW3ZSMJU=
X-Gm-Gg: AYBFou2C6n4Laqg0GYB1NSUAqSfhPWd5YROwh1QPpsEv1y+1j+4oAcogxnaBacCHjIK
 xDkLbHXj8im8kaXNvO8RukOdwt3yjmmZG8+vWwZh9G+XGCanAV4dQWb3gKJNvTRMnqvmHVs0AP+
 evg2wwGyQaoPNf6dNP/Oj2/of2LO9ctPEce1dwAtjuQtguLjd+j1mDbue89S/bEoSBjWWv7/upf
 7LaG4E8Mm4l6Z7KVMwfN4qagOiojdPVMgovPeZfr1cyVRlv3ST4hv52xNC6Bax6WnRXlkp0/5VH
 e8pmCk5vP5k+UUwCvj6mbtMA0jy8ai7NTFyC3fNC3mvGfLcCUWa6lPjxdBig0DYQ3Ram1KOfEE3
 MTLRS4l+bdnllzXZkVHSdfnSsHoCnzMhKf7ou/NVj
X-Received: by 2002:a05:6102:54a1:b0:7b2:c1b1:1d0 with SMTP id
 ada2fe7eead31-7be729ac2a0mr712647137.11.1790790602965; 
 Wed, 30 Sep 2026 10:50:02 -0700 (PDT)
X-Received: by 2002:a05:6102:54a1:b0:7b2:c1b1:1d0 with SMTP id
 ada2fe7eead31-7be729ac2a0mr712635137.11.1790790602467; 
 Wed, 30 Sep 2026 10:50:02 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b0692b5d7sm628089f8f.28.2026.09.30.10.50.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Sep 2026 10:50:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 2/9] accel/tcg: Introduce poll_during_halt() and
 leaving_halt()
Date: Wed, 30 Sep 2026 19:49:38 +0200
Message-ID: <20260930174946.82195-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930174946.82195-1-philmd@oss.qualcomm.com>
References: <20260930174946.82195-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfX0sN08AdE+yQh
 nv7xC3XGRfk9QJGKy0yAQ4Gfmv1rmi3C1F6NPpOPtYsZrHLVKcrIjKYzEjIOdRd+VtjEFI37yLN
 FzWJ1dp9+7jgnKfudEVucNihtEgqB4Z/fKn8k/8cu8VxHq9lzpUy7McrMHV7PMXTzPYc1ss4LfQ
 k9ykE8WUmZ3vFBhozJoQkxtWxk48RyIkKT4TMGE9KEhzQ95vUwNPSsoUhlv5r8HTBBM3FYISut+
 3vY/JR5+neCcHfcjtQZ3bSxl2w4Y5KNdWvfUMiv9eJGX15weiwGTpo4uv230IGrVKdJobNqFE2e
 AY2XFASc7OeRMMmhm8fFYMjOdP7Vu9a6hsLA20cVQDfZE8w/3sB2pxpqzxYXtaXTUVFZ0iGVbvT
 EKLsFAKzYftfh7/yPCqUuyw5e2hYlJKgHsxbVBKqrpyG/x38WcWofZQN5CiWwZvYMRStxjyNKw+
 07VnA3lRIyQU2dU821w==
X-Proofpoint-ORIG-GUID: vZgFwFxFx9IqMW0a1y1pBG1BTiQYh-kV
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abd4bcc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=DbqnPDNGgojIjNu1nyEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vZgFwFxFx9IqMW0a1y1pBG1BTiQYh-kV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfXw3YSgcm9u/Aw
 jQnB14YJ9+Xo/YtrHR9gyH+DvlW08ZOPR3DBN5Ko3S2rSv1Q3uPelX9RvN9oALu9C4Z/0B71X1o
 niZaRl8MN+gfh32sZLQJ3ZPbEpblczQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300071
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Split target-specific halt handling into an optional
poll_during_halt() callback before cpu_has_work() and a
leaving_halt() callback after work is found.

Keep cpu_exec_halt() as a legacy alternative for targets
that have not migrated. Require each target to provide either
cpu_exec_halt() or leaving_halt(), but not both.

Inspired-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/accel/tcg/cpu-ops.h | 24 +++++++++++++++++++++++-
 accel/tcg/cpu-exec.c        | 21 +++++++++++++++++----
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
index 3ff6e6810e0..1ee5d3d8bdb 100644
--- a/include/accel/tcg/cpu-ops.h
+++ b/include/accel/tcg/cpu-ops.h
@@ -169,6 +169,27 @@ struct TCGCPUOps {
      */
     vaddr (*untagged_addr)(CPUState *cs, vaddr addr);
 #else
+    /**
+     * @poll_during_halt: Poll target-specific events while the CPU is halted.
+     * @cpu: vCPU context
+     *
+     * Called when the CPU is halted to handle target-specific asynchronous
+     * event processing before instruction execution begins.
+     * The caller does not hold the BQL.
+     */
+    void (*poll_during_halt)(CPUState *cpu);
+    /**
+     * @leaving_halt: Perform target-specific cleanup before resuming
+     *                execution.
+     * @cpu: vCPU context
+     *
+     * Called after a halted CPU has detected pending work and is about to
+     * resume execution from the halted state. This callback performs any
+     * necessary target-specific state transitions or synchronization before
+     * instruction execution resumes. The caller does not hold the BQL.
+     * Either this callback or @cpu_exec_halt must be provided (but not both).
+     */
+    void (*leaving_halt)(CPUState *cpu);
     /** @do_interrupt: Callback for interrupt handling.  */
     void (*do_interrupt)(CPUState *cpu);
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
@@ -185,7 +206,8 @@ struct TCGCPUOps {
      * if it should remain in the halted state. (This should generally
      * be the same value that cpu_has_work() would return.)
      *
-     * This method must be provided. If the target does not need to
+     * Either @leaving_halt or this method must be provided, but not both.
+     * If the target does not need to
      * do anything special for halt, the same function used for its
      * SysemuCPUOps::has_work method can be used here, as they have the
      * same function signature.
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 853c4b2f67a..122ad9e2e49 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -48,6 +48,7 @@
 #include "internal-common.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "accel/tcg/iommu.h"
+#include "hw/core/sysemu-cpu-ops.h"
 #endif
 
 /* -icount align implementation. */
@@ -659,10 +660,22 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 static bool cpu_poll_while_halted(CPUState *cpu)
 {
     const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
-    bool leave_halt = tcg_ops->cpu_exec_halt(cpu);
 
-    if (!leave_halt) {
-        return false;
+    if (tcg_ops->leaving_halt) {
+        assert(!tcg_ops->cpu_exec_halt);
+        if (tcg_ops->poll_during_halt) {
+            tcg_ops->poll_during_halt(cpu);
+        }
+        if (!cpu_has_work(cpu)) {
+            return false;
+        }
+        tcg_ops->leaving_halt(cpu);
+    } else {
+        assert(!tcg_ops->poll_during_halt);
+        assert(cpu->cc->sysemu_ops->has_work == tcg_ops->cpu_exec_halt);
+        if (!tcg_ops->cpu_exec_halt(cpu)) {
+            return false;
+        }
     }
 
     cpu->halted = 0; /* allow execution */
@@ -1061,7 +1074,7 @@ bool tcg_exec_realizefn(CPUState *cpu, Error **errp)
         /* Check mandatory TCGCPUOps handlers */
         const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
 #ifndef CONFIG_USER_ONLY
-        assert(tcg_ops->cpu_exec_halt);
+        assert(tcg_ops->cpu_exec_halt || tcg_ops->leaving_halt);
         assert(tcg_ops->cpu_exec_interrupt);
         assert(tcg_ops->cpu_exec_reset);
         assert(tcg_ops->pointer_wrap);
-- 
2.55.0



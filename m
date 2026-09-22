Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9037C98302
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Sep 2026 16:53:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x93ke-00005J-Md; Tue, 22 Sep 2026 12:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93iO-0004no-TO
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 12:51:34 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93iK-0002b5-3R
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 12:51:31 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MEjWDl1058379
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 16:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hm+viw0kO/6+GIq5N6+3g95/cZ18/ZvzfYFL5HOoiV8=; b=pmjp73RLHs4N46YD
 DABVL8jXgZlWJkJBaDQoIx10MiDgMy9GaWUnOJxKruDqQTmpdVSNkSFe7FwFpYlV
 kbUNBNgY2qetV6WAondB2lhsRP27GuhUocQxKXBNcu6xsl/BLYI4gMsEJXxm2f4q
 MBPcaVzUxkMzCYmd3Rm2hHh0k25oxiiOD99O3dJW+g5+tLRO1SPrv8OJuhe47xKP
 K6TPJHS1rwrgrA7VkwZ/rJepO+EgBfJE3z8EVOl6WaYCeWHdHQNMFtvfZn2eLI1u
 JEBcW2PT7uReihR9cSC8lxYCZuhzlNT8O3gylnUMY/K7zDTdMrA4kTdbLBRPVQji
 fn/t/A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5ugyf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 16:51:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-78a5a291af3so7057137.0
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 09:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095876; x=1790700676; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=hm+viw0kO/6+GIq5N6+3g95/cZ18/ZvzfYFL5HOoiV8=;
 b=B9GmB5gLzjWN4E1Vdy2BG6Od+9kLRHnfQyeTFsTY9tX250bcTo7r2UNwFjFKiOZjNZ
 dG5Uv352xGFhytinq6k2w8zQodwGxM8lMewLyRN0fiZzrWkaXUcR5npMgMq4UeR8RvOX
 mTeaGL+PAdQt9OOo/elokw2JXN/HweLSBIjec9ZZV8ZVrtvj/JmZKX0wxSdp59u5x5wg
 3m1+ZBTGAfRY+Wsqp32P8o25cuH3W3pxsai3xJcAryPZaLx5wTwH2soiwzpKLPGSTYVQ
 1XOfcepQkilUiP0d/JsgLoRyJtcyGuBiqTp/nfpT/+OF4vBmxgJP+Jl+K8+24JMt6hbO
 qn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095876; x=1790700676;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hm+viw0kO/6+GIq5N6+3g95/cZ18/ZvzfYFL5HOoiV8=;
 b=C+HsJ+aejQsDq6ud+XdYYp3PQRioju9g/G2GGHYouOURv1FG3zJuky7i+qI9/UMAne
 SmhzTpdOIAVMKbmzFyhSGLUp4GXhcI+Z8rR/rdNGW077pf5NoUfx0ilK1lElCE6SYynA
 nB8j96mgLKgGjKUwDCYJlgBH9XYjPcHyD96VTHY+ktL3Ybilv3pMDf0VLCju8Va/Y9Z7
 YVLyGW+hcUxCNRfqZGfHZqQLXUB8Y2343opuJr7BWoJIJXm9qYYiIAy1GxH8pWiU+o7d
 DudaGz2VpBzCY78WRnhEMxxxLvW5VIzW5cQrXbGkgRY988DhUhM0lmzkc5yToJScFSM3
 dpbw==
X-Forwarded-Encrypted: i=1;
 AKwUvByKg7OONHshnHsjz4vLibNSKhF5shhLzExIeZXdKcfp35qalHkAiI1/Od9YCrvFsUB6bjcAxhAutw==@nongnu.org
X-Gm-Message-State: AFuF++kpOG83zSvexqQ5x7c3lRUw59sPUciZeISdyi/jzJ3xATaBzQR2
 +6Uf1Ww4ekFJxz3yxu9AaA7epNZzF43yCugNvpxlbr0IvaU4967pgaCscfUXpRuZOgz2czkvHOQ
 lmYhSiWSDqhbbxCdSXQvKyAD5i/p3QKm0wSm6eBtAtYTrMD/OIg4rAg8=
X-Gm-Gg: AYBFou3zxNpR85xtLAi3HiO4dBe0lCqaJHYQ9zOW7mS7aHy51KK7HZinEscOr6OqVDQ
 7PuJlLw+8KC1FoCtUFRcweTw8ktb41SjAXVvb4QZVFwL9hDweAIRu2QlSEArG6aKKHP2otGr074
 48ko/TpE8ytcSWfwZR4YhmHJMcVxIfO5SJCLMYGQJRcb5l6mnmVunp4YoHwWeE7JTO0lPSrGZdf
 5UmO/bm7P3MD6MmUZjaPbqZfAmEbjdNiyDWNnmJ7UPag6FxDNYiFCTNwBxiLB5142mXWXCF4X+4
 bD71fZEaTX4aKicZ1dAM2hDb8EPu6/sme2z8zmIW3tRfPjefg2ZNcarESwgO2e8S8VH/IRm+/wr
 ZEMFbmvhPxCoLUZJYcEV504jtfuK/g1vf4gkVFYgq
X-Received: by 2002:a05:6102:160b:b0:7a1:f7d2:e81e with SMTP id
 ada2fe7eead31-7a55d28bea2mr9336730137.23.1790095876475; 
 Tue, 22 Sep 2026 09:51:16 -0700 (PDT)
X-Received: by 2002:a05:6102:160b:b0:7a1:f7d2:e81e with SMTP id
 ada2fe7eead31-7a55d28bea2mr9336670137.23.1790095875959; 
 Tue, 22 Sep 2026 09:51:15 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdab0c240sm44523165e9.4.2026.09.22.09.51.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:51:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org
Subject: [PATCH v2 13/17] target/arm: Convert cpu_exec_halt() to leaving_halt()
Date: Tue, 22 Sep 2026 18:49:31 +0200
Message-ID: <20260922164936.15189-14-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 561nA8Psv2FpP16v0FDKxkkN24e-R1YX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfXyX93lMY7As9c
 9HZN2dfP42Xq1kQM8B2G07Si5fGvxFJFM342kZkDaMZNXlGi14ZdjoAJA/Ld38AaMZkhrvlzp0V
 ggnOENfxZ8JUSgEnI0ggUdNg5UR9rk4=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab2b205 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=AtaPWBxvZOLBLR1XvpsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 561nA8Psv2FpP16v0FDKxkkN24e-R1YX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX7tTwFEbj5Mo1
 BTh+YeEh7W0B6SBsYCjCCTa606wMSjhe8xxTICBzKB+N3EDMf+ERQn0WJS40srlrBQecEVdOy/t
 K04ky6gbOuv1R/+Lq063gVHD0cxqo2RPppwjUmACJSTvqPlmOSXvx2E0ZjX+JNkNW3+IztHkvJV
 6qp2+5ECTX+VMj0VKTrbrpl1lXKmoQ20Y4rVwi5J6plVpzPuiWvb0pxgo4EzxCuCXrAkDdNYM7T
 BNrBKQkhXq/Oj8Zd6M6/yEpyRYAX5W7j8q+2rSjnYc0Kb19Oro86n1QFRTxZAPC1m0nMd5C2Cgr
 1QIefy4GEruVaqbRaZw2H7nwI3nJ5aqtmSv8dbfYu9b/biljYEt8cVKER87hY1gBnuyhjL/Y1IY
 Gx1pLYOVWEZMKQtMR6oLncvepf/qimWvwXjnqP7e6rzARXUlwJSWsb33UrbgVyW1kEZZVuPQ1x7
 ejZQHtTfp3Q5WjGAhFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220246
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

arm_cpu_exec_halt() now merely checks cpu_has_work() and
conditionally call arm_cpu_leaving_halt(), which is now
the generic flow in cpu_has_work_after_processing_async_events().

Register the leaving_halt handler to use the generic
target-agnostic flow and remove the arm_cpu_exec_halt() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h   |  3 ---
 target/arm/cpu.c         | 12 +-----------
 target/arm/tcg/cpu-v7m.c |  1 -
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1efda543270..cfe932d0e5d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -431,9 +431,6 @@ void arm_restore_state_to_opc(CPUState *cs,
 #ifdef CONFIG_TCG
 TCGTBCPUState arm_get_tb_cpu_state(CPUState *cs);
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
-
-/* Our implementation of TCGCPUOps::cpu_exec_halt */
-bool arm_cpu_exec_halt(CPUState *cs);
 int arm_cpu_mmu_index(CPUState *cs, bool ifetch);
 #endif /* CONFIG_TCG */
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4863e7cd450..9c5b76d0c03 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -883,16 +883,6 @@ static void arm_cpu_leaving_halt(CPUState *cs)
     /* clear the halt reason */
     cpu->env.halt_reason = NOT_HALTED;
 }
-
-bool arm_cpu_exec_halt(CPUState *cs)
-{
-    bool leave_halt = cpu_has_work(cs);
-
-    if (leave_halt) {
-        arm_cpu_leaving_halt(cs);
-    }
-    return leave_halt;
-}
 #endif
 
 /*
@@ -2617,7 +2607,7 @@ static const TCGCPUOps arm_tcg_ops = {
     .tlb_fill_align = arm_cpu_tlb_fill_align,
     .pointer_wrap = aprofile_pointer_wrap,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
-    .cpu_exec_halt = arm_cpu_exec_halt,
+    .leaving_halt = arm_cpu_leaving_halt,
     .cpu_exec_reset = cpu_reset,
     .do_interrupt = arm_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
index 48b31d5eac8..1093c6cbf63 100644
--- a/target/arm/tcg/cpu-v7m.c
+++ b/target/arm/tcg/cpu-v7m.c
@@ -302,7 +302,6 @@ static const TCGCPUOps arm_v7m_tcg_ops = {
     .tlb_fill_align = arm_cpu_tlb_fill_align,
     .pointer_wrap = cpu_pointer_wrap_uint32,
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
-    .cpu_exec_halt = arm_cpu_exec_halt,
     .cpu_exec_reset = cpu_reset,
     .do_interrupt = arm_v7m_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
-- 
2.53.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE52CA5FC4
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 17:51:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xByRs-0001ts-2p; Wed, 30 Sep 2026 13:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByRh-0001ic-Fq
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:50:22 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByRf-0001Vw-Aa
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:50:21 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHfCc94014242
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 O12f/RezyT+/f0MD5pwtqfJck7NgEd8TZKdE+1UgoK0=; b=D47LKTt1su1NvD9C
 E3ZvvT0mWRuUz4PBXsWP2k7n0pR9iot2AtjuxTqfNl26K/ejr5mVog9hWdapFkf5
 uzLpZn23f/KPz+1AqRc9+R/i7zjStKNHTbHPM1M/cyG6iuUjtYSjZOaFqqZqUVsk
 YIQhqxex4YrKVjMYGJtLG3O43MGGYjBTdJMQ9m0AHzV9fSbqbvzU91yVnIWflf92
 vde+zWw6mdC+5Vv9ZVtBiEoStPKfZnAf3xbb38oRq2bHcpd7JYYD/+HYgxEjkCrc
 a/Hn3a727uO6clxvSEi0Ux4BLsHvO3WmlW8WTQ+MLGipctHB1mVexMfvGPb8XAYR
 b0PwEQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27jt9r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:50:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-917a7fffbe0so5059506d6.1
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 10:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790790617; x=1791395417; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=O12f/RezyT+/f0MD5pwtqfJck7NgEd8TZKdE+1UgoK0=;
 b=hlSo11oLmRISzMg4PrQzx4Qo3/AI+d+47hzOZ18p0taEpD3G/e970AgxAxYv5AqUy6
 wwRtruLEJY1yj4jma/c4NM3YHgbPE5xIcbqA7mfdecadkyDYTJ5OcnzdHr/9eE9vfI2n
 TbOJuMxl9k33FyI/Z4FyHS+akokloD39DTeciuL+QZXZWmjgUpIOd679KmF1+SdKmIDo
 7UH0sG5eDWs+CUSFGsfrBpx1VQBz1JoamTqy4HkT7+11Oe8XEG09PVQx+w4ZYF4w0RyA
 3uZhJUIqYEOzSkRlN1+ZnlfkE2c1HTdswkAzxK/bmiZIk/Ilmj6/XRQlxbpeODbuDwry
 7tIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790617; x=1791395417;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=O12f/RezyT+/f0MD5pwtqfJck7NgEd8TZKdE+1UgoK0=;
 b=s8vPUJyjN4ME87X2Z/XQki1UbNg28OtydHpWP54cnlomgkXub2hU6fz5gY0KSFmat3
 9FyaRFoQfxlP/sM/h+gOIlhj3UO2qXt8YmSKJXtBwh19ghyUSylXkQjqpbwodpmLDUSF
 v4NcyFsl2b3BecJ6iQj+/U0boj3MJ69XdIh31Pbh5qOWu2Z23DTvJDshFWE09cLQ0bEi
 MtsTdWrT3dJVxgmUY03Mmc9XbLq5SwpXdARwMJ8V1HufU+6ZSDAL8EtkC3Yw1GQ8/NWV
 HkvWYFi5qXv3SGcTQAG5N+8eLfeEmhNUMV/9txagcjPA33HhR17FPhI6vOTSxx/38bFv
 yHoA==
X-Forwarded-Encrypted: i=1;
 AKwUvByG6sGPQ6ztyLOjfXYfGw0g+4Th6SV6KkYsRRv4djDV7SWjpvyrDoWxiW8ebe7ToPrDqZePGLGcSQ==@nongnu.org
X-Gm-Message-State: AFuF++mDLWdK2VjjgC5BQzhbOkFNVdsWvHqHTNbMa44tJ+LsT3AvxFqv
 wpcQb3Re9vh4305Ty/Nv2v6PHeKUfa3iHc8VsmDyDmom8deL64RqpR4UIjxKyKcqL22LzSH5cUv
 RznP7jLdzTXuRWs/a4cLD4GNOo39LHxZAngoysqQ340s+GLJFVdAGckI=
X-Gm-Gg: AYBFou2yZbv0zkzSrF/2BioXL0bSuqvtEszR2wSZoOv0+WrTzEp4Vk35h3osll/K8Jj
 P3C77EHo5ZEh04Zoj8pbxMHfTe4SOEOGUuKovUMWU4I3AiMq0NUVtdfPSXH2QiNvJnneRCig5Dp
 WFvFccRaom4+gGgyVKEhfvyJJSt1mAFTBz3OgPTG6TqEODGETQpBs3kFUmtYUlHBuk4PZRIbM0d
 ySVCj2iJeoroASpE15dL7VY147Ba/iGMdeWPBdA2ZMlgqRe45wkGlAsvM3/i7dt3kqcFnBQdAcb
 1Tn3p8Gu/C5Q9sxGcARwyF/9lVMW7FJuYQcYpBkowFem++xzgNKDr8q+t48oQJfOKcqyzUOKBq6
 1Z0YAvvjOoWLEFGvc8d8SQcN2iQQparRKiZWwPg4a
X-Received: by 2002:a05:620a:2842:b0:936:dc4c:3bf4 with SMTP id
 af79cd13be357-93ca96b41eemr406654285a.28.1790790617278; 
 Wed, 30 Sep 2026 10:50:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2842:b0:936:dc4c:3bf4 with SMTP id
 af79cd13be357-93ca96b41eemr406647885a.28.1790790616748; 
 Wed, 30 Sep 2026 10:50:16 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01eb84e59sm7053555e9.15.2026.09.30.10.50.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Sep 2026 10:50:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 4/9] target/arm: Convert cpu_exec_halt() to leaving_halt()
Date: Wed, 30 Sep 2026 19:49:40 +0200
Message-ID: <20260930174946.82195-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930174946.82195-1-philmd@oss.qualcomm.com>
References: <20260930174946.82195-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfX97Cb6ZBqb9YI
 KZ8Kw4Vo2cAXTA1JO0l3Jf6wmojNn3hbRBUafyH1PTZlcnCHYSTIC0aTWs4yFZCYvkSUiomgP5g
 Ss4Lu+7vQZ+/1veTzgQ5Nd8PjhaHtr0=
X-Proofpoint-GUID: 0BWr8vmYDHYxVss2QnfdLIt_vFJYA0EO
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abd4bda cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=AtaPWBxvZOLBLR1XvpsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfX6Tp8Lm12xgmY
 +hgsoG8xPmVZ6BuTdWYCcGGg2b4s39NT5aquhfOuhOoUfU3al3X9cce6HaePClQOITezQmleHpR
 B0P4mOMQXNNcyx78uH2qfExDNwyvRFD1/HP62kWCm/Xg4AeSQ7i4JQeNkEjq0Aqyz19M9BpDTJj
 Xt955LrPPiOXr1ZdviqFLNOLzaBGCtzfXxMWlAL7JoTAFTVwunIbMEOrFmgNba6WR/4MI2PJ12a
 M2Rv3slkXDsLJL7RvZMabn0IzQZFqp/4rltnVWUFCrjKny+Y5AvdkaQgfVJQPhmyWNQG4nLGBzi
 2Lo+qKxAUMpD9emyVZhW+aKOiEAv5cC7mrSbjxCIYj/+K6p5LDneRPcyC06PGzLF9uGWdxz3Erb
 2Ui1dFwD+VU8Lm5m7MzdvZIN2rPO6vKVbGeZdikHLClszT/qOFNQcw8eWOZzeT1DOnvK/UPJuZk
 OkwsQEwl5EFyHP+fVYQ==
X-Proofpoint-ORIG-GUID: 0BWr8vmYDHYxVss2QnfdLIt_vFJYA0EO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300071
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
index c41fa5225c7..9917931fae9 100644
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
index 53f9a532a75..7e411b07bde 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -883,16 +883,6 @@ static void arm_cpu_leaving_halt(CPUState *cs)
     /* clear the halt reason */
     qatomic_set(&cpu->env.halt_reason, NOT_HALTED);
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
@@ -2625,7 +2615,7 @@ static const TCGCPUOps arm_tcg_ops = {
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
2.55.0



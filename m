Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA857606A319
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Oct 2026 21:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G6/pXANi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g7GwGtZ8
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xK0i8-0006Cj-9O; Thu, 22 Oct 2026 17:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xK0hq-0005b1-Dw
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 17:52:18 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xK0ho-0007Vp-HJ
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 17:52:14 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MKWmiq3413272
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 21:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Hcg+jvPjDV9xmJwthUVkue7gc06kjeaCQ6EMvYlnJMw=; b=G6/pXANiXKf6or4Z
 XdOBfSYqk/xLdNzwQaTHt0BDR29OOjn7189VP/ir3QS/jc5h4kmI0J0fBlAd1cwb
 2fQHfV8xWJX+jN4onTXiBszNzcB98gC4QIAwVx8wh+8oQ6bWmLaxXyow1WAigZxU
 ysytDfOAfbXhldlgcYhu1uOlNsUwWNUsSIxdOZW4qK48aE4iKaGiDGQi38W63EUH
 OsMRTLyUjeUrmXMAgcs0kn75y7z4Xwl/CFgu4ZaLWxu+N01Xmi6cMurmJJqGDi9V
 K+dpN3I/kFovcv/YebEZJH/dTgegEVhQdcEJBSRJbD5QZ+46oncnd0fMkYHCFCHt
 azQNiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmar7tm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 21:52:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93caf7856ffso42082885a.3
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 14:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792705930; x=1793310730; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Hcg+jvPjDV9xmJwthUVkue7gc06kjeaCQ6EMvYlnJMw=;
 b=g7GwGtZ8gf+3xadQ+JQ7QPcWqj0eGw5Al2uwjAP3B5vJ7D4RJTVJ2SxjG/uULRoiez
 9//YRQBpC4Hw49KO/6mM/pijCj/TEJs0ybQa17ysVAGHygir7GsOolmiCfXzPH82i52W
 ofrbJ5wIrRAcU02FaewtPIqLmKM6VNfpmTj5ev3o81/fBazff8Ze1FHSlMKvONA0VNgb
 pIMdzfxtHr0PvjMJA6rd+umAkKDvTFbyvhUMI3xi5oMD+ymsI3laCrli0pngZXMtpcsi
 a/bJ55RTR7Sv3Xm1QqDGmW3lbFLTFaXJ0URDzpSnl1ehVlAsqdDHnDGExqTE7LjyUe+6
 LLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792705930; x=1793310730;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Hcg+jvPjDV9xmJwthUVkue7gc06kjeaCQ6EMvYlnJMw=;
 b=wzmrf1/xJH0Q5BZUmHR7pkNrfWySDIT3IygW1b4BVbfZfBS6Xcc3RJZk/y0JM8wbi0
 D+T+KZDDk9lfHLM+CSPvOf/O+yQeYr5rRDqn0GHbX66uT9MNUwZXaYJ75yS7wymz6bRb
 rrTRkH9BdD2Rtzquzvz8DOtxxfZp3kkYur2C5bNlO9CpdPYTTD1zia13LWtZWWEr7K7m
 ZSPGzU++oTxv1KYEND+exaLNWXk1TVsr1Il6omvs6qa/eORM2SLc/DF3CMjlOuASs0i8
 4UpZqS7KYP9Z1GML7l3ZIEHh6KkaL6Ta/OYN1gKEM303GjRqMuMX6gXG7T9pVcLn80a7
 PxkA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwdK+dwgHKVDfcNfNS1yUqy1lW3u2hLlFq87n/U3Zsdke/jpyoR0/aSEYm6J+Tbqo5n62VgDfeAzQ==@nongnu.org
X-Gm-Message-State: AFq9FYL+qvr2DQVeJkETix1i40c+s9Jawd5Bq8P8Wfgj0ER0MuGk4qAb
 mbeiey9Yy8NY4dOpVlKnN6bBekVA7HoUl2EmdaE4R5Qp8rcCLZ+vHfJ5XApIpAPmLZSosnr/cVt
 CIvZFmgbjhl0uGm6GCWv5SD/agdfMr83fGKH+WVC7tDdXwHvRyooNiRsG2YCfN4w=
X-Gm-Gg: AYBFou0mJdY61KE4JIYhKORtc1gTlFc9na7G34uzwhGPnqx+/diwpLvrlirV+YJwf7S
 vn/J0J/M1RXeQT64T/bY9MFu4yAcGp1WZMdt2qFk/sm8EG6yg7WVk64jvpy1M6D60oeqqTlQC5a
 t5t0DWUToQ7cbyHRgIEQJCkBay/bo8RC4A0GySOYYUL3d+WQ/rbLgc0PwH15Ir3DFtVZbLnjv92
 nyaEpGtUg/ZgdZ9rcERgkSx2+ISFJ8OrCXLbDf3DlrfTLPIwd/lLLKynhhRLGJbkzAk9CA8Hhha
 0tnfk3x/wV7yvluE5K0yItj6JfNWC5cpPtJXnRl5PizInOo6YbuyoFGw++/vpbeEJ/kJXrfDSog
 1gqdw4U6LRUS6IqesWdR+VqXclXVVhzQjBdQr3d/H
X-Received: by 2002:a05:620a:390c:b0:93f:353c:6bee with SMTP id
 af79cd13be357-93f6f7d0d45mr141932985a.41.1792705929867; 
 Thu, 22 Oct 2026 14:52:09 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93f:353c:6bee with SMTP id
 af79cd13be357-93f6f7d0d45mr141930485a.41.1792705929374; 
 Thu, 22 Oct 2026 14:52:09 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a2123613easm4750465e9.5.2026.10.22.14.52.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Oct 2026 14:52:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v3 07/33] target/arm: Register CPUClass::exception_name()
 handler
Date: Thu, 22 Oct 2026 23:50:47 +0200
Message-ID: <20261022215115.19680-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022215115.19680-1-philmd@oss.qualcomm.com>
References: <20261022215115.19680-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6ada858b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QvePOBYGvqDf6_zMoJUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfXzThjY2EU7cg1
 yYmzNVsjKvHIB3SJQd7Mzfl9UjnxClyzAsE4FqRRrnDH4qG78Rq1R2QcRxyITzeyVBE6L2A+/r4
 GdgrOpbnZxQbAjnVf85igTsD48IMqiI=
X-Proofpoint-GUID: oT409UhblVDGXOCuV5JZuoIgSMbnJThu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfX2q++VN4A+wS+
 OplT1tuPeRTqQYPDhYWEqrBaZawaF+D+ep+6aHHc13mYX2WyjA0RsK0qx2jrL34u6bKSVYl0c5w
 Y+SD0TSTzdVuU40V5j6vUaU7aOOf3A0wTOqwZDY8VwZs9L8co/pTaNofOV0AOfrPO/tDwbDY71P
 wsHFdji6VbDK24ZYq0ECgwjxs9uIyLrAw1Z6zaCqt9mjlLDvSmMe1hIhSkDys/oaEjuM3mU3I4+
 GBQivV7IwsqjweT3vCgKveu7mpO3KPntjYbasw697lCenm2APBtQAwA+kY0yXrZK4MbXr9lAZLa
 XYydRFM/M7SrMZqCFELZDriTxwTJslVg+SddoRtn3+FmLs9a5mkMFUZ09jMT8hL5PfMWFc78HVL
 hU+zKG9NboS6H09uPQfTx9J3lDmPNQXSLyoY75Hjeh3kCodQNyfONjgLi+Cxd5j+GMubQtt4PHc
 9LTV8BOw1dBS11eOAlg==
X-Proofpoint-ORIG-GUID: oT409UhblVDGXOCuV5JZuoIgSMbnJThu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220087
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Factor arm_exception_name() out of arm_log_exception() and
register it as the CPUClass::exception_name() handler, so
the common exception logging can resolve ARM exception codes
to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/arm/cpu.h    |  4 ++-
 target/arm/cpu.c    |  1 +
 target/arm/helper.c | 77 ++++++++++++++++++++++-----------------------
 3 files changed, 42 insertions(+), 40 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a0355ba9e1a..add993ef101 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -65,7 +65,9 @@
 #define EXCP_VINMI          27
 #define EXCP_VFNMI          28
 #define EXCP_MON_TRAP       29   /* AArch32 trap to Monitor mode */
-/* NB: add new EXCP_ defines to the array in arm_log_exception() too */
+/* NB: add new EXCP_ defines to the array in arm_exception_name() too */
+
+const char *arm_exception_name(int excp);
 
 #define ARMV7M_EXCP_RESET   1
 #define ARMV7M_EXCP_NMI     2
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 81ec1ce21c6..8efbf673a92 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2647,6 +2647,7 @@ static void arm_cpu_class_init(ObjectClass *oc, const void *data)
                                        &acc->parent_phases);
 
     cc->class_by_name = arm_cpu_class_by_name;
+    cc->exception_name = arm_exception_name;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
     cc->get_pc = arm_cpu_get_pc;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7ac21108d1c..b540705e638 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/cutils.h"
 #include "trace.h"
 #include "cpu.h"
 #include "internals.h"
@@ -8841,46 +8842,8 @@ void arm_log_exception(CPUState *cs)
     int idx = cs->exception_index;
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
-        const char *exc = NULL;
-        static const char * const excnames[] = {
-            [EXCP_UDEF] = "Undefined Instruction",
-            [EXCP_SWI] = "SVC",
-            [EXCP_PREFETCH_ABORT] = "Prefetch Abort",
-            [EXCP_DATA_ABORT] = "Data Abort",
-            [EXCP_IRQ] = "IRQ",
-            [EXCP_FIQ] = "FIQ",
-            [EXCP_BKPT] = "Breakpoint",
-            [EXCP_EXCEPTION_EXIT] = "QEMU v7M exception exit",
-            [EXCP_KERNEL_TRAP] = "QEMU intercept of kernel commpage",
-            [EXCP_HVC] = "Hypervisor Call",
-            [EXCP_HYP_TRAP] = "Hypervisor Trap",
-            [EXCP_SMC] = "Secure Monitor Call",
-            [EXCP_VIRQ] = "Virtual IRQ",
-            [EXCP_VFIQ] = "Virtual FIQ",
-            [EXCP_SEMIHOST] = "Semihosting call",
-            [EXCP_NOCP] = "v7M NOCP UsageFault",
-            [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
-            [EXCP_STKOF] = "v8M STKOF UsageFault",
-            [EXCP_LAZYFP] = "v7M exception during lazy FP stacking",
-            [EXCP_LSERR] = "v8M LSERR UsageFault",
-            [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
-            [EXCP_DIVBYZERO] = "v7M DIVBYZERO UsageFault",
-            [EXCP_VSERR] = "Virtual SERR",
-            [EXCP_GPC] = "Granule Protection Check",
-            [EXCP_NMI] = "NMI",
-            [EXCP_VINMI] = "Virtual IRQ NMI",
-            [EXCP_VFNMI] = "Virtual FIQ NMI",
-            [EXCP_MON_TRAP] = "Monitor Trap",
-        };
-
-        if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
-            exc = excnames[idx];
-        }
-        if (!exc) {
-            exc = "unknown";
-        }
         qemu_log_mask(CPU_LOG_INT, "Taking exception %d [%s] on CPU %d\n",
-                      idx, exc, cs->cpu_index);
+                      idx, arm_exception_name(idx), cs->cpu_index);
     }
 }
 
@@ -9967,6 +9930,42 @@ void arm_cpu_do_interrupt(CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
+const char *arm_exception_name(int excp)
+{
+    static const char * const excnames[] = {
+        [EXCP_UDEF] = "Undefined Instruction",
+        [EXCP_SWI] = "SVC",
+        [EXCP_PREFETCH_ABORT] = "Prefetch Abort",
+        [EXCP_DATA_ABORT] = "Data Abort",
+        [EXCP_IRQ] = "IRQ",
+        [EXCP_FIQ] = "FIQ",
+        [EXCP_BKPT] = "Breakpoint",
+        [EXCP_EXCEPTION_EXIT] = "QEMU v7M exception exit",
+        [EXCP_KERNEL_TRAP] = "QEMU intercept of kernel commpage",
+        [EXCP_HVC] = "Hypervisor Call",
+        [EXCP_HYP_TRAP] = "Hypervisor Trap",
+        [EXCP_SMC] = "Secure Monitor Call",
+        [EXCP_VIRQ] = "Virtual IRQ",
+        [EXCP_VFIQ] = "Virtual FIQ",
+        [EXCP_SEMIHOST] = "Semihosting call",
+        [EXCP_NOCP] = "v7M NOCP UsageFault",
+        [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
+        [EXCP_STKOF] = "v8M STKOF UsageFault",
+        [EXCP_LAZYFP] = "v7M exception during lazy FP stacking",
+        [EXCP_LSERR] = "v8M LSERR UsageFault",
+        [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
+        [EXCP_DIVBYZERO] = "v7M DIVBYZERO UsageFault",
+        [EXCP_VSERR] = "Virtual SERR",
+        [EXCP_GPC] = "Granule Protection Check",
+        [EXCP_NMI] = "NMI",
+        [EXCP_VINMI] = "Virtual IRQ NMI",
+        [EXCP_VFNMI] = "Virtual FIQ NMI",
+        [EXCP_MON_TRAP] = "Monitor Trap",
+    };
+
+    return STR_ARRAY_ELEM_OR_NULL(excnames, excp) ?: "unknown";
+}
+
 uint64_t arm_sctlr(CPUARMState *env, int el)
 {
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0 or EL3&0 */
-- 
2.55.0



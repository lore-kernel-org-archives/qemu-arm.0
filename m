Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C7B607B113
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jAuTI6Eb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNsL0u3K
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMnw-0003T7-AX; Tue, 20 Oct 2026 23:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMne-00030s-46
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:15:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMnF-0002TG-Qw
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:15:22 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2F193336625
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TyexEBPMQhHa25gvne1aS7MprTFHqB40T82Zul38+kE=; b=jAuTI6Ebjm0Zb8er
 AmZ3yRTVMs4bF2WDqqpzdVETA5YMVvYSkuKj+rmJylPr4qGezKONfH7vFh2YeMS0
 uIH5fD4XHAy3YNjRSI1xgHZwvOR01WymUgVD1jE4EXm6o3GkSXPegLwgPYNpExki
 8WsGPw7M94wkie8IjPQpZbQ9ICJ8t1/d4vmMBe7Ik8TleA6swkVgbYlbDQKYamKb
 pf7o8QOLZw5xURWfYFWhr857oTzrNc8NB/kp4KBAl75wKJ8yuJLl0dXdTyiuACqG
 wGVKz3/Qe+yLfRgoEPm1XZAOXHuSQfmdnY7nNWWgWPP+fZBwh5+SCpzfmt/LQPQR
 CSrH1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabhrcg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:14:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-934956beec8so65279485a.0
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552497; x=1793157297; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TyexEBPMQhHa25gvne1aS7MprTFHqB40T82Zul38+kE=;
 b=PNsL0u3KKjc2sOUyyZryq5mFZTb2hz4DBvYfd0YX8lkBY05txd4GyUZ/qLZrFQOWcd
 iMx9fn86Mtkp6k1SfOwPBC475aKr44XXyhvgR+f7+c5gMNhBwgHt1x+rWc2NFaDHIarR
 bs69IU/M0RqeACMV10IjLeW+Xk2KNC+39vi5Lsrb3DzhbTKObyr8xPE+eCAf3KkaA0Qn
 +FikK5SaOBSBFxoCfBb/3tKntDjDq2lwjSVd6vigJZdR39UzY6oPOJaZhmgI6lUuld7b
 oeOl8HuNhQVFFIvuCa/RTZQvlf2NxYmWicxifaTfg+VJ0cwl6M0gTMdVBmf+7Ze4Yiqk
 q4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552497; x=1793157297;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TyexEBPMQhHa25gvne1aS7MprTFHqB40T82Zul38+kE=;
 b=BxN6Bg8BjF3nLZBLntw+3TgncfnppMjO5t7KE230djIaJYol5ib/9pW5LFzXhd8eUC
 tmziSe8wBT5rmTOgawvq7ES5oHJoCaJcakiWs60vIX4iPn83+j24ILq92hvOqarAFiCY
 xYeyM/73F5nnxLQctuI0nswATvbFhccDempXfbXuqBHl99bOLEDuD+ybpyPyTauSu68q
 OZF1WYDEAL5h6P6gdDKY6yhiNpX96Qy9Dg8hKWMq1r/YAohtlz+CgpLyTCGscK4izdt8
 BYSFBf66bTkPU6jmlgTrPh8DjXjTVhImyWDRoi1ziRz6e+l8xG1NnmNjs6amM+uOCo8A
 DaPA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz6aNR2Aptn3RsNZpMN8rc188hcDj07jVQu2bupougEn/XurFbhrmhocn5R3lgrMv87rNStZO6Z7A==@nongnu.org
X-Gm-Message-State: AFq9FYIWyU6nWhPeRcWLHkC68ieeFQ2knxDho3D0uiWXcNfNoirW0hwL
 X0XqKgE0ARF9vvn3o8sIxWOmbkzVVMx7UAn0YBil/arh5vL1J+op3UZq7pCFVgR8UAYgr6voZ5+
 CkiEomueJY26VKQSD9np2//4Y3xFYgHvmFjPENlwatDfGuRwRZKwqgG8=
X-Gm-Gg: AYBFou3PA8AIZ5EEDXx7u3u9QnM79dWmJqPMl+320x9LtSmFgzvXLR+AQRyhp6sDPg8
 rBXqr0JH/0Zq9eXGgjTJuAWkaL3nRRkCniJKZyxo1qewg4/WsGPgIBCqlpqlVfafhUiSr4ur7B8
 DY5zDpJ+BOzd26Jm0RUEDV+lHEXTOEJWElqnKvK9fBTTFEqjxU+NOst5GxalDunyWU73RclsrBz
 u24tGWAw/NRUqApL+IFM8ps/wQPCwsYt7Eq1GUpw3bg307IVrgb/8u86fcsziaUvaDkYv6K/ZHn
 AH5fgYwrMoRFsKlbLSrttjBRB7Yx1142DIj1ebuccjegSZd0/w3I3R4Wc27CBlAIgcN/3ryQuPD
 L28DsiN/smzjZHuh9wo07MmR7AYcTJzunoykk+y/p
X-Received: by 2002:a05:620a:4541:b0:93f:54e4:6d43 with SMTP id
 af79cd13be357-93f57e5e1b5mr213136985a.6.1792552497448; 
 Tue, 20 Oct 2026 20:14:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4541:b0:93f:54e4:6d43 with SMTP id
 af79cd13be357-93f57e5e1b5mr213134685a.6.1792552497000; 
 Tue, 20 Oct 2026 20:14:57 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fb864dacsm40890855e9.12.2026.10.20.20.14.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:14:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 06/33] target/arm: Register CPUClass::exception_name()
 handler
Date: Wed, 21 Oct 2026 05:13:39 +0200
Message-ID: <20261021031407.24862-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX1n5CKuwoPw3X
 wIZjZDRCXANVhRYvPkvUufGB9nojQQenXx6WT1HTetJ9Fgb7Rq/g3GGuvXUexPV756eWtTmGUyA
 KAaI4uQWbhCbNN+3PUz349dZxvvxFhI=
X-Proofpoint-ORIG-GUID: HCD2dpjcuZs-27p0iAPojIT1rxR6gC3i
X-Proofpoint-GUID: HCD2dpjcuZs-27p0iAPojIT1rxR6gC3i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX9MBd8K71VnHH
 IxgAU5vQeXhG9pu23ynhQ0R4kw6p+BILeojJrpkB0vzzW/W8CLCSzS8zUPoGsfMxOu+uSHOV4VZ
 D6r7JFTccxQCZOppVWU1T7NUxFotU1Ri0GJownXyH/Xx4JzU0OjxgQ30tzOB0IDSF4PAuUZlTT0
 4NrPP+dGv0hq4Pt+m5/uRbt6IQdpJG61pLBk1b5OLBC7SG8l3Np11xOs0T1VQNIi/XFsFTj2EeD
 j4CZPmrYCC51xQc6+J9edoiBxfO3cQYst6yVCc3aGgI2NPdnE97Z+D0qCs9ncC/agB5Dr4kOk2j
 L//Mx6ROp/2EluL3aRYaPFYmKQSCefQCzOMwovNH0SdvuGTkJQ8xZRYSl/ryaSzlLSpfqGpDGYZ
 OX+zlxSn1zxc6LolpqER1JTkhTS5ahMx5SwX76z0yNJHCmfTiGKuwE/km/ul4Dqf0geYzqyfd5W
 CYSQGTBVrDouWvaeQPg==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad82e32 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QvePOBYGvqDf6_zMoJUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
 target/arm/cpu.h    |  2 ++
 target/arm/cpu.c    |  1 +
 target/arm/helper.c | 76 ++++++++++++++++++++++-----------------------
 3 files changed, 40 insertions(+), 39 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a0355ba9e1a..d76554dfc1f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -67,6 +67,8 @@
 #define EXCP_MON_TRAP       29   /* AArch32 trap to Monitor mode */
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
+const char *arm_exception_name(int excp);
+
 #define ARMV7M_EXCP_RESET   1
 #define ARMV7M_EXCP_NMI     2
 #define ARMV7M_EXCP_HARD    3
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
index 7ac21108d1c..824f0a75d04 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8841,46 +8841,8 @@ void arm_log_exception(CPUState *cs)
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
 
@@ -9967,6 +9929,42 @@ void arm_cpu_do_interrupt(CPUState *cs)
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
+    return ARRAY_ELEM_OR_NULL(excnames, excp) ?: "unknown";
+}
+
 uint64_t arm_sctlr(CPUARMState *env, int el)
 {
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0 or EL3&0 */
-- 
2.55.0



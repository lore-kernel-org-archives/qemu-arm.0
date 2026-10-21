Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BF1606E87D
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hLWC31GL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lnb6BDHN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMrj-0001YW-KO; Tue, 20 Oct 2026 23:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMqU-0008Cm-8h
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:18:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMqR-0003C0-Dz
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:18:30 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2FGfE3988734
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 m231c6VrBnhGE/a0T72yGbnBWbXskeYkpGIhIDnDSJQ=; b=hLWC31GL7NvBoqBa
 E2PA8ZMLvOVOKizxr0TnfM33P3BzkmlE4JUBOXGiiWHC9rOAgIKEnMiFdh0qeBXf
 vGyHTMbfeUNNfsf92NpJC1fPzMJxh40nw2gqR+ArBEWi/TDfD2o6G4IWoYV2MvMx
 M609GbTQokF7wfiepEXj7aEXP0ElS4/Zb1ETkjCe1Om8TqCuri1nbgnKpdwWnFZu
 PvIBPhIzi1cdbDzE0cXrEfnw98Oe/jnmIxoDJDuvpzyOQUuAMH1FMZJVQ9hkEu8q
 oV/eoNkfFWsIILyWF7/jGITKi9Uy37Ol3D7ucUADVfhqhpFZ1Gr2gwgG7LqG4L9r
 ssFy6w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajhrjw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:18:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f1f2fafeaso43083985a.2
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552696; x=1793157496; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=m231c6VrBnhGE/a0T72yGbnBWbXskeYkpGIhIDnDSJQ=;
 b=Lnb6BDHNwR1ZUduBkw5Jw+47qVPAsnREFQwXhtVKz2LP7WXtei/zDMk/wsSscar7Bn
 RQxukXGG/3B3dJPEeW0vT7PVHVF2SvvS/PC+tqVGSPfEtoPV0DqKbC4B/DADQk9JiAF7
 mtRIrKYnTcg0zqI3JMbbdhv/PzmG93B4i8fndtk0frtL9GJGr7zSDoR9P0gdTy26XoFt
 UlVxxbNYpfyhje9vIzhAvF8YPe/WP0QRoSodkBSTAinBl2taazZDhDYlmQ0w4Kut5aJi
 Dv7zZFpzFFBs7necy/Ep409Dw9yErLb7LrLhO2yOr/RYXEL9bbWRq5OhMfNfN/TW7uQ4
 /FOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552696; x=1793157496;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=m231c6VrBnhGE/a0T72yGbnBWbXskeYkpGIhIDnDSJQ=;
 b=jfrNsAlQPt9BJTddXJgs8Ip+u783kfGXrwyxcXnh3JYwDL1rrP+rREpAgVdWVZXLXR
 KkV59bCLrBYbwBtSJa9SRcQdmjKPen7XqNZeFqbdxIR72cdYQ6eGbZAcKqlm+vynp/Ke
 0m/FKqunN969cZZCXhvIWWnCiSE/6I4aw9d+ZTaAcZ6Px4J0k0CxNQPeN5U+9NrLT/O9
 DsaS1/EOznAydCdQq4EPrNSc3XRP4LkDU2M1G4V+A+fmraqUvAYxTCtZRLPKFBOEkX6X
 NkvSTRBDGlIsXvAbwoB4Hbgjy+d2seD49k5VyNrUOnGiI4QB9ABA4BNFAeqtfVqbJcRM
 j5KA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxNBinDxyghDyzXFgWsfjD/HhcP+JznVQgHWscaUJSfZZRAiihUS1EvevSn+UXOGZW3z+sngZ1Fgg==@nongnu.org
X-Gm-Message-State: AFq9FYKGsWg2WYHW/RuAi6xnbDSIwt5HrOYqsHI0MZIiOugbZclxtvib
 nFJ2U/Pb7fOZIoN6NNPNhf2KHeh4PUzpxxcyGI6Uqeva0kxW0WdWf/K6s6iPmn5wB9VEIcw4QZ9
 F9ciD0KzkpDBjZhsMKhnRnwgkl1fKnXxNyXGt9Jy3DGos+yWI2RWlL1I=
X-Gm-Gg: AYBFou3keGjclDP42wNuoqgV/xQvIqpBKWlK69Kp95uczIwPO+1MEDoZKvAWVgM+OsH
 7BO87V6AgKM+EyQ97Dap7qAqAPa0lxa+eZL1QzQAd/zcKbNyA8b/Sh+VSt6JhnfUfyWjV7sFzGe
 bsqeX7lVnrJmYllJsYtbiIZTS0ytXlXoQpJUA16PDh2kVRKm9NG8LLX9iriSUSX95CCXfQHICxh
 bWApbbCfHoPkCJ/+aoONvHOgWV919kmqL11jPBCRSXuhKMNq6H7uWG+zTBP2cxUAWwuGl1Rz56A
 n+dJqDPTBR8OxT0/trTAHyGNvUgHkDbbxd2N/gTOPuE5ClUzjGK+YLaMRAMu8byPJANxYEt9Vxl
 wA9Xd8KUTcutnz/4Yw65OLgo4wDpejg2tLzL2yf9Q
X-Received: by 2002:a05:620a:3188:b0:93c:aff9:52c with SMTP id
 af79cd13be357-93f57f5861emr224116485a.60.1792552695600; 
 Tue, 20 Oct 2026 20:18:15 -0700 (PDT)
X-Received: by 2002:a05:620a:3188:b0:93c:aff9:52c with SMTP id
 af79cd13be357-93f57f5861emr224112885a.60.1792552695083; 
 Tue, 20 Oct 2026 20:18:15 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25828e2esm2367152f8f.30.2026.10.20.20.18.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:18:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 31/33] target/sparc: Register CPUClass::exception_name()
 handler
Date: Wed, 21 Oct 2026 05:14:04 +0200
Message-ID: <20261021031407.24862-32-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXys6CPYaUimAN
 92XicxgcSFjA4jldWs+ALsAcYfEPC4AVBzoTAVbohP2l57e64YevTZAQqFERAoNfsqCCviJgayg
 nF+zb8yXoUSZktAUEItVfdbmg3h4mmhX0VHb3loZ4ijseVTSLkolwnEoKN+i0skE7VR4zFU2s6F
 /focFJU4vXfivQ/jWIt2KPPBVvSrzT7brQOSOhM5oisC3g7jgQoq1mPYtGQ7bmZufsLKUZC71rd
 PazyiR8WTHlnofySyOXCt6/1rtqZhicxF0xBsvPKYa0EYrtOBqznszLg0LLmvtybZxN6LPsyq/X
 tB1Y0fd6JYWu6VUGgq7NLSL1nuFyZ0CDMHIy3nhx59ZYZtvv4BnRKK5zMfWzC9sAFrDaMOLMZVW
 ZXbh96sqR6nu04oDCtb7UggueaPU+hkMpdv8/gdBSziXhfvYv9z6Y8w9E/4WdGVVj8HlgVn1EWT
 3caIBkciKnWiLnyvw4A==
X-Proofpoint-GUID: _L3DbkkWwIsiXffd-vJg6TWqX3p0R8ov
X-Proofpoint-ORIG-GUID: _L3DbkkWwIsiXffd-vJg6TWqX3p0R8ov
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX9Xz3S5qiz4wy
 F0gPJFu54O4NiloxE7UEcxVAyGKCag9+XWMAZeA5VRiwlCG8mmnPB+j7ocASaJuhG0QsI01xPdH
 IvVmfkzxMALN+LQW8Qk7xaoyuDmQ2Uc=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad82ef8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kEJbCHFcLIL5wbn19PYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

For each SPARC / SPARC64 target:
factor sparc_exception_name() out of sparc_cpu_do_interrupt()
and register it as the CPUClass::exception_name() handler, so
the common exception logging can resolve SPARC exception codes
to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/sparc/cpu.h          |  1 +
 target/sparc/cpu.c          |  1 +
 target/sparc/int32_helper.c | 21 +++++++--------------
 target/sparc/int64_helper.c | 36 ++++++++++++++++++------------------
 4 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 31a16c2af03..3c1ba223eb2 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -583,6 +583,7 @@ extern const VMStateDescription vmstate_sparc_cpu;
 hwaddr sparc_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
 #endif
 
+const char *sparc_exception_name(int excp);
 void sparc_cpu_do_interrupt(CPUState *cpu);
 int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index ae9bdca9df8..1f9a62a8c76 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -1098,6 +1098,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, const void *data)
                                        &scc->parent_phases);
 
     cc->class_by_name = sparc_cpu_class_by_name;
+    cc->exception_name = sparc_exception_name;
     cc->list_cpus = sparc_cpu_list,
     cc->parse_features = sparc_cpu_parse_features;
     cc->dump_state = sparc_cpu_dump_state;
diff --git a/target/sparc/int32_helper.c b/target/sparc/int32_helper.c
index d6bb3fa1e54..6db5aee81c5 100644
--- a/target/sparc/int32_helper.c
+++ b/target/sparc/int32_helper.c
@@ -58,12 +58,12 @@ static const char * const excp_names[0x80] = {
     [TT_NCP_INSN] = "Coprocessor Disabled",
 };
 
-static const char *excp_name_str(int32_t exception_index)
+const char *sparc_exception_name(int excp)
 {
-    if (exception_index < 0 || exception_index >= ARRAY_SIZE(excp_names)) {
-        return "Unknown";
+    if (excp >= 0x80 && excp < 0x100) {
+        return "Trap Instruction";
     }
-    return excp_names[exception_index];
+    return ARRAY_ELEM_OR_NULL(excp_names, excp) ?: "unknown";
 }
 
 #if !defined(CONFIG_USER_ONLY)
@@ -107,15 +107,7 @@ void sparc_cpu_do_interrupt(CPUState *cs)
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         static int count;
-        const char *name;
-
-        if (intno < 0 || intno >= 0x100) {
-            name = "Unknown";
-        } else if (intno >= 0x80) {
-            name = "Trap Instruction";
-        } else {
-            name = excp_name_str(intno);
-        }
+        const char *name = sparc_exception_name(intno);
 
         qemu_log("%6d: %s (v=%02x)\n", count, name, intno);
         log_cpu_state(cs, 0);
@@ -129,7 +121,8 @@ void sparc_cpu_do_interrupt(CPUState *cs)
         } else {
             cpu_abort(cs, "Trap 0x%02x (%s) while interrupts disabled, "
                           "Error state",
-                      cs->exception_index, excp_name_str(cs->exception_index));
+                      cs->exception_index,
+                      sparc_exception_name(cs->exception_index));
         }
         return;
     }
diff --git a/target/sparc/int64_helper.c b/target/sparc/int64_helper.c
index 10341e0c282..aa4002e74da 100644
--- a/target/sparc/int64_helper.c
+++ b/target/sparc/int64_helper.c
@@ -60,6 +60,23 @@ static const char * const excp_names[0x80] = {
     [TT_EXTINT | 0xf] = "External Interrupt 15",
 };
 
+const char *sparc_exception_name(int excp)
+{
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(excp_names) > 0x200);
+    if (excp < 0 || excp >= 0x200) {
+        return "unknown";
+    } else if (excp >= 0x180) {
+        return "Hyperprivileged Trap Instruction";
+    } else if (excp >= 0x100) {
+        return "Trap Instruction";
+    } else if (excp >= 0xc0) {
+        return "Window Fill";
+    } else if (excp >= 0x80) {
+        return "Window Spill";
+    }
+    return excp_names[excp] ?: "unknown";
+}
+
 #if !defined(CONFIG_USER_ONLY)
 void cpu_check_irqs(CPUSPARCState *env)
 {
@@ -136,24 +153,7 @@ void sparc_cpu_do_interrupt(CPUState *cs)
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         static int count;
-        const char *name;
-
-        if (intno < 0 || intno >= 0x1ff) {
-            name = "Unknown";
-        } else if (intno >= 0x180) {
-            name = "Hyperprivileged Trap Instruction";
-        } else if (intno >= 0x100) {
-            name = "Trap Instruction";
-        } else if (intno >= 0xc0) {
-            name = "Window Fill";
-        } else if (intno >= 0x80) {
-            name = "Window Spill";
-        } else {
-            name = excp_names[intno];
-            if (!name) {
-                name = "Unknown";
-            }
-        }
+        const char *name = sparc_exception_name(intno);
 
         qemu_log("%6d: %s (v=%04x)\n", count, name, intno);
         log_cpu_state(cs, 0);
-- 
2.55.0



Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E63D606A336
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZVG+q8t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Elgx3nPZ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMqP-0007tp-HY; Tue, 20 Oct 2026 23:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMpJ-0004xP-1E
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:17:21 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMpG-00030I-7p
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:17:16 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2FB783116172
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kqsyq5ufOSYPdPIadZgoikdqK3qQtPj8FL7aNjTYmrs=; b=aZVG+q8tHeJET48k
 zYLjnoKLk+OBXfgTvMX7E/DRXoo2dU/WNO6Ozr4qJrdiw+xgB3zw30wAS9RSyZkb
 vVxOPSP+ziantTPvuEJqTDV3SiH17cA0fKiTr8Xrfsh+cOmOz/4E/l9ljZpOj/l1
 h3R4Uux2MAZkF9uXQMRlHgc+fsGtmpRLlYaulENrmjT1JnjKlBVwlm/3+tOS2K3G
 Fldj5aD+eHzACpw3xhG6boVsMt23PbaYYxCcM9WI4YA8PLYSFM3KApnsbzwVzY6E
 StGuqefhDnGiPlbl+5UTuB9BSPkp0ZyJw4c8NrIqFIdC3fJaXqIHON/UDgEtmtZ7
 UnY9lQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hsr4a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:17:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91bebff9fcaso12845926d6.2
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552623; x=1793157423; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kqsyq5ufOSYPdPIadZgoikdqK3qQtPj8FL7aNjTYmrs=;
 b=Elgx3nPZAPE0mWqzU05np/GNcvqhed0RBhffGtbbC/MsJ6KAnUG8IpKal38bPp+Ibk
 ZJBE1qQVi3QrpXuizm0chECAHm+Kux93bj+SxeE8gvD+tPg3xA6UfaDNQR3aksPDRmtn
 udCq5i2Kb39NgId6JUmVHzxg/ZOZp5VsehIe3KY5YJtepzI84HlccDVbtMtCeEUnhBJX
 l8XDZtqlGBdcMDI6nto1PDiPS8m6LOSNVPQ25GF+RmzbxTJYvxQnPAafFZF4ZG5LJYXl
 +4YXo0mk/pgkudIXgXdw0OIJlfrkkuqmYyTBPqje6U9toD7lQdgDCdSZT8v2yERPsSPG
 J8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552623; x=1793157423;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kqsyq5ufOSYPdPIadZgoikdqK3qQtPj8FL7aNjTYmrs=;
 b=TY0tyftDAf6LFGGWZB1peVGg4wIlAYkwfcGDyTHnm5bNRFpakQYd5UqidwWIraIgf0
 zp9tzYeCqG0nGW7Ozz0Tz36wfWG6kVTVMMNKKT2gc7vFMxg+1xCvS6f/67AuaXnB8zCx
 zNq2wN6w/S8ZdhmK76Zm5NiHIlCaP/5CGcGiq9b8PeRGRrXxWQdW9vVQudxFALv/iokL
 UZqgHW5ni+sYIIA7aBxAiQ//4v7vjpqU4DOwznfhfUiNjcIiqfpjEB3CX7HQTiRi3ADY
 V6d4CuLVC6ZvGC11sh3KwwlDZRNy7VCQ//oKrjjhn40r7tAuWBS4QuT9xQYGSAaZuWfd
 0iLg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz0+zXMuTnnIYqwZp+n64VU0VQmo7D0jOjceJxb8Fqa2+wCkNCySuhyaltyIjL2AN1E4HXf9f3/qQ==@nongnu.org
X-Gm-Message-State: AFq9FYIcyAEMu2SF/IPO4IvSy6+Af71auM4JkipFrFxVrCHLzif29Cuk
 M4/FTG7orSSTbBU+qm9jSNZV2ZYWlJp0PaZqoiPpQoQA8RXRru6wvGYrHk3u3ew+4YMZ6xfnY4I
 K/Vxqcmj6FXLrbtgxc7OMJbJZlBkdiAvtAfJUag9VOYDgB7VtNFP09fU=
X-Gm-Gg: AYBFou1QrvyY1pDxoA4t94w6wpjO87sNJjBprLqJughFZfE+YnoSDLZfA/tG25Gew2i
 4K5LvfSO7jbTQ4HM60Az2VHOtpvd3Kgjxmag6gq/ep0ADmp3b4bLB+gnJD9PnjDXp5182HdgDSY
 UPtYYTGK6VwQp+VqgzJDZw33Z65/zeoK/lNr1/nIXEKOtoICoRbHj6e1fkCv/prqgzo0v5PoLAg
 /tPQPrQzhegvbdqgoNN5GwZK/4WmTRceYIJzZWHa+TchsY6OYbcj6v+ccri7OsWqphx49OADUk8
 pp/0GRO3yYrBCpKplZRrjo7VdTlpVtIWKqqHIOxVSro0zyl9cYyczz4h+ERHfMWRzOGxfzZgtrC
 +CYSuBYbHaFA704WCdYnLjpYjpyPk6rNdh0p21iBN
X-Received: by 2002:a05:620a:3711:b0:93f:5677:9950 with SMTP id
 af79cd13be357-93f57f46196mr217882285a.53.1792552622614; 
 Tue, 20 Oct 2026 20:17:02 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93f:5677:9950 with SMTP id
 af79cd13be357-93f57f46196mr217879585a.53.1792552622126; 
 Tue, 20 Oct 2026 20:17:02 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fcdd3855sm11075905e9.1.2026.10.20.20.17.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:17:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 22/33] target/riscv: Register CPUClass::exception_name()
 handler
Date: Wed, 21 Oct 2026 05:13:55 +0200
Message-ID: <20261021031407.24862-23-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad82eaf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=y9j7XMdMAJhvWi9Kj2cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXw/5ww/bsazyD
 oZ8lp5Exc47+vq7Yw79JcMK04uC9i7xvmpti2zN3/mW25Bs1Z50wmY842iX3Hwv27nINdoYCZYh
 lbp6uxTlAzbpyIx71I3cjD65+z8Br3c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX+iFf5Fe2DMk1
 EAq2UIw5M4SkR7FZXxkH6gffR1tLZi9pNVNMKZtrkIuUc+eNz9R+zD0erYNExKYaATZhgZcEDBy
 Zl08AbzhQm+oUUa1HGzIpEvq0S+FP8l8TxUo6xrgkFmaa3l+L1lM3yS7rNgXAztrqrHJXdlDgcm
 9r3LAfEnULvtJCA9syxxtd5A0oTXfVLtYpu5a/RhHN0V8hVi30XmbqRWOftHnBQQCmwRtkAK1R2
 Vv5JrM1qZo5VeHQnL20Ci7htO3eboAWSB+2sOYyW0q7AnOcvVI0XQDWA8osFGPxtMnqiZUFSLFK
 V7/2JjCw1UqzM+AsZg2vs704ypdees+nzz81MTb8AYetbJU0bIWfx1naIGXoCI44Il896UFiEH/
 CxQjKht8GfC3l5TTd0I3pw1jjpSWmwA6chk0ARhMaFn6SsjwYUGSuXWZyKsJEM539UmjgiiVnyz
 ATVTt0YoAgxhLWDy2fQ==
X-Proofpoint-GUID: iV9-6oBi9B3Bg3mz4Cc_4TSpIV4xGO4B
X-Proofpoint-ORIG-GUID: iV9-6oBi9B3Bg3mz4Cc_4TSpIV4xGO4B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Factor riscv_excp_name() and riscv_intr_name() out of
riscv_cpu_get_trap_name(). Register riscv_excp_name()
as the CPUClass::exception_name() handler, so the common
exception logging can resolve RISCV exception codes to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/riscv/cpu.h           |  1 +
 target/riscv/cpu.c           | 29 ++++++++++++++++++-----------
 target/riscv/tcg/op_helper.c |  2 +-
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b65d6319940..49a1186bdbb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -672,6 +672,7 @@ G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
+const char *riscv_excp_name(int excp);
 char *riscv_isa_string(RISCVCPU *cpu);
 int riscv_cpu_max_xlen(RISCVCPUClass *mcc);
 bool riscv_cpu_option_set(RISCVCPU *cpu, const char *optname);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 08a4d14ea1f..9e9a9603685 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -398,6 +398,14 @@ static const char * const riscv_excp_names[] = {
     [RISCV_EXCP_SEMIHOST] = "semihost",
 };
 
+const char *riscv_excp_name(int excp)
+{
+    if ((excp < ARRAY_SIZE(riscv_excp_names)) && riscv_excp_names[excp]) {
+        return riscv_excp_names[excp];
+    }
+    return "unknown";
+}
+
 static const char * const riscv_intr_names[] = {
     [IRQ_U_SOFT] = "u_software",
     [IRQ_S_SOFT] = "s_software",
@@ -415,19 +423,17 @@ static const char * const riscv_intr_names[] = {
     [IRQ_PMU_OVF] = "counter_overflow",
 };
 
+static const char *riscv_intr_name(int intr)
+{
+    if ((intr < ARRAY_SIZE(riscv_intr_names)) && riscv_intr_names[intr]) {
+        return riscv_intr_names[intr];
+    }
+    return "unknown";
+}
+
 const char *riscv_cpu_get_trap_name(uint64_t cause, bool async)
 {
-    if (async) {
-        if ((cause < ARRAY_SIZE(riscv_intr_names)) && riscv_intr_names[cause]) {
-            return riscv_intr_names[cause];
-        }
-    } else {
-        if ((cause < ARRAY_SIZE(riscv_excp_names)) && riscv_excp_names[cause]) {
-            return riscv_excp_names[cause];
-        }
-    }
-
-    return "(unknown)";
+    return async ? riscv_intr_name(cause) : riscv_excp_name(cause);
 }
 
 void riscv_cpu_set_misa_ext(CPURISCVState *env, uint32_t ext)
@@ -3128,6 +3134,7 @@ static void riscv_cpu_common_class_init(ObjectClass *c, const void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = riscv_cpu_class_by_name;
+    cc->exception_name = riscv_excp_name;
     cc->dump_state = riscv_cpu_dump_state;
     cc->set_pc = riscv_cpu_set_pc;
     cc->get_pc = riscv_cpu_get_pc;
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index b8b3e43ccd5..f85f5cd83c9 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -41,7 +41,7 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
     CPUState *cs = env_cpu(env);
 
     trace_riscv_exception(exception,
-                          riscv_cpu_get_trap_name(exception, false),
+                          riscv_excp_name(exception),
                           env->pc);
 
     cs->exception_index = exception;
-- 
2.55.0



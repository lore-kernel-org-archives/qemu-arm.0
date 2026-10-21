Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B760D606A31C
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C3NvxhqN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b8kmINLq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMmx-0002jK-Et; Tue, 20 Oct 2026 23:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMmq-0002fP-V9
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:14:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMmp-0002Qr-Bx
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:14:44 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2F4gC2391337
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 POX/WJTfRTtj1QzagZdqMLjkjh6Nnt7ofKB6ovVu0AM=; b=C3NvxhqNFEPpSP59
 mPIo7kpDhTVHp68q46OvB2S72eK1hYMNKDBanL7C6bxDpgr/zpKd/sqaOXPYu9jG
 7HOa85LuK2LYVs/Qx5MMrT8QzoFajkdxz9cCPHVaT/w267GawgM9LvGyIykVpuGo
 RcoHZDwN8akAiQ3vZY7TZdm34sAkqMefhg2P0wno89Zbr/phEk0gYkaDxoF5xZrz
 4FfICWvVqfNulQc8fALg6lEPdTrAhNOkWuoJ41uTLdo4+k30wmyCbltsLeyb+ol8
 JHImfURkK05+NDOaF8DVcWovNpXnrpm9BkrD7P9PEOlB8NeEIAW2RuU7o5bWXP/I
 hdjZJw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb99gkp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:14:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-917a109c937so4465546d6.2
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552482; x=1793157282; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=POX/WJTfRTtj1QzagZdqMLjkjh6Nnt7ofKB6ovVu0AM=;
 b=b8kmINLq1mggIux/Rw0hyh21+2lUgIrkPziiDeDvuez7DZtMi0KFtx+dKWy+ymOcqY
 1RDrpuW+UnO5vVs/eUI932CnqHS4Ak/1DS7Yncl7cvL1a4zZAYGWoviwL9mYkZXPiVgh
 r1/AUaOV0hk8Rvvi1/kaLUhS4vJR9X0ZDEKXetgqiMJhdZi5BKVw6wF+C+jBIOaKxpbL
 MZ+3PxecuTOjcrH+WAwoaf9zDIIIEoyDBVFV7FVxX0xdwxav5q2zF4By3PRIT8ARtyzs
 PWiBvusNHvSPiGipvN6N4cdSnxbsktOuOoze4lvWUtmYRThTMPNG3hwOcWs2cCgWXSTJ
 ju4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552482; x=1793157282;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=POX/WJTfRTtj1QzagZdqMLjkjh6Nnt7ofKB6ovVu0AM=;
 b=KZpMMSlV7RoKqX+HJmDViUmfrTTjjAsqHP5L4uCh8GBBG3bpqf8ap4CsFuJpSBwRFV
 lIwMrAPkN6idictY0/IZ4QQfJi6tSnl1RI8DjX8kPNn5YswqFRIXh1EurlZHScUW1CmS
 +Y1iHiosD8ohbVu8VRgi8z6Fjoma7MYm4Jd/Xk8gUbmJlAK0h8M9hjm/tNPcefjYyh/H
 qOxx91oiBN2GTgSzdLvXSstpCqUbbZIUSza3Q4e8WqHUebDowFcdtHCrCWsNilqIgGMQ
 G74tbmbeIwMMYcxBdrrXbT7TY4JOAmLDSDy8GD2iLP5XLDAn52j40rL6Nw6BedsU6L78
 JDRA==
X-Forwarded-Encrypted: i=1;
 AKwUvByA7qtzbmfMqBUvRjuATOcLkoxWnJKhn2mTosQCPAt/bCuSZKbQLDgXpHULQSFGBK6CH7kEjIMfHg==@nongnu.org
X-Gm-Message-State: AFq9FYIQUo3ZKQF8fI4EYrPZpOhUtRd8QC4vG6NfBCkOrzB0q0/wAnZ5
 j9Wt1udoCqeWDxE4LbnaJGwRCQ9I/p5w/vnhSyR3iUWSgHig7x1ZPPwox/pgSuYtw0r/GU8q4tn
 hrLM+5sziC9Y7jSzCpUVMUxvJEKLS7H9cQgOOdeC4gGEiKGKTV+JXadY=
X-Gm-Gg: AYBFou34F5GiiKMZp5R/Y6gO0ykCVaR89nFa3HQefxS4lsg4EaWPnhZl1Ar6XpU+uH2
 qDAABJ0+Emc605MSVEADK5IaigVtaX/vX0cnPXl19HDTwwuyzknfT2FSi38d+Ab4dMuL7xeTb+5
 EeJBHmdI5jMzp0vsOguVo6Xmr5IBt7cd2BJPkwnzE4wQbGNiQEayGIaDjbTEC03HVegmiPUGTJw
 DNGs26BWaL7GErwbYzLSeHPNRa027H69jqhlygg1V+ZXiGIgViak9GIsp3oWNgnQ2WrZI94k6dL
 2GDuRO+KccSjyy1McBLDW0hTfeiy/icL2HkXTG7iI6IaI8yevXEXiwzjjA5pAltaffg9UpB9wCP
 GDnDFLEx+XCDq2wuhObA6lDOuXESSPa9aKgiCG1Wp
X-Received: by 2002:a05:620a:17ac:b0:93f:2cf4:e6dd with SMTP id
 af79cd13be357-93f57f935abmr222677585a.51.1792552481586; 
 Tue, 20 Oct 2026 20:14:41 -0700 (PDT)
X-Received: by 2002:a05:620a:17ac:b0:93f:2cf4:e6dd with SMTP id
 af79cd13be357-93f57f935abmr222674885a.51.1792552481017; 
 Tue, 20 Oct 2026 20:14:41 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25834086sm2450046f8f.34.2026.10.20.20.14.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:14:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 04/33] target/alpha: Register CPUClass::exception_name()
 handler
Date: Wed, 21 Oct 2026 05:13:37 +0200
Message-ID: <20261021031407.24862-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXyCZD57Zh3nl4
 zpatNFRMNAcVy81/g2oZdwP6PSIoIriJQ5Xc91SEW6qD1F9QSSmmXrNxZzqaEjuis5b2gGWc9Yk
 qLld0v8xcGOMLn9ohv45UIziUQppk30=
X-Proofpoint-GUID: vgJqhJrpvz9aQYzYJLHiLwVf2djOSKdl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX8PDz1S7qc/Qt
 rFbGPc3uh2vWGSr85NRCBF1wWTsMZip/ME1h6dtKRHIXtxCeeuKvZadVolQxrIyDziBdFqN5/Tm
 Cqu2P37jW+GcO70b1uNAXXXYqaJ6oI0dw9M792C6JgfcJVykaPbeHSYO3UTVfFxTDOZ3p6iU8yf
 VKzdwCG8Q/1s2k3AkRmLVOgPnw+QJAC+6Qp1IClW7SLF8BeLV+SGgGUtcDsCNrnz3iEiHSJUQ8o
 nCRcBWSdssepH9PATm3pUe/it6G+wza+Tbfx+pqE6wFhOt9NM409U9v/cyvH0tkAEYnlQuwVCew
 vG8jTi+gbc3OkSRImVZqbbUvmBlMwcC0hmQLqCo2Z0yq1uy/pZKPQ4w4MSUM11rrxbQZobSjYBP
 q9l1m5CekUIyECnYsE5Sic+a9V93SzUeMyNZlBV13RI4UIbwx7/q5pBTw4lx8mX/AzSHv1avAh1
 4dtyXhCCVjaS68TMldQ==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad82e22 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kVf6GzFcR4OVXmdlW0QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: vgJqhJrpvz9aQYzYJLHiLwVf2djOSKdl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
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

Factor alpha_exception_name() out of alpha_cpu_do_interrupt()
and register it as the CPUClass::exception_name() handler, so
the common exception logging can resolve Alpha exception codes
to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/alpha/cpu.h    |  1 +
 target/alpha/cpu.c    |  1 +
 target/alpha/helper.c | 82 ++++++++++++++++++++++++-------------------
 3 files changed, 48 insertions(+), 36 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 378bd96d941..8f780502476 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -284,6 +284,7 @@ void alpha_cpu_do_interrupt(CPUState *cpu);
 bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
 hwaddr alpha_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
 #endif /* !CONFIG_USER_ONLY */
+const char *alpha_exception_name(int exception);
 void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 12e86021663..f9936315fa2 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -283,6 +283,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, const void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = alpha_cpu_class_by_name;
+    cc->exception_name = alpha_exception_name;
     cc->dump_state = alpha_cpu_dump_state;
     cc->set_pc = alpha_cpu_set_pc;
     cc->get_pc = alpha_cpu_get_pc;
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index c3614ecafda..cedb0006892 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -35,6 +35,51 @@
 #define CONVERT_BIT(X, SRC, DST) \
     (SRC > DST ? (X) / (SRC / DST) & (DST) : ((X) & SRC) * (DST / SRC))
 
+const char *alpha_exception_name(int excp)
+{
+    const char *name;
+
+    switch (excp) {
+    case EXCP_RESET:
+        name = "reset";
+        break;
+    case EXCP_MCHK:
+        name = "mchk";
+        break;
+    case EXCP_SMP_INTERRUPT:
+        name = "smp_interrupt";
+        break;
+    case EXCP_CLK_INTERRUPT:
+        name = "clk_interrupt";
+        break;
+    case EXCP_DEV_INTERRUPT:
+        name = "dev_interrupt";
+        break;
+    case EXCP_MMFAULT:
+        name = "mmfault";
+        break;
+    case EXCP_UNALIGN:
+        name = "unalign";
+        break;
+    case EXCP_OPCDEC:
+        name = "opcdec";
+        break;
+    case EXCP_ARITH:
+        name = "arith";
+        break;
+    case EXCP_FEN:
+        name = "fen";
+        break;
+    case EXCP_CALL_PAL:
+        name = "call_pal";
+        break;
+    default:
+        name = "<unknown>";
+        break;
+    }
+    return name;
+}
+
 uint64_t cpu_alpha_load_fpcr(CPUAlphaState *env)
 {
     return (uint64_t)env->fpcr << 32;
@@ -343,43 +388,8 @@ void alpha_cpu_do_interrupt(CPUState *cs)
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         static int count;
-        const char *name = "<unknown>";
+        const char *name = alpha_exception_name(i);
 
-        switch (i) {
-        case EXCP_RESET:
-            name = "reset";
-            break;
-        case EXCP_MCHK:
-            name = "mchk";
-            break;
-        case EXCP_SMP_INTERRUPT:
-            name = "smp_interrupt";
-            break;
-        case EXCP_CLK_INTERRUPT:
-            name = "clk_interrupt";
-            break;
-        case EXCP_DEV_INTERRUPT:
-            name = "dev_interrupt";
-            break;
-        case EXCP_MMFAULT:
-            name = "mmfault";
-            break;
-        case EXCP_UNALIGN:
-            name = "unalign";
-            break;
-        case EXCP_OPCDEC:
-            name = "opcdec";
-            break;
-        case EXCP_ARITH:
-            name = "arith";
-            break;
-        case EXCP_FEN:
-            name = "fen";
-            break;
-        case EXCP_CALL_PAL:
-            name = "call_pal";
-            break;
-        }
         qemu_log("INT %6d: %s(%#x) cpu=%d pc=%016"
                  PRIx64 " sp=%016" PRIx64 "\n",
                  ++count, name, env->error_code, cs->cpu_index,
-- 
2.55.0



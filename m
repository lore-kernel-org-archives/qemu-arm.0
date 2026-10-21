Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC233606E846
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mcq1oHhS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QL/sk9Jr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMpf-0005aJ-Th; Tue, 20 Oct 2026 23:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMo4-0003ji-Bs
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:16:00 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMnx-0002iC-TK
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:15:59 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2F2CE2897912
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Pne2na9EiRGo89DzaGA0yc8Yo320EUQ8tAj2hdi/Z74=; b=mcq1oHhSHRpUAtUC
 CWSjNh0nMOrMm2XiQIolp3yanTV8C2qMBOeUBpPVj4j9KL6WQaTzhUVq0LRchMGh
 02EaRWL0LGtOd2AawduJIoYG6tRtA2CqaJagZiZtn9jxNgZkUp0tjC6QJ+nYJ7oL
 TAYJbm8PzmJUeX9/gevkdP7puq6Ej2icrs8lwwvZvrUn3aoo8zsRykVRq44EQQN2
 DaKNpjvRaGMF3f1eyj4z8r0POLGOaDsVDA6Rq3LO+autZ9AK+YOMoePwAQ1HLr1/
 43Y+21JpiQOzzpBbUZBOaVaW0wlnwnHTwwnPPJQToA23T5zIGrLRouPtDxOl0wpD
 0FuOIQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0hq8v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:15:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f20addba1so58048585a.1
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552537; x=1793157337; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Pne2na9EiRGo89DzaGA0yc8Yo320EUQ8tAj2hdi/Z74=;
 b=QL/sk9Jroseb2gHkgFC/wbcdBCvuAT61fLq9zg1gOFb4Y19y2zFqPqSy59Pl27Ou5k
 +Cos39cfZYhoa3iz5uGOLfxSxsV6UQ9qU6cqwUURi3yF6413qJu9J3TGhPD7DanY9H0d
 g0BZYeS3OHUlcpsx3s0ELacx80aA1I6uPmwY8PcpnoLEFHKcknhzpnpC3KNX+S4JbsEj
 MYOBuOvqRA0RwQv5GVKQtNHqRs8cT4mPht6Db3zlVDkoBdW6BncLf5N1Fm50miwxhuvg
 QT4NMh9E1BoU+GdFCsvq7LUr8h+NXwH4+P8D+ac/idItKL04oAnZ/u9m0+AjGlH4tpIJ
 uedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552537; x=1793157337;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Pne2na9EiRGo89DzaGA0yc8Yo320EUQ8tAj2hdi/Z74=;
 b=kuOswP1DrMPIeJTRxKyUmHo+O52/3Li5EOy8oH216gxfajfDzOt540vKiZxhu3RnwK
 sA4GN0aWpWxMcCjiRE26q7V/9qvpnzFWc8BMRr7cggaOSkLyD6T65eHlUW4H0r01Smh/
 0ZMAnzp3GdV6Fm91XvnYzXfTUbjDBGct36cSOR5T7htsRXj9uwJHFhOSpZFvBgKBj/tB
 fGX/IqoGvlXMZlRQuZXg3fdils5o8jdHrY+HuLk7qRRvB5Y3qrQw2rLug9hDvrkM2e3+
 T+iLlHsYcueO8lqlnwyRUgZGBOAup6O45Zx3rBw8OGBecNBTlFjW0k6VbvOagyYpMLIM
 Fxew==
X-Forwarded-Encrypted: i=1;
 AKwUvBwka/0weYA7YWGL3hkJ9Ez7s4NrVHcek58Sm2gCB9bm6qz1a7zPBVEoONIH997haqSTuFvDlzB9Gg==@nongnu.org
X-Gm-Message-State: AFq9FYLzRXhZCFyZljSycTcAufDd1CfiB6fypN5s5rsI6ql10NGnijdb
 VR2hKB9pb7k+CjgDRCbkYqlcuzqCidgt9Cz1gq8i11/TtuF7YaWpoT/8kCcKqMLIrUTAk8kigUF
 4cK04jrN247Gmo9g5SIo4Cua59G27ZGyZwePcYfG0GtaSJfsu3eXV3Jw=
X-Gm-Gg: AYBFou2taYOlg9yPLj3BMnro2xe1NfHNAjcXjVxfT6ZGucBTxnPIYqyHbB89w5ohtrG
 JzN+6ksO2ClhOSL6KMYo9NQP5rq3c/vpZysaaEk6DoxBr2AwNEVXWVkPMveExhiTb1tvepIjiPI
 dFaMX2DNRV+q97j1RJf3Uv5rLehBzvnCbXDCUzgeW6saogwUcXAC/y3H1ZIeAqmQfkWhM7DLQYs
 rJl1+iPss/5o+K6zmWPfTjRiT55QuWABqzzVKAXN58/TaHfpOnrw6MD4DrnR1UWGwpQ9klkrShL
 I23PJ9AzbGCzshYExc5Su3hqlI+3eyAy0fk5ThB9518rVFumVFCngsdujBt0nTcVuo7vjrApJm7
 QqanbuoQOsyDQCtTDiIJIfoXCkuzIBpcbb5ZFCPyf
X-Received: by 2002:a05:620a:31a9:b0:93a:1048:7d2f with SMTP id
 af79cd13be357-93f57f23fafmr213800485a.41.1792552536938; 
 Tue, 20 Oct 2026 20:15:36 -0700 (PDT)
X-Received: by 2002:a05:620a:31a9:b0:93a:1048:7d2f with SMTP id
 af79cd13be357-93f57f23fafmr213797985a.41.1792552536478; 
 Tue, 20 Oct 2026 20:15:36 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f2d85a9bsm131107235e9.15.2026.10.20.20.15.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:15:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 11/33] target/i386: Implement and register
 CPUClass::exception_name()
Date: Wed, 21 Oct 2026 05:13:44 +0200
Message-ID: <20261021031407.24862-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX6aot/iCMNGoB
 Dz1pKvBGT1UuIem20cqoBpps/NzaEVJVPtbGDr2U4zu+rfNS/dgJcPxhXN7gManp22zYxpY+Z5I
 w22TYE30oBPDJggpK3MzDoq3YqR/79rDcaSlpgHld9SspsVzYaMlKqHQAX6KpOZVzzN3kX02NVz
 7GbOza6ESDvP6MzkNZln/W4MQsgNBt3HyKLI0PHYj4EnAfnYHZJX1WfYAYGA7TP0/GFVnEs+Hwj
 axWek/O4GEtAMwJ0XyjaY1O7VjGZRDzN/pSknX1N9C9IyJI9hNDUD77DXXNWDdR818sjW+NXwTT
 0OOlRe6XNcoVzaZqMr+gy0kSWW90FjVHEEoHHQmKxpm5B+4sd0u2N+6ZQLlYG2I6pNll2fXIV2X
 7UmTHC9dp+Lp/Oy2Av0YEKENXea+4X0VmGwM4C6Gma9FWg6s6iS8sQmKd1Kp1My2EmLqgOEWS+W
 E0aXCDdWPPs3GUBCnGA==
X-Proofpoint-ORIG-GUID: fdC9UChiOwqZewlZO1qxhZ_JMHProiK-
X-Proofpoint-GUID: fdC9UChiOwqZewlZO1qxhZ_JMHProiK-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXzDxBHyqL6MqZ
 HoO3wSsjp80R0+R9eGBfl6hoHpgFiY9qbZh4m1ymZ0iKQRDXXPWSy+NnO3qB7ljPYyMka0sJyjg
 WOFJ+LXjhPIpurE9SNeKDJHebhI7TGA=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad82e5a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=v-QDjpm2zyCjAj2l2PQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
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

Implement x86_exception_name() and register it as
the CPUClass::exception_name() handler, so the common
exception logging can resolve X86 exception codes to names.

Use the new helper in check_exception() and do_interrupt_all().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/i386/cpu.h             |  2 ++
 target/i386/cpu.c             | 30 ++++++++++++++++++++++++++++++
 target/i386/tcg/excp_helper.c |  5 +++--
 target/i386/tcg/seg_helper.c  |  6 ++++--
 4 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e7a88074c07..3945e90371b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1517,6 +1517,8 @@ uint64_t x86_cpu_get_supported_feature_word(X86CPU *cpu, FeatureWord w);
 #define EXCP_SYSCALL    0x101 /* only for user emulation */
 #define EXCP_VSYSCALL   0x102 /* only for user emulation */
 
+const char *x86_exception_name(int excp);
+
 /* i386-specific interrupt pending bits.  */
 #define CPU_INTERRUPT_POLL      CPU_INTERRUPT_TGT_EXT_1
 #define CPU_INTERRUPT_SMI       CPU_INTERRUPT_TGT_EXT_2
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5da80ade70e..1013f98b5a7 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -9372,6 +9372,35 @@ static bool cpuid_has_xsave_feature(CPUX86State *env, const ExtSaveArea *esa)
     return false;
 }
 
+const char *x86_exception_name(int excp)
+{
+    static const char * const excp_names[] = {
+        [EXCP00_DIVZ]       = "DIV#0",
+        [EXCP01_DB]         = "DB",
+        [EXCP02_NMI]        = "NMI",
+        [EXCP03_INT3]       = "INT3",
+        [EXCP04_INTO]       = "INTO",
+        [EXCP05_BOUND]      = "BOUND",
+        [EXCP06_ILLOP]      = "ILLOP",
+        [EXCP07_PREX]       = "PREX",
+        [EXCP08_DBLE]       = "DBLE",
+        [EXCP09_XERR]       = "XERR",
+        [EXCP0A_TSS]        = "TSS",
+        [EXCP0B_NOSEG]      = "NOSEG",
+        [EXCP0C_STACK]      = "STACK",
+        [EXCP0D_GPF]        = "GPF",
+        [EXCP0E_PAGE]       = "PAGE",
+        [EXCP10_COPR]       = "COPR",
+        [EXCP11_ALGN]       = "ALGN",
+        [EXCP12_MCHK]       = "MCHK",
+        [EXCP_VMEXIT]       = "VMEXIT",
+        [EXCP_SYSCALL]      = "SYSCALL",
+        [EXCP_VSYSCALL]     = "VSYSCALL",
+    };
+
+    return ARRAY_ELEM_OR_NULL(excp_names, excp) ?: "unknown";
+}
+
 static void x86_cpu_reset_hold(Object *obj, ResetType type)
 {
     CPUState *cs = CPU(obj);
@@ -10946,6 +10975,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, const void *data)
     cc->reset_dump_flags = CPU_DUMP_FPU | CPU_DUMP_CCOP;
 
     cc->class_by_name = x86_cpu_class_by_name;
+    cc->exception_name = x86_exception_name;
     cc->list_cpus = x86_cpu_list;
     cc->parse_features = x86_cpu_parse_featurestr;
     cc->dump_state = x86_cpu_dump_state;
diff --git a/target/i386/tcg/excp_helper.c b/target/i386/tcg/excp_helper.c
index d6410d6fc11..3a38366d866 100644
--- a/target/i386/tcg/excp_helper.c
+++ b/target/i386/tcg/excp_helper.c
@@ -56,8 +56,9 @@ static int check_exception(CPUX86State *env, int intno, int *error_code,
     int second_contributory = intno == 0 ||
                                (intno >= 10 && intno <= 13);
 
-    qemu_log_mask(CPU_LOG_INT, "check_exception old: 0x%x new 0x%x\n",
-                env->old_exception, intno);
+    qemu_log_mask(CPU_LOG_INT, "check_exception old: 0x%x (%s) new 0x%x (%s)\n",
+                env->old_exception, x86_exception_name(env->old_exception),
+                intno, x86_exception_name(intno));
 
 #if !defined(CONFIG_USER_ONLY)
     if (env->old_exception == EXCP08_DBLE) {
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index c89d97e022b..006a2ee9cc3 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -1208,9 +1208,11 @@ void do_interrupt_all(X86CPU *cpu, int intno, int is_int,
         if ((env->cr[0] & CR0_PE_MASK)) {
             static int count;
 
-            qemu_log("%6d: v=%02x e=%04x i=%d cpl=%d IP=%04x:" TARGET_FMT_lx
+            qemu_log("%6d: v=%02x (%s) e=%04x i=%d"
+                     " cpl=%d IP=%04x:" TARGET_FMT_lx
                      " pc=" TARGET_FMT_lx " SP=%04x:" TARGET_FMT_lx,
-                     count, intno, error_code, is_int,
+                     count, intno, x86_exception_name(intno),
+                     error_code, is_int,
                      env->hflags & HF_CPL_MASK,
                      env->segs[R_CS].selector, env->eip,
                      (int)env->segs[R_CS].base + env->eip,
-- 
2.55.0



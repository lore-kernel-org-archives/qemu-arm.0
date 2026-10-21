Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2F2606A903
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VYJthidc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LqZTRURb
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMqW-0008NZ-ET; Tue, 20 Oct 2026 23:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMpn-00065b-8d
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:17:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMpl-00035G-EV
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:17:46 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2FH4u3988940
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 f+unoWEpyvuNLBR69b+ztcLrqtjbmc4XhPLbiXQofKQ=; b=VYJthidcj55P1Nvt
 49DJMSwTJWp4BzlRmHsw5B/raEhyRjIQtSvEAby/RSWMNABvtf9viZ8CfU0tnR6+
 mjuM8UryWJ1K4zRFCz+WGzTti9XeBx9zSw9e8Xd5XIPatngx2SvgDxSDyVLgEGTC
 Rnjj2RiOVh7ydKGaLtDjqJ7BjYzybQ/wZGvHqmlx0kUlWpOnj2OQha4+O830giia
 PsZApRndr8sqSeTX0VOsQ866hnbMLvaFrLnH58UOQDfDtT1EMLHWUX20egaqdkgQ
 1BQ/LWenqoM1p9p8BYBDDk9cj8fsGcJVCOPcZCMcBinnBhUyxXdnDxXaZ5urV/Bv
 ns9rYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajhrge-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:17:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f2373e9b4so34519085a.1
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552653; x=1793157453; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=f+unoWEpyvuNLBR69b+ztcLrqtjbmc4XhPLbiXQofKQ=;
 b=LqZTRURbSkOjEsRAg9qiWBBGbsgHW62NYEMrizAr9re4vn2KRnC6/ezD/+UTlUt7zO
 6N1lQyKsVjdROpVElMFSxOI4acoc78R0YMeJKP7v81YgOpeCPDVJIUt9pInXyLVXI73q
 v2hvRlNrRE5AI4CsdZ47Izhz54TQxr1LDHMUYrWvrPJ8I7YNRCL3uDQqjXOVEhg7+e34
 6JDkVdimXb9DO9XFGhLMGyM3dwfdSr5mG20Sdf4xWDi8SZGRyEJ2PtOs3MZnNdsa1qaQ
 tmuV/hpFIlxzlTirS7oJFkS8tZ3bP3v9Slw5B2Z7gACZ8ojHvfZBB/b0GdHGu31ubqvR
 B3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552653; x=1793157453;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=f+unoWEpyvuNLBR69b+ztcLrqtjbmc4XhPLbiXQofKQ=;
 b=mQmR24p4rzDgSzknLu1HQ8lwsBaQ6U2JPTBryrsJ34yWqOM2MIbaWoeEgSt2YPhbdk
 5rhkAEPKGCcyaFbqvY9rkLEtw05RhqB2ymmVXEF/e7pWHW43VvChGyMsBYH/u/+++9vQ
 wni+7xg7cf992ttAasHn8tCi5bVo+I86O+GDrBJUIlXpaVceDMmUlnkWgOfcDFOMD8+6
 W3eP5ImIZi5V16L6XCPzt4sNdbulTwgkDuapz1an5REGSXZQXev9GU7dh/Uhpw1vXsc2
 4zEupMEiilLwcjor0h2QNOcrkJPUxlUNuv/8Gz4JvcdXn1WNl+faurUhuB7jXyRgFfIg
 ZwFQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwQYF4o4ZHR52D8M60zx8Xe4jzie65aOC8nK/rqp3iBsesdCmK3/8fYAVhprLfCqsiF+TwCNewo8A==@nongnu.org
X-Gm-Message-State: AFq9FYKaegNyagkZ17N/yiKYSQcsAAvtIqv4s+TArWTOcDdZpi1f9Jjg
 ixdWfXVkV41X5asR4blrMxtsRw3XrhfnSwgACRb/AmncliLgqERQmBn0J5WSVTZEZpGa5ESMbXk
 pUNuAcJptHeaAqbE3M3xngCwuJrX3tHy2EhauZOq4arqunX2ICoWbR0t7A5tUZU3UEQ==
X-Gm-Gg: AYBFou3T70IpRT8gsWisshpeYWJUlQUYzBNE32LsWWft37RpEGU/goErhuIPj6SVUcj
 Xb+ivkNL5/+EcpJm+0tqcgM4svnwYKTwAYrF4jOqyMZOGQeEe+65q1i0XRIAGaI53qXnASXxrs3
 hKiGfZOJI2Ufy5FBQ8v45PMC1CyUOCl3rJzNLuVsJ6vYUlET5hTfrBpa5Bu6hLWgkf+CKowELg0
 9pbKPrTOjOX5ywChZEV7H2ymvz/rw69MdJRnCe2KK0p2uwSLVbfb9nPHh93CbU6rb3rhymQaUbo
 jEeKCC/eRa8USU4wjfE9xTzWPsPHd9Hwl2jt+OxfUZbebTZsKlVH8gyi5/Q1YpIGAnakQmgUe0d
 0btbrIpDxXRqIz4DlUhaSVN5tRxpqpXIxtGtLG6vh
X-Received: by 2002:a05:620a:4547:b0:93e:c12c:fbd0 with SMTP id
 af79cd13be357-93f57fb9e65mr198326385a.76.1792552653548; 
 Tue, 20 Oct 2026 20:17:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4547:b0:93e:c12c:fbd0 with SMTP id
 af79cd13be357-93f57fb9e65mr198324985a.76.1792552653094; 
 Tue, 20 Oct 2026 20:17:33 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e2581f0d4sm2394749f8f.13.2026.10.20.20.17.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:17:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 26/33] target/s390x: Implement and register
 CPUClass::exception_name()
Date: Wed, 21 Oct 2026 05:13:59 +0200
Message-ID: <20261021031407.24862-27-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXzQCGqnAIE0HV
 ZGUe5cI6JNVuWyggyf0DTUY4yNwBrNn2UXsJXVFLP5okQuzcsNXeGTMFjbYU+cbwYXnsMIYPSsR
 bGUzTjpoVFBsrenyWJYQW+T5W8Pkm6HphbCa2HtTkF19gAvoNdjrIJM/PgAtu8tdoUIttJZdHQZ
 k7MtaTwUAiM2P0E4FtFtHCV7/rsYC4+QIMV5tdihw1OAYT3YPA8+99PZUWfT/WI0c9AQ5IikNPr
 rHYt+xN4sxC1N5opmB8yqEkPyn66sjAA+snxNtba9p/PCJSLM4NaxXeqxDDFX75f7otZ/MyIlpd
 jpuhTLiNDQZkjWQUCpleOepkPq9wg9IIOIE1liVkDSCHddSDPVmNawcU0g3XPGjFc/WqMQGnSNs
 DnbLR/vWj8OvK1L2jc6ZGil1D7Ba+byCGsTt9vaUPpfjS3gY0t0kAPRJ5WPTnP6WhwX0PM5V4uN
 18J0Z1mrI3wogQNH8Kg==
X-Proofpoint-GUID: 1QJ1mUznmtHY2WrhZxjdnm_RskS2yfZC
X-Proofpoint-ORIG-GUID: 1QJ1mUznmtHY2WrhZxjdnm_RskS2yfZC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX/lNNVN6odSko
 0O0B4pHkNK9/sU/ptm27yIsfcaWv77roCrnh+fbO0i7Vmieci5PjT1T2aopxztmSZ8dWk8h5x7W
 3DgDTo2vJu0aKaHi11Oj5HKLpq9L0no=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad82ece cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=lKt1HvW_8kBegW_OfZ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement s390x_exception_name() and register it as the
CPUClass::exception_name() handler, so the common exception
logging can resolve s390x exception codes to names.

Use the new helper in s390_cpu_do_interrupt() and helper_exception().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/s390x/cpu.h             |  2 ++
 target/s390x/cpu.c             |  1 +
 target/s390x/interrupt.c       | 15 +++++++++++++++
 target/s390x/tcg/excp_helper.c |  6 ++++--
 target/s390x/tcg/misc_helper.c |  3 ++-
 5 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index ef73b15218e..37b6e541312 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -437,6 +437,8 @@ QEMU_BUILD_BUG_ON(FLAG_MASK_PER_IFETCH_NULLIFY !=
 #define EXCP_IO  7 /* I/O interrupt */
 #define EXCP_MCHK 8 /* machine check */
 
+const char *s390x_exception_name(int excp);
+
 #define INTERRUPT_EXT_CPU_TIMER          (1 << 3)
 #define INTERRUPT_EXT_CLOCK_COMPARATOR   (1 << 4)
 #define INTERRUPT_EXTERNAL_CALL          (1 << 5)
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 85afc5dec9a..275cc6cd53b 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -408,6 +408,7 @@ static void s390_cpu_class_init(ObjectClass *oc, const void *data)
                                        &scc->parent_phases);
 
     cc->class_by_name = s390_cpu_class_by_name;
+    cc->exception_name = s390x_exception_name;
     cc->list_cpus = s390_cpu_list;
     cc->dump_state = s390_cpu_dump_state;
     cc->query_cpu_fast = s390_query_cpu_fast;
diff --git a/target/s390x/interrupt.c b/target/s390x/interrupt.c
index d7e3fd45e4b..e00ec93cbdb 100644
--- a/target/s390x/interrupt.c
+++ b/target/s390x/interrupt.c
@@ -19,6 +19,21 @@
 #include "hw/s390x/s390_flic.h"
 #endif
 
+const char *s390x_exception_name(int excp)
+{
+    static const char * const excp_names[] = {
+        [EXCP_EXT]      = "external interrupt",
+        [EXCP_SVC]      = "supervisor call",
+        [EXCP_PGM]      = "program interruption",
+        [EXCP_RESTART]  = "restart interrupt",
+        [EXCP_STOP]     = "stop interrupt",
+        [EXCP_IO]       = "I/O interrupt",
+        [EXCP_MCHK]     = "machine check",
+    };
+
+    return ARRAY_ELEM_OR_NULL(excp_names, excp) ?: "unknown";
+}
+
 /* Ensure to exit the TB after this call! */
 void trigger_pgm_exception(CPUS390XState *env, uint32_t code)
 {
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index d952bb20cf1..83fe65e1f8c 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -508,8 +508,10 @@ void s390_cpu_do_interrupt(CPUState *cs)
     bool stopped = false;
     uint64_t last_pc = cpu->env.psw.addr;
 
-    qemu_log_mask(CPU_LOG_INT, "%s: %d at psw=%" PRIx64 ":%" PRIx64 "\n",
-                  __func__, cs->exception_index, env->psw.mask, env->psw.addr);
+    qemu_log_mask(CPU_LOG_INT, "%s: %d (%s) at psw=%" PRIx64 ":%" PRIx64 "\n",
+                  __func__, cs->exception_index,
+                  s390x_exception_name(cs->exception_index),
+                  env->psw.mask, env->psw.addr);
 
 try_deliver:
     /* handle machine checks */
diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index f1c8563af00..a01c5d894e7 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -61,7 +61,8 @@ void HELPER(exception)(CPUS390XState *env, uint32_t excp)
 {
     CPUState *cs = env_cpu(env);
 
-    HELPER_LOG("%s: exception %d\n", __func__, excp);
+    HELPER_LOG("%s: exception %d (%s)\n", __func__, excp,
+               s390x_exception_name(excp));
     cs->exception_index = excp;
     cpu_loop_exit(cs);
 }
-- 
2.55.0



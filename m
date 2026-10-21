Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9433C606E847
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vqa8IO10;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QzvybeWH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMq2-0006tf-Db; Tue, 20 Oct 2026 23:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMoq-0004dW-QH
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:16:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMon-0002vr-4b
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:16:47 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2EtDR299870
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I3wILwR/tNUL0fg3Ffio7HD+ewVrrBD4+JMHrwT71Xw=; b=Vqa8IO10MZLRu0lN
 V76WsPjMU/+nKAaFKZB23mDFrjNvFsp6qXiKeaJEBps501gJ+PAgbRQbMe6Fljgk
 tEKKEH9G9HI3cPMyL/cOo22nISJ2mjXzmF3VEPAfChXUO6QlE5Vrtz7O18SPzhT9
 jmCYCK8HRAfqVZZiO3M6r+Lz9HWovTJclUuQhFLVr9UwJESCWX3HhZR4pI2wBHz8
 uegyyS4XSzEX6DaMWzyhDPydroleXIlhdhMoLQfa1xRNpBDGhtew48RZp2D+48E+
 4xECIvfl3l+6Ri1++i86yfW14eungKEIkJ+UF/VyGUgPaSeHhglp7zjxsCiee5ha
 ZCDG0w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4spx7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:16:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91c046843f1so10903516d6.1
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552592; x=1793157392; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=I3wILwR/tNUL0fg3Ffio7HD+ewVrrBD4+JMHrwT71Xw=;
 b=QzvybeWH5cjAAP3OvDOHAsKJ3WRJ1brvYfKzA1JosHCkatplaCd65D/E91TslUAO1M
 a4BkaGqCErQ+Cbdz9zy/YQ2N5Q+8GFIt4ZOBxRkfEHl8mcZ2lfXYrayEe7gFIHXvSD7N
 4MpnY1Hw7bc91tvSDc6BT/xNVjEYZQunQJ1QbwO+tdSugM59Ugqhi5/N7B+cvEag1CdO
 tGXIHsdhjDzt51d24FObVBSTROWwqRnZE9octT1HjGPNQbktwWjp03v3eHc5eLAhemm5
 8k4637miGlA2HsD9if7BlxRMaaZDChiDZb+5hOGvSaolRVebk+G+IgCKuX/NxcDbYpcm
 rByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552592; x=1793157392;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=I3wILwR/tNUL0fg3Ffio7HD+ewVrrBD4+JMHrwT71Xw=;
 b=Fvc5EdGu6vPKoKfdTqjr7Rg9vT+cK08mz1olGEucwwgu9FGSa5i8CTCequErnElu7g
 MdWhDEy28c9VNgRM2/mrU0IPl+n+4RzIgrDt1v+fCKBKWVTY/qWTQiZi4ervfPAct0nj
 Y1qZFSfT/XktOwbCfIqLYtLypoDCSxGJo0ovaOIMtANqH+4RtcDIzJkSkPBNE0TNYsTC
 BWO64P27W+TRScrXPkfDS16Xbf5Q7GJlM3TM+3DobUTUkyMnVjdEE6o7M+wRt/fEu4dJ
 1aQG4pCtHmTS4ifrD3NmycdaiPAqV3tkrQq3jv2OkkT2YeCVYWM/ErmdIsnBimb6XdYR
 kxHw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzBXABNUbKhDoFFsjpWzo+JxcbTBRa8EW/fxc/oqICGSTFmrr3fRf7k9JNHJS7B3b66lHORkzaslA==@nongnu.org
X-Gm-Message-State: AFq9FYK9XT3nzLHFHL1qH+NMijPQf8AT9e8YicE7hTEeNc/X7TjSC/YC
 8URPJjmeRqQUG5u1kjJKfa8RUdm9vKK2iIIUVPR57pbIWpIML1uQKEYp4cw7dpQiPofARYHT3wi
 s3++eD//W0jdO3jQnL8xUInYiSgqjUpCxQ7eB0AQIFuwQmd7VMAYTxyA=
X-Gm-Gg: AYBFou11aL5AbuqweRZSjfM2qVrXE9IDDLB1OejM/k1Y1vYmunVSOZcYlEF2Cr0vvz4
 biW3eLc8acWvryzRihMhYNmiTJDK3AJeljUIVVMzVtKPKYBsntlrtHkO0/mJNVM9fLcMRRoTWiq
 i9+KMjrMwNFyin8+0qi/A124qSwm+coSEqG5Ke737lYwqRZf2BZ/Z1gdk3LO7gbWR4cnv81W8pC
 i9uiYcRn48NqTF1t9t6zAQTzCP9AuMyK/hhxJ++n7sOaFn0x3MtiiJ1A9yIQwd9uo1tXkYrZDxI
 HpwfoaYtVIrZ9d+Tq9lQuex/YvLwK6wzKsIocXYQePcEES0O6tzLgKiiKpYcm1PYBZgbRjhFls9
 xqzGk1ToRCbxWojpOPi0tRdEC4CfRiYRkudo0kei5
X-Received: by 2002:a05:620a:178b:b0:93f:23ef:d6ad with SMTP id
 af79cd13be357-93f57d6fdbamr226924685a.0.1792552591745; 
 Tue, 20 Oct 2026 20:16:31 -0700 (PDT)
X-Received: by 2002:a05:620a:178b:b0:93f:23ef:d6ad with SMTP id
 af79cd13be357-93f57d6fdbamr226922785a.0.1792552591317; 
 Tue, 20 Oct 2026 20:16:31 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e254ef1bfsm2580046f8f.6.2026.10.20.20.16.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:16:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 18/33] target/or1k: Register CPUClass::exception_name()
 handler
Date: Wed, 21 Oct 2026 05:13:51 +0200
Message-ID: <20261021031407.24862-19-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vVPnpKdT6KwYLKc4_pjK5pVF8XMsvQ1T
X-Proofpoint-GUID: vVPnpKdT6KwYLKc4_pjK5pVF8XMsvQ1T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXzxtJnruBxVPr
 ESm9xeRUV8BMi8+UchgmmP4FWzfr8USwIUEMkKRpF4+QZ/ZX1imA5jAstd+MzwevXiJVFOTkS/c
 gf6T+EWpJ8d5XaScd8xWDN33wzvOocM=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad82e90 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=slxP8ohElPSaHwuvTCoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX2TejCEkuMyYJ
 9puaJbIvYVS4SbPqrsG5DMYgpC+mG3mw9Udvm6n9sXHDZhMUpL+OKfmt9X0hM5tsybG1ce7PvOB
 8qSdpCYGCcA7m2WbmVW9Kkn7Jwu+cBZkRijqRSnJ4wZwqOEHYJxswHA4O4MuCaO4aKjSmptStfG
 cSGruEVp2OtAbv12cb/JMSGRGQ3krQcJpHbc8JXtLtB2eP8G6CR5gP3CQyMFkg1dpuKS/N7nWNn
 +gKP+F/D7S3kCT1rQM7Mkm/WHOXg7bwgIPJSxUS0TnWqzbFz9JRf41m4k5Ai/lT2xzjvqligGfo
 8tSNluks6ldv8poJqmf1U4KibcE388odVswiHAzQciJJAJN0/PGvHp843N4kodUjZpHochgk3NM
 xemMpezZdg0iVd0+/6j9FqVkB0FpdD5bCKkWxzfUnyyQMzJBrGBnxCj2zUnWYkSGavHVd/liYwa
 pLn67i4ANSe6qyNsjRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
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

Factor openrisc_excp_name() out of openrisc_cpu_do_interrupt()
and register it as the CPUClass::exception_name() handler, so
the common exception logging can resolve OpenRISC exception
codes to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/or1k/cpu.h       |  2 ++
 target/or1k/cpu.c       |  1 +
 target/or1k/exception.c | 21 +++++++++++++++++++++
 target/or1k/interrupt.c | 19 +------------------
 4 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/target/or1k/cpu.h b/target/or1k/cpu.h
index fc4387ce7ae..96ed1779fae 100644
--- a/target/or1k/cpu.h
+++ b/target/or1k/cpu.h
@@ -155,6 +155,8 @@ enum {
     EXCP_NR,
 };
 
+const char *openrisc_excp_name(int excp);
+
 /* Supervisor register */
 enum {
     SR_SM = (1 << 0),
diff --git a/target/or1k/cpu.c b/target/or1k/cpu.c
index 66c00c0930c..e15f6bb5e71 100644
--- a/target/or1k/cpu.c
+++ b/target/or1k/cpu.c
@@ -285,6 +285,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, const void *data)
                                        &occ->parent_phases);
 
     cc->class_by_name = openrisc_cpu_class_by_name;
+    cc->exception_name = openrisc_excp_name;
     cc->dump_state = openrisc_cpu_dump_state;
     cc->set_pc = openrisc_cpu_set_pc;
     cc->get_pc = openrisc_cpu_get_pc;
diff --git a/target/or1k/exception.c b/target/or1k/exception.c
index 785181ef2ed..ca5e8a3134b 100644
--- a/target/or1k/exception.c
+++ b/target/or1k/exception.c
@@ -22,6 +22,27 @@
 #include "cpu.h"
 #include "exception.h"
 
+const char *openrisc_excp_name(int excp)
+{
+    static const char * const excp_name[EXCP_NR] = {
+        [EXCP_RESET]    = "RESET",
+        [EXCP_BUSERR]   = "BUSERR (bus error)",
+        [EXCP_DPF]      = "DFP (data protection fault)",
+        [EXCP_IPF]      = "IPF (code protection fault)",
+        [EXCP_TICK]     = "TICK (timer interrupt)",
+        [EXCP_ALIGN]    = "ALIGN",
+        [EXCP_ILLEGAL]  = "ILLEGAL",
+        [EXCP_INT]      = "INT (device interrupt)",
+        [EXCP_DTLBMISS] = "DTLBMISS (data tlb miss)",
+        [EXCP_ITLBMISS] = "ITLBMISS (code tlb miss)",
+        [EXCP_RANGE]    = "RANGE",
+        [EXCP_SYSCALL]  = "SYSCALL",
+        [EXCP_FPE]      = "FPE",
+        [EXCP_TRAP]     = "TRAP",
+    };
+    return ARRAY_ELEM_OR_NULL(excp_name, excp) ?: "unknown";
+}
+
 G_NORETURN void or1k_raise_exception(OpenRISCCPU *cpu, uint32_t excp)
 {
     CPUState *cs = CPU(cpu);
diff --git a/target/or1k/interrupt.c b/target/or1k/interrupt.c
index 6e89157639a..399c98e3881 100644
--- a/target/or1k/interrupt.c
+++ b/target/or1k/interrupt.c
@@ -66,26 +66,9 @@ void openrisc_cpu_do_interrupt(CPUState *cs)
     }
 
     if (exception > 0 && exception < EXCP_NR) {
-        static const char * const int_name[EXCP_NR] = {
-            [EXCP_RESET]    = "RESET",
-            [EXCP_BUSERR]   = "BUSERR (bus error)",
-            [EXCP_DPF]      = "DFP (data protection fault)",
-            [EXCP_IPF]      = "IPF (code protection fault)",
-            [EXCP_TICK]     = "TICK (timer interrupt)",
-            [EXCP_ALIGN]    = "ALIGN",
-            [EXCP_ILLEGAL]  = "ILLEGAL",
-            [EXCP_INT]      = "INT (device interrupt)",
-            [EXCP_DTLBMISS] = "DTLBMISS (data tlb miss)",
-            [EXCP_ITLBMISS] = "ITLBMISS (code tlb miss)",
-            [EXCP_RANGE]    = "RANGE",
-            [EXCP_SYSCALL]  = "SYSCALL",
-            [EXCP_FPE]      = "FPE",
-            [EXCP_TRAP]     = "TRAP",
-        };
-
         qemu_log_mask(CPU_LOG_INT, "CPU: %d INT: %s\n",
                       cs->cpu_index,
-                      int_name[exception]);
+                      openrisc_excp_name(exception));
 
         hwaddr vect_pc = exception << 8;
         if (env->cpucfgr & CPUCFGR_EVBARP) {
-- 
2.55.0



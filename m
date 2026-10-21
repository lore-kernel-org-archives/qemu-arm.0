Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FEE606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dLqzpZYF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OvImmWoz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMpx-0006hG-9J; Tue, 20 Oct 2026 23:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMog-0004Y6-Pp
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:16:46 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMoe-0002uA-K5
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:16:38 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2F3kD3256697
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3uc/a/K1r0yU+DutArZzUhtCa5KlYLTfF7Yb5mQUvjc=; b=dLqzpZYFkFx7/N4s
 aOuds2Oh2Apnv9MAAQw+bZ/7uQuS/y/zxTkp06Mj+p5e5i7Fksx0De9+w7u0WP+i
 1ISR1LpmxntYB6iLpB6589WlF7pd4gfrFBoTtl1m3zmfPpqJtkMA4slesyBQNn2b
 838AyxXmY6Ej1w4QMUtXKE+8p8eUohByWxoMyTs7fhgsNwcwLZDa62NqwMfo1y2X
 b1Mi62llJtfxuiKqZVoz/uhLsOJa9opcJe6sMP8E/xEOaOALxeVks3S2Mq1RxZn6
 s717dIGjBZwhH1+hoFvjB/C+FWRmtNRq08At3WX+K+WymlArpkgghJVPFN9zJtrb
 nIUvJQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v1rs7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:16:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f26dd2165so96752085a.3
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552584; x=1793157384; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3uc/a/K1r0yU+DutArZzUhtCa5KlYLTfF7Yb5mQUvjc=;
 b=OvImmWozky9WE0rKMm2e5YvqWC4gl4F5rdNhqTXDgQBtLKod1r/Z7PFutzWg6LcICt
 67gZo4MVIuKrxzGsEHYUOrU1vFb1QyQQncFRR6SKXk7mBfAi1kJpTy9B70DmoWiT4mKc
 fsf+Xa24BoaPYMo9B4LfHSZxTlwuZbEmYSiY4KXTxgQyrsFbZ14JT9e7c0Q9doZeW4Bg
 cyHrI++NheG7BbdqurGTkuhwebal+37HK/h0NkFKC+EOXesSfMyCFYt5ZQENBbFgoWFv
 fa6mynJikTmShxeB/KFvwUA7r3elv7iErOKlavgnk8EzdBL7+nq31sPXlO2fQFe/Kkzz
 8kRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552584; x=1793157384;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3uc/a/K1r0yU+DutArZzUhtCa5KlYLTfF7Yb5mQUvjc=;
 b=vAxJSTCcv93TZsdx1dCVUeMVY6JqAhMzhUVa9yFztiuZAXgyliLo8Jgc8Fzu/1wdY4
 E2H+k2YB2rNSJY/+1Mo7gYg5SjnZzj9DkkhQVSq55vdX9RgM/I4vfb1YVvI/2I3ZcvpX
 qQAqnl7Y1rwh+KUYqB42dC52i8qBIXBMSBM5kXaSDHvOpFVyk8xBIpL2f3FFCuvjJhoz
 SKfuJ6MkLqUG3lOJWBm9bsS3hEyOLSY07ohety2z56t1+lCMe2ahYMQhf9Kpiit/1yc9
 KyKR2j75BnoufsQgCNNze6tvA/a3+SY5Qkx57jn5Pz9db9nCH26ISHCt15lDsyOF9LNm
 nzew==
X-Forwarded-Encrypted: i=1;
 AKwUvBysDTjM81v5VjTtTYMko6bZCVQpIZm/1wAzJTrL/z/xRswTGJEhSAxipNa3fXbvUCJ3k/VSQfVwbw==@nongnu.org
X-Gm-Message-State: AFq9FYJosRiZ1ofm+90hQSXwRiKShSsUgfuJACaRUxJTGT6U9QFslc0d
 6IvUUDGo1zOheSZvUqFS7cDXgNS2gb9k9J73cgEl8Y84g7afcETkAxYojGre6LXv34MpIfY4Fnq
 kz5U71gHPMsK4DAVjJIMte+GmHlYD7w4+4J1JvTs8dJrthtLcmVVv7+I=
X-Gm-Gg: AYBFou1qIlKwcKfwolfQi5YV+CELyhZULfgvbq22bELNhP7Aiqnt4xE9FVprjiRgZq4
 zenzzLlVa7ogeAlE9E5AmVLe6wBBwUoQrwACNiC2m2IEp7y3FKrmdwkMIUSj+6Ej072QHqlYKtV
 W6+gCIltIZFhPuohDkeXQ/GbNmYUUOSCrf1bQkOgxFjsTqfdVjQJJe2EnNc/k3lisRqzP58+nxW
 Jf58xRK0nAw2PDMvLfYc4m4RBm6Q4353qW5umfCdWOEfe8BCXA5Bk4coxUJ3H3GH02urbCM46km
 1si9bIZVYqa6LZ+Qbz1fHm6w+ZY9rkVp2pSV4WCJWUTCoIORJwpXIh+4eb3VyXbhF7lV6YMYj2g
 TqJtlcK+ORiOKX/lx74Etd++sKHWg5Kiddl98fBCw
X-Received: by 2002:a05:620a:6087:b0:93f:1af1:7951 with SMTP id
 af79cd13be357-93f57f8ad29mr216490085a.66.1792552583585; 
 Tue, 20 Oct 2026 20:16:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:93f:1af1:7951 with SMTP id
 af79cd13be357-93f57f8ad29mr216487085a.66.1792552583114; 
 Tue, 20 Oct 2026 20:16:23 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f2c242dcsm111146565e9.0.2026.10.20.20.16.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:16:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 17/33] target/mips: Register CPUClass::exception_name()
 handler
Date: Wed, 21 Oct 2026 05:13:50 +0200
Message-ID: <20261021031407.24862-18-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX44LV2XcOX7Wx
 chpQTMhAymP7pPc+fyyib81joSBpIqBFk7KbFOD795598Xkl32IEXSI73rBeIzP0Vtl1bNle2cc
 57f8CWDhoMxfNqfnxV9gzIeDXW8uwM4=
X-Proofpoint-ORIG-GUID: 3UCEL5bRmVfYVqIf2-Oa-GGtNOYuv20V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX4d9EO4LAivei
 LCKAIVSS1aNW8alAGLNU7xb76zRd9ePC98PDwCLI4QQ/pH1O6mB81LXJgBT/HbwZcZaXEdxYJg3
 9OrQKShifYtYLtT6w5ZFetv+K+m72181BwrYhzGahFHdY8FJfV7w8IkEgNIg9Qz6doN8bvQ80IH
 NyxLKehCinGRTxxoWsnRHpT+uMWHe06lM8u+RcbCKF03Ibn/Tzi2V30KC1glhj/5546WpMiYKTK
 2QtZbUn0hz9J8EGa/VHkVeTxHOGDLwNv/PgUKz0ozCpZ+6PaIlFKFEM1wGWNesegkk5+7vhV070
 L42a1ZS9bmx3tT4DlDrsFwcTsGbIsVnh45vVYhqeRql0pMn7lpn6x9IPvM7pxV3eRizqagxi0o1
 Cs0plbAyIfcbD6UrgNG1J6AwkLVI8VGlNTCucmzFMvY9SMM67U/mPcJWYnv+qEY8bsmto8Rt7PT
 ZP+oY8u6y1uSAd14dgQ==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad82e88 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LEehXKFoqEHZ457G_xcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 3UCEL5bRmVfYVqIf2-Oa-GGtNOYuv20V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
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

Register mips_exception_name() as the CPUClass::exception_name()
handler, so the common exception logging can resolve MIPS exception
codes to names. Return "unknown" for missing array entries.
Remove the qemu_log_mask() call in do_raise_exception_err()
because it would duplicate the one in log_raise_exception().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/mips/cpu.h              |  2 ++
 target/mips/tcg/tcg-internal.h |  2 --
 target/mips/cpu.c              |  1 +
 target/mips/tcg/exception.c    | 11 ++---------
 4 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 5d8b78a70b8..b080c5de4de 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1349,6 +1349,8 @@ enum {
     EXCP_SEMIHOST,
 };
 
+const char *mips_exception_name(int excp);
+
 /*
  * This is an internally generated WAKE request line.
  * It is driven by the CPU itself. Raised when the MT
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 950e6afc3f2..9f230e757d6 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -27,8 +27,6 @@ void mips_restore_state_to_opc(CPUState *cs,
                                const TranslationBlock *tb,
                                const uint64_t *data);
 
-const char *mips_exception_name(int32_t exception);
-
 G_NORETURN void do_raise_exception_err(CPUMIPSState *env, uint32_t exception,
                                        int error_code, uintptr_t pc);
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 0fead20d651..528d926d16c 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -742,6 +742,7 @@ static void mips_cpu_class_init(ObjectClass *c, const void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = mips_cpu_class_by_name;
+    cc->exception_name = mips_exception_name;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
     cc->get_pc = mips_cpu_get_pc;
diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 2f02f9be877..d2cd118518e 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "cpu.h"
 #include "internal.h"
 #include "exec/helper-proto.h"
@@ -129,12 +128,9 @@ static const char * const excp_names[] = {
     [EXCP_SEMIHOST] = "Semihosting",
 };
 
-const char *mips_exception_name(int32_t exception)
+const char *mips_exception_name(int excp)
 {
-    if (exception < 0 || exception >= ARRAY_SIZE(excp_names)) {
-        return "unknown";
-    }
-    return excp_names[exception];
+    return ARRAY_ELEM_OR_NULL(excp_names, excp) ?: "unknown";
 }
 
 void do_raise_exception_err(CPUMIPSState *env, uint32_t exception,
@@ -142,9 +138,6 @@ void do_raise_exception_err(CPUMIPSState *env, uint32_t exception,
 {
     CPUState *cs = env_cpu(env);
 
-    qemu_log_mask(CPU_LOG_INT, "%s: %d (%s) %d\n",
-                  __func__, exception, mips_exception_name(exception),
-                  error_code);
     cs->exception_index = exception;
     env->error_code = error_code;
 
-- 
2.55.0



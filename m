Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C78C61DD6
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 15:23:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1mmD-0002WE-4Z; Wed, 02 Sep 2026 11:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mm4-0002Q2-6o
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 11:21:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mm2-0000EJ-Gq
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 11:21:15 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682CRHTj2001805
 for <qemu-arm@nongnu.org>; Wed, 2 Sep 2026 15:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ji5J4HKmPdW/CWTW2SUhTxHcUUTcenx5uhnZFfihhVE=; b=cqX616d/uyTXUNky
 cJut0zr4MaV7+EUooCerieI9I8TrtsBHshbM70H3UK9Dr47Wxv2ZHoBi7AzwTkBn
 gWQPdyCzT8A6nChtMHsKoGuNAqYlBgfiTbifEpGX/+9I3Hg3/9J5ViI7p3/itsIG
 vK0H8wMD4hitaKZa4Q6VtvQf/vnVKyyEP2wFLFBOSbQ5NQSyAMTO6DgAdbqC1KEc
 cgEktR8E3m1/dLAnMZ3QugU3ShnKO8leC48Dlh/oALNRvIfHwjnRmy98hVqW7XFJ
 Zlzg/ddITZiMX+oqiinFgRGCg55fToMQFACscoee84ANMaotLfd3ahkBFdwINSFR
 nfMQFg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy1fcx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 15:21:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9393ac4961fso47430085a.2
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788362473; x=1788967273; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Ji5J4HKmPdW/CWTW2SUhTxHcUUTcenx5uhnZFfihhVE=;
 b=KyopZ55Fb4cGJfufJBbsH+osNZJKqYauriBJAF440QgkjhGHpfj6YXIKZMMQ75DkPx
 6Wydz/LhZfTa5+zLgLhwuiYQ/gEg+qEfRuI6MZm5xMLn3WT2GyhaQwMwG6sBUQ1HP8D0
 7ECN+tg80FTjgQE/Eb9EbxgUieOAjT4EDxiBppl9SmDW3DUegbFTonZahizSTTmOkoBN
 ve9uUEMZYWUq5zuXntI+NQNJD0nfTxe0dGIdqi0bx/aVS88IPBfcySFZj2Lchcu8YYKG
 TPXzRhPFcZ0g1poZro6l92KY8w3V7xqsAMhpzNZ1mUhhF/VY8e0/GV4Kq/JFmVPcLaVV
 T/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788362473; x=1788967273;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ji5J4HKmPdW/CWTW2SUhTxHcUUTcenx5uhnZFfihhVE=;
 b=OvwRhw7qhFcFQqe5ZiU/by+kQtlxiJl9wek+J8w2cO5C9ZdBhacCt2R21FxFqAVtcD
 UCy50gi9hQ4tgLlmgLMtjvVLlucRrr1NAnl49oQALqGTFBLjU87xBva6IWob1+1z2Scr
 XF6NE4kB/KV34r8EgP8CjG0FCX4JdMLU5+6KNfCBa+KGzmjH1iCvFqfOsSNq5NPIV/yb
 niC8jUlA4LCSYhG7ap8ciqRF6CAR75XvwZs/4hC7grUXxZKOZDQf3/2BY+ry7g8xoJ1G
 vyGKtbP6e/CRwOkM4jXp/ibwwxxKbpF3YqcceMUHOlFy+fIa6ZJLCd5JfWVSYZytWWxk
 Hytg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpoYYjTvp95pPCelhcE60KkcRoyZrEFH8xQ57lxZV/YOETibLyR3OdEH6ot6UgfyAX3E5agjD3hlg==@nongnu.org
X-Gm-Message-State: AFuF++mQj8hsoJdSrS/nG9yUV+00XTiHtaCqadz2YahBI1G1McDod4Qe
 1i4DhNV+MoFz1YQjjEfNONmEeQ5eX4Dr2AFQ0bbs7U0U+m7YzNSyJuG/55vv0Xv/DkUfQwHGfOo
 xjnrzJvQ+I/3Ah6cARgA5uf/O4rABp0+S8kM6kNLfTE4oYNfF5IP0XUw=
X-Gm-Gg: AR+sD13wRqMcIbx4u+Rzp0B7pBW+ctARrDIlF16uYJEkKAnzwJLNcl5RUMnY4KdC+8g
 D9tCS7Cx7nrjMNmQLl2VINQewPCF6dACfECnQRNDcswvuSbR1+o/2EPMxXq/tQGtzhT8PbKqM4l
 gJDq4Dj/ISnb8+4hEwxVaRuxI/qEAo8yf+/Tk87qbc3U8pq7gnSpGh6iiH6K/bppi081pmeIDWI
 aokQH9qGREq5oKhb2aJHjuVGh3Zhw4UydGxCMf507GANxoTd1eKGkydiUobOTDIJ05eneGwSQXW
 jLPWOWQivyp40hgqPNI458X/GPI4wGmXdeQGjGY8IeOAiCeiQXn9omb/Koato6hBsTGsR5uuc+B
 n+QUfd7jqaneVPMIc/LOCCyHnZFrRFIk/YpCq1sNV
X-Received: by 2002:a05:620a:371c:b0:937:6772:d8d with SMTP id
 af79cd13be357-93960f1811emr695438685a.20.1788362472428; 
 Wed, 02 Sep 2026 08:21:12 -0700 (PDT)
X-Received: by 2002:a05:620a:371c:b0:937:6772:d8d with SMTP id
 af79cd13be357-93960f1811emr695415885a.20.1788362471438; 
 Wed, 02 Sep 2026 08:21:11 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce58da3acsm127559305e9.0.2026.09.02.08.21.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Sep 2026 08:21:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 03/11] target/i386: Rename fake_do_interrupt to
 fake_user_exception
Date: Wed,  2 Sep 2026 17:20:34 +0200
Message-ID: <20260902152044.31291-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902152044.31291-1-philmd@oss.qualcomm.com>
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a983ee9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QvbPrhRjooIPkqPMRvUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: etiCsFArg_bnFmTsWeZGJPaUDClxGGRQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfX4pAJAAUMqEv/
 YoJE0UagDYeLS6B0Rhv2WFBcWM8/A0Qji13vw9PwKGTPC8QBu115MlQriv8kNlpQAKnE/9Goh4x
 WtHiyl25o71Zf8+Pf27RHmjEOv8yb4A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfX/YQt8LaMI8hK
 zKk4Yi0Oq57WK/jMao3+1yNvFYhgewrGeBYttmJZzuRUvtbpKoROMdwDlx0Wwr21DZQBobhDGsL
 aLDmPuEOmwavAhTvEafrtCVb5sW4BcekNUiOxWMQypOOL0g/Ci0Y4UffVNZrarnhzyxbCq6YSDw
 ZUqvcjp3Xv6WzSvmW86LFXRYqPX53JHibzYKCQOhv6g3VyzjPtGJVuzIl49UG5t5ACZkl7BVW7U
 lgWsQjYfoXUKgCTy4YFDude1uT6AOBsxq4rcLsIp9qUCQc3CqkEzlBaIRe3PVYFsOU7+7uFjUZ8
 THZgdcqylUrGPo1WtabVxHdw3mOsUDcZMTxc75dEMr1qPF50QjqiLtKCHizqMv/4GYWVWEYWXTD
 ZL0CoICYqzv3Fdj0/SKPEK7yswrPxGT+oft1FnTX3t55boi0O3sTse8tNloiVYziSqZ/P3Ak/Du
 IV9au5BptXQcgqEiZDg==
X-Proofpoint-ORIG-GUID: etiCsFArg_bnFmTsWeZGJPaUDClxGGRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020135
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The fake_user_exception hook handles exceptions in the outer
exception loop (cpu_handle_exception), not inner loop interrupts
(cpu_handle_interrupt). Rename to clarify the scope and intent.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/accel/tcg/cpu-ops.h       | 4 ++--
 target/i386/tcg/helper-tcg.h      | 4 +++-
 accel/tcg/cpu-exec.c              | 4 ++--
 target/i386/tcg/tcg-cpu.c         | 2 +-
 target/i386/tcg/user/seg_helper.c | 6 +++---
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
index 3ff6e6810e0..ded7cc700df 100644
--- a/include/accel/tcg/cpu-ops.h
+++ b/include/accel/tcg/cpu-ops.h
@@ -106,12 +106,12 @@ struct TCGCPUOps {
 
 #ifdef CONFIG_USER_ONLY
     /**
-     * @fake_user_interrupt: Callback for 'fake exception' handling.
+     * @fake_user_exception: Callback for 'fake exception' handling.
      *
      * Simulate 'fake exception' which will be handled outside the
      * cpu execution loop (hack for x86 user mode).
      */
-    void (*fake_user_interrupt)(CPUState *cpu);
+    void (*fake_user_exception)(CPUState *cpu);
 
     /**
      * record_sigsegv:
diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index f4b2ff740d5..5349ab71be9 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -35,11 +35,13 @@
  * x86_cpu_do_interrupt:
  * @cpu: vCPU the interrupt is to be handled by.
  */
-void x86_cpu_do_interrupt(CPUState *cpu);
 #ifndef CONFIG_USER_ONLY
+void x86_cpu_do_interrupt(CPUState *cpu);
 bool x86_cpu_exec_halt(CPUState *cpu);
 bool x86_need_replay_interrupt(int interrupt_request);
 bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#else
+void x86_cpu_fake_user_exception(CPUState *cs);
 #endif
 
 void breakpoint_handler(CPUState *cs);
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 257211235db..609931a0d6e 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -717,8 +717,8 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
      * handled outside the cpu execution loop.
      */
     const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
-    if (tcg_ops->fake_user_interrupt) {
-        tcg_ops->fake_user_interrupt(cpu);
+    if (tcg_ops->fake_user_exception) {
+        tcg_ops->fake_user_exception(cpu);
     }
     *ret = cpu->exception_index;
     cpu->exception_index = -1;
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 6f5dc06b3b9..7a4d73e7fee 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -173,7 +173,7 @@ const TCGCPUOps x86_tcg_ops = {
     .cpu_exec_enter = x86_cpu_exec_enter,
     .cpu_exec_exit = x86_cpu_exec_exit,
 #ifdef CONFIG_USER_ONLY
-    .fake_user_interrupt = x86_cpu_do_interrupt,
+    .fake_user_exception = x86_cpu_fake_user_exception,
     .record_sigsegv = x86_cpu_record_sigsegv,
     .record_sigbus = x86_cpu_record_sigbus,
 #else
diff --git a/target/i386/tcg/user/seg_helper.c b/target/i386/tcg/user/seg_helper.c
index 3a4a6d5a745..019a781458b 100644
--- a/target/i386/tcg/user/seg_helper.c
+++ b/target/i386/tcg/user/seg_helper.c
@@ -42,7 +42,7 @@ void helper_syscall(CPUX86State *env, int next_eip_addend)
  * instruction. It is only relevant if is_int is TRUE or if intno
  * is EXCP_SYSCALL.
  */
-static void do_interrupt_user(CPUX86State *env, int intno, int is_int,
+static void do_exception_user(CPUX86State *env, int intno, int is_int,
                               int error_code, target_ulong next_eip)
 {
     if (is_int) {
@@ -76,7 +76,7 @@ static void do_interrupt_user(CPUX86State *env, int intno, int is_int,
     }
 }
 
-void x86_cpu_do_interrupt(CPUState *cs)
+void x86_cpu_fake_user_exception(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
@@ -84,7 +84,7 @@ void x86_cpu_do_interrupt(CPUState *cs)
     /* if user mode only, we simulate a fake exception
        which will be handled outside the cpu execution
        loop */
-    do_interrupt_user(env, cs->exception_index,
+    do_exception_user(env, cs->exception_index,
                       env->exception_is_int,
                       env->error_code,
                       env->exception_next_eip);
-- 
2.53.0



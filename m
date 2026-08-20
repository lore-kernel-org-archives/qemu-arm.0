Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C686C5DF88
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 10:49:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx0JU-0008KC-L6; Thu, 20 Aug 2026 06:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0JP-0008G2-D6
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:47:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0JM-0005ij-5Z
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:47:54 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67K8PGiW2465486
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WVunpjLVA0I0Wfv3sDB+jNp2S9PTkMt6jmB8Jx0E2VM=; b=FnE1RaEyf010Ymju
 xbECEk3N8Ui0bdVvrGirefr5jkvVwGb3Szg7OQvKGBtsVOcM5EHFoJAFOWIP/uLd
 S++R4GzHMLuQEPwBfj6CRmxggcIiFlFUM4FE5azTI3oNKobXaKv+zr6J7aJH0Sh4
 W2Rgw0AvGYzYmfflO3mX/2DfusOm/5o59AQ3SqSG9YKnKKAXGtAoaZCzpiBLGWd+
 ISYnQpE79Ivp+XAr6GqTrHk48LhfqxNL1rYBWiVR+HtlJetyvBrRHrAy9vg26v8m
 XGmJUqEznhyDpznuBH6BmhsAX8fl6MF5VJ7vwbWuxVr15fbRHNOeFm/Rf2sb3lGi
 a9cRZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29gjee-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:47:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e5fc4c7e9so271708285a.3
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 03:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222868; x=1787827668; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WVunpjLVA0I0Wfv3sDB+jNp2S9PTkMt6jmB8Jx0E2VM=;
 b=IposVl0/fjEQBbTvqXPqUfMiAX5J12TKdG1OhT5UXRoDRh+O/rzAePyRnIoEi44WG3
 xCIyMksriC5WCPU9BZLNimNheMx9YFeTPRTXb3lIFk1NMCZK84X3gbBxQqZqqQkT/PN5
 uvQ1wqzz69YeJpjAmsU2ExO4/n2D4iqkY4699ZFlKb1QFc7CZ6ekG5VSDnOiGEqmRPJY
 KoA8Fr0BRel71Cw4dm3rxCl51ZB/6JXS/w8RvbDE0l5BGsQcAAgoETVgl9mXonJ2IfrB
 rBwYzvja+GjJtRsHbXJocMoH1urJeIpvvzdCyrRic5NlL0osMfBzUz97DNHqVtsyzgNm
 G0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222868; x=1787827668;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WVunpjLVA0I0Wfv3sDB+jNp2S9PTkMt6jmB8Jx0E2VM=;
 b=TEtgjE8CxKsXVMOr+4MrnuibwoKnx+PN3Qo68Sf3n7x7rdv5S+7xul2XtKYpIC6dbU
 US8O29duVz3suPFiFSdeC6Dsf7ZnLFkyo6v4pB1WfP/NpNDut8RWH3opxhG7/Gx6cdjb
 0sevaZ5+uyJHcccSuOOYNF2wBbx2GCEjaFIRtqo3LmefehhLy8PY0UcA20li2EW7O/kQ
 NV2i8x1TlZM/tJdAT2AQY3dcgL+PVmbFjeP9rqP0cYGfKBzhNkicGCi9GFz9j3cJP7PN
 cBVu64P4VRPfNKibzHG783m6Nx/z6D/5z04YoCD6oLqNCU5vgXymFwYZ0uuEZDFeXEdJ
 84dw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqIeQcWWYjlArW6lwbDDPxhq34S0XDNH9mtptyv/h3EucWnZMCqmiuz8i8JGRThiVHzgfRnxW2YPg==@nongnu.org
X-Gm-Message-State: AOJu0YxJMvk8JwRuUdtkOfMhV8lcuxEBA7/1DOMYSCsFwyBz8V0AFMPv
 WZjBuEfO6OOmXB5t59SNeTp3m5ioHRx9wYQvs5m2b1m3jxdnRFFT2BSmuJ3QAB+5x8K9fotp2+d
 OKez5YqoFtcPwseV2Mq1r2m1osQ4Gr8PMjwDpis+Q+Ve6uvODQ4SRias=
X-Gm-Gg: AR+sD12m7cdCD584ZHgvgjE5n+irtc8VtzefFww7DgWfRKQ2edfOcW/0QMmGAcgb66U
 XgSFkO2IVvB55tWIoMkQCMHaDt2FNWIQ4VigQHRnHicwJMNZjUK/8tvE5dpnkvEZrQx3KJkTXwo
 ThL4jph1y0OalcBhFQG0OYolH4lJK3BJTrSahhRPXiR+7ZNNdg4anucSb7cvC67mlVReteu6UjH
 M4Gma2w1wVZB7AXn3/aK5U+2LvWtk/X7I3ZQCpJIBan+UarJnZlOawRqbNseoSIsj+5ZtcJGaIZ
 u8UMd23E/ovNpDPkrtKLCyluvwVDmN+ATcUoN2NBRT64h0ECX/0+gnl+piTiNwKCBfjQkI+GiJm
 1s8q+oPsuyUsu1AxQjDVLTI0ypXdA9iowL8BduUkOSQ==
X-Received: by 2002:a05:620a:2b4d:b0:932:dc4d:c755 with SMTP id
 af79cd13be357-9371e30f089mr1163995485a.15.1787222868142; 
 Thu, 20 Aug 2026 03:47:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4d:b0:932:dc4d:c755 with SMTP id
 af79cd13be357-9371e30f089mr1163991385a.15.1787222867626; 
 Thu, 20 Aug 2026 03:47:47 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1450e54sm13595774f8f.11.2026.08.20.03.47.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:47:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 02/13] target/i386: Constify CPU*State for cpu_*_interrupt()
 getters
Date: Thu, 20 Aug 2026 12:47:18 +0200
Message-ID: <20260820104730.25462-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820104730.25462-1-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: K06sEeydTFvIGHsBd7dlotPtnjc7c8mu
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a86db55 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rZlSPvJ8NcuramrJ918A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX6jhPRJSQHX94
 8NhrOvDuWy8vLIRGyl7gYEh/esXIj2CFNcCe31KpnIghm5Eq+TtcKLAUAQclLxLXtYAuq73wvCR
 uqGxGomiXBIXz+fMIp/IUWE3Au4LSgZdAgdyU6zpMknhznBD5J1A5t5OkcL7a8ft9x/2PDAuOwD
 G5jsY1JF8CFBPNUMbRrg1p/nVhz/dx+3c6X/aTEf55v61oCTvazTu8k6ltnk3ZQ4n5gR5xpL7x6
 khma5Uyoxdk1MPWt0wV/KVc5l7q60gD07/KOooAWrsdFYHFr/8sh4VFFF3JhTVthqBapagr0HSQ
 L6fngr2Ei3iySzUYPB2lQQJ5SERKCYVfkX5Vf0pR1KD2zpyuQqf8Moxj7KpdI2Sa9ULs8zesC3F
 Gk2LR3X959LKyzKXZM21JnMxmhtgNrcs5bUlBY06lsWNB3N2xykwboNKX7nm3UYvA3rqppPw+kj
 sNUGxGagtmZoRaRFipw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX1ruflUKe7IKw
 9u9dG1n12v44K4oQDess9BECp9LZb5EDuflztAdxenClUdc7gexYhG9IRqtQobY4QywHBvZsrl7
 qq2kljd/kXYDdGhNSpH7VyOAIz35IBY=
X-Proofpoint-GUID: K06sEeydTFvIGHsBd7dlotPtnjc7c8mu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200079
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

x86_cpu_pending_interrupt() and x86_cpu_interrupts_enabled()
only read CPU state without modification, add the const
qualifiers to CPUState and CPUX86State parameters.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/i386/cpu.h | 4 ++--
 target/i386/cpu.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e6a197602d8..72adf075bfd 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2584,7 +2584,7 @@ void x86_cpu_gdb_init(CPUState *cs);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
 #ifndef CONFIG_USER_ONLY
-int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request);
+int x86_cpu_pending_interrupt(const CPUState *cs, int interrupt_request);
 
 bool x86_cpu_translate_for_debug(CPUState *cpu, vaddr addr,
                                  TranslateForDebugResult *result);
@@ -3092,7 +3092,7 @@ static inline bool ctl_has_irq(CPUX86State *env)
     return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
 }
 
-static inline bool x86_cpu_interrupts_enabled(CPUX86State *env)
+static inline bool x86_cpu_interrupts_enabled(const CPUX86State *env)
 {
     return ((env->eflags & IF_MASK) &&
             !(env->hflags & HF_INHIBIT_IRQ_MASK)) ||
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e5ffb10d156..8777bcbae85 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -10601,10 +10601,10 @@ static vaddr x86_cpu_get_pc(CPUState *cs)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
+int x86_cpu_pending_interrupt(const CPUState *cs, int interrupt_request)
 {
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
+    const X86CPU *cpu = X86_CPU(cs);
+    const CPUX86State *env = &cpu->env;
 
     if (interrupt_request & CPU_INTERRUPT_POLL) {
         return CPU_INTERRUPT_POLL;
-- 
2.53.0



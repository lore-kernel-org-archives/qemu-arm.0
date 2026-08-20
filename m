Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73CDC5DF81
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 20:17:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx9A7-0005jW-7v; Thu, 20 Aug 2026 16:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9A5-0005iA-FJ
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:14:53 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9A3-0002Bn-6o
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:14:53 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK84Dr588350
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QNEBEIJmMwDoBD78bITdTVQWtGt4MTDyYliaVB+vU0I=; b=gZGGVhDdTBzrvOsu
 PUdotq5aoUSVDeLSD4k8pMpfMCeGfZA1aRsZy9dbZBUzaeIp+SjrIdHcvEuRHQW9
 /J4MOqZzcvR/uCsGubXu/kT6VUWBm2pLQyRzCfeaH7S/bdz1Z1VSgXmMNnuuMfcA
 P65YbIwigY5epZqYVNu77Clx2pd0zR8TcsLlIVZ9Y3La+i1cnui8J+Z3B0oqze4E
 KWmx04YUeHGY+swxBV7z3F4eZ8T93lwI8M0xzRhH4rN/Dox8kzYq6p6bXFHeeCgF
 XeJHKgVw3rTqz9Q8WQ0DwbfC3ZFmeii5EdHMVHbvLqsff6NNTQUn3SsNyomYBVxD
 ZV4Iig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg8ased-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:14:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5276aa86d00so2408751cf.2
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 13:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256880; x=1787861680; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QNEBEIJmMwDoBD78bITdTVQWtGt4MTDyYliaVB+vU0I=;
 b=HRbeOLW8Q2jiMPNV3ugBPD2LUFTIfLoPN5ylrQxxsolLisYR5RwDqiCykme2EabOrN
 0uv+TyT51tF5oCbtbpJ4HNiZxovrRslIBidKXWjuzF9rudm0Ql80P6LYs2t4/zJDyRji
 KBu+d7pDdT3pzeC3Kna+T0K8sSXWWwD8BiJcA0lwhNSVS4c2Cp3zTttiZay5vqlUpiYq
 QpH/7vtv3DT22VkH47nVPUjzMLf5VLgBceAqidVU503XBOQcyn7Af5vsx7CmLtc0dOzi
 ng8yA5Q7JCHiXTa7XaRhFAQsaUlQX7MwbHXHqPXK7ejdGHL7eKp7ZbxhaBty2+mOM9iQ
 Tj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256880; x=1787861680;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QNEBEIJmMwDoBD78bITdTVQWtGt4MTDyYliaVB+vU0I=;
 b=nwxcoDrZ/zk0HEc2ea/vtZCUlu1+6wmiYNJWByJ6iVxSLFEFkuouEISKmJtUXt4qCq
 V2dQU+1MdCgEPxAkb1i2BqiW51uwDUx9z4yFCtau0QM7exuOusP5e2W1PSLO/13llYlI
 l94zosqLMX6KfTglShZCI98bK0pADKLW8UUcOpXAIJtpDBg3tZknnLo3SRzYs8vKsIIM
 kVeph8Y0X6Be4HF9edMWNuigJ+QNhe6632OetZTrvFJ0d177KIaeuBOrkph+nzQgV1j3
 nKpY6H0JnHQiC44CP9pT4GXg/qzYnlw9R7HZWA592oQezZtLJQGH0qYPqY/1BxD5DZ6q
 8r1w==
X-Forwarded-Encrypted: i=1;
 AHgh+RofiNX7blk1796JGBF5mtHYxCcfp09yHX9Sm+og+mxuj3jUrKRGZzumgqEC7pADZhz7wv8FY1BFAw==@nongnu.org
X-Gm-Message-State: AOJu0YwjOwOhyiXQDMRxx72JysoSi7QralVo6n173opNXUEeuCA4qgOO
 1wUCX0YKB26SHxBtOk1II3HdtG1tKzQUmH9jJgzcYkuBsce6EFILMtkhnUqN6zsLUWRSO2TmPxd
 Na/QE0KTbJnLROW5h6sv9ud0nRySPmAIAGX851LGHBSD3p6Tkwhgwktw=
X-Gm-Gg: AR+sD13rqrWrQ8x0lW2Db6975WdIKg3+EW2D7CJN0VBRqxjAruE6Q1h3UqEOLRnMcAj
 vG22LWM5uQirEC0vbpRHw7nMQ/Lkh4F7GdlIvkd0BB874icZe98cPb3o9GnXoKtT9l/Uyj5rGqv
 RW9hrTYIL5T4TEsRqxOe1PnYHRK1kNO/eJKJngu/PIG38tumAqs+XLDQxerhWoLngQ59O5kaVDo
 7eGclEz/nHPM5++LdUMliBAUitIZdsE5VktLpjMUmyM5mGvawllxey9qxqQNEziA35KQ1rwQMKD
 8Rw3m2JvsS2/IYP6kymA1dFqmSa+NaWFat2w/aP82sCk+a0/PMlaQ8zCGMsCi6vfOM/1K5EVZWE
 Zzgxm97/ChTJx+0ikLgJmuQMN9hno1eTI+yGeU2nOwg==
X-Received: by 2002:ac8:5953:0:b0:52b:4f1a:5ff0 with SMTP id
 d75a77b69052e-52df585f4ebmr9474151cf.19.1787256879562; 
 Thu, 20 Aug 2026 13:14:39 -0700 (PDT)
X-Received: by 2002:ac8:5953:0:b0:52b:4f1a:5ff0 with SMTP id
 d75a77b69052e-52df585f4ebmr9473551cf.19.1787256879155; 
 Thu, 20 Aug 2026 13:14:39 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b10fcebdsm15612963f8f.0.2026.08.20.13.14.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:14:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 05/15] target/i386: Constify CPU*State for
 cpu_*_interrupt() getters
Date: Thu, 20 Aug 2026 22:13:45 +0200
Message-ID: <20260820201356.29775-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfXzLDdGHz3N0My
 /4mp4KvMG+C4Jr4WU0Iva5PWsAnV2te4Dt5tA9pHPRi9hSzt4UGPixKZm2OK3wPzM3NbxaRZU9z
 8Yp4Bj/xC+BGoxttaqkLZYnj3793MKc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX0INKSG3erfJ4
 sgInNHbTi3orERFXmEcUT2hkvJtRTe1mFhlcDpxJ13hhAEtdT3Qq83Z2dNPn/Vm8NCOFXlPXdVh
 YlpcszFk2BHOLsYQLqzc0/L7BavB6hUq2rAMaiKgQNnpxCaXfo32Et9pqtcjQPcPvdwRQmAbxMk
 swjVEyQL+X4nQ2u5CejHr1s07mnaZcm5DU66lIrJo9UYYh19vzfyoJ6LlQZDRLIhjYe5jEIgQ6h
 4+3xKzJEe7Eth/Ki0fQ2H/rKZZlp/82kIlf3CiXzq5tajoefnVxIWjLQzV/xv5zLf1KGz32evXx
 QGmqEkf3Gct2iqaVHOGaAHubyV0+ym37vVyTq8rzfidwnZccyXUwlSo8B2dD4KNbS04jufltCvB
 D4Euh/AaIseCCcRq2W5nfXfMBBye20szcpCQKgcNAPk+0XIAqHRYQMkchpxPyeY22KLOh6y5oUT
 MfGPBy2xoyPSxnGfDJg==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a876030 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: j95bwpkz0isluq66IHCxl6_rHFYJs0N_
X-Proofpoint-ORIG-GUID: j95bwpkz0isluq66IHCxl6_rHFYJs0N_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200152
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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
Simplify directly using cpu_env() in x86_cpu_pending_interrupt.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/i386/cpu.h | 4 ++--
 target/i386/cpu.c | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

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
index e5ffb10d156..1fc02cf94e6 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -10601,10 +10601,9 @@ static vaddr x86_cpu_get_pc(CPUState *cs)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
+int x86_cpu_pending_interrupt(const CPUState *cs, int interrupt_request)
 {
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
+    const CPUX86State *env = cpu_env(cs);
 
     if (interrupt_request & CPU_INTERRUPT_POLL) {
         return CPU_INTERRUPT_POLL;
-- 
2.53.0



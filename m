Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17997C624D0
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:54:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LBY-0008Qy-1r; Tue, 01 Sep 2026 05:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LBX-0008Pq-3u
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:53:43 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LBU-0007bB-Tw
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:53:42 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68179EJv1892416
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WWjKl8lE0l15HkiBp4oGylMn+2gkaoOjSN4ksHt/pc4=; b=W6yZtrJBivUIP2lm
 Ohb19whovgxW/33FkLsF3PHJRTqg6QNQocJkvLdu3PpWBLwKjekMMsiinP8FhNoV
 /nFEpjkVriHl9A2s//vm6Fxs/PuoxuXzGJTBS9dVg/7RKZWmEXLbB7mhMq49qip3
 McKigqasK9H7nccvo8DS8MrIbl15FGaKBimNYVDqLZAnqDbBy6VFQmhL2ujOVL/I
 JMOl0HDDtPxjq7clwQf+pdwxrIfAM+M39cXR6GHQPMKC0M7pzfIC2S60qPJh73Nz
 P3TiSdrDjbrDtc/Xa+xNtvlFSOfSRFVjqYfNODOCF//nMzz7UGv4gsfzLFQpg4mC
 oZ7Qvg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7c9qss-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:53:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93494cce712so817711885a.3
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256418; x=1788861218; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WWjKl8lE0l15HkiBp4oGylMn+2gkaoOjSN4ksHt/pc4=;
 b=gzKjHBCAFnRX/TyN8XOMXcZCCijbkd704MHh/5Hh5wScHOydXxOZl3pJUeTM58iTPu
 iC90VgsNEvfO9eC/8yJXtO+iZNREUwuajmTA6ir3fTyPu8wnHK8etJi5Z1Kxs/UO6C8w
 4fHwHAhPJKqGlXIe+vxm9DOgNGQPfXmYknm8/0jg7CeXI3qVABE0eSSrtvvPY9mOPDbY
 8MwEwgTMMK63xQz1UEfwRkGUc1Oajztl7Se2MgOMOzUA+IyNz0f9PdBnkpGzXVHUJNXE
 5IhthMSuMf+DJA7Y1iwzicXuXhicP68BUME/T9seistLF9+oJIsrqe90M01aQwOODEp5
 DKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256418; x=1788861218;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WWjKl8lE0l15HkiBp4oGylMn+2gkaoOjSN4ksHt/pc4=;
 b=A/dJpexJW5319xRY4csAUNa7naa3dDD+Bvo7zrJOwurCLnLMLiwpLuF4GiXzxNcHwA
 lfa1lYP2l60EvuVQOfGsrw3sJQ1TQ+sJGJLAQbarB+5aORQEmQCivxLfIHNJyczoHpmP
 jjR2A7M0wia5w8vxbWV9DglGFIa+eByIZpg8R1f0x74Is0RIxRcVGEVsyoVUD7+DPIHq
 mwcJDrnGCwIqrsPkIFR/OjKwC0xRmuQMBVq9G/WV04b01YAcpdj5scxG8GUB9i5sT5kc
 AKktEYf5n8jhwSv1hxkzatRMNETIsHXhs65wVACort4HdKuUu/w331Tw0giYDS4D+a2I
 FY2A==
X-Forwarded-Encrypted: i=1;
 AHgh+RrfK1BesyU10GEBNA9eBB03tMCG6gBCejcdKgomaKTEIN5Kg7MexQVCVMEdWA40qQnwUngcET7prw==@nongnu.org
X-Gm-Message-State: AFuF++mH4kXUOOs876TX+cWcqfP1b1z8LqJAWS/3O9grbEzpNbBVYkgD
 EMgnGPOSHSZzvj/h5/Uo9pEzhZys5rGXw3UjBJ6zExFYZsZ+9x6+Wvvk5rrimSm6BaHTrvdNcEV
 F01sDrSfSJPVS/OWvGijAPkMAu5eWIHLyFTV2LrAecDDdCiEuwCFAOhQ=
X-Gm-Gg: AR+sD13LV/tWBemzYwCIRBPWMug+sAUjbYCrMzoXb8oR2KSctp1QfyP+VE1Icx6IuTY
 PI4E3E0KLlEmMeBaR6483LnUJ8h3OiKTLQ5YnOuVNCx/Qfrtf0ng3kno1bCTvN2g1hFvT0fb5EY
 w7zG4Hp2zV+Qm7dnGmB84fP302U3pzXMvoaRhDpyXFNrilJIcWeKsV8Q6cp8yJbrEYp2bYMT+fF
 PVQAbKDqJXIcCtQSCb/DKe3oN2hPVDceYZfwzOAytpPPg/EkeIdOXERyh0ntRxl9vkfSr9NhS79
 QrmUf3OwGflXGs7SzVUJNbKK1EUp50GG80yNSRMNUhKGDe2+oAm9mz7oOI5uPUcK1G1Y+0hkSr7
 vHVbo/0NxPLBYsDOz7qszg9OY0vo1s1nP6iT53P56
X-Received: by 2002:a05:620a:c53:b0:937:2ec9:c98 with SMTP id
 af79cd13be357-93947f3e9d3mr940397385a.5.1788256418413; 
 Tue, 01 Sep 2026 02:53:38 -0700 (PDT)
X-Received: by 2002:a05:620a:c53:b0:937:2ec9:c98 with SMTP id
 af79cd13be357-93947f3e9d3mr940394285a.5.1788256417805; 
 Tue, 01 Sep 2026 02:53:37 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b91c52fdbsm261360035e9.0.2026.09.01.02.53.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:53:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v5 09/21] target/i386: Constify CPU*State for
 cpu_*_interrupt() getters
Date: Tue,  1 Sep 2026 11:52:15 +0200
Message-ID: <20260901095229.72018-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96a0a3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: XN0kCfr_IvBPGqBU2LkKxEcZHW-S1hoW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfXwN8/ery2xNmw
 8Ajssu6ljpZGPtoY9QGMurcnZdQ9zZygpZ0hNL0duIgXiXoVrvkEpymEKvTHO7Zgzq8aJo24gdB
 9duUkpeluSZDCpuPhspbB5Q4hP1EPlM=
X-Proofpoint-GUID: XN0kCfr_IvBPGqBU2LkKxEcZHW-S1hoW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX88NRxO87PkRG
 B4fcDzzob7g/NaZ+/AbQ01MeB4yceBE8D7agZi80N+bHCrmyYz1JrOne3JNMxPO/T570/gmPeFL
 Ymqnw2yUI7Iww+bfhUe1w2FegCMzo37daPuBwUFNslD/xGopi+splwYxXQzMA3KG8y9adPkRI0T
 lHOF7HOZ8ZLS1+YeOJUFej/4UvFOoPajkOFip8Zz9aHpxzBEdcOFUYTkNpWkqGnO1WYHhpt1cWR
 qvXnCfuGcL0xX43PruAuSt8Rid7MEwIq40IpzJPXg1Rda4AP1Ak3ZKfF+7fWBTGYQFZsyB4puf8
 7KeukYgV98inWQM33sIp5WUo97hKlamOuIUG1KQq/fnzH0x5e3cYUyX2lhO1DhFN5AWTZY4/yZG
 HxjdFsgEfGE5LnwasVeqYL4wcfNOhWLM8GMoOKzwYezKoc/cQc6DztLS+n3okByjJJGrwmYsTYb
 3W0gZeGf2ZvMwQC+bmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010087
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
Simplify directly using cpu_env() in x86_cpu_pending_interrupt.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/i386/cpu.h | 4 ++--
 target/i386/cpu.c | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 641f3ee5c2f..b0436dbf665 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2596,7 +2596,7 @@ void x86_cpu_gdb_init(CPUState *cs);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
 #ifndef CONFIG_USER_ONLY
-int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request);
+int x86_cpu_pending_interrupt(const CPUState *cs, int interrupt_request);
 
 bool x86_cpu_translate_for_debug(CPUState *cpu, vaddr addr,
                                  TranslateForDebugResult *result);
@@ -3104,7 +3104,7 @@ static inline bool ctl_has_irq(CPUX86State *env)
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



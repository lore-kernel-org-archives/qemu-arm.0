Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC727C61CE3
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 11:20:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyShl-0003Vz-DX; Mon, 24 Aug 2026 07:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyShj-0003OX-NF
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:19:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyShh-0005Zx-Rb
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:19:03 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99Awh2547842
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WWjKl8lE0l15HkiBp4oGylMn+2gkaoOjSN4ksHt/pc4=; b=okLhfKOWv3GguvKR
 W0kG5k00RdZSpbukZ9TL5IfHhrHHS4kT8JRK+4WNJfmau06M/CByq+IS8TvdjjJq
 2KLB+X8HX2pDsCMlGszBesmQGijxLOdEY1S1caKllMynjdd95ydH1xc8QweVFBq5
 rRDJDdLv9roYqm5PB3Mjz0dM/xfODw72w543vgiAkpY7DhLhwfSIE1R2QyVfiYr/
 vy+9TuRniS+xB8yg5yYO0dniKAogQbAct+MpGFE2LLQFGUd1+z5jFhw9ale/Qetx
 5pBfDC5Ux9iz/juDt4jWzwp1sYK2OaTJAoLqZEykZWCtQND5uvH4aSMujBSDCvY9
 2YNEAg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7jcx8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:18:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52827090cc5so43392231cf.0
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 04:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570329; x=1788175129; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WWjKl8lE0l15HkiBp4oGylMn+2gkaoOjSN4ksHt/pc4=;
 b=jwMxID2AObR13xULByswvsfBcXyiiZokwFK6tGQMBx4FLSalbKzeNtqld7lib0RD38
 BCf3jOWkDbuD8jWrvSbJh9PL6MY586H+t9Nqr4byHGIo7QQ0WR84J1iQM551a6HO5SWP
 J7+eQt4ziD1ND4SvGjd48AKJtwhCq6IzJ5RENGNRfWGbIYUedS+sAe6adBFrWbUhpdz0
 IbtbaS7tOT4NSGo3WfdDLPVI83JmsDxy1V6W/24Lh5MVSPEoGEZGnWEZlT2uV9TJLc1D
 ajrxKPLsScQg0+fSTR+8HXbiIOcCOFosg21S2m7W0LJbWQ0/onhUh23G+M+PXyfz2hHo
 CUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570329; x=1788175129;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WWjKl8lE0l15HkiBp4oGylMn+2gkaoOjSN4ksHt/pc4=;
 b=AB5+RtvHeXv9SEwT1EPniplhtpLfVBz53x27XDVqTnSoU2Ef4H3kcUB49xytbXiw6u
 lH96d34WA5mAfyLrySwDa6V+2kjGradwTeu3n7zmwbCft0A3IfhW73D7lCbXbXmmzDOX
 +m2o/qDgioSUI08YCj3ngwyp8WhqClmRWxwTrgTZY3SJEqJmisBJNHpnc+uod56mBC45
 4V7eqPf6Z4jZMXb/KxvLw4ZYc+5hPlWbBIaGx8F+ynWXcyIaropZvGm9SMdIy3mCnN2A
 AlMvgHz/C453/Iju/mVS99WXWe2n0I/wt6paht9CPerOePmx2vsAu3rGxjswH3IF7WjR
 1++Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro6sRP4UjnwLpCPTotngB2ZQPtZyzC1OCzCHmJ360h5ILdrSkFXdN4LZgOcPiSCC6YVxZWPTGUYHA==@nongnu.org
X-Gm-Message-State: AFuF++nlRt4W4Rp7qCkuOa9bmZvZANw9dFGbgKgcIipPr33T5KOigHiM
 7Vyu6CF/Q55KowJ2YWw13OcJxN9zCj99UDI+sxq7HnMOTX4eb3ob8+/MvnE1l/ONKwzrHJ91EzZ
 Vw/8hrc76m/PuICv33uQTJS/jVs09RsPiI38kxdUT5EgrGPAg7UHqUQw=
X-Gm-Gg: AR+sD11aS8NixMRKVJjVhdhkqHbMgw+UgObt8TU37ExslDHc5pJoCF9+VtdOjtN6UAg
 eWdGhlaETDIbj/6OEwrHNuZ7ZqVN2961C5PfyzFgBozuACOkFbwHbXV3bzjYapNf39cEe5mtqCe
 S1Aec3bkXNFqk+/bVanrYy8SVO/Ab5IEPe7+79ZhyzOrtE0J4OwP9tK9NLj+/SZ2KuX5+UCY5sB
 I6hKUOzqoS0kp2AzFPbw4OHwOKzYqTedHffmXgki0nj/BltYaUmdvTs/aHw/iD92PTHrLTcfx1V
 6GdB6cLEJBgN//asYEK2ruzL8N7M2zYg5yj/E5/rL0A2Tp2+b+zDslzT4ABe0CyBd7nOywHRdqN
 QEI3jK0epCLRgpRhXrs+2bSoR007B/782eLobi9C4mk3xin1UKw==
X-Received: by 2002:a05:622a:4d89:b0:52d:3483:ed0a with SMTP id
 d75a77b69052e-52de33af2aemr340162431cf.18.1787570329316; 
 Mon, 24 Aug 2026 04:18:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4d89:b0:52d:3483:ed0a with SMTP id
 d75a77b69052e-52de33af2aemr340156531cf.18.1787570324808; 
 Mon, 24 Aug 2026 04:18:44 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606a905sm1375485266b.13.2026.08.24.04.18.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:18:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v4 09/20] target/i386: Constify CPU*State for
 cpu_*_interrupt() getters
Date: Mon, 24 Aug 2026 13:16:58 +0200
Message-ID: <20260824111711.26297-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c289a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX5gNd6oAGVt1c
 Nh8aJS0QtbgI1WOWyRIIQxy7caL4QyxcIW2+bJdHS1+n2pvPUmPPXLHZuBVjV9kRXtw1W89bYjK
 GoXnsW/fc6RL7zRUNdu6dxUt3BO7W3Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX1ZRGfnfsmnUq
 PEiJ1Y6wxxIPejYJU070C7KEk9jOzmYOouSCxb1lI5WAEB1tdsaN7Bqtsm0XmwwcYYGOUWAwI57
 3zguu0AL6Xnu5r2/tEgXWjD0gorp3UePfv2cnSZuRF+4pHv0Z/ga0O/su8uvjGy05bPv8mazXNg
 asskReJYXYgLWPwOlAwonRcI+mGkqiFIy82P2PQqljtEnzeU1zJJpQk6sldwCqbakarpzsmYFbG
 /+LLaFdzodj6jDZpbomYmNE882WPcpmS5Klcwohdaf6AOvQVFqhRfnXLpaeAaMWxNckFzjlaO3C
 9DcYOeI0/3fKgNQmviJZthR9xsBmUhmJy0jwTGQephkFkgs4hYQ1Q7JxTtvmODMUqv/+n86a1Ct
 C4GeZ2+MVjC5YNJU59gyZMdtvA0MhlBIXD0RCn9bOElrL8f2oh7PdAdPMCZg58LRaPYsozTKovD
 aFoiJ0TgG6+aQ+e3cXA==
X-Proofpoint-ORIG-GUID: urKIwh2WhZTnrBp5kJiSDn23bvyeYPHv
X-Proofpoint-GUID: urKIwh2WhZTnrBp5kJiSDn23bvyeYPHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240094
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



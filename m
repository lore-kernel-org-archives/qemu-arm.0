Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE7BC9830B
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 17:17:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9QaY-0001rv-Bj; Wed, 23 Sep 2026 13:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXb-0006Wo-Nj
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:14:00 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXa-0001Mj-7y
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:13:55 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTkUv3665741
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NMMUYlRFOEu4Y+0NjhX8Ge/q9RoTfSWrF7SafoChtWc=; b=fJGYs3VPFpDR1GkG
 5Ms5UCqNUru+3di6NMJKOgYye1y/etGby4orSJZ8Squw2YJMzvGKAixxBYvCPKZ6
 ZYYr+cwooZ69oxuGEWYI2fTaBcr1KPyUgoBwaZFaMm6tGfIlG82N0iil+OreNiuw
 vFEH5HzM0Yu3mB9oDzFXRvvt9pGwkJrMYzDZKHju2eJkVFBlPAN8mJ6SkSztdS4R
 8dduiOk6buUQyL5DwkywCHd/ICJkCH94IZPaTbK8okAR7yOX8Ggg+pt+TOlLlpQF
 UzaI8IawwxJ+4p7bydE95scWMDRbdG4+RST/1mkRiXZcqsFLQrt2rbLrwF/k+At0
 PEeNCQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwat1j5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:13:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-78fbc5a4cf8so84898137.0
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 10:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183623; x=1790788423; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NMMUYlRFOEu4Y+0NjhX8Ge/q9RoTfSWrF7SafoChtWc=;
 b=AIsQrkRNhMMdmBF57mxstSIWACBBuSwFevrAkdpcXbew7nof6SitDnfK7/+b7hZdnU
 COSwHWpTu2naw/h8S8obV4fLJ8+BcmKVC3z0hgaq0CF4mOitLRumXF+QMzGWJS2qjWPO
 Q6cMlhqvKBKTORbjg365zKs5ea7QYFCp4BkRE31mBw7+7Z6DwlDn//RWcKYwPPFrlcry
 OnXa3W+NM9Tcp1r8EovpWi60eyJMThGO3WPRhM5lvs4EcWUCS3lIiv8IHkG2GEgLeZ+L
 4WrV9l8tQpxsL9NT9sJf1pC5ANurGaaeZxgXGcD6BR7DV/UDxz8Tx4x21NXVv7TUPhri
 l+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183623; x=1790788423;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NMMUYlRFOEu4Y+0NjhX8Ge/q9RoTfSWrF7SafoChtWc=;
 b=kfA/u+zclyleeCz/VUmPndtHcFkQXihqv2aD/Ge6IJlWsJzSq32b/DVP/RMeP3xIzU
 9uu8JPNp433IT5t+HuXyyFaGikH1E+Ds2eKCvLWUs7CkWjFI5KEvpDma3IjNYR3f4uyb
 n5phrb11Fv2OeX9FwsiAVe1Hch5EQmcSjWEKyCHrPRbXXlMxtZsrp0QuxnrDWA0QsJ/y
 UYbZ1X+zE6+0fyIdnU+eyTBEqW+SWeQ7rCXYoM/AO9WXQvh2lye1R5+Dh+zhYRrpUWGP
 0Vf+pR9sGcNb6rYnd3r3FB8+y8B+OpTjp7jkDGGlmFnx/FDmog/sw3yZO5+o3jfd5jxI
 H3rA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxzEpBtVYs1ZoHb3lFHGMrkSJMw8IfR3N5e9r+ZCtURHhOzFKgwrmZVQkeH+ltgl1nhWoOZ31z0Fg==@nongnu.org
X-Gm-Message-State: AFuF++loRJAk7c0eLJlu/6HZNl61iCEPlTANEdKFDEy8/c0RDcddOcIo
 hr9cNTQLsqdF0ETW9mQj7W/3DZhLkJYK7CrwuTzfgrJvC42cOsUPrdKFwaOAV/jT7RHfC8yZtJV
 CqaBXdh7dw5UEg3oB4Occ2GrdgyUsynzIaVtlDAccwDyY3+Px6vOqq2o=
X-Gm-Gg: AYBFou2iyf0UkcFs+LJKHr/W0KeS9F8qbj1u8cJMEbOCW70j+JdHp88nc81gaMdlhzZ
 vRwMO0kkrR+Vc1Z4Rvd2jE+gbXBt0labWvLg1QFfrcZpHY7wev7knHObE2Ae0TUYuZMbYc+1krl
 FtTQ5KgBbDGFIypzOMN8IE7hMeeVZfW1rFYmFH+/g/AmmVs3mj//LR2u9pQjm4V9TemPo9Ku3nB
 DGVicjt4cdNz2T6VIqGMgk6XQp0udV9AcILfoeCd4A1b6qJ3U2zAdXr+lssO2wG1b6Xm7abRKw/
 4cSb1f4fCIyq7/nAy4xowor1lA5qwCj70TBlkaf09y5HBE6zksZvn+qGDTCKZNOoruTXPHE88K8
 XhxabClQvbUaHlQKAZ0Rrs0+Kja6cRPBs7KgieHy7
X-Received: by 2002:a05:6102:8192:10b0:785:6b42:b7b0 with SMTP id
 ada2fe7eead31-7aa9df8e032mr5426517137.4.1790183622726; 
 Wed, 23 Sep 2026 10:13:42 -0700 (PDT)
X-Received: by 2002:a05:6102:8192:10b0:785:6b42:b7b0 with SMTP id
 ada2fe7eead31-7aa9df8e032mr5426502137.4.1790183622364; 
 Wed, 23 Sep 2026 10:13:42 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886877970fsm8890958f8f.24.2026.09.23.10.13.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:13:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 19/21] target/i386: Split leaving-halt handling from
 x86_cpu_exec_halt()
Date: Wed, 23 Sep 2026 19:11:13 +0200
Message-ID: <20260923171116.31276-20-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX7uLGjhdnd825
 UFme4z5w57vn1lKbHYoWvqKsXHpppwkdlH/1dT7am8BC3PxVY88nHb903Fm8OrdszTAuuSIz+x/
 3u7n2KBxjHXAb0nIZDX4aVzabSNBOHQ6q1og+hUevIYztUCLICeiY13xVrYSrj/1FGayuSaEmb5
 VEBPBeLX6b96Q/aQ3uTTcWlfbWvkbkNWEpaKtPfQXeDqP8MZgo68dR4PbPSTedJE1vv8OHCU2NR
 doMKuXR0gF+nlI3dIZR+Xs9zZc+iu0Ye4DU2NxfgI8/7nnvzpVUHKwGHLT5X/RfK8WABDDJ8ekZ
 B2xJMDTnWUOSjB4zOQN1zoGE7mUYC0NneuzpCLEiz5L6B0BMvg9W5TLHTB0Xj1zPAjzne3Vf91S
 tsM/beYgZRzBpBqwtLoUkGCWVeMhpNvopivXiA04+tr7Le7eNA8AwvbKklWFaW38KYxoSBOwUy3
 VZeDpxlRCV/6SrZiTmg==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab408c7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=GiXQl85om2WzCxkx9rAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Vp_sN0soFMFPF6-Z14B9xRYBa_rBKyga
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX80gtxExocHxH
 2K+mV9rBACASRk6jKHm3j5imkCZrxlYsUd9weGtdn3K4Juy/+Q6A4q1roaImHVYaxfAyQghJ1xv
 oI1WK4fuOKKLTHros8BfS80bx9Qrwb8=
X-Proofpoint-ORIG-GUID: Vp_sN0soFMFPF6-Z14B9xRYBa_rBKyga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Move debug exception handling performed when leaving HLT into
x86_cpu_leaving_halt(). Keep x86_cpu_exec_halt() responsible
for checking whether the CPU can resume.

Document that #DB IRQ delivery through do_interrupt_all() runs
in the vCPU thread and does not require BQL protection.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/helper-tcg.h        |  1 +
 target/i386/tcg/system/seg_helper.c | 25 +++++++++++++++++--------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 58e8ca0bc1b..96accb30a80 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -39,6 +39,7 @@ void x86_cpu_do_interrupt(CPUState *cpu);
 #ifndef CONFIG_USER_ONLY
 void x86_cpu_poll_during_halt(CPUState *cpu);
 bool x86_cpu_exec_halt(CPUState *cpu);
+void x86_cpu_leaving_halt(CPUState *cpu);
 bool x86_need_replay_interrupt(int interrupt_request);
 bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
 #endif
diff --git a/target/i386/tcg/system/seg_helper.c b/target/i386/tcg/system/seg_helper.c
index 9ce608a0bb7..566b3d4d80c 100644
--- a/target/i386/tcg/system/seg_helper.c
+++ b/target/i386/tcg/system/seg_helper.c
@@ -140,22 +140,31 @@ void x86_cpu_poll_during_halt(CPUState *cpu)
     }
 }
 
-bool x86_cpu_exec_halt(CPUState *cpu)
+void x86_cpu_leaving_halt(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
-    CPUX86State *env = &x86_cpu->env;
-
-    x86_cpu_poll_during_halt(cpu);
-
-    if (!cpu_has_work(cpu)) {
-        return false;
-    }
+    CPUX86State *env = cpu_env(cpu);
 
     /* Complete HLT instruction.  */
     if (env->eflags & TF_MASK) {
         env->dr[6] |= DR6_BS;
+        /*
+         * do_interrupt_all() is the normal TCG exception-delivery path
+         * and runs in the same vCPU thread context, so #DB delivery does
+         * not require BQL protection here.
+         */
         do_interrupt_all(x86_cpu, EXCP01_DB, 0, 0, env->eip, 0);
     }
+}
+
+bool x86_cpu_exec_halt(CPUState *cpu)
+{
+    if (!cpu_has_work(cpu)) {
+        return false;
+    }
+
+    x86_cpu_leaving_halt(cpu);
+
     return true;
 }
 
-- 
2.53.0



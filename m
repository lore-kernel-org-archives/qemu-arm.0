Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F6FC98302
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Sep 2026 16:50:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x93hN-00047E-Pt; Tue, 22 Sep 2026 12:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hM-00046o-JR
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 12:50:28 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hK-0002Td-WE
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 12:50:28 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MEjBr24109945
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 16:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 72N0GXBzAI2IR3Q2JwAh1iUuA/4cXofbC72GnfMvljs=; b=A17rl21NYJSn4WOW
 Nuos9WqMytoQDEEkCz99z/UoWrqnmlcv6qghWNoISwzkVbm4A/Sqc4n3l7Qr5mTr
 5LrDoP56uBy4LOn5qTTpp+bXlghoX+LiRAAgsZeXAYcGInUCzJSITlBpK2naLenW
 HCol5uEdJHsvbFp+b6WVwp/bFlDb6hkQMJPJrnkYU+pRSelOI5+u98LYepMvcjFZ
 yCyOcjpHQ3s4cWBptS1Z2+YjkR96FmpAQbUunluYoDVUiM06dk+zrehWtZL7e1sv
 CX70lDkhfgEtxeFKvvn45aVhKG+Ii+s3EYMOgrbnWTYPIjH9OB7AQr4k/tcxPz4U
 qEmFew==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnt9m52-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 16:50:25 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-97cb8d1b032so17987241.0
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095824; x=1790700624; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=72N0GXBzAI2IR3Q2JwAh1iUuA/4cXofbC72GnfMvljs=;
 b=Uap2q/C2u5ixRnDLlkf7q1AqGG2ImrOrlo8km8GLhYxP9GyCH9YjgmgSuCPKZrZcbm
 mlK8E5FrlA8eaSQbvwaxVU1njAXUpGkgEF4Fog1XP6xUdvn47GmBWvYD5I36B/k6OW74
 6n8XjUwHpt7BxNXZGJ+iSa5rIk98QdYjOOIPnWxWY+vSBh27H15wqNyD7mVoQwzJq1ZG
 8IZsBCX0NTba8mt5ZV1NtnvEhzpEKR65dbkR5Ks6zK4et1/gMKBrGWJLPHEPpBZkwyEz
 fuGr3qZcK+ez4Lz9d/iSHcVX13igfFaekiO3SWg8iaY/kQDDQYbPLUdJpa6WlVO5WvwU
 fGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095824; x=1790700624;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=72N0GXBzAI2IR3Q2JwAh1iUuA/4cXofbC72GnfMvljs=;
 b=z+b/JJ6/2gcAJLSF+5QEUVMZ3esfB9GGjDk5vTbgA3fVp2We3pgGd5jC0zdVsBsvWv
 8huinXQPgPSYfLssi+IEc1P1bmNwIZtsRqk0enUZQKLrzgZILvoZtKRkyYl7rzAwxHxH
 ZxZqvmheu5+zTyc4aj1RSk/1HPpuiWSRov3TC9Tx0rJ6N41NKSAtGFpuD5oBqYa3B6Rm
 IjNRZ+OE9oF6BqsesfuZFGn7eXsmYufzS6dz6THq6NWIobmmOkj9ihQ/GFTLwbSWUOuj
 WXv4zniFKv4Vi/ozPJyNClterIdGpLeWfdaV+KUOwdcVci6S5vArOsoa3veM+flARIYc
 hItg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxB/5MxfriWASwFYf0j/2CL7acM+nktfcwaJYrcMxaqrmLJhgNCWseRFOltaDnqaHW+/BFyzMLQMg==@nongnu.org
X-Gm-Message-State: AFuF++mP+FPrxivbGki/pklrfRpe9Lzq575dIcU4PDtBltRDI0csBgSV
 QqsrUd3wykpDpZB/JZqzyWJ6VFj8ko7oT60ki0A/3LXs7787hn+K7RLTnnDPhyQ7e5LuSS4TKqN
 2bMGRZyknFyXGWFCpEO+Zs9m7cg5sT2xK1HG2sG16XNJhwYfMKuoKVRc=
X-Gm-Gg: AYBFou0PzXAn6f/MoIYWBB+gkPmZVnD9r/SERsz/SkRJfSAWSXqvIzvKwaBNKIIV91/
 m9l8m2bBOkuQolb+crC75iWghWr3wwJxOyu6wvfPYlTfij0dQgXBa9iBujeTXchjSzb3oQ2G0fX
 Mr6TSVoGkqTS4cevE05CN1zfs/I72xgEc77y6ug6EeVmTGzN3WR9IaEV4PFYsiMjvV8HrPip4KE
 fzcrSymlufBCXJf+XNMtIyp7GRJASwdrRteRKjnsBFvJgtFe2IXAGVuQFufBDwovCNMrFYGQOaV
 CxjLdj4re+iab8Uzc5u1azmj70ymf8AdM9N9CcVksXKVio4L0ADGaiIghZZ4lwSSfBuYCXRW569
 5HTCP2SF+EfzZ8FJyPAUePhdfIsXMU2o3dwR9bY6r
X-Received: by 2002:a05:6122:1312:b0:5c9:a60b:e5d5 with SMTP id
 71dfb90a1353d-5c9f1655c76mr124697e0c.15.1790095824515; 
 Tue, 22 Sep 2026 09:50:24 -0700 (PDT)
X-Received: by 2002:a05:6122:1312:b0:5c9:a60b:e5d5 with SMTP id
 71dfb90a1353d-5c9f1655c76mr124660e0c.15.1790095824066; 
 Tue, 22 Sep 2026 09:50:24 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488626d29dasm6729910f8f.0.2026.09.22.09.50.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:50:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org
Subject: [PATCH v2 06/17] target/arm: Un-inline arm_set_cpu_power_state()
Date: Tue, 22 Sep 2026 18:49:24 +0200
Message-ID: <20260922164936.15189-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MMLMoKEKrWraloHrWf9e1XqgZfYQGjNX
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2b1d1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=or-B4SToQ6AIma83kDAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX5eKPOAlPQUmp
 cQT6cI2YTR4HpFYqFiAXNoMho5gzgdUJzVrCMPMJdTXxTLZxhDnLJvZWsLFSsGvYRY4RgCk35GB
 YQbyBYn9OFqtap9CDB7MtVkMC4u5R1bBLygXqnpjL66+6h9dEAq85J5Zl9i9Z0lIRkCmP7bvH9Q
 vItwpXlD7nk/G+1g4IUSpzwZUMD/+aVLqy5Yl6BuR50LPmRqTrrlD1AiUIk+LM8zSUYm5nyE2US
 EsJTj0u0G/YVwF6PSpScP/S6pQEFTlP/gCHX1ZGfPdEGVV52pm2ItLlwpJLIEOsZL3G3fbd/K2V
 KFAd084xom6QWrbjKA8crTUDrCQj0n9xpZaaoShCvvi1GOFmxbyyLSM+/Imn2GVtc/h132QrvjC
 1oEo/D9JLWGrAQD0Y9Ziw6W6udrLCEJFZoN1SBsj3ps/MPAOqQiKiP9cDSogQNs/aSodlTlJNJa
 5EZ5Lp//zofv0C21qKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfXwNvRhPo99nkq
 qrFrEx6II+yvBOdGE24XjlDq7Paj88G6EZSjhzEbInbTB5dbY1b4MsiSMzKrKnGqPPfXFeqm9+m
 mkMrRxqw5TCx/SQE/OpP4+wA5LBkN5E=
X-Proofpoint-GUID: MMLMoKEKrWraloHrWf9e1XqgZfYQGjNX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220246
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

Move arm_set_cpu_power_state() from the header to arm-powerctl.c,
keeping the power-state helper with the other power-control code.
Restrict the call in arm_cpu_reset_hold() to system emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/internals.h    | 8 +-------
 target/arm/arm-powerctl.c | 7 +++++++
 target/arm/cpu.c          | 4 ++--
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1775835ad50..1efda543270 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -2082,12 +2082,6 @@ bool arm_cpu_match_cpreg_mig_tolerance(ARMCPU *cpu, uint64_t kvmidx,
 /**
  * arm_set_cpu_power_state() - set power state synced with halt_reason
  */
-static inline void arm_set_cpu_power_state(ARMCPU *cpu, ARMPSCIState state)
-{
-    CPUARMState *env = &cpu->env;
-
-    cpu->power_state = state;
-    env->halt_reason = state == PSCI_OFF ? HALT_PSCI : NOT_HALTED;
-}
+void arm_set_cpu_power_state(ARMCPU *cpu, ARMPSCIState state);
 
 #endif
diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index a06be5cc997..213e7ae056c 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -45,6 +45,13 @@ struct CpuOnInfo {
     bool target_aa64;
 };
 
+void arm_set_cpu_power_state(ARMCPU *cpu, ARMPSCIState state)
+{
+    CPUARMState *env = &cpu->env;
+
+    cpu->power_state = state;
+    env->halt_reason = state == PSCI_OFF ? HALT_PSCI : NOT_HALTED;
+}
 
 static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
                                       run_on_cpu_data data)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f58a1db843a..76aa47ac503 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -351,8 +351,6 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
     env->vfp.xregs[ARM_VFP_MVFR1] = cpu->isar.mvfr1;
     env->vfp.xregs[ARM_VFP_MVFR2] = cpu->isar.mvfr2;
 
-    arm_set_cpu_power_state(cpu, cs->start_powered_off ? PSCI_OFF : PSCI_ON);
-
     if (arm_feature(env, ARM_FEATURE_AARCH64)) {
         /* 64 bit CPUs always start in 64 bit mode */
         env->aarch64 = true;
@@ -671,6 +669,8 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
     arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_AH_F16]);
 
 #ifndef CONFIG_USER_ONLY
+    arm_set_cpu_power_state(cpu, cs->start_powered_off ? PSCI_OFF : PSCI_ON);
+
     if (kvm_enabled()) {
         kvm_arm_reset_vcpu(cpu);
     }
-- 
2.53.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771F0C98302
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Sep 2026 16:52:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x93jG-0005eG-AE; Tue, 22 Sep 2026 12:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hl-0004Mu-T9
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 12:50:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hi-0002Vm-Q7
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 12:50:53 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MG5sqk884576
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 16:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VWAPWAp+zhiL5Viz57fv4ZOSFOIrqkMoe1JjS/wZSI4=; b=P2WOBmfCgtkoa4gk
 AqiUrXvrD0z9QPbOpyMdMlGZeeEp2kGxb9Ey0Nt7/KIUc+RuohOgqlidnx59f92Y
 bc09Mgc2ggtTXy7Lhz8XYH4+/1MexSuoltYYzFZGLmET02X5i4Vkn3M/nK50MORs
 wluMJN/e0+/290Y7Fj8Eu8pow0LqfKmfBHaq2NuN0AZ0ZMDP2JcWVSkv/tYIEPW5
 Q6OpTjdyKb/xFyQJI/muGdsLr16hCBmcW4HK9/kT+0jb2iYULX1YfwN1P835Z0kg
 D7zK2HOE5g88tMYLz427Nt+U4qxrpA/baVWUSGoHYx7f62PaxHHcbf0scYBGx79z
 TrQa/Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7g6s5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 16:50:39 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5c9a55c0cbdso85313e0c.0
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 09:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095839; x=1790700639; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VWAPWAp+zhiL5Viz57fv4ZOSFOIrqkMoe1JjS/wZSI4=;
 b=QUaUBKBWifXgJ890RNU0RB3odaB9HrfQvFwv2OvvGn9ghY6yyTbcxjEN7kGOxCjPaq
 6ixyTQBkfUr7gzE4Ruywyllbzl44PRgTt/2tqTuQOHc52+/gr9cmm1NK67ML7lKuMWig
 gXj4pnKAnCoWXV02XA42/MVPRyf9xc+1/ElBTc3cw91Te5zLFBUonKJW2+/Q8lAj2u18
 FoSlAXHkvkLyABHKP8uuErULCVjWbjOmgTWz8rdFWOjo5Eb0dXVoBRg2dtCoUWwVq3Z0
 jwljf9u7QsjP2pXb4Urcx5tmN5COg63pG35ws8SFOrfMLm9ymAD7G54UnFK5mMqOJsta
 e7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095839; x=1790700639;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VWAPWAp+zhiL5Viz57fv4ZOSFOIrqkMoe1JjS/wZSI4=;
 b=HSetIezn45yQvv17wrYFJlCZ9SyXoWXisYxjFwfSK/h6ErysFlsGyPdvp5QyhnZyQ+
 CNx8xa3HovBPduRVloe/zi2qjqNBoGqJ8X/IYllj0MBVWBsB/6hqufESUUjLeHA4oqZw
 ZZXhf6jVzNXbPOZyJ06vHYS5QXzrOFCq42W3hSCG5Y0A0P1r82PKqUnoO4k57uh979Rs
 eE1p49UvWZ3ACtoH0/dLMpUdaIl6IYkSCCFTFFK4/wDlyRqUlFaPdOylaZVA4Cpo2Sc3
 GvYMZRenV2a752+83Ehn0xHfhQH9ICzIIiDoI4oBzEyw5BBJsfQbMj/DYSRtpbp2fpIh
 qlgQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByokxbK/MTXEFwQLNOgqq1tc/+787XvWt3Mq5uA2EMfL94eIyyH78vbj7GA9Ci/WD2Wh1ML+11TAw==@nongnu.org
X-Gm-Message-State: AFuF++nYyaOqdmbKsRboIKmGcJGwAd2ipieDAtoCwztO86+6oJiRjxt9
 faXLjMu8lEoatzaQ6RuorE2Y42UbtAOIMPjDPDxyELdWbZn6BIM6vhLjq5UvLWs9GC12ZP78UwA
 StF0dgLpx9wmL0TSQ+z0G0ZMWMnnLWSq8AeOuTMNKNb+GIraSR9SLN5A=
X-Gm-Gg: AYBFou0yOoul4zj12E+EurDuVQKuHu56BcNiYUpAaMOhyTTH5DDHhNk2/fI3P7Zg7Tj
 iknquhDNNSlw5xldFNhEv33XuJNUnZKN73vdjQ+w2clMASuYBhotVhFkm9yZUrEDCBgtau94IB7
 KSqcfEu0R4u8UQ9MoGOLD1VDrKoa/hY/JxijyfRnOeucEfKEg597LkgpylWiNIN1yCQLKpffKDw
 gbvaKz7FTsPmx/l8taYUeSVF/ExAsVsmX37+73Aj88LsjkgW7tAlQx7zYTSZH6F0b/sXuj9aLE5
 KEDcdmOP7taLwbgbM6ReQwRTAmAYPioB7OPHHRJ5oUVHKHfLGQ3JyKEhdukRhup4cBp5/vI+Qf/
 /wjM/Jo7fNALrsvCirkEew/8JDlIr4MY7A7+7x0vi
X-Received: by 2002:a05:6122:1d08:b0:5bf:b3a0:388c with SMTP id
 71dfb90a1353d-5c9f15a1910mr164132e0c.6.1790095838953; 
 Tue, 22 Sep 2026 09:50:38 -0700 (PDT)
X-Received: by 2002:a05:6122:1d08:b0:5bf:b3a0:388c with SMTP id
 71dfb90a1353d-5c9f15a1910mr164091e0c.6.1790095838531; 
 Tue, 22 Sep 2026 09:50:38 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488627314d2sm6503348f8f.2.2026.09.22.09.50.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:50:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org
Subject: [PATCH v2 08/17] target/arm: Access PSCI state atomically
Date: Tue, 22 Sep 2026 18:49:26 +0200
Message-ID: <20260922164936.15189-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfXw/SWf+sunUVH
 llMIy+ocpZyn/gOGT6iOqeSq+IgMNg+n9672ZzQE0mxiN09SUHsyYRxKR1kJCb7Y5mGnTttRqcu
 4fT8YvGxov8lYsqPQ/SeEg5KvQZ11BE=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab2b1df cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MMc1H2EL_fK9NYWBrJgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: W1eL3QSq7LBre6iXs1xudkGL9vP4nh67
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX6oX/TmvEq1uH
 jgJcN2VR4ixW9441Vi/+3YDhbeTV3L/rcsa2WMAIEBEcEhmYS0loZKWHyljs+5oQS17OR3C6Bqd
 b9YG3msO3ZbCVHvRM3P1TD488YXxEcxqLSDQafBtPYTjmQW2YGI2Pqrpb7fhwg1O7llXtaGnpHO
 h+7jQgNtFTf01sUnyl0FLLivTmGill6OQFPwSjvKoGNjmF2kBdQn+gM8DKO/8dp1hgKdOULQw+K
 k0XjYcuppT1V7lhfAqTnXBytzDfTfEE5WRYSiyO+ic0iRwIKHOJxn0puivJkGq3Nqmej2PTJ1D3
 MLYM95swqyNDCSA9ygI13FMd8GdCI7f2TN7s8yUklHeNjYFniVbXdkSb6kj7TTiSdPZ/WrTKrDs
 u+MhJMrK5/pk2AjVTFWQq2bJP3mSGbYS6OYbYdvyzS66jX2+cnE3GCZoWQ5F6spTUqIwWSHPbvQ
 6QII7jfxniKiBon3YgA==
X-Proofpoint-GUID: W1eL3QSq7LBre6iXs1xudkGL9vP4nh67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220246
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

Use qatomic_set() when updating ARMCPU::power_state and
CPUARMState::halt_reason. Read ARMCPU::power_state atomically in
arm_cpu_has_work(), which can run without the BQL held.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/arm-powerctl.c | 5 +++--
 target/arm/cpu.c          | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index 1bd8a549cc9..fcac26d9190 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -50,8 +50,9 @@ void arm_set_cpu_power_state(ARMCPU *cpu, ARMPSCIState state)
     CPUARMState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
 
-    cpu->power_state = state;
-    env->halt_reason = state == PSCI_OFF ? HALT_PSCI : NOT_HALTED;
+    qatomic_set(&cpu->power_state, state);
+    qatomic_set(&env->halt_reason, state == PSCI_OFF ? HALT_PSCI
+                                                     : NOT_HALTED);
 
     if (!qemu_cpu_is_self(cs)) {
         qemu_cpu_kick(cs);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 76aa47ac503..5cfd3bcfc8e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -149,7 +149,7 @@ static bool arm_cpu_has_work(CPUState *cs)
      * Only another PSCI call can wake the CPU up in which case the
      * power_state would be set by arm_set_cpu_on_and_reset_async_work()
      */
-    if (cpu->power_state == PSCI_OFF) {
+    if (qatomic_read(&cpu->power_state) == PSCI_OFF) {
         g_assert(cpu->env.halt_reason == HALT_PSCI);
         return false;
     }
-- 
2.53.0



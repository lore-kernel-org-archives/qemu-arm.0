Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD212C98307
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Sep 2026 16:53:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x93hj-0004Ld-R7; Tue, 22 Sep 2026 12:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hT-0004EC-Mh
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 12:50:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hS-0002Uz-6B
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 12:50:35 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MEjM3o3307554
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 16:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NVL8DScROpX5FRrNBTXD1YKsAIvozSDWDpA2JU39ztQ=; b=ZoOJBd0AGI1LqeNn
 1CaexlAOGlHxB8NI/0SWOnMkfuI6u0Kwu/4T4TFyofiBA1GNEhx0mFCufkcl0fT/
 DIY3j/jPh0G3m5OIqa3sJM3fLRAa0lcrkayWQsY615sRLgq/BOXabksd4s7iEF4p
 IKOm/JWEmYaM3qyRY9yBRRBoitsjjqfCcPaHDEHjGc8el7Ehwf3h/WIegAK0/+gV
 6AanJbP8ULz6aytXgiZX6goNktb7YsMjaMlVeEWtFc2/pYfJ6bOmqWSKohjGeKSe
 w1uF6WhTHlGLWr5IoftLZXFA4C0pc2wP0AjKqna6e6AH0AzSOYdq0GiDwCCGVdY+
 a5DaKg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj1139dp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 16:50:32 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-980c3b71002so12197241.3
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095832; x=1790700632; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NVL8DScROpX5FRrNBTXD1YKsAIvozSDWDpA2JU39ztQ=;
 b=DUvw/vVtBdQ2hmUHyZnhJ1Pt3dv2B1r45QNavY6ZkVMY7ewyhKewP6aZIlwotUjj6u
 fPVTQ4uyZxnt5IEi7pdpfA+l6P8O31N4kBqdOgAJ4MxiuDZww305h2fYRvK4k8OnKILd
 QE6Wn5n9MjN9rLX65ur1jrk8R5fdaVG2e3pEJgpzwFoo58Vt/tumQiRSSBJqO1/QOl4o
 UMGxpCFQlpLK/AHVCdvCkh/F7XJmZYMUIql6rAAl3DxUDeszuL+Aio2p1mi0V0yst/5F
 IhTH5IjKrTCaRimxpkeSHs+egbvfHdPCOrCpwvmzUPC2TAIUN7GS9uqLFAsjbx0OLgAt
 1Htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095832; x=1790700632;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NVL8DScROpX5FRrNBTXD1YKsAIvozSDWDpA2JU39ztQ=;
 b=mBJ4k7uUzIoqTIWTbt30qszYuSmB2DDM2+piQZ5ligUwrOn5AIQjtAIjremRIsd7kK
 +HduqlaI2S/zLWyRawSOKo7/gBXylMcFMRakrZDKNJlpB8EOWNVp5ImlVNsHbcmG4uaQ
 NRYGnP9PDuGxrTNNfV47HBDi/BpyIrVJ4aazWzsH2c1NZsSV4ijd3lJSYHCWgb+JrYL1
 XmiS5XrTT8CR+Mr0/3XR8wPI/KmAgUtZ8tV1tp/dsnTFOINU3yKaLBAjuvY80VfGPKrz
 CkX4BPlkrXDoGLu1/KF5Cieb/Ju27Ig66bNE0A2JaKZvLmsImrN7A4dJndkoTS27AtkZ
 3VBg==
X-Forwarded-Encrypted: i=1;
 AKwUvByYU1oIvw2YTCCs7ZGiPSjSl8p+KAkeXid+1/Ciosotzv6K9d176ThfkO8gkWuX7SLqQNYfKbFmZQ==@nongnu.org
X-Gm-Message-State: AFuF++npL1DLTTalDM+WGUq24vXDG+TrktN//uSbagMAdoY9yhSIBpUf
 0C0W5m0Fjc0yWEFs2d5YZ5EoYDmjZ/CXfecb50hiWGfuGDr7E8x8XAtme7aAyzRGdXFapmWXmiz
 /LcTD2XJDHfwVkIYmNUu6kxkgsKhXPxxLNx8tNr64NTainkX226jR680=
X-Gm-Gg: AYBFou3a26DUUvswHxBioyaMaF6cbhrS+zJVu3r5s0XzYx+4MDFOpkl+Vz/LUZxWL/P
 Tul+3NG+7AeVuRJl77xk/e4VD6jD86bKkcxWk+iHl0MVsguxg8MEBKUItiTnfsPCABf845YZ4zi
 hwjtY34P+Ox5k2W1sVnNILPUQusBJWK+exL1vrh2D0Q1J7AxfEBQhKtqpl99G8lmACeiadfjF42
 zBmdWG0mdgux9FrE84uSWnlEd9j181oBeAM4UqYj6OuYPjoHuiWlMvlRNm2Cx1d1255NdUt70zU
 VkDVosF943yihWKDJJKh2sBc5RsBHcf1kh8hKBtnqgQdIoy1WPJWbvtoFeRF17ZT6ERN6YkdPDd
 1VTblm0HEv1Q7lcgjkzGd8fcXx3VYaOoxYw3KU8BZ
X-Received: by 2002:a05:6102:5f0c:b0:7a1:f7d2:e81b with SMTP id
 ada2fe7eead31-7a55d28bc28mr7904528137.20.1790095831768; 
 Tue, 22 Sep 2026 09:50:31 -0700 (PDT)
X-Received: by 2002:a05:6102:5f0c:b0:7a1:f7d2:e81b with SMTP id
 ada2fe7eead31-7a55d28bc28mr7904471137.20.1790095831349; 
 Tue, 22 Sep 2026 09:50:31 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde199c21sm3642075e9.9.2026.09.22.09.50.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:50:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org
Subject: [PATCH v2 07/17] target/arm: Kick vCPU after updating PSCI power state
Date: Tue, 22 Sep 2026 18:49:25 +0200
Message-ID: <20260922164936.15189-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: G6w9lu9X-eRK1oXYnP2YPkoCGzZoFxE_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfXy40iAaRGSkon
 RmsfapmUWNRThdNOXFH6CzcuvWHnNtAZsmAjzZU1GlXZfEuLMBVSBHsHncy/w9vdaP6UBSuNicO
 iD7MtDQVRvqE4pqEQvX6h0vmxtj3QEM=
X-Proofpoint-ORIG-GUID: G6w9lu9X-eRK1oXYnP2YPkoCGzZoFxE_
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2b1d8 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=ZUU6x_L2PbSNHYkWwXMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfXxRcEQbvKEeuo
 LqdS32zJE1PYhEknkrs3Q3WMi5SbENoFH8LUOU5FbZoqUZxLUSF1MRUFLsMPu57LeeuDgwJG5kQ
 JeWnZEHcbBxNJHHxxRzLceEljbXKFgtPEEeAFPR6vqCjg17Gf5yUOWRtAEa7Bb2v0HhZKWs8MvK
 19QMIfkuAxbPLYqt3663NImyzxXoKRxsm9UH1rWV0LD5crP9kqo3lSFhWhyrLZ+XZ2lSsNPk0Du
 17arfqF04OjrfLl2m6V0wcSbuCpiifP7Lr1h0+tu1ahMA3kspodUL4BCVhMjJuS0ZXwzTdVm/EJ
 M7O/j5xg5PouCSOGYtrzT/MJ+2ie3iypc9jIkfSRyfQoxDWJz3ppPyWsEDjM3pMbnYTUtTdZBT1
 cgfkWfJuU2r+uGQhUEWtq9VuiVPpUpsJ270vebAVqRI+MRxPUlzyvrXTEVd3rzY9ikT/JY88AVo
 JxdCfkuuW7yJM9vcc6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
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

PSCI can update the power state of a vCPU other than the caller.
Kick that vCPU after changing its state so it observes the update
promptly.

Reported-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/arm-powerctl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index 213e7ae056c..1bd8a549cc9 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -48,9 +48,14 @@ struct CpuOnInfo {
 void arm_set_cpu_power_state(ARMCPU *cpu, ARMPSCIState state)
 {
     CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
 
     cpu->power_state = state;
     env->halt_reason = state == PSCI_OFF ? HALT_PSCI : NOT_HALTED;
+
+    if (!qemu_cpu_is_self(cs)) {
+        qemu_cpu_kick(cs);
+    }
 }
 
 static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
-- 
2.53.0



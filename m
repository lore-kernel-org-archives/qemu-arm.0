Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50035CA5FC1
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 17:50:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xByRk-0001lL-0j; Wed, 30 Sep 2026 13:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByRa-0001fD-7b
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:50:19 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByRY-0001VJ-Ja
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:50:13 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHf67f3566652
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ViNswaydJ0+cMUUJ+NzSqjr4UFKKWviATdqXD8YSc0o=; b=SUIj4S1+SZ9m4t60
 GeIS1LZr8qBUi+x3UthfrgBdI1UMabDxOI7gNRYTYsS4qFfP1xDaPViMw71KX+J8
 6VCkKak4JTRUDQgEGE6qYn6tGZJQ+Bn41+DcIQgG7Z2s0Om5VVSa5h6AnMnWyzHo
 JaQKtLwbwYbfj8CNv5qyjeVQSMV0z7mzfgYUVN9g4ZkDJFt9mgLQEaeoYgiYAZOy
 Hv2Gy/rb7nj2lqPcC6zJeQ5ak78pnzTvkZEkXDhxgLNtIjisdpGOafZZvA396ABW
 pseO88zmmUlTjY68umDodhnfJGrjva5ZNEkexhKiAuvvUnXz+6h+X3rPu6Kj8KaQ
 R16yiQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjkysw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:50:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-7bf71bbf197so192133137.2
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 10:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790790610; x=1791395410; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ViNswaydJ0+cMUUJ+NzSqjr4UFKKWviATdqXD8YSc0o=;
 b=FosP0yoSclEav/FaS6u4tAE+hIYqdnsTuFB3NNolncfTr4Lxp7RN+m7M4KgvQYBCog
 5bIcac8xsolxjnvzstyDSlxkKU2fUtOdPIFmzGCxkAymSAwuYOWaB91CY4JejN/tGsUz
 P1leHpd8dx9qdCwgh6g8L6P8LIlxqAaVHxeof8FTs4ZjehzH+nIOxQQgmERNVlCILkwb
 H+ELMCcvJsWfqR/4ahWjBMSxp18/GPcsxMp4BcrCGF0HMg8DfkEjNyPXMV14aQoaxg06
 VP/6lC3lkVRFkEYvB8bC7VkuqR2zBnoos9plIJff96hO1NccPEP0e0N6mEfDBzzdY8ON
 ZRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790610; x=1791395410;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ViNswaydJ0+cMUUJ+NzSqjr4UFKKWviATdqXD8YSc0o=;
 b=D6hkDkhDKOgC/SYvDrMndLjVeCXuUWGesj3Oz6zwPWTRQWZLt+fe/XDQQFcWFcCwWQ
 Qeymdrz0SjAFGNtOnRcVZV7A3FPGY3H8cv+tUTCt0r7Bx9+AVHkD8I+3dRk7/ZNVKNAm
 igi2zBh6JHaTVOOFdTrEccjxz/dOHyFm/JmTCOspqRjZOyrclihb4mKPi3SNYzRmIyOZ
 PH9GM08IPMO85iSmgoZI8esNJJwqTSD1/rGZ/l9S2BQK/mwolh+2HUMjqnsSISZgMLkw
 IIczO1c2dmQO6m1Uu7Z4IF1df8nc2dKEAyKw2aW/uckQxEF4FMNUCwbwGJCMtejgUeAP
 PaWw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzCSUmKyBteUBrtGcmliB4bHQVr8PLJjFpnqElhuOS6ioibz2E7ThvPKoX3nnpdZDlVxltlXLFWqw==@nongnu.org
X-Gm-Message-State: AFq9FYI8G68NAMADSul7jcv68QrdDRTM9DJo4Fqx6X3QhgXYzTmk8tpH
 qqH0WxobOIzv2IGm2TjQ70jGyijwYpNRHkeqD8VBySbEm1PYHtusBgJL6wepuludH2K0Eka3K7Q
 QlVWl1tOi6YMT/dZ3Pu0sOlkqb3fxXe54tAM6bDMavPcL+A5ypl/Ot0c=
X-Gm-Gg: AYBFou2uTvgxu5sw/Y2Z9aETsWvpTg6sw6MgQJTftpuxfB3M7RdKao3lR03N7Toem2E
 dZCb/hLmktL0LctwBPw21uQeHxwYrnnbrz8TLviGrP9OBuBskc54Ti+zHiZBYdvWiGWa2TPLxoA
 dxigA/hY3z/FQymd3ujH2QJpjZTe1qLVMCK9bFmCMdZKT9WeFCg5EGyy1+GyixtL2NfdJU5IOoc
 Ggh222XTYflb9lPZtnrQv/Baprbc/jp81UnptqqMkyU9wbjAe1+gXddkLjhPYaIVSRdoaGQdwGN
 GwlT8gJOv4jqq9dBTgoCe/JoIkDoV7jkuNUylNpRednVqgGLo+snMfVaUQ9sTURM9Jyx/dvsW3D
 EIQMLUzQ7ydBDfhbV3nnT2AbUj1FlYAs56MyZhdKi
X-Received: by 2002:a05:6102:508f:b0:7a1:f7c3:3a42 with SMTP id
 ada2fe7eead31-7be72da8dfcmr743838137.15.1790790610138; 
 Wed, 30 Sep 2026 10:50:10 -0700 (PDT)
X-Received: by 2002:a05:6102:508f:b0:7a1:f7c3:3a42 with SMTP id
 ada2fe7eead31-7be72da8dfcmr743826137.15.1790790609701; 
 Wed, 30 Sep 2026 10:50:09 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b06778c3fsm779562f8f.0.2026.09.30.10.50.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Sep 2026 10:50:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 3/9] target/arm: Split leaving-halt handling from
 arm_cpu_exec_halt()
Date: Wed, 30 Sep 2026 19:49:39 +0200
Message-ID: <20260930174946.82195-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930174946.82195-1-philmd@oss.qualcomm.com>
References: <20260930174946.82195-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfXxjEgAjn1j9EY
 xO/KrF4wXCOwYRIN2MZcgyED7Y0htEJ64jZTEJlOC9otM6WmPNtMQcY13gQlrggsU4NO4xX0S0N
 3hByjZvV3rGjLr3O0I8VhsafONMsF6U=
X-Proofpoint-GUID: ItKU23qlhF9KPVbg9oyxPiSHnmSTOOC3
X-Proofpoint-ORIG-GUID: ItKU23qlhF9KPVbg9oyxPiSHnmSTOOC3
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abd4bd3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=snbnvTbt-5-dSQZ-83gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfXwOWh3wC1LYzt
 pyp8vfSeODaeAlbbFb5vS3aq4eXfAjwNhhxdXYSvhinp52t1GvR3Pb3mBTT4+QFXQAFzX87nxqr
 6Kw5plTLaElSLjo3MRTFNvZqtU6/KOUMG1/FB8KxwICPb0nNtBTg/gWu/gQlD9zLBMLC90g5V2H
 vt/NUv6sFKxTKgevT6HHHzPw+s7IItMuE6uF9NwFgU9uc+2fyqhmQdvmaw//hVn3XalbSfR1lB+
 BOZ1kp5B/vuSFlfVPBu8zp8UJeQnAkq4MhmsbcpwCjdWmrjTwQjNNelqBVdsoJzGoAE6BS7n6Hl
 zNmK4LXRHv6CUr3UZC8wMU07NJjb018XLP5ougPMLsZ/sGZQYkivm2D156Stb15slzky4ZI8s+E
 n5tn0Zob5MQqHTHkkICo9MX9LI75nBzEClDNJa9ehwArfSPmRliDNevQai8Q+CHqvlH3XvYVLJ/
 rrz1MmGTkWK7iHQZG6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300071
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

Move WFxT timer cleanup and halt-reason reset into
arm_cpu_leaving_halt(). Keep arm_cpu_exec_halt()
focused on deciding whether the CPU can leave the
halted state.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 10ac6c98318..53f9a532a75 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -872,18 +872,24 @@ static bool arm_cpu_internal_is_big_endian(CPUState *cs)
 }
 
 #ifdef CONFIG_TCG
+static void arm_cpu_leaving_halt(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    /* We're about to come out of WFI/WFE: disable the WFxT timer */
+    if (cpu->wfxt_timer) {
+        timer_del(cpu->wfxt_timer);
+    }
+    /* clear the halt reason */
+    qatomic_set(&cpu->env.halt_reason, NOT_HALTED);
+}
+
 bool arm_cpu_exec_halt(CPUState *cs)
 {
     bool leave_halt = cpu_has_work(cs);
 
     if (leave_halt) {
-        /* We're about to come out of WFI/WFE: disable the WFxT timer */
-        ARMCPU *cpu = ARM_CPU(cs);
-        if (cpu->wfxt_timer) {
-            timer_del(cpu->wfxt_timer);
-        }
-        /* clear the halt reason */
-        qatomic_set(&cpu->env.halt_reason, NOT_HALTED);
+        arm_cpu_leaving_halt(cs);
     }
     return leave_halt;
 }
-- 
2.55.0



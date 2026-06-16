Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2580CD98E1
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 15:35:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZVoV-0001NL-U4; Tue, 16 Jun 2026 11:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZVoS-0001Kn-MA
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:34:52 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZVoQ-0004uz-9W
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:34:52 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65GDxdBs3920622
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 15:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LeNV1xXFFaZiL+0/3j//h+tIzT2zzLnWROSmDnlwF3w=; b=QtsLKwvUcby0YbZY
 xwVZQIQXHbXx6irjzjKQE7rHH2OSgIIxSuespTapWIeIiToG4jlAkRm73gKaGmAA
 s4YFpupgvPFtP5/RZLdAPvp/lnMEMTdjbFGZga1Vwe3oFVfMcf3NwHABPnIGRyjG
 iEEWOxzDybzsQb9jlAVMEgYzUkzlLoIPqdmU/GL/HPRnqfQn3TVAw1hYE722r3Zm
 b38qnHOEgmPH7Fq7NsrHYZ9lPUM82qj/DhjJ1GjXLSjZ0cNHlDsuslQLB1Xeqy5v
 6Hm1bb4JNHrArjtek1xZehOTFNJTdXysocD73IXbY7nYcrHC+VREKhcUENKyyccJ
 B9nghA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09gande-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 15:34:49 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-966c4d26a1aso479440241.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 08:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781624089; x=1782228889; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LeNV1xXFFaZiL+0/3j//h+tIzT2zzLnWROSmDnlwF3w=;
 b=TlWAQmP5CRTn4zPPD99gPw3w2dCasJdRnShlo9VxDJuCLU0MtoLfmU1FkpkT3R4NeD
 snXRZjXIFnAea0Hy1nZJv3Bb5yDzKFDnMQW53KQAEZ6weWuqXwLsUT7UD52el39IUMho
 4JhkuJlfbgphLexS1uHJenznCxeKEvUm8Bax499lyLnQaAcw5eMbYR5RxDt8O7rX32MP
 aUIxuGwH/72gpBkQC3Ncci6kMEtG69gu29E7jafAg/3B9txYeOUffsHCl/zKyFBC4otK
 wDAQqwWxafj19B+1kem6q15+3FlD/ismnaDjLpAdtpfw2zzj/HbpPncy/DbWAJVz0sas
 NSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781624089; x=1782228889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LeNV1xXFFaZiL+0/3j//h+tIzT2zzLnWROSmDnlwF3w=;
 b=fVXyKcB2ESAdoYEbnvg+wNHGM2B4X3hRrEfr+mvuCkfyZ4NIq2gb7LC7Al/h3sFAUX
 jCpdu4vFQUi3k7tUyP1sOwCmVNJHtZpP2sOdc7cPsLjXOHo5M2HZqwoReauITCvrZ8A0
 xbAexZG+tB3Xp8jK3h3ulLw0D5zTgwHvvGgaf85Hfk7Cz8CmE/JKoULBK5l2WJF6hm3S
 VsksK/ZHzUR6IEwmo5trkC53lR3HbP0Lr6PCwHR/N+NhBcfUkRQWlaFW+XMShuzk1GJa
 NwTZ9KhHVMv9h+f59qlrC7HYG74+5WzIGZB3/izEcNdy+o5e/qNMQkNoCdU3wMoBpCIN
 YKJA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/okdC0RdL2c1TBhRxm2Vx80iOA2Rm/8U794fDArRsK5PxZyP1kZbG0zcE2ucBEt7H7fakirWpK4Q==@nongnu.org
X-Gm-Message-State: AOJu0YzS6tZiGFPeQ9om0KbHSro198Uc069YSV1v12S1b9rE1rx4YPhI
 OXEC6xrLW3d8aReLKH/gbgogXSUkJDWuTh4laFkBwLHHbKh4M/uPSakFzW72RU8Y4Sq1WjrnWyA
 zb0nKG3VXAFRKeyjHq7onipbJBzu5F5jzyn0pzX9ttQm1FywCQFJAKp8=
X-Gm-Gg: Acq92OEW03K+VfzjNaXB7tty4CxCkh1Ye8LLx4W5riGhg+2Ci0uIjJIJ4qtDrGCSJFB
 LyXrJe0nF/HfrcCCoAZff/Kk6cJanwbWHTeKhXBreKltEE4vnS6GZ8CevDqZ7rjR3JUBOux15A4
 aw6YhFJwzxgpTESHP+R3Ma+1T4/mKueSpPPlwKBJrCxXhR0j1zFtPRXxMiksZ+FdKRL2oRx0avE
 hxhdwY4KYmZDQ98rWAxuz8a+ba+HMxD8cQXf8MaWE1jlTMEsoGMJ4WEBDmqK/O1Sm8TAJXq7UHY
 R1vIy4NlsqmGAn8fvFrRR9Zxe52gkOENuFB3E5f0lVvb5WCcwnddoFBWGPweY4XWWUEazYzdFOT
 ZZsd7+t3/rMzIpB2PVaReqIoG4IA5VZCQ0AVXiZlmJu8pUC3dnds791T4/91FiixXBdUZImpRV1
 hrcBk=
X-Received: by 2002:a05:6102:915:b0:639:43f5:1fdc with SMTP id
 ada2fe7eead31-722da9a9bdemr2026554137.26.1781624088724; 
 Tue, 16 Jun 2026 08:34:48 -0700 (PDT)
X-Received: by 2002:a05:6102:915:b0:639:43f5:1fdc with SMTP id
 ada2fe7eead31-722da9a9bdemr2026491137.26.1781624088277; 
 Tue, 16 Jun 2026 08:34:48 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2ce361sm43497826f8f.31.2026.06.16.08.34.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 16 Jun 2026 08:34:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org
Subject: [PATCH 2/5] target/arm/ptw: Restrict PMSAv8 code to TCG
Date: Tue, 16 Jun 2026 17:34:28 +0200
Message-ID: <20260616153432.92939-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616153432.92939-1-philmd@oss.qualcomm.com>
References: <20260616153432.92939-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE1OSBTYWx0ZWRfXw1yg23HttdIN
 k68kFxam8IVisCt1HgJcU8HwsIRSSr3u2r1dhxAigkSgxYSLBaYNroP7HOYiNDYTiikQ53aX4os
 8gJ22uT/lUpBCgYhyJWjV5XnYjJvkm5ksaAOgOJ+Wz/mGYLk2bYN0JYHq4ZPPQr0osLqugB3NBx
 iB9g2SNFndpIlmzs7kOMBNmmziy6BkpJJh/b8tGCc9hMR5EXEoEMmT4aH6lPvJmWDLomqL82Vni
 Tz9CxA9GSRpZrNpZSnbu9HihDsSy7bMs0hGnOYpi2bvaAXbqhLEbF1ljlJwWYp5TyDzKYRZMfDh
 pJpn1POEJ8eGNQdRQ3zsMtxsAcDdNcEd1JlT4G6Cr4/h00uL6u31Ibn5u+xc2I8w+6PfjTKci/4
 duz+mMkOPUQC/dJ94Z68M9vbiIA9Xs81RvZ2xjXqtMdhvc0gixyCyvHurrm9KDKeH6CekT6ROop
 uqimolvt8cKuDFaMQQQ==
X-Proofpoint-ORIG-GUID: Q3EWbaAkf7vZ0snPl4TSeN8grVFdVuYK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE1OSBTYWx0ZWRfX9M9VDGUU1mvl
 PrIvqO6Cx7SdzioP+dH0Blfx8y0DBkGJrX4mP33JHjzEQm9TWFwHrt2J7t9A842fdGkxXHDGyZU
 Xodh9c+EMrZPB7xqfDb9oOoFiZ/G+58=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a316d19 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=wSUaFbrerrTpWb88fUQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: Q3EWbaAkf7vZ0snPl4TSeN8grVFdVuYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160159
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

Armv8-M Protected Memory System Architecture can only be emulated,
therefore restrict it to TCG to avoid compiling it on hardware
accelerators.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/ptw.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8b54018c988..1470de30108 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -13,11 +13,13 @@
 #include "exec/page-protection.h"
 #include "exec/target_page.h"
 #include "exec/tlb-flags.h"
+#ifdef CONFIG_TCG
 #include "accel/tcg/probe.h"
+#include "target/arm/tcg/idau.h"
+#endif
 #include "cpu.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "target/arm/tcg/idau.h"
 
 typedef struct S1Translate {
     /*
@@ -2818,6 +2820,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env,
     return (ptw->in_prot_check & ~result->f.prot) == 0;
 }
 
+#ifdef CONFIG_TCG
+
 static uint32_t *regime_rbar(CPUARMState *env, ARMMMUIdx mmu_idx,
                              uint32_t secure)
 {
@@ -3247,6 +3251,20 @@ static bool get_phys_addr_pmsav8(CPUARMState *env,
     return ret;
 }
 
+#else /* !CONFIG_TCG */
+
+static bool get_phys_addr_pmsav8(CPUARMState *env,
+                                 S1Translate *ptw,
+                                 uint32_t address,
+                                 MMUAccessType access_type,
+                                 GetPhysAddrResult *result,
+                                 ARMMMUFaultInfo *fi)
+{
+    g_assert_not_reached();
+}
+
+#endif /* !CONFIG_TCG */
+
 /*
  * Translate from the 4-bit stage 2 representation of
  * memory attributes (without cache-allocation hints) to
-- 
2.53.0



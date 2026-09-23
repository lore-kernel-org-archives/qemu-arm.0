Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E1DC98302
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 17:15:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9QY2-00070i-0v; Wed, 23 Sep 2026 13:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QX7-0005yd-AJ
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:13:28 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QX5-0001I4-J2
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:13:25 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTZEl595312
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kNtz7Wsg4/5oYhsduTgWMHFHx5o63oBFXK1BI+bPv0Q=; b=HAREu84GgSQzQC8F
 hsIPKrtpjf49b/kXo1YJDNYOmGrKQRoi9wUcyoLsGHcZXGKN3zzGtgGDbNH5xx3v
 pyYIQBcNIZZl5UfG0Q+dOAU0FOgVkF6byXqEmbQSSEf+3Djk8UsoHO6k3DB0AvKA
 tRxwWmaEd0ckv28/5XQwA+0+6Txlo3sp84Eqsbg2+KpUStto7SPTSyNAfP2rXrL3
 Nn3Rw+v7EMCBxcAnR14YhC8ROe5PR+NSW/YSNYXIWbMReXeDcyoA62ysMeBAeaDA
 T+PNTbWdiw7azppwISYvRNt7qGXVWYnKDCP2RIpHcdQzE29n9GHvpkAO/xHh37JI
 nkarSQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxs3k1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:13:12 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-7a9378b844dso413462137.1
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 10:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183591; x=1790788391; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kNtz7Wsg4/5oYhsduTgWMHFHx5o63oBFXK1BI+bPv0Q=;
 b=IlHH60i0y9lSMQLfqYQfIkZgO1Zqs3WoVMsArUHKFXmLqOOdNAm2Ecj1XePk6ltL5C
 CSdSH9HQjG4eFRZIqHqJQtrk0DSZ870ZQHl5ywTt/gIj7hO6wk2iK2ZyQSkWfgDEMhtw
 ZBNaC/mQc6FlPgF5nhNYNi+IRochMSajmu8ofRAOWKPCj67gWfRIIKBlO5DwRVQu/UnV
 zsinZBvwcp4MTwEZkbJoPX2XDOQLZe5boUcksQ/kY6FPvVJefWbS+QmDjNxfYW6mFWeR
 2Vq+FbniGIo7qsvla83kFSDcu3QzVLQThT6SYHDOq7/2anuWXLfR0/u47endysfzscRe
 AMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183591; x=1790788391;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kNtz7Wsg4/5oYhsduTgWMHFHx5o63oBFXK1BI+bPv0Q=;
 b=fzPW1Krrzi8HGL3qpZYgmZswVFLirxvaWxpifmhcP2Rk0Kj0eP8gKuOZysPmYF4/Mq
 nQu8cI286VIMCNTXPfMtJR0RpAUYd/CfT+RFUE9uKuRwv8NMpOt6SMflPaJFbliMuq6o
 NKUfl2bYUDDq/pjk09HmrvqVrdKgBKduAuuGSwmcyvWK2FICm8DfqiMkkZGTkAZ79uqn
 xZ2NvgFnmSSZ78jth+8Fc+DBirwyrIUZmSEk4CZodzy349ZUiPM+k9RA7nnBizECZ701
 rpRW5+RXeFsJ1zsxlGHDyGLd13UB6CVuFlPk48fcfgGMw0YCqMpxyKAK9Zf589iaD3Yu
 xxGg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxcgGeiQvbN/f2smriUqhOYenEhec+fNYZpbTmE/rWgQa/+K4UKjWag93nXFAJt8/poakHFqCbK7A==@nongnu.org
X-Gm-Message-State: AFuF++lrCLLt17wqKw1192kDEr52Q2clxyHAaT6Oi3d3qdzcMIPA36Lm
 hbAokwnuXlz+S/KHt7tOX106qHPrStmkIZK5e6PhwdUecMM1jhB1o/HU53md9VSciDF8qKGLMah
 y14chcDVLt1oVz9nfHBoDz4E2XpPqq4E23XIBr48tw5OglsYTMV8JWwk=
X-Gm-Gg: AYBFou3qMEJkwOzYMrMh+JrpXhtcZeEMcbCVjMabKDZ+RI1q1wEOlyEf1vFoU7Ve3ol
 1rthUSMO5mAEIqa3XEb/eXlsc9/v4gZBWdG0SypCWg0pqMevyXfxmYLOh8VWYiPV87PTPenHZX/
 N4wpX81ng9NrGJY7+JOymOOggWUP6R8b22JcdQVVfSsh9jgzbw5qHlb7tdI+A7jTj00yqXEVIJh
 WihhZNrSV48+GvelwPSZcKnHnFEuM+r/geCy1Lny5sdi8HWuQn82uLCgeGFOgy5UJZ51+K382g9
 hF529KPWA8o3qdkq/noG3zlFJy1x9pnpsw+qhvAxhCzbinmKRLzag0LH31dDYqv9/T20EV78hkp
 FS+qCeAfLpT1Xlaaq2ZxPgpDh3MoMHYaaixHa2Pl1
X-Received: by 2002:a05:6102:5121:b0:7a5:4d80:a913 with SMTP id
 ada2fe7eead31-7ac1abd2294mr3118744137.7.1790183591121; 
 Wed, 23 Sep 2026 10:13:11 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:7a5:4d80:a913 with SMTP id
 ada2fe7eead31-7ac1abd2294mr3118728137.7.1790183590672; 
 Wed, 23 Sep 2026 10:13:10 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5cd4271sm926755e9.5.2026.09.23.10.13.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:13:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 15/21] target/arm: Split leaving-halt handling from
 arm_cpu_exec_halt()
Date: Wed, 23 Sep 2026 19:11:09 +0200
Message-ID: <20260923171116.31276-16-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PmUJYFnPLirNvb74rtkgA9s6yUWRwbDF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX3M2vIe/uFewa
 Q1PMSL+BntrQaEYCa2XcHCZXiPGWHBRpjJ7m1mYZaEUgwi7iRAuyl/pD6bhB+7R1dfxh9Mf7TrC
 ig+rEegB/EkpWdlDgoex3pzUHoaZklCGPCXinLJJY3keVAynHZniLnBsbFPL0c1n/UeU9YoFEsS
 9xxpbXwPmlD0Y0662h2j2jmuDDr4AuD/pIX7hf/5jVNGTVVMIhL7ZkK6gM5jsc0VEJQcBqpiR/I
 NPYd2TBhl9MMDGOxJlJgvoOBtl47Zho7Q+l7oqBQMioOi1jUQEVIXT52Y4xgCCAjXtBb7qpeT+u
 sFseK4gP1G9ZmaC7dXYV5+tsyw2v9kVmmJrjoAjjRftx3Dk1oJI9nVTAZEJG+1qmbrFd/IdoOcL
 qO06dmY80sUbkQ6avmn58QB1N6qPMblB9YknNbBwUt7tm5JPTSNnD1jC+UDpMVnDA50y+DhObK5
 30u3dTBcdmNxL5s20FA==
X-Proofpoint-GUID: PmUJYFnPLirNvb74rtkgA9s6yUWRwbDF
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab408a8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=snbnvTbt-5-dSQZ-83gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX8akQmwKL0Gei
 qdJH3b+PaNFTOIT83NyI8TocR2JelPUrBDWWSzt3I2ZoleOODSJF23W4h0h+gwJ/1MFMZGImCEA
 CKpBxNowd6wE2AqyUBc2uiVcdXlFGL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
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
index 090470da40a..0885a8eb03e 100644
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
2.53.0



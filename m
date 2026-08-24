Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1E2C5DF81
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 11:21:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wySiW-0006wR-S2; Mon, 24 Aug 2026 07:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySiU-0006rL-VV
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:19:50 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySiS-0006DF-LW
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:19:50 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99D8J2900648
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=; b=bDe6C4ePFwR41eEm
 pDTm55KAgANfLUXKPDOe1fxBTHtMePbdIWSrJ3PTB9OZ1PB5x72jiC5/wZSmvmH3
 /WNkMrBW6zA6/s9O1hqEtfPoM8qFVOvrMQw+5ynR8NQd5alHO6S+2jrhwPg3lmu1
 2SwFNvGVIeel+TICBX63wdfelV9pt5YMUJmQkXA05rfQ+t/S6iJpdiA/1nbD1uJR
 UrmXizRbO3HcU6beT3feDcbyPBICFlogdpvT9jljwlgTDPZ4Ir3zuCzpOUmjJ2b0
 VUhBB66WFrcLp5si+I6wHFuujkRD18FGgmoAR3+FG7eBgTus+HPaHr4AYm0VlzDJ
 BClVjg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgry3r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:19:47 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-9778b29c71fso3250542241.3
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 04:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570387; x=1788175187; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=;
 b=FAjcxkeYhGTzVK+SgOKEnFIOCahoNzGpG/2uLOcK6rTAc8ZS+8jqANnoV7mk5XXIVj
 xgTl39+v3rFuK2hMr/tYeHTRK07AHoEACFMuS64mnopcKRINyRR7Dh7phERIfPmngK7r
 e0aPrJXvK/MZeD/Bj4+9Cza+vDfCb+kqbCQn2zE5wymoxFEerZhr4GYdWZJWrWW4YCNr
 vbrfTm0vLER7Vr+E7fbDCxdjVd6VwhXbQGB6ZUWoCoqnlhPAFa7okXZBtKHAq6zQvsHf
 heWSRJaVVjvOeNmS65WHiiSHPZyr+AVM47MucZakyUN8BX3AVlFKha/tvgFlJgNcCVCD
 hJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570387; x=1788175187;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=;
 b=FTgAtu9jPf0XmGkD2ZvZWgtzjeWpMsF9P8ciaBPCjaaHaTBJZliQ7A8EyApWCd8531
 LR7joWciNWT9uiVSzHlDcVN2EBSES+bfxa3fLhrHtc8KoUNrjBhL1g+v5FfbsrrnIJDW
 t0kyK/yKJBPMeTz+lhKS74MixTLzBGLRi1uK/PZJcDKnPq4oLRjfltWbWeBuD7FGanqr
 6UJyaCDrnLbfM0PPeBduZdNim36TuFWv1dCaSccNtWYyG1m+EaDgy103Ux0WDFsU9QYl
 79pL0SzK5eTGOfePdR4cpzyi4qYuGLDiS8JacAQNpsmiW1wH/Q4AcQcsOemvy7mVHobb
 KMJg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr0J/s8MKheK7o6Msfb+5VSrxgz8t5CEpWz9tmXjJ3/3a+rSAT/wHPOWucGLaRfe3WxlfT4fbVsig==@nongnu.org
X-Gm-Message-State: AFuF++nU5ddnVsZJq96JW8yE7dkuw3NTIwHKnXfPO/n0548uNx+yr8rG
 +IoRc7Bwb0b1OJcTT3q2Aj/uJ94IVv57dTUMJRDNdv6AKs5rjZrlp4n+3kHOkNER+SEcCPsSVME
 E2S7IC3oZ/685vbFOd6+1T3VLmhpfL6Q7KAoohZ6mFRqnqXtMhC7/6GI=
X-Gm-Gg: AR+sD128Wx+l3ut02gHHVNWzMobq3uIL4jEPWN2MFCRbaiG7yAJl/9dz9bSSWvnQnEn
 nNk2YyWrXoi/pOJbVTAiFA0BX+yK6I7f7gZ6qiD0lX26AqB8LAR2Z/XFTXslkpZqklEprbGJYgx
 WPdGHl4ghgBjLh+0WPy4FKrH/KJdcf7DdgYHU88+Sf9FV1cNhXu/dbfNxC9i09dJs3xGVlqsjd+
 oFcyXgO8NsURl1bd190xvlibU4jhPOTm3Zovjg6ya3osF9ynNkxNOhKlnSm7n23WuFTUbPqMIDn
 NxWSV/xGOrAGYf+q0jhsZC1XnzTXZ6U6x3tlyP3eh4AUHjwXTtCOtX5gZ8s5by4NRVhEp4sTv21
 Lg8LWCJug0QPvDJkr5mmmM9A4yXJ50X5sEc0W//7z0ua4esv94A==
X-Received: by 2002:a05:6102:570f:b0:77e:eeab:769 with SMTP id
 ada2fe7eead31-77eeeab1417mr1194119137.10.1787570386769; 
 Mon, 24 Aug 2026 04:19:46 -0700 (PDT)
X-Received: by 2002:a05:6102:570f:b0:77e:eeab:769 with SMTP id
 ada2fe7eead31-77eeeab1417mr1194090137.10.1787570386397; 
 Mon, 24 Aug 2026 04:19:46 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e00129fsm9817576a12.1.2026.08.24.04.19.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:19:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v4 14/20] target/riscv: Constify @iprio argument in
 riscv_cpu_pending_to_irq()
Date: Mon, 24 Aug 2026 13:17:03 +0200
Message-ID: <20260824111711.26297-15-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX+vDQMNdDsh4k
 w9tGxj7RzeNRXyD60DfboAorPanHilBtO/qdvE9AGQy1ESEmArFLvq0skFB4ua6iki7A74JqT/y
 z4RW0ustXczdaKj8ad7BWcerMyMhSEk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX4eq7mQTgDbpP
 ZzQprukzo6sxijJfUG4Kw1V19+L/p5n43PPfYmi+Q4TfQH6Q53IcvqGOZIYKXnOb9rcJCczhLa7
 tfcIQ9XVQAJ01cOtnoIt/QlOvD8EpZI5K6WZ1cmTxic8Sk588taqMm/HuxhjsuGEQi9jFXpg/VS
 I7uASgfFIs62k/9zPZpGoh4wxhJleA1vWE9nS6QO0urQWzxREwlhkpekNTXVAPbhTQDV/Fhcott
 mVQJ60GcD8uJVWnOF34WNQHSV1AcBo8BG6qYq1V37e6aUdAXCYR/+1s6oVMtuVILB/TPDM8lxgj
 QjnuwBzK7V6MYsZSu4FHfcMjDhgMIZSCLBvWqTMLXJsLt1tbROn0n99DYXmXbbGtrO03Omp0iW7
 s/bFz+0yAVYWk5oNOH1HvndcXEFqJblQc6QiuoAvphl2R0FktUZRLnieE5jBDy5lxop++FJCJc8
 466RbYZ/MDNvC/URGLg==
X-Proofpoint-ORIG-GUID: nFSnHmqShQPizBgzdvnDa0iYFw9mh8CX
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c28d3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: nFSnHmqShQPizBgzdvnDa0iYFw9mh8CX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240094
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

@iprio[] is an array only accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/riscv/cpu.h | 2 +-
 target/riscv/cpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 376cff656fa..bb4c8563554 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -642,7 +642,7 @@ int riscv_cpu_sirq_pending(CPURISCVState *env);
 int riscv_cpu_vsirq_pending(CPURISCVState *env);
 int riscv_cpu_pending_to_irq(CPURISCVState *env,
                              int extirq, unsigned int extirq_def_prio,
-                             uint64_t pending, uint8_t *iprio);
+                             uint64_t pending, const uint8_t *iprio);
 
 
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7bf098319f8..858fbf865fd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -866,7 +866,7 @@ uint8_t riscv_cpu_default_priority(int irq)
 
 int riscv_cpu_pending_to_irq(CPURISCVState *env,
                              int extirq, unsigned int extirq_def_prio,
-                             uint64_t pending, uint8_t *iprio)
+                             uint64_t pending, const uint8_t *iprio)
 {
     int irq, best_irq = RISCV_EXCP_NONE;
     unsigned int prio, best_prio = UINT_MAX;
-- 
2.53.0



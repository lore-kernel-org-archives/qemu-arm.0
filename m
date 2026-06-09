Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED00CCD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:49:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4Ih-0006aF-7v; Tue, 09 Jun 2026 17:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4If-0006ZL-Ps
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:47:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Id-0007zK-U6
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:47:57 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4Ev63229764
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +CQfLy57uQUZv6YOwm3fcSt4U6Wju3R1AryozkMZWbs=; b=PQJ9Gl2usaV/21Ht
 KHijJ+8FCPiDw3gDJ/Vmc9b5mF/56sq9ETxXN+DLkrSnBDDV6sQIAM1Jpy/XO+tI
 NKxL45Exm7JlvNrr3wIXRvqqeeqSKfgrwLJ4Zph348NCef61df6tDf2BX7BbSj26
 4Uv1p+d+uBHZiu/t1yz0jvz5rhKtTmzoz198n5r2DiAcvV8fpFL+oleIpxgaO9Fv
 6Ol+gNk7YKjvnFjAYrCPOBH0N8gwMybVqh3ymsSSzbyVBBji/52ztlFWq8mYSJi0
 lEcNCQ1B521r+8eiCR0yXgrhrcJO6YiF83f472TSIjCa7Sy3z/4c1CkAaoGmziLy
 FaTGaw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgkxpa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:47:53 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-1383723dfddso679551c88.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041672; x=1781646472; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+CQfLy57uQUZv6YOwm3fcSt4U6Wju3R1AryozkMZWbs=;
 b=F2wnCkH2su7E6hPkKCmWUB7ttCsYcKcU4dVDhlPm6Z73nGxSnEkzVTIStXri6YcI3H
 O0f67ORphNjiBNqs6YUwZloi7st96tQO6mbhn2/vHbNBi5MqsY4moo9h+qBh0G2O8Af2
 oMaQX1Om7wiEfoXPL+iWyn7N6Tbsch7YTb10jJNWGJaGrpfVVzYwNnt4qyT7Y8J/X5rr
 Gj8iz8dyXEMPL+pZkQ3oAGR/nIy6GVHIMjLnnIU2y0IktzfBX9Fy0ORAsF+nqR4sdwmk
 Y/z3xfqas2klSgyLsqLRcZEsB3ETLlUscfeXJfedGoNscxz5amVvEGhPwOAIoU2O3P/t
 rZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041672; x=1781646472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+CQfLy57uQUZv6YOwm3fcSt4U6Wju3R1AryozkMZWbs=;
 b=NK1NkXC0DrKP50JfHpm2/b36mvC43A1rlNhgrRaFIAnEQFDoS4TOqOzgLytsRLszQb
 kuG4laaS9wNEaVEtRxDGBqO+miX1KeUR5S3VqbpeQirBgxJKDnOWBQqDrnx7lRX20HSk
 de1uZav0fAp4JIC77UyXGgZj+pma4Ag66kRhsA2ptgcMYh1oJytphfIwrCbz169QBN37
 S2gNGtJoLKRbvuN9N/y+bN+yDQzreiQbKeshxSIG6AHx2h2AppmEpu1mWlpkCeIPEEM9
 cq46+OOX9B5GkUTZgSTXF9hBjLiedUcTxAduboIq+lII8Pe2JnBtY+OEYG6C2XyLlyYP
 pz0w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+L9CVNr/nwBWei2Ga3KaCk5HMiEqgFAjDBlR7eT1FYtFyGrK82IdfplGgDYKUdqDJbDHl9pqhqgw==@nongnu.org
X-Gm-Message-State: AOJu0Yzfec3YHgX/vEzIh7zHSmX2Tk2m5hp5uaidC+0Dk5y4cofYRpQy
 4iwOOCfJb7joIVI9tc+oCriY/6bHK0p2ULGwVzAaSSbVx2x1EC8tkbBktNLiOk158r5pgGub9xe
 ya94SiuMX7arz4drZSAAVIgNZeoSmYa2AYKhWQ/1L0p1RbEG+ehwXTA8=
X-Gm-Gg: Acq92OFlpFRtM2XCVuFM9qgaIdRyJR/leWeBiv2+rdq2r3PaWzuGVjXidJcc3kduHYc
 ZLS5IoN8gNeYBRVLVCiWcCCtU6Q5UGQqjHnyRFFbNQDocnRjbcpGFKNrjEudKa4xwWsD1ABvmQh
 BJnbefUn8UuQAyVrLFlcSAyrvScCNiiLef2NDIT6kctL1w8Jj3gI1dzRtY8A8Z9d9edAg40bb2T
 3+JdSLLa+TCCxzvusUnLlAuEruHl2NX7B1On92GNWid2HMJ/8ylgP4wMLPqKty24elwHQqC46KE
 0UOWZ7mwjk8dLXBmo7sus3GfZoIOOyJf9eTGnSq3ipb4pl+KqGTzab826Rau7IMVCJ+01uvUK70
 +klO/d0hfqUKruG77eXjW+i2je9/YV1jgn3vA86hVi8k4M8nLwPizFPfqv5JAV8Sp3n9tKCZhoP
 ZDfuMVLbgaShJptZgs
X-Received: by 2002:a05:7022:b9b:b0:137:f958:c072 with SMTP id
 a92af1059eb24-138066dfd6emr12645951c88.20.1781041672404; 
 Tue, 09 Jun 2026 14:47:52 -0700 (PDT)
X-Received: by 2002:a05:7022:b9b:b0:137:f958:c072 with SMTP id
 a92af1059eb24-138066dfd6emr12645928c88.20.1781041671922; 
 Tue, 09 Jun 2026 14:47:51 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:47:51 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH 01/27] tests/tcg/multiarch/system/memory.c: remove unused
 variable
Date: Tue,  9 Jun 2026 14:47:19 -0700
Message-ID: <20260609214745.772536-2-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNCBTYWx0ZWRfXyalzQ7s+EcZH
 HvcSr0+FIdYZO9T4nZQT5yvvw/vCZZ6y18RjDqt9WEi2js/MxsrNAaM8RrERiNrhin073JtFbPq
 K3DpH+tuHurvJir18ruAks8aXnlY6/JmZF776q6lGozIOrbPjafv7iuPbWqMzxwh/tamNbMt5ir
 BbYINbctJcMEp6LVQPugQCKpUUicrpj/L1NkSmLm65h/kFuzM9boIV03b1w2DPyjL+7pgvLD/GN
 GyrvC62trmy6r0+rKaBaC9sW9BJAEa5sILwUO0l0z6VCABLnukkp0DDsAYuofRS+MRCDrcJ9oFG
 /A+2kW+IuT/KoqFqbHziGAD4E4O0fo9QSl46bkvzXUUbvFIq4Fltt32Nx79v/xW32xz8trrxuJp
 uZ6coiuBNUkMxHem/Hb76/8ohaUpXqZIGpOP+YfG1P2fX2HyJ8d8LJwcSl+4vbhqMlaPJe5aO0O
 Ggd8op67Bo2FKh4PHdw==
X-Proofpoint-ORIG-GUID: ANnYg83y0Y3SlLpqOLAc96RBJ87t1l8A
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a288a09 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JTcmXR7GuJmo16mxgnIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: ANnYg83y0Y3SlLpqOLAc96RBJ87t1l8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090204
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

Caught this since by compiling this file with -Wall, -Werror.

../tests/tcg/aarch64/system/../../multiarch/system/memory.c: In function ‘init_test_data_s8’:
../tests/tcg/aarch64/system/../../multiarch/system/memory.c:97:18: error: unused variable ‘bottom’ [-Werror=unused-variable]
   97 |     uint8_t top, bottom, *ptr = &test_data[0];
      |                  ^~~~~~
../tests/tcg/aarch64/system/../../multiarch/system/memory.c:97:13: error: unused variable ‘top’ [-Werror=unused-variable]
   97 |     uint8_t top, bottom, *ptr = &test_data[0];
      |             ^~~
../tests/tcg/aarch64/system/../../multiarch/system/memory.c: In function ‘read_test_data_s8’:
../tests/tcg/aarch64/system/../../multiarch/system/memory.c:384:14: error: unused variable ‘ok’ [-Werror=unused-variable]
  384 |         bool ok;
      |

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/multiarch/system/memory.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
index 7508f6b916d..adc7ac60c1f 100644
--- a/tests/tcg/multiarch/system/memory.c
+++ b/tests/tcg/multiarch/system/memory.c
@@ -94,7 +94,7 @@ static inline uint8_t get_byte(int index, bool neg)
 
 static void init_test_data_s8(bool neg_first)
 {
-    uint8_t top, bottom, *ptr = &test_data[0];
+    uint8_t *ptr = &test_data[0];
     int i;
 
     ml_printf("Filling test area with s8 pairs (%s):",
@@ -381,7 +381,6 @@ static bool read_test_data_s8(int offset, bool neg_first)
 
     for (i = 0; i < max; i++) {
         int16_t first, second;
-        bool ok;
         first = *ptr++;
         second = *ptr++;
 
-- 
2.43.0



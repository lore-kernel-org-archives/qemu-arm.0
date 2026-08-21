Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9367C5DF87
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 10:54:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxMqw-0006X3-6l; Fri, 21 Aug 2026 06:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMqu-0006LG-3Q
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:52:00 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMqp-0003ih-2m
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:51:59 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9LvqQ2006097
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=; b=LZMRBur2BnzdxrxY
 WQ/HJ3LO1jCULINRSgYOR8F8XzeLbvRpc6icFlkKM8qyHtST9VvaUNehZE6tbzTk
 Lsxn6lIIr2YW//SzudAjFITBT/HadmKvuoSX4mlCwyf2CN1AXG7f3QtjG41W+o4D
 5kdSfP/nXYGdB99JEvRxtIrKUSkBmlHMa2VrpdD0KUEnHPqC0mwJczAVCT+GrGMX
 JBwfS3ON0HNfjw9rvnh5b6Bccm5NPAjiQkAcFlHjvG/uJ3+iCvsnzj7w1UyLxL35
 Ud2SRu8Yg+x4mQOgJO+yN6aC2Jc+8Ks/B86qGO9x/s0gYk7vt9BIJwkMzQgQxfdd
 nOusGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddh687-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:51:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1d137a68so16015201cf.3
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 03:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309497; x=1787914297; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=;
 b=S9s55TfHmpSCjP0KMuM0xhYHhQvkRtLz2rH9pfjl/5HE9F78JLC5/o22mfhQofcwZB
 /LBXB8O+R740ARThm6wjFrYZ0Puob8oKvd2ZyG6tvQwb/VlGY9dZHGUkHL149M7TZWZI
 w9btRHPwce5zaqKhfGwTl2n9F8fzCxBeFXgl2b+/3+QKsKGrj8t3kQWo/RLv2zNdCL/i
 76Gen2Nk5UlyQRXGLt0XZHQDkjU52pKtwXsBzgY/jqn+ejXLxKh4MsCCESO2gcQyTBEi
 nKbaYgqSWxNevT3lLQ6ypL78O5RtGIBkyebF5fy+dRD5q+8ybgNICuArd17S1BCNGEbE
 yJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309497; x=1787914297;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=;
 b=e+3uP2wfbT41KkcRpwDxVEWKHzE1/nT/LtsqXjNFI2mbNgSFC4lEMSPzWW+X40lSqM
 smY/0/1k8tQ6fv20DNZbU78M9P/TmTXGorlnKnTcc+fysrCSTDw5Fq1L7HEXnwVtK9dP
 3h10EZenWpgZogWxM/ZyeAzCjBdyn3wvRsvouNT7zRFQS3jnUdiHqmjfC/4Fv2hD9fG+
 FYoLrNTE82qTVtBL/KSrg+jJWg0RuNBXsoOBhzrffhsTkSYgw+4NGf2t0y/MYg7uKxB4
 oq6HvRF4EWJtU/VkatFYXLLjTV8f26n63Xa9vG1Jeqm4DVPgFBhemPeUzsNkkYM0I29O
 zj1Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoxKofs9G83wJfsQO4NiBnb/wuJuHcCZq+2lCq5AtoyONl5vJ9RRIwOUBwIIVuX2Osad/iJauZZmw==@nongnu.org
X-Gm-Message-State: AOJu0Yw9jVLTP7WYfdp69IZDmFE8kU8dSEYdKUoQ+pMoGoS3GEXK28se
 omOFuneRpHF3y3vzHXA9LjOBtiAehJVNYB47VYDZ5NY+hJARaUOpU7Piia0NTHhoOeAsHiK4+uA
 rdbEu6fNMNnAf7uyrSOhi1HNsdmjjktmeagkAra72DjGNzwz59xcDW9w=
X-Gm-Gg: AR+sD11l6Ia7Yd0xFw1KFJHcP10PyK8LQTIaR916hokJI6xE/9pCzx6yLX0/Vu9fj1T
 nCQSU7yXxzB1W2m8X0CV/JUnKdgJ5yFOUmK8EF6qjW27wjRU+mQZHkLBnz/WYs/vHebmPooXg5+
 cfYKgfpZnX8azEoi7RWWzrQPc3MEI0+8LjLAIwOaVRFTFfDXbMQDj1us3cwFdXcq6B8H6+UXz1/
 NVdfIjA3WYlQvMuJ9vQXjyrZqnqk+VE9Uh2CPzEsrCHuyEXpt7E+j/BB0F93PN7HFYChLl6ISKJ
 kt7R8bAcifOv8OzYd5lsMMdZQqwXxFMOsIQwRkxZP6h1ZfURXK8HKpOTWpi3a+CV2nl1QVTW6vX
 PYj7QHJB6dSJnfLYjb/iZ/h1rcJ0JClNjJsZmQh7XbQ==
X-Received: by 2002:a05:622a:144c:b0:517:a7ff:935f with SMTP id
 d75a77b69052e-52df565f835mr43051341cf.9.1787309496784; 
 Fri, 21 Aug 2026 03:51:36 -0700 (PDT)
X-Received: by 2002:a05:622a:144c:b0:517:a7ff:935f with SMTP id
 d75a77b69052e-52df565f835mr43038381cf.9.1787309474684; 
 Fri, 21 Aug 2026 03:51:14 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b9a89572sm16631315e9.0.2026.08.21.03.51.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:51:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v3 11/15] target/riscv: Constify @iprio argument in
 riscv_cpu_pending_to_irq()
Date: Fri, 21 Aug 2026 12:49:45 +0200
Message-ID: <20260821104950.32108-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX8AJSyzv8bjmz
 RirRWW9o6K0Td4OYqJ5NToBnh/GqAsn4BCTLXwU/kxy57Wsqv0uWCoN0fj2RRCaQ5YZBBVSyLr1
 klwUak+/SO9XJQ2rUmJ6I0TaAZrTOPU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX4VlGD42BjCVg
 HyMxup5k6DEjQXe0yxsmpckl7a7YovxMaLHWS/nITUx2ixxkbNtCJkWBBDIbozR860nBtp7SiC2
 RXDFegAOdx1VM/bb0C9aSLwv7qKYVNK39/nlMKVl+wjDLqFxhmNQfQoppHt5TJ03DR4JnzPBGcr
 hMl0ndej8s0N/kfhTE6V0LsrHPbFe8vQrG9PuQrfCe3NLnSypHbZav8lQexL/agXhdVIjFqMkzU
 pQa0YjFDzyaTmpw5r090HUr+45aAPm06J34rud/jqgw7cFX30ZVur9RucCRPV57oQQdUIBiGrOA
 f5U5xUXR3oMXyamAYs4E7a2qHBT5+WRjSV8rqChYPVrUSni+iwy9+CyCLi6xGwMFsS81VbNgSvp
 hAhc2fTi95TL2NqqJYz6u46IkkK5UaHdvt/WtX/XARhVvQT6lfBBDOw2qrn3BElni4QH9FJ3aLq
 1OPLXGYQ0vGUIpgOxbQ==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a882db9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BSr7d83ZcM0ekcBEWmHNPvpAln6u5RqG
X-Proofpoint-ORIG-GUID: BSr7d83ZcM0ekcBEWmHNPvpAln6u5RqG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210081
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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



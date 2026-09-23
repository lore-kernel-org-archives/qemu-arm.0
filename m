Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B75C9830B
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 17:16:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9QWm-0005Hf-OZ; Wed, 23 Sep 2026 13:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWj-00058S-OF
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:13:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWi-0001DE-3z
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:13:01 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGUAJK3106325
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IeLVm5/+AbWfhQYlNgRIjGIoDIVppu1o783xUoR+s+A=; b=Av6laJltTdL/EMLE
 iTVMtsWtI/PWMZnlA9r2vRbBaHC8TR+yoKjcPz/xnGOEsHt94p+EtoF0QAyo1bhh
 2NqZstN0xsTGEVACBsNvsseVAO17NuOlJi6G62Rbn/qg9ILOCD14sqY+UiFy0WWO
 cBrYZkFNGxOhyKr2WP8T1dTyX3Nne/mYPl2TQmrhp3DyR0VdPB8iAGHsZ2rtvyIg
 2Do3x/qPwMs9G7+DVxYwMawury/u68Kt4sM7roZiSh1mojfKl0kfnqZCAKDV1cAl
 uxbgAtnAkTTgqQPxvp4hyhfKegHlTjUdFqpkJoUPkfD3WRoQXxbwYjsuH+qway6E
 UmEzAA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwh10w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:12:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-78fbc5a4cf8so83986137.0
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 10:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183568; x=1790788368; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IeLVm5/+AbWfhQYlNgRIjGIoDIVppu1o783xUoR+s+A=;
 b=JsPekU0DZhXuLZfM3+wUgqr4YWRXcj2TsbU2wVHdmsYKqoqbjV+tyxg4+p2YXqBhYK
 Jqoji0ZxXNQ36jEKxM4MIZrS6+CibmRP6adXykvjrFiJ3Dh9pPAW0374EeidkT6B9pQf
 aJjj9+Pli9OL6q1AyV3qaPLYOezZfpIh+2nUpCSfAdGxdt8BofMYBO6Ogp7nJhBnTwyp
 oWEqg/hP9NhtgqqBVdOBAJOWaa1PzQ8K1IMHwohRJjEtK07W9ej+pzFwo0COHhDedVh0
 ci3r6SB0xNtitk0q6qjrhe67cvbZRshhr8VkZC9xhZ5uijemgnZZftk9XH1v/CB4x739
 +AOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183568; x=1790788368;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IeLVm5/+AbWfhQYlNgRIjGIoDIVppu1o783xUoR+s+A=;
 b=aQoABOkXliW4m86lqOGpo7K7siV5hXX9rtADdqAUkg537rC9PADuNPzqXXX9W+wF/x
 ZwMMPRrWs1adFQs6ybTaIw6NdSuAnsdp6Dv/hNlhwBsKaxHM5csYV4CPTUiYClpzoYbW
 dl7Exx+lmx2UGhIvgGoftV6e/Cxl0cmhNJ5hNlLTsb0Ua+HZhpUtxK+s21vkcY0B+R9Z
 Ar27tlCidn5/mATMTxeIB6LKmWHP8FeHJm7X5N2kC9II+umXAiMsGt5IL2aoU9LPedWD
 W2zmayz/2EzbD6bCzm8QEGQC+MFNxzmS7CQEqd0V5Bl0Q9jaXu/6d/SZuFRjsKNu6mIY
 mOLA==
X-Forwarded-Encrypted: i=1;
 AKwUvByFzP2UXeRR2VoPNhVykz7a2f2UzlZxKw8Q+bcjDAB8/ncMgqE7Zp0gVp3cM3tVIsTZ1zGUW34fvQ==@nongnu.org
X-Gm-Message-State: AFuF++k2gFucSInm6SdWa7CHCID/gkFgYm6Te6nVHQbDIjJjocejKDde
 5FL+sxTdIN3qUtF9YTwHHO/Bx+FXvR6NPlgM0L/xEn/Qm8/cg3ZTCpP5tFBpKJKXG/+evlSXkOW
 oal6r+G3+W4fBhFY+FXTVCg6vuGOPqBP3cX1RqZX688MdSGqPS1jWQDI=
X-Gm-Gg: AYBFou2y7FjZNNAGPlCIhWiu3VcGBJ0Tfx5RrOLV3+/UMDGwXzlXwAqhm3cqnLERnzc
 sGZjdXxEXnElVSaBtjBCR33bqVALZa3W6gJ0qov3kr8NoJ6Kh9AXnNBkD57ZiI7R8m2yQB6Q0C+
 WwJqNFa0lWha5vLWUFl0ygQLL5HWfs7sllECseqO5no7nIhorn+bHCyRUBZSfRd1jy6JUEVDC/I
 OmwFGxFtCxmAVqcfkSgJPaw72liHfigb/R2MFUBgy1dzFuoFHVmMnL36TQqpqvbkOtJrpe0xiX7
 ko2pM1xhpsb3s7YBhEBVvEhkGtZQWwqHtvC53kxn+H8n1Ud3Gg7QvU3fCKUdgGHr8GdyfwSp7Qx
 88qGnzkzdXfOcn0xjPdN5mX4XMtiZSHQAXrc4Ck3F
X-Received: by 2002:a67:ef8e:0:b0:7aa:d0a9:c5aa with SMTP id
 ada2fe7eead31-7aad0a9c60dmr4313392137.18.1790183568385; 
 Wed, 23 Sep 2026 10:12:48 -0700 (PDT)
X-Received: by 2002:a67:ef8e:0:b0:7aa:d0a9:c5aa with SMTP id
 ada2fe7eead31-7aad0a9c60dmr4313381137.18.1790183567911; 
 Wed, 23 Sep 2026 10:12:47 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5bae53dsm875175e9.4.2026.09.23.10.12.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:12:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v3 12/21] target/riscv: Access MIP atomically
Date: Wed, 23 Sep 2026 19:11:06 +0200
Message-ID: <20260923171116.31276-13-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX8ac28LBx9Wca
 +Duex82jINUnLDF8BJD9rgSIk7J8hI0YTuzaul3QlGrBmszY5W6xOWoa31mG13BZrxyTJ/71vct
 6n4AxuaN4066fjZbcP0olga8iCmazketHxDbmCHCie1VIz24uS380gZvIcNl0RTPDCxrmECycwx
 ZiZBIZYfKoApdqiIYrnqaZNbQeL0WiO6pl6R2Ivh7m5zuc5pB0rSrkj9iQ2UlKHZ1bn3O12KGlu
 MBLz92YG4kFMR+N7TrR1WLpfMqisAQ7haPQmmD4824l3nRIdqT9WcTox99XIKdGfnzYWmPF1xRa
 F5MN9o9fInIzWwuQJuTAW2ZqYxxUocS9G8dEVA/W0b/cwsGoX51Tn5eEk2qzeT+ddY/JXdPHXV8
 zH60XJ5xzQ21gRW9EWU3dEPkom/pqMKyjAeK3vUTTWmHFpvwoe1e24E7Rc3pzJNXEWysrVn7rPr
 0N+K85V6+BM8aq8ywig==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab40891 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=-7qWTPA4ftCRTD5zRq0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfXwxFyBwI4rlEs
 54lcoLAE4apAa9nIlU6j5pHl0aTFc2Cyd1ct1Q37tMjMPvE7U17WAz6K5vfAsLOmm3OjA1MXs/I
 qlIxBjOyHHnGih+eHFnioxMlbBBDx+E=
X-Proofpoint-ORIG-GUID: TxWAXHv2or8NpCQG1DU2YdHll0CU-QHj
X-Proofpoint-GUID: TxWAXHv2or8NpCQG1DU2YdHll0CU-QHj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230068
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

Use qatomic_read() in riscv_cpu_get_mip() and qatomic_set()
when updating env->mip. This makes MIP accesses safe for
riscv_cpu_has_work(), which may run without the BQL.

Reported-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/tcg/cpu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index e524798d312..2081875a206 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -528,7 +528,7 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 
 uint64_t riscv_cpu_get_mip(const CPURISCVState *env)
 {
-    return env->mip;
+    return qatomic_read(&env->mip);
 }
 
 void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level)
@@ -592,7 +592,7 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_t value)
 
     BQL_LOCK_GUARD();
 
-    env->mip = (old & ~mask) | (value & mask);
+    qatomic_set(&env->mip, (old & ~mask) | (value & mask));
 
     riscv_cpu_interrupt(env);
 
-- 
2.53.0



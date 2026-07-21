Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B51CC4451C
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 12:23:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wm9Ty-00034W-Nb; Tue, 21 Jul 2026 08:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm9Tr-0002ks-1X
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 08:21:51 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm9To-0003ty-1C
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 08:21:50 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LARvCk1252143
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CCs6xzzmYXlvnPqjtMYRNkoTvkbP9Kw7t9pq1Mn1d5g=; b=P9J6/4jc/bbOYzbr
 LoWP4YVYGc5OuqCXzj/lyAoQ+bObpPOPAuOmyzZK0IowCViaPdxJboGu1nFZBrB6
 ateFtVon/ovH/tYfvqiIBezUJ4akc+sDFYISf7JRAdYSfu+GLAyBfsYobNqo9X48
 zFOv/fRl1UKSLhyVoK6zwve8g4vWiPnWpQL8gUomeOgSYF7a/H9pF/3W0krQNp7P
 i4vFElifHAZpJS8oTRJ7/AoRDt7It/OSzauEuQ6iPkNdJN2pg0WVcm+1k+poERLE
 HHcm2ySLah2+jD/OXFmOg0mG5Fn7TdxIaaRwaMspI48iMxk+OrV6UK9sHKK7EGi7
 VAniow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvccevd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:21:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51a8db414c7so193018111cf.0
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 05:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784636506; x=1785241306; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=CCs6xzzmYXlvnPqjtMYRNkoTvkbP9Kw7t9pq1Mn1d5g=;
 b=A5M93Aw52BkAEJqGD8VkWi+jXdncj7mkM/GkxFPcsP873XPxjIrGG26X4yrQwcv9c/
 Vn58qa0mLdVxFY536U+wIELfmpjztEFO5/4Ug3cJ4kDLBGpUJp6OqviL9z/WkrtB6Vub
 19iTb4ynMN6UEBSZaisa0vuGajDlRUcrW/Cv8AKcXJ78AviptL5yxhmQ02Z26AUcACkD
 vaVUczV3VBDsl9Mhvpmyl2LN4tOPtxhaKcrJqW6yoqqrbD+n8NoctLkBuKa8qonMWhFr
 yihfKkj42NX78CJkkXBITHDfaJCOlsSjJwI+yhRUggGqKWum5TNTefC+SXqI5aN2z+lZ
 F1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784636506; x=1785241306;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=CCs6xzzmYXlvnPqjtMYRNkoTvkbP9Kw7t9pq1Mn1d5g=;
 b=DRmSSm8rCRSEEQTaLOGVCYp5OZyAeZ+UWDKRT1aEIFv3Zu5lu8j+CXkKrvq6I+u/+c
 84GMb4Hff9fKNZhD+8J3QT4vG5lPILj2ThbOsBdilEqDzyG/b4r/T6bQrhiXqqp7a3ZC
 nhbq+6Ez6B8sIyele64cYAJEBmJo9IoLwPqfW0LhFZ9MpV5D4ripBDhfYlWKVSAZo7w4
 jNAL5T/9COayUH2dwqJKdDDvgArA0h8gFvXSzWCAYUkPFVquMy4LsOGOFkmkBfTe1cY1
 EsFqDQWHVKsFB/8h5MR8y5X9M7/vVzPg7koRwwHhjknSfo/jxO7H/xCrrNdBerY3daRs
 X7+A==
X-Forwarded-Encrypted: i=1;
 AHgh+RoNCm6AHe4oP7iv0Pn/Z1oUTKeVcwH8Ze46JFFXQomDJcTvLCR5Lz8pCJJn8//pifsZK5ok5/E0Xg==@nongnu.org
X-Gm-Message-State: AOJu0YwU/WnGOSdu8Qxtsu2MwV8nuAmu0Vh0jIlchDfGoh+uiF/GTPCq
 8DF42JF49fC6ntefsziL6jH3RJN6CAnC0jCsU+pQAXngsOxCPCaCHgBLUSVL9lAFwIugU6H593f
 VnXRq4hn3uMPVi5Bvm1wN4zCKQwCIYtyTkrkLyoXBczPnef+VNCAY/9o=
X-Gm-Gg: AfdE7cngRg21VDm/s+wAop/waXP6qeRaPrt0zl5TtryrJNpGRdvfrg/jlNpD8bDRTrO
 TH7A0oKJBZRDkXDiz/2G8ELHh1i4jypLU9yIH9elebqX4SZp1PChQfrFSsse/3dG+PK4BQy+R6O
 /V5O9fxdCpVpw0iMLTXne79ofa/2So5cMOVhEBbOpAPQwJRDXDFQXOMMLRFnWgJF/9KPTW6Zx3p
 C3lN7uQUN4mrpQJWoH4N6zZGTHEtxpw3GuJxYaLA/eJepuLKc4qFxJE7A0zQJSfXOreuBbxDacI
 XEJP58dq5AdUK5lOrctn9EQmh1+N0jLILwXkslCCZknc5rYWniVwer9avJmIJpRkF5kiCdvxhQI
 udNUxSFRo26NK5lVy9iAsjmHdrUO7TBWe3woXYRLBKv9Sx6mtnKkoJSr0qw==
X-Received: by 2002:a05:622a:60a:b0:516:db5d:ebf9 with SMTP id
 d75a77b69052e-5213e8769f5mr180500011cf.48.1784636505709; 
 Tue, 21 Jul 2026 05:21:45 -0700 (PDT)
X-Received: by 2002:a05:622a:60a:b0:516:db5d:ebf9 with SMTP id
 d75a77b69052e-5213e8769f5mr180499481cf.48.1784636505044; 
 Tue, 21 Jul 2026 05:21:45 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ee0086sm41657086f8f.30.2026.07.21.05.21.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jul 2026 05:21:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 1/4] hw/intc/arm_gicv3: Fix ARM_GICV3 dependency for KVM / WHPX
Date: Tue, 21 Jul 2026 14:21:31 +0200
Message-ID: <20260721122135.6288-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721122135.6288-1-philmd@oss.qualcomm.com>
References: <20260721122135.6288-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzMSBTYWx0ZWRfX7THTeD0p2p88
 CLJ6gUmzijUU4bt9NNDkix9M4H8TASfv9m6IYQnrjAcsiaHRAupMFIKhCivbqn19zmvU6c0XGpr
 I81K294VPGHzFUpzmiWoxVIiUwN4YUY=
X-Proofpoint-GUID: 9t1qifcAIqJ7Oq2wEQDEhbijLOkJyVUu
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f645a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=PZoDgyjJWSAZIzKEYywA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 9t1qifcAIqJ7Oq2wEQDEhbijLOkJyVUu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzMSBTYWx0ZWRfXy3uJCH3Pi1Kr
 0S5gZCJgxqf8But1F+UZ/Npou8uYaZHaiDOTPeulJSO2ldyoeWVt+2KLZpDaK1xZmdeB48n9qOW
 3173V/u/rGVbI6VHf46wL2sHTb86g/ekwYUEQXOsWa1y3tp16XeCODc3N0j33juP2MxfdSGQ+rn
 uaxJHqjKzmbx4O4BIWgtBoabqnIGiq0WHeRa5leEXK2vxuPhTwEU08TfIvzBqQTZR/+TzLG6x7D
 2aUD3zwMJuo+BFyG08yUCG6n/eq8Lwp+FWpwJgY/sZ7nwZkOMMmrJxCiIGino3fvDtwuI7apuwR
 113F6aW7SRyraADA2UeUyUrPQAFNi6sKyJm8hV1Fz8my16z2WP8aHEE3VdFX1SNB/BLcnHYCjmR
 N0Ir1BtcOT0hGK9Nz3rmq2pKKL3r9jxgLt4w+OLf4Z+Hh1oVSNRNEJmRhg3z96jVpCp7wk9QrPo
 e1N2SRSIVjRituW7qmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210131
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

KVM and WHPX GICv3 implementations call gicv3_init_irqs_and_mmio()
which is defined in arm_gicv3_common.c, itself build when ARM_GIC
is selected. Both KVM and WHPX are conditional on ARM_GICV3,
itself selecting ARM_GIC. Only build the ARM_GICV3 accelerator
variants when ARM_GICV3 is selected.

 $ git grep -w gicv3_init_irqs_and_mmio
 hw/intc/arm_gicv3_common.c:314:void gicv3_init_irqs_and_mmio(GICv3State *s,
 hw/intc/arm_gicv3.c:450:    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops);
 hw/intc/arm_gicv3_hvf.c:710:    gicv3_init_irqs_and_mmio(s, hvf_gicv3_set_irq, NULL);
 hw/intc/arm_gicv3_kvm.c:822:    gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL);
 hw/intc/arm_gicv3_whpx.c:186:    gicv3_init_irqs_and_mmio(s, whpx_gicv3_set_irq, NULL);

Fixes: a7bf30342e6 ("hw/intc: Initial implementation of vGICv3")
Fixes: e4c95f78a47 ("hw, target, accel: whpx: change apic_in_platform to kernel_irqchip")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/intc/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index fac2d228f9b..377de78bb41 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -45,10 +45,10 @@ specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
 arm_common_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
 arm_common_ss.add(when: 'CONFIG_ARM_GICV3', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
-specific_ss.add(when: ['CONFIG_WHPX', 'TARGET_AARCH64'], if_true: files('arm_gicv3_whpx.c'))
+specific_ss.add(when: ['CONFIG_WHPX', 'CONFIG_ARM_GICV3'], if_true: files('arm_gicv3_whpx.c'))
 specific_ss.add(when: ['CONFIG_HVF', 'CONFIG_ARM_GICV3'], if_true: files('arm_gicv3_hvf.c'))
 stub_ss.add(files('arm_gicv3_hvf_stub.c'))
-specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
+specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'CONFIG_ARM_GICV3'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
 arm_common_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
 specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
 specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
-- 
2.53.0



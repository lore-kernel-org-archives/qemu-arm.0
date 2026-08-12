Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A6CC5AD5A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 22:08:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuH7Y-0004fC-Gm; Wed, 12 Aug 2026 18:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuH7X-0004f3-Sq
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 18:08:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuH7V-00065w-WD
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 18:08:23 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67CK2lUA297413
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 22:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=l2pHtcw6cs+AKkY8B0JFNG
 +8j0VxM5TQggghtzM8jss=; b=EkDWcHkPp7HqSZimlxUcBdM4fUqFO00eBoh2P3
 tAvab2adzawzS+k3rNHn8j6Q3oTdC35uX+lynpjGDTq8UpU615C1mmNo779Xza1n
 vBbsxn3CECYxw6C6ckRPhRkhoMl0z2C1MenaiJ+WGIxcq1yTdbO0f2cqIp90ncVX
 Vy2D+SRM0VEUGk9nmngSrbmNLrMu8VCDQUWopp3FKuwO8J1mVulxfZX5X3ZEB+Yh
 zr5oGWVEtFVKZ9YfwQ5neobcZ2pY0fkAi9V9V+/ZInDbjJC9604XOPP38VvgTFdx
 Bo7wb+cs7dp8zQOKJRwEBIFw/hQO1B9Zks/3E0xYT0+sPLDg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0p3d3bmv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 22:08:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c19493ac2so14454431cf.1
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 15:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786572500; x=1787177300; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=l2pHtcw6cs+AKkY8B0JFNG+8j0VxM5TQggghtzM8jss=;
 b=KShLO+7C8FMKhw5nsn5N4RTNSk49tdieQj0ZnkSsbRGAQ1QdWXDlYpoxfBfaxwGZtR
 mpXmTEDgP1o+3jhjr9Vky5qO4xMhp39RvzsKUifIpytZ+TzC/mesCTPT60dExF51dg8t
 NpISbd88KsBP9/m/MTktR+gotbQhTHGSwV+ZOm7toDEmgXXJ9aTSG8dTrTqfCbEgwsDI
 ul1OR00M76PHQiRUBBQp1bo9fQWqi2FpbgtXTp+GG5RBitUsQYDY1ZoCHYOJlIfXdqzd
 6dMnuep7PTrw/jkZr28CQVGabotPcfucDo3XsC7OoJs5Bfou2XCK/MOOYmUVw4D3Lgxu
 b8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786572500; x=1787177300;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=l2pHtcw6cs+AKkY8B0JFNG+8j0VxM5TQggghtzM8jss=;
 b=WthPFKpGsr4BBwnu3tWHOVgGTyiS+XFkjGmG23LI5eOq/0YfelsstdaS2pgYFyMgju
 qgY86pY4Ia8Y4KsXLEkUHajFQo3W8j7AwKrpmcA3Gnazlq24FIMXvxU6GOt/uQx5DWbF
 cl4A1wHT1vmH8q5C6psx02V0iEMP7BnHfseFe6VdcbQdDmpWRNKtR+oLO2RQc+rj7/fI
 zyTsbIGHRIzRDJJPGE/agRMZif0OrG6rpwzZOAtIAFqFwrW6HX7cMuMCkxU85hL6JkTU
 y/WYgLe3NCKiv/3/K2bz7oQro2nqGMGyQXuwNs9I3rhWHFq3S389a0uPI/d1fG9oVdSU
 MqHg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpcnIzC2nK1kBOxsgGsRY3P3xKQNlwen1hqI3Vy8zXGMPnc5S1c1ZVagwbzwd7fZmERQbDqn62M/w==@nongnu.org
X-Gm-Message-State: AOJu0Yw7fXawyjrFb/zqj/d5UcwRmf2ry6i9iTbhdZPjPiIRUS350Nsz
 bjt/TFJ0MFvH5fxekiUKgshIga5oNO9+Cz7V9pNKpzcCjxorfvkdhmSCWQ+uBU2AvPch1KK3g1t
 1uiqfFqSGwwMQYGHgzcWyhPmIb88JyFh6VtEVw6Xl+hregBxnBFEX71k=
X-Gm-Gg: AR+sD11JtU6dPD6uZorZOUhrWIJBm73HTG0txLZw/lyJsuRDpY2/97pMLhTHV5nq/Yd
 djqFekwMuVtNi2tBCk0sKVk9OJVB+9lHd+1g4oLL/pH15ebsk+gP3B7aO7dLVP6yIghC7cGMKN0
 cAdZb0aUwfvWyubmNN2I32/QKgMMt/X9JN/PylXUgQmo2wXK7xrYsdNvuj9IqRj4FT/NBB+jVXT
 QN25GY7FPztYvgykHXKs/oK2VhahqrivfqONqf7yDXpRzAoCrOwR1bnTtUnV9G82vxQXSYO5LbG
 cXZuaT55wE7ThCagLcmss4O6drMG2VyqE4o3HzQVwDuKDGzwqK8sQxjChE2sfH4gUM76wWDK8e3
 gqIka/M5axGmvheDuyuVmyN3WfuRy7jrxczXBiluSTg==
X-Received: by 2002:a05:622a:315:b0:52b:71dd:c92c with SMTP id
 d75a77b69052e-52d73befa6amr14523611cf.2.1786572499787; 
 Wed, 12 Aug 2026 15:08:19 -0700 (PDT)
X-Received: by 2002:a05:622a:315:b0:52b:71dd:c92c with SMTP id
 d75a77b69052e-52d73befa6amr14523241cf.2.1786572499353; 
 Wed, 12 Aug 2026 15:08:19 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a56133csm943051f8f.7.2026.08.12.15.08.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Aug 2026 15:08:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-stable@nongnu.org
Subject: [PATCH] hw/intc/arm_gicv3: Have GIC kconfig select GICv3 for HVF and
 WHPX
Date: Thu, 13 Aug 2026 00:08:16 +0200
Message-ID: <20260812220816.94034-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4_b8mxRVF3FSOzXnd813KRJrk7S8tR-d
X-Proofpoint-GUID: 4_b8mxRVF3FSOzXnd813KRJrk7S8tR-d
X-Authority-Analysis: v=2.4 cv=UfNhjqSN c=1 sm=1 tr=0 ts=6a7ceed4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=69wJf7TsAAAA:8 a=EUspDBNiAAAA:8 a=y3-W-MRV9Z0q8RYWwCkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE3OCBTYWx0ZWRfX5Mjl2FMCusk9
 imruB9esSjBBYTQYCmpo0M1Zr2FOtmUic2SxhJ6JodxqbOlpuC3FNbqZFiJYR6phUf49qU63fL1
 Ab8sqI4RHm2bw+qPD13PFTnx+gJIGtGJCNzyNq4Ohm6ZLJr17AzhQkDIKPXp2pjy0ouIw9Ozfzk
 eF4BPFL8HKxq+PF2QOrQie/fX9jugO+Y0/KRKJlY1qbzZ9ubCJmEvRL1la1/sQW9GYPbfgz+kkQ
 0hXPyTH28n48qrRQVhzkJajQAGhAdv5zXJlGggnbQF3Oo42/MrKTpU0IwDxQZCoGhGl3+gt1o0L
 RV5w4ZsvvuRNqytqXAY8JZ16og4yqSZ8vUhGeC07KJY0ACBj5BHX+HjBg9bc6W977nrEVCsTvWp
 L9kuYNUavIOIACl1e2lIkGkQ4XRfiZw9I+5+uwdPEGFieRayyEUd3Wqdz35dWjqs5iGEyq6MOzX
 nFzISbSY6LMlB8HDJAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE3OCBTYWx0ZWRfXzwkz3/b+i2OZ
 H2Oudwv+f7X2mS5pHOepgRO0XUxW2O4tDYkRqbhG86+c7zI7n8Ehgr5+Q2mAjL/A+5MGLT9vJGq
 myKIk2V7mLjJ+mrl4W0pLtyMz3Gkup0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120178
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

While trying to fix the GICv3 dependency on KVM and WHPX in
commit 39a8c3941eb, we missed the Kconfig ARM_GIC symbol only
selects GICv3 for TCG, not HVF and WHPX. Fix that.

Cc: qemu-stable@nongnu.org
Fixes: 39a8c3941eb ("hw/intc/arm_gicv3: Fix ARM_GICV3 dependency for KVM / WHPX")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/intc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 097de4efc5d..05e697967d0 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -26,7 +26,7 @@ config APIC
 
 config ARM_GIC
     bool
-    select ARM_GICV3 if TCG
+    select ARM_GICV3 if TCG || HVF || WHPX
     select ARM_GIC_KVM if KVM
     select MSI_NONBROKEN
 
-- 
2.53.0



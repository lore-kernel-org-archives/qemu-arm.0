Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3568266lfm;
        Mon, 13 Apr 2020 02:19:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypI3SCbhsURwxV+CvHFup6ibUuKTqxxS1OIcz0N9wtTYK4btSngBNftb2UuRCjUZSZ377N2Y
X-Received: by 2002:ac8:3f19:: with SMTP id c25mr4787029qtk.96.1586769548772;
        Mon, 13 Apr 2020 02:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586769548; cv=none;
        d=google.com; s=arc-20160816;
        b=AOLJ3EyKX9f8p2kZj0EvTrO2nsEfiBun8rTe1+LT9xVWG6AU0JRHQ8Waxc3vgOpCf8
         bAmbPQer+XkoQXCChU/vMdiBKd9eRmuUCzgujaLTQdKgYQXZutqWn9jBNeDSz4S+mn8z
         43m7KchyLKq1WrK9mUDgfH5cks8UOw2E7LFKVd76jwGRXwBYxGJtAUrMdCYx5GgqSTFd
         HAYPbZpDPL7Ml1gNNR2E34NqB6GWEr38nZ4D1xFILlaxSX94O1K7i5wz6VC/Mstve/mb
         mjOu993SQI83HMLag0aOirrkJGay35HCfMsHQC2wmrvZzMbXnrq+sTFuJs2dWHz4XSsb
         /RqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=+mmgqvL/ZLxJFlyHlOG8lZcJAlSToWnLRnTjicJ2yIE=;
        b=CQwXK7LyEK3+Ang8rudUikU6+9/WL/gqutUoHXRFljE0Cv2sbE52JQW2mpgYXsdCv/
         ND3XE89zlaLEP2+/ERm4DJKeph0cPeKU/jXgS/ybYc6ECc0gOGpywk3XkgyImk8mEf9T
         3BExw+587D0Zp0N4upXyg9ouOtO6aCThpXDOfbeS+Rdry8NL6EWtQR4XaHCTrQh04bKM
         wwL0SLQu/0IXzunfpgCRk3eITKij9ZaEpberRUn9E5ASCAZLNHI3QrNAZG7c0iN6VCFN
         vcVuirk1WzGJIhdRiGmRpRoaePi3mm02x0/xOsXrqubFpqpzoP3R2FssFcuwy3pTmemy
         5wgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si5122290qtd.150.2020.04.13.02.19.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 02:19:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNvFE-000294-95
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 05:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47328)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1jNvEj-0001Se-2h
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 05:18:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1jNvEh-00062c-SU
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 05:18:37 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:37970 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1jNvEh-0005zK-IX; Mon, 13 Apr 2020 05:18:35 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 130C5E0264983E54D18A;
 Mon, 13 Apr 2020 17:18:27 +0800 (CST)
Received: from linux-kDCJWP.huawei.com (10.175.104.212) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Mon, 13 Apr 2020 17:18:17 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 1/3] bugfix: Use gicr_typer in arm_gicv3_icc_reset
Date: Mon, 13 Apr 2020 17:15:50 +0800
Message-ID: <20200413091552.62748-2-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200413091552.62748-1-zhukeqian1@huawei.com>
References: <20200413091552.62748-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p8NDpDM9rjXt

The KVM_VGIC_ATTR macro expect the second parameter as gicr_typer,
of which high 32bit is constructed by mp_affinity. For most case,
the high 32bit of mp_affinity is zero, so it will always access the
ICC_CTLR_EL1 of CPU0.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 hw/intc/arm_gicv3_kvm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 49304ca589..ca43bf87ca 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -658,13 +658,11 @@ static void kvm_arm_gicv3_get(GICv3State *s)
=20
 static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri=
)
 {
-    ARMCPU *cpu;
     GICv3State *s;
     GICv3CPUState *c;
=20
     c =3D (GICv3CPUState *)env->gicv3state;
     s =3D c->gic;
-    cpu =3D ARM_CPU(c->cpu);
=20
     c->icc_pmr_el1 =3D 0;
     c->icc_bpr[GICV3_G0] =3D GIC_MIN_BPR;
@@ -681,7 +679,7 @@ static void arm_gicv3_icc_reset(CPUARMState *env, con=
st ARMCPRegInfo *ri)
=20
     /* Initialize to actual HW supported configuration */
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
-                      KVM_VGIC_ATTR(ICC_CTLR_EL1, cpu->mp_affinity),
+                      KVM_VGIC_ATTR(ICC_CTLR_EL1, c->gicr_typer),
                       &c->icc_ctlr_el1[GICV3_NS], false, &error_abort);
=20
     c->icc_ctlr_el1[GICV3_S] =3D c->icc_ctlr_el1[GICV3_NS];
--=20
2.19.1


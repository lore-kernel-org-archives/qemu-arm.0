Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3568187lfm;
        Mon, 13 Apr 2020 02:19:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypJNDBXcuN2R4lG/z2uVM24NgsqgairFJSzFk9Pe/xYDjOzBnNBRdANBczhkJko4//NT4lZs
X-Received: by 2002:ad4:57a3:: with SMTP id g3mr3906730qvx.86.1586769541899;
        Mon, 13 Apr 2020 02:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586769541; cv=none;
        d=google.com; s=arc-20160816;
        b=MxNECfTXHfdPgsD0fF85t/p2cmq5OAYyXq6mswUmDJXOrMuhH8551tqIWzrj+/SNED
         9DgKSMAWOTcbJL1pFqvxOmQOJxcgKwlk/upflX/H08K8EdTYiMnLriZwWP7mLkOjRSpE
         5uyvmxAkAotKDk0kcULHGGyb3E/KUOMacy+ZT2Ne0KRU8H09Xy2Z3K5aprb6mDCfNNRY
         Z8HmiDebhav6NuNzKgNDO12hC0dR6DIqUubhVv9Z7l5ENd/xR0l+9yVnQ7QBqoBxFWn6
         znaPftONksDQg5lJfQwWqkP6vI9kKgLLNGxleuAxEe16WGgPNxzdyBsDsalcCo3H/Vxx
         qaSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=rOOsKrO+S+nD6s4Gug0JWVnVSezT5XjJLHO6nz7vzdo=;
        b=wxGMFqEx2br+jIgyUlP+8ao9SKruBWMiPCZccVS9ozRVZtKkEM0xR3WqJA15tKO6dn
         WM+zr/iHqBUaGHJ0ojGcH50olVqVwXwOGBcqEwRxVXGeIzi3bzoC36fdwcENiKgalVEQ
         AUnzMGD9Nw3HaVEI1OXSB3ajFG57Y5jb4WmiYZSvOZxyQQd+ShYPmQO0JG5P19oI7I7s
         hQoue9PPl6+jBDPeZqjcNlCox/fNFEqIa7v7I5YUWo7/hK3qxgUhI+RrSJ0rkq3G0eaf
         eZJ0l3c5mmhS5uAE4HdUj6mYBm2kRC88hFQt5eGLkFQ+689WhMyC2Iw2UoIlKQgy6BDD
         Pgvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z188si5831119qkd.216.2020.04.13.02.19.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 02:19:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNvF7-0001wR-C3
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 05:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1jNvEi-0001SX-Ms
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 05:18:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1jNvEh-00062T-PI
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 05:18:36 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:37964 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1jNvEh-0005zJ-F5; Mon, 13 Apr 2020 05:18:35 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 17EE7DAEE6C89476076C;
 Mon, 13 Apr 2020 17:18:27 +0800 (CST)
Received: from linux-kDCJWP.huawei.com (10.175.104.212) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Mon, 13 Apr 2020 17:18:18 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 2/3] intc/gicv3_kvm: use kvm_gicc_access to get ICC_CTLR_EL1
Date: Mon, 13 Apr 2020 17:15:51 +0800
Message-ID: <20200413091552.62748-3-zhukeqian1@huawei.com>
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
X-TUID: SbG3P4CPDzNm

Replace kvm_device_access with kvm_gicc_access to simplify
code.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 hw/intc/arm_gicv3_kvm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index ca43bf87ca..85f6420498 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -678,9 +678,8 @@ static void arm_gicv3_icc_reset(CPUARMState *env, con=
st ARMCPRegInfo *ri)
     }
=20
     /* Initialize to actual HW supported configuration */
-    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
-                      KVM_VGIC_ATTR(ICC_CTLR_EL1, c->gicr_typer),
-                      &c->icc_ctlr_el1[GICV3_NS], false, &error_abort);
+    kvm_gicc_access(s, ICC_CTLR_EL1, c->cpu->cpu_index,
+                    &c->icc_ctlr_el1[GICV3_NS], false);
=20
     c->icc_ctlr_el1[GICV3_S] =3D c->icc_ctlr_el1[GICV3_NS];
 }
--=20
2.19.1


Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp457233wri;
        Tue, 5 Nov 2019 01:16:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyeQiSuMd0h4L42Md9kd7y6xw+ZwYYHhMLJTPIsDlgNrT8U0T8Ri7xGNkFT+i3nT+pO3uT9
X-Received: by 2002:a50:8c02:: with SMTP id p2mr7849070edp.30.1572945380501;
        Tue, 05 Nov 2019 01:16:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572945380; cv=none;
        d=google.com; s=arc-20160816;
        b=BIwXvwPOZjja+52JyABXiWRc1X23CgVGu+3Rw4j+e8/qalSzCe3MdHUQKievGTcK4C
         yDklOuKMtLAIhv2FV5bLVyelqbfFBOjDo+d6pnPwnB1kAr4We5GQlXV8B246kGuqjPH0
         AnFIC94JMrN2iu0TFm+jhbr/YBO3ICyBLQjJG59G+0vz/Muqa3x5U268oA/nWCI/kW3O
         GdyqmfpmkwsJd7xnJjpsVYZOmBcJn0sfjFnBeTjMScVFNGRcBf4fsibX+vf4Qyhj9rmG
         bey5xouSXhtIFl3Zh5hbOfKdwMaJNMdCbpbYx5Y6O72z48Snrs9uiJ/gmKMXu6zDQiZY
         /6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=4+uEM3DIa1rW1u97g/gZy2oMIMYGNDAXHAc0JkDtiZM=;
        b=ysbULrGtJHq49+d3m7v8nn9W9O2+fYOaTeKAotm2PtU/vRTuTcr+A9CwHnHtbngTXy
         otQpMRotv1tuxywwDuYzjmmp6D7R1iIq1hJmMI/66HdMrhhQYFjcAU9kUu3q5IbxwYrU
         vsxW5G7b5LAYqAWlmWQzPyvnAlngRhCtyTC47DmC6/PjJbQpLFpI0O7xTe5JxpWZiIDi
         W855xkuzbPCRc/qF9qEgmdyQrJEivylOB/mJ0dt6gRuvi3bq7nuYiMeRo6UO5hOd/w2a
         AMjuZUEdBzz3s1UQqQfkgnovgzBzjZQd0AhMG/o79Ods8cAuhWnK2G4+Ic2n6BgypkvV
         q1VA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si9631342eda.288.2019.11.05.01.16.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 01:16:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRuwk-0001mE-VH
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 04:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iRusx-00051z-C3
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iRusv-0007lk-K0
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:23 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:52116 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iRusv-0007j8-79; Tue, 05 Nov 2019 04:12:21 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3294EB169FFE9A49559A;
 Tue,  5 Nov 2019 17:12:18 +0800 (CST)
Received: from linux-OtBuvb.huawei.com (10.175.104.212) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 5 Nov 2019 17:12:10 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 13/14] arm/kvm: handle guest exit of hypercall
Date: Tue, 5 Nov 2019 17:10:55 +0800
Message-ID: <20191105091056.9541-14-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191105091056.9541-1-guoheyi@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>,
 James Morse <james.morse@arm.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lra4pMvCoD13

Add support to handle guest exit of hypercall, and forward to SDEI
dispatcher if SDEI is enabled and it is an SDEI request.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
---
 target/arm/kvm.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b473c63edb..035a39e49f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -30,6 +30,7 @@
 #include "hw/boards.h"
 #include "hw/irq.h"
 #include "qemu/log.h"
+#include "sdei.h"
=20
 const KVMCapabilityInfo kvm_arch_required_capabilities[] =3D {
     KVM_CAP_LAST_INFO
@@ -676,6 +677,19 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kv=
m_run *run)
 }
=20
=20
+static void kvm_arm_handle_hypercall(CPUState *cs, struct kvm_run *run)
+{
+    uint32_t func_id =3D run->hypercall.args[0];
+
+    if (sdei_enabled &&
+        func_id >=3D SDEI_1_0_FN_BASE && func_id <=3D SDEI_MAX_REQ) {
+        sdei_handle_request(cs, run);
+        return;
+    }
+
+    run->hypercall.args[0] =3D -1;
+}
+
 int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
 {
     int ret =3D 0;
@@ -686,6 +700,9 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run=
 *run)
             ret =3D EXCP_DEBUG;
         } /* otherwise return to guest */
         break;
+    case KVM_EXIT_HYPERCALL:
+        kvm_arm_handle_hypercall(cs, run);
+        break;
     default:
         qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
                       __func__, run->exit_reason);
--=20
2.19.1


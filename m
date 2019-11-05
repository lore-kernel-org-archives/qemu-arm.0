Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp462669wri;
        Tue, 5 Nov 2019 01:22:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqxf+kXVTnsCLvxSaSNxwaf5J3OLwtg6CQ49KnVeHlTATtOek7xKcJKcG2+axW/IHrqT/YpM
X-Received: by 2002:a17:906:3ec8:: with SMTP id d8mr28819174ejj.40.1572945732443;
        Tue, 05 Nov 2019 01:22:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572945732; cv=none;
        d=google.com; s=arc-20160816;
        b=MZvdgDlPvol76BT00oNQe9q8TFMN94+jWPYDa8Rvb3ldXLhWK4NpGUWzyMmhKSSKcR
         7jNiusdg4W/NOhvb2fDLqsOtj4H9hQyojhJ4Zs3Bzm9JEEwImpwVpzvZgeC4bD1FNc5d
         jjm8IyheNCSlWEu1XO0grleZ+JbHUmc2RrQxREn7YP66YaJQpfSVHixCQteQ5cW7hbwr
         T2QvvOpa1lo+pSI0N4jpbCZpmwh1vx3z34NNlGJ6Wu9LQ+wA6bxwYn17gxCsHw7HAbQY
         McSV6KGy2kfJlbtErJ47BRGNZzVKi7m3MAYg+rnLkE7dnNHdw2kz5hC49MDh2JrFn9jN
         gTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=QggT4Lqbfgtos4BbLAvhexjK4dWeaFSxUO6Fvy6V1Z0=;
        b=NPQsYwuWzHB1rhoh95lVlS6r52YgMoXFCRevioTIbKN6vgTc4bji3Wczpmqy+6uHzo
         cxMFgDeIBXpOSXnPqm3VKtxinn5UqLUVile6ah9cAqHZbuLEw5g0WJY+qg3+iIH5irXn
         BQwcyEGHZYxfPaJ//QDfmXdY44pVEenaYp4rR87Hfvft1KiaM2unRwjE+bqN23ySR6Jc
         crRHuw/juV5a36cmoOdzHIT69D51KC/xSjmcjeUXGe5eVA8CFTDLLWNei8OhpkUsWXNS
         2qcq/mCM0QaXqtcdoHTiOlOLkHTi/pnV4fIrJmJGSrEOgkCxw+LmEPpC6D+2f3V3x6ii
         UZ4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z35si9389821edz.260.2019.11.05.01.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 01:22:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRv2Q-0000Kr-Si
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 04:22:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43070)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iRusx-00052U-Tg
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iRusv-0007mK-SK
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:23 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:46998 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iRusv-0007jH-EP; Tue, 05 Nov 2019 04:12:21 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5C10D599D2752F64CED6;
 Tue,  5 Nov 2019 17:12:18 +0800 (CST)
Received: from linux-OtBuvb.huawei.com (10.175.104.212) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 5 Nov 2019 17:12:10 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 12/14] arm/sdei: add stub to fix build failure when SDEI is
 not enabled
Date: Tue, 5 Nov 2019 17:10:54 +0800
Message-ID: <20191105091056.9541-13-guoheyi@huawei.com>
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
X-Received-From: 45.249.212.32
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
X-TUID: K2JT6jUGH+tp

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
---
 target/arm/Makefile.objs |  2 ++
 target/arm/sdei-stub.c   | 49 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 target/arm/sdei-stub.c

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 72e01d08dc..90235af8ec 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -12,6 +12,8 @@ obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) +=3D k=
vm64.o
 obj-$(call lnot,$(CONFIG_KVM)) +=3D kvm-stub.o
=20
 obj-$(CONFIG_SDEI) +=3D sdei.o
+obj-$(call lnot,$(CONFIG_SDEI)) +=3D sdei-stub.o
+
=20
 DECODETREE =3D $(SRC_PATH)/scripts/decodetree.py
=20
diff --git a/target/arm/sdei-stub.c b/target/arm/sdei-stub.c
new file mode 100644
index 0000000000..4eaf365de7
--- /dev/null
+++ b/target/arm/sdei-stub.c
@@ -0,0 +1,49 @@
+/*
+ * QEMU ARM SDEI specific function stubs
+ *
+ * Copyright (c) Huawei Technologies Co., Ltd. 2019. All rights reserved=
.
+ *
+ * Author: Heyi Guo <guoheyi@huawei.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "sdei.h"
+
+bool sdei_enabled;
+
+void sdei_handle_request(CPUState *cs, struct kvm_run *run)
+{
+    run->hypercall.args[0] =3D SDEI_NOT_SUPPORTED;
+    return;
+}
+
+/*
+ * Trigger an SDEI event bound to an interrupt.
+ * Return true if event has been triggered successfully.
+ * Return false if event has not been triggered for some reason.
+ */
+bool trigger_sdei_by_irq(int cpu, int irq)
+{
+    return false;
+}
+
+/*
+ * Register a notify callback for a specific interrupt bind operation; t=
he
+ * client will be both notified by bind and unbind operation.
+ */
+void qemu_register_sdei_bind_notifier(QemuSDEIBindNotify *func,
+                                      void *opaque, int irq)
+{
+}
+
+/*
+ * Unregister a notify callback for a specific interrupt bind operation.
+ */
+void qemu_unregister_sdei_bind_notifier(QemuSDEIBindNotify *func,
+                                        void *opaque, int irq)
+{
+}
--=20
2.19.1


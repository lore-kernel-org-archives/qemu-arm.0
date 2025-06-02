Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2840637njh;
        Mon, 2 Jun 2025 08:42:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUed61AtZaDvSQ3f4VKTFaUzwBGwL2zaqi2OUuiJMgQ56v00iJSPxNaoHke50xKsj/KR07wvixjuAL0ng==@linaro.org
X-Google-Smtp-Source: AGHT+IEmHRwIzvM6q0hkJHIHYr11os31vT+FxkzBQ0vpHEunT13l5S2oZkdtoWSeV3lllpVeZkCs
X-Received: by 2002:ad4:5bc4:0:b0:6fa:9a9d:fe93 with SMTP id 6a1803df08f44-6facf506a53mr221699276d6.21.1748878956588;
        Mon, 02 Jun 2025 08:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748878956; cv=none;
        d=google.com; s=arc-20240605;
        b=RACVlG2p9Nb9pv18YXqGvdgk5cw47i7Q4zRekjLyrYn6pF97lz1flRA8XZTHYfoZmP
         KuzHFZ4fE2WSgLwTHmwRuaJMh7KK6C0NFebBhHnZgATH/Cjm9PMop3Jqf8pqT+n9sBxu
         bbcRl+DzCRwZX69XnlCSlS7eW1jbSH5AUIksH8wMAvsWeVOqCCk50YIuZ4+aizpBIDDe
         JCMULKGEoEJkn98fIOQxIyKiFOC93mUfxtPdvG9XPA7p74vpdKqnJ6w5ZjX7vwYS/oYR
         r7D0pRswL0SMVn0dhn2h0ldjAkhBw/KJ0+xOqPlrVDe0F2a5ZBHXiT306lkz/yqGwrsd
         KegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=ckw8CXQULUSZ3qiI/INg/rbtUjwDTPrQ/I4GH6b6Fso=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=cOY9M8JUC8WK/8TXciQuS386xHT+V42vMVJEjE3cuvDHi4dZTiH60veCNg4xI41ovf
         CHfbu4dUXolPcd52gZbVTLnlMAI3Fxh1+GHuQnAocJlf0pl11T3Pek2wfvRtjwxb+6+5
         0quskwNGKm0dlVyKU49ltTozBUGdX1/bcVqhG5OfSblIbmkATmi9evtYOUPq8nKfu4qz
         IOKVn0e4+VR9eBRhQePDmjgm1ao+/oOS+xdZIhUV951KKLobvnsiEMvgttcgKfJ/GJlD
         Y3jf7MpUdBotTKpXV0ksSqz20TD9+wQIoewn3ws08H2eN3aOQ4bb5L0NzO0NGBz2vukp
         Zwvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fac6e8d891si102003626d6.291.2025.06.02.08.42.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jun 2025 08:42:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uM7Ii-0002sh-Kn; Mon, 02 Jun 2025 11:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uM7Id-0002sL-WC; Mon, 02 Jun 2025 11:42:08 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uM7Ic-0003Gx-Hm; Mon, 02 Jun 2025 11:42:07 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b9yj82G4yz6HJcD;
 Mon,  2 Jun 2025 23:40:28 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id E63341402CB;
 Mon,  2 Jun 2025 23:41:55 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Jun 2025 17:41:48 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root Complex
 association
Date: Mon, 2 Jun 2025 16:41:05 +0100
Message-ID: <20250602154110.48392-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
References: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zp+YbLMIMSpX

Although this change does not affect functionality at present, it is
required when we add support for user-creatable SMMUv3 devices in
future patches.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/smmuv3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index ab67972353..7e934336c2 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -24,6 +24,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bridge.h"
 #include "cpu.h"
 #include "exec/target_page.h"
 #include "trace.h"
@@ -1881,6 +1882,13 @@ static void smmu_realize(DeviceState *d, Error **errp)
     SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
     SysBusDevice *dev = SYS_BUS_DEVICE(d);
     Error *local_err = NULL;
+    Object *bus;
+
+    bus = object_property_get_link(OBJECT(d), "primary-bus", &error_abort);
+    if (!bus || !object_dynamic_cast(bus->parent, TYPE_PCI_HOST_BRIDGE)) {
+        error_setg(errp, "SMMUv3 is not attached to any PCIe Root Complex!");
+        return;
+    }
 
     c->parent_realize(d, &local_err);
     if (local_err) {
-- 
2.34.1


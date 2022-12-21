Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp5018269ejb;
        Wed, 21 Dec 2022 01:29:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuCawI3L+k34JNn7QcJW7STqXlkFieT4rhPZRzLyItaFCUZwDgOPF9k8MzRMc6JrX/C0XML
X-Received: by 2002:ac8:7542:0:b0:3ab:28ea:d849 with SMTP id b2-20020ac87542000000b003ab28ead849mr1401572qtr.10.1671614966931;
        Wed, 21 Dec 2022 01:29:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671614966; cv=none;
        d=google.com; s=arc-20160816;
        b=OelGl+hhtiR5SpcFi4X4bqZTCzbBntcCuzCpq6VqgdYS4mQrHdIon4gvdfYypyxy79
         VT7FaHr+2PphFFZzUEQF2+NkhD93kGMgFOjTLNqTmBkd6Q4mxyX58yZ4xWzGvZd9KeRG
         5yF3tteStFRFwL2s48jdUk+93mhrH2BOadKwsJ4/XP2IEQY1pnHpD2W2ADfQapgKfnmK
         Jsqc0BMjkJLbKuhm5qs52+Bs/760yv4E8lzGkwaKU8mQ71dxjiNFNeWIvdzCT5bXgrwk
         V/15C/mqH4WRqzoTBN5g++Er1tap9IP38GpOb3kHwvRRadi4dV0JdYJtUuv2kX4PvP6M
         pTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=c2HAyluP0aKm+1nYMDnuOpb3KbIwW2jE7aWiQN8k0Io=;
        b=MhvIZ0Z7VmaRfj58xD2cO2sKwQpYn8AGMtZ5QlP3AMU8QWGdbDydVpzPkF5X4z93wS
         Q5kde+m8Nhr1PSaay8e5EkoYfpCm9x3sCBmNMk7GLAeOS+Sw6Q2IrZM1d0H3/G+83awa
         I+ixQnwdzyM2jRHL3qLzZypOO9tgjoqKc3ujtRWXZ3yd4CnYcM/ODO+VJRHvdikAcn/H
         SrZZYXFI2zum7mpzcW+fIZlAIXTJvC/5xQFbzcPj8qhvy3ihea/c2nj/9BSRmAVhzcdZ
         DPrGeK3e04IWHCKsa8KuSfRrpU4uOtdNNKEUCAPoTZduQKR1hDjfZ3w1vEBP5PjTiqmo
         89LA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3-20020ac81243000000b003a99334f595si2015696qtj.655.2022.12.21.01.29.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Dec 2022 01:29:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7vPF-0005hN-5E; Wed, 21 Dec 2022 04:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p7vPD-0005gW-Pr; Wed, 21 Dec 2022 04:28:55 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p7vPB-0004g0-IN; Wed, 21 Dec 2022 04:28:55 -0500
Received: from localhost.localdomain
 (dynamic-095-117-119-107.95.117.pool.telefonica.de [95.117.119.107])
 by csgraf.de (Postfix) with ESMTPSA id 09F246080C33;
 Wed, 21 Dec 2022 10:28:52 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 2/2] hw/arm/virt: Make accels in GIC finalize logic explicit
Date: Wed, 21 Dec 2022 10:28:50 +0100
Message-Id: <20221221092850.61332-3-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20221221092850.61332-1-agraf@csgraf.de>
References: <20221221092850.61332-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pJsmWbP+xtpp

Let's explicitly list out all accelerators that we support when trying to
determine the supported set of GIC versions. KVM was already separate, so
the only missing one is HVF which simply reuses all of TCG's emulation
code and thus has the same compatibility matrix.

Signed-off-by: Alexander Graf <agraf@csgraf.de>

---

v1 -> v2:

  - Include TCG header for tcg_enabled()
---
 hw/arm/virt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7b54387958..76d8d5cc5a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -47,6 +47,7 @@
 #include "sysemu/numa.h"
 #include "sysemu/runstate.h"
 #include "sysemu/tpm.h"
+#include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
 #include "sysemu/hvf.h"
 #include "hw/loader.h"
@@ -1930,7 +1931,7 @@ static void finalize_gic_version(VirtMachineState *vms)
         /* KVM w/o kernel irqchip can only deal with GICv2 */
         gics_supported |= VIRT_GIC_VERSION_2_MASK;
         accel_name = "KVM with kernel-irqchip=off";
-    } else {
+    } else if (tcg_enabled() || hvf_enabled())  {
         gics_supported |= VIRT_GIC_VERSION_2_MASK;
         if (module_object_class_by_name("arm-gicv3")) {
             gics_supported |= VIRT_GIC_VERSION_3_MASK;
@@ -1939,6 +1940,9 @@ static void finalize_gic_version(VirtMachineState *vms)
                 gics_supported |= VIRT_GIC_VERSION_4_MASK;
             }
         }
+    } else {
+        error_report("Unsupported accelerator, can not determine GIC support");
+        exit(1);
     }
 
     /*
-- 
2.37.1 (Apple Git-137.1)


Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp252675ejb;
        Fri, 23 Dec 2022 01:02:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsF7IvrtJXU9bF47fFWF3bX9nYvNju4L5pt6ZJ1/eTY2QDEjZ9EvodSYTKt+hk/PbDkBqZF
X-Received: by 2002:ac8:4c9a:0:b0:3a8:cfb:6e9e with SMTP id j26-20020ac84c9a000000b003a80cfb6e9emr11613918qtv.65.1671786119970;
        Fri, 23 Dec 2022 01:01:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671786119; cv=none;
        d=google.com; s=arc-20160816;
        b=MWSy30Lmp1EwkxfetuHxcCBlu5NxH6eanUtFXZKJxVp9Fe8FQwDDCqi63HiY8P9dEI
         gyQdYDIeABc+FPswyvhys4QPbHwYOOTBlDCiWgzRk3ASUpYzez7OV9iuhezDo/u/3P26
         tFFomC++fiNZnIojvH7pcTzDwafuv23sAIxClKN4je4vnnpASruqzImDIAHi95xthMz9
         o7CNgtb2Fwe8yeuoX67f0lP41L0klkX4sFz218DR4N2vSl2wPE0euTKNxQbi3JeZTI7l
         pc+3MCC3zqx1lP3NzJFR+j2DTz432BcV23OmGUBN3cqJ1M28xmBe9rI616t6ELvJIkfZ
         4sDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=NuEyB2nMrPulmfcerFnPGXax/LCglPPOKSBEMEzeFRc=;
        b=JpTlTOUsVrbh6Tq8v1H8v9/modv7rK6j6IzXCen/Ugo2+jFruX8/veyHzP2idhG1G+
         vMSlqMYl7PomSzJOIi17KG2Cd8AJmLPMWCCLr418v6nGNFEmWuF+ZZKP2kCQHWSh3Ac0
         6rBLL8p20QlrLT8R5S9RjLwr3Kct+c0H1m8v8FK0h9bJQ2WqdISf3XKLiMDQHbGUk6RG
         kaPnLrnymiMP9xpkKP6quvZ2Qk7yIVoSsjo0jrpGux4jFLO8ZtRXbOvM9g4Jj09qmLFV
         SPj7snnqvkEqd+0fUy3wuCdrAc9qEWADI2VOkprKm7ciAC8Rx+VCDB1dzyHnR/43vzNB
         sqAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb29-20020a05622a1b1d00b003a7e7f08f6esi1008504qtb.737.2022.12.23.01.01.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Dec 2022 01:01:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8dvi-0002ST-5x; Fri, 23 Dec 2022 04:01:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p8dvW-0002RH-2P; Fri, 23 Dec 2022 04:01:14 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p8dvT-0001P5-Qw; Fri, 23 Dec 2022 04:01:13 -0500
Received: from localhost.localdomain
 (dynamic-095-118-065-151.95.118.pool.telefonica.de [95.118.65.151])
 by csgraf.de (Postfix) with ESMTPSA id A0C366080975;
 Fri, 23 Dec 2022 10:01:08 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 2/2] hw/arm/virt: Make accels in GIC finalize logic explicit
Date: Fri, 23 Dec 2022 10:01:07 +0100
Message-Id: <20221223090107.98888-3-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20221223090107.98888-1-agraf@csgraf.de>
References: <20221223090107.98888-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aDHEzOVMklym

Let's explicitly list out all accelerators that we support when trying to
determine the supported set of GIC versions. KVM was already separate, so
the only missing one is HVF which simply reuses all of TCG's emulation
code and thus has the same compatibility matrix.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>

---

v1 -> v2:

  - Include TCG header for tcg_enabled()
---
 hw/arm/virt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6d27f044fe..611f40c1da 100644
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
@@ -1929,7 +1930,7 @@ static void finalize_gic_version(VirtMachineState *vms)
         /* KVM w/o kernel irqchip can only deal with GICv2 */
         gics_supported |= VIRT_GIC_VERSION_2_MASK;
         accel_name = "KVM with kernel-irqchip=off";
-    } else {
+    } else if (tcg_enabled() || hvf_enabled())  {
         gics_supported |= VIRT_GIC_VERSION_2_MASK;
         if (module_object_class_by_name("arm-gicv3")) {
             gics_supported |= VIRT_GIC_VERSION_3_MASK;
@@ -1938,6 +1939,9 @@ static void finalize_gic_version(VirtMachineState *vms)
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


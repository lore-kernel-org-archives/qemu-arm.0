Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1426734lfb;
        Wed, 2 Dec 2020 11:10:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUW6aKkzi/CWkE9hjiIWKayYHmSB6KFKBPZ3hKiCIJ4VkPGSbTZ540RTcxokNaBpl3+CXn
X-Received: by 2002:a25:cd43:: with SMTP id d64mr5449915ybf.296.1606936243331;
        Wed, 02 Dec 2020 11:10:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606936243; cv=none;
        d=google.com; s=arc-20160816;
        b=dqaOoNGEKE+RioTPXFPVv7ty74lTtZwZyvps2xLUt/Cu1cbNLAUb2Qjht4B3PulkY7
         F3J2qUNfUHRcs9Qwg7iaSnt2h5Xiay/pcZtwmLqADAuFJ2PlppME9+So2P4gidHFLnEb
         BPf+3UZWuHKiKPQPFaRs31izJMX4swcuLxdT8Hj8qHekRKZ9BFBZuY9t63oz61JbMB7J
         ADZdNK4HpCJ7TSbW+EE7Xs043k0CUT56JZnhKSf7uDq9gpBGvum6sVNk69gPch6s/7F0
         QN4O1bqz0s8SsubDlapIFblH+iJ6g7DyT7W1WkpH+d+sYuQVxKBmldDJrf+LPKo0twx8
         sZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=8KveTSC3CZA37zi2x3Zxa1XHJSKP7NH4EDpB+nz5DwE=;
        b=AqqV06VHRwl4SlBdslVY/q/u7wXHd2ngGXoDWscKWo7XcjIYtKZI2ALUlhNgfRr2oB
         QS7+PbFikc7LR60q4Y/LR2fl8d/wl0SrmRVAoF86LNKjXVcOS7j0zfofEID1nt9jABC/
         REjnCHh6+oUkQ3LvDbXkylfhV76I91uUGsYkTKioL3dCx7j/ubSqcO3g63KetSbxuv2u
         Pbd288J55NQJUnFOLrDk7MNnNox5q+h4vaSEPMEYNRo+1suR5lUzcxxCFlSE/tUeVTX8
         CY/vdu/88oDJ1eKEC6LRWEioqcbAGmVxmokHvkR3Ubn7OS1cwlVeDxswqtKm/F3ApkTU
         cO0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14si2796655ybn.52.2020.12.02.11.10.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 11:10:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkXWU-0000V9-NA
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 14:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkXQO-00036b-Jc; Wed, 02 Dec 2020 14:04:24 -0500
Received: from mail.csgraf.de ([188.138.100.120]:56468
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkXQH-0005G7-UM; Wed, 02 Dec 2020 14:04:24 -0500
Received: from localhost.localdomain
 (dynamic-077-007-031-140.77.7.pool.telefonica.de [77.7.31.140])
 by csgraf.de (Postfix) with ESMTPSA id F117039004E4;
 Wed,  2 Dec 2020 20:04:15 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/10] hvf: arm: Mark CPU as dirty on reset
Date: Wed,  2 Dec 2020 20:04:03 +0100
Message-Id: <20201202190408.2041-6-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201202190408.2041-1-agraf@csgraf.de>
References: <20201202190408.2041-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vvxu7LvtAKep

When clearing internal state of a CPU, we should also make sure that HVF
knows about it and can push the new values down to vcpu state.

Make sure that with HVF enabled, we tell it that it should synchronize
CPU state on next entry after a reset.

This fixes PSCI handling, because now newly pushed state such as X0 and
PC on remote CPU enablement also get pushed into HVF.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/arm-powerctl.c | 1 +
 target/arm/cpu.c          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index b75f813b40..a49a5b32e6 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -15,6 +15,7 @@
 #include "arm-powerctl.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
+#include "sysemu/hw_accel.h"
 
 #ifndef DEBUG_ARM_POWERCTL
 #define DEBUG_ARM_POWERCTL 0
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index db6f7c34ed..9a501ea4bd 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -411,6 +411,8 @@ static void arm_cpu_reset(DeviceState *dev)
 #ifndef CONFIG_USER_ONLY
     if (kvm_enabled()) {
         kvm_arm_reset_vcpu(cpu);
+    } else if (hvf_enabled()) {
+        s->vcpu_dirty = true;
     }
 #endif
 
-- 
2.24.3 (Apple Git-128)


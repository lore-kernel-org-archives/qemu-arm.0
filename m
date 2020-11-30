Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4709627lfb;
        Sun, 29 Nov 2020 19:07:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybflWo7iVk5BJVcsplalmiyN2JSW72B4G+gZdKRqcU1hGW2FD6ujIWjFBsmzxrPPxzXOa/
X-Received: by 2002:a25:5d4:: with SMTP id 203mr22074986ybf.182.1606705672539;
        Sun, 29 Nov 2020 19:07:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606705672; cv=none;
        d=google.com; s=arc-20160816;
        b=NE6RQubJFdbENVUNpsb8V17S+OnaaYDa3Vd4D17yuLyz0a5tBrUaO7czZBoKucPsBz
         ThmTda4Kl9x7EZHEl4WhgNzl77LC7GPq/6/Pbky4/zM0M4lpnNLWHfIX0oC04ie3UBsv
         cUP79tEnVX4SFNKEmxZQBt9Mz77yWN2yK+T6rFP0QGpB3P17i5Ej0543w2HB+WrwFD39
         KGaF4oL5ZYCT04SP9NwfVMD6PVoTUKms26SM5LoGzfAgNPcQDDjB8Jvq82WI6riTw+fV
         V+V+cNf5AP+VINKOdtbgVukHWUNI7ZYQRVWpkB7wAo4PAChlqaWJx/ExM9ESy335dJmA
         gJaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=8KveTSC3CZA37zi2x3Zxa1XHJSKP7NH4EDpB+nz5DwE=;
        b=MHdM4FL+Srnjzj+KSeh/TG74+xhGSXSnk03+O/qCwS9QN2NiboLuUyNNLurFg3DMWv
         6F3IUSyuTlgNm4ElHVTrozOvxsofQZhOLoK7H1nc3db8z44CsLqqxR2z9pAIOl43uBzb
         IHtfnP0j5l4Sb5x5IW9g0716tdwh3qc7+CwqLgLnh5Bq9kWRaq/kABRevg2X+Lr82utT
         I3r7u3cNRR6lPMYdjCSWw5nW05Xm0fQ2OeLLLRGDIbUVUJ6nKbIjnI07Te6LWmZnhON/
         l1jLfAE6KJtszFnJLxzrVnzNWEuk03V5MjLxiEFnYj/QFbXfZ47/uJ5XcAHa3NlUHbrc
         IVSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 198si16124659ybd.370.2020.11.29.19.07.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Nov 2020 19:07:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjZXb-00005z-V3
	for alex.bennee@linaro.org; Sun, 29 Nov 2020 22:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kjZXH-000866-U3; Sun, 29 Nov 2020 22:07:31 -0500
Received: from mail.csgraf.de ([188.138.100.120]:35390
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kjZXG-00078C-8h; Sun, 29 Nov 2020 22:07:31 -0500
Received: from localhost.localdomain
 (dynamic-077-009-091-089.77.9.pool.telefonica.de [77.9.91.89])
 by csgraf.de (Postfix) with ESMTPSA id 7F21139004D6;
 Mon, 30 Nov 2020 04:07:27 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] hvf: arm: Mark CPU as dirty on reset
Date: Mon, 30 Nov 2020 04:07:21 +0100
Message-Id: <20201130030723.78326-7-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201130030723.78326-1-agraf@csgraf.de>
References: <20201130030723.78326-1-agraf@csgraf.de>
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
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lC9kaqaGubtS

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


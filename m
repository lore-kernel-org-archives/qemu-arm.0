Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1787591lfb;
        Thu, 26 Nov 2020 13:56:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9Q3RtX9s2lSGScp47yEYSbEFVpOXxdg+oR++9LoMpKrIzO5mNFfDGsUbLanT6WFHa3oFq
X-Received: by 2002:a25:2485:: with SMTP id k127mr5204734ybk.522.1606427793318;
        Thu, 26 Nov 2020 13:56:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606427793; cv=none;
        d=google.com; s=arc-20160816;
        b=sgjCTfP4LatvcxAfiZiarzMzKb5hLn6c1BzUKR8+X3CqPFtshIhW8SFMl3qg1by2aR
         di1HLqDJCKS4GRnBhfO8zKJdcye8YwTLY2RYX4t1HAO3UIq02j/yOvj3QhuPS1Gm/GHJ
         Ld7Zv8GGbPM/7EktphCqsGj/54ClhE7xUwzQvfu21S8dsFCg5o2US5yS6e35PLlBZSng
         4xkIaWNvS1RLGheH5Ro+MGet5AksfABHKXLmoYBDlfar7/7lZJL2G9E+l2kzsPDqpYnW
         WcCHLKMcoubGNejSUR8bL2hyj+ivkTpHiBu4Y4VwyTJpEslkBTnoH/yrkFWVRYIpQRei
         4blg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=apYShrcG+MlxobSP2g/bKYRJK2gok/VAaFJ68uBLj0g=;
        b=N4YawLYkmZoskLX0Sd2vezCBiBMx28OdN5ENMry6rZL4LkS6fTwy30G1pxaCWwXyc+
         z5/1TEcTISbjpoSRxBecldcEDNgR+wL11k2K+uFjxgxOs4T9nl+MJ+OO5CKG0APOQWtg
         DqB6URMdO/mPWaWloVNjUVjwkKqXx8WhvxVZf3OD8WWn+a2OiFQnD5nCE+bgfZ4vW7K+
         /AW/zTm6SJJeb3eWcVX9b6cg8EXzOKBcCjqzSgmt7F7ZT5JndUt6U8rOMegLHUVHhmJP
         ns6oLENJ1tSX4QUZhwWeZR9KKSmYF6+i923FIDb51pAdEGt58XhzOS20P0w7mrh0J+ZZ
         ntxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j129si5704132ybb.309.2020.11.26.13.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 13:56:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiPFg-000192-Ms
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 16:56:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kiP9r-0001s0-TB; Thu, 26 Nov 2020 16:50:31 -0500
Received: from mail.csgraf.de ([188.138.100.120]:60636
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kiP9m-0005ng-B6; Thu, 26 Nov 2020 16:50:31 -0500
Received: from localhost.localdomain
 (dynamic-077-009-187-158.77.9.pool.telefonica.de [77.9.187.158])
 by csgraf.de (Postfix) with ESMTPSA id CE7FE39005E9;
 Thu, 26 Nov 2020 22:50:21 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] hw/arm/virt: Disable highmem when on hypervisor.framework
Date: Thu, 26 Nov 2020 22:50:17 +0100
Message-Id: <20201126215017.41156-9-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201126215017.41156-1-agraf@csgraf.de>
References: <20201126215017.41156-1-agraf@csgraf.de>
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sQp0mZWMkpv4

The Apple M1 only supports up to 36 bits of physical address space. That
means we can not fit the 64bit MMIO BAR region into our address space.

To fix this, let's not expose a 64bit MMIO BAR region when running on
Apple Silicon.

I have not been able to find a way to enumerate that easily, so let's
just assume we always have that little PA space on hypervisor.framework
systems.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 hw/arm/virt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 27dbeb549e..d74053ecd4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -45,6 +45,7 @@
 #include "hw/display/ramfb.h"
 #include "net/net.h"
 #include "sysemu/device_tree.h"
+#include "sysemu/hvf.h"
 #include "sysemu/numa.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
@@ -1746,6 +1747,14 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
+    /*
+     * On Hypervisor.framework capable systems, we only have 36 bits of PA
+     * space, which is not enough to fit a 64bit BAR space
+     */
+    if (hvf_enabled()) {
+        vms->highmem = false;
+    }
+
     /*
      * In accelerated mode, the memory map is computed earlier in kvm_type()
      * to create a VM with the right number of IPA bits.
-- 
2.24.3 (Apple Git-128)


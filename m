Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp563889lfj;
        Fri, 14 Jan 2022 00:16:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeCX0sGzF79WSr1jmbHkCKGaQGRV9vUWM8S5+c5G/3IqrgKxzFbYZbfxPhQuKTpisrAJHx
X-Received: by 2002:a25:e809:: with SMTP id k9mr429241ybd.436.1642148203492;
        Fri, 14 Jan 2022 00:16:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642148203; cv=none;
        d=google.com; s=arc-20160816;
        b=O/wJi69P1q5rNChpiVSzHpOdiNgSZCAkiyYBRwTgPnSFeacxQhgxpd0nSkbJJzsf2V
         MQ/ukFDqfbRsQu0soIHggwvyg5JtKz9qvBtSCeibvtCHAOrVvgHjBkl5VQr/Yux2G+mN
         n3R70+G/6wGspa4oTo13SO1m8C8cD5pcP6kkcH8ob1pgDqGrmjnVRKTt1KROHeHO6cup
         41G6ZUZPUE5W1qUg1dHQ9TtE1Q/Q1f/qKltoH14mHCjU+BT0xrZTlVj6KkhbGvstSeun
         fDAmQgwtlp04MSTW8/WwMwEjmc9ev8ch5kH4ZgP2uYnphqkAxORVOy1v9eF6sx5BJMo4
         cg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:ironport-sdr;
        bh=bCw6jJigptvm0lQ8nrCeJnXUQxdkBrRnw0eGpeOFUwY=;
        b=JH8l79Fju2ETklXca8GniM/0F6nDT5m+/p0iwvJdgvVDfXao7ddBMvS+CmiQGQZGON
         jjTVwcLbXXwD+sO34wlF2uKlYN0ii3D9yjMPpZIYf9fU9Ics0//LupJm/SsdJi+ljgH8
         mVFIj74Lm7oSy0yXF5V2Bchf7iyZ0TuE4JOJHYDT7kFZ2t9VvdTTNd1aiBL4YjLKOe2L
         YHm27ReEqZHeGF4htAldDjdSnxeUXQI+lsj6/czIMTWZrYa6ftHrxQfnaC8Hv/4thpqm
         FiNyVl8dPo14e5IjC87XMf0iFiKVRJaSyVhDb/W+1p9tqN5kGL70jLpM52wStLVan3Or
         yczg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17si4456381ybk.805.2022.01.14.00.16.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jan 2022 00:16:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Received: from localhost ([::1]:43558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n8HlK-0002Cn-Rc
	for alex.bennee@linaro.org; Fri, 14 Jan 2022 03:16:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1n8GwX-00020n-Do; Fri, 14 Jan 2022 02:24:13 -0500
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252]:22606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1n8GwV-0002x5-9G; Fri, 14 Jan 2022 02:24:13 -0500
IronPort-SDR: SLemEI3a07OYuzkM0iWbffbogRQnllrBCGRRim8Pb8+QZBI+Vv7Ut164PNdLyzHFpRu47ca+T8
 eZkRwSDbvnBXQt0UO9DotvlpChk5fIW8Q+cdINBfgkJ6HvyFNd9SmZ7kIIw/vCy4jnfKSYa82b
 DendjtO3Elo1/lCE/sEhTONFt7dClZls6TXoBP0UA7E1B7tnWPfjrm0B8BaZISuzTkP0QwXZFO
 +s0IIe7x8Ax5OZha7yr501dcquvpTS8EfZJHHP02gkqdGPVwZBM8np1C7dgtQDM0Ukq/k3J0u1
 Hzedj3nCcbjD39jYxmEhpDWM
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="37952417"
X-IronPort-AV: E=Sophos;i="5.88,287,1635174000"; d="scan'208";a="37952417"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
 by esa7.hc1455-7.c3s2.iphmx.com with ESMTP; 14 Jan 2022 16:24:06 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com
 [192.168.87.59])
 by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 68310E6CA1;
 Fri, 14 Jan 2022 16:24:04 +0900 (JST)
Received: from oym-om2.fujitsu.com (oym-om2.o.css.fujitsu.com [10.85.58.162])
 by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AD26BDA89;
 Fri, 14 Jan 2022 16:24:03 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by oym-om2.fujitsu.com (Postfix) with ESMTP id 714C1404558A4;
 Fri, 14 Jan 2022 16:24:03 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org, mst@redhat.com, drjones@redhat.com,
 richard.henderson@linaro.org, f4bug@amsat.org, qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/virt: Default enable the virtualization option(VHE) on
 A64FX
Date: Fri, 14 Jan 2022 16:24:37 +0900
Message-Id: <20220114072438.3085054-1-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: neutral client-ip=139.138.61.252;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa7.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rbRtPC26ZXdS

At A64FX specification, VHE is enabled by default, so
the virtualization option should be enabled when -cpu a64fx
is specified.

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
---
 hw/arm/virt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b45b52c90e..56acf5cc7e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1932,6 +1932,12 @@ static void machvirt_init(MachineState *machine)
     firmware_loaded = virt_firmware_init(vms, sysmem,
                                          secure_sysmem ?: sysmem);
 
+    /* A64FX proceesor is supported the ARMv8.1-VHE */
+    if (!vms->virt &&
+            !strncmp(machine->cpu_type, ARM_CPU_TYPE_NAME("a64fx"), 13)) {
+        vms->virt = true;
+    }
+
     /* If we have an EL3 boot ROM then the assumption is that it will
      * implement PSCI itself, so disable QEMU's internal implementation
      * so it doesn't get in the way. Instead of starting secondary
-- 
2.27.0


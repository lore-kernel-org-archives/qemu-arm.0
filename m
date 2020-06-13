Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp450110lfm;
        Sat, 13 Jun 2020 14:45:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWJ9NAowGlf+Zzg4FbspO+Nrdsk/OjCtDek+PRgSXPOpTbVmFxob3Dab5Y8N0+IgQpmYFl
X-Received: by 2002:a25:dd81:: with SMTP id u123mr27666089ybg.146.1592084721191;
        Sat, 13 Jun 2020 14:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592084721; cv=none;
        d=google.com; s=arc-20160816;
        b=ffq5xFbYGMaoslyXFCm9l6M9/oYcxj2OU6qf4XKfPUoJLf0HiOcvqUwzAec7FsIyiG
         SCUCUF2M+3sE1QMJhQmyphdTA+LecqwM1YTRZgZIBN0qqr1uMUsRl+EyKnYpLmutGrHk
         nwqPc7JGZxuDJb76Hf5VPEXtXU7H5zU/hyftfhFe6EflchbvPkjGSIJPacLSReJq5ilg
         JU9C/gi9gfgEVtftEgwtHyaQm3laIpO4EWuE344kG9ANIFh28IzvDPdALTCWkI9zJ8fT
         2Ze4KYfk5lo0y9l1mbJy3kbj4fyMgGUc+XwRhoTSk9JFmIuuk5yKAHZBOsLBHaQzpjfa
         KTYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=wtwQKfIx5J29UKIgThsjKXDtoEedEIKaFw/Rwr/mIeU=;
        b=x45RA/MJFrPhd3ZyvteQz5I1Ar6jiUB1ea9qS+/EHIfGWIEUMXzDTuzTUpIlr8oapw
         Inuagb6WlAlFIcJq6ezR1XSmP0af/Pn4T+j4RZ0HByhFCe93IXbva1ICDwNhWJuSsxlh
         XWBKgZBuA0w3LtRXV3aWrMqgtqBW/n++T9jUhSltZQ+AWP17aZrfxG4hvs7c2dPejJvm
         dVNHj1HG7Y5zCV30iFMKeVB2NmEvVmwCDRpf9969rRoi50TWLwk+GcTE4z9gOIBlFyEh
         EofaHGRC/kq5s7iSb6qGpxE+x0XoXVFQ3T5TVsHywG0WsVIrf3Zu0YHwAHzlYShKtciE
         tatA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b203si8505230yba.469.2020.06.13.14.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jun 2020 14:45:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkDxo-0006Bc-Ik
	for alex.bennee@linaro.org; Sat, 13 Jun 2020 17:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDx5-00058v-LT; Sat, 13 Jun 2020 17:44:35 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:60464 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDx3-00035a-Qu; Sat, 13 Jun 2020 17:44:35 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2414FF40CEBE9F8A1DDE;
 Sun, 14 Jun 2020 05:44:25 +0800 (CST)
Received: from A190218597.china.huawei.com (10.47.30.60) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Sun, 14 Jun 2020 05:44:17 +0800
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH RFC 01/22] arm/cpuhp: Add QMP vcpu params validation support
Date: Sat, 13 Jun 2020 22:36:08 +0100
Message-ID: <20200613213629.21984-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20200613213629.21984-1-salil.mehta@huawei.com>
References: <20200613213629.21984-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.30.60]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 17:44:26
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, sudeep.holla@arm.com,
 gshan@redhat.com, mst@redhat.com, jiakernel2@gmail.com, maz@kernel.org,
 zhukeqian1@huawei.com, david@redhat.com, richard.henderson@linaro.org,
 linuxarm@huawei.com, eric.auger@redhat.com, james.morse@arm.com,
 catalin.marinas@arm.com, imammedo@redhat.com,
 Salil Mehta <salil.mehta@huawei.com>, pbonzini@redhat.com,
 mehta.salil.lnk@gmail.com, maran.wilson@oracle.com, will@kernel.org,
 wangxiongfeng2@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l5MI365xofIk

For now, vcpu hotplug is only supported with single socket single thread,
single die. NUMA is not supported either and everthing falls into single
node. Work to properly support these could be taken later once community
agrees with the base framework changes being presented to support ARM vcpu
hotplug in QEMU. Hence, these checks.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 37462a6f78..5d1afdd031 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2201,6 +2201,46 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
     return NULL;
 }
 
+static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
+{
+    if (opts) {
+        unsigned cpus    = qemu_opt_get_number(opts, "cpus", 1);
+        unsigned sockets = qemu_opt_get_number(opts, "sockets", 1);
+        unsigned cores   = qemu_opt_get_number(opts, "cores", cpus);
+        unsigned threads = qemu_opt_get_number(opts, "threads", 1);
+        unsigned int max_cpus;
+
+        if (sockets > 1 || threads > 1) {
+            error_report("does not support more than one socket or thread");
+            exit(1);
+        }
+
+        if (cores != cpus) {
+            error_report("cpu topology: "
+                         "sockets (%u) * cores (%u) * threads (%u) < "
+                         "smp_cpus (%u)",
+                         sockets, cores, threads, cpus);
+            exit(1);
+        }
+
+        max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
+        if (sockets * cores * threads > max_cpus) {
+            error_report("cpu topology: "
+                         "sockets (%u) * cores (%u) * threads (%u) > "
+                         "maxcpus (%u)",
+                         sockets, cores, threads,
+                         max_cpus);
+            exit(1);
+        }
+
+        ms->smp.max_cpus = max_cpus;
+        ms->smp.sockets = sockets;
+        ms->smp.cpus = cpus;
+        ms->smp.cores = cores;
+        ms->smp.threads = threads;
+    }
+}
+
 /*
  * for arm64 kvm_type [7-0] encodes the requested number of bits
  * in the IPA address space
@@ -2266,6 +2306,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->nvdimm_supported = true;
     mc->auto_enable_numa_with_memhp = true;
     mc->default_ram_id = "mach-virt.ram";
+    mc->smp_parse = virt_smp_parse;
 
     object_class_property_add(oc, "acpi", "OnOffAuto",
         virt_get_acpi, virt_set_acpi,
-- 
2.17.1



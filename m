Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp113050njf;
        Tue, 13 Aug 2024 05:57:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSWmapmNOTxGh4XFvQYA6t7ns5zAve2mNDbs5h/P7SN4OmRiiM9C0/8KpLX2uklSXVtGo97dsHfWJfoJ1NZw89Io1b0rhl
X-Google-Smtp-Source: AGHT+IFeB8C239+uPKHwzK3lYWP7IQj1FFnnENGNhSrvCKq92VThXK51T6qPEojekFEuMqrMD9vh
X-Received: by 2002:a05:6359:4110:b0:1ac:ef3a:cb27 with SMTP id e5c5f4694b2df-1b19d2cfec6mr462138155d.13.1723553877335;
        Tue, 13 Aug 2024 05:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723553877; cv=none;
        d=google.com; s=arc-20160816;
        b=foR6rXweRl0s09+Xf8cc16YaWWu5hUvsWsLmkIRSOSode8aH6fY08usPvxL4UOe/Ej
         TJRFJDE8651FNInOdGgGZgaTlCwBfHMX7AjnXNdy+xWf376uZUxuJxpcdlMDsKTJNCRh
         sJw1vSfgYtR+4fUVN7FymVKk1kSA+WEhbg6JmeHoQ9HwcR/vl+txK2/lyFVIh73Tn18X
         fUCdfFybLtUlLt7rxnPN6eoGdf1nWDcb0vfP7ESv1mJ7wblzTd3Ye1T1IjRxOiW2inn+
         IFLZ7WDHqY678IVAB8OR5cQyiP4c8H60kzmudl9j/3UU3JvtRaqBNlo6C3b56cSOJZtL
         b4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=eaPcJtKos0KNmAyBH2hBkU3aohokH4BLaf1n8ECyJvM=;
        fh=CxmKXzXx7RSqi8N/wGzfvq9MveadIzC0b0jJgoicVc8=;
        b=zo6uq1J4i4WDAbXI87+YB0c3gPIZKchFRJQwnnw66FXPK2bwZtttLjd/GWRMlgafzk
         yMVxfpCf5LMZoXeyg3+bLt0XHOXB42IqdT0sqTXBadrR1Z7N7gR+GNPi8k4unALaSBrJ
         AQgLggK8vSTRv/ruP9Z4W7jEtMNOsZ0KDwVDKeG466JCiVM2yQnVvTs+edIvIXodyJbt
         sLqZOp0V5RhWKnXsmYXYJINDo/sfR5U6RduraFK6n4IPFXWW/ap2/KLXZ8vmPsaosW9E
         ZfyX0gfRLEXNRAvpMMCQ6cin2EbtU7MbuOKFDGqeQ4pWVizE150d1srrWbS1UVLbMMUI
         iU5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4531c2c9ee9si81559111cf.780.2024.08.13.05.57.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2024 05:57:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sdr5r-0006KC-OC; Tue, 13 Aug 2024 08:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1sdr5p-0006Fz-Bo; Tue, 13 Aug 2024 08:57:41 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1sdr5n-0007Ql-7z; Tue, 13 Aug 2024 08:57:41 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id BE812DA092B;
 Tue, 13 Aug 2024 14:57:34 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 311D3460020; Tue, 13 Aug 2024 14:57:34 +0200 (CEST)
To: Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Eric Blake <eblake@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [PATCH-for-9.1] docs: Fix some typos (found by typos) and grammar
 issues
Date: Tue, 13 Aug 2024 14:56:38 +0200
Message-Id: <20240813125638.395461-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ORq+eIjJMCgU

Fix the misspellings of "overriden" also in code comments.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 docs/devel/migration/uadk-compression.rst | 4 ++--
 docs/interop/qemu-ga.rst                  | 2 +-
 docs/tools/qemu-vmsr-helper.rst           | 4 ++--
 hw/arm/smmu-common.c                      | 2 +-
 include/exec/memory.h                     | 2 +-
 qapi/rocker.json                          | 4 ++--
 qga/main.c                                | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/docs/devel/migration/uadk-compression.rst b/docs/devel/migration/uadk-compression.rst
index 3f73345dd5..64cadebd21 100644
--- a/docs/devel/migration/uadk-compression.rst
+++ b/docs/devel/migration/uadk-compression.rst
@@ -114,7 +114,7 @@ Make sure all these above kernel configurations are selected.
 
 Accelerator dev node permissions
 --------------------------------
-Harware accelerators(eg: HiSilicon Kunpeng Zip accelerator) gets registered to
+Hardware accelerators (eg: HiSilicon Kunpeng Zip accelerator) gets registered to
 UADK and char devices are created in dev directory. In order to access resources
 on hardware accelerator devices, write permission should be provided to user.
 
@@ -134,7 +134,7 @@ How To Use UADK Compression In QEMU Migration
   Set ``migrate_set_parameter multifd-compression uadk``
 
 Since UADK uses Shared Virtual Addressing(SVA) and device access virtual memory
-directly it is possible that SMMUv3 may enounter page faults while walking the
+directly it is possible that SMMUv3 may encounter page faults while walking the
 IO page tables. This may impact the performance. In order to mitigate this,
 please make sure to specify ``-mem-prealloc`` parameter to the destination VM
 boot parameters.
diff --git a/docs/interop/qemu-ga.rst b/docs/interop/qemu-ga.rst
index 9c7380896a..11f7bae460 100644
--- a/docs/interop/qemu-ga.rst
+++ b/docs/interop/qemu-ga.rst
@@ -50,7 +50,7 @@ Options
 .. option:: -c, --config=PATH
 
   Configuration file path (the default is |CONFDIR|\ ``/qemu-ga.conf``,
-  unless overriden by the QGA_CONF environment variable)
+  unless overridden by the QGA_CONF environment variable)
 
 .. option:: -m, --method=METHOD
 
diff --git a/docs/tools/qemu-vmsr-helper.rst b/docs/tools/qemu-vmsr-helper.rst
index 6ec87b49d9..9ce10b9af9 100644
--- a/docs/tools/qemu-vmsr-helper.rst
+++ b/docs/tools/qemu-vmsr-helper.rst
@@ -17,8 +17,8 @@ driver to advertise and monitor the power consumption or accumulated energy
 consumption of different power domains, such as CPU packages, DRAM, and other
 components when available.
 
-However those register are accesible under priviliged access (CAP_SYS_RAWIO).
-QEMU can use an external helper to access those priviliged register.
+However those registers are accessible under privileged access (CAP_SYS_RAWIO).
+QEMU can use an external helper to access those privileged registers.
 
 :program:`qemu-vmsr-helper` is that external helper; it creates a listener
 socket which will accept incoming connections for communication with QEMU.
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index d73ad62211..3f82728758 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -674,7 +674,7 @@ error:
 
 /*
  * combine S1 and S2 TLB entries into a single entry.
- * As a result the S1 entry is overriden with combined data.
+ * As a result the S1 entry is overridden with combined data.
  */
 static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
                         dma_addr_t iova, SMMUTransCfg *cfg)
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 02f7528ec0..296fd068c0 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1852,7 +1852,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n);
  * memory_region_unregister_iommu_notifier: unregister a notifier for
  * changes to IOMMU translation entries.
  *
- * @mr: the memory region which was observed and for which notity_stopped()
+ * @mr: the memory region which was observed and for which notify_stopped()
  *      needs to be called
  * @n: the notifier to be removed.
  */
diff --git a/qapi/rocker.json b/qapi/rocker.json
index 6950ca9602..73c7363b16 100644
--- a/qapi/rocker.json
+++ b/qapi/rocker.json
@@ -42,7 +42,7 @@
 ##
 # @RockerPortDuplex:
 #
-# An eumeration of port duplex states.
+# An enumeration of port duplex states.
 #
 # @half: half duplex
 #
@@ -55,7 +55,7 @@
 ##
 # @RockerPortAutoneg:
 #
-# An eumeration of port autoneg states.
+# An enumeration of port autoneg states.
 #
 # @off: autoneg is off
 #
diff --git a/qga/main.c b/qga/main.c
index b8f7b1e4a3..50186760bf 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -257,7 +257,7 @@ QEMU_COPYRIGHT "\n"
 "\n"
 "  -c, --config=PATH configuration file path (default is\n"
 "                    %s/qemu-ga.conf\n"
-"                    unless overriden by the QGA_CONF environment variable)\n"
+"                    unless overridden by the QGA_CONF environment variable)\n"
 "  -m, --method      transport method: one of unix-listen, virtio-serial,\n"
 "                    isa-serial, or vsock-listen (virtio-serial is the default)\n"
 "  -p, --path        device/socket path (the default for virtio-serial is:\n"
-- 
2.39.2


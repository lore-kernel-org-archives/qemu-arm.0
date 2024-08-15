Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396bc50sm112218666b.198.2024.08.15.07.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 07:49:20 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 82668603CF;
	Thu, 15 Aug 2024 15:49:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Michael Roth <michael.roth@amd.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org (open list:ARM SMMU)
Subject: [PULL 19/21] docs: Fix some typos (found by typos) and grammar issues
Date: Thu, 15 Aug 2024 15:49:09 +0100
Message-Id: <20240815144911.1931487-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240815144911.1931487-1-alex.bennee@linaro.org>
References: <20240815144911.1931487-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XcmrI0I2Gc/W

From: Stefan Weil via <qemu-devel@nongnu.org>

Fix the misspellings of "overriden" also in code comments.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20240813125638.395461-1-sw@weilnetz.de>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240813202329.1237572-20-alex.bennee@linaro.org>

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

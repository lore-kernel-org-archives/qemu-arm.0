Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1060487lfq;
        Thu, 10 Sep 2020 00:02:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaGJbwIwqz+XVFSGksdry42jkcAcY1C5iu2dAOATcd2dtshGoldDehl6RmnD02v6ogLnRV
X-Received: by 2002:a17:906:c0ce:: with SMTP id bn14mr7733260ejb.422.1599721348239;
        Thu, 10 Sep 2020 00:02:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599721348; cv=none;
        d=google.com; s=arc-20160816;
        b=o7cCXxdKlJhAoXusd7zjdrTGAtoneZier8JosaoMPjKTSSVJ1yVOvJ+quJXCHmT0VO
         222E109x65lH4qTFwrxRarqs78a7LIbNHeeqJ1kRPupOSwWNXmyGBO0B+sEmb2001iJM
         jSCN08PFw14cK6mBjyAJDV30upYxALr28I776OFAHLUsHEyuKsB3f8DSF8rk9uIADcr6
         +gPkW1Gh/AcQXjGrN5quoPzLfiX8V6CsgvVcQuijiyvURLO29f5Huv0XHIa737DHM8lR
         paT701XzkzarTjv0rymbSQEAOy9iol1zz8RaI6VPM1T6Z5CLxrUCsug8bLtLq7e0lYXP
         I/jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=O4TiFU/E5h3g7pzVC+3Y38BqYPnJSqtGxVteMoOcLyc=;
        b=R+LfvrblFq7Aowy+m0dkHbuWIgEZMGKoMrr4vPrKwrX9ayuZGKMz7IVe2MrEq35fp4
         ph/AqZY4XL3gcngUbxSXW68TEa8lk60nemm4GHD32NP8R3mXWVjeJouwzGIMAADwSKyA
         xAXfiNNGmpuFnFw0MiGK2WQgXavroXKaxyzCT6XmGj3pefDrqcHOcM2wa5BxakMBOqfu
         L0IU24xPQXUAT+heQ2yg9sroxeyu4wX/khh3Ut74KaKt+tKSJ0I9i9G+8fhZHhpyjeR7
         ZmK7DEqK+8fejkggn074FKx6plHPxMJ64f81SfV2Z+6lPJIk5LB4TadquqaDXM9RFWyp
         jWag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gYL6QD2N;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id r11si3005621eju.461.2020.09.10.00.02.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 00:02:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gYL6QD2N;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599721347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4TiFU/E5h3g7pzVC+3Y38BqYPnJSqtGxVteMoOcLyc=;
	b=gYL6QD2Npi/lBH4sLQF8EGmLYu2o5up0vmh1zPHJGYATKrEipq/xTEal4mWcdtlP+yNens
	F94+6jaa8gN6XEOfOfFBZbLGNbwZUS8nlInfQwAt1B07OO/1EcYvUJvNa1ayqh4zEtlqfM
	PhWE+pnclCr5cnes5kS5rh/9gNPDh2A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-3xqAKHUOMQm55_R-duoxLg-1; Thu, 10 Sep 2020 03:02:03 -0400
X-MC-Unique: 3xqAKHUOMQm55_R-duoxLg-1
Received: by mail-wm1-f72.google.com with SMTP id m25so1309440wmi.0
        for <alex.bennee@linaro.org>; Thu, 10 Sep 2020 00:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O4TiFU/E5h3g7pzVC+3Y38BqYPnJSqtGxVteMoOcLyc=;
        b=mzzVaO8OWfFTJPGfQhckLgX3DzVn8NT+9xyVBEcEi8cENRRw7Z/ra5Y0UakqV5Td0f
         oo6det2CQk7Xk1YLpkTk96lX66XGdtLWMP9XOjS6MI12bbq1NsMNUwItyVvJzzyiPjYa
         1vK8LaOqCuxgh2tKPPVkRfJDoKJXa7Cu9v9B6ZdKjLKbN8iPDApOCd0YmQmu99uZJ+AZ
         vdxQpeAhK5yLsB7p5givE/bw9PMH5+8g5E1E64zXqhGII6IJEZy78LJAv5dxzFzDD6PR
         +RVXZWNfUWSGfIJT91djD+UtrRVdxnwaGBuZmAMl5RIOAQWAIQBtrYuKu5lbmg64zg2B
         TyXA==
X-Gm-Message-State: AOAM533rQRQbQ0QJRY30LiJavxuxK5zBVqJHjiTUTz++7Q3rJ/apY1ZU
	7pyizcEIx4O0CYUYjd2yaAv6EIACoMF/S5QSMGiMNTnk/fsMdgF6JGhUlI2AjRpaAOD4pX8nlVZ
	ZIjlpsl4RolJP+/48
X-Received: by 2002:a1c:c256:: with SMTP id s83mr7016236wmf.93.1599721322687;
        Thu, 10 Sep 2020 00:02:02 -0700 (PDT)
X-Received: by 2002:a1c:c256:: with SMTP id s83mr7016210wmf.93.1599721322497;
        Thu, 10 Sep 2020 00:02:02 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id z15sm7347660wrv.94.2020.09.10.00.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 00:02:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Jason Wang <jasowang@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	qemu-trivial@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 5/6] hw/pci-host/q35: Rename PCI 'black hole as '(memory) hole'
Date: Thu, 10 Sep 2020 09:01:30 +0200
Message-Id: <20200910070131.435543-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910070131.435543-1-philmd@redhat.com>
References: <20200910070131.435543-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: oC+H/+jUeO6s

In order to use inclusive terminology, rename "blackhole"
as "(memory)hole".

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci-host/q35.h |  4 ++--
 hw/pci-host/q35.c         | 38 +++++++++++++++++++-------------------
 tests/qtest/q35-test.c    |  2 +-
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index 070305f83df..0fb90aca18b 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -48,8 +48,8 @@ typedef struct MCHPCIState {
     PAMMemoryRegion pam_regions[13];
     MemoryRegion smram_region, open_high_smram;
     MemoryRegion smram, low_smram, high_smram;
-    MemoryRegion tseg_blackhole, tseg_window;
-    MemoryRegion smbase_blackhole, smbase_window;
+    MemoryRegion tseg_hole, tseg_window;
+    MemoryRegion smbase_hole, smbase_window;
     bool has_smram_at_smbase;
     Range pci_hole;
     uint64_t below_4g_mem_size;
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index b67cb9c29f8..21f58ccfa28 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -266,20 +266,20 @@ static const TypeInfo q35_host_info = {
  * MCH D0:F0
  */
 
-static uint64_t blackhole_read(void *ptr, hwaddr reg, unsigned size)
+static uint64_t memoryhole_read(void *ptr, hwaddr reg, unsigned size)
 {
     return 0xffffffff;
 }
 
-static void blackhole_write(void *opaque, hwaddr addr, uint64_t val,
+static void memoryhole_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned width)
 {
     /* nothing */
 }
 
-static const MemoryRegionOps blackhole_ops = {
-    .read = blackhole_read,
-    .write = blackhole_write,
+static const MemoryRegionOps memoryhole_ops = {
+    .read = memoryhole_read,
+    .write = memoryhole_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid.min_access_size = 1,
     .valid.max_access_size = 4,
@@ -393,12 +393,12 @@ static void mch_update_smram(MCHPCIState *mch)
     } else {
         tseg_size = 0;
     }
-    memory_region_del_subregion(mch->system_memory, &mch->tseg_blackhole);
-    memory_region_set_enabled(&mch->tseg_blackhole, tseg_size);
-    memory_region_set_size(&mch->tseg_blackhole, tseg_size);
+    memory_region_del_subregion(mch->system_memory, &mch->tseg_hole);
+    memory_region_set_enabled(&mch->tseg_hole, tseg_size);
+    memory_region_set_size(&mch->tseg_hole, tseg_size);
     memory_region_add_subregion_overlap(mch->system_memory,
                                         mch->below_4g_mem_size - tseg_size,
-                                        &mch->tseg_blackhole, 1);
+                                        &mch->tseg_hole, 1);
 
     memory_region_set_enabled(&mch->tseg_window, tseg_size);
     memory_region_set_size(&mch->tseg_window, tseg_size);
@@ -456,7 +456,7 @@ static void mch_update_smbase_smram(MCHPCIState *mch)
     } else {
         lck = false;
     }
-    memory_region_set_enabled(&mch->smbase_blackhole, lck);
+    memory_region_set_enabled(&mch->smbase_hole, lck);
     memory_region_set_enabled(&mch->smbase_window, lck);
     memory_region_transaction_commit();
 }
@@ -601,13 +601,13 @@ static void mch_realize(PCIDevice *d, Error **errp)
     memory_region_set_enabled(&mch->high_smram, true);
     memory_region_add_subregion(&mch->smram, 0xfeda0000, &mch->high_smram);
 
-    memory_region_init_io(&mch->tseg_blackhole, OBJECT(mch),
-                          &blackhole_ops, NULL,
-                          "tseg-blackhole", 0);
-    memory_region_set_enabled(&mch->tseg_blackhole, false);
+    memory_region_init_io(&mch->tseg_hole, OBJECT(mch),
+                          &memoryhole_ops, NULL,
+                          "tseg-hole", 0);
+    memory_region_set_enabled(&mch->tseg_hole, false);
     memory_region_add_subregion_overlap(mch->system_memory,
                                         mch->below_4g_mem_size,
-                                        &mch->tseg_blackhole, 1);
+                                        &mch->tseg_hole, 1);
 
     memory_region_init_alias(&mch->tseg_window, OBJECT(mch), "tseg-window",
                              mch->ram_memory, mch->below_4g_mem_size, 0);
@@ -619,13 +619,13 @@ static void mch_realize(PCIDevice *d, Error **errp)
      * This is not what hardware does, so it's QEMU specific hack.
      * See commit message for details.
      */
-    memory_region_init_io(&mch->smbase_blackhole, OBJECT(mch), &blackhole_ops,
-                          NULL, "smbase-blackhole",
+    memory_region_init_io(&mch->smbase_hole, OBJECT(mch), &memoryhole_ops,
+                          NULL, "smbase-hole",
                           MCH_HOST_BRIDGE_SMBASE_SIZE);
-    memory_region_set_enabled(&mch->smbase_blackhole, false);
+    memory_region_set_enabled(&mch->smbase_hole, false);
     memory_region_add_subregion_overlap(mch->system_memory,
                                         MCH_HOST_BRIDGE_SMBASE_ADDR,
-                                        &mch->smbase_blackhole, 1);
+                                        &mch->smbase_hole, 1);
 
     memory_region_init_alias(&mch->smbase_window, OBJECT(mch),
                              "smbase-window", mch->ram_memory,
diff --git a/tests/qtest/q35-test.c b/tests/qtest/q35-test.c
index b7cf1449906..7cddd0a7f61 100644
--- a/tests/qtest/q35-test.c
+++ b/tests/qtest/q35-test.c
@@ -231,7 +231,7 @@ static void test_smram_smbase_lock(void)
         qpci_config_writeb(pcidev, MCH_HOST_BRIDGE_F_SMBASE, i);
         g_assert(qpci_config_readb(pcidev, MCH_HOST_BRIDGE_F_SMBASE) == 0x02);
 
-        /* RAM access should go into black hole */
+        /* RAM access should go into memory hole */
         qtest_writeb(qts, SMBASE, SMRAM_TEST_PATTERN);
         g_assert_cmpint(qtest_readb(qts, SMBASE), ==, 0xff);
     }
-- 
2.26.2

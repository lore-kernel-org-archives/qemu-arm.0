Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2196C44501
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 22:44:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whEVw-0001NO-AN; Tue, 07 Jul 2026 18:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEVv-0001MP-0b
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:39 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEVr-0004AJ-VJ
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:38 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2cad8076b01so951515ad.2
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 15:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783464211; x=1784069011; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0POncQiCikAc5guGwIPh9olnmP/V6mz621ilQVpgEaE=;
 b=KkafDLt94dpSnW8tD166PdCvnfSjibYEa8T3/B0ir2C5mOlV/s+Dv9jcqjp6lgRoI8
 YOwWXUo9kmN9PO7koC7nXvMi9XnRxKpnsdp9thjpjo74xdMVOI5+kBGtVf0D85Qa37xD
 v5qxxTJrooOHi5qEkUTejtX5hcQpdOx4JBLr+3TLbUMCxCS7h1cIK8iDuFwfE3KmugQ5
 hwrqPLQYz1DGSWfDvGmmik/MIw5qb+KP7qBykIPESfpaPtYZ/UHjKQ1dlywvSar+YCYW
 0ZpNA2IziKu94IQuQvI/3lsJhJqTMZVV6wAnpMqipmfZ3s42uDsB1jhbf4GSjn/d0rvM
 TUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783464211; x=1784069011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0POncQiCikAc5guGwIPh9olnmP/V6mz621ilQVpgEaE=;
 b=Fqsxo/9+K6XW+ZyAMiMQJeBiCjT4+6X41NuNekMoh+K++O1AHb/dIpNw6xoJn1l8AC
 hNxR+o2JNUQPsuaipp+eXk+Xw5UzrXUjGF+GiqfcUnx6MU5cZBrVE1GeFwlig1Mk7REP
 vWGwot996FlNlcEfuiDI6+ZeFQfOvC4hqSOKVNI3Lh1TDzoG3TLMF5Ht47reddHvT7ir
 YZymKrz1e1YV5Gg9qv0tjelyxHKiu5/58/ENtlktz8zvspLiRwgaW5j+3uSLTPYqm9eJ
 M7WZEqOPPPgmx0WOpAa324gpkDB1VFp8ZHjtNzbYzziAi5U6mAJ9HzviU/4xvoa/VdN5
 ifDQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrdP10Qrm2n6GkC/gBsNsaRVn9B9a5mYPnyVGs7nKGgplI54u/JSaNDXzptJnmtMoF4IHu05JL4WA==@nongnu.org
X-Gm-Message-State: AOJu0YzDf3gpO1eC1gqUvkbymnGpJyiUx5HtwFr3bBTv0C/ER7MiXHRV
 NkE8gcC2p/AX6Ou/bdaivt2ot0Nk5S2wRnLr5IrOIdMQP5kzKLTG+ayNtNZ8ma+hAIM=
X-Gm-Gg: AfdE7cmmxdm+iwpY0qxUkOlS5edq/cJCg3NLsChYMx15kAWBxd0xPKA2EGjV4E6wmiq
 o3QQpj0SVcXcSwvL/HMyjwEoPJej/v0CrHRJqY6w0F2oHVbNoId+OGaLC8JQ2NvoVqdYq7u8Art
 cu1HSe7paay2LWzF4ncztuCryxfmcbY9BylWtL2fNS9Ho2H2Mjkcip4eQRzXNDbrRVt4o/KyMmC
 Og1753H3s6rGgqYsHCoVIFwy7vJMSur8kAP6O8+oL1/BELguVW4yBwSoo0tGbtEvTH1nCFLitLq
 o5IOjmlrrswqG5G1h9MF2ALlVS9G6QnqQPq90voipADi9xGYqmhySlyWrpH6Gx4r4BFVgLYVy09
 Ap1zENuQ+oiQuddWN0qDdUBX/Hy2UX0Q/PSjpfck+c58jkggI+UmOWTtnHn03eQ5MHqXcNWV1jR
 LEN0gcmOFGKmP+d22j3xnxzS6PLv59BhS9+JXwEik=
X-Received: by 2002:a17:903:1b25:b0:2cc:9e99:55c9 with SMTP id
 d9443c01a7336-2ccbf07a111mr68428465ad.26.1783464210619; 
 Tue, 07 Jul 2026 15:43:30 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:46c8:dda7:40fa:8958])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bbaesm18183805ad.57.2026.07.07.15.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 15:43:30 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, jpb@kernel.org, lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v1 10/25] hw/core/loader: Add a ROM loader notifier
Date: Tue,  7 Jul 2026 16:42:51 -0600
Message-ID: <20260707224306.1202330-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Add a function to register a notifier that is invoked when ROMs get
loaded into guest memory.

It will be used by Arm confidential guest support, in order to register
all blobs loaded into memory with KVM, so that their content is moved
into Realm state and measured into the initial VM state.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/core/loader.c         | 15 +++++++++++++++
 include/hw/core/loader.h | 17 +++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 5cbfba0a86d2..b3d769bec5cb 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -74,6 +74,8 @@
 #endif
 
 static int roms_loaded;
+static NotifierList rom_loader_notifier =
+    NOTIFIER_LIST_INITIALIZER(rom_loader_notifier);
 
 /* return the size or -1 if error */
 int64_t get_image_size(const char *filename, Error **errp)
@@ -1201,6 +1203,11 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
     return mr;
 }
 
+void rom_add_load_notifier(Notifier *notifier)
+{
+    notifier_list_add(&rom_loader_notifier, notifier);
+}
+
 /* This function is specific for elf program because we don't need to allocate
  * all the rom. We just allocate the first part and the rest is just zeros. This
  * is why romsize and datasize are different. Also, this function takes its own
@@ -1242,6 +1249,7 @@ ssize_t rom_add_option(const char *file, int32_t bootindex)
 static void rom_reset(void *unused)
 {
     Rom *rom;
+    RomLoaderNotifyData notify;
 
     QTAILQ_FOREACH(rom, &roms, next) {
         if (rom->fw_file) {
@@ -1290,6 +1298,13 @@ static void rom_reset(void *unused)
         address_space_flush_icache_range(rom->as, rom->addr, rom->datasize);
 
         trace_loader_write_rom(rom->name, rom->addr, rom->datasize, rom->isrom);
+
+        notify = (RomLoaderNotifyData) {
+            .addr = rom->addr,
+            .len = rom->datasize,
+            .as = rom->as,
+        };
+        notifier_list_notify(&rom_loader_notifier, &notify);
     }
 }
 
diff --git a/include/hw/core/loader.h b/include/hw/core/loader.h
index d9431e8a8d12..94cf6ad2e26b 100644
--- a/include/hw/core/loader.h
+++ b/include/hw/core/loader.h
@@ -342,6 +342,23 @@ void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size);
 ssize_t rom_add_vga(const char *file);
 ssize_t rom_add_option(const char *file, int32_t bootindex);
 
+typedef struct RomLoaderNotifyData {
+    /* Address of the blob in guest memory */
+    hwaddr addr;
+    /* Length of the blob */
+    size_t len;
+    /* Address space of the blob */
+    AddressSpace *as;
+} RomLoaderNotifyData;
+
+/**
+ * rom_add_load_notifier - Add a notifier for loaded images
+ *
+ * Add a notifier that will be invoked with a RomLoaderNotifyData structure for
+ * each blob loaded into guest memory, after the blob is loaded.
+ */
+void rom_add_load_notifier(Notifier *notifier);
+
 /* This is the usual maximum in uboot, so if a uImage overflows this, it would
  * overflow on real hardware too. */
 #define UBOOT_MAX_DECOMPRESSED_BYTES (64 << 20)
-- 
2.43.0



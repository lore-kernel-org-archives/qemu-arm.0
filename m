Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08C4C61DBD
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:02:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzD6-0003hH-TC; Tue, 25 Aug 2026 18:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCx-0003Sm-Fx
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:28 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCv-0001W0-Nt
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:27 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2d032846c95so4832385ad.1
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695284; x=1788300084; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ycFh0f47IuceK21rmhYjAzxurWXaF92SY8dhiJMI5DE=;
 b=WA/vwaPLD2FumlDtapRGoCySttWoQW1TFegYK8mCPWzDLOlDS+6prrD8jxBUaiq10l
 ZHIM+fpgioUeHJx2hNFxdguq64LbIQwA5UbLlT5dFgJYKYGg33n+n6MkSoZv6BLDz/jM
 NWtFwgqlf1wnO12DoInbAC80ha/gWOe6Ppw31ZME/KshVBAacFpJRrJ0rH15ln3fmu+J
 fbJ4pujWs/df1mF8ykFpuYzSnBt4kr6DouCR5UhQ9Y/Xf/iG+r0LmF1IXbUSCSN9S1qS
 Dd8a6fDmE4l//twP1X9ykdT7vMvRGgmIQD8QdKXRwGO+NQTHqZZ7DaIVMij7JQFpaiq0
 juEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695284; x=1788300084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ycFh0f47IuceK21rmhYjAzxurWXaF92SY8dhiJMI5DE=;
 b=UFzbX0PD5IECmEr2WBNA2AVgmYQNANyvMpf62XhXvbm1XrFFRarlOQc7Kaem6D8vE5
 +OGVSjNzAGyzxoukcm996tAB0Q2vi+3uG84d4wTpe4HVNW1cSQ134GnNrPFRCvawAogn
 eoXdHDtnui+akXF0bRxaK2v4rhZglmMXQFSXyMPlD7yVx1Pz0n5/+vNdq6uS2EoZBMJo
 /vk6T/7Lj5u1V6n4v/3nXFDwZmurJxGLYZGErAQoBVacFWOKr/YViEI9PseGxYvdUz4n
 XfKo6Vr/Jre24BS5o32v5za+8r9rcUQuw5KTr9KAGC5S45qCFgWaCrMNiEqOGWllYpiY
 FTyg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoRLg87UBINomkbiv/0b9R9F/348RpEmdinPKWXTHQAYfCpzM3YbUQzxXDSt1oMdr6+RxQ4Gqgu6w==@nongnu.org
X-Gm-Message-State: AFuF++lejUHVqXIPsN0yy6l+iKIzS/4Lys8PJ3Wdjwfe+Aga3B/R2sqa
 K36zYIZhI4f2M39iE1iW8JqOYeyAivv5fbgMg0rutw2bO02uUQjGdUMVhBOG/6E2HdU=
X-Gm-Gg: AR+sD11m1k2MNMQCMGWqLVyKfpX4w+r2fEmD4495FEDcoNbBDVNpbwzZ64eZVqjjBdk
 SdPUs/bnNe/GF53PnKjmQf1PlidRzs0o2m9KPI7VhirCdBHChxCOWOgWh4uz3EAB5xEwmgm5in6
 s8dMVwG31FsbfQrJdEYUM4IXRrIUW4cb99D0SgD0D9XEp7WapMOtWuxpO9lLBVZjjfz0xvZwTiW
 4E0w5iH9zuLk4A7IoUhrU4wDYs0AcDuNryFr/MddNIndViYvYG1CKRVENaXS1yLbxk+SDwkXO/r
 x2AhDNVq+6nhq+DBch6WdHNa+ghJiQAiQpWvnJ3uT8QTXnQQ9CrQG8D3Sa9IZ3gn5O9vo8TD/8A
 LpzyG+jLHM+7qVKGSoCL0dZMRutWzPPdpoRvoCq/Q5tmECIiEAeVJS4NRjqc66ZScjWMNIDa0LY
 tbqoENcvvSjmZK2jnDKaPkRICLOaaL/QYfsyJ9AIEiJ0AHKWyIYaATVLix4fMHPNxRDM5SDNphR
 ZJi4t2F+Dh97Tf2QvQ11HGnqQ==
X-Received: by 2002:a17:90b:17d1:b0:38e:8300:af51 with SMTP id
 98e67ed59e1d1-3966d20b09fmr3611610a91.8.1787695284101; 
 Tue, 25 Aug 2026 15:01:24 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:23 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 09/24] hw/core/loader: Add a ROM loader notifier
Date: Tue, 25 Aug 2026 16:00:46 -0600
Message-ID: <20260825220101.3443954-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/core/loader.c         | 15 +++++++++++++++
 include/hw/core/loader.h | 17 +++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 5cbfba0a86d2..388f10e828db 100644
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
+            .data = rom->data,
+        };
+        notifier_list_notify(&rom_loader_notifier, &notify);
     }
 }
 
diff --git a/include/hw/core/loader.h b/include/hw/core/loader.h
index d9431e8a8d12..fdfddfa7443e 100644
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
+    /* Blog data */
+    uint8_t *data;
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



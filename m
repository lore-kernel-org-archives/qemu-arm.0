Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53351088E63
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 02:28:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w335x-0003mD-Iu; Wed, 18 Mar 2026 22:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1w335t-0003jV-HY
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 22:26:41 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1w335r-0002sa-Pe
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 22:26:41 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-79a610a32a6so6746877b3.0
 for <qemu-arm@nongnu.org>; Wed, 18 Mar 2026 19:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773887199; x=1774491999; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tj5zvCy48mw2g9/BEVzB0FOExoU07LA09j0teQZUMxY=;
 b=KbybQ//RwTPSOkMhhQnKZ35QBMlv4ccKDrtSsAv/IWCY8pzIwGC63EGo8ZJgIzjzTM
 G5SeY1XxYXy7L1PHpbRINC9Cif4b9Aofb5k4J5dx67ZtFjEntMol+++/Y2LeFlwnwQm0
 TUmlQguQehMsYvqw2jCKtmEyikqecj5M1zJRUifqRhBGYR7IKATVJRQZqJ/UuMIt57SV
 n3brlpOVbnltPaI/VOY5+KhXLeQ5YIXIOPI6PridFPNulb3MGD6PcN4V3k9l5wvKR++d
 zjFep4mzndWS4nKi5meqqDfqOJzw/ctiC4n7+0X4ZRmR+QPQQLvR9yt8lGr/0CfsGZe1
 KsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773887199; x=1774491999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Tj5zvCy48mw2g9/BEVzB0FOExoU07LA09j0teQZUMxY=;
 b=nfETc3O5A0iyas4m1qyngkUWE5ebV1ESTpP0rv3YSgkirBjCXVXZnQBXwyje8vP7em
 zmzRk6y1ksov6BmA4mdaUEzhfALdSFi8g9JP4aPvPs9MYTMl0xkSqVRTOiabTvBvYzD2
 2L+aakAqGKnI0LIavZ8ApHZxzgJwIIz21vSlWf57umqjEeWZ9TLpw65yct0Df2jk8mUm
 o/HPNd3eCACY98WflAQNTosvFdKFx2vPTChnRo2muTi3muFF+0bpLOykjitw0TKqPj6X
 QAk6SUtJQoANgtJTsRQSkQ7fiCJgswW7MP8Fd1BOBEjkNBVonILXdOF/vhiNUk9vq14n
 ce9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYn2+e2EAsmoOIIvq3bHdZoWbjIBDTb8sYFMsSBFbP5yuEZxLNHthu/WYqBlJxvjMOj2OEWhog+Q==@nongnu.org
X-Gm-Message-State: AOJu0YywbyzRrTjCbSqt6O3roCyp31b6CIuSkh8o061hJ+qHrBSoSiIm
 /nE0lKzWE/TOfhu5aWkZzWfY08GIk6f3ENRFR2tvMelyLbrtHFkrQeEvXrjjIELKDdXPO9AqeQy
 IxPKqpgY=
X-Gm-Gg: ATEYQzy+qiJPr+4YUvPV4qCZTn7Ex9dppu1Dgd5aDVgptXogVYtCAhL8kzwu9MD8FAt
 wDyxG/iY+Yj84UrQz4LZAxogWhW57xUN9y4vT5ogXR+IPISgYRLCqHbFbGrlii60/JsUf8BLaYc
 sQoCmnoLdcjxvHHYTHMjfIloYlonppYZ0BoIlt7hecTG10mCybOmhgpwF/vVWBwNfWN3ntn5Fwb
 y6d/uX53fwoyu4/VpfY+WOntQarzd7lXVU0FahLJvRy8ixbURIhUZ+lm+lKTq5EzO612kkdJ7ji
 jEutcUWorRjGgxgitZVLBYTcYMIBIwNnRuJ0VwYYqOWbvIaSGq7SoxPXbxg4gLlYZv81TR9TZC4
 Z9q0L6E/nwHUfKel/pc4bjhJN7tqZTZbvFghVU3K7tLox4neuioKdT68Qvv9F0nAH/H/w/JMO3p
 vtzZkhFBaoU9xXDNAukF+TQGYKEytUBA==
X-Received: by 2002:a05:690c:4dc5:20b0:799:266:83ba with SMTP id
 00721157ae682-79a71830746mr47572837b3.4.1773887198700; 
 Wed, 18 Mar 2026 19:26:38 -0700 (PDT)
Received: from gromero0.. ([177.146.137.168]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-79a7141eb65sm28159417b3.21.2026.03.18.19.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 19:26:38 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org, gustavo.romero@linaro.org
Subject: [RFC PATCH 5/7] hw/arm/virt: Add machine option 'mec'
Date: Wed, 18 Mar 2026 23:23:33 -0300
Message-Id: <20260319022335.22523-6-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319022335.22523-1-gustavo.romero@linaro.org>
References: <20260319022335.22523-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=gustavo.romero@linaro.org; helo=mail-yw1-x1131.google.com
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

Add new machine option 'mec' that enables and sets the memory used by
FEAT_MEC.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/arm/virt.c         | 76 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 77 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cab2e21e8a..7d127a4205 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1762,6 +1762,27 @@ static void create_tag_ram(MemoryRegion *tag_sysmem,
     memory_region_add_subregion(tag_sysmem, base / 32, tagram);
 }
 
+static void create_mec_ram(MemoryRegion *tag_sysmem,
+                           hwaddr base, hwaddr size,
+                           const char *name)
+{
+    memory_region_init_ram(tag_sysmem, NULL, name, size / 32, &error_fatal);
+}
+
+static void create_mec_ram_fake_page(MemoryRegion *mr, uint64_t size, const char *name)
+{
+    assert(is_power_of_2(size) );
+    assert(size >= sizeof(uint32_t));
+
+    uint32_t *ptr = g_malloc(size);
+
+    for (int i = 0; i < size / sizeof(uint32_t); i++) {
+        ptr[i] = 0xDEADBEEF;
+    }
+
+    memory_region_init_ram_ptr(mr, NULL, name, size, ptr);
+}
+
 static void create_secure_ram(VirtMachineState *vms,
                               MemoryRegion *secure_sysmem,
                               MemoryRegion *secure_tag_sysmem)
@@ -2267,6 +2288,8 @@ static void machvirt_init(MachineState *machine)
     MemoryRegion *secure_sysmem = NULL;
     MemoryRegion *tag_sysmem = NULL;
     MemoryRegion *secure_tag_sysmem = NULL;
+    MemoryRegion *pseudo_encrypted_page = NULL;
+    MemoryRegion *tuple_memory = NULL;
     int n, virt_max_cpus;
     bool firmware_loaded;
     bool aarch64 = true;
@@ -2495,6 +2518,28 @@ static void machvirt_init(MachineState *machine)
             }
         }
 
+        if (vms->mec) {
+            if (tcg_enabled()) {
+                if (tuple_memory == NULL) {
+                    /* XXX(gromero): Add object_property_find(cpuobj, "tuple-memory", ...) here. */
+
+                    tuple_memory = g_new(MemoryRegion, 1);
+                    memory_region_init(tuple_memory, OBJECT(machine), "mec", UINT64_MAX / 32);
+
+                    pseudo_encrypted_page = g_new(MemoryRegion, 1);
+                    memory_region_init(pseudo_encrypted_page, OBJECT(machine), "mec-page", 4 * 1024 /* 4 KiB */);
+                }
+
+                object_property_set_link(cpuobj, "mec",  OBJECT(tuple_memory), &error_abort);
+                object_property_set_link(cpuobj, "mec-page",  OBJECT(pseudo_encrypted_page), &error_abort);
+
+                } else {
+                    /* Check for other accels here. */
+                    error_report("MEC requested, but not supported");
+                    exit(1);
+                }
+        }
+
         qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
         object_unref(cpuobj);
     }
@@ -2561,6 +2606,14 @@ static void machvirt_init(MachineState *machine)
                        machine->ram_size, "mach-virt.tag");
     }
 
+    if (tuple_memory) {
+        create_mec_ram(tuple_memory, vms->memmap[VIRT_MEM].base, machine->ram_size, "tuple-memory");
+    }
+
+    if(pseudo_encrypted_page) {
+       create_mec_ram_fake_page(pseudo_encrypted_page, 4 * 1024, "mec-fake-page");
+    }
+
     vms->highmem_ecam &= (!firmware_loaded || aarch64);
 
     create_rtc(vms);
@@ -2966,6 +3019,20 @@ static void virt_set_mte(Object *obj, bool value, Error **errp)
     vms->mte = value;
 }
 
+static bool virt_get_mec(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->mec;
+}
+
+static void virt_set_mec(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->mec = value;
+}
+
 static char *virt_get_gic_version(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -3602,6 +3669,12 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
                                           "guest CPU which implements the ARM "
                                           "Memory Tagging Extension");
 
+    object_class_property_add_bool(oc, "mec", virt_get_mec, virt_set_mec);
+    object_class_property_set_description(oc, "mec",
+		                          "Set on/off to enable/disable emulating a"
+					  "guest CPU which implements the ARM"
+					  "Memory Encryption Extention");
+
     object_class_property_add_bool(oc, "its", virt_get_its,
                                    virt_set_its);
     object_class_property_set_description(oc, "its",
@@ -3686,6 +3759,9 @@ static void virt_instance_init(Object *obj)
     /* MTE is disabled by default.  */
     vms->mte = false;
 
+    /* FEAT_MEC is disabled by default. */
+    vms->mec = false;
+
     /* Supply kaslr-seed and rng-seed by default */
     vms->dtb_randomness = true;
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index dba8ac7f2f..4e49eb1d13 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -154,6 +154,7 @@ struct VirtMachineState {
     bool virt;
     bool ras;
     bool mte;
+    bool mec;
     bool dtb_randomness;
     bool second_ns_uart_present;
     OnOffAuto acpi;
-- 
2.34.1



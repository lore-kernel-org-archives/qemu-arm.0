Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3501652lft;
        Mon, 4 Jul 2022 14:56:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1saKL7vxceS+Mw5RkEgjAco1z2wR9iDL8Ol90kccDq6sZ807QE33F1JnsFxWw7le/CDSexR
X-Received: by 2002:a37:c50:0:b0:6af:46d:c373 with SMTP id 77-20020a370c50000000b006af046dc373mr21559367qkm.659.1656971762039;
        Mon, 04 Jul 2022 14:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656971762; cv=none;
        d=google.com; s=arc-20160816;
        b=q6LNy63BOhPTSt8LB39VpCyFgLysahqCZmi7lvETMb2iKRWnmWVrqygusEl+FRnJ36
         ph/eK7WMgUPm9VTS5JnKlQCvm0qRnAvUz0NJ+8ixBHjTnunXY+zDexqhT1VLKd9j0U9O
         CzQMSLbzwHKANq2TDLj9RPnpNl0SKbHAR7lUuvuYbkqZZVFWlEv1LF5v64arGVhI1ut/
         aKiK4+eySru8SNEUvoG1wHZ4C0eOwhr5gUKilzMnctRGB860n8fe8+op62BskYilw81w
         4kSaHVavHCqcR7rm+2wIlZxMZuJKYm39+GL4K2MuO5BnoMM/oCIc0a7KzHEXz5gU3VME
         bq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=hxF/vM8XoFEaZUayWsoZDgQCyBHDgo/Eu61B3q9nLNI=;
        b=uNI8BD+XDuXeJ9stQs4aD5x+4jEgHhf7c05PvVgnWGQ+3pz1cEtf3TLJS/aeL+ZbrZ
         w/6HNVOHm7OlwKo7hcMRK+otVZ2SCDTJCn0338SMfP6CcCcRBleLDQLL5ctkx/Yw4MLk
         +tj/rci+67yUX9NJUtxkcVbSB13LkZmCO5Uqg+0vUBSgrWray/0m4+TJW/pjAepS9OQT
         qhcJwdPYb1je8DqgZr+7H+OB0qxRhHaS7eiSnYqLOMvsb7eBOePawt5YXZhmDi4bfeJH
         Brn04V1hK8YLI/Z/a6zUBsMtAhopeB8qht+fo9x0GMXR6Eer/b8TuXdwenNIYPTfaxr/
         lMSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=AQp3odld;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=GyUuaTCd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx11-20020a0562142b0b00b00472c0e79611si8154833qvb.527.2022.07.04.14.56.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 14:56:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=AQp3odld;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=GyUuaTCd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8U2z-0003rq-Fy
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 17:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8U2C-0003mw-C3; Mon, 04 Jul 2022 17:55:12 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:47191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8U2A-0000M3-Jb; Mon, 04 Jul 2022 17:55:12 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id D42CE580FE1;
 Mon,  4 Jul 2022 17:55:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 04 Jul 2022 17:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656971709; x=
 1656975309; bh=hxF/vM8XoFEaZUayWsoZDgQCyBHDgo/Eu61B3q9nLNI=; b=A
 Qp3odldwNejEdiFVmqudln1qGeGFKWaFmnSJ3EUo3u2etNszcQsUkErTliQ9d4dK
 qRVTFzD8w8d2Sm/1X+7B3zsHfnxjN6IsfmYtK2mX10UTJelIQa57OCzTDQiQMJjk
 2m5eTgrE89RpT1j4J/Zr2JhYTWe6+FBh9KbDP/7SmKvksJW9JveIoqQSvKiItpTa
 +3+Ar+AA37ePNQ05CMAxihDR8xVRiHagdwRU99K9vWFi7t8Cpbvp5e9TtWTJlwn2
 77DNiTQHBtplv6TvJJ2AkZrTJdUWyXNulBst+keJPe9/tTgTODlmwHF4JlQtTHFF
 xPbnR+j8iYgWwjoNEpJbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1656971709; x=1656975309; bh=hxF/vM8XoFEaZUayWsoZDgQCyBHDgo/Eu61
 B3q9nLNI=; b=GyUuaTCdRfpshZ2xGLSeEoJeao8XGW9zwdPYW3ArwVjgZqlk8Xb
 HebSeJIt9ww2eucHaLWoxw2qJfyKpQrPeVrpdbHwgeoxlQCrwX6pvJEz6lczBAkW
 gCnqwbEv0jhU/xhW9/zXBzVgDM4mVOyN6+HRaXrzyHfXgiwxj5AIprUfIb7ZJ4ik
 tAe1ZupryYYMY6q9jxwfgZBtYm72rCNbf3MQa9e9fghw+UPHeXz9Ea89B6Ig0MdN
 2ptICZXt6hdglH8nG3B9C7QyApSb51mrCdo34acW/oPfY50UN692A87WL+elTZ5r
 gnoqUL9H5hMmbVjyF0p6WyF3Py2hABW6EuQ==
X-ME-Sender: <xms:vWHDYq2-2kqaLlvS2fRANqwuT53asQtKsZA-WTJ7usiVuc9hrkwY-Q>
 <xme:vWHDYtG55HuSvbBCJCGOnhHxpCcQ5JuMfVbZNH1LTB9OpMFoICwrkcarGX_HOFo_i
 Bb1UyVf--1a5A9gW08>
X-ME-Received: <xmr:vWHDYi48YcFSdSqjTh_9hdPv_fi38YppCQbDTtr4zb1bk9fcsdATcebUUw7Lew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeitddgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnecujfgurhephffvvefufffkofgj
 fhggtgfgsehtkeertdertdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrsh
 cuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpedvhfevvefhtddv
 ueevudelvedtieehvdejjeeuvedtudegjeeileetheekgfeggeenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:vWHDYr1fw1W3-yJYR6aMdPIf6O1l3j6wp-XFX7PIeqehOQnUODtvFQ>
 <xmx:vWHDYtFVs3Axdhwjcr3BZ6B9kkF_94p9BrS-vSsPT0kMQ2HZPi7JAQ>
 <xmx:vWHDYk_sB_dmQTh14BXndOOv94wHJwt4JNuqhFDsIg3PBjUSciL4lA>
 <xmx:vWHDYmNUHmuMTcnvtGQF9RxQQ9ClkOkDCnK2HobpZX6IOOkPmXiGCA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Jul 2022 17:55:09 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 7/8] aspeed: fby35: Add a bootrom for the BMC
Date: Mon,  4 Jul 2022 14:54:56 -0700
Message-Id: <20220704215457.38332-7-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220704215457.38332-1-peter@pjd.dev>
References: <20220704215457.38332-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=peter@pjd.dev;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iDgS9q2mCeRl

From: Cédric Le Goater <clg@kaod.org>

The BMC boots from the first flash device by fetching instructions
from the flash contents. Add an alias region on 0x0 for this
purpose. There are currently performance issues with this method (TBs
being flushed too often), so as a faster alternative, install the
flash contents as a ROM in the BMC memory space.

See commit 1a15311a12fa ("hw/arm/aspeed: add a 'execute-in-place'
property to boot directly from CE0")

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/fby35.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index 5c5224d374..d3edfa3b10 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -9,6 +9,7 @@
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/block-backend.h"
 #include "hw/boards.h"
 #include "hw/arm/aspeed_soc.h"
 
@@ -23,12 +24,49 @@ struct Fby35State {
     MemoryRegion bmc_boot_rom;
 
     AspeedSoCState bmc;
+
+    bool mmio_exec;
 };
 
 #define FBY35_BMC_RAM_SIZE (2 * GiB)
+#define FBY35_BMC_FIRMWARE_ADDR 0x0
+
+static void fby35_bmc_write_boot_rom(DriveInfo *dinfo, MemoryRegion *mr,
+                                     hwaddr offset, size_t rom_size,
+                                     Error **errp)
+{
+    BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
+    g_autofree void *storage = NULL;
+    int64_t size;
+
+    /*
+     * The block backend size should have already been 'validated' by
+     * the creation of the m25p80 object.
+     */
+    size = blk_getlength(blk);
+    if (size <= 0) {
+        error_setg(errp, "failed to get flash size");
+        return;
+    }
+
+    if (rom_size > size) {
+        rom_size = size;
+    }
+
+    storage = g_malloc0(rom_size);
+    if (blk_pread(blk, 0, storage, rom_size) < 0) {
+        error_setg(errp, "failed to read the initial flash content");
+        return;
+    }
+
+    /* TODO: find a better way to install the ROM */
+    memcpy(memory_region_get_ram_ptr(mr) + offset, storage, rom_size);
+}
 
 static void fby35_bmc_init(Fby35State *s)
 {
+    DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
+
     memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_MAX);
     memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
                            FBY35_BMC_RAM_SIZE, &error_abort);
@@ -48,6 +86,28 @@ static void fby35_bmc_init(Fby35State *s)
     qdev_realize(DEVICE(&s->bmc), NULL, &error_abort);
 
     aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
+
+    /* Install first FMC flash content as a boot rom. */
+    if (drive0) {
+        AspeedSMCFlash *fl = &s->bmc.fmc.flashes[0];
+        MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
+        uint64_t size = memory_region_size(&fl->mmio);
+
+        if (s->mmio_exec) {
+            memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
+                                     &fl->mmio, 0, size);
+            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
+                                        boot_rom);
+        } else {
+
+            memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
+                                   size, &error_abort);
+            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
+                                        boot_rom);
+            fby35_bmc_write_boot_rom(drive0, boot_rom, FBY35_BMC_FIRMWARE_ADDR,
+                                     size, &error_abort);
+        }
+    }
 }
 
 static void fby35_init(MachineState *machine)
@@ -57,6 +117,22 @@ static void fby35_init(MachineState *machine)
     fby35_bmc_init(s);
 }
 
+
+static bool fby35_get_mmio_exec(Object *obj, Error **errp)
+{
+    return FBY35(obj)->mmio_exec;
+}
+
+static void fby35_set_mmio_exec(Object *obj, bool value, Error **errp)
+{
+    FBY35(obj)->mmio_exec = value;
+}
+
+static void fby35_instance_init(Object *obj)
+{
+    FBY35(obj)->mmio_exec = false;
+}
+
 static void fby35_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -66,6 +142,12 @@ static void fby35_class_init(ObjectClass *oc, void *data)
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->min_cpus = mc->max_cpus = mc->default_cpus = 2;
+
+    object_class_property_add_bool(oc, "execute-in-place",
+                                   fby35_get_mmio_exec,
+                                   fby35_set_mmio_exec);
+    object_class_property_set_description(oc, "execute-in-place",
+                           "boot directly from CE0 flash device");
 }
 
 static const TypeInfo fby35_types[] = {
@@ -74,6 +156,7 @@ static const TypeInfo fby35_types[] = {
         .parent = TYPE_MACHINE,
         .class_init = fby35_class_init,
         .instance_size = sizeof(Fby35State),
+        .instance_init = fby35_instance_init,
     },
 };
 
-- 
2.37.0


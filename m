Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C41CC6B1A
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Oct 2026 09:33:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGvLw-0002Mw-Ih; Wed, 14 Oct 2026 05:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvLp-0002L3-8P
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:32:48 -0400
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvLk-0000MI-TT
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:32:43 -0400
Received: by mail-dl1-x1235.google.com with SMTP id
 a92af1059eb24-15354aa70e8so1827644c88.1
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 02:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791970357; x=1792575157; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kvgVTHS4oUEIV4ErChzaNlj22uaMiM4VXxQneYOKsCI=;
 b=oTakKepTPXDeXA8+VrSHF1w6Sbdp1/mi+8uPLZGnt9G7EJkHSLLBxgJgKOYsIcVq47
 QJhNdGgL5kfgvLkHKyBhB0eXbkAWCziEk2VhI3cG6CO4IHK3d8i8mi23T4uvR9AKOqTe
 fjL0jBW87CYienVCZHpn+M0tJzhvnDXRBG2O2XBAQIw5xbiiesr/29CxOvRSBzKu99hW
 +WP45j99LLmqq1YxinId1zlnu1790u3kzbdW16tB+1auy6A0ukmMil61IzdGpKMmi9kD
 DfYRGF8qIdmsOB4sazeOb7gBQOj4qo9urIUF9QzRRK+8QQTh+NT2TK6W2R2k5ekjpUGM
 luYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791970357; x=1792575157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kvgVTHS4oUEIV4ErChzaNlj22uaMiM4VXxQneYOKsCI=;
 b=15KgoCwDUPuIJ5olyMTl0vjlzRl/ji6PiUcvbNpl6hT437TIJdfFbAWOkxq5M8MG49
 FYHJBGC6QkYyafYlGG4n/UD5olef3EY5HBhIcD2Q4Ez8viIo2/ZX9MrYhjxiWK3bI0e9
 jKm3xOojLM9A/tvoJwY7+OgFdzYoFRjJo13z14mIE+/uQwpVHw7kOL+0EHQC3HljZxos
 0Fn2A0Zs+EN4t1RakjCa51JP0Rhe0yxzeRONtfN2TDGDoggUUbS2eyKlJ/HrfdzsN9OO
 U9gZ1SS30mQDWZ/kIDDr64PxC6/y1dZj2H93NVC2/EGjgx+blbnN+eoE1stZrhJSFoep
 oRXw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwldti8dVdXTttJNbXcf7+mP0z4xlkVE5yNI+30s9JOskfh+2S6p8Tzkfa3nHUBt0S1Z0CxBnQ4lg==@nongnu.org
X-Gm-Message-State: AFq9FYInIsu4vKfJ7DCWvSgM/hbCJrsG6BHIq9FqU3ouGToZx4obsMwt
 A3stt8hFq139/U0nYW7KgGtZkhOCeJ8P8orYkBObSJjBgST8ruDGNHNj
X-Gm-Gg: AYBFou0GLEd9pLR5noo6rjNdAk1WCa8Um6zXn+DUixEUIee6CAYC0x08v9c+1dbCYe1
 FkD484EEFO9oVXjrZx9LG+cjbBMv8t86yHxG1vG55aDJ59BLcKHaQZ+FOqiKqZKolFQ2bMuu9Gc
 ace90UT2y+hTYPEXXuBLhdVBdBi4gpJE4FGOVmNIRYiUWQFon/rXOIcUH7DrthN+BlU+TVsYdsN
 buZrvALfqjqbt6Giy34lNnOzwBVN8MWMJcK6jo+0p9bVQiVn+TmF+JVNP6zy4SeIj3r2Dv9mgnH
 dbKhN8Qs3c8agM7XNsVSzeu9207azoeeEnp6ye2QOTqh4AJn80XlRJ13YUEp3EGFJD35XhQZiYu
 VMYP3dv36u8B4J7HvdMS0OhDYCs/dE5dlAV+BDg53/4b861eBZF/nk9tq1+svfkbcjPCiJg61m/
 TQnOnle4/uuth5KP7aC/7lh4ccL7Wn0HqRuPisHiK6OXM9slGVXiq88c2xgKeIkD8UVOHcvNUUp
 lZyRoZhYXGmvoJF6A==
X-Received: by 2002:a05:7022:3c0b:b0:17c:a0c5:8c9a with SMTP id
 a92af1059eb24-17ca0c58cf0mr3156015c88.42.1791970356809; 
 Wed, 14 Oct 2026 02:32:36 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1698de65af7sm48769303c88.0.2026.10.14.02.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:32:36 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <17746591750@163.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Farman <farman@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Chao Liu <chao.liu@processmission.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH 03/34] qemu: increase width of QEMU_ARCH_* masks enums to be
 64 bits
Date: Wed, 14 Oct 2026 17:31:13 +0800
Message-ID: <20261014093152.834-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014093152.834-1-luoyonggang@gmail.com>
References: <20261014093152.834-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1235;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

SYS_EMU_TARGET__MAX is already 29, nearing the 32-target limit.
So increase width of QEMU_ARCH_* masks enums and related types;
So that we can add needed Linux user-mode targets to EmuTarget;
And also enabled the possibility add more system-mode targets in future.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/base-arch-defs.h  | 7 ++++---
 monitor/monitor-hmp-internal.h | 2 +-
 system/arch_init.c             | 4 ++--
 system/qdev-monitor.c          | 2 +-
 system/vl.c                    | 2 +-
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/qemu/base-arch-defs.h b/include/qemu/base-arch-defs.h
index a6478c2d3ff..f2e3bc54203 100644
--- a/include/qemu/base-arch-defs.h
+++ b/include/qemu/base-arch-defs.h
@@ -9,7 +9,7 @@
 
 #include "qapi/qapi-types-machine.h"
 
-#define QEMU_ARCH_BIT(target) (1UL << (target))
+#define QEMU_ARCH_BIT(target) (1ULL << (target))
 
 enum {
     QEMU_ARCH_ALPHA =       QEMU_ARCH_BIT(SYS_EMU_TARGET_ALPHA),
@@ -44,7 +44,8 @@ enum {
     QEMU_ARCH_ALL =         QEMU_ARCH_BIT(SYS_EMU_TARGET__MAX) - 1,
 };
 
-QEMU_BUILD_BUG_ON(SYS_EMU_TARGET__MAX > 32);
+/* Keep target-specific masks within qemu_opt_set_number()'s int64_t range. */
+QEMU_BUILD_BUG_ON(SYS_EMU_TARGET__MAX > 63);
 
 /**
  * qemu_arch_available:
@@ -52,6 +53,6 @@ QEMU_BUILD_BUG_ON(SYS_EMU_TARGET__MAX > 32);
  *
  * Return whether the current target architecture is contained in @arch_bitmask
  */
-bool qemu_arch_available(uint32_t arch_bitmask);
+bool qemu_arch_available(uint64_t arch_bitmask);
 
 #endif
diff --git a/monitor/monitor-hmp-internal.h b/monitor/monitor-hmp-internal.h
index 4e2430551ab..b61d2717076 100644
--- a/monitor/monitor-hmp-internal.h
+++ b/monitor/monitor-hmp-internal.h
@@ -69,7 +69,7 @@ typedef struct HMPCommand {
      *     Allow to restrict the command for a particular set of
      *     target architectures.
      */
-    uint32_t arch_bitmask;
+    uint64_t arch_bitmask;
     bool coroutine;
 } HMPCommand;
 
diff --git a/system/arch_init.c b/system/arch_init.c
index 1ad2f3d6f78..b8362b12a6d 100644
--- a/system/arch_init.c
+++ b/system/arch_init.c
@@ -26,7 +26,7 @@
 #include "qemu/bitops.h"
 #include "qemu/target-info-qapi.h"
 
-bool qemu_arch_available(uint32_t arch_bitmask)
+bool qemu_arch_available(uint64_t arch_bitmask)
 {
-    return extract32(arch_bitmask, target_arch(), 1);
+    return extract64(arch_bitmask, target_arch(), 1);
 }
diff --git a/system/qdev-monitor.c b/system/qdev-monitor.c
index 8185822daa7..b3ca619f3c9 100644
--- a/system/qdev-monitor.c
+++ b/system/qdev-monitor.c
@@ -54,7 +54,7 @@ typedef struct QDevAlias
 {
     const char *typename;
     const char *alias;
-    uint32_t arch_mask;
+    uint64_t arch_mask;
 } QDevAlias;
 
 /* default virtio transport per architecture */
diff --git a/system/vl.c b/system/vl.c
index 468a9fc247a..fbe580746d3 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -928,7 +928,7 @@ typedef struct QEMUOption {
     const char *name;
     int flags;
     int index;
-    uint32_t arch_mask;
+    uint64_t arch_mask;
 } QEMUOption;
 
 static const QEMUOption qemu_options[] = {
-- 
2.55.0.windows.3



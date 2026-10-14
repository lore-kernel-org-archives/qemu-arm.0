Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3B5CC6B1D
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Oct 2026 09:44:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGvWd-0003le-Gl; Wed, 14 Oct 2026 05:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvWb-0003aR-KW
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:43:54 -0400
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvWZ-0001zH-H4
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:43:53 -0400
Received: by mail-dl1-x1234.google.com with SMTP id
 a92af1059eb24-157fe9d771bso1524342c88.0
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 02:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791971027; x=1792575827; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=synPi8hnFDON0bf/QeszSpYclzjkqZ5u8lY6d12QrFA=;
 b=qofgqE2dAD1vZmTunii07qV6aGlw+TBpUNOdNFa0gIHzeirFPzVg5UjOgPFLfg0VVe
 2fuKwm+EIep57oJ/wKYSqyZYXr9575RNwfienxveWBl52wFWVITwwgxkhEtNhPPx1TbG
 6v0KL84gsGf3i2wG8O83mYIyA+Aokab3QJ6/4wDHupaUVZT/kNeRsqiGdxrV5ahJaeTg
 AVnV56SeI4GE7/vZmRItykPtZzUBiagvGMKvmqEJcHxSyxNq9J7Fon7sHgemRmPdZJy8
 KTBPvcTmXk6qeFUt/QnAy9mKaEP/nEzVVP5i0PsI5bouLsqSGoIDKbK7QiKJ5zgHkQmg
 VzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791971027; x=1792575827;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=synPi8hnFDON0bf/QeszSpYclzjkqZ5u8lY6d12QrFA=;
 b=NsKapVGKUJTV1PTQJaSOp9ELr0fnMSg+Wl+gJp4w+EnVrdw5J3EJQPWccajIXcTgiT
 DbLCjvj4qgW/9w/TQDiXGkdQjTJxttrf+lRSXnfPmsWjzmtRZfdI0ZDp7NREdK7YEeHz
 AS18sst+jB7olo5k3fx3qMQfWZFtZfEQtuWe/qYWQEZDXZexuiDXsdmOm/UxynhgDnE5
 j7hA/W9LNAyej2Hu9QkHeuc3iG5whMLVtZF8jC13F9tyWZ7gNY+r4lPOpean7FwT5Lwo
 jyk2UDdOPcm/m6D50jbm7WCSg/hzmOU7HqmTjTPGXt3NBm1KuKozAcbJ14Ja83ncJLpH
 Bz7Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwIDGV5E7Q6AYxBj2kitfz54oEN3rHFcnRx0sUwLxcr+zT3q0zJFinMV3kO56hz1H54la6Hkj322g==@nongnu.org
X-Gm-Message-State: AFq9FYKlWF9QizxZ8T1nWPyDLlwQriJMa3umOkzbJoBof/+f4ahoOPkm
 mC2K4ZD3PP4iOJn85aEWMj1u+RX/6756RuGuky6k6p3bztauOFnxKK5A
X-Gm-Gg: AYBFou3qzHvNV8vewt0r+aKM4XZ0QANPesiVaRSaLDDUCOin/EfgDc7ftGCcZyCn0wH
 iFhv02lerAZ/IHg9WsDDMHFj8a7/qpD2Hy1jj+zxmYdBcH+Y8dJoJvQQ74hVhZmiUmLyv38025i
 38lG1auZU9bHYsO7KToMOnsLh+niN8ls1pAFszGWxCTzLQTx+3W725hBH4NbHM0W2GZUwubh+Ro
 /ThDPRWbHn88fNKzMo7sEBU0ok4eRonwBFL9mloPHEjMnl84mXw+5pnbBUY+/fm9rC36w/C3i/2
 EecMHLSuCpRkguyHpbgaKKx6MDMBtzoxyDFTlLhRbkX7PCfPFVxvaB2y6KVj5ymvN2EeDY5vCM4
 GMAaNs3H5okXVUTIKaVgAks9zr3y1D233OjIXNOcc3hntKmx/XwKqpvhSXKGXfOEgyvin+IICg6
 flSk51b1dHiY4GixBJ5fqMRyaGXn1oWHWCUk9YUBkytGOdBk3BBJuHROhURmx3cCUr4hK2GpbD4
 HzN5q6MSnEklKFb5g==
X-Received: by 2002:a05:7022:3b87:b0:164:7bbe:b609 with SMTP id
 a92af1059eb24-16a611c0785mr24546593c88.38.1791971026715; 
 Wed, 14 Oct 2026 02:43:46 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-169a31f6f5csm44348380c88.11.2026.10.14.02.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:43:45 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, Eric Blake <eblake@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Fabiano Rosas <farosas@suse.de>,
 Song Gao <17746591750@163.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 23/34] hw/loongarch/virt: use unique QOM name
Date: Wed, 14 Oct 2026 17:41:38 +0800
Message-ID: <20261014094224.1976-8-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014094224.1976-1-luoyonggang@gmail.com>
References: <20261014094224.1976-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1234;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1234.google.com
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

Set TYPE_LOONGARCH_VIRT_MACHINE to MACHINE_TYPE_NAME("loongarch-virt")
so LoongArch virt no longer collides with other virt-machine types in
one process. Keep the -M / help / migration name as virt-* via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/loongarch/virt.c         | 45 ++++++++++++++++++++-----------------
 include/hw/loongarch/virt.h |  5 ++++-
 2 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 9c5371af9de..5ca992a5ac7 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -1543,21 +1543,24 @@ static void virt_class_init(ObjectClass *oc, const void *data)
         MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
         mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " LoongArch Virtual Machine"; \
         MACHINE_VER_DEPRECATION(__VA_ARGS__); \
+        machine_class_set_name(mc, "virt-" MACHINE_VER_STR(__VA_ARGS__)); \
         if (latest) { \
             mc->alias = "virt"; \
             mc->is_default = true; \
         } \
     } \
-    static const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
-    { \
-        .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
-        .parent = TYPE_LOONGARCH_VIRT_MACHINE, \
-        .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
-    }; \
     static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
     { \
+        const TypeInfo virt_machine_info = \
+        { \
+            .name = target_combined_binary() ? \
+                    MACHINE_VER_TYPE_NAME("loongarch-virt", __VA_ARGS__) : \
+                    MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
+            .parent = TYPE_LOONGARCH_VIRT_MACHINE, \
+            .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
+        }; \
         MACHINE_VER_DELETION(__VA_ARGS__); \
-        type_register_static(&MACHINE_VER_SYM(info, virt, __VA_ARGS__)); \
+        type_register_static(&virt_machine_info); \
     } \
     type_init(MACHINE_VER_SYM(register, virt, __VA_ARGS__));
 
@@ -1579,22 +1582,22 @@ static void virt_instance_finalize(Object *obj)
     g_free(lvms->oem_table_id);
 }
 
-static const TypeInfo virt_machine_info = {
-    .name           = TYPE_LOONGARCH_VIRT_MACHINE,
-    .parent         = TYPE_MACHINE,
-    .abstract       = true,
-    .instance_size  = sizeof(LoongArchVirtMachineState),
-    .class_init     = virt_class_init,
-    .instance_init  = virt_initfn,
-    .instance_finalize = virt_instance_finalize,
-    .interfaces = (InterfaceInfo[]) {
-        { TYPE_HOTPLUG_HANDLER },
-        { }
-    },
-};
-
 static void machvirt_machine_init(void)
 {
+    const TypeInfo virt_machine_info = {
+        .name = TYPE_LOONGARCH_VIRT_MACHINE,
+        .parent = TYPE_MACHINE,
+        .abstract = true,
+        .instance_size = sizeof(LoongArchVirtMachineState),
+        .class_init = virt_class_init,
+        .instance_init = virt_initfn,
+        .instance_finalize = virt_instance_finalize,
+        .interfaces = (InterfaceInfo[]) {
+            { TYPE_HOTPLUG_HANDLER },
+            { }
+        },
+    };
+
     type_register_static(&virt_machine_info);
 }
 
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index d39a9bbf5dd..9a5f6486c0f 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -9,6 +9,7 @@
 #define HW_LOONGARCH_H
 
 #include "hw/core/boards.h"
+#include "qemu/target-info.h"
 #include "qemu/queue.h"
 #include "hw/block/flash.h"
 #include "hw/loongarch/boot.h"
@@ -130,7 +131,9 @@ struct LoongArchVirtMachineState {
     bool highmem_mmio;
 };
 
-#define TYPE_LOONGARCH_VIRT_MACHINE  MACHINE_TYPE_NAME("virt")
+#define TYPE_LOONGARCH_VIRT_MACHINE \
+    (target_combined_binary() ? MACHINE_TYPE_NAME("loongarch-virt") : \
+                                MACHINE_TYPE_NAME("virt"))
 OBJECT_DECLARE_SIMPLE_TYPE(LoongArchVirtMachineState, LOONGARCH_VIRT_MACHINE)
 void virt_acpi_setup(LoongArchVirtMachineState *lvms);
 void virt_fdt_setup(LoongArchVirtMachineState *lvms);
-- 
2.55.0.windows.3



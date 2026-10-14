Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56665CC6B2A
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Oct 2026 09:44:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGvWZ-0003Qx-Br; Wed, 14 Oct 2026 05:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvWR-0003FY-SB
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:43:45 -0400
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvWN-0001uQ-P6
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:43:42 -0400
Received: by mail-dy1-x1334.google.com with SMTP id
 5a478bee46e88-33bf40b0c8bso69614eec.0
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791971017; x=1792575817; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=uy0WPRIQ2imJZqNFdFp6IKRokxACF3m4EQdN1xfghQY=;
 b=LOcBLiWIlL6Hb82R4mGEvi9utfnI7IhGJhc1vK5uyUzuWX2IHf1SrtDl5AgiDjfWRW
 6/TVX7RYYKLwnp/oyCbI8pJNO4Pqa6YcJjTvKYsBfcq9WsYQOo/N7B4fZCbxpPqdIAsi
 1YAsYNy1xY8duQmNmVKdRJnOT1b//l6SHcWwke9cOh1HeE3E0CzSLBu17ABg9EntB6v3
 kQPn3cT+lXKXFR0qEbTsdSjHdz6FR+RlCJ5pnSBkxTUVIvYrIB+SlYGwrtvlzLG11K6p
 mrysUKQf84Yycni9TSxj9JHYxpyaR9N7h10OSNhTxkVci0AkdAKwBw3W1YPw2Cj1mnwF
 uCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791971017; x=1792575817;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uy0WPRIQ2imJZqNFdFp6IKRokxACF3m4EQdN1xfghQY=;
 b=iYV6GEvTDneTGfK1AG87SMwq17mZvuJlqHlFSosqNWas6ZYwNr740uPZJX7rdd+BbA
 jCaj6L20G6dXeM2yfIAhD/YD5Zj1VwpKNRpZd23Qigv2nCn/7jjRX1wnOzcsfyQjHsT0
 iYa+6RF/axZG4SRy0avXsuYIlQyMPGEWGopNfK5F8Isbd+qAfxob2fIO5lh6ykwhCTY6
 sX8p1GG0wr9tjv3YkjgVCrzFWr/3dDBL3FJdPuOmCv86GLyIh0MZAve81BgQ/cPEiIFS
 XAKm59uAwH7mh2Qn3VMTf363noKPJ7Vc6bHjGcnO8gHKcZNebxYJBmm7NFul5NLbG9Xi
 VM/Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByi2HeJObsot8uitE7Lt/apHTRkL+U9e8+fsk/Vsp6a5fWZuvElTxV9fgzkVJjPfHMtdC1w5h8ARQ==@nongnu.org
X-Gm-Message-State: AFq9FYKYRkyUL7R69Box/3erMVFUpPoSQ9r6RK2eJXfwIsHhntMIiKHB
 nDecB5oMENWRj8nj0FpF9RJvd7moPXdjq7siIlp1eAyBHZP/3rnM1OjC
X-Gm-Gg: AYBFou15ekLqf5vuszNquuu+5tCHjWZuZ2IudO7F7JQJXpctTCJxCkq+RBfP0O55phU
 fMZvBDmGTuqRTcKOqB6pH0qWJ6MgZpAEvuiyY0mHQ2IowPqYiJiBjAEJzVwzCWVbMz0F3zaKncS
 AqRyrXYOWSto6Yx1VYaYUbshYCg897VREIvFRCwmiZ43xW08W7OkIcBCMAmLZo4pVls0qVGO113
 BbG7HuYPimNnb3HNoxm9Qo2eryXGsY75uHVRfjIh+hvzBWAFBmUMWakcietD96GJUpSUzQd07S6
 EHYOmKfprpzQdKAnQ8N5BBeQVRBHHLNmnImA3axJ9z21s8pnUuGZBK4x0GPjSm+4E0wRG3RcrOX
 4Bt4NxF9rP1BNNHiVLzB55wK78Fomc67gf/O75virZSyzk6yitjJnUGlaDZ5Lhw/0GB1JSXjXpx
 SwqwNrWQlh4ABNhHzXXZ5IrHR3HNKkOLpAIatfBJzAS1zeatsxAPM3vsoIqOHzOHX3BOHd0bkMa
 PrQboDvhGziuy5IhQoVoRcogM4w
X-Received: by 2002:a05:7022:e806:b0:178:4a98:8751 with SMTP id
 a92af1059eb24-1784ab70e5cmr8904859c88.37.1791971016822; 
 Wed, 14 Oct 2026 02:43:36 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-169a31f6f5csm44348380c88.11.2026.10.14.02.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:43:35 -0700 (PDT)
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
Subject: [PATCH 22/34] hw/hexagon/virt: use unique QOM name
Date: Wed, 14 Oct 2026 17:41:37 +0800
Message-ID: <20261014094224.1976-7-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014094224.1976-1-luoyonggang@gmail.com>
References: <20261014094224.1976-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1334;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1334.google.com
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

Set TYPE_HEXAGON_VIRT_MACHINE to MACHINE_TYPE_NAME("hexagon-virt") so
Hexagon virt no longer collides with other virt-machine types in one
process. Keep the -M / help / migration name as virt via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/hexagon/virt.c         | 23 +++++++++++++++--------
 include/hw/hexagon/virt.h |  5 ++++-
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/hw/hexagon/virt.c b/hw/hexagon/virt.c
index 64d8366d27d..ed086afe204 100644
--- a/hw/hexagon/virt.c
+++ b/hw/hexagon/virt.c
@@ -359,6 +359,7 @@ static void virt_class_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Hexagon Virtual Machine";
+    machine_class_set_name(mc, "virt");
     mc->init = virt_init;
     mc->default_cpu_type = HEXAGON_CPU_TYPE_NAME("v68");
     mc->default_ram_size = 4 * GiB;
@@ -373,12 +374,18 @@ static void virt_class_init(ObjectClass *oc, const void *data)
     mc->default_nic = "virtio-mmio-bus";
 }
 
+static void virt_machine_register_types(void)
+{
+    const TypeInfo virt_machine_types[] = {
+        {
+            .name = TYPE_HEXAGON_VIRT_MACHINE,
+            .parent = TYPE_HEXAGON_COMMON_MACHINE,
+            .instance_size = sizeof(HexagonVirtMachineState),
+            .class_init = virt_class_init,
+        }
+    };
+    type_register_static_array(virt_machine_types,
+                               ARRAY_SIZE(virt_machine_types));
+}
 
-static const TypeInfo virt_machine_types[] = { {
-    .name = TYPE_HEXAGON_VIRT_MACHINE,
-    .parent = TYPE_HEXAGON_COMMON_MACHINE,
-    .instance_size = sizeof(HexagonVirtMachineState),
-    .class_init = virt_class_init,
-} };
-
-DEFINE_TYPES(virt_machine_types)
+type_init(virt_machine_register_types)
diff --git a/include/hw/hexagon/virt.h b/include/hw/hexagon/virt.h
index 4ca2f1ef859..e5dfcd351a5 100644
--- a/include/hw/hexagon/virt.h
+++ b/include/hw/hexagon/virt.h
@@ -9,6 +9,7 @@
 #define HW_HEXAGONVIRT_H
 
 #include "hw/hexagon/hexagon.h"
+#include "qemu/target-info.h"
 #include "target/hexagon/cpu.h"
 
 #define VIRTIO_DEV_COUNT 8
@@ -26,7 +27,9 @@ struct HexagonVirtMachineState {
 
 void hexagon_load_fdt(const struct HexagonVirtMachineState *vms);
 
-#define TYPE_HEXAGON_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
+#define TYPE_HEXAGON_VIRT_MACHINE \
+    (target_combined_binary() ? MACHINE_TYPE_NAME("hexagon-virt") : \
+                                MACHINE_TYPE_NAME("virt"))
 OBJECT_DECLARE_SIMPLE_TYPE(HexagonVirtMachineState, HEXAGON_VIRT_MACHINE)
 
 #endif /* HW_HEXAGONVIRT_H */
-- 
2.55.0.windows.3



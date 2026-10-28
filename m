Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B185B606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RD+I2klC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMA4k-00058a-Sq; Wed, 28 Oct 2026 16:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA4a-00051f-Ox
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:16:38 -0400
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA4Z-0002Ff-81
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:16:36 -0400
Received: by mail-dy1-x132b.google.com with SMTP id
 5a478bee46e88-369f33df08eso2610869eec.0
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793218594; x=1793823394; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NuBToxGTKV+VzeXb2lZn4OChHw2LGBi0yxV28yWFalg=;
 b=RD+I2klCz3R1BipNv7t+heexbnZftLEpRW9eCIJlb7TZ3c1CCOLM9IqhCuivpjj3Dl
 yC7pjvKwGNmNYH8NBPD5nq2Y5MhMmCV0H+QR7bwUgwrWjiCFH4qG3W8NxddxjB6Xf2B+
 xvlldFnXNkL4qmixOakR6Njzk9HrqCyNpO5INU/Bacz0/5mCw5K+F+V3+nTbhtErCps2
 AScPNaXwhbi4546aKcxeBqD91jGRwjWET0pD7/Xc7pnWCSwNVisxk5vKi/UO/wokH7yI
 /gIbfvz1zBLNljSe7i/MIWEfRQv4jjXX3gxbslOjP+QadmMtl3OGHRcS0TaX4RWTzKEk
 Delw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793218594; x=1793823394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NuBToxGTKV+VzeXb2lZn4OChHw2LGBi0yxV28yWFalg=;
 b=X5loa7IPC6eqGRHohD9+9GZ5t4VpRBpIMHjzvZY9axjvJSLubjo0z91Ojj00vQ2Mdg
 QZmNWlpoRUgQGIFD0RV7Rng/AYwJFtO2fDTY+sIqi3P7wbflIvx11DAcdliJe5eE27Pa
 JvXE3aTsI1cUcZMIQUaU006gWVLha/36Lyf87WzJj0mjQCVUGyRDIkWWKcFePDBJXYWi
 Zz06hB0IsaT+EQ1w22d+OgBzB8ZpPsnugbn/9aYxTh5Ww8/MMTFrpJM5t+zxda2ac6/h
 1eq2R3tAorRkX1ZL60RiWt1SVTbmYdWY+5Jrd7hUIiKZDt9Am7p8dYYzhfHNWC4B7Tew
 4H2Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxkeTkfhtGUYdgXzoj1QjPfEZ4F5YjWPWdT7m0EKFgk8Je/M5kdyBBoQKxmZfgjX63FTggl4tI9IA==@nongnu.org
X-Gm-Message-State: AFq9FYJztaJExGMXrmLbHDGQsy4+p3f5OF+w8ybeWp2k/8/cu7EbKPWm
 09DtaZ6xeqZarJQl6PBYi8Z7M6rSq0wQRakzsP4gR15dQzVRma3Lddbt
X-Gm-Gg: AYBFou382XaAadSq444tbQ1KFs7xwFyEmiFjAtOYpYwFaDGoIxmZtWieZtUTNESOX1F
 5kzWUJRzAJeVHARjvWY0EwuOAXdONa+HAa8e4sfDrm+2tH7exBQ0ivli+iHht/PeCkMDazpF06X
 XU2APYGmk9cWN56oY8iUpgGoLNIhvgoUpyMa8ikzxglBeB/6FQQVCX8soEZTRm6bkPRqC8opR0G
 m7+B296jzR1XN5OuBXTL4/p3E+F92KxByaFw4dfTuNOXjqS+k2jjblUSRgEQxIZWktWq/K/5xws
 Cuk4ESottKtrZoAN5ue/m+0ZV+oYWPqmhuj+mFn7+OAlYAWjcSD6jOPgNZMNpg1r62vzYFaQIfM
 0q/VGsIzrgHD6IG+bXjC42jJEdv610QgfzzkgaAZ4EsFgjby5Jbhb15dDX1scfu1JhVi4ScpLB2
 5MNiNIGM7OA+TgmqptgIih3KLsREd1NFJJUhvJrruhxQb9R2395NH1I1/DiWCyfTDXOdM5FyeKx
 Nh+jNAzSAQOg3G/whfgumYcu1lpszH7Ngpw/MERbZgTVYVw5A8MRTOXgbjXkwobId/Z1dyTchVH
 fd9PyOOFvGDYCBAeky6crzwN2QqocBZlsJlnTFToFfl9Ao3E
X-Received: by 2002:a05:7301:618b:20b0:360:e2e6:f849 with SMTP id
 5a478bee46e88-36a20138550mr5188420eec.28.1793218593540; 
 Wed, 28 Oct 2026 13:16:33 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-36a23951e00sm12016896eec.20.2026.10.28.13.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 13:16:32 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 04/12] hw/xtensa/virt: select virt machine types with
 is_available
Date: Thu, 29 Oct 2026 04:15:48 +0800
Message-ID: <20261028201557.2688-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261028201557.2688-1-luoyonggang@gmail.com>
References: <20261028201557.2688-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132b;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x132b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Xtensa virt machine uses the QOM name virt-machine, which other
targets register as well. Register it only when the selected target
is Xtensa, via target_xtensa().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/xtensa/virt.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index 271f06e0953..2b30cb863d4 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -29,6 +29,7 @@
 #include "qapi/error.h"
 #include "system/reset.h"
 #include "hw/core/boards.h"
+#include "qemu/target-info.h"
 #include "hw/core/loader.h"
 #include "hw/pci-host/gpex.h"
 #include "net/net.h"
@@ -124,4 +125,22 @@ static void xtensa_virt_machine_init(MachineClass *mc)
     mc->default_nic = "virtio-net-pci";
 }
 
-DEFINE_MACHINE("virt", xtensa_virt_machine_init)
+static void xtensa_virt_machine_class_init(ObjectClass *oc, const void *data)
+{
+    xtensa_virt_machine_init(MACHINE_CLASS(oc));
+}
+
+static const TypeInfo xtensa_virt_machine_info = {
+    .name = MACHINE_TYPE_NAME("virt"),
+    .parent = TYPE_MACHINE,
+    .class_init = xtensa_virt_machine_class_init,
+    .instance_size = sizeof(MachineState),
+    .is_available = target_xtensa,
+};
+
+static void xtensa_virt_machine_register_types(void)
+{
+    type_register_static(&xtensa_virt_machine_info);
+}
+
+type_init(xtensa_virt_machine_register_types)
-- 
2.55.0.windows.3



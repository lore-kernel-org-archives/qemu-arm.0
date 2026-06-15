Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D938CD98C5
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 12:17:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ6EY-0008Qj-GX; Mon, 15 Jun 2026 08:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wZ6ES-0008Od-W7
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 08:16:01 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wZ6EQ-0003Uy-PR
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 08:16:00 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso31070415e9.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 05:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781525757; x=1782130557; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HArTwgODQoYaXXWISLaGAP/t/ZOAHV1MrGfG2day6lw=;
 b=RCxu4zyZWQUtKOdW7B2HrSlEW8yZ0GHiZNFhmCib2sBapcLc+qvfPC+qi7JCWLCbQh
 3yI1Uv0VjFpzy2vhdisKpSQDV/EDuwVYbeb/Jt+rZ7z9AixBJZHi0tF7fPUavxtmqhKB
 Q+04x2zTR7TlV3eG5apeR3IGy44vfLECMVb7F0ArN2D1xO40VlipYI9jBNkH0st3kFH6
 uKJgANnp/gx0KE8qadhsX0QwUYKQR/ygJqxITTR1m36/SEqIwjTRdhMLsComlWbw8tDF
 nGkXBiNzGeLxBrYFZbJ14yjA004yH6YGocvsnqGbLRtFRVxTWQFeHraPnaUe3mTZYZMD
 vtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781525757; x=1782130557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HArTwgODQoYaXXWISLaGAP/t/ZOAHV1MrGfG2day6lw=;
 b=l5FE4ZG6a19xwmOA/xoDQ+QL3SbPYDoR+idDLyL35Mdp7P46oFOgNPfWCmuN3+J/Nw
 MGXZqdytCq+1nlMfyXsBJa3OZ0MPa6xT8SPcA3f0p4ESY5UcmwRqaUKA/nEqkZn56Oaq
 8z2hi+XVY7z/NxIGC4NpxLw6LGe53hEdwl9+s1KXVGkk5bqYmb5PVR4hsp1PXrp2B6Kx
 gaZVPQ44jce788vzAMArZf4xOZsmqY5SY6F/5VYAmS97GB14AzV5okZZtxTo+1dFuh24
 h2yGCYmzqwMM4W7qUu7o8kjKRJWCHLAM/h3EmLlwChP1I+Lr3uKt7GBXobNTffDWBwvz
 U3rg==
X-Gm-Message-State: AOJu0YzCxTFYKMvleBZGhKFpcJXGd+HHfD1NhnNh2eXzbV2rlI117GoS
 FT9ZdUqHFEuLUL3O1ZbF/9Etwc5UGiiN35FAkQcwiuJNeuRRerdmmKhc
X-Gm-Gg: Acq92OH11xtVwzf3XzuTU5eFqZM/o0cLz2xFVjFxLuO5HMWOirAOGQo7LU46mNT0OKc
 P8Pz+c/TEAPfjCSQ7MGgS7T6v2B9N9mXztnYsIFTWwUj2k1H60guY4b0JtC+ucVWWx+YbvBww8+
 rgpj4jOAioJbwCbVA+qxEuurbHN3bSDFBlMtwHHfh3C/hkx1BuLaevNROqwKWqVIl/qv5/zxGku
 hQZ4JVXwVRYHrn5LJrfibWXO/1NTtUlfhkH75xhoDya7mHeKdGDGPYOu/c24mMrQRbwiggAAzyW
 ZJSJ3rMs95EZGGOswBlMsETWggyoqAWlQ7v6qLWnhyOktIK7ceV82rXBGN2Iun9OcLzrvM1hd7e
 6fXlrXUqYD0z0bwTe3Wy0xoG2J8QDNzL19TngQwYaA5ZYuLOIUj5xFycg8b8wqKStM+lxvVlA0F
 TmONkdz0jss7MXFHw2P3esE9++d7x4dmwIrr/cJ17BcD7DQRwd52Ao2w==
X-Received: by 2002:a05:600c:4709:b0:490:5057:f5f7 with SMTP id
 5b1f17b1804b1-4922007472cmr130246035e9.11.1781525752547; 
 Mon, 15 Jun 2026 05:15:52 -0700 (PDT)
Received: from acidburn.pod.cvut.cz (acidburn.pod.cvut.cz. [147.32.90.2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea4a128csm338491345e9.0.2026.06.15.05.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 05:15:52 -0700 (PDT)
From: =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
To: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrey Volkov <andrey@volkov.fr>,
 =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
Subject: [PATCH v5 1/7] hw/arm/sabrelite: Open code DEFINE_MACHINE_ARM
Date: Mon, 15 Jun 2026 14:15:01 +0200
Message-ID: <55ed0f719d944a46a46350ce010503b30afe61b0.1781111270.git.matyas.bobek@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781111270.git.matyas.bobek@gmail.com>
References: <cover.1781111270.git.matyas.bobek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=matyas.bobek@gmail.com; helo=mail-wm1-x330.google.com
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

Open code the DEFINE_MACHINE_ARM macro in preparation of creating
SabreliteMachineState class.

Signed-off-by: Matyáš Bobek <matyas.bobek@gmail.com>
Signed-off-by: Pavel Pisa <pisa@fel.cvut.cz>
Tested-by: Pavel Pisa <pisa@fel.cvut.cz>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Pavel Pisa <pisa@fel.cvut.cz>
---
 hw/arm/sabrelite.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index db5669c5c2..04484aaa14 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -104,8 +104,10 @@ static void sabrelite_init(MachineState *machine)
     }
 }
 
-static void sabrelite_machine_init(MachineClass *mc)
+static void sabrelite_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Freescale i.MX6 Quad SABRE Lite Board (Cortex-A9)";
     mc->init = sabrelite_init;
     mc->max_cpus = FSL_IMX6_NUM_CPUS;
@@ -114,4 +116,18 @@ static void sabrelite_machine_init(MachineClass *mc)
     mc->auto_create_sdcard = true;
 }
 
-DEFINE_MACHINE_ARM("sabrelite", sabrelite_machine_init)
+static const TypeInfo sabrelite_machine_init_typeinfo = {
+    .name          = MACHINE_TYPE_NAME("sabrelite"),
+    .parent        = TYPE_MACHINE,
+    .class_init    = sabrelite_machine_class_init,
+    .instance_size = sizeof(MachineState),
+    .abstract      = false,
+    .interfaces    = arm_machine_interfaces,
+};
+
+static void sabrelite_machine_init_register_types(void)
+{
+    type_register_static(&sabrelite_machine_init_typeinfo);
+}
+
+type_init(sabrelite_machine_init_register_types)
-- 
2.54.0



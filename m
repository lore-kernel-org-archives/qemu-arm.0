Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CA7C5DF97
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 18:44:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzIaz-00005e-JL; Wed, 26 Aug 2026 14:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIax-0008Nl-Tw
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:43:31 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIau-0002SC-S7
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:43:31 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2d715f4a587so10261025ad.2
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787769807; x=1788374607; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nM1ebK5QgzPh85KBZgAbuAGl8pCvUeZGCYkdeDEjbf8=;
 b=eF+BoHcXjZItayld7X5V+o3iEF1U5Qa75h7/huGtCdGHC1ZB5DJHqCdQsdJLFc3jrT
 bU7CDZyjdir+KKU4nP0fqYNX3fNxS+bS/WRhmBGGYA3oyuNmcD3t+aHSiLjPSzsH0NIy
 Zs5x+6n9+EmwqLPjnfVEqV+vey6AEAlxnemH4t4g3jOCTTcnc1X+/vOsTCoaiBwCo9vb
 HYpIgHThju1qogyvuOASm9YmweFhMaWu65F9MMW8dyOY1wjjc1ehHjoJsnQQkDwSxu2p
 1irmJi3Lv0G9W8tq2jES/YAAInEC+OT5nOvFegZ792DUGosezodYzmgn1oEbjCKPHsPP
 ekEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787769807; x=1788374607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nM1ebK5QgzPh85KBZgAbuAGl8pCvUeZGCYkdeDEjbf8=;
 b=CYTLa3JyAgn4UNDU24jBpRE8b1GgPZFhK3QQFWhw7vjKSRj90dndVWEnY/pgstgWIa
 zyBU2un7egCt3cZy8Ixcsg1FF5pXSWxkcGCpJQvA0A5RWSiQqDDeLRvWXyQ/a5GrQAkz
 bnVBCOvGOnya3Q2XpEHGoDmiNj0txTs4m6o4LhZnloKEQH9iLnuHwrlP/mcEY8432WSS
 QH2bUnSXAH1LEJnBCs95lpGYqX4HC2VTURqfUWYQKhuTpMjtY3xRaNpIuDjZyOUP+svR
 8s1BeuUTkKxTd66ung8eQ8JYLI4E0ybRwAPKdjC4G8bzkXARzqkYNj5vRQOVFlP+Yuz/
 oQig==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr8680NFH4VGerQ2EfV4ZUbELcD67t6+qEnb0BQbstOEL0viTq0n8J9xb5g6mhvs8Ds0R9AEoTKTQ==@nongnu.org
X-Gm-Message-State: AFuF++lmTXwYae983j6ARzAVkOaVbK2zq+R+bWBmc5C1k1b5gMVULWhW
 5eS9LRZwFyTTlN+IpQHPlljnDnBxViR26X2rS4M6SSYiy9/ZCB1+0D2B
X-Gm-Gg: AR+sD10s0BoKUMxDAi6woD3nZW+cHKJscfbDn1r01KFfWF0Yexhl93uASqxVRjK5lbe
 oCrlk+kmy7eEKtNLRFP7PC07mtbzqE5KUH1rTW2G6pplQzxAPmleE7+ww/GCK28sae2xi8MGFXF
 GAlSQp+58BwNKeoo6yjsO86haquvOfZ+f7kC4cAUEHK9fLLiUsBTTAoOsyknljxIAA7qAA2S1sh
 0u5VzFCRgp34izBVTIRRddSTpC/Q/PbBOYmIOf3/RQD89k9/2RQujR1Xuezj3ogj+frYZpOnAqC
 iz9eEqmlYMK/5nDrrRXtKgxQRrb0szsuwcQeRd7RoMrmRJQK1MIV5xh30aNAo7ayJpaAZFbiSEL
 p/uw+4VpZ6DBH2RtRBsziyGgV6ZPuyVap0u+JqQpOCUGdmS5yxAHTmhuRO+hARWw626XiSp/kmV
 6iu57ZHTbdsewLt+3D27KSAZDoeQYd6z11IrCX1Uyg0ljPMSPSVmSm5oYIvhrVOzecp4F3lEkma
 WDGuloSvuaxKQraLw2d2w==
X-Received: by 2002:a17:903:46cd:b0:2d7:1cee:3682 with SMTP id
 d9443c01a7336-2d71cee3c89mr70518955ad.5.1787769807238; 
 Wed, 26 Aug 2026 11:43:27 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-3283d60c291sm17681846eec.6.2026.08.26.11.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 11:43:26 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Xianglai Li <lixianglai@loongson.cn>, David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bibo Mao <maobibo@loongson.cn>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alexander Bulekov <alxndr@bu.edu>, Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Ani Sinha <anisinha@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 05/13] hw/riscv/virt: use unique QOM name
Date: Thu, 27 Aug 2026 02:42:19 +0800
Message-ID: <20260826184229.1145-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260826184229.1145-1-luoyonggang@gmail.com>
References: <20260826184229.1145-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x62d.google.com
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

Use TYPE_RISCV_VIRT_MACHINE so the RISC-V virt QOM type does not
collide with ARM virt in a combined qemu-system binary. Keep the
-M / help / migration name as virt via machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/riscv/virt.c         | 3 ++-
 include/hw/riscv/virt.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b767c5434a0..9019a0a04d6 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1721,6 +1721,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
 
     TARGET_SPECIFIC_CLASS(oc)->is_available = target_base_riscv;
     mc->desc = "RISC-V VirtIO board";
+    machine_class_set_name(mc, "virt");
     mc->init = virt_machine_init;
     mc->max_cpus = VIRT_CPUS_MAX;
     mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
@@ -1784,7 +1785,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
 }
 
 static const TypeInfo virt_machine_typeinfo = {
-    .name       = MACHINE_TYPE_NAME("virt"),
+    .name       = TYPE_RISCV_VIRT_MACHINE,
     .parent     = TYPE_MACHINE,
     .class_init = virt_machine_class_init,
     .instance_init = virt_machine_instance_init,
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 36a2def4109..5559783aebb 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -30,7 +30,7 @@
 #define VIRT_SOCKETS_MAX_BITS          2
 #define VIRT_SOCKETS_MAX               (1 << VIRT_SOCKETS_MAX_BITS)
 
-#define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
+#define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("riscv-virt")
 typedef struct RISCVVirtState RISCVVirtState;
 DECLARE_INSTANCE_CHECKER(RISCVVirtState, RISCV_VIRT_MACHINE,
                          TYPE_RISCV_VIRT_MACHINE)
-- 
2.52.0.windows.1



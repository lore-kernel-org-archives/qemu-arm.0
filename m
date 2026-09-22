Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CCBC98308
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Sep 2026 21:56:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x98T5-0003Et-9e; Tue, 22 Sep 2026 17:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x98T1-0003Df-Nu
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 17:55:59 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x98Sz-0000v1-Uj
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 17:55:59 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-142dd05d97cso460600c88.2
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 14:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790114157; x=1790718957; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uW6FZ1Hr/xnFGp6V/UXuRySYDmLzTaOM2yV3AYLNlL4=;
 b=o0YWaVJOTLCEe8y2ytCr4vTvRZfhOIQgJYvw9+iZcUWhPTl4w0tzb0lH/HAJsMhnoa
 B91HEcChC5khdpZ8R8XYjNK4/3fDZsMM/x7qR7c07rxzhokQ4Xq5yGwC1rxw2SgYnPb6
 GYecQE+ypGblA8KH98YSFsppCmQiJl+OZZxL1btIF+dVWKB4OOBVqFvB37GkC2Nwktyv
 Vv8vOoyTeOGa0YK89rPGDg8iMMTlVwTUoOdlA4q2S/DrdFomv5ZOf3m6l2ShHUrBJ+56
 UE2N9jsP8Jv22UvfAheat0ppWNJCsL3xWCPTpMGZQpsBLjwNCjqOpLaYdmRqZGgbjvrC
 J+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790114157; x=1790718957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uW6FZ1Hr/xnFGp6V/UXuRySYDmLzTaOM2yV3AYLNlL4=;
 b=Quz6YnU0bzE/e5UfMUBQzmIRUzzdZVUJxjNNimFcVnDhBVYsYl3ED5dSfepefHVxwc
 leszJKHlIgFDwUVAhrfM/RJmwi8RoCkYTvqKCSe8KtS6CgyrGSNDVzFFZWYmwZoUhBOc
 z79ARgImyAjLPFgiEzYmDUPeGDUwK/+JSPYn/GDoubEm49jvp0z2G8exV4hzGWDtk8bs
 3IdBI4lz4aZwI/g9QVPGyED5SrW9JAOpnRzcXd3A66A+llTDExUebsMlhEI1KJs3r2H2
 vvIeRlsXdLfV4TgS5D1ADN1EBysD1Id15CXvDDLCF+qkNTw9TzbAq6qoG2qminT7h0L7
 4SeA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxXHhSeqWlntH0ATFA3x6angfqHa5F2xW3TAeRA3LKkXxH9sZlZJpvxVJNbr6DgIv/SaBy/PFuDDA==@nongnu.org
X-Gm-Message-State: AFuF++nmL0lBnacVHPWPf5pW3/P5uV3/C/WYrzYgIe48eH6mJ5zBjhMG
 wpjbv8YxxF4r4oGfB81zUxXq+FoQ/ekKOOwXNmgp7+zvPQb8nZt596zO
X-Gm-Gg: AYBFou3PMlY1C6T6rSIpUjsEb98Y3b8vj2y2tFRG6ueWjtivorkogi/F+sGGRpxSHzu
 q22JlvRAmMs0m75Gs8EBM0Qg+o+AUdoy3uzcdC1bj3QKBbA8G0sJrPfTB6S9B6tceVNVhdhzRFo
 Q0pFlfdFHu2JqEYyOnodECM/biVlwk33OcBFSHWQOjGCwPEXQeFrZyH7cKn79UDFPO8j3i+lMcf
 Go3y5Vl8jFuB80kOmw0CYih4+ye6njNurm3Belb5momNegBHvNJfWLwyoRAlAmJ6qR8Om3DNuLn
 Ipu6GZ3klpJCf3GG6tmHu0wi+XIlc8IY4bGgMfKPjwPM2/Alip99XKrzaaeRb5fyvwkG+IwcNnE
 ewE4SWlLK9ysJ2Ut9BqcTbMt21ZZeEftE1tR8YiVkLijeMSBtmMH0ktbK5c67G7Onym2myIwSgt
 QEh/ccit3iNCr/tzuUO14yF9DVSoN53anQjrfuOeMK3IMS+sDDiNHZPfDVeZEDuyr7RmXgfzxg8
 WoaWmi1SrtJPxBMTEYEHULDMblQF7UxHzjpr+QqQw==
X-Received: by 2002:a05:7022:7e02:b0:143:296a:c860 with SMTP id
 a92af1059eb24-144f92e1efcmr810525c88.26.1790114156590; 
 Tue, 22 Sep 2026 14:55:56 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144f949e60dsm1001153c88.2.2026.09.22.14.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 14:55:55 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Xianglai Li <lixianglai@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Song Gao <17746591750@163.com>,
 Markus Armbruster <armbru@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 2/9] hw/riscv/virt: use unique QOM name
Date: Wed, 23 Sep 2026 05:55:25 +0800
Message-ID: <20260922215533.641-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260922215533.641-1-luoyonggang@gmail.com>
References: <20260922215533.641-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index d4b501802f6..b29182cb39b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1134,6 +1134,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     mc->desc = "RISC-V VirtIO board";
+    machine_class_set_name(mc, "virt");
     mc->init = virt_machine_init;
     mc->max_cpus = VIRT_CPUS_MAX;
     mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
@@ -1197,7 +1198,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
 }
 
 static const TypeInfo virt_machine_typeinfo = {
-    .name       = MACHINE_TYPE_NAME("virt"),
+    .name       = TYPE_RISCV_VIRT_MACHINE,
     .parent     = TYPE_MACHINE,
     .class_init = virt_machine_class_init,
     .instance_init = virt_machine_instance_init,
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e516898f9ad..969aa5866ee 100644
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



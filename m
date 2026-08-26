Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F20CC61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 18:44:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzIb8-0000UP-04; Wed, 26 Aug 2026 14:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIb6-0000MS-56
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:43:40 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIb3-0002Ul-D4
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:43:39 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-c9e7391839cso1162978a12.0
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 11:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787769816; x=1788374616; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3Hv9iWfS7mfY+j+Db48HXpOFPwt6LwOOGwuKKSASBkg=;
 b=gxZRd9XxuLgTruvOXEDrMgpfnIvNhlflvj23vColCHZewrzwXQm9ko4nuoddaZuRVe
 GnAbwRo7IgHLW7umK3tvGCBy3RmKbtXFpZnJMZiArxJ44vKhqeHlorY6DlkeES0Y3+gg
 DkZM9NY6M4WYk3TyIatrq9x4W368tGOX62nf2aJyv+imEgvR7seNLOvPmSQOeXVk/Jv3
 kT4pTEDoEB1B8chY1rVH+zHw5daWUdAWzO4tXO/moNzwr+d6PJCMqzl0/opfXEha3IP8
 mLnaZHqnqn64rRtUjDJVoRQedoCye4ltfDVI7KcDS1VD0MgcOBHnLZyoCJGfROGdx1YV
 gPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787769816; x=1788374616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3Hv9iWfS7mfY+j+Db48HXpOFPwt6LwOOGwuKKSASBkg=;
 b=ryvCcAb6kQNkHxp31m1sjVD5shlj5epJBCuDgbbK0e59ECZEO1zMvS6xonoOIE5bDt
 3xXUnkyYiN6HKf9pOn9TL0gSzSLTrdRGR7PHy4Q9MNrliiZSjukFOu0hIx9/hEjLQ4wk
 c+/4AI97pDXlh9tiRkWx4LY6CTF14fvP4mI0HBL8CZD2t/LquziZhS2c8BVvGVLIXI0K
 CuB1/QTnoeSOl1ucEIhg5OvRCfIpj7J1uMTWOoJC/wEvWj1ulwoUgCv4YSx26S396W5J
 +n8PZMvzpvp4UmL5GdWWv3mLeA7IG0RmzXUbHH0H1ciJJB4/xDLB2PMifYRuVFEapkdo
 isdQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RooJtXj8wzyR8ZIlIL7iukxHrbmbT4xVVPXsJU/l05mC0nwfahYp+IrA5bRdFABMu8E4I66TbV4Cg==@nongnu.org
X-Gm-Message-State: AFuF++k7bfMocCaHZ2rEUJc04N9uzUaswpvc2shdUcmECOYUnh/MYY4f
 G5Hef4HK1CZUrYrrZ5qi0XcQ27GdcpKNW9d5t/gNgUTjyrAFrqSEh+F5
X-Gm-Gg: AR+sD12yqMDnPU6Ib0Ge+ns66nMsb8g6SblNC6NXOlhAIlaFeYRZrnKzBk3Pju5/3n0
 flby6Fe6qTKRkam5lNrpSa/KbS6WnbUHbpdZPn5Tp4Zb0rsAuIBtwHLkvD8LB8SQPh2GvoPWTRI
 E62tyquwEvhXaX79UFjyvURcHjILyLA3CLRAlCO9cS82SPcRk7d8DPCewNpSu5/ekPrV8PjwHg8
 xeQvdid91Jzlp77wG/S241rfwFMYqrIAcWbcAG/WMN4ij9LIQYu8KlUDmv/SQvD2zZGou1xPLAq
 4gCn97qgvwIb+EpE5O43Upmf7asLxm4E0xLOavcAICiXVS/aaJjst9CSgHCHWnG61AhM0CU08Sb
 iIxN0F1duq+9y7yWjN2iK0aTVwmvW8urAVLamkQxC0p45CXGyDaGkcBaAQZtZfWIlpktpE5WqsE
 M8/CTOUCG9cLwbUQ9pgWaaZgS0q9lB6Ub6rxQzxPUeyBpfkAJdfVwovO5VgcLpMgi+/JFRMH5SY
 atLlm74Y191p/lZwhXMIELl90lsLyKZ
X-Received: by 2002:a17:90a:e70f:b0:38e:49c0:75a7 with SMTP id
 98e67ed59e1d1-3966d43471cmr19184220a91.8.1787769815927; 
 Wed, 26 Aug 2026 11:43:35 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-3283d60c291sm17681846eec.6.2026.08.26.11.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 11:43:35 -0700 (PDT)
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
Subject: [PATCH v2 06/13] hw/arm/virt: use unique QOM name
Date: Thu, 27 Aug 2026 02:42:20 +0800
Message-ID: <20260826184229.1145-7-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260826184229.1145-1-luoyonggang@gmail.com>
References: <20260826184229.1145-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x536.google.com
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

Set TYPE_VIRT_MACHINE to MACHINE_TYPE_NAME("arm-virt") so ARM virt
no longer collides with other virt-machine types in one process.
Keep the -M / help / migration name as virt-* via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/arm/virt.c         | 3 ++-
 include/hw/arm/virt.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c2ace7706f1..ee71974e67a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -124,13 +124,14 @@ static void arm_virt_compat_default_set(MachineClass *mc)
         MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
         mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " ARM Virtual Machine"; \
         MACHINE_VER_DEPRECATION(__VA_ARGS__); \
+        machine_class_set_name(mc, "virt-" MACHINE_VER_STR(__VA_ARGS__)); \
         if (latest) { \
             mc->alias = "virt"; \
         } \
     } \
     static const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
     { \
-        .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
+        .name = MACHINE_VER_TYPE_NAME("arm-virt", __VA_ARGS__), \
         .parent = TYPE_VIRT_MACHINE, \
         .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
         .interfaces = type_target_specific, \
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 22e66d1a113..383ee320948 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -215,7 +215,7 @@ struct VirtMachineState {
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
 
-#define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
+#define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("arm-virt")
 OBJECT_DECLARE_TYPE(VirtMachineState, VirtMachineClass, VIRT_MACHINE)
 
 void virt_acpi_setup(VirtMachineState *vms);
-- 
2.52.0.windows.1



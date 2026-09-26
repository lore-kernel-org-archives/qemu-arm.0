Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505ACC98318
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 11:10:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAQHQ-0008HR-8j; Sat, 26 Sep 2026 07:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQHP-0008Gp-0I
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 07:09:19 -0400
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQHN-0002o5-AI
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 07:09:18 -0400
Received: by mail-dy2-x0e.google.com with SMTP id
 5a478bee46e88-34182b58c7eso1319314eec.0
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 04:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790420956; x=1791025756; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=lJKwdQEoHe4APx9lrycp1Fbb71T3Fetg8ApXItJlKJs=;
 b=Uw6XTWKXZlN4E0KYDhNsmvpEMmEhGhKtVvHeCRX/gitimpWKrfzcwHY3jkk6VbCaJb
 22eOceqNt1U+j3bOetkYxg3JAUk62z+hqIcxoRajL6T7P4SgJwiZDq69i9Ur4cSs4IQT
 tbQIDrvVGlVNAZnvyTWOvvOfyJDAn4OQgQgjLQdPFuGzOTdgDxyzvgpt+phtK1EunseA
 qIFcs82oYYw0Xf+cqgugIYuPXLO22fj/RfMIxlOQ/P0EcqKDzLAhHFK0XfSSeTzBYGg7
 nrRFXYVmmZdk3sc2frUs6f7vNac8ogqaK67qqTq6TnObKeqTYQZBhWiDuv72eEEksZ1+
 CRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790420956; x=1791025756;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lJKwdQEoHe4APx9lrycp1Fbb71T3Fetg8ApXItJlKJs=;
 b=uOi/0SFRz9y4PudBVSIVi3dShrT46oiqe0Vep4iNT5NDgYJfubkDoInoEUaCR35tAp
 wkqF+Mbm4bRGuCAnnpSjD68NrM312z1HA+FuVVMJnEOIbFAofauH9/54GKTdEVi6g+7h
 iqyODgYg0+MYYwwB+eBI/lV0p2CM1LHBFciYcscLHVDyLDLFB51IPhTJ7/Sn7kr/ysDk
 PsK2bxTJio9/4ir6N59TiMUzO3rQ+t5iBoaWCtguyyoW1d28dFauW6z4WZGkFm1sO2iN
 MtmiPviQeW65GrGLzlESPH/1EHo0pGommRg4W8H52oXANeFC9vBRdi26vpBoNRu69KrL
 0l+A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzeTTE8yoBlJE4mqyftr+A3pz064zC962BrCHU4F3awsY8Ow22SctschYRUDo35bgPV7el3iIyHIw==@nongnu.org
X-Gm-Message-State: AFuF++mgaxYykg+xIU9MGcZtWmfWbsyleBHk2IQob3N4i7P+YCYNWR0c
 Ae/BkJNyY4lR/bsY2vtsHiyadlldK5m9Ep7wjvWeBCStmZLr9G5Y0C6h
X-Gm-Gg: AYBFou3K912MZ8LWuQqZMuO/OGTe5JtRxPRPRZU3X50BjoOoy9H57K0FMvNhLs6tWdy
 ANgaPao+43+DGMYM8i26ACz+bBBQHlot8V1i4Y4JFskdeXBMKVDBIdpZ6XGoIrpHpU3oM00xOxY
 GrJXETrGOYRrDobblWYBPDb+kg9OJHTCVrGQGMhZpB27vxTKDrYvm9XvZlCo1dkR+X4DFN6mKU6
 NWqTa80NWkkvBxFcS51db79EHaK5rt/PDxyykxED3g7F76jV4YLGUOTwnIQ5gZXJc5kCm7UsBc3
 /Fxb9dZ3W/J+w9P17dlfhMTwXSKG6NEC9AcSNsGzAEEllFIJRVyN3DN7etsh2u08SiltUReOhSG
 zMWJ+62bjRqwwJEtjtn8Xa1rO7xSRxzLMTBb86Z6oWpHImiDDUnCZIhAhzjVa4LjwxeUusAsJxS
 GJgAa9ZaLqV/55MR76HqP7cVmExkFvFnLfMjE/KihSIL6xlufyalQEWdqEP5cmH/K+K+dg68J46
 7C9NADRojTBsS800EqC+agDekJAWDY=
X-Received: by 2002:a05:7022:61f:b0:13f:c741:a4f8 with SMTP id
 a92af1059eb24-146cec4be36mr4055716c88.21.1790420955084; 
 Sat, 26 Sep 2026 04:09:15 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-145a7318afcsm11414045c88.0.2026.09.26.04.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 04:09:14 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Song Gao <17746591750@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>, Ani Sinha <anisinha@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 8/9] hw/loongarch/virt: prefix ACPI helper with loongarch_virt_
Date: Sat, 26 Sep 2026 19:08:16 +0800
Message-ID: <20260926110818.1912-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926110818.1912-1-luoyonggang@gmail.com>
References: <20260926110818.1912-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0e.google.com
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

- virt_acpi_setup is the same C symbol used by ARM and RISC-V virt.
  Rename it now so a later combined binary does not need meson -D
  prefixes for LoongArch.
- Rename the file-local virt_is_acpi_enabled to
  loongarch_virt_is_acpi_enabled to match.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/virt-acpi-build.c | 6 +++---
 hw/loongarch/virt.c            | 2 +-
 include/hw/loongarch/virt.h    | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/loongarch/virt-acpi-build.c b/hw/loongarch/virt-acpi-build.c
index 600ef60fc58..b9df9b3a127 100644
--- a/hw/loongarch/virt-acpi-build.c
+++ b/hw/loongarch/virt-acpi-build.c
@@ -674,7 +674,7 @@ static const VMStateDescription vmstate_acpi_build = {
     },
 };
 
-static bool virt_is_acpi_enabled(LoongArchVirtMachineState *lvms)
+static bool loongarch_virt_is_acpi_enabled(LoongArchVirtMachineState *lvms)
 {
     if (lvms->acpi == ON_OFF_AUTO_OFF) {
         return false;
@@ -682,7 +682,7 @@ static bool virt_is_acpi_enabled(LoongArchVirtMachineState *lvms)
     return true;
 }
 
-void virt_acpi_setup(LoongArchVirtMachineState *lvms)
+void loongarch_virt_acpi_setup(LoongArchVirtMachineState *lvms)
 {
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
@@ -692,7 +692,7 @@ void virt_acpi_setup(LoongArchVirtMachineState *lvms)
         return;
     }
 
-    if (!virt_is_acpi_enabled(lvms)) {
+    if (!loongarch_virt_is_acpi_enabled(lvms)) {
         ACPI_BUILD_DPRINTF("ACPI disabled. Bailing out.\n");
         return;
     }
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 9c5371af9de..19fbf6db0d9 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -242,7 +242,7 @@ static void virt_done(Notifier *notifier, void *data)
     LoongArchVirtMachineState *lvms = container_of(notifier,
                                       LoongArchVirtMachineState, machine_done);
     virt_build_smbios(lvms);
-    virt_acpi_setup(lvms);
+    loongarch_virt_acpi_setup(lvms);
     virt_fdt_setup(lvms);
 }
 
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index d39a9bbf5dd..72268466def 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -132,7 +132,7 @@ struct LoongArchVirtMachineState {
 
 #define TYPE_LOONGARCH_VIRT_MACHINE  MACHINE_TYPE_NAME("virt")
 OBJECT_DECLARE_SIMPLE_TYPE(LoongArchVirtMachineState, LOONGARCH_VIRT_MACHINE)
-void virt_acpi_setup(LoongArchVirtMachineState *lvms);
+void loongarch_virt_acpi_setup(LoongArchVirtMachineState *lvms);
 void virt_fdt_setup(LoongArchVirtMachineState *lvms);
 
 static inline bool virt_has_dmsi(LoongArchVirtMachineState *lvms)
-- 
2.52.0.windows.1



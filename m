Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE247CA5FDD
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:21:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjl4-0007pU-6s; Fri, 02 Oct 2026 16:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjko-0007ee-PQ
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:21:16 -0400
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkl-0005rq-Dw
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:21:13 -0400
Received: by mail-pj2-x0e.google.com with SMTP id
 d9443c01a7336-2df4aa80a73so53992495ad.3
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972470; x=1791577270; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ECmgHwSv+GZ8NtYZYa9Wu8TZqcXs72gUdyc3woKQsHw=;
 b=ChhRJoC51ElmzL59TVMPgWPlYQtSg4CpDllgpvcIqu2NPa2nYb9QgxvY1oAjd6wTtR
 9KlJDq5A0ZaZX5F3Tam6HqTBFjOCSdM4vKb5PCgwOMrP8HqfH6AEkZ6JseHmoV3MXrLH
 Ph6fylvwNbkp/j+Bwve/lu9vcs3NhGNjMX1znTf4uktJlSi93lVGdqeI1oUt5ZhH3w33
 ZPffMII+0Kbo3xIMpuqJV9mM24hAk/EHT9enP2nBjD6IpskO0ftpMcyGKCXjSUcKzFiH
 BrywI7E8v4JTvDVpn63+5O/udliuQiYYqiKC0aZNT3j6WAcPUCL+ALkcFpOoyRzoh3PW
 N5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972470; x=1791577270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ECmgHwSv+GZ8NtYZYa9Wu8TZqcXs72gUdyc3woKQsHw=;
 b=0/J0V4ganO5Ie5MsTB9nx/1F4UKVLcfikAPYpxX4wWECMI/05mCdkTM/GcIX4araMr
 gIouB0dHGit30cOTV0Kvehf/m7D+HXl81BUD+PqLB5md4hi7AJLiknG4QapVek7wFFAV
 4rK/4BUNkiknTld089cobzP38sYJXvkfbIB4iOH0/3yABrEc1rXdGXygnci2KNpGy0Dj
 ehiv0n2PVR+hWBCbXECPEOTGi9MPOn4JmuHwZxlHB50oqgj2BXATOVmELwZs+fxWrSAA
 eI7RFDy8PfIrTMO+p+LCvXJTf2sOo/4buGdAfbh748UM8o1kRfOF1H01buY4jqLfVhtK
 yx2A==
X-Forwarded-Encrypted: i=1;
 AKwUvBw/kmWKNxOvw3lkfVArnV3GWQ17KsrFruWzExsNq5bE7My/ufkJ2DUHyjuQeqgNU7CjOpzM9Cil6g==@nongnu.org
X-Gm-Message-State: AFq9FYIFR+7VHIqWVLbXfwaGdVVkhunk9y4CE1a5lMsfho616Dg2DFPm
 n8Tkor/pC1IFeUWzk2q4wDFoY6OUSYPjKbH53hD36lk1k95exnCi29muZ8eFww8I4EA=
X-Gm-Gg: AYBFou2HbstzozyEscehrvE6GWdJQkhapwi6T7WuqlPS6SD+s35d879s5StXHKlTeeG
 dEKzoOito5WfH+LZ4FhOc6IQE4B5fepj+j0kI5r0ppISZLVVkEPihELydtAEi+Nwry22+XnQ1FT
 6OxYRQlWt8P2rTkAm6nYTQ/TwhW8b8YpiHgcRPmIU+KR8VHjD2Oh2mxvlUxTQIat0Jy+KMTDje9
 AZB3QDLCFl0tkhyirmwZ0hGjEugWkEaKG6RyqyHNeeFIhjyzOGruhy/Z+fu4jhZLTVmXpBS4koh
 6OxrSGFlyWOJSaIpZwIYQEgA3O2ojv3ifJm+op33pULSiPyUOIPP5RCWPPPotDmm+W2S4sBIsiP
 sV3dHTCJ4/6KU/mps2jkzYXdtRDLjH49/Vs7QkP2MTbKw1rIzqqt9ygwI4IwATOcsxxdLXhT+//
 +N7nNnfBxQuE1SHMjF3ajM0qPAUt+95yeS68JZBu4AsP7emZA0p7ouxAc2/cxWu/N1lz98tDPQh
 BKukvTyVUCJGNhJYQKpM7lR
X-Received: by 2002:a17:902:d4c5:b0:2df:83ce:727d with SMTP id
 d9443c01a7336-2e49b4e2662mr34316245ad.21.1790972469706; 
 Fri, 02 Oct 2026 13:21:09 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:21:09 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 22/22] hw/arm/boot: Skip bootloader for confidential guests
Date: Fri,  2 Oct 2026 14:20:26 -0600
Message-ID: <20261002202026.1204110-23-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
References: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::e;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

An independent verifier needs to reconstruct the content of guest memory
in order to attest that it is running trusted code. To avoid having to
reconstruct the bootloader generated by QEMU, skip this step and jump
directly to the kernel, with the DTB address in x0 as specified by the
Linux boot protocol [1].

[1] https://docs.kernel.org/arch/arm64/booting.html

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/arm/boot.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 9b3d3558bcbc..da4f399a3026 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -731,7 +731,13 @@ static void do_cpu_reset(void *opaque)
             if (cpu == info->primary_cpu) {
                 AddressSpace *as = arm_boot_address_space(cpu, info);
 
-                cpu_set_pc(cs, info->loader_start);
+                if (info->confidential)  {
+                    assert(is_a64(env));
+                    env->xregs[0] = info->dtb_start;
+                    cpu_set_pc(cs, info->entry);
+                } else {
+                    cpu_set_pc(cs, info->loader_start);
+                }
 
                 if (!have_dtb(info)) {
                     set_kernel_args(info, as);
@@ -821,7 +827,8 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
 }
 
 static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
-                                   hwaddr *entry, AddressSpace *as)
+                                   hwaddr *entry, AddressSpace *as,
+                                   bool confidential)
 {
     const size_t max_bytes = LOAD_IMAGE_MAX_DECOMPRESSED_BYTES;
     hwaddr kernel_load_offset = KERNEL64_LOAD_ADDR;
@@ -873,7 +880,8 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
              * bootloader, we can just load it starting at 2MB+offset rather
              * than 0MB + offset.
              */
-            if (kernel_load_offset < BOOTLOADER_MAX_SIZE) {
+            if (kernel_load_offset < BOOTLOADER_MAX_SIZE &&
+                !confidential) {
                 kernel_load_offset += 2 * MiB;
             }
         }
@@ -957,7 +965,8 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
     }
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && kernel_size < 0) {
         kernel_size = load_aarch64_image(info->kernel_filename,
-                                         info->loader_start, &entry, as);
+                                         info->loader_start, &entry, as,
+                                         info->confidential);
         is_linux = 1;
         if (kernel_size >= 0) {
             image_low_addr = entry;
@@ -1098,8 +1107,11 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         fixupcontext[FIXUP_ENTRYPOINT_LO] = entry;
         fixupcontext[FIXUP_ENTRYPOINT_HI] = entry >> 32;
 
-        arm_write_bootloader("bootloader", as, info->loader_start,
-                             primary_loader, fixupcontext);
+        /* Immediately jump to the kernel when guest is a Realm */
+        if (!info->confidential) {
+            arm_write_bootloader("bootloader", as, info->loader_start,
+                                 primary_loader, fixupcontext);
+        }
 
         if (info->write_board_setup) {
             info->write_board_setup(cpu, info);
-- 
2.43.0



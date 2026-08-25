Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94300C61DBD
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:03:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzEl-0007ps-Td; Tue, 25 Aug 2026 18:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzDT-0004PN-KW
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:02:00 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzDR-00022L-IV
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:59 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2d049069377so4142775ad.0
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695315; x=1788300115; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OpjWlRmtEinG28PJ3JYITgibmsTwvl/nI4qxNWAczI8=;
 b=J3UcPbv5q5n1xVqq0BODH17MIKVQ/SmvPPIV3KPI3jAWG30xscCZk3/Ts2Z3ZzwcSl
 sv2fmi+KAC7ndDzDqe1VaLnx4peTeLKPsCAAoy811+HrmKisiKNL/BzgvSxiBr4lcOUz
 gQKGW9gBC4+RcrUMk5D3MuI8LfGymWt5EhL+8F7Lpog4bKJgH5oRt2JWKsN2w1rumWaD
 Zt3+c8uVcy4u0q5yx8eps1nYeaDvXhrlnYYjyJTVCdPQjdAIbkUoX2PwE/bvsreVDADE
 zR5PNIMb4PtqRvUI/gLPqoYR5GpPX92mk855KiM3Hw18GtK7xmvi2Ps7V4iCdircECst
 +klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695315; x=1788300115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OpjWlRmtEinG28PJ3JYITgibmsTwvl/nI4qxNWAczI8=;
 b=VpTxRXuXNnsi0fFDV/3nYkKBTYyBMMYxfp1o2WiSRwtzS+ViKiGRPxpu52a/+kg/w9
 R7Uok9j1y/O9lWqAL/3sTG0xkGu3EplQoZkpjWCDWlHh7GHZnwFW7fY8JxBsbjOMHDwN
 zwFETyo0YwjTK3fWFVipUnnVK9otWdT9UfuBJpjKGh1t8qwkRPpfBPPzTnodLYERYjtD
 G2WGlIFbJ1jV471YNHgEh3grVS9yr/3lhNhz8nvQJvCHGO/P19TpKV2ymTi641rrGV3A
 SuVb0leFhx7mK5hUUyCbSEj27HBmcE/tc5jnplyGwtbi/F7mVhJiaPFTWYjCLKUsCHfF
 W2uQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpWMt9uKOttzjd061wRyHqZ1DH5a1B4mbV/REbyKaHVgk8tSYPev4t28l7h6OveEV7PQwxrvz/XtQ==@nongnu.org
X-Gm-Message-State: AFuF++mwji3yyCl06iFiLMC1vXsLXKSyXRxef0pTTCz1RLKe/0nJolMW
 hZiVtWWipVNI13FuQaNe4X+btq92Tt6RJoTSt67cwkd7CTN2o61k5R5+k93WS1XTbdc=
X-Gm-Gg: AR+sD13JcfVJMywfT0Vxo30viBEoOEvYH3P4nH0AWNlj3Hr+k5ELiLnbdaEQ71F2keK
 BMO+v8CyNof9/628ldQAIdF8MPVhImsq7bsqi9AWrS+hVyc8vGJVzRhmSQ/xoelw4LGJabd9Ihn
 ukrpiZ6ZC/kEQFL92Az8OfoHc1/kAylbqOnmdtvW810+MGuaAjCBpb5OuHqWbe+jDgrVMC8hBjP
 YIIm64X1YH+Spm/xjo53nJwleTxzWz0gW7Y2EyATajnspJ4cJ+k0mL1bgkjQvTRx2AcuQ98bwQ0
 0I/QPUbuXHAscgkv1AZRHWwEJPtYd9A5j2007hDarTa0l3h+obDTG1OSGVZ6I2uWKYCBTgI7YH5
 S1bukmwbuR+3+j9DsOuO/YLd3fcOlU5J8ecQd+QHMg5K9qqVBagutNK6eTjTRGvkn5aGJl1NYLs
 KOp/HyZP8ecOyD9ymCG/h5OuxW5qytSlOqOqWFGktPEYFYwCT9jiTGq993deUhvd6bKHbTC5Y4D
 +x1FeTPpZWNI3Y=
X-Received: by 2002:a17:90b:4a01:b0:381:25ce:bcc2 with SMTP id
 98e67ed59e1d1-3966d1bae93mr3763741a91.6.1787695315471; 
 Tue, 25 Aug 2026 15:01:55 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:54 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 24/24] hw/arm/boot: Skip bootloader for confidential guests
Date: Tue, 25 Aug 2026 16:01:01 -0600
Message-ID: <20260825220101.3443954-25-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x634.google.com
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
index ad588121452a..c555228a0dcd 100644
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



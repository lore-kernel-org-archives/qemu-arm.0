Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BEDC44503
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 22:45:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whEWI-0001dF-69; Tue, 07 Jul 2026 18:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEWH-0001cv-3U
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:44:01 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEWF-0004Ha-Eg
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:44:00 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2cad8076b01so954265ad.2
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 15:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783464238; x=1784069038; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mYNePrLJkuPtkx4mqIYMVJAY1RutCNE27kKxk1O9tJ0=;
 b=yTlXfRJ/aFsA57Y/bb+BBnFMBJwcYx2LrrKgx3zJZiYIzQEBdC3Ax/UsFshTDupphF
 T7gLZOfS+r+OanSbskRTfrJmsJxjQS/qCd0GxToGLgnZ7m54ji3jzTwMNRuFlbhvDFRV
 Yr4FPrTyqBx8qE87YNSMYeIsJ1jGmdm+D1tCAaTFzpr955X7o0g0Xmfs4ooH3kpChH4N
 DMYKdj34llY9Gnem5LnDDiZyckCzSZ4VJYCyc3923VoRLEtfh4CcqiheA6fJu9kU1uBm
 NLZtanI/kEwBIQHZay6q3SlJWjFi+oFIxDH770iCJE/LkC9JqTW26DexSiJIbq/vm819
 FBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783464238; x=1784069038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mYNePrLJkuPtkx4mqIYMVJAY1RutCNE27kKxk1O9tJ0=;
 b=pCAYyQo8QzcIeooAlFPHcHi7Btc3PgqKoHww/nzd5BjE2Be1x9O9r/hiN/OANa5p4U
 AVxyn3FhZtyUUAACZuJITpkEzWrqWsi0PG+kbBD4vaP2zyVzwRle3gYDiI1LX6LAFg2p
 UDUWdzIhbxo9NBvcgftLzolh5g+RAW4QSVJ/8ESUvOpSDkM43No6DTkAf4g+pm3IMF3m
 SWNxwRysO/YXalfFLotkGgKqvr07IzQ4ikZ+FIAtKok05AdMiMpxFmICDkk6Nv977bOn
 5OC6BjvBmUlMNDNsfO9zR92CbgX4Z2Teumj7Vmchw9AQE+E3vqw4Q3aSy35xFoqUvsad
 9AGQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqzzBumLDUkjR34XHvfPcKRycqT2/hV3K/YS8XIB7glv/FrUxpdaUzHbE88CgjBSE0/i+d2ZqLL1A==@nongnu.org
X-Gm-Message-State: AOJu0YxBuhrxivMk4E4Io/BMZFuuntWh6QL5td0HyQVz6teeojzJoS9k
 rtUBDI4zaBfdwy8Dy43pdpoMQaQyHoYXCMTPq8OiSgQYifnkEYJEpNG+ttrGC+aSMlpGA7Mh0bI
 yvsuYwMk=
X-Gm-Gg: AfdE7cm4+GGGDhzkt5iRPj6Tv75NKLlR/rtu6AdWjy6ArtW+/gqvd91Z8hOgdXSLmbS
 igwv8v316VQdK6fpEUIMtmmL8yyUD0xEBA4NbBGcBJYm7q83s0WR0IVYui6AMkIlojMjCzjSG22
 6AOl835EUnhClLSyWatMqBXQPoYSHh6pP4UY6uYIBCO3/vSBqJlmgDMV45ErKPIzGWDsZ5dBlzz
 EvTqeYAvDzuk5u0xa56YA0CoR6kS62hXaB9PKkUn59HD0kafpRdXWiAYE8Ci4lbGWPfVSQ89g/g
 D7mJRXXld0j+SFPhi34yjRprZoXIX2s7+qbrTqe9Pgnv0OQMalhQ2vbnC9umknUZeXtcApp6GCs
 paaAjlnuQx4kM6lpQ+KQ/Tj+HCx0tsLjvktAMlcet3SQwgOpVJEbTESbtQOdHgVZUaCWO2AecUp
 /oJcLlHPRabANesZMcciyRLkBfYdNZW9386UzG2Qk=
X-Received: by 2002:a17:903:144e:b0:2c7:f4bd:91b5 with SMTP id
 d9443c01a7336-2ccea26fb06mr183585ad.0.1783464237928; 
 Tue, 07 Jul 2026 15:43:57 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:46c8:dda7:40fa:8958])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bbaesm18183805ad.57.2026.07.07.15.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 15:43:57 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, jpb@kernel.org, lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v1 25/25] hw/arm/boot: Skip bootloader for confidential guests
Date: Tue,  7 Jul 2026 16:43:06 -0600
Message-ID: <20260707224306.1202330-26-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index aae77870a5c4..a5918b50d278 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -732,7 +732,13 @@ static void do_cpu_reset(void *opaque)
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
@@ -822,7 +828,8 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
 }
 
 static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
-                                   hwaddr *entry, AddressSpace *as)
+                                   hwaddr *entry, AddressSpace *as,
+                                   bool confidential)
 {
     const size_t max_bytes = LOAD_IMAGE_MAX_DECOMPRESSED_BYTES;
     hwaddr kernel_load_offset = KERNEL64_LOAD_ADDR;
@@ -874,7 +881,8 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
              * bootloader, we can just load it starting at 2MB+offset rather
              * than 0MB + offset.
              */
-            if (kernel_load_offset < BOOTLOADER_MAX_SIZE) {
+            if (kernel_load_offset < BOOTLOADER_MAX_SIZE &&
+                !confidential) {
                 kernel_load_offset += 2 * MiB;
             }
         }
@@ -958,7 +966,8 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
     }
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && kernel_size < 0) {
         kernel_size = load_aarch64_image(info->kernel_filename,
-                                         info->loader_start, &entry, as);
+                                         info->loader_start, &entry, as,
+                                         info->confidential);
         is_linux = 1;
         if (kernel_size >= 0) {
             image_low_addr = entry;
@@ -1099,8 +1108,11 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
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



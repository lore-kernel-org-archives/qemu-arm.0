Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41381606A326
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cJ92RHnc
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXuN-0005cS-Jw; Mon, 09 Nov 2026 17:32:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXu8-0005NB-5i
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:56 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXu6-0003yy-Bc
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:55 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-8b904d10882so606513b3a.0
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794263513; x=1794868313; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=y+u6Yq2Kmh1DA6S9pJr7fqXJM24Inl6fgSOuDXL+1Qo=;
 b=cJ92RHncxdjAajMsxLiGX2SaMV7uNKgjTODrW2X4dXHE5JA+EthpyKxKzuSsOxKTad
 jkRqa+xVSaVO4CyzoWueX3wqYzAXiohZM43tmGtKI1pIHQZE9B04Vpy+RYFydvBXK8Du
 3gLkoZI1rDuWneiG3MiDN+ctBU03RniicQXGDxYq4AQyKJy23h5c/QeVSHptYrnJnKgD
 Z35onTSQJP7SBBWZ/2LPYoPNDfVyNU33PpuhjHWqL4usFNKvs617T5wCf8E1b0B3GUtj
 mtUSH8gSrgoASy/JTQRtv04bJn2ywcxu9/3SN6MqZhVt8Lh4MN150SwDMiqsssWl0FwY
 lnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263513; x=1794868313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=y+u6Yq2Kmh1DA6S9pJr7fqXJM24Inl6fgSOuDXL+1Qo=;
 b=CBD1w3SEEwHXxU6i97sNjerbxq9BZh40bsPpW7LhJurb6btoFLau+1RN7TtMrXJ9Ce
 KrJA8rrPVopQMEvjilJg2hjlbV2weUYY4yw0HyqYrzUOos55FIfSF+52dVDbfgdnk9bb
 nmd0rJj0QwKxhTv5teANEY2SJUqKsAhUuKCFH9uFOilZwsZgVNchRpDPZ129dEl3K9rZ
 vcVExQghoc4yr2NWf8KbEJW1l4WIqUI+/zEytA4L8mucj4xTxVv3u6t0yksmBNIenikI
 +UoZL5BvvEfuqgruK99BB8hz/zucJTltT/lBtmuyVcm4a0YYtLmNwwIsnRspZifaRlaQ
 l+8g==
X-Forwarded-Encrypted: i=1;
 AL+hErFFY5UcRB5qA3cPN2KQ0l28rsLVEnOO29/8LviQfz/Kes9WySwG0cC+3m27SaFTa+SX0NtKvDdDtw==@nongnu.org
X-Gm-Message-State: APuU4Z/c9/8O+9eWOmHlKlTJYqNeLTbTiN5E0sJ9CXyOYdWEUkZbF+co
 8o0fuqxMfaCSkBV8YY387GGsvPHfisP9MICpAu7OwiZrsjsuSm5ooPdgnAnzvmuxGE4=
X-Gm-Gg: AYBFou2uH23LIWxu6T5dt3+zYECzJldisEpYyx+QOsUvJvtgH8eStlDHfJDz/2ZLv9Z
 K1zR6veQ1KSQkoA3Ghrf+BTnnR9uIWLa4JOizV3baQ5PX7iHeHuQG9rRRu0m5QW/6pyws8jkBmp
 cFrs5dH/oNzp2rrm3lBDWCDsSGt/UGCrfnOAAb8g+8rgGXJJElNv0Ke8uB2V6stmSa2vs/q45lM
 4hxN4eGBQEI0YBG4QD4Gxk0GvQpLY3B8/jBo8t2J2qzdfJkHqIMwLTyqskKmUNacatQP8JMjCeb
 10BpPMlCt1VMjYuZZeELJliMfZtY5gj3KnvkVPRwjpq0bZEXpQEcFtODeWrfUidu4gKN9zsnT7G
 Lx8UPFZVDda6rKAhvTJZ+8py3sVRjoOKCw7ji9eV8fzkzTgKg4ypaaP5pWNc9BaWnIrwRjMvaPn
 4dmcjCfoJdzrKvuZk9VaQGuD3/q2c5fietpKiqrbLXxStJpWH0S6TMHUalS89ZHysr1N9UKD7rx
 NEp7hCVaDstpgx2D6mSTQPqpN+1LQh6nZ3uNVUGvDhA9A04InhZjIP3Xp2C+mMYJ46C0Q0YvQ4B
 sNtlb0w2uCg5Pu/Kj7dWStcKwulL1FzCGzoWUv+STzDonSsrbHRM2qGGbTdJPMRF4wlhAnoSJws
 =
X-Received: by 2002:a05:6a20:549d:b0:3eb:afe0:20a6 with SMTP id
 adf61e73a8af0-3f18e4cd7c9mr635019637.21.1794263512913; 
 Mon, 09 Nov 2026 14:31:52 -0800 (PST)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa506bca4sm165830b3a.0.2026.11.09.14.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:31:52 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v6 23/23] hw/arm/boot: Skip bootloader for confidential guests
Date: Mon,  9 Nov 2026 16:31:10 -0600
Message-ID: <20261109223110.1619504-24-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
References: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x429.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
2.53.0



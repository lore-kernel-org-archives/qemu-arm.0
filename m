Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp264121njc;
        Fri, 13 Jun 2025 06:42:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMGLaNfln/3AILrkaU8wIZEbIgBFTbHqlR8TGX60JGyq3k3/HmwvFAMQrBE4cZQsmd60su9RUr2ez5oQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHLHmXlabTXLIDyrg52waRhB2dEg3ddwdoRmYwAtsevjvqzmac3NIAcpgfNuevEeieQxPlU
X-Received: by 2002:a05:620a:40d6:b0:7d3:9113:7902 with SMTP id af79cd13be357-7d3bc46e2b3mr515615585a.38.1749822175806;
        Fri, 13 Jun 2025 06:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749822175; cv=none;
        d=google.com; s=arc-20240605;
        b=T2ZttD0p4oN6K60ArOAibmTTDTuF3Hwdg5K0ay8LOAnAjADKvE+KgCHYYWcEkJS8Cj
         coW9c0grUtesklOC2VOm7SF5ZWxCm1fv3NfwEyHYkPiWDSRmjUaDDWD4IplZVTyb9Agg
         4hCOBZ2aFQiueP1j7Ni8GT+EgpEIF2Pm3EHErwIB3zCiP2jziNVHtFVML5w38gwIrFOf
         gAP69uc9YQpcA1qtm7UyL/zWufg2VH1ZwZDZGxlJ4Yd9ezyIQaf//oFXUaL2DeJPsDsT
         /di+df8ZfsmtQ9eRcH4Hoa7+Dg4+tmQR1wlKauOUrvbIeaqm4+AueOjXgaMqgoWqPpp+
         USyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GWZIDBLsFhdR8GCNkB2CqLPUwwJ7URlhmr8AdedA46w=;
        fh=ZZwLt5H82yHLOWpnvJwJfXwO1u4fGNY7kNtWC/UDUJc=;
        b=SmBYBCfnvlN4SVaWjxNpJA43wBoZyCdDq5pxxbPonRnVtdfstqIF21cnKKQkUhvU1n
         +PsneyA1PLX+0MQ4K3nKUfj68q7EpACj+QPjZ62NqaVSdHV/vJyc6nmAJGy71t6n+ku9
         6VP/X7shOxMoIEmsdyfcPbHms16LvF9InEf/Gs1QoBW/O3TrJ46w0JRM5ulvUhaE2tXJ
         rdqY535/KKPuhY6iEP8rakkiBFukbHlgBvMHpluoab5Vsorg/tq6wrO2+D7DYZa98DQE
         UcjKOP/mlH2lVtKBRooFOKkxmVyI9GmWkg3H8uE+LUlp+9Z7ZQ6xR3Jp+QQj4YUl3U8J
         d5sA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=jV+IU1xj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ea8780si302051785a.264.2025.06.13.06.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jun 2025 06:42:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=jV+IU1xj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uQ4g8-0001sO-UO; Fri, 13 Jun 2025 09:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uQ4fi-0001iD-UF
 for qemu-arm@nongnu.org; Fri, 13 Jun 2025 09:42:20 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uQ4ff-0006GL-E8
 for qemu-arm@nongnu.org; Fri, 13 Jun 2025 09:42:17 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so18075085e9.3
 for <qemu-arm@nongnu.org>; Fri, 13 Jun 2025 06:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1749822133; x=1750426933; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GWZIDBLsFhdR8GCNkB2CqLPUwwJ7URlhmr8AdedA46w=;
 b=jV+IU1xjMznxwsaYwDQOBPutJ2XMlPKvK6WEI3WOlsxJDSRGl4SkWAYPFVTiB+hVl5
 pZJ1fYPXLGM4cftNldiGlKF+flUt1glUJ11Jpi49ZkKGbp2etthFZbdcf2hrgzVXFmEn
 mpedvJAXQF1CD/pJgxJkjqtnNlPn0ejsxxxFubih5YUt8c8nyrgKaJOp3IHwU2E7LTtD
 PXHz1K+dkCuUs9SKUl/0pfPKPxKWti/lttRU4iL3VUhLgVwqlA3TfqP18vG9bF9dJQMi
 RmsUjkv9BK6pFjd1DF5pZkddtEXO+StoemruFxpz0A3so6O7kYbqE57L6LLdIKmgr3H7
 8Xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749822133; x=1750426933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GWZIDBLsFhdR8GCNkB2CqLPUwwJ7URlhmr8AdedA46w=;
 b=aZkj6OFE6YdQFfP7PS9nn8yGQj0ncPVdxoXleb13o1yEBgrSg+m7Fio0Mz5Nld7P4n
 VO4IUsemoXnMdafIDXlbN/vT1wWHgfUYkZRJsVs6uYr/o/ojgUTjqsijETupa812pTNa
 xIteNkstm9qXVQQ0WXTyVRwzPEVXcKNhqFGip+Tbs8C7SZp7lAUmu0DUyCbCwLutXynb
 17bOjRrlfVInBrnL8tWujkJqfktD4KO+CPEgat/6O1cpUabt/50KLHzovRTCFCRzHxI9
 fdr8Rbn5t2CP3Yn3SYX4Wrgqk0+yROhNwdaTy0Axyfzak4ndSuTl7s8X0GKV45HqJRhq
 f2eA==
X-Gm-Message-State: AOJu0Yya0/QVzZzJgg0qpYlAu/Bygry7B3S9okwZa0Ezekp4dRjIH8mn
 VyVD/mTN6EhSMhXoNLlovqk09zSfkZ46i7Aa4yjoGUZdil9mpwp7ochCyfiI3YI5/g==
X-Gm-Gg: ASbGncujdI9X3W3XwBSf1qAQRDZ1tJMnhYiSuT3uyMXNTSokmuTPEsuhg+7Dj4i2119
 0gdduB/pO//pm3fa9jo9r3UAdHIDCsd8hInzAEQGU0EjkXQ1fEZh3/8Z9cTVz/EKSmqb0GN1mUs
 1X5B6R0q6vRnNvkLv+XOhZfr6y1ezAnNO2txbay7KmrJtWPtHCk3L2BUPCNVQ2FlOnVOJBK/4w/
 SSK+qb049xij600hgoDrPP02CtZ0UZY4bJ2wxKQv8S3CKJ1gTcjl/ck+uCnB7aQZ+0+Vg4Zq8wf
 dnf2TRKXtvqg0l/iznWo+JHnqA5bxFbMUTFQOAgOchYAWkef6JLo1wykCtZBMHxhqIWGTa0=
X-Received: by 2002:a05:600c:4fd6:b0:450:d367:c385 with SMTP id
 5b1f17b1804b1-45334ae6432mr34861245e9.16.1749822133566; 
 Fri, 13 Jun 2025 06:42:13 -0700 (PDT)
Received: from chigot-Dell.home ([2a01:cb15:8100:3d00:9e4f:bbb8:63a3:78f3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e224795sm53258035e9.7.2025.06.13.06.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 06:42:13 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com,
 alistair@alistair23.me,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH v3 1/3] hw/arm: make cpu targeted by arm_load_kernel the
 primary CPU.
Date: Fri, 13 Jun 2025 15:42:06 +0200
Message-Id: <20250613134208.1509436-2-chigot@adacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613134208.1509436-1-chigot@adacore.com>
References: <20250613134208.1509436-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=chigot@adacore.com; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uiw2Th6eChzw

Currently, arm booting processus assumes that the first_cpu is the CPU
that will boot: `arm_load_kernel` is powering off all but the `first_cpu`;
`do_cpu_reset` is setting the loader address only for this `first_cpu`.

For most of the boards, this isn't an issue as the kernel is loaded and
booted on the first CPU anyway. However, for zynqmp, the option
"boot-cpu" allows to choose any CPUs.

Create a new arm_boot_info entry `primary_cpu` recording which CPU will
be boot first. This one is set when `arm_boot_kernel` is called.

Signed-off-by: Clément Chigot <chigot@adacore.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c         | 15 +++++++--------
 include/hw/arm/boot.h |  3 +++
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 79afb51b8a..3c93d87985 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -744,7 +744,7 @@ static void do_cpu_reset(void *opaque)
             } else {
                 if (arm_feature(env, ARM_FEATURE_EL3) &&
                     (info->secure_boot ||
-                     (info->secure_board_setup && cs == first_cpu))) {
+                     (info->secure_board_setup && cpu == info->primary_cpu))) {
                     /* Start this CPU in Secure SVC */
                     target_el = 3;
                 }
@@ -752,7 +752,7 @@ static void do_cpu_reset(void *opaque)
 
             arm_emulate_firmware_reset(cs, target_el);
 
-            if (cs == first_cpu) {
+            if (cpu == info->primary_cpu) {
                 AddressSpace *as = arm_boot_address_space(cpu, info);
 
                 cpu_set_pc(cs, info->loader_start);
@@ -1239,6 +1239,9 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
     info->dtb_filename = ms->dtb;
     info->dtb_limit = 0;
 
+    /* We assume the CPU passed as argument is the primary CPU.  */
+    info->primary_cpu = cpu;
+
     /* Load the kernel.  */
     if (!info->kernel_filename || info->firmware_loaded) {
         arm_setup_firmware_boot(cpu, info);
@@ -1288,12 +1291,8 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
 
             object_property_set_int(cpuobj, "psci-conduit", info->psci_conduit,
                                     &error_abort);
-            /*
-             * Secondary CPUs start in PSCI powered-down state. Like the
-             * code in do_cpu_reset(), we assume first_cpu is the primary
-             * CPU.
-             */
-            if (cs != first_cpu) {
+            /* Secondary CPUs start in PSCI powered-down state.  */
+            if (ARM_CPU(cs) != info->primary_cpu) {
                 object_property_set_bool(cpuobj, "start-powered-off", true,
                                          &error_abort);
             }
diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index b12bf61ca8..a2e22bda8a 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -132,6 +132,9 @@ struct arm_boot_info {
     bool secure_board_setup;
 
     arm_endianness endianness;
+
+    /* CPU having load the kernel and that should be the first to boot.  */
+    ARMCPU *primary_cpu;
 };
 
 /**
-- 
2.34.1


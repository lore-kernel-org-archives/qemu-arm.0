Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp553424njb;
        Tue, 13 May 2025 07:17:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlTOyMIB1Ok+8IWiPoI+DP00ma90fDfThlIqXvejme9Sz2stc5QwJND3uaacqTB09B0T9NdFVITWH5og==@linaro.org
X-Google-Smtp-Source: AGHT+IGFHmYMkzYAOfyE3A90oLncVK5V1OQ803U6pIuJ96koG5ugmkEPtLFIINGNG2T9V2+N6bVL
X-Received: by 2002:a05:6214:202d:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6f6e47c350dmr293907226d6.22.1747145844197;
        Tue, 13 May 2025 07:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747145844; cv=none;
        d=google.com; s=arc-20240605;
        b=cYNVm0VSZaGmoYBQPy8MrjwsUns/+BdcxAY1GMREy3tcJCyewsCVw6U3lerQCxkkKB
         gOsF3CzX56kvB/Oghd17St+Cvh8hJO5QRfK6vq1RMBeZsr03qt2JGy08oD5JUBC0IXRL
         bPFDP1dC9SYStd3lL0dNsvWJPu33y2jhi1M4AEFxOsI2tKFxeYNDpI/7V7go6USo0q4C
         5fzUP5Vynjh1FAKaZYfXAg06kT8IoAEyJWO8tSyq/izY5RMg4HnYC5kJyb9ZXFIku805
         cpCQ059ie348rFel4rx/dBPt26pVHkTFgjDQoum+5izDLlnZQruodq/X8FtPhCjQSfw7
         5irg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LygLYLUFHvvftBVrooqDvqdi3Y2+LGMw70v0Ar+6UnA=;
        fh=ZZwLt5H82yHLOWpnvJwJfXwO1u4fGNY7kNtWC/UDUJc=;
        b=Pw6Y83Tuy6Gc0j4AaHsHysHDj7p+FmsevoyxDIp/QsPLME5Oe4LwSontcndEO8hKMs
         D0eFYZ7CqTiG8sZ46WEtsE3vlp+vgnA+33GTxHSBm5kdOT4UyCrZIrXC2PuydKzNezDx
         0uF8wSkFW0OTwCzidWvp9yVk6GzJL9T7PRXdJWGc+vhD0xIpCDCiXBk8vYLLeb8BUodZ
         2jw2g0x339hXBxRVKE9QvlGKWfAX4oCAVwZYp52Cueb+cIVTBStYNQ6MIqyHVZ9Nt2U3
         vAt53otKoqL17f1/cLSvmVU+U9yW5Y6kmAqr2zreCbChSpkekELrzIrcOVR1RXcrnEhe
         OJtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=SuQwc2y6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a646e0si110153146d6.491.2025.05.13.07.17.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 07:17:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=SuQwc2y6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEqQ4-000439-5S; Tue, 13 May 2025 10:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uEqPy-00041z-0w
 for qemu-devel@nongnu.org; Tue, 13 May 2025 10:15:38 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uEqPw-0005Yx-8c
 for qemu-devel@nongnu.org; Tue, 13 May 2025 10:15:37 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-442ec3ce724so5332685e9.0
 for <qemu-devel@nongnu.org>; Tue, 13 May 2025 07:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1747145734; x=1747750534; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LygLYLUFHvvftBVrooqDvqdi3Y2+LGMw70v0Ar+6UnA=;
 b=SuQwc2y6dpVjxGihv9FqGCZPmDki2l0IBPVAgyfF4+GFZ5FlQexahEQ/ILQ4i8qOqQ
 Uuw6JkLAyFJGzSBs+sSI14b06TEWDXw8koq0Tw0kcTBj9jyB0FgYZ0/eSFakGDFBQhNX
 4vHPckk9vYD5LXkPbS6X9WScVG4e71C23MVRSMZiLmdnsjEluHKcF6UYgeO5e1cHrpeY
 0nF5W4RmvBUtC40tZU2XGR4QhzSrGBC6cEGA5aIpAPneJT3W0lJv30zmZnUcs3R/Ep/s
 9Zj+ykxI15gK+PH2qUqETqWoI/ARV4XSzrsCC9W+9aR70G/XplxIl9HsQwNr87qbFYTd
 YHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747145734; x=1747750534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LygLYLUFHvvftBVrooqDvqdi3Y2+LGMw70v0Ar+6UnA=;
 b=v5ZYVLcuw5pNi/tUuPMFuO8xNw2AinHDkjdVwI3/ewGe5QGQT09KyAngFQ29BJRDzX
 IkeVfY8BdxfD5a/DsOHTsUWP6hEX5x/yb0FAim6KVQRtJjlq5S9LL8ETc7WFpDa4Gzxb
 bGziJreUhNdZrvRBFVWsUa3GSuGJ1qNhW+i5lyGnSGAFIq7CpRiHSGsVFUH5TCC7L92m
 uj8wMPZsImJ/oriWNUVT/iko5mp08FcT36Pqikv82y4yBQnRRH1R52n9Y+o8B3Kau6kW
 WkdfqZqb6+rbNua64dQCk7pmnyDT2C2VK7xswWjxFqJXfmHYW+vpuHoF0s5aa1wKtoQ+
 5F6g==
X-Gm-Message-State: AOJu0YwFFlgSYOHA2wuA0fe1bc+WFWMZBcOxOT32s71VqWf1MVj+rRFs
 t2J9FhhU66fiJj0wH9xeZAVpYxDqFbXSZKdvRDmbzmMWbdgLsAbVhMYRvvkMR9Qm1rbmLbo/FA0
 =
X-Gm-Gg: ASbGnct4b8hgKUMWZfiyVVvRmZBj6iztf0IlKza2P7bOfa9HtFt+eETxRaM7E2y4aN3
 lfzzMV4qd0mlCcudWhaaT88gjOnIlrIxrWfppzHv9FqQIJdtT1htfMLi6ZZW3yBxlHvDCdqhcgS
 73DT0INJFD8zuKKSr206E8p6U6o5Br8v3KQS49Mt51kFaqXGTovpEVHKL+YrAyQoFuc2PqOPOLK
 zK9zOdy+2KGXIQkqIvFRkK11fAGoLHfufMvf12IH9xC4L4at/llcDg0lpWBHLQ5zJJTEs0aPlqI
 /5CZth9in0AjNRjzY9+sV8wR3rihHe/zHpvrnvD9MJ8oNWHTxbSyqbp1CwwHkBS3ezhJsn/NTWT
 yEfSi34GN/2CZh9pJsCjPfR7n3R5bIDH6cOGYYf9JAbTSnYSa
X-Received: by 2002:a05:600c:3e8c:b0:43d:fa58:81d3 with SMTP id
 5b1f17b1804b1-442d6ddf4d7mr128742945e9.32.1747145734371; 
 Tue, 13 May 2025 07:15:34 -0700 (PDT)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7e7fsm213438805e9.39.2025.05.13.07.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 07:15:34 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com,
 alistair@alistair23.me,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH 1/4] hw/arm: make cpu targeted by arm_load_kernel the primary
 CPU.
Date: Tue, 13 May 2025 16:14:45 +0200
Message-Id: <20250513141448.297946-2-chigot@adacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513141448.297946-1-chigot@adacore.com>
References: <20250513141448.297946-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=chigot@adacore.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: duUf+fVTzrkG

Currently, arm booting processus assumes that the first_cpu is the CPU
that will boot: `arm_load_kernel` is powering off all but the `first_cpu`;
`do_cpu_reset` is setting the loader address only for this `first_cpu`.

For most of the boards, this isn't an issue as the kernel is loaded and
booted on the first CPU anyway. However, for zynqmp, the option
"boot-cpu" allows to choose any CPUs.

Create a new arm_boot_info entry `primary_cpu` recording which CPU will
be boot first. This one is set when `arm_boot_kernel` is called.

Signed-off-by: Clément Chigot <chigot@adacore.com>
---
 hw/arm/boot.c         | 15 +++++++--------
 include/hw/arm/boot.h |  3 +++
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index f94b940bc3..8da4c67fa9 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -743,7 +743,7 @@ static void do_cpu_reset(void *opaque)
             } else {
                 if (arm_feature(env, ARM_FEATURE_EL3) &&
                     (info->secure_boot ||
-                     (info->secure_board_setup && cs == first_cpu))) {
+                     (info->secure_board_setup && cpu == info->primary_cpu))) {
                     /* Start this CPU in Secure SVC */
                     target_el = 3;
                 }
@@ -751,7 +751,7 @@ static void do_cpu_reset(void *opaque)
 
             arm_emulate_firmware_reset(cs, target_el);
 
-            if (cs == first_cpu) {
+            if (cpu == info->primary_cpu) {
                 AddressSpace *as = arm_boot_address_space(cpu, info);
 
                 cpu_set_pc(cs, info->loader_start);
@@ -1238,6 +1238,9 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
     info->dtb_filename = ms->dtb;
     info->dtb_limit = 0;
 
+    /* We assume the CPU passed as argument is the primary CPU.  */
+    info->primary_cpu = cpu;
+
     /* Load the kernel.  */
     if (!info->kernel_filename || info->firmware_loaded) {
         arm_setup_firmware_boot(cpu, info);
@@ -1287,12 +1290,8 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
 
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


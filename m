Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2229824njb;
        Mon, 10 Feb 2025 13:31:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXUjek+H+L6b7iCIAN8howOPVyb/dxiYT84Oeh0D/6qE4CXG2imiCsvZddRjBUXLKy+FMsMTz83TIqPdg==@linaro.org
X-Google-Smtp-Source: AGHT+IEft1xTI+2lOaMuCyZOFYdH3sx6svKtWeRNj1JMdB8G9JWAB5nnNMmZXp6Wo1jECCE566ND
X-Received: by 2002:a05:622a:5a8c:b0:467:517b:90ca with SMTP id d75a77b69052e-471a141a8b9mr15695821cf.21.1739223074319;
        Mon, 10 Feb 2025 13:31:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739223074; cv=none;
        d=google.com; s=arc-20240605;
        b=f4TdGmgk7GfJpBhiUpYt1d6Fsz4lh9b0aQ5Bx/mpOobFuwX96DwSmD9seJl/fB8Uar
         ZfjQ95JYsu7tvipouUck1PcISDy0RewZB2PVAyNfXeq4z1mZgs1pMrdnMv17WsI5gNSs
         iY9JWaFWrOjZVCWZU+0f91WhZigcA9Ixks+gaLtnjhFDNYcMBWmoqFXRY664BG/5E5vX
         HIObM1CuCSsdUMXH0FB0+euu6IYBBmF2jMDXw0HLQ0J1QzYI5Sa5Eky6i9GAIkHhafbN
         K9BzUMUVV9g+/IUC1DBDysMw6M45qX32ijb2oOo/Wl5Dn3DoojL1GOiogEo2mhCElcGB
         ZYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qcxWKPPyBgEMSe447dc/9VeQiSKl/TYrx71q+3sl0Qs=;
        fh=mM1ERsVQwgcKb3yo7TgbYZeCYb5iRr8ycQ/rB4WqrWI=;
        b=LcfgSMGjHw84Mb8gvI9j7C7xsbiSPqcqsFrcFrcwKVpbe8edij31KjNVSi9eBXy4Wa
         6qgCv4u0j1qbCTqX+fWoK7aEwbt6NbGGzP0Tueml1rwe6IbBwI/B2ycJUF6FF/OFlVkY
         OPIYmcThVdgOChtBU2c8xeQVGQwT+qCqq6iJ32NR6IrM4F1EOTp3VVGiQe68zewTfDQo
         RzpnovtFWqfTmMZq8Q2shVdVnwKSQWLg+6GdauVes7qgz5UCIIOlgA/fO2bpxnovn7qU
         nkpcD6op3MEc+HUvhMrDSQUaX7S1K4QQsN4GtmwzIXil06MqF9w4PFLzRlfLO5yCBn0l
         b/AA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YGCGHjw1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b6f885si106862071cf.249.2025.02.10.13.31.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 13:31:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YGCGHjw1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1thbLh-0003gH-8B; Mon, 10 Feb 2025 16:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLg-0003eG-01
 for qemu-devel@nongnu.org; Mon, 10 Feb 2025 16:29:48 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLd-0002AI-4u
 for qemu-devel@nongnu.org; Mon, 10 Feb 2025 16:29:47 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38dd0dc21b2so1745692f8f.2
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2025 13:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739222983; x=1739827783; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qcxWKPPyBgEMSe447dc/9VeQiSKl/TYrx71q+3sl0Qs=;
 b=YGCGHjw1oU8pzBHCsyn13IzV3jCBNcFtL9Bh9SEMEqiNn2gjcVqhCw+gPAYzMyw8+8
 9Hzc461zgTADb3ny9xFsZHLKteDQWXI3jdXgoWQRTjipIt5FVd3MFhdxqMPKN2N3ua4Q
 TvLzEeefOUB77jz+FtM7fN7t6PvOf8vTz11g7oBV9m2fMwVVYPhYycapxrogtL1vLIOj
 pjwaKKkPAQFnmf83ZndZ7a5Yi80/9lqQBp0tR7SGu//oPGJ0mksnJR7Isq16i2xKYBRE
 i5qwvWOZVpTa+R4Hpsb/FRrtuBxzlg8ZJzns+SH0aIIivvDFNJetmq2aTONrKFFUsXoR
 ww4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739222983; x=1739827783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qcxWKPPyBgEMSe447dc/9VeQiSKl/TYrx71q+3sl0Qs=;
 b=ctg5TWhWd8B84bpUyAiGG5VEJ8ueTn8WFtN5Eib13ksv/gRZXe/Z/ChJYMXVx+Gwy/
 goDdnibM/bb/YISTw9/uniIfLGyRZVeK6RE0hS4cHl3a4hKaC6q8POnRmohtb4pZT8ra
 VEuSJT7l3WEy1L5/LR1zwzPZ869KA4xrltDHyB6xLJ1MKPhfuGrytjzRbokeWPLnIg+d
 DrG7WGo7GorX975EcoARnHU/NMFv43U31zP1aAGh/g8nbby/ImxREKXHZHbV08jCcUFH
 PcSXCttgIh2sUi/jCDy9yxgxo4OIdcUNhXV+GlV1gfXOSyRM4tH9U+eOMmLsqToM7ctC
 v6vA==
X-Gm-Message-State: AOJu0YzoQTUxZrIQ0suXvWyI6DEKTNr/e0yT9BAIK/U62Wn974tNmdIx
 pch9hSDTGGVU9HoG7RTosinO3WS2mBDjiEd6XtylCcFSP0BW1Uvh/FhpEmWB2WlQ20qomDU5KLk
 nbp8=
X-Gm-Gg: ASbGncuCVc5ysfWP68+be/punZtuaezmWj9WOl5Xxkrr04SOwUIVKeEkv5LcZy3rLWy
 UbMuHLOAhV1EjYDZ2TMaIQnhRrdIo3BnApDG84R74dvv7w2vpW4mV/tAanBMbqwzPJVHOy4GCqe
 6yst95sZ9y0yXr7GL3uV/WHKY6xJwK0UAm4V8WG7pLKqd2uG7Kr9dpxqo9J38NSa98ecLIvvJb4
 jJIey1QyBNe2BWj7HCLncLfAhIeiKfdLKIr0cJOL4Dr7miZcSd14r56wFj/X2Gv0v0Pl53gZB9y
 TvXKkrncBTeSjd5F7p802becdfdUWiGWBMpB3rifZqAQXJX5U0I3nmalgFU6KneV1Q==
X-Received: by 2002:a5d:670a:0:b0:38b:f44b:8663 with SMTP id
 ffacd0b85a97d-38dc93623b2mr8575658f8f.55.1739222983333; 
 Mon, 10 Feb 2025 13:29:43 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd8dee385sm6091870f8f.61.2025.02.10.13.29.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:29:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/10] target: Set disassemble_info::endian value for
 big-endian targets
Date: Mon, 10 Feb 2025 22:29:22 +0100
Message-ID: <20250210212931.62401-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
References: <20250210212931.62401-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: njWhRPD8yzzF

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field for big-endian targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 target/hppa/cpu.c     | 1 +
 target/m68k/cpu.c     | 1 +
 target/openrisc/cpu.c | 1 +
 target/s390x/cpu.c    | 1 +
 target/sparc/cpu.c    | 1 +
 5 files changed, 5 insertions(+)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 4bb5cff624e..d15f8c9c217 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -150,6 +150,7 @@ static int hppa_cpu_mmu_index(CPUState *cs, bool ifetch)
 static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 {
     info->mach = bfd_mach_hppa20;
+    info->endian = BFD_ENDIAN_BIG;
     info->print_insn = print_insn_hppa;
 }
 
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 5eac4a38c62..ff167aaea71 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -122,6 +122,7 @@ static void m68k_cpu_reset_hold(Object *obj, ResetType type)
 static void m68k_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
     info->print_insn = print_insn_m68k;
+    info->endian = BFD_ENDIAN_BIG;
     info->mach = 0;
 }
 
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index a74fab43a91..33c81928370 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -83,6 +83,7 @@ static int openrisc_cpu_mmu_index(CPUState *cs, bool ifetch)
 
 static void openrisc_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
+    info->endian = BFD_ENDIAN_BIG;
     info->print_insn = print_insn_or1k;
 }
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 3bea014f9ee..972d265478d 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -243,6 +243,7 @@ static void s390_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     info->mach = bfd_mach_s390_64;
     info->cap_arch = CS_ARCH_SYSZ;
+    info->endian = BFD_ENDIAN_BIG;
     info->cap_insn_unit = 2;
     info->cap_insn_split = 6;
 }
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index e3b46137178..9fd222e4c82 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -106,6 +106,7 @@ static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 static void cpu_sparc_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     info->print_insn = print_insn_sparc;
+    info->endian = BFD_ENDIAN_BIG;
 #ifdef TARGET_SPARC64
     info->mach = bfd_mach_sparc_v9b;
 #endif
-- 
2.47.1


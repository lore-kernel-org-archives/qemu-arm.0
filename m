Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1074302njc;
        Mon, 30 Sep 2024 00:35:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjx7mRPvraYiwlW5wRmkhvtGfwrJYZxeJLk8rWSfKDxXSBnM9g4z6JHIOdWGihXXaLlz45uwCZpi0wfA==@linaro.org
X-Received: by 2002:a05:600c:1c04:b0:428:10d7:a4b1 with SMTP id 5b1f17b1804b1-42f58497f61mr84973635e9.25.1727681738183;
        Mon, 30 Sep 2024 00:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727681738; cv=none;
        d=google.com; s=arc-20240605;
        b=MuprqrJgaagfHKsqHNMXVGbGoCW444h94lc5vW3TMh1+jjc3N4lZbdNbkEZx8szJT8
         rWIIxHRNW/jAB9J0SAUDK/9X80bH+IJqWH8Dw/o28JLQb+0OJ/elfo1gvZOoLpZHMBxK
         l1fek86Ws7MNSMJSAEf9i6+V1zSM/TczrDClXoW2kMQYKYsHvg5CtI2oJP3thbFQsJfu
         Kt2CTiDxiddOXv6xamZlh8PcMeFkuKu7NMRhbbQJwa/rmLQIdpjsuIaI38r+Pnp3tfuP
         nhV4ws4RPc0d+91cwrkHBpYgu718mTV59uN26nflsTzRfPZbUYrsypJRFM25tjhONl8D
         UCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=h5V3kOB6PMSOt7GvVRYTAhn4zZrY1jWMSTBtmM5O9vw=;
        fh=rqwgOovZ5OMJjrtHSD+vEw31RpPkiNJuMDm2UU5nfbM=;
        b=Gx5aVW4JY/InK0FQZGTqVGdzG5DdAaptCArO50QCBin0ZEQSXNS/69TAYdgmG18IUS
         OK+okmO1o0K7FDFWl+0CVAPStImvWQ7v8f/SCDdMJkvueXw7pF8rxu6VUq6rr85Fh1Jp
         TxGfkHGMv+XBQdGWjE0yHJVlOWmNyOW6z9lr88/+CrkmmKPFzuf/l1b0/n0uCOFR4AWp
         fgw0HFnj5Bg8/yqw2h5nEHpHo9Lpez1l30WsbBqLG9PjG+fsXs529g0fsWKS10i1qe/r
         uZ/UgmFr1YTwwDpVefW98ceZmO3+YZYcgZ/VgTEnpRnLIv58WFglkfcJM3ym38fvrGUK
         HEMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KhC7fgbS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42f581d00ecsor26163575e9.5.2024.09.30.00.35.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2024 00:35:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KhC7fgbS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681738; x=1728286538; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5V3kOB6PMSOt7GvVRYTAhn4zZrY1jWMSTBtmM5O9vw=;
        b=KhC7fgbSeXpLZq2bvk93H+TZNva4lV+ne6yCKOIxAQ6paZfUD9GaLBIzNb0vH9pT+R
         a//vXv2+9Lx4pQEn69xgOHTMWrsl4jfU5cLFhOb6P6rvsTuvVQLt5XRXUBiY9I4u1c4B
         E3BgaKH3gH8pwe9Dn8AHoEIWIwhixcx4Aj01paNKEE7jIsnGe7MPd33eLARPNet4zQfk
         jI0PHRpdBdzBZ3b0LKD/s0Rqu3FKD7K1DIv6s605rG0/12NOBUMxX4oaZSoEe+RTnReJ
         knWCOA4+7cGSSga18VWlVg11Ws3s8VvIu29tDUow+ISpwiQ2fa1uPJXHOHJo+rr1HsyD
         aDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681738; x=1728286538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5V3kOB6PMSOt7GvVRYTAhn4zZrY1jWMSTBtmM5O9vw=;
        b=bkX6mpLTdM8siMMGFIf5CObMy4RPGpzlBwFo5MCRGwPq2zjxuHkwwtzB+qCdNpJ866
         6OCU3hgK9xghNauQRsF1P/d80lRCogp07GVWZJy6brPuLbQapb5FBn4ytyqjD1Al/2+R
         52dnKzN2XP7c/rGWbSOWPnK7g4q/zqMIDLZO3hWNfeVii6fkYAQuf3R/vyyQjRosJY90
         vDOhGgCA6qG/uJ6gsATvP2DPjlzZRW6r0FYjotQnY84LNq77rq49RjOfdxCJaDK82Evw
         DdA+q3fW/BXoR/EL127Nb4/DHBTh/0I1Qz+fbExZGIXDM1tlRio3QHZYjHXcHZFjdVxt
         nUbA==
X-Forwarded-Encrypted: i=1; AJvYcCVOXBfTg0rUSChIX4+vRipUWT6JXZTGscCe8EBkWkDH7elggp+J0QKmy0+k+oxkFSFnvt0EK9JSsUH22g==@linaro.org
X-Gm-Message-State: AOJu0YwAPkT4U7Cdd0FJdedrQJoLn7m6u/YkepcFSS+Hvc4s3eRT0hBJ
	thGmsLKb4CV28iMrm+qbBNUwttNl4+KkKdaq22GrUs9A0HkiCpY2GgjUQRME7H4odw==
X-Google-Smtp-Source: AGHT+IF9ceLg1Tk+l2rdJmvlOhYmg7G7ZqzHxY0PwujIuYTvs3nnaYA8IbnEtTruWsA0+LWvGrZZRQ==
X-Received: by 2002:a5d:6448:0:b0:37c:d162:8295 with SMTP id ffacd0b85a97d-37cd5aafa24mr6498931f8f.29.1727681737564;
        Mon, 30 Sep 2024 00:35:37 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (186.red-88-28-13.dynamicip.rima-tde.net. [88.28.13.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d331sm8359558f8f.10.2024.09.30.00.35.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Sep 2024 00:35:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Jason Wang <jasowang@redhat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Sven Schnelle <svens@stackframe.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Paul Burton <paulburton@kernel.org>
Subject: [PATCH 05/13] hw/mips: Add cpu_is_bigendian field to BlCpuCfg structure
Date: Mon, 30 Sep 2024 09:34:42 +0200
Message-ID: <20240930073450.33195-6-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930073450.33195-1-philmd@linaro.org>
References: <20240930073450.33195-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zMBp0Q+ciKDK

Add the BlCpuCfg::cpu_is_bigendian field, initialize it in
machine code. Bootloader API use the ld/st_endian_p() to
dispatch to target endianness.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/mips/bootloader.h |  1 +
 hw/mips/bootloader.c         | 10 +++++-----
 hw/mips/boston.c             |  2 +-
 hw/mips/fuloong2e.c          |  2 +-
 hw/mips/malta.c              |  2 +-
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/hw/mips/bootloader.h b/include/hw/mips/bootloader.h
index 744eb11d0e..ef778a38d0 100644
--- a/include/hw/mips/bootloader.h
+++ b/include/hw/mips/bootloader.h
@@ -13,6 +13,7 @@
 #include "exec/target_long.h"
 
 typedef struct bl_cpu_cfg {
+    bool cpu_is_bigendian;
 } BlCpuCfg;
 
 void bl_gen_jump_to(const BlCpuCfg *cfg, void **p, target_ulong jump_addr);
diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index ee1a1c4f20..258cc5d8c8 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -58,9 +58,9 @@ static void st_nm32_p(const BlCpuCfg *cfg, void **ptr, uint32_t insn)
 {
     uint16_t *p = *ptr;
 
-    stw_p(p, insn >> 16);
+    stw_endian_p(cfg->cpu_is_bigendian, p, insn >> 16);
     p++;
-    stw_p(p, insn >> 0);
+    stw_endian_p(cfg->cpu_is_bigendian, p, insn >> 0);
     p++;
 
     *ptr = p;
@@ -74,7 +74,7 @@ static void bl_gen_nop(const BlCpuCfg *cfg, void **ptr)
     } else {
         uint32_t *p = *ptr;
 
-        stl_p(p, 0);
+        stl_endian_p(cfg->cpu_is_bigendian, p, 0);
         p++;
         *ptr = p;
     }
@@ -95,7 +95,7 @@ static void bl_gen_r_type(const BlCpuCfg *cfg,
     insn = deposit32(insn, 6, 5, shift);
     insn = deposit32(insn, 0, 6, funct);
 
-    stl_p(p, insn);
+    stl_endian_p(cfg->cpu_is_bigendian, p, insn);
     p++;
 
     *ptr = p;
@@ -113,7 +113,7 @@ static void bl_gen_i_type(const BlCpuCfg *cfg,
     insn = deposit32(insn, 16, 5, rt);
     insn = deposit32(insn, 0, 16, imm);
 
-    stl_p(p, insn);
+    stl_endian_p(cfg->cpu_is_bigendian, p, insn);
     p++;
 
     *ptr = p;
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 8e210876e1..d4dd242d0d 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -325,7 +325,7 @@ type_init(boston_register_types)
 
 static void gen_firmware(void *p, hwaddr kernel_entry, hwaddr fdt_addr)
 {
-    const BlCpuCfg bl_cfg = { };
+    const BlCpuCfg bl_cfg = { .cpu_is_bigendian = TARGET_BIG_ENDIAN };
     uint64_t regaddr;
 
     /* Move CM GCRs */
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index a989637d3b..4fe5108845 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -165,7 +165,7 @@ static uint64_t load_kernel(MIPSCPU *cpu)
 static void write_bootloader(CPUMIPSState *env, uint8_t *base,
                              uint64_t kernel_addr)
 {
-    const BlCpuCfg bl_cfg = { };
+    const BlCpuCfg bl_cfg = { .cpu_is_bigendian = false };
     uint32_t *p;
 
     /* Small bootloader */
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index fc485cc884..6e73c896ff 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -624,7 +624,7 @@ static void bl_setup_gt64120_jump_kernel(void **p, uint64_t run_addr,
     static const char pci_pins_cfg[PCI_NUM_PINS] = {
         10, 10, 11, 11 /* PIIX IRQRC[A:D] */
     };
-    const BlCpuCfg bl_cfg = { };
+    const BlCpuCfg bl_cfg = { .cpu_is_bigendian = TARGET_BIG_ENDIAN };
 
     /* Bus endianness is always reversed */
 #if TARGET_BIG_ENDIAN
-- 
2.45.2

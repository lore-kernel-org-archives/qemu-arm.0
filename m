Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2250876njb;
        Mon, 10 Feb 2025 14:19:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVSLTm2g57VjosJShTL9yybm/nhhOc4s+UPoWC/694jjyD02DKOv3B6x0roxYsqV7hZXtpoSKjtOJ6RYw==@linaro.org
X-Google-Smtp-Source: AGHT+IHfUMHbtGZ7Ztabpyq64AfSqlPhUWMp342MCiBw+Cs+1+z+bdI/1+WWEFC2TMIXePSmoJOD
X-Received: by 2002:a05:620a:248b:b0:7c0:69c8:9015 with SMTP id af79cd13be357-7c069c89278mr62347185a.9.1739225946359;
        Mon, 10 Feb 2025 14:19:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739225946; cv=none;
        d=google.com; s=arc-20240605;
        b=JXVoz3poQ4Zi2Y9dIfm1OQI5icwD2JF8ZSJBr3jFZHI/RWR74cG/pCS0Ocu+T+up+S
         BCjoKqPgKzmrP2rZqhY6RHfgMW4+jvNU9jDRUbp5lua+NTD3SddxrFuOjQry0pItAqHd
         eCk+v2P8VcsUTkDcefBS0eH5RkVI2sMuxxaXcCEjHB1J9ogRijqJrRjSzCZ4o9WX4n4w
         FtH1I5wMmojL6zvTXzU7fhM1LfIvpgs2skGj9UQYuSrlpLIqccyM3iQpkq+vzKsbr6BK
         SjF5qCgpfThxjXH7d7VClaHNdwq9f28PuiEmOFKPti15au0+gbViBhIRfxnnPJAuDGBj
         FsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wvSW0yNHAxQVpap9+gIBQOievXbQcesYepvpw1E/5Ok=;
        fh=8eZE9O6zB5obSp64GpmTPWSvIqfW4EeltUV+xelWCpg=;
        b=iJ13J6saO6ArOQL4ltCHgNZbg8wgJgIUYCLhZVuSFkAf2KE4xAeI8BLlzkTToxHcz6
         BLlTWn0l+/xiwFSGWzb5RcaTmo3dVEtHCSn8lg12A4JsdyLjETY7AjMEPgQd/IB95zsW
         Sw+uG7sgzyjTU3Fw614DNBIlzE60Q+QCfc0UdGYnUKFqb69xAk6+fFU50MhEmfo+dNtU
         DjM7nFxbnOoFss/ruWv1KdkBKFVM8JVoswiFhaWtDnd1x0V4jVQYrKXz0+8Joiuxt5Ws
         U4DAGdw6mN3/SprGlfX/oXoBkRMdbXYoeKEG5dpt3J795xJ9jbdH5kMBksMZsJQVdLIV
         rZhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zitY9Z4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c05e43fe65si296754585a.103.2025.02.10.14.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 14:19:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zitY9Z4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thc7L-0001qv-2V; Mon, 10 Feb 2025 17:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc74-0001fW-Sp
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:18:49 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc72-0002nu-OQ
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:18:46 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4394a823036so8616505e9.0
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 14:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225923; x=1739830723; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wvSW0yNHAxQVpap9+gIBQOievXbQcesYepvpw1E/5Ok=;
 b=zitY9Z4vgqakOenHzwsYRi0PSf9oOxu+gJ0Yux1qI8uqcf1QBEKB2T7FNLDybz/cBs
 NCxG4MLlfQZA1udRgYil2xrDXWv6iaAH5hdRk2+1zVDb/dGE8zVXsmaje5dA8p6C8GEB
 Alt/99YfGNVYXbvCXQBwsd2BKteZfR8yP0LytRRxwAwBMg8F1KPS5SxkmKGXYiLA5DXI
 ULTU96fI2sRi7LpfZ0ihBC47PRGyNapDbyp0aWGlKC7bgTdG8Ah4Zgv39kx8jpUJ/xHZ
 9W5C4FMVICvwS5PL9VX4mH1WM7N+yIsb6KuvWDHcjOxYMGIpBGlZdRB22+qIezwm3xxN
 e0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225923; x=1739830723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wvSW0yNHAxQVpap9+gIBQOievXbQcesYepvpw1E/5Ok=;
 b=HBKqQWCxveiPo1U2EsU91ZAdSQOy0kBGa8IWu6CGt2yvHqJ8WaEIH1buufeZbBlg2k
 2KIHDd1lJR0/qkJJg4R3nYBRDR71iDqegSBs5mlh1BlCzxXRw7Q6ld2rqpslSpqGKOiY
 S6G1WZuCMXZ9KQ66dvaqZBrCp4fq70R84JJApGjSAnhKfpjAuNnGBP54KJvWgd9wRAeU
 0wMHudLHFzbE3+Jpl4i5FP0RUvX+7p+Wxuh85NJs8WajOunkst3DYnYGWAtSox/btTVp
 Ic3QuAi6s8pXI/AoLVgmeXbqFnena4UMv5LWpf5jTQpNrL5JKEgjJm7whuTK6ag2IWOi
 1Wpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8jfEZ/gAK5nfNoU6rawwAkJrSQ7D1G9ClZNaTp0d7VRnjUUvLZPPq6Muy+CcWqzsUszVjQszhvg==@nongnu.org
X-Gm-Message-State: AOJu0YwsuXDRMDjmxt3VZANpYrAK6jSqPrGomavGLO/Q0eslK7trdcZ0
 YLOt6abMvpy9nOGYz2MyLM0/v9IG09CcL66fDbWSjH5mnIrxMuCNR/iqUK2A+mU=
X-Gm-Gg: ASbGncvRXfYRRYTtkl5PDJXOVH8KZl3U4yLjNhrC1Ev/uNPC0T+BVy4VxddxVvgX8FT
 p495XMqla2m39wzw5FEeH5gHGzvqG9H99qDtvk6qcRbUwEcNAAsMX6tKPc8YLIjdk2nzOlWSqGV
 gZ3KYP0kjVjteHQEs8RwYLsLStHtdwreIk0hj9Rogc4IzS1A6PbMw8gHzjJK9XHoYMCSIF+x9FD
 hwokHaoKVnRlobPKOsSHRST6lC7MOFyB73X89wNKreZHkFRksLAty1hnRUlJEMqcVhP93Q+Q1RS
 IO9R7JLS3z+tteTzzYvuap24b++EyBIvD9pz0f7czgFrwTpE4QWfLAqtJr+s1d85NA==
X-Received: by 2002:a05:6000:1888:b0:38d:e48b:1783 with SMTP id
 ffacd0b85a97d-38de48b18b7mr435718f8f.42.1739225922713; 
 Mon, 10 Feb 2025 14:18:42 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439463d17a1sm35990265e9.21.2025.02.10.14.18.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 14:18:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 02/10] target: Set disassemble_info::endian value for
 big-endian targets
Date: Mon, 10 Feb 2025 23:18:22 +0100
Message-ID: <20250210221830.69129-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210221830.69129-1-philmd@linaro.org>
References: <20250210221830.69129-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: UeIpUHVExoXt

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field for big-endian targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


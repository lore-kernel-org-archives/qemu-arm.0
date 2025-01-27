Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2378135njk;
        Mon, 27 Jan 2025 03:55:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVONZ0Z13/p+huf2y7nydqO+yH9fJ/bIVvYuoblCyhj+KYmvXuUJZiO6HDsT5mjaec2Au+CoyM/4UF3PA==@linaro.org
X-Google-Smtp-Source: AGHT+IE8Gp3ZjlOcIso5nQxkji7hrS3M769IFxbCgoJCKkOoJUd3wkOfQ2mcvNfip3lX5RGo0Uug
X-Received: by 2002:a05:622a:15d3:b0:46c:82dd:9a71 with SMTP id d75a77b69052e-46e12a85b22mr582343281cf.25.1737978900606;
        Mon, 27 Jan 2025 03:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737978900; cv=none;
        d=google.com; s=arc-20240605;
        b=ZR4WcJUhYU5sOSKV8tXcCP8HwJzdt+9CnO+KDk2QJR3kycYKUXmsD2Mp6cX1mHFe2U
         nDn1fPvQOt0IRmWvLA5Oh3i+6oWElF9X0X/XtV5Ts7IJIsR4QDvHQhkfcjnreZSTzFt+
         o9atP8wVe/EWpgZm2Dd3MAf462Z+pVSbLX7UkV7bClz2fQQ7n4sM9ucrg+n/JdcOjA6j
         ilHK7QE65+ImfO3jCOLw0rLmXx4BdIbiFnmeW6I7I62ZcTUD0QK7dVS4iBoudpZoAnSH
         f2S6klmZgx5zClfxMCNCI/mexL0KdkjiHu+VzFM9Yq/5yTWV0yQT201Vfk65bIxfShzK
         YrhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=H4U+Bby0D2aGRLyzE2lLHHXc/1St8N4BxVIFjrIyGIc=;
        fh=UT36gCECAOtEsgOrSReymFda56t2Gj969DHeMwsi3As=;
        b=cIEGoc2TBIUzwoKG9J4f7SJqH5VyhMAxzByvPbYg4O+zR0W/DorWxBif2L7OmjX7wU
         SuXJyIOaX6GFOzbS4FUlgLmUjlDgS2w+5DfMXHXjPHqwcp7CWWfmS77sMmuaVYeFUt5A
         0OGxnoSqvvy1AnCr3v5swtWakoVN9sdhetqZKBKVhOlb+hYDAxM0C9A2wOopV/LZzFvP
         jJpI+2k8DEx9XAASA4COs647NEgfuc9L7tq+fb0NBAv8vOj/LIvEcfhY0NU4J0JqPnH9
         WPDSlAjfvQapzcXl4ZnefXzZS32sbIYUZeK/I6ixngYtCWuG4mpJUt0RTAKJoOEWUw+W
         K7dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rp0YXDrj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e6688a308si104876821cf.194.2025.01.27.03.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 03:55:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rp0YXDrj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcNhT-0006Np-CX; Mon, 27 Jan 2025 06:54:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhR-0006ND-NX
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:54:41 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhP-0006qt-MX
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:54:41 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso27334365e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 03:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737978878; x=1738583678; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H4U+Bby0D2aGRLyzE2lLHHXc/1St8N4BxVIFjrIyGIc=;
 b=rp0YXDrjA195qfunesIyzkSDjlV+dPgW5A77jn+DhpWGEidDti9y8XxEKq/jjORms+
 HzKRTRxG0j4/WMatn+qg6eIjv9xlxIur9x481eiMYJQmWPQzn1SRgVBgTNYOsTWwzy4T
 Dn3etz7MxWRHHueHOeou3fKrlYTcO9nvE80GpgqDyX868O0lJMdihNv8MQxCLvJVoj4w
 r802cQo4namWeQmim6z7yYdza9zWoTu/4XTEtosC5OrUvGSOpwJc1CYWLqhgO5sbW4bA
 9pNW+BPwYolWgLDohegdKTmwOOmYqWlXH0LKUqMrjAMaMK07mtqSu2iTcoakqNP5q9dk
 Biqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737978878; x=1738583678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H4U+Bby0D2aGRLyzE2lLHHXc/1St8N4BxVIFjrIyGIc=;
 b=sVYIaakwI/Lh7EFclnGZLt93ElposO9ZlMtV5biDxUsCv7E5TDPK2rsE7vrb9iOBQM
 pYcgB3g/U/ONzV9Mo2myIj63oa//smlHwcaaaDtadPUQ6RoYYd+kYz5xtNRjGtylPo5B
 gf74O9Jrelivngwi1OMdAQChZ4GYbx+EHJCSiaj2M9idqHfgeuE9zrfKIHcTjZUjN6tM
 tlMcljQ7spXHVV7b/y+7tCvozbiiVeoyziYlme0jCH0b4Hjp1BdPqiJ1SXQAjyUQB5lm
 pDrR6+a/5HjM0CRAcW8Pfdev86ZmKGBpYp8ZIaucW/J7wwxhQkp54kEJmi+VXrLyaesU
 +9Jg==
X-Gm-Message-State: AOJu0Yzbv2AeppKFYJdGgtUjpbyG0zO412UOuyarJumsswEyAXE5nYrs
 K74M7RdXyD+9HJ6IqDo2+QYQeaX3MRb2vZv1K/q71y0Rive20vYrOuvcYjgQXt0=
X-Gm-Gg: ASbGncu+0yutY0mkPs1oaFNS3Z67EHXKE4KAV1Qz1YVxyzJu+YkF4dnI85c8a+F1gLR
 tOSpc9EPEMrV2jwY8pv+J9uUStS/SoYCVEh3xENoALFiIhoelqwmqPWiGTaSjVUjaV+UoL4UYJF
 hDNYLKNYgkuykSmtl4Y3xaMENgu/4F8p5gefkRAyGc4yk97Cmjwo1ZvYW7XzND1yd5RCay1gYTa
 xE8i8WYfQSuPe4lv8aV//BpR1xL1y6KPovqlJ77CatoIOs6MlusUHRKfkaIeSH6O2b08ABjKImn
 vulxaIk3jRGtb0e6H8MZELPOa3K5koncIW5Qm09/zI89BLw0vzXsPCs=
X-Received: by 2002:a05:600c:6d46:b0:434:92f8:54a8 with SMTP id
 5b1f17b1804b1-438bcfd440dmr102138005e9.0.1737978878022; 
 Mon, 27 Jan 2025 03:54:38 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd54c098sm131475935e9.31.2025.01.27.03.54.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:54:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/10] target: Set disassemble_info::endian value for
 big-endian targets
Date: Mon, 27 Jan 2025 12:54:18 +0100
Message-ID: <20250127115426.51355-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127115426.51355-1-philmd@linaro.org>
References: <20250127115426.51355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: A4ueeKrGnyLK

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field for big-endian targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hppa/cpu.c     | 1 +
 target/m68k/cpu.c     | 1 +
 target/openrisc/cpu.c | 1 +
 target/s390x/cpu.c    | 1 +
 target/sparc/cpu.c    | 1 +
 5 files changed, 5 insertions(+)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index f2441d4d7fb..1bc5cd746ec 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -144,6 +144,7 @@ static int hppa_cpu_mmu_index(CPUState *cs, bool ifetch)
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
index 0669ba2fd10..b81179bbbaa 100644
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


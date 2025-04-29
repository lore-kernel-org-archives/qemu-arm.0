Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp22990njm;
        Mon, 28 Apr 2025 22:00:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXM7xQ6D65DTPtpDe8AxppKF8E2oKD2hVaoRsqswOK2TgfjsEuSM3WcEqbs5N+TAk4vmbGrexRSoepEdA==@linaro.org
X-Received: by 2002:a17:902:ec89:b0:224:1ef:1e00 with SMTP id d9443c01a7336-22dc6a0495cmr182563375ad.19.1745902824885;
        Mon, 28 Apr 2025 22:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745902824; cv=none;
        d=google.com; s=arc-20240605;
        b=M97/3w7V6mve1hCbgnJIaIjyObIETu0K20xu+yFh6Z7HnpA+zr3qgORnvy1qpmxBFd
         RFI+8yK+iUI07Jeu5W8Ndan3tKEMnO/+rK+euy2Y8ZFmB87TQagbx2XUmxD5ZX460Kzc
         vFa8moSD6OXtmibUVf+Q4y5tc+7Hw4R6lEmBNHQXL8aPOJuD/SJOkwCX8RnrN5wl5lEP
         oydUtk4xETrm5p5axhBs35IA96bqIivHiSaAHQs7u4COrhZ1u1r/o6FsiyX1XAJzWGGN
         GCrsFzE7BGEICPtTPDeVUQRjl119lPWOvdh+c9vOhSZHs0zgd/RQW34V/V8wVwm5/GH9
         iKNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oGLga5UEOZhK97fJQViOQTJRGL03WkVBEBC/7bd6T1M=;
        fh=LbraNwnew3xQXgOTeeAPY0eDcjlu09otQqHN9EU+ktQ=;
        b=hdgwHS5vW9IkKlSQN/GV1uXAIb2ISJ1twNiJg1hwWns6aXAQsVPXA0MPdQ7F5G2Drz
         2WXlUquSpl5wwhGy5uVtypJvMD5dzACtsmxqoIk8TTWLvYCN8G7pUwro/9q4H0pxaH0Q
         C4f63DfQtrO8VmUs3L4ZdTDGCXk84c3oZ03EWe5lObpRyieegKdH9mZpicMPE5kD+sbo
         f7+3JFqvlZi+qqmANii1d//xOGRMDvJ5y28Y84rWLtiuOyomOeXAnYTjO8WU57dhYRdv
         sQicH2xtRocKkbl+CqJBk6peO7gEf9z3NNzzNeeXpMrQ2guNolo0aCSlsm7nJdH6Zd6L
         lfdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UuIqZ3f1;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db510aafdsor98846545ad.15.2025.04.28.22.00.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 22:00:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UuIqZ3f1;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902824; x=1746507624; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGLga5UEOZhK97fJQViOQTJRGL03WkVBEBC/7bd6T1M=;
        b=UuIqZ3f142maG9K6e66/YgFWvsRzoFDDJxS0SpHd614NmJTmcqjSckhNQlN4RbcJUd
         APKynG0A6Me6gG/NE6HPWh0uPoPPGWUL4bsoROloDx6WRQzgA99I9en9Uzsg1Gp81pp1
         wgAC9/QrwR7CJBpl042UUhVNZR1yE5HxjOWTFpBAsRloAOjdJerxdebWbSI5PlXD+aZM
         +5hOj01i5kKQk50CZxNY+lZP/EKK4Lfa0a77YucIAXX1+mhpAfRtIdADGjTzOBkSEr6Q
         XQNBsE1Kt7jf49cbEWtpX3jb4Wuv3ML8ebf2F/zXanL+ZeQgsolGpLHph0omKoUUCf7a
         lpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902824; x=1746507624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGLga5UEOZhK97fJQViOQTJRGL03WkVBEBC/7bd6T1M=;
        b=cWlER+wtvWu3Gq+jCbaMVq+eWAO56NUhWFjOLsaq9rFdjhfMXm0Yff3c+75JlmEK2W
         x+Ur6tsHKfAyyDepNW3L3IY2UMKNKeq/buim3DyrP+8+RqWR66j4eUqcxXm1rx3u4MzS
         7B6yfKRHGOPLMuJh0jRir1ek1u/4SCY9LH7FijRmQa+2FTUmNlE6XFJ2odx4Jed/Yu0H
         DWAXg6z66PgfPRBjGBsJMsG65G2lJL+EncgiTNPoMEQlmOyhO8z+PCD1h983ktkmHjW5
         9YEIdQRn+ztm9bjOMgY4UHe55WyiGVs7KF1o8y3qgBtPhVpOuxvVfwEKFjb9Txl4QmMT
         CDsA==
X-Forwarded-Encrypted: i=1; AJvYcCWUNb8+p66I/Uaw5lO7yO7WK2CXbWXLLV04SibgSkfudCYKaXLE+81YxpR+p13FkhdLlD3gZS5uQ9fjIw==@linaro.org
X-Gm-Message-State: AOJu0YxEthfkhf55x3FwndqnU8dXhxCJx5Ow8JA3JBzcgC4MXcIPUCUl
	wGTuVQcocsYDrhK2on/Pj2TrTnKkcuxXcuAwVJTxo3RUGrPASaGSj1WfVocK9Ob8wg==
X-Gm-Gg: ASbGncsiuBHbRG/9flcHllnI3u/tebwDmS9hbybcRlSkBYvCkA6OxsFrVTY3DOrsRnc
	jtbMr6o+iuDrGwaoizFwgRGzEve4Cf6faxDPdnOZ5UAdhSqEnJWi3XGQxz6VQq9mBIa2POrHN1X
	CjP1w5fqnPArgdsvrYMBS03lqox0qszj4BaK0tpllmkBoH7Kl3/eE5sYda8MXHD2Zfz5YUhqXFQ
	9n4KCnLcRVlqGmyYgVu6jKNarMY+PM95r7sIZBAGoCfcZSrF6X9Fb8VQrDakt/LxG3AEu6TWLNT
	EyZBnMoaNmee2s/vpLXF5JNUiETVtXLyd+y2xwe0
X-Google-Smtp-Source: AGHT+IFyx8N8uA4PzRLCM0NcJk2OWep5SdanjS9wPYwbq+EMM4JH4KwnmPdpBJL4WqQPXBMcgSf+qg==
X-Received: by 2002:a17:902:e5cd:b0:21f:71b4:d2aa with SMTP id d9443c01a7336-22dc69f83d4mr156777235ad.5.1745902824466;
        Mon, 28 Apr 2025 22:00:24 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm93004015ad.76.2025.04.28.22.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:00:23 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	richard.henderson@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 09/13] target/arm/cpu: get endianness from cpu state
Date: Mon, 28 Apr 2025 22:00:06 -0700
Message-ID: <20250429050010.971128-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: maQbrpQFucPO

Remove TARGET_BIG_ENDIAN dependency.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e7a15ade8b4..85e886944f6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -67,6 +67,15 @@ static void arm_cpu_set_pc(CPUState *cs, vaddr value)
     }
 }
 
+static bool arm_cpu_is_big_endian(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    cpu_synchronize_state(cs);
+    return arm_cpu_data_is_big_endian(env);
+}
+
 static vaddr arm_cpu_get_pc(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -1130,15 +1139,6 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
 #endif
 }
 
-static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    cpu_synchronize_state(cs);
-    return arm_cpu_data_is_big_endian(env);
-}
-
 #ifdef CONFIG_TCG
 bool arm_cpu_exec_halt(CPUState *cs)
 {
@@ -1203,7 +1203,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 
     info->endian = BFD_ENDIAN_LITTLE;
     if (bswap_code(sctlr_b)) {
-        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
+        info->endian = arm_cpu_is_big_endian(cpu) ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
     }
     info->flags &= ~INSN_ARM_BE32;
 #ifndef CONFIG_USER_ONLY
@@ -2681,7 +2681,7 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
     .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
     .write_elf64_note = arm_cpu_write_elf64_note,
-    .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
+    .virtio_is_big_endian = arm_cpu_is_big_endian,
     .legacy_vmsd = &vmstate_arm_cpu,
 };
 #endif
-- 
2.47.2

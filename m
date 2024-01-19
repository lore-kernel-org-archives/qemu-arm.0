Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp881139ejg;
        Fri, 19 Jan 2024 03:42:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG69IP9kBdJxzg1ViXiE2vBGyUiHWV4EBAQTB2FP+yRbHQY+9b6fDxepF8lK1zybfI87eYt
X-Received: by 2002:a05:620a:4548:b0:783:3f25:c6f3 with SMTP id u8-20020a05620a454800b007833f25c6f3mr1403974qkp.47.1705664547895;
        Fri, 19 Jan 2024 03:42:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664547; cv=none;
        d=google.com; s=arc-20160816;
        b=y2GvMj9huvxcjFY3d8cDKSxQMQ/7a+YqwKw+m+4bm+BfYGYsyBu4/58ACoRqRlqd8c
         fnO6o1PiJzNyigOuvWt2L14ewkoPjPJamVtXa2y110y4ldG8UwDYH/lZsvPcZR4UYsQS
         M089eI1OhzBiDXaWr7Z9cRkHV67k/X+cdgKfJkf+za5WslKVStz0HFsfAkW13niJnIUD
         WW9GdvWs5TjrptUcmVcploNXkJTo/zj/+XABhtJScnNkIPnHvMwfeLN/F7E+Dj0Qpsl+
         fQlGAY5i8auFFRC+pZArH6btOXNAU69BFVPQl5kogN9MUBU8B7CFefKZfB4rA1y58dfa
         Ou3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SZyaevqz+BXyv3cNgww9mIqrqdn3HHupjjYERjA5ZHo=;
        fh=2EbE8WjaLVa53Sj7ZDsxqgEqspxq22HPHyVjpmlNACU=;
        b=hQDS+Qciiq5KMqI0g8HA++IXeY93shXDhZOdq6MMUbQGS627xTuyorluneo5/DKf7X
         NZebgp1oF+V+C+HwBmOGmLp1nkHys1qFzHkydk5CpU9MC22MYbWcYaD2PNMxpuIJbvPV
         TLml7oPjG+TPWYfsGCegdtIGsVxmlsZkmYqVLQGqaFAK8gECHWrm8x9pXlJbWRJh0Fgo
         pp0mn4WeNZJYGIvSavRvk2J7Rn4dv/xu6Kn2DqC58fZdAy/N7zlHHSsHT0mKoX/41i0Z
         SP6L0eCfGsuWWUPWGBVOdhNjqqOFklOi4Wok7yvlgzrtqO9QEpOV4vF1VAf4bMipBB6F
         aQ0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PzjBfl7J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14-20020a05620a0cce00b007833eba5119si15576212qkj.697.2024.01.19.03.42.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:42:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PzjBfl7J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnAQ-0002YG-Lz; Fri, 19 Jan 2024 06:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAN-0002Ok-Fz
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:36:07 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAK-0001Xu-G3
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:36:07 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-337d6d7fbd5so809806f8f.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664163; x=1706268963; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZyaevqz+BXyv3cNgww9mIqrqdn3HHupjjYERjA5ZHo=;
 b=PzjBfl7JgPrdR2nlF8LJhLzmOV5m3ibMjDKnxC4aqNfDvuqb1x0jt1eIv3Z8IWSD7A
 hoyWNknS34fz7r/LL6+pi1AbIZ/vjHkgfGL0VCvah5IFYJcHMNY6gHIHHV8rsej9ss69
 rfGXP+EVX2+3jwE0p6ZLoOFCaSNkhQe2vkQZ2VkY5dNcUFAqkY8Raz47RVXqp7mL+Tl9
 SRiE7h2ldMxqImmeWkD4j7iUGqDkmjnN80Fp4+j0iXJeq4/HicDrPzzp5ciMsrP+giBK
 BZJwS9+TmYoojczEmnDKwLSgY8X+5bZikk3yt1lqoU2yk+222qjem+cyQbedaMiAdAOP
 g82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664163; x=1706268963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZyaevqz+BXyv3cNgww9mIqrqdn3HHupjjYERjA5ZHo=;
 b=YvZmpMrXp1Ucqi8j6mZiUF9ZHaLTNtws/iQEgR2dsY8qyQLue3FWPX7DAo/D8dQAue
 5RqexNgS5C02rTyYicCIjCnHENCcWi5nha3eS47jv/uypFU7fkUFS/1aV80aaozQTKRk
 9J7M8pHaxOikjvaWVHcZcO6Au6zdw0NIcHYhcKSPerc3fHETminRkMkRjHsHBVSQ+Ubq
 dcvIOVbdFUKR6fFwv8+xZRc7drKPL8aXg4fk4Eh2sLNaS0zwbjY5kpeZ+bMx/e9OPrZP
 +C9b6J+u5YOQEfULTlZs5NmK7zfYJQ9pgn4hCecSuh7umur7ruXpN+jCBXtFzKtKh8Tc
 wXew==
X-Gm-Message-State: AOJu0Yz6tvYpT44O5haULhjZYCcYC1s1RE9wbKKqDA3HsPMtQYwvcEK2
 RBzAw0ZMxlzIPzRVp6RyqN85Vb4VDdgiqtiJ+DL+SnwJ6V8OpVtn40ewJEcdmFI=
X-Received: by 2002:a7b:c3d7:0:b0:40e:59e9:98d0 with SMTP id
 t23-20020a7bc3d7000000b0040e59e998d0mr583577wmj.154.1705664162785; 
 Fri, 19 Jan 2024 03:36:02 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 hg14-20020a05600c538e00b0040e5cf9a6c7sm29071140wmb.13.2024.01.19.03.36.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:36:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/36] system/cpu-timers: Introduce ICountMode enumerator
Date: Fri, 19 Jan 2024 12:34:41 +0100
Message-ID: <20240119113507.31951-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 6aCjNxoaoBxD

Rather than having to lookup for what the 0, 1, 2, ...
icount values are, use a enum definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231208113529.74067-4-philmd@linaro.org>
---
 include/sysemu/cpu-timers.h | 20 +++++++++++++-------
 accel/tcg/icount-common.c   | 16 +++++++---------
 stubs/icount.c              |  2 +-
 system/cpu-timers.c         |  2 +-
 target/arm/helper.c         |  3 ++-
 5 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/include/sysemu/cpu-timers.h b/include/sysemu/cpu-timers.h
index b70dc7692d..3f05f29b10 100644
--- a/include/sysemu/cpu-timers.h
+++ b/include/sysemu/cpu-timers.h
@@ -17,18 +17,24 @@ void cpu_timers_init(void);
 
 /* icount - Instruction Counter API */
 
-/*
- * icount enablement state:
+/**
+ * ICountMode: icount enablement state:
  *
- * 0 = Disabled - Do not count executed instructions.
- * 1 = Enabled - Fixed conversion of insn to ns via "shift" option
- * 2 = Enabled - Runtime adaptive algorithm to compute shift
+ * @ICOUNT_DISABLED: Disabled - Do not count executed instructions.
+ * @ICOUNT_PRECISE: Enabled - Fixed conversion of insn to ns via "shift" option
+ * @ICOUNT_ADAPTATIVE: Enabled - Runtime adaptive algorithm to compute shift
  */
+typedef enum {
+    ICOUNT_DISABLED = 0,
+    ICOUNT_PRECISE,
+    ICOUNT_ADAPTATIVE,
+} ICountMode;
+
 #ifdef CONFIG_TCG
-extern int use_icount;
+extern ICountMode use_icount;
 #define icount_enabled() (use_icount)
 #else
-#define icount_enabled() 0
+#define icount_enabled() ICOUNT_DISABLED
 #endif
 
 /*
diff --git a/accel/tcg/icount-common.c b/accel/tcg/icount-common.c
index dc69d6a4c6..f0f8fc7f1c 100644
--- a/accel/tcg/icount-common.c
+++ b/accel/tcg/icount-common.c
@@ -49,21 +49,19 @@ static bool icount_sleep = true;
 /* Arbitrarily pick 1MIPS as the minimum allowable speed.  */
 #define MAX_ICOUNT_SHIFT 10
 
-/*
- * 0 = Do not count executed instructions.
- * 1 = Fixed conversion of insn to ns via "shift" option
- * 2 = Runtime adaptive algorithm to compute shift
- */
-int use_icount;
+/* Do not count executed instructions */
+ICountMode use_icount = ICOUNT_DISABLED;
 
 static void icount_enable_precise(void)
 {
-    use_icount = 1;
+    /* Fixed conversion of insn to ns via "shift" option */
+    use_icount = ICOUNT_PRECISE;
 }
 
 static void icount_enable_adaptive(void)
 {
-    use_icount = 2;
+    /* Runtime adaptive algorithm to compute shift */
+    use_icount = ICOUNT_ADAPTATIVE;
 }
 
 /*
@@ -256,7 +254,7 @@ static void icount_warp_rt(void)
         int64_t warp_delta;
 
         warp_delta = clock - timers_state.vm_clock_warp_start;
-        if (icount_enabled() == 2) {
+        if (icount_enabled() == ICOUNT_ADAPTATIVE) {
             /*
              * In adaptive mode, do not let QEMU_CLOCK_VIRTUAL run too far
              * ahead of real time (it might already be ahead so careful not
diff --git a/stubs/icount.c b/stubs/icount.c
index 85c381a0ea..c2c10dfb6b 100644
--- a/stubs/icount.c
+++ b/stubs/icount.c
@@ -4,7 +4,7 @@
 
 /* icount - Instruction Counter API */
 
-int use_icount;
+ICountMode use_icount = ICOUNT_DISABLED;
 
 void icount_update(CPUState *cpu)
 {
diff --git a/system/cpu-timers.c b/system/cpu-timers.c
index bdf3a41dcb..0b31c9a1b6 100644
--- a/system/cpu-timers.c
+++ b/system/cpu-timers.c
@@ -154,7 +154,7 @@ static bool adjust_timers_state_needed(void *opaque)
 
 static bool icount_shift_state_needed(void *opaque)
 {
-    return icount_enabled() == 2;
+    return icount_enabled() == ICOUNT_ADAPTATIVE;
 }
 
 /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index dc8f14f433..49665bb763 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -948,7 +948,8 @@ static int64_t cycles_ns_per(uint64_t cycles)
 
 static bool instructions_supported(CPUARMState *env)
 {
-    return icount_enabled() == 1; /* Precise instruction counting */
+    /* Precise instruction counting */
+    return icount_enabled() == ICOUNT_PRECISE;
 }
 
 static uint64_t instructions_get_count(CPUARMState *env)
-- 
2.41.0


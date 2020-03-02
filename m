Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2711340lfg;
        Mon, 2 Mar 2020 09:58:52 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtd8XI5K8kGEa53xBoHFU9skqlRCxVEmOFdbvITqQP3xIkdSS0+nbSaVw976fSwJS12+D4X
X-Received: by 2002:a05:620a:845:: with SMTP id u5mr394036qku.399.1583171932156;
        Mon, 02 Mar 2020 09:58:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583171932; cv=none;
        d=google.com; s=arc-20160816;
        b=QE3Kmim8zZtxtWTbSP1nnD9akltbP2uT5kV31p/4GXYxNuJjGiFLpfjjZ3P7sRNKAb
         QzHFuxnpBugmQhcT24uj0UNlMJnDPaRKxFUI5X5stXqHOhSNpPuFj7OT7sKBP5lRHg3w
         iMMzbQIETolV3TyeBJeTrOvQ55tAdRQ0cTvlElnZlaqEXgxDcxiEmpB/yYTRW5l+fCRp
         gSl+zyPw/Y1sWvxFe2KL/acjL0Rq4Eu1ZfqW4CuD7+enE3YN4J1QPDP2DKknYgCVK4Oy
         2nKAxQOqfqNUb5FVUiZS9msnveo+aR+plZ09vt5lf2HxZ8nlHNUA72WkAerSB3MowRHR
         Wedw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nnZb8apL5HPwafrnPocDxPavn/5fOqQOkEGFTZ+nDV0=;
        b=gf6O/M7hSUeaRIn1YdKBoGI28YIWL5ruex0pa8CrsS3D7aZtR9ULjikAowwdRudTq2
         whXJwwKhaRNn84Dwbf+UIsHJv/2beyH3euSPum2zL/0xvxdv/P0vdgHuw0oPXQtPXS6l
         H64zia/302pzvHmyJ4x4bug+ejFodHFpyC5vNCGggrsj1tF8Mf1kavC6g2ZXEch85dy6
         /Ubg9X6zeyGJO+C2T9q4NAWA5VNt6nOs+U7FxenC/vwSVDqWsAVgzSjiEb1153nGR+1k
         p8ox83g2kZPjwFav0NPwljeBZDiQmu73QsYitOr9r6DZWIAyGMfnmV0wgqvJvBf1eK81
         vOTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VhZvQJ5+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si3180298qtj.147.2020.03.02.09.58.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 09:58:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VhZvQJ5+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8pL9-0006n6-Hg
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 12:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39038)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pKu-0006b0-8l
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pKt-0007Y8-6o
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:36 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39318)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8pKt-0007Xg-1G
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:35 -0500
Received: by mail-pg1-x544.google.com with SMTP id s2so179860pgv.6
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 09:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nnZb8apL5HPwafrnPocDxPavn/5fOqQOkEGFTZ+nDV0=;
 b=VhZvQJ5+cEChkiR9dxCzGSXsj/jtGkqJTGx1BXvvtyqFUGAMI57XDLSJoLzR0/1vS8
 7v56MN29PvZvjR+d/fTNJRIlIvVUutbWdPLmlq7gzoIboMHF6LSCI3W7PUiZpVY9PGwj
 JMYJBBJrAiOoA2oRCAOGULv5+Z1I27T7XTeKf39B12c0Asr2A/9zSU23x4vtJN/l67iK
 lbyRkdqsGW3DZyI0xjVtI5krWchs/EgAOARB6FCCWvL3CMbE/OphCGVjYLFhjBT6FOSj
 oTBPvGS839DwAw2RAzxcDk/irP8MdkWwoNus9P1o78joaP/y10xj1oXziOIiV8xAj6GP
 ADLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nnZb8apL5HPwafrnPocDxPavn/5fOqQOkEGFTZ+nDV0=;
 b=k8DfbyzI6YkgChJydAxf6jV6f5yDqwRi8XB7qXY0T0dWa6ep1YuhUZ5XA3TiFDdnqD
 lzzCfjyuv2FxK66iOb3pnWQnfsbQmYNodUHJYqEkoVVQ8kicv1KvyAC1wdOC0ktpVYSB
 hBYw7ZTRglr1ASTKAEG98z+YtY9CNrz2frh8rOVwZH2xDedNDM8NvvUbRCRb9hlssErc
 l/RyQkzpK+CCcXJdeo2cdc9x8zLv8P6irY8A2n2OlaG84WWBxct2SnWpsGQ/bMh35fbd
 uiL/Z7WgeXxC302H4OYq7r3LIO3ebTQ8iLuK2oQ8swVEHFom5d4T7iQTqWq91t8M6UOg
 OKKA==
X-Gm-Message-State: ANhLgQ3wTNzK1h2QPFPLBJDlNwPwlL11ko3REvrVp2OP2p1G0m+oYcL1
 4qRivAmMNEf3Y9DZNLT2HMO3Ow==
X-Received: by 2002:a62:1dd8:: with SMTP id d207mr234054pfd.78.1583171914087; 
 Mon, 02 Mar 2020 09:58:34 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id s18sm99510pjp.24.2020.03.02.09.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 09:58:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/9] target/arm: Optimize cpu_mmu_index
Date: Mon,  2 Mar 2020 09:58:22 -0800
Message-Id: <20200302175829.2183-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302175829.2183-1-richard.henderson@linaro.org>
References: <20200302175829.2183-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lAkFqXIEGokf

We now cache the core mmu_idx in env->hflags.  Rather than recompute
from scratch, extract the field.  All of the uses of cpu_mmu_index
within target/arm are within helpers, and env->hflags is always stable
within a translation block from whence helpers are called.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 23 +++++++++++++----------
 target/arm/helper.c |  5 -----
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0b84742b66..8f1b949c88 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2936,16 +2936,6 @@ typedef enum ARMMMUIdxBit {
 
 #define MMU_USER_IDX 0
 
-/**
- * cpu_mmu_index:
- * @env: The cpu environment
- * @ifetch: True for code access, false for data access.
- *
- * Return the core mmu index for the current translation regime.
- * This function is used by generic TCG code paths.
- */
-int cpu_mmu_index(CPUARMState *env, bool ifetch);
-
 /* Indexes used when registering address spaces with cpu_address_space_init */
 typedef enum ARMASIdx {
     ARMASIdx_NS = 0,
@@ -3225,6 +3215,19 @@ FIELD(TBFLAG_A64, BTYPE, 10, 2)         /* Not cached. */
 FIELD(TBFLAG_A64, TBID, 12, 2)
 FIELD(TBFLAG_A64, UNPRIV, 14, 1)
 
+/**
+ * cpu_mmu_index:
+ * @env: The cpu environment
+ * @ifetch: True for code access, false for data access.
+ *
+ * Return the core mmu index for the current translation regime.
+ * This function is used by generic TCG code paths.
+ */
+static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
+{
+    return FIELD_EX32(env->hflags, TBFLAG_ANY, MMUIDX);
+}
+
 static inline bool bswap_code(bool sctlr_b)
 {
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 37ffe06c05..addbec91d8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12128,11 +12128,6 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     return arm_mmu_idx_el(env, arm_current_el(env));
 }
 
-int cpu_mmu_index(CPUARMState *env, bool ifetch)
-{
-    return arm_to_core_mmu_idx(arm_mmu_idx(env));
-}
-
 #ifndef CONFIG_USER_ONLY
 ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 {
-- 
2.20.1


Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209752lfo;
        Tue, 1 Mar 2022 14:00:10 -0800 (PST)
X-Received: by 2002:a17:902:f693:b0:150:74dd:c1a with SMTP id l19-20020a170902f69300b0015074dd0c1amr23599176plg.58.1646172010196;
        Tue, 01 Mar 2022 14:00:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172010; cv=none;
        d=google.com; s=arc-20160816;
        b=UAspkSO6Vh1rDUhceMfdCpYizfqYJa9UrnGdaVZ7yHVvOPLqZSsi5NK+88j+RqSiZ5
         U2wALH5EuwaV5LtHXceJqhH7KthtfBUAnOJNRiGFk9VuOejL1v9l0SQ/kSyiO2Y81q/F
         m9nQuqmD8zRdgSEvXQ+HgONwNZxz5aBkWtgoqHZaB8jwzORscq3KJQhPBuOrbJESWPBj
         G8Ixc2iI+RUXMa7XHzOx36d0IttE1bzgb0WFF2Uz9VP3Ioy4TO4zDvcnwk2Cx9dt/gbQ
         Q3hZcnB1F7I5t/Z/msbIct0WELFrPOhbrL9zct0RzDX74JTcoPk6HpG3webJBv8sASoL
         /T/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+DAMlpqsE9DmBwY1s+cP0r+gi8rLuchADVNtgdDMW7U=;
        b=Up7bc81mtOszJGIxD+KWD8NxRQbjh308WGX/8YV0EpC3tPYfciZxKfzRkwTdlc4fdd
         pECNmCYzcfgQ8c4kQKqGiHuwSerMG4cOyuVhgDhvfUJPMHquJMp733nbCUBVCoqpVhPa
         o1FM4cdgC4kzJm56u5fFmP+oyWzdYt9V25RVz8nNe/2X/2JQyxHvYAxf4t2vPGIrO3vH
         WfEVuBGUMQ/T4e96ptibGwgsGsoOTRa6440Oz5j+E9kknVDNZPcfPc1OxqWDOYwRcJ/o
         JKj0Z9icllLmVYPMu3wMnCPK0qZOn7YS0cHS2W4h9qznit/yEnkrJkA5E4xfqvbIdiAY
         +O0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mq2ltQuv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d28-20020a634f1c000000b00378c5fe0cf4sor2778138pgb.63.2022.03.01.14.00.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:10 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mq2ltQuv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+DAMlpqsE9DmBwY1s+cP0r+gi8rLuchADVNtgdDMW7U=;
        b=mq2ltQuvsaGII0nw21LCdZQ9vRhu+28qEW5tjEtWd8kZKUrGy9SKf9m7hDdbGyU/py
         WVbzzG7efFmDHTqilAKCt5F773MS4MiGulnOX/29f8woFmOx8WsUT6MGpFrYeLSlR1yM
         I0qYQtmfcy6GY4X8U1yKCXzS2o38Jy03HBkzo5/xkI1qXqYAXmDRZK29hEcQ8iWEOzuR
         bus8SOvOtG25OzocVXY/94RKHNZZWNsjWDCZyhEK3rTGmwi/pfBOsDLVCUKoxr3rqtFe
         bgbHU027H9GdDmx65hLDgqAo8bITJedZYib/G4aO3sBKT1VOUZRH1S67tc5E4vdQBBNx
         1bRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+DAMlpqsE9DmBwY1s+cP0r+gi8rLuchADVNtgdDMW7U=;
        b=NPGaBgyw9GfPMz2PewBsSTGcWNDBvbYFEshzL64khshR2s0tpBGgeMttsx3n5UBDRu
         U/pKXoe6tBKn0NWQiI06yErlCMw/KB182xkJUQbmqV/yAjFnz4FbEr4scnY+WnsQ2GuO
         SxwmmQFit00a2R0DTjPkGlMzz/PBVZts3IenUpT5NF4XzNSD3Ic7BB3f35jliVfWTGZo
         GlBUGLEx9iiqdkfQp7iyHEOzcRdQbwfQCYasXZUAGXuA48xu4BKIxh8i92UIrmWauO15
         yawLDIEBF46IoaUuzhtuQu8XpV/8M389aAbVVHRGLF/+B6QANB/wA8c7xZPPsqx5j8L+
         ePSg==
X-Gm-Message-State: AOAM533frLwCkGt4uNAD91E/pmRTb3fkFNdz0ym3IzKgXjjsVNtcaA/Y
	wOmidiDe6EDYkYZJv7OkJFa9d8so
X-Google-Smtp-Source: ABdhPJxjvJKUJ+gOLQNlE8UvJ++/e3NjvvE9mSqCFx/G8Z24shQmr/GiejIN7xvL9WxkTeYsa8wjFw==
X-Received: by 2002:a65:4d0c:0:b0:379:3df:eac8 with SMTP id i12-20020a654d0c000000b0037903dfeac8mr1793340pgt.166.1646172009529;
        Tue, 01 Mar 2022 14:00:09 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 04/18] target/arm: Move arm_pamax out of line
Date: Tue,  1 Mar 2022 11:59:44 -1000
Message-Id: <20220301215958.157011-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: W6U7K6V02hL2

We will shortly share parts of this function with other portions
of address translation.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 19 +------------------
 target/arm/helper.c    | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index ef6c25d8cb..fefd1fb8d8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -243,24 +243,7 @@ static inline void update_spsel(CPUARMState *env, uint32_t imm)
  * Returns the implementation defined bit-width of physical addresses.
  * The ARMv8 reference manuals refer to this as PAMax().
  */
-static inline unsigned int arm_pamax(ARMCPU *cpu)
-{
-    static const unsigned int pamax_map[] = {
-        [0] = 32,
-        [1] = 36,
-        [2] = 40,
-        [3] = 42,
-        [4] = 44,
-        [5] = 48,
-    };
-    unsigned int parange =
-        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
-
-    /* id_aa64mmfr0 is a read-only register so values outside of the
-     * supported mappings can be considered an implementation error.  */
-    assert(parange < ARRAY_SIZE(pamax_map));
-    return pamax_map[parange];
-}
+unsigned int arm_pamax(ARMCPU *cpu);
 
 /* Return true if extended addresses are enabled.
  * This is always the case if our translation regime is 64 bit,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index dd4d95bda2..71e575f352 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11152,6 +11152,28 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
+/* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
+unsigned int arm_pamax(ARMCPU *cpu)
+{
+    static const unsigned int pamax_map[] = {
+        [0] = 32,
+        [1] = 36,
+        [2] = 40,
+        [3] = 42,
+        [4] = 44,
+        [5] = 48,
+    };
+    unsigned int parange =
+        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+
+    /*
+     * id_aa64mmfr0 is a read-only register so values outside of the
+     * supported mappings can be considered an implementation error.
+     */
+    assert(parange < ARRAY_SIZE(pamax_map));
+    return pamax_map[parange];
+}
+
 static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
-- 
2.25.1

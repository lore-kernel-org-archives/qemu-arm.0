Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2779797njj;
        Mon, 5 May 2025 16:24:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDNuiDlIBJtEmQNb4RpOyGiF0mhL7BecdP1hD0olbL4nHjYd2va3DXUFnzEN6QEM11/hf/TgfJlHoFXw==@linaro.org
X-Received: by 2002:a17:902:f548:b0:224:1001:677c with SMTP id d9443c01a7336-22e328a3c25mr15488485ad.9.1746487454710;
        Mon, 05 May 2025 16:24:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487454; cv=none;
        d=google.com; s=arc-20240605;
        b=ZHzI+UE7JtPF8asADTBQmnmVGIP1DbT+SocY5mGfDWlnA7UP9CsJFsC0JHgqdDWmBd
         2gGSLtfJohvtigGCnh0S/DPS/0HEVp4OpLm8t++AjnQR57HyVFWO2tUZ+o2hnv+DzSeM
         JD8G7xBjgl+E/priVYbD6wAPXLsiLzpFJgD5W3vUssW8uE5E1fCnyd3wvJhc6GV15kul
         FZf7D8zDHkcLlt1XMIAEJsy9+cQJcSFJ1yk3QozNAOIfY0rzIvu4TVuD+UQIuMAFhfMu
         wG6My/MHflTWt64KdgIn/gBP4ISuM3vSiHjBwTNZ+luolJdWTb3mXzm4i38T2jKRsQiW
         dDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Lxiqm18+sn4NfhFWpGsu8e9acXNWibaUDGV6AOwg284=;
        fh=kOSlkIczD1syHpX8ccBhBfjMycku2OcrQ3XUXfJrdvs=;
        b=QedRaWWXRbWAPM2cckAFPFGql3ZuJD5HO1nTwA7lD58CW1H08Co0CjUcnQKS7bl3Yo
         qyQzJUr6VMoCSTefoKN8l113MvgZ+qKdTZ2Jw+a9jjeI81pNH4ViNut9b9xiPu3hglTm
         LNmPWe2YbpKJHcVdnoP5SJ2S9iV9roxxTIQ5z4yBFUoDE7kcYNV+rHef/xJckzygBeEy
         K2S1uLC98ADGXdZ3j9aEgwNS8HwL89+cAJHnNtkCZn4dqzxw4A4sWhvFKF9CIdawLgq+
         DpRcsNZ1hEl3ey16h5eqLJfb32V7CVNFIyNKyBgSv/oIa/gom3/ictNBp91wCFEd5Zpe
         4L/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gbgF3/ve";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb1a494sor6718095ad.1.2025.05.05.16.24.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:24:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gbgF3/ve";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487454; x=1747092254; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lxiqm18+sn4NfhFWpGsu8e9acXNWibaUDGV6AOwg284=;
        b=gbgF3/vez0nfTz0FFTFPUo4n0jExgCUp1FPslJSHZNh8tzfBS1NkHYa4QkeG+7rm0X
         RQRtO8n8xuiOrHmj5JXIEETGppR+3pkV5m1f8b6m9/kee+xZD091BkNQOWmGemKxBxcD
         qFArBbhubFld7DGfb1XjxU976iYs5Isogc4fFAP5rn36WkNVOYZJIqMUFPbpC2zr1biZ
         ygr+VKyYBg6ZR+3dIQ0li4gITAIxF7h51ymVZxHNzDYF0xeRLTe8RM0uwLx/KKTjnMpw
         6zcel7Flh9+gVjkofPhX9fQJRIdAAZkURj/iducWW30pnaGwwR4juFunC1fObZhHfwg4
         6XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487454; x=1747092254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lxiqm18+sn4NfhFWpGsu8e9acXNWibaUDGV6AOwg284=;
        b=TNzEQcNa7akUgCvVFj0mozYskvlzf/JeINn889Kaubw7k1KkcRLAKKUsUZv7OUgLXj
         SJqx9E+V1VI7d2/2qICc2/tjdEE0Z+286tGDfjF9u+rEoIru1vHS/9JOZ+O1hcWgSJ05
         u3y6mxW1PzlUH7FwCJUMzk/K1FLAAA5Isq9/8um6RggynYeX2uvxK2Cdzi8Ni1ACzlCO
         m3YYjaL44AUEQdRuoyBOFvIjq7dIILxwneDdwmGgNSJctGPKKYlaDGpzt59QUj9s7Za4
         3Wm0HzTRoecFgmp3O3z+CxVHCc2cL0M1k0SuNs9VrZKOgBruPoHmWKOiZKs+0CtFJ3Q4
         WEJA==
X-Forwarded-Encrypted: i=1; AJvYcCUI1+xc4LimiZRqpUrwpom8pyvYqEbSbN0e/9GUsHYxO+JbbuQV32waoyEhzUUti58HAT0sxE8U6GgloA==@linaro.org
X-Gm-Message-State: AOJu0Yz+QyvIxTmVeSG3c/h642BWcpNQCvKB/uvgvOz/QpAYlAPKU34k
	slQ1NCOpWksMwW7sApRGX2STmBJpVwibwp3JnN+3O4zwTTujCFEi31CHfDVn+L45uw==
X-Gm-Gg: ASbGncsVWmKP9lbxLqvihCJ2Rvp4DENNnfSfo1SISPqVPeylBIO8W3lYqP6oVjkN29t
	WMwziTA+DYnQpQtdli+4jGx7lUvR1VhmKQHrnx+FhNQK+RNKJHIxGBsXyVwxQLsl21yfUN/Y+jf
	R+8hcuDoEL3Iz36C2bDKjjGSwxurIWvi+Z7Qj1HAV+mu5XZ50csqsKv9ZgBRMDy+UE3Z1zNIcSc
	TUbItmwh30/jnEsMB63HTqTYYQCy+J436YCbxM5Bp95UReuMI9gpwi/JjuT3XNBDp7tZDvnpRKu
	2jn30uNFQtkaG/sHRwbISn8lqzf9cZYg/urg7W/W
X-Google-Smtp-Source: AGHT+IH+n+7t3z29C7R6sRRD9PrLWdyQFgHaAF6qg00b9P4xkufJ3wIXXkW4T544/tooWyNTVIcfsw==
X-Received: by 2002:a17:902:e54c:b0:215:7421:262 with SMTP id d9443c01a7336-22e328cf694mr20675215ad.12.1746487454294;
        Mon, 05 May 2025 16:24:14 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e16348edasm58705265ad.28.2025.05.05.16.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:24:13 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 47/50] target/arm/helper: restrict define_tlb_insn_regs to system target
Date: Mon,  5 May 2025 16:20:12 -0700
Message-ID: <20250505232015.130990-48-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7cC4XJoSc5Sj

Allows to include target/arm/tcg/tlb-insns.c only for system targets.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ef9594eec29..6eaf6b3a04e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7763,7 +7763,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, not_v8_cp_reginfo);
     }
 
+#ifndef CONFIG_USER_ONLY
     define_tlb_insn_regs(cpu);
+#endif
 
     if (arm_feature(env, ARM_FEATURE_V6)) {
         /* The ID registers all have impdef reset values */
-- 
2.47.2

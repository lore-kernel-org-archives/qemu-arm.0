Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178779njj;
        Sun, 4 May 2025 18:52:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKcMgeDvAlQ9LoA4g9r59eEMR90ngnRmO0KaRSQ9CLiXzMIo2p8Sb1XzVSjuRR5R+xjiqCyquPjMB8Uw==@linaro.org
X-Received: by 2002:a05:6a00:369b:b0:740:3830:4119 with SMTP id d2e1a72fcca58-7406f177d74mr7860110b3a.18.1746409962894;
        Sun, 04 May 2025 18:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409962; cv=none;
        d=google.com; s=arc-20240605;
        b=gPRS5w/hqM/sbiIHRGKd75yQoqd+dsaA53nJculTknzugoSYpqjogEev4S2gK2zKWT
         LT/vR+k5N5JQ41e6duR4Sl8c2N8rxMuxB11/NzEap7+hRXE3dZUBjwhgTaJ6ZsLTjvvE
         bh7DY9yK3g0/UwwOmEojMl96PpixVeM/hjJBRLnXXHQwcYLG9v50Sqiim6SMFYkvQZ1l
         61w886SzBTfO97ttSHaF3TezhgFkrFtgqZfjwi4uPuJzo+Ykw87J+wUnRiSKJrFs7CMy
         YOCnB8LMtYjlayQ8wLQa4r1pqF6FIAr7XuFu0mngceQzADlZjqXOIkL37Ky5ZUS5AQxE
         lJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+dY2+B45FTbIh7DFuLp2IDYyX3GgPA0isTzUNUEtsE4=;
        fh=3Un19KhF7OvIAc/53OcegZPynQULY6kWWdUc8HO6K5c=;
        b=R3vOGGfmNWZ/8bJJ3OL+dol1OzkhvaiZbALJcthepovG+ae2Mnj8WPHr/kDPCIYzRK
         ap15cBDPZcifHZbyqpQvH2nuQul8Jv+c4Im8yCBP/j1VLAfdNdH9ay3a2derJcp9s54d
         y5izf8UyO4pOPyIJ+iUBc9wH859s0Z6gpp8PNF9LUMul3iU/nMiszv47Q2f4WpL7x2he
         U6BL96scc+J7ecMt2RmpYzJXfH8B5W3UgWG+QNwAlvn15sgUg6N0tUD11g9HuK+wpHLq
         gGTFqf+cxyxo/X7fOOVjtLLYL7sEKcuoMfErt85BQ1zSY9C6kFJjkHgqTdL+ggXMOEon
         2tPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qvBP1rLZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9e2c60sor3621736b3a.7.2025.05.04.18.52.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qvBP1rLZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409962; x=1747014762; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dY2+B45FTbIh7DFuLp2IDYyX3GgPA0isTzUNUEtsE4=;
        b=qvBP1rLZcNV73i3nVAesEjrEJ9Nc2M2bYBwW8moyHlE4rV4dfXtCfEt+NX2XbKC0po
         Y21M86Km0O6WMdPr1FGm4in7OrXzDMBqqLbP0FA9GYrzV0SIjCg8O2m1XZLtmU3BS8+F
         p0HKLXZqI1a2eNH4BDawsfUvxKxdFt8B9IPjEVhvSNzCxdFWbBZTIDxaV16Z9G4Z5vqh
         ryfh3qTLn6dX6SXvbfTJuHWoFNBV3V8P7jN3z3B1FPT1jL4eterYTG6EhkyghsGZeWEb
         GiwfpyMUFfsGAa+TqZQELJgRK+KOTs2mZupEgDkcfYeuaGZRW1PuaLron8QJDwgBMuFD
         8dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409962; x=1747014762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dY2+B45FTbIh7DFuLp2IDYyX3GgPA0isTzUNUEtsE4=;
        b=fuTBUpOYUWIBazyF57+QPdjl44Un6Dx2WpVGlDjTUitSPeIgmacuwOVsN/Nm5LBYTB
         vDPn1fXO+0m4vWyyTZ6nQIdT55c8YQoHvBwhAP4qft6xWDJkPWzSGPYiyMWJoi5Ch1qq
         wyOau8BbELNYWzlg0xCMAgVgPkBhFgTYg4JtVpRM+GieKH6E85gvk90RVys8AM7msEDN
         1LItAvX4WhYsSLKCcHlglmnbiXGHIu2r+5ts22+jNA2k3cgvq5/NQ9D6/PZ3b9ql8fzy
         nHV7DNF8DUGuWuMRw3C6NHm5veZfI5GXp46BZLaLQIj4tgw7LS2qNhVDWmX2Sfx2zXxo
         +m8g==
X-Forwarded-Encrypted: i=1; AJvYcCXIbCTcwYPh9WcH50X3eF2A3G4JD2bG4j/s5Zw+xqQX4cplMZCyHn6Q8DRDG81PMCwClkH5tElieTvbIw==@linaro.org
X-Gm-Message-State: AOJu0YyeHp3J2zyHTtFnu9DFgb8mtkqmOna54xJSU1BFgF+wdpBlYVsp
	qKO1myXpcy5yR1T2b1Usy/W8oBjZ32iM87SgcBbCmXpHSRJKnZzRMQdKHbyuO1AVZg==
X-Gm-Gg: ASbGncvC/f4Uoz04GREqPFBeDNlYrEevCFu69tCWmENYXdgPqNwkA5FBy77cZQ8T+ch
	ACiJ2vTMS4ajg1ZYMAxp7XY2CD+cawbhlkYUq97HFJisvRvsGOHgNziy+uxhof7hnQKhKpM/gMH
	DRr89pWpCYJWiJ13dSw5F9bngWAQGXO+OluMybGHGsn1NHdXCQNlA2PxXjBGNGmIiUqT65GvUY4
	JwXODlGB6XAH6fvYKyefPSYkAIl3xpJiE9Uurv8KFSeBbCrD7HVO7WCA4HGZaLkbSA9csQZyRkz
	v1AzAdm5cvEP0HUkAtMBIPHlc7Z4t1MWDobpprw4
X-Google-Smtp-Source: AGHT+IGwGPzb6lFi2Op/Qg5QVCFLUtbbcfO9DQX2e8IUchkEKTdytp85tL6CL/OsVBWd1f+gFvvx/Q==
X-Received: by 2002:a05:6a20:3d81:b0:1f5:9208:3ac7 with SMTP id adf61e73a8af0-20e97ea6076mr7778420637.41.1746409962540;
        Sun, 04 May 2025 18:52:42 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:42 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 16/48] target/arm/helper: use vaddr instead of target_ulong for probe_access
Date: Sun,  4 May 2025 18:51:51 -0700
Message-ID: <20250505015223.3895275-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 89tv2wRRVioG

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.h        | 2 +-
 target/arm/tcg/op_helper.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 95b9211c6f4..0a4fc90fa8b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -104,7 +104,7 @@ DEF_HELPER_FLAGS_1(rebuild_hflags_a32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
 
-DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, tl, i32, i32, i32)
+DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, vaddr, i32, i32, i32)
 
 DEF_HELPER_1(vfp_get_fpscr, i32, env)
 DEF_HELPER_2(vfp_set_fpscr, void, env, i32)
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 38d49cbb9d8..33bc595c992 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -1222,7 +1222,7 @@ uint32_t HELPER(ror_cc)(CPUARMState *env, uint32_t x, uint32_t i)
     }
 }
 
-void HELPER(probe_access)(CPUARMState *env, target_ulong ptr,
+void HELPER(probe_access)(CPUARMState *env, vaddr ptr,
                           uint32_t access_type, uint32_t mmu_idx,
                           uint32_t size)
 {
-- 
2.47.2

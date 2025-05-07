Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94273njb;
        Wed, 7 May 2025 16:42:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfpUIciEZRh0Po5Ux4ChxJnmPGnm3zSJzHJqxrWmuSe4YyOCW1GG60i2q3HACSgPuD9XQJAVfiR5mjKg==@linaro.org
X-Received: by 2002:a17:902:e80e:b0:22e:327f:4ab0 with SMTP id d9443c01a7336-22e861d625emr18854395ad.28.1746661371830;
        Wed, 07 May 2025 16:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661371; cv=none;
        d=google.com; s=arc-20240605;
        b=PvZFOixnrK7TziR1fvpj+C1m4+qvWDQ3HfpSjMcmDkBFQ71+C4unp+GHLEOo6wcuPQ
         4OYGBbWVIsKO2tSmICb/rd1PFNM/5X7fOKDZDwatUC6cGNm4mY5FPaShB22i81buOeX3
         iwSVk0Tv+A7gKoK1X3iZWmXxaJLa+cKursYcqJjNltR1E7BfW/FV0xXcSM9bcAXF/RR9
         cCKpzTWWTUDgDtlCiiRAsYAnL4lbzV3JnduHegvUExf18vZKXkJKBdq8MzSv2ZIX++IQ
         mrVCeQ69hJws97TL4/o6cFrgPNfogSxQoKuhUkMEZn6bphHbWimvuAGea2s72+avZLKG
         /7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eeLa55SzX7Awe9dK4zRdJwFSzsCeJiaBfVkd4m0OHRI=;
        fh=TCVeBqGiNCPQELToPioGDnVM8C75Vsson20TZtERT58=;
        b=Uak9wBhFPNkLZAXFGoF5Yi3rvHwgYhuTH2E4NQi2/rrvpAxsyTYwKsQdhm5akm5gKa
         En5MeJnn9Cdn8v9I8Tg6xRRwzEQIPj3K7vcI3tl42d/N6hUEOTljb2fD6LosO14j3/o+
         3kDyuXCxqOe2lsabrXJ+nxrpLwyNYxGQoEqjWZNilvAql5dgJixdr7H3XKnuV7tcSkEZ
         ZVSicJagS+/PwiN19p2FThy6cpUmIGgEnQZuxfFyV0cHMsz6G0C/Wh1C2EPY9lhFVDtK
         lRoP3GPwD7A/EPVnhQNsxXUQVhLecO16aTGR9L8TxEoux4qWnISxUc6FI5618kGlsk5c
         lJ2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h8Ra0Mae;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e68c428b1sor14189095ad.3.2025.05.07.16.42.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h8Ra0Mae;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661371; x=1747266171; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeLa55SzX7Awe9dK4zRdJwFSzsCeJiaBfVkd4m0OHRI=;
        b=h8Ra0Mae3UXTYA5sZusBH/TRQTjg33yWf8yRwBSSJnsY3W9z0PRi8xgZnrVKza9V6H
         RQ6RyKAgClh+Q4dAiht1OEfRVz1FDIrL8//mNGuRDJH2pXQKSWNMOHw0q8gM85f1HI6x
         yeej5w8fJbRuIrB8/72GRORM4X+lY16FBbd3pQARXYwJINRrmff30bJQVY4uN0Ge/xMl
         MFWrY7vnIAsSU6pQtsJJAtQDGhWbkh566xNww9jAvH5e8Wa4vZMzBvDH6i2v3tnp7DwV
         D+NODzv4jKAyNsTVN1sLYUsWPOuHymEmSESnqmHng3q1YnK4NGD1gLqkx6QwEgZnPSaC
         zPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661371; x=1747266171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eeLa55SzX7Awe9dK4zRdJwFSzsCeJiaBfVkd4m0OHRI=;
        b=ntxiD1HF1rkrkxiwzNFvt54zlbfMQh2So0h8bx3UvSZ7xfe6RFP6RZ5L6Nb/C9+33T
         nLrVD8m62Yme8t+Qw4FccYjCFIHvuZoyopOfF1ASi9Ys+7cVFOapUwSLrzjYV/kTz6t6
         mzs9QdicuIW5JdUZIEK30VNhYSUc6NXEAxPvjfxXBR8EWypAAj2FklLxDwdQ9nUBM0Xo
         yd/988Skhv1jyxsmr4c7GEObvDj/OKUU/0/oYO1MzSzhCTIScAqbsCbLmZZn1cSGFL+P
         f7uGyrI5ZKzbJtZNulZtghRzGGHCulqghzdzgXjZhvvYzR89AtCm+rUGsZP+pThRmrIN
         1Tnw==
X-Forwarded-Encrypted: i=1; AJvYcCU1AI51qcxaYw2j4h/Yi2TvBO6eAvl58+KpVcnrwCYILxG4G2u6+jDw6g3Yt1IQ3bGafbirsaxBEnb4cQ==@linaro.org
X-Gm-Message-State: AOJu0YwKSd0LbMHrv4TcM1hfVKmkUQMr8bDIm6juBMWVpfcBttO2Mkm6
	jzGn3kxb4wIbcMKfOycJWuri1EAw5mOX9HMBJP+KGUJHXuJ7pxRa0dIDvpmPdDaxeg==
X-Gm-Gg: ASbGncv10eYu005hgifcTzGFfUcc8OCyH8uqjnkG4Xu75WXmjgo87LoRAbPC7RW8C23
	89Q0XO5+rIkhSwUjrOOse6JKJbxtvKEwMQyfPCtuf8bgXwGZNg0wBzKbTuLhAl1WnDx3bvG6awA
	pWRWrCoMWtbm27sSNkUa5nvJLRX9nXGOuzLdx6coGJlIyoyGqL27HlepKf+NMNNiWj/16FjD3qV
	tUcpchuNDI3UJJdmNf3e9oCdKzwcASzwFPzTNjD3dkc3YMSbOf+fQkwyMkrXSEE3HmVRe5ABNik
	uj0S8d3x4CyrK7/cC9hpm9EmQwmNFxJD34B2lsiq
X-Google-Smtp-Source: AGHT+IEM99O2b2UnNUSxhoZQhjrZxHOh6vHDqf4IdMXmXOb8iZbwhEjpUUo/CTJ0GCRvuLSYmd0K2Q==
X-Received: by 2002:a17:90b:3dcd:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-30b3a6e7b5amr1778610a91.33.1746661371246;
        Wed, 07 May 2025 16:42:51 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:50 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 09/49] target/arm/cpu: remove TARGET_AARCH64 around aarch64_cpu_dump_state common
Date: Wed,  7 May 2025 16:42:00 -0700
Message-ID: <20250507234241.957746-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: E4wuVgf4wEDk

Call is guarded by is_a64(env), so it's safe to expose without needing
to assert anything.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b0eb02c88ba..b97746faa87 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1182,8 +1182,6 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 #endif
 }
 
-#ifdef TARGET_AARCH64
-
 static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -1341,15 +1339,6 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
-#else
-
-static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    g_assert_not_reached();
-}
-
-#endif
-
 static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.47.2

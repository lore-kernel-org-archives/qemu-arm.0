Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2244305dye;
        Sun, 29 Jun 2025 21:33:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSA5k/YrdhrwiZGBFT+BDuns2MSAhfVTVME2OyTSOoZ1A6bRMJyOJCbj/J9b70npcFBpOMae65FR1NkQ==@linaro.org
X-Received: by 2002:ac8:5fce:0:b0:4a7:1402:3b3 with SMTP id d75a77b69052e-4a7fc9d5020mr214731531cf.11.1751257983676;
        Sun, 29 Jun 2025 21:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751257983; cv=none;
        d=google.com; s=arc-20240605;
        b=H6FCN5MIopYmqFnD+BKJ9kLoPJNtgyxBMFHLn5eu/ekamY/oJxkRZoWc1M/vjYBDxI
         QJbcwZ8fcnzHwuYuNSgROKC3SguHQBLb2RcgBhtlGch2HeXyixHzsF8jILpI4d4lUKLs
         7ytLAT+OOSvBft1v8w2z7eHdALEc9NSupkwp1FCn7cH+XjdkQ+ju85shS0g55/4MDR0H
         4FQSYRwZO06gAzmEcleACXA2F0VsI80DAp4uatpCagWe8oOc6WTT/CQVE2+upQZ8bEsq
         0Owao/23JnpiFSnHEOV54n5fYUI6+PhLMofAgeSSeSEXxD0YBbIVzIGBR0PWuMkKby6L
         N4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=m7p1tDIFwTjQb2kYrEx8VXYNJTLr+20o3ghBktTtRy4=;
        fh=pM2kA5ssJetCkYyxrWg7OyVF9CcxoUfFepF93Lv0sZk=;
        b=KOv9OodVYAESoyjkEAAv0lM7WhpXK3eIgmo0nkJSbmTksJGyAorVD+6/nXX1F/Akk4
         JNKPZ/gMNO0XVbEI516kPDKRiz2qtjSvFl9+i8rh3qFPAQcxHGe9VCKgVEWwLn7YzXDD
         9IOCc1ibab6crajkkzf6UUpiT21FtBknzIqE325RnWgKcSLsIh32oY488qhJDK6z7ui6
         QcqANIHaEFDq30JAPVxxUbTdHdr2wKqKDFeCeScxh1FMaX6DRG7z+yxgoko6f2pD3V2t
         xbnBvhUSWQuucpM8JKlLDPrsAEkn8SIlbuDvb4v8hrGeP4O2aIgesUNwvWFCxMS/GOPa
         vCyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t+45Frdx;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d75a77b69052e-4a7fbffbd6asor56320531cf.0.2025.06.29.21.33.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 29 Jun 2025 21:33:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t+45Frdx;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751257983; x=1751862783; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7p1tDIFwTjQb2kYrEx8VXYNJTLr+20o3ghBktTtRy4=;
        b=t+45Frdx6TPt7MHWX8N8x3Hq4LhFAYrkNUnvdOmW9CZ83vCAUXUzghpIrKK68VLdMw
         GGqIin/uqDBee4yDx+jsQck9vsxvXJhRaYlSkBINFI4JIMJqezPI1DHJm+Qx0L8PVZgU
         9SPProS8cWLfel4y5Bk44jmYxhA7cFb8hx4KGWFxAhSieCE+kRHpOs8VR88FpsZTkRxV
         d+yoA8AAnRD+g+UJZVXYejOoNDPMBi7PMuuvB9M6cYWKxNOhZzpa6BgUuHOD/CQNu9Au
         ygXEufoL3rB5kgBWea255Kr0RX5IlEoye0QFuZnd9gHQQImMw4X24z0bQtPqlAwREg5l
         VNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751257983; x=1751862783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7p1tDIFwTjQb2kYrEx8VXYNJTLr+20o3ghBktTtRy4=;
        b=Qw2cKIw1oVwQLT4V4sa1fNnY8up87wZ/ClA8ahIOtaDURdvinseHRtWWRLY6I6g6tA
         rwas2FCm1gaEu+rehS9yetdKmCea4dWFFAPR18lWIRyGHfY4dZGPt7xkGlcOtYWM+pP7
         VN0k3zO4JJsNV3AziQQ8xG+SLnME5hWmaDDC4IB0HjiKpKxxNW8KD7ZPBoLkROv4vlOK
         DCRRcswSCBG5JKkqDOmVtoH1UUcTMB8Zgt4WzGntXA3rQJivM4M+mSQWxgf+mcVT75ew
         D/439ztZCL7cp9fec2TSi9TWf468ffHyL5U9Cnal6LQtszXIrTV3gqB0CyRbZm88dy+k
         53ew==
X-Forwarded-Encrypted: i=1; AJvYcCXYvMo672O0OaeR9HbyTb5LZORXCSILJv0etEAUTxDLWbH9qFKqdl83I9Fq0PtSb/V2RLe5r4sFy+LFPg==@linaro.org
X-Gm-Message-State: AOJu0YyiqSDD3ko/+cA6J5PWlWo+h5Ha7qYFWJhU6bnFkkJ4aMX6ykfk
	g541xiAjNc0wzKyykAYzFJCJQTmis+hE8o6WCrACkrYtihN9vP/5oshc/hJxkl7aBstH0Q==
X-Gm-Gg: ASbGnctyXnc+1qMtMISi6aX0VBhEs7e8xU2OySKoaBB22GyZd1i9vHqob1ildaw0fV8
	A1Mm/BmQIRZpQAJIm6ZzMBecA6tl89TZ8b3nS6HQqh6Bd65cnPDB0+O3p0xa5Xn0U4qbPGHB22o
	W04SsCG0u+WlHFrdQy/EUcM0GKeUSPJymbhOpTYtN/9EBz3FS2CaRadmjS64AduFNub40enWj2i
	hvO6B0JlOT/UsCeLp8rHwbKwV7nf7jttqHTYQpCiYpEXUgH5OiBkKNrZdafq2RTJ3PmgbTRGtKs
	sweXGLqeFCiXnqPkyqgor4jRW2UNr9Rjqxztk6DI/h/AE3E1R76cf2grQsR5DF0lVRU=
X-Google-Smtp-Source: AGHT+IFj5wFwbOMqR/+3+2Bt9LpdUyGqCRpRf2COHd39idOzknEGTiSuLuiV7CPBqU8z7ahE3cAL6g==
X-Received: by 2002:a05:622a:4012:b0:4a7:a8a:eed with SMTP id d75a77b69052e-4a7fcae72c0mr214110621cf.39.1751257983162;
        Sun, 29 Jun 2025 21:33:03 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc13971fsm53470171cf.20.2025.06.29.21.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 21:33:02 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH 2/3] target/arm: Advertise FEAT_MEC in cpu max
Date: Mon, 30 Jun 2025 04:32:36 +0000
Message-Id: <20250630043237.996788-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630043237.996788-1-gustavo.romero@linaro.org>
References: <20250630043237.996788-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: i6tdnUI8eLAq

Advertise FEAT_MEC in AA64MMFR3 ID register for the Arm64 cpu max as a
first step to fully support FEAT_MEC.

The FEAT_MEC is an extension to FEAT_RME that implements multiple
Memory Encryption Contexts (MEC) so the memory in a realm can be
encrypted and accessing it from the wrong encryption context is not
possible. An encryption context allow the selection of a memory
encryption engine.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu-features.h     | 5 +++++
 target/arm/tcg/cpu64.c        | 1 +
 3 files changed, 7 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 78c2fd2113..68acb49825 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -89,6 +89,7 @@ the following architecture extensions:
 - FEAT_LSE (Large System Extensions)
 - FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LVA (Large Virtual Address space)
+- FEAT_MEC (Memory Encryption Contexts)
 - FEAT_MixedEnd (Mixed-endian support)
 - FEAT_MixedEndEL0 (Mixed-endian support at EL0)
 - FEAT_MOPS (Standardization of memory operations)
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 4452e7c21e..128d75e68f 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -593,6 +593,11 @@ static inline bool isar_feature_aa64_hbc(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, BC) != 0;
 }
 
+static inline bool isar_feature_aa64_mec(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr3, ID_AA64MMFR3, MEC);
+}
+
 static inline bool isar_feature_aa64_mops(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, MOPS);
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 5d8ed2794d..66c4d1d789 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1242,6 +1242,7 @@ void aarch64_max_tcg_initfn(Object *obj)
 
     t = cpu->isar.id_aa64mmfr3;
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
+    t = FIELD_DP64(t, ID_AA64MMFR3, MEC, 1);        /* FEAT_MEC */
     cpu->isar.id_aa64mmfr3 = t;
 
     t = cpu->isar.id_aa64zfr0;
-- 
2.34.1

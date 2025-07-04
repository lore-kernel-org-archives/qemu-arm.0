Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1283049dyc;
        Fri, 4 Jul 2025 08:15:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTCcEMZpsgixJg+Sai7TmBuGiQLwQeHl4ZcQoPq00EhiPqGf1Eq5uVP+L+Nz96bkfpsyb2qwIQ8mJPMA==@linaro.org
X-Received: by 2002:a05:6214:3202:b0:6fd:5c:2d75 with SMTP id 6a1803df08f44-702c8bcf1damr37323106d6.36.1751642115802;
        Fri, 04 Jul 2025 08:15:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751642115; cv=none;
        d=google.com; s=arc-20240605;
        b=ZUsVJJykAjmkKlhOM3rt6G8z/ZHgxrt3GWz3dE8mThvoHJnjUDOVbLDai6ft9OofMk
         8NPrdj41pa4Z6EcCaIExeHRRbGIomgLgqAXHk/9VlumrFjex+biswnpHjEtq6MBARkxU
         89IHY/Zq3+4JZW9R5FKoYp7ZDyUozJMPnssCwOAgFA1gnKHALuPsIZ6zWP0cbVRY7jCG
         EcL0a9PzX/Al3qJky3ADJGeEUG0TEk5YI9v1JPg19f8pGg8L8RQfT4uD+Aqg4YzXKc7T
         ena8Ilwb1DoXXqQiOdL4g927FUEMIds9+F2RtlfVuyyqinZb4C2urwJPBp7GiIVtypd7
         XF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EoLfxluEkOnqZWGvoYUYEDIuHb2S6wPjEZT0a5AA8Vs=;
        fh=rNRIarYA5Mrcw6CuFk9Iu1oHLDBILNVZ3PJ6h+DtIZo=;
        b=MvJjFYgQFz3D1PngbbZqgBcR+OIGvPtLrw1Nx7yLzIMULtmswzyV5hJzfkCfXvx8VU
         IfZIHFs4MI8SpY20O3/kcUGWQaL8l8CnppWkqhjm83FUXSpodQ84n1AnZHlqVnVa3mM4
         WDor0aVNmamW+NB7Gx25Jrg6Op1A2kK41Vjj1OMRoRPI+kYITWgHKpHUR/T9Dl49raai
         vRQLe/3SJ4DqmxX69IKJV0ni/a/cKF/RnMCwF+ZBQSCYZbB62cYSeoAONtxVcUDmf47c
         QHw+HUsr1Q+QlBXE/IQQbbcC6hrptOjEPTA++y9udv2dJMvL0jPhRzGj86DPvGUKt78z
         GZVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wkwTxDVZ;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6a1803df08f44-702c4d326a4sor21376506d6.5.2025.07.04.08.15.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 08:15:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wkwTxDVZ;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751642115; x=1752246915; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoLfxluEkOnqZWGvoYUYEDIuHb2S6wPjEZT0a5AA8Vs=;
        b=wkwTxDVZeJ9D7Q2xIK3u/zGfmTS1/RlR4JDPu/LDyKu9Xf3mCNgmAzPIERLLhAEmyd
         7IItKYu9789ywC+7MDxe1R5ZHFuCQaDP5y2fTZVvxBtigVyFqLuJZH+R7C56J+yhIHCl
         yt8zHvjXM4W/Lg+IQ4TbgMTXS5bU7p7T8Xff9NpkNFm5r3JrVA93L39Vtc0+WJ/41BQ6
         bzy09BM0LsASLHYFkYZrMCdvQF8A0aEt5kaktyjhtuQP3vPk92IqWbURK4agb5rghugx
         89D052g63QscMR2bfBBaPaGnCXNyiPnn2Oz/rNPbBN1QSUmRo9EvYRuJl5fHuD0ikUVk
         3dVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642115; x=1752246915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoLfxluEkOnqZWGvoYUYEDIuHb2S6wPjEZT0a5AA8Vs=;
        b=NlmvyILJ4Re0LGtYPKvgVgAGrzmJNjgiVZV13IQMQ0CIgAOUyBvLmI+lR7XHfzIIS+
         x3GWEuSo6Yn+NaHsALq0v7fwy5Wu6+mgFoMLbep+7wi5pDiEaLOPuE3kzt9G7jFQqvbO
         57NK2JpbfN1EQIcSe2oAmtIguPpVP9y36oIESL1Zq/Ms7pDvzDM1Yss6saH/tVvSusi/
         NKcSRz4hAeqaeVZD7p+d5TB8ipTVP0PJoAJXoDwC43r68TZWUettqcIAT4JA3Bh9Xt59
         I2rEBZFOyujy81PldvsdMUZE+oqnn1CckTk37TcVub9jw74gSNHf6lyY74BtV9xNPUR1
         npWw==
X-Forwarded-Encrypted: i=1; AJvYcCV7sbh7wfJC4Wsd448S6n45zffifDNllGPDJ4DNH5pl/RUehvj0MDlN37TEELqqDKF2zOqUr8DLUCBwYw==@linaro.org
X-Gm-Message-State: AOJu0Yzn2IJeYJOK/RIbc+ICYFKiLBBvRDv78EDseURuIQ+K9In3hrXA
	JqinNXHpGAs88xDVIKKYF5gmdUkWQL8ODn2K0fDy7UVRRdTlq5mjw3lzgmM0d+E4EwJkPA==
X-Gm-Gg: ASbGncvx9tfv+0K8a3eKu2r3qcTRCs+wXD03EfoAnDP3pl63zMVj24tPtVoOmpdtoZs
	hfiGGY0Vo7QwwiQZdCpQ0n7SJZrgAAAeJAwpHzcKHsPKRFhGHm27N57OCJQ5mAv4CJGpsFs5h+7
	OIe71U/r/RFQRZWh+NapXRopOsyFu16CToDu5/G3DJOVZxD0wQqBeWORXY4nxDcGM3srv28+enh
	Hrb7U+YzrmJa4TpgGh6Z0zB4zVanCY5inFGWVN8FplyrKMknXC2gJVP+cF7lrJkTr8LftScPlq7
	Jt2kt947Uk9X3mgzqlGvjo2agrB0pyiuqsLyNn+V6a8shq45Fhit8agzQxx/T7vS/aN2IGxQxD9
	4vQ==
X-Google-Smtp-Source: AGHT+IGBKNTZQF8m01ia30/qAaj3rTGj3sv76gjBLyjix3w0Rk2Wqy1FdnzE/7UzPybfwIeFKAWw/g==
X-Received: by 2002:a05:6214:3f92:b0:700:c717:493b with SMTP id 6a1803df08f44-702c8bc0f08mr36682916d6.25.1751642114783;
        Fri, 04 Jul 2025 08:15:14 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([189.110.24.38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d6039fsm13658666d6.111.2025.07.04.08.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:15:14 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [WIP-for-10.1 v2 5/5] target/arm: Advertise FEAT_MEC in cpu max
Date: Fri,  4 Jul 2025 15:14:31 +0000
Message-Id: <20250704151431.1033520-6-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704151431.1033520-1-gustavo.romero@linaro.org>
References: <20250704151431.1033520-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xG6UgTYGXHQE

Advertise FEAT_MEC in AA64MMFR3 ID register for the Arm64 cpu max as a
first step to fully support FEAT_MEC.

The FEAT_MEC is an extension to FEAT_RME that implements multiple
Memory Encryption Contexts (MEC) so the memory in a realm can be
encrypted and accessing it from the wrong encryption context is not
possible. An encryption context allow the selection of a memory
encryption engine.

At this point, no real memory encryption or obfuscation is supported,
but software stacks that rely on FEAT_MEC to run should work properly,
except if they use the new cache management instructions, which will
be implement in a subsequent commit.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu-features.h     | 5 +++++
 target/arm/tcg/cpu64.c        | 1 +
 3 files changed, 7 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 611d7385d8..14f17febe2 100644
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
index e6a731472f..009618fd9c 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -603,6 +603,11 @@ static inline bool isar_feature_aa64_hbc(const ARMISARegisters *id)
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
index 5f77d320ea..1a127f6cf7 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1243,6 +1243,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = cpu->isar.id_aa64mmfr3;
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
     t = FIELD_DP64(t, ID_AA64MMFR3, SCTLRX, 1);     /* FEAT_SCTLR2 */
+    t = FIELD_DP64(t, ID_AA64MMFR3, MEC, 1);        /* FEAT_MEC */
     cpu->isar.id_aa64mmfr3 = t;
 
     t = cpu->isar.id_aa64zfr0;
-- 
2.34.1

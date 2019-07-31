Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071590wrv;
        Wed, 31 Jul 2019 13:38:54 -0700 (PDT)
X-Received: by 2002:aa7:8106:: with SMTP id b6mr49224909pfi.5.1564605534658;
        Wed, 31 Jul 2019 13:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605534; cv=none;
        d=google.com; s=arc-20160816;
        b=TVhBvpgBSH3+S/+rAudFrV2DE9pAtwlhOENMZNY06SM6r967IHxKnBlv5AOBuWvIXD
         yeI9ieCAqJjchmP9j12YuZfDaktBUwg7pAIgCao5LAJG7qY7c3EZJ4uhqdgGQ8/MxNAZ
         JjFyxatSP11r/aJ3Xpw138BnvNRI47rgd0AMEJA9VMdMB4+qqxQNTblXNyX3wFkI3ty9
         mf1lPhGj0G1QQIesheZ/8AON1qol6BmBISB1Kq+d9D1Pw3/uDmHgiB8/sbOdTkr7UlLy
         BzLnSDu8Pz1hKM+5n2jsrVDsROQrq0YXyaBQ+V2EOcgk3aDvbYMkwh76sTFFRgNR9yeb
         Ev/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rCEnVED33NpbOad0FfG1c7z9lc80+f3mCsiBq0HqyvU=;
        b=EWVdR1za+pnFuVwypM1TpidyMpyKdOPGE8sYyPL6dYMfxsJ1W1JPM5kJa8UOkMpfR+
         XAQTkLgJxdoXEjhQiVq8H25jQATAbZUFhJ63+4sfU7x3aq4HeMvRcloNS/H9nJuT7bXN
         n+76hXWoXnDaSleBuS5f5U+Yfp/ytFwbJoQQgtUqoFzzKcs87CfWktIluxRQrRDW3xrG
         252RAnatIVrpHTA3JKk65CzE2QJ5P5v5D8B1B3o3pUp25RtgvF7IcUUV0sZL8sh2TJyN
         F5KCyEpWacmb5wncKHRgR+v34E6u2CDEpHe+WODPP2DaUac9qYGcYQoVouxhMQ4KTLbU
         sqiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DX5wfvfh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t5sor32859682pgp.83.2019.07.31.13.38.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DX5wfvfh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rCEnVED33NpbOad0FfG1c7z9lc80+f3mCsiBq0HqyvU=;
        b=DX5wfvfhHx0n2P2s6jl6RwziKqDkDxXUOzDh7/6cIrZEbTQqGsEd+W+FyUdIZ0RkGw
         P5arA1F6Y8ZC6vw5DUFCrz/he4PxGXmFRQJF35Dw3jLQEFo+QFxAjy61gKKerwr2lk9Y
         TNewzFtsTvvoWeenZLzItpoSeulZVmILyKKjRMeSM81X+JANzAn3L9ivEeaDzkmGZVU3
         3rj2vJoEBSFbi8KNDlqG0VZJJ8ZEzVM3H17Y25SD35h6qqPZIAjwffvfOAsThAcK2M+l
         N52mDMflXcUB5Yl1qa1LhqLtrlMBOvc6TFUfo1iJuI3xal2npnqXgi2PbtiyCOTWmc+n
         XvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rCEnVED33NpbOad0FfG1c7z9lc80+f3mCsiBq0HqyvU=;
        b=t0Dvo/OCgAFTAl7F2kZbrctHAi5iX3HEKw0qjvSC6/O4vydmtLjAZyKJYl6oGNJDx2
         625R4jqqOhtcIaHedoKaAJrlRrnzRrknLcuuD9K2NQf44qnPA1jSCieavs51HdSJ4R8W
         c39VlvXmuz6OXok+ikeNh3EP2dw/ybO5bp2CRCqg2a/lqq43K/ViKm89pbCuqUUgaNom
         v2dc0zo9xjZfAAqMBXoUvxyDXsODuX+Ofbblb5qYIoLALBujKUaJFOcCZszWovwvHQ38
         blVDySQFFndX2AZKKff7RE3BaZWydM+uTuIOfUvONlUxnhLD5hpT+Wv1UGmFsvR5Zhe0
         Tbvw==
X-Gm-Message-State: APjAAAVGSc5bMzsJQfAE3i6g2CIJUQ3PV91j57nHmQcvFOHnsSa3fsnu
	G75Wr4pNE8pBJ7hj+bk1Q2L1MpBW
X-Google-Smtp-Source: APXvYqzT69kO8SA8gFvdvWnfzS57ZpuhMi0E9khqmPD/SwfJjVZy7cSrTQm9JoqEoxEuXVAW+pCVeQ==
X-Received: by 2002:a65:430b:: with SMTP id j11mr113663987pgq.383.1564605534112;
        Wed, 31 Jul 2019 13:38:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 32/32] target/arm: generate a custom MIDR for -cpu max
Date: Wed, 31 Jul 2019 13:38:13 -0700
Message-Id: <20190731203813.30765-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: goG1fB7pVcRC

From: Alex Bennée <alex.bennee@linaro.org>

While most features are now detected by probing the ID_* registers
kernels can (and do) use MIDR_EL1 for working out of they have to
apply errata. This can trip up warnings in the kernel as it tries to
work out if it should apply workarounds to features that don't
actually exist in the reported CPU type.

Avoid this problem by synthesising our own MIDR value.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20190726113950.7499-1-alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h   |  6 ++++++
 target/arm/cpu64.c | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c41da1d791..bc9b6db9b4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1605,6 +1605,12 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
 /*
  * System register ID fields.
  */
+FIELD(MIDR_EL1, REVISION, 0, 4)
+FIELD(MIDR_EL1, PARTNUM, 4, 12)
+FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
+FIELD(MIDR_EL1, VARIANT, 20, 4)
+FIELD(MIDR_EL1, IMPLEMENTER, 24, 8)
+
 FIELD(ID_ISAR0, SWAP, 0, 4)
 FIELD(ID_ISAR0, BITCOUNT, 4, 4)
 FIELD(ID_ISAR0, BITFIELD, 8, 4)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index b1bb394c6d..3a1e98a18e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -296,6 +296,25 @@ static void aarch64_max_initfn(Object *obj)
         uint32_t u;
         aarch64_a57_initfn(obj);
 
+        /*
+         * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
+         * one and try to apply errata workarounds or use impdef features we
+         * don't provide.
+         * An IMPLEMENTER field of 0 means "reserved for software use";
+         * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
+         * to see which features are present";
+         * the VARIANT, PARTNUM and REVISION fields are all implementation
+         * defined and we choose to define PARTNUM just in case guest
+         * code needs to distinguish this QEMU CPU from other software
+         * implementations, though this shouldn't be needed.
+         */
+        t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
+        t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
+        t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
+        t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
+        t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
+        cpu->midr = t;
+
         t = cpu->isar.id_aa64isar0;
         t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
         t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);
-- 
2.17.1

Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087036lfc;
        Thu, 12 Mar 2020 12:42:23 -0700 (PDT)
X-Received: by 2002:a17:90a:2147:: with SMTP id a65mr5642701pje.176.1584042143169;
        Thu, 12 Mar 2020 12:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042143; cv=none;
        d=google.com; s=arc-20160816;
        b=oi+nG387Ey8VtyL4M97Tv7J8ZTjkGKJN+nzPhvCghkHvGwYqiQcUQg7KmohlkXsw38
         BH4ybBzoA63FIsjFJn8rpoDp4Zz1GJOVeCaWec3pDRULjmW1FBl0SlVpazwQw9hGVdxo
         3aVJGHaPdarmFVpFjxZtK1F/xFRbjxQl1F+TY7G4B4oYBNe2L6Ji4r5c+21oLNZd/pD1
         FxYiiPDu+PnEXKR9zAmRPti+SRlkQFN7LjmM3UbGiKbO+/mqV2mW0sFpEEo8k50Gvu9G
         YLF34dQNqrltDKnHWo5oL8ASTlMfDGhmtyO2dnr8zstp1XqbkCa1DOZIRqcXoSiDuLDj
         Eb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X41LntIfpFnOp1tmXD1Hx9tL8xRzEZP+j1F/1N0KBdg=;
        b=Jqvm1C5gc6bx2l0c3ST6e0n3SpmzVtucDo0epEF3fXg4o1b7sRmBlFdCvynNVuUjqe
         ItPvrbWcGpZ7JT+NLSd1Smb7/dofjHXb7WD7Z3sF/O1FIABKP4bjciaicPci/X/6ZgdN
         0vlFcvnIJlftF3AcrD06D9Y0iw8ntkxxnbIubiaTZwfRV7hDf7cSEU6ni3Q2y5zMIkhR
         bLELYmDyhQWVaN1noJNwzVhCynpYyVzpNx2r53cTYUpzTSFNjJn68pMnlcn+/U/fIoIL
         SVF5G942hSpNwO7Iww6GYe5+asfaanEEywaaBK5CU30MbELyz/Y3IDqa4oe6SlJIDV+Q
         wEMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YvaIySu4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p97sor6768529pjp.25.2020.03.12.12.42.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YvaIySu4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X41LntIfpFnOp1tmXD1Hx9tL8xRzEZP+j1F/1N0KBdg=;
        b=YvaIySu4S+qagbhGEolpvRxDVWQr7YGrPXgAmtn6YLYp4OCeTISuJ8hj5xcPenA8ws
         dvBl0XE4lvnDy4KSkLJjlyOts0c3PJjB5L7qD940RHPbw53Eajd0QSXVc9bPA+fCevsf
         OBF+N+QR+nNHGevuFZ82mp/dHo536EH4zvaz7TK1ccW+Zm8khkhUfyX2ghRz/TiiuT+f
         3U9CxZAs0hwBTxImWD7EZnPI2U8SqmKCI2Hz6jAq5YqlLhzuzlq8UqJtLPtJQD8SJcmv
         cXpf79bgY6hYZrI5AA/efqUNILKkRpXSNx4BORcsgyWCvSzVP87d+4JIx13+jYGOQ6PZ
         +bnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X41LntIfpFnOp1tmXD1Hx9tL8xRzEZP+j1F/1N0KBdg=;
        b=Bz6NOh51ENg3Mj51LakixiGjCDh/m/3i6Kq/ZQARLfj9gbCIubT+SSeorCt4c6IUC5
         0+MMZNBiBYMIQ4E32CXSPBBayZo/P2N2Hh7Zsw7A/BCBEzC0AQ3v/I4NQnqtSzSILYp1
         fJdO6ozeZ2pT6NYT/+M/Aebqyk8O9vT8ZrIcIHOfK5Ad0G1SWz5p4Ru+eOkyyx0VW2eS
         QlY/zGg/mF/xbURTRIZ7kupAo0WqZJs+Uwrzj6FO1727NVTB/pcEgmkseIQtsECckBaZ
         6ML+8YZJx8XdOK8762XzveEDC0HKr3Ox0WO4TQxEtJwTCzeZo7vEFqHv4bDb5IuVtAi0
         3jBQ==
X-Gm-Message-State: ANhLgQ3stKC8z+IqfC3Agf3wFApLFHAZUT6ki3WhYwWXj4fnQfUs1/iz
	w+b8Zlavp9I59rfGQoFj6/rGgwIm
X-Google-Smtp-Source: ADFU+vt7599WRlJaM9rFkrZFruM/D1gP+C2OU+67Us4sS+uMgWznnD0y4Kti9ifHUyNDobqLidXeTg==
X-Received: by 2002:a17:90a:d585:: with SMTP id v5mr5827956pju.4.1584042142715;
        Thu, 12 Mar 2020 12:42:22 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 01/42] target/arm: Add isar tests for mte
Date: Thu, 12 Mar 2020 12:41:38 -0700
Message-Id: <20200312194219.24406-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gimB4zAk6ueU

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4ffd991b6f..a77b0d97ac 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3777,6 +3777,16 @@ static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
 }
 
+static inline bool isar_feature_aa64_mte_insn_reg(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) != 0;
+}
+
+static inline bool isar_feature_aa64_mte(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) >= 2;
+}
+
 static inline bool isar_feature_aa64_pmu_8_1(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 4 &&
-- 
2.20.1

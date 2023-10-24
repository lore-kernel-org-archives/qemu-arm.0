Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2175032ejb;
        Tue, 24 Oct 2023 09:36:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDOsZt5LD84NH8W23yGNRJ+S6qOeDe2PoitQt7ssgYv/IuRRSojbrOunw+LPdB5uW+qkuR
X-Received: by 2002:a05:6870:104f:b0:1e9:f69a:12fd with SMTP id 15-20020a056870104f00b001e9f69a12fdmr11883178oaj.58.1698165417132;
        Tue, 24 Oct 2023 09:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698165417; cv=none;
        d=google.com; s=arc-20160816;
        b=Yl+61reQEwwbZvxFPuOUkCT3VlZhzrHZW3nqtbuUmn4uwulDFJi1xfWO7vQgPuwvTL
         ovbEHx+qtCDTa4WUTRw0nO6yTxFFB1AIgoTP7GyF4LrONWGSUM3C1WXlYd6gV8+rC/z1
         liLtIW7PuXpHQH637YIogvHdI+sc77QT2bBVDd1eEYQSxKntT+5RhJSSVHm8DaOwEDjv
         9wAlNLjq8aGL1YA3gUib6l2SrwV9RQeRgjOf0CAPPL5ck4xUj8WfLsKEPuBhwL2WDK2V
         HDYtdku5HSQTMv4LDA/jqD12aYhJWTF9Z9lEJW5UK01+V/4maRgY/pRiulXE/SqoVtwA
         z9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8bMCfEHTfV34KfZ3feZzIlE4p/GNpa8wAxhSxdfRu3I=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=BgUK6P0phjCg9peGlPYbi0Dm+/7xdlEnBoNNl54UcE4ZrAj2Vm8jvfohASii6FLCQp
         8ZM7OrWTYUTL3q6Wvc5rtC1qS71rpxhj9YoX4lpztq+FMhaRaKbAewW3QHyaFXHDJM/u
         Iq74sjRjTY5O6s9n7cVx8Sn8LVXk9hPHdKgjhdnuSXGF7Uo8wyi1MIb0rl77QVPgwsUA
         lY3lYwglrGGYKnwtL9zsdb9UxLvtrHxazoZWh3ok1kyqALJt7Lp5O4kcU0Yu44L1PZQm
         9SgG7czE/B9IIBculZ5BBGB2GmJpvy08/WWC/eNN16vXbBw+GNneEX4Xc5P7cMGiGtss
         OhIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iPnrCUmF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13-20020ac87fcd000000b00417bc62d18esi7290436qtk.231.2023.10.24.09.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 09:36:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iPnrCUmF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvKNP-000253-3t; Tue, 24 Oct 2023 12:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvKNJ-000204-1j
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 12:35:25 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvKNB-0004MU-TK
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 12:35:23 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40838915cecso38741595e9.2
 for <qemu-devel@nongnu.org>; Tue, 24 Oct 2023 09:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698165315; x=1698770115; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8bMCfEHTfV34KfZ3feZzIlE4p/GNpa8wAxhSxdfRu3I=;
 b=iPnrCUmFfq2kxamQgqOrF/srTpWUG3OM4eqOPMQ6OCYzutHAf75OMNhntj4aPmCDO4
 95rOXK9WB0RjwEzsHjdeFUCEUDX98qdkftUndSyaU2VXPKtt56lUkZiEiH5zF3fWPjyX
 Lyq4gkhk23ETXWzSlXYBUe3Hwe6o4II43SA294DHyGFr+0GujTMXRJxaYt+p1gydAJ6t
 jenJ/v8zNtafRcZ/vZVcAdJojwBYz6WWIvl2/cV/nmwp/yzDETT9ANdahX4BhfVVc2je
 Qepv+iVjiJZjnPSjnsvKRs2s9GmrnAc2GGG6ZHhfDwvVlNhg/GMUM19vm2nd7QpzKBoI
 on5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698165315; x=1698770115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8bMCfEHTfV34KfZ3feZzIlE4p/GNpa8wAxhSxdfRu3I=;
 b=wn2l1dazAmyIJIejG9x7T3e3l21gXWpvmO2EJ37QQweabgBtCS9UDz/rKahMisTV9W
 00QI+hVcJo+SDQINCJqUULw+WSOoG/IppF5VDwGYHEkFq53RNljhGN1tlCS446MU9LHk
 9aiaL9xaW8b3ynE12hN6Qunhf8N3kf9pZkYhnPUx90bFbmbhVjCPDlQgfLVlPoZySIpf
 WXaO/hq8H8exmzLr+8Ur12r5XKPPBg13g0OVm7wCP/WLPP8zt69DCx5daFpJ4hHi2q/w
 R7GDAK5rdLlEIm0WGs9vlY5Hc+ddcIP3V0z1i9MEqpVZF2wew8ZFAX+6PvbdZMfsr3Jb
 1hug==
X-Gm-Message-State: AOJu0YzuOcVE7kBbbSZUSoQS7IpL6j8FL9hVflIQUOGxS8D3CKnyMbPf
 nvV4puRXxrvrn5I00GRXMDLvbw==
X-Received: by 2002:a05:600c:310f:b0:408:febf:831f with SMTP id
 g15-20020a05600c310f00b00408febf831fmr5276309wmo.28.1698165314805; 
 Tue, 24 Oct 2023 09:35:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c418c00b0040773c69fc0sm16860101wmh.11.2023.10.24.09.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 09:35:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/6] target/arm: Move ID_AA64MMFR0 tests up to before MMFR1
 and MMFR2
Date: Tue, 24 Oct 2023 17:35:07 +0100
Message-Id: <20231024163510.2972081-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024163510.2972081-1-peter.maydell@linaro.org>
References: <20231024163510.2972081-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Hd8pGQmFJpXE

Move the ID_AA64MMFR0 feature test functions up so they are
before the ones for ID_AA64MMFR1 and ID_AA64MMFR2.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-features.h | 120 +++++++++++++++++++-------------------
 1 file changed, 60 insertions(+), 60 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index fc85a8fe130..90200a4b98f 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -606,6 +606,66 @@ static inline bool isar_feature_aa64_rme(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RME) != 0;
 }
 
+static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
+{
+    return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4) >= 1;
+}
+
+static inline bool isar_feature_aa64_tgran4_2_lpa2(const ARMISARegisters *id)
+{
+    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4_2);
+    return t >= 3 || (t == 0 && isar_feature_aa64_tgran4_lpa2(id));
+}
+
+static inline bool isar_feature_aa64_tgran16_lpa2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16) >= 2;
+}
+
+static inline bool isar_feature_aa64_tgran16_2_lpa2(const ARMISARegisters *id)
+{
+    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16_2);
+    return t >= 3 || (t == 0 && isar_feature_aa64_tgran16_lpa2(id));
+}
+
+static inline bool isar_feature_aa64_tgran4(const ARMISARegisters *id)
+{
+    return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4) >= 0;
+}
+
+static inline bool isar_feature_aa64_tgran16(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16) >= 1;
+}
+
+static inline bool isar_feature_aa64_tgran64(const ARMISARegisters *id)
+{
+    return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN64) >= 0;
+}
+
+static inline bool isar_feature_aa64_tgran4_2(const ARMISARegisters *id)
+{
+    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4_2);
+    return t >= 2 || (t == 0 && isar_feature_aa64_tgran4(id));
+}
+
+static inline bool isar_feature_aa64_tgran16_2(const ARMISARegisters *id)
+{
+    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16_2);
+    return t >= 2 || (t == 0 && isar_feature_aa64_tgran16(id));
+}
+
+static inline bool isar_feature_aa64_tgran64_2(const ARMISARegisters *id)
+{
+    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN64_2);
+    return t >= 2 || (t == 0 && isar_feature_aa64_tgran64(id));
+}
+
+static inline bool isar_feature_aa64_fgt(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, FGT) != 0;
+}
+
 static inline bool isar_feature_aa64_vh(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, VH) != 0;
@@ -764,66 +824,6 @@ static inline bool isar_feature_aa64_hbc(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, BC) != 0;
 }
 
-static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
-{
-    return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4) >= 1;
-}
-
-static inline bool isar_feature_aa64_tgran4_2_lpa2(const ARMISARegisters *id)
-{
-    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4_2);
-    return t >= 3 || (t == 0 && isar_feature_aa64_tgran4_lpa2(id));
-}
-
-static inline bool isar_feature_aa64_tgran16_lpa2(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16) >= 2;
-}
-
-static inline bool isar_feature_aa64_tgran16_2_lpa2(const ARMISARegisters *id)
-{
-    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16_2);
-    return t >= 3 || (t == 0 && isar_feature_aa64_tgran16_lpa2(id));
-}
-
-static inline bool isar_feature_aa64_tgran4(const ARMISARegisters *id)
-{
-    return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4) >= 0;
-}
-
-static inline bool isar_feature_aa64_tgran16(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16) >= 1;
-}
-
-static inline bool isar_feature_aa64_tgran64(const ARMISARegisters *id)
-{
-    return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN64) >= 0;
-}
-
-static inline bool isar_feature_aa64_tgran4_2(const ARMISARegisters *id)
-{
-    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4_2);
-    return t >= 2 || (t == 0 && isar_feature_aa64_tgran4(id));
-}
-
-static inline bool isar_feature_aa64_tgran16_2(const ARMISARegisters *id)
-{
-    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16_2);
-    return t >= 2 || (t == 0 && isar_feature_aa64_tgran16(id));
-}
-
-static inline bool isar_feature_aa64_tgran64_2(const ARMISARegisters *id)
-{
-    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN64_2);
-    return t >= 2 || (t == 0 && isar_feature_aa64_tgran64(id));
-}
-
-static inline bool isar_feature_aa64_fgt(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, FGT) != 0;
-}
-
 static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, DIT) != 0;
-- 
2.34.1


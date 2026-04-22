Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825F9F9B608
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 10:13:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFUYj-0007Ly-I1; Wed, 22 Apr 2026 06:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXp-0006sD-Hp
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:57 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXn-0000lf-Ch
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:57 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43fea39e066so4191941f8f.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 03:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776852654; x=1777457454; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qLD556mwBZN0FOjv6jT/HPan7Y0S6BW5g1K/GkaPB6k=;
 b=KjbfbogYcpf6qTcdklRrYvxYzMDzZxBy07M1RxngPW9F78pS7pAw1Y6Dv9CuEjt37+
 AmJ0N11HxBPJW7c8UXEYNnfDsJPCgF9o8tAggz3vZjES9jYwfHEr8czGowpwhfbnPWxm
 bL6Mjh9lDCvnNVLJmF5uQKoUj/tMjPdHsrm3KocdU1cBpLJ9TzydMZPc+HQEKwYgdtSP
 kwNLM+U3aB6svBNytnAlL2H2TzC/IRLvurHi6is4fuV66KUDc9N558OTrTpMH9yxfGSY
 P1ftnXdUgG3M0cygiFra2/Y3g1GGZfscYexM/fyCkB1khmbQZVvFwzG70i1vlrEsB+q+
 RWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776852654; x=1777457454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qLD556mwBZN0FOjv6jT/HPan7Y0S6BW5g1K/GkaPB6k=;
 b=c+07+f9tz5K5hCu0cp0ULLLUS+dNv1hzV2k+xAWa3yXHKF9hldVq6IHsyezbMA8XCM
 38xwwxorcf8OEOFvPM+QPon2DUz/AbfcgrTOEWMVnH2FgryOEaCSj0dYjYJAubcwvoMY
 XI9Idw9k7Dn2yIPfjt8CnWkMqU6CqYvvmXgQYxJjLPY3/mQ5HQtmBmW0UMpYse4tgQjW
 h8UPrHrJ5gvNaD7QsO2CX0Znhu0Somk6st2fY7QODY7hlGGGZBEuT9c0WJqOpY/LL8qt
 r6kVd6Tc7anolIXbBqEbiFJhch7SGjc6dlxdWPTagkzqTyAueIgbot3+25EiKWK2aoYk
 +o0Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/oWIadFp8+zyhFCwvaLa0jt58LdBOaBddHX3XSCO+AyQ7xFfOb5D6RRhXYpG/xNKf0W/z2A/LwWA==@nongnu.org
X-Gm-Message-State: AOJu0YyGe6AmQVb69Odzn1qpumTFoqz3PssF/VruciP93brSTZJbrEnb
 xwe4GAh5X2ceNqLhkH7865/tyQubjJg0IZYbr5rcqTzNuo+udqcyjB9GLd+SDCKRQhY=
X-Gm-Gg: AeBDietwHF1a+tOXTyp+sAwyes6iWQgk03bJe0fPcVumEqn+i09AP7rrgApvclaxveR
 ZjmFsWiCemUEVYg9qEjomJhv06YJV9EYVOhaf9IUrCUwzEZidVPNIPNwOvslu8iAZQyqfxvlE2G
 nVhUZFBK0M4d/Qy4nP/ZcwUGNUNLJnO+ASbhojEjOIyHxmr0CjWc1CBA5Gwo6+jwzbdJcAtQbTn
 LQoYxypUtbhBumSytc0K7qoz5e8ZUwKS7kbNbb1740SABcTaMckMRO3yi4XKyQRe8ehwO/ahDyM
 7kJ7NJHjq7dfXicBSQWKkXdLJnluKCcPlY498K/eA6Xm+ZCUrxS8juNgfWuXlOaKzQntdUVM6gn
 mZOMhnVVdyhiL1Sfnzg0k9SwkPVYeJ8qWOHjQm6WDS3888Xd80JNkSdAF6pjLhSNyucryz2d6kT
 3lrYvKJRMPlu9T52n4Ot7baPvAx7KqD5R3aQ==
X-Received: by 2002:a05:6000:186c:b0:43e:a703:3665 with SMTP id
 ffacd0b85a97d-43fe3e0c6femr33085614f8f.25.1776852653594; 
 Wed, 22 Apr 2026 03:10:53 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb1405sm44247250f8f.4.2026.04.22.03.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 03:10:52 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7475C60F3D;
 Wed, 22 Apr 2026 11:10:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 13/31] target/arm: migrate gcs syndromes to registerfields
Date: Wed, 22 Apr 2026 11:10:24 +0100
Message-ID: <20260422101043.1234229-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422101043.1234229-1-alex.bennee@linaro.org>
References: <20260422101043.1234229-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Tweak arg names to make it clear raddr is the data address register
number.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - rename ra->raddr to document things.
---
 target/arm/syndrome.h | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 65d0de63a83..7ff8c30e2bb 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -690,21 +690,48 @@ static inline uint32_t syn_pcalignment(void)
     return res;
 }
 
+/*
+ * ISS encoding for a GCS exception
+ *
+ * Field validity depends on EXTYPE
+ */
+FIELD(GCS_ISS, IT, 0, 5)
+FIELD(GCS_ISS, RN, 5, 5) /* only for non EXLOCK exceptions */
+FIELD(GCS_ISS, RADDR, 10, 5) /* only for GCSSTR/GCSSTTR traps */
+FIELD(GCS_ISS, EXTYPE, 20, 4)
+
 static inline uint32_t syn_gcs_data_check(GCSInstructionType it, int rn)
 {
-    return ((EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL |
-            (GCS_ET_DataCheck << 20) | (rn << 5) | it);
+    uint32_t res = syn_set_ec(0, EC_GCS);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, GCS_ISS, EXTYPE, GCS_ET_DataCheck);
+    res = FIELD_DP32(res, GCS_ISS, RN, rn);
+    res = FIELD_DP32(res, GCS_ISS, IT, it);
+
+    return res;
 }
 
 static inline uint32_t syn_gcs_exlock(void)
 {
-    return (EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL | (GCS_ET_EXLOCK << 20);
+    uint32_t res = syn_set_ec(0, EC_GCS);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, GCS_ISS, EXTYPE, GCS_ET_EXLOCK);
+
+    return res;
 }
 
-static inline uint32_t syn_gcs_gcsstr(int ra, int rn)
+static inline uint32_t syn_gcs_gcsstr(int raddr, int rn)
 {
-    return ((EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL |
-            (GCS_ET_GCSSTR_GCSSTTR << 20) | (ra << 10) | (rn << 5));
+    uint32_t res = syn_set_ec(0, EC_GCS);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, GCS_ISS, EXTYPE, GCS_ET_GCSSTR_GCSSTTR);
+    res = FIELD_DP32(res, GCS_ISS, RADDR, raddr);
+    res = FIELD_DP32(res, GCS_ISS, RN, rn);
+
+    return res;
 }
 
 static inline uint32_t syn_serror(uint32_t extra)
-- 
2.47.3



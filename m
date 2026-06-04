Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC43CD6E6E
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:50:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHo8-0006dV-Au; Thu, 04 Jun 2026 19:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo5-0006bN-6r
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:01 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo0-0007qc-Vy
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:48:59 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2c0c35980fdso13112655ad.2
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616935; x=1781221735; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SCXUMTjg9OeuHT4T5XcE5EzNk2J0W4LheW0f85VqoHQ=;
 b=qPTGU/C1J/RyOGU2yMA+w9eR5AeR5LzgL+GRpW3BCitXbrwRbi5RgSK9miQ9VflW3O
 aLDQ3U525ArlzC/hiV/OgoLe/ClTwxL8E6VMKJNJbjb2rrTjudQK7vuNUue5TCbvZ6a7
 sMobeHiG4vBlVNgLVzpDudxkErJZftRaTBjbWNVI+Z3i4c6I8dSdwgIaApCdPiG06q0n
 BNJYADn+yDzXyPmSp+vRC9mVQnZ1gB9a9+TPQ6U/oZZCxOG0mvOS063myvi5Hau+VTiu
 WqKKzxw7zYaeveHLwHTeP7CldS1U4RpFgvnaJTSJ6YMXWVnc3M7RX2XoDvwKKKRR/Wba
 t8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616935; x=1781221735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SCXUMTjg9OeuHT4T5XcE5EzNk2J0W4LheW0f85VqoHQ=;
 b=NkFSoB7Pjh7cWYGODK0mg6W4M0Z7+iyavsqo/qP6tgI76drCZqI9HGgxDuYMT0rafR
 kWq9CNI3HpLU6Z+MrBaijmi7txR5OtD0cb/DdnOa35QpU8xaHMcVWeNryzOoX/Cs6eRh
 ukV1ecUP1gJg94GHXw6RlJJcLylJXvbRDT+WwAfwUuumYtF2UOMPsnuOCWsp9pGTfSQy
 1wnDSSHnK81tDdDzdVeH2Ajp6q2NidzNgsWc0O7a4uWHhzaD1Txwn+q6DpowWtMcmJdR
 RSYsL5AL22teiY9FmcjOZXzMFBCujEzaNFit2bKM2LI86U0AhnWxu8sO7ujOyLp+/p4O
 xlgQ==
X-Gm-Message-State: AOJu0YxmkMPJ2K9WVB5VkMI1GH3E69ffao2gdcANYOui0aD1fjMq2GaR
 VSF/txNVsAA8GS+JA88Z+egd6pfOWwuEnAJ9JYgCCCqTG7Zfxmk/8qTcjPuGD+1mIahbtId1QdV
 PzXlgeSk=
X-Gm-Gg: Acq92OENH5skuEVCPSm57Ju2WN42E7+sOgUdrcFDWvDaf8obiiBB5+G1cQqz2Y3bEYj
 nN++ss/kznAZ19k7a/TERy+EScMyL2/oqgJ2SyOv4VltRV0Jzkcd6UqSW4mfMGJEAPZLX+tw4bN
 2GN2JsXG+LrkTrhJyqXBiUaH3LgkslUT/yPTQmH5c+sUmgMZkfz9sOzko303EBeSeIq+gSJNlaQ
 aBUrRBLvQA2IBvumm/CgMmDuA0CsEl+HbdhA66LIBN3IXtQB8f2iJLFpUP5e6vLuvQ0jOwqcFF1
 Yh9lpYWXqD3760o79Vij7evaW4GbKq1A4PLQjDgeSUS5c1YzDBCbnBRCTpuuHdu8o9pIIRXgB4i
 WkCf/weyy2x7G6jgbq8fOIqRP0lNxb1K2ZhHc+MGu7T/ngk+lBR5e6DIBGp+gQZ5FdWpa7BSc6I
 /EKWU7TclEMjgJQnLOnAgnNvWIh2DA2AcJCaLxH0/T/rpOJSyqQw==
X-Received: by 2002:a17:902:f549:b0:2c0:b319:fb43 with SMTP id
 d9443c01a7336-2c1e849530dmr6889245ad.21.1780616934944; 
 Thu, 04 Jun 2026 16:48:54 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:48:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/25] target/arm: Add feature predicates for SVE2.2 and SME2.2
Date: Thu,  4 Jun 2026 16:48:28 -0700
Message-ID: <20260604234852.573178-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
References: <20260604234852.573178-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 5a14507682..49c8606809 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1501,7 +1501,12 @@ static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
 
 static inline bool isar_feature_aa64_sve2p1(const ARMISARegisters *id)
 {
-    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SVEVER) >=2;
+    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SVEVER) >= 2;
+}
+
+static inline bool isar_feature_aa64_sve2p2(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SVEVER) >= 3;
 }
 
 static inline bool isar_feature_aa64_sve2_aes(const ARMISARegisters *id)
@@ -1610,6 +1615,11 @@ static inline bool isar_feature_aa64_sme2p1(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SMEVER) >= 2;
 }
 
+static inline bool isar_feature_aa64_sme2p2(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SMEVER) >= 3;
+}
+
 static inline bool isar_feature_aa64_f8cvt(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8CVT);
@@ -1673,6 +1683,11 @@ static inline bool isar_feature_aa64_sme2p1_or_sve2p1(const ARMISARegisters *id)
     return isar_feature_aa64_sme2p1(id) || isar_feature_aa64_sve2p1(id);
 }
 
+static inline bool isar_feature_aa64_sme2p2_or_sve2p2(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2p2(id) || isar_feature_aa64_sve2p2(id);
+}
+
 static inline bool isar_feature_aa64_sme2_i16i64(const ARMISARegisters *id)
 {
     return isar_feature_aa64_sme2(id) && isar_feature_aa64_sme_i16i64(id);
-- 
2.43.0



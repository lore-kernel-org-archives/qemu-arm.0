Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B59FF9B609
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 10:12:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFUXn-0006rF-MS; Wed, 22 Apr 2026 06:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXh-0006oM-Ua
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:51 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXf-0000hk-OY
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:49 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so17267765e9.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 03:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776852646; x=1777457446; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SFHYYol3fQLtpVQaYQnNjnL8iJcFReh9WH604Hh8s60=;
 b=Qp3iL1rBjv7GAXds3xNF58e1E92dkHl8e11CE67ccsvj4ymUiZYhlJ8nmU+sfh66yT
 VDctwdkU8XxfyqjQ46y0e5x6OC9BKoNG50J10CdlUYHhufwsTg2pNHa7FzVD5Xekxg2K
 4CvOTVLB8d3GYANwnOI9uDqxqFLfrkHKVtHJbdNbf7trAeMrRZAKlvTd6YTAaChLM+VA
 /QPk5pD0KwCpvPek2M3mUWSJynJuqmLUmrVv3+HFW12GrZ6IEWERe19J/Tl8ajU3wegb
 f2z7UYgyX0XItap0kgnbOszzhZTuPHf8iZnWqD4NYnLg9y5UU65BZa5Nk4R0SW64Xbx6
 kW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776852646; x=1777457446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SFHYYol3fQLtpVQaYQnNjnL8iJcFReh9WH604Hh8s60=;
 b=Ep+aMY+REWbgjL7Mt5V8KNYQdopfFzRqc+ccTpWKCcGxkF5kcz8/dr6Sm7WvrBnI0B
 9zsEIe20Cv7fi5VoQQPjRrPqeILQThr4+52uGuBmWWjxs2hEVXDlL5+SOc2CtmaKtAeh
 Z3WxJzrxHEBV3CAwljhCrsK2E4gy87sgAQAvOPi6pf6AAqpsB/r2TxD4QmLuKg1E4zHz
 muXBq+Cm0Y+DYK8ymC/y+uQ1HI026j5zTlcJG7XHnv5t3p6asHyOCVmHmxifP9zXgB4d
 pi7xzvOf9Z9+qK/MviAgG+JOl4pGr3wUqOxqyIBrzS2HiThOZquVK28Ba3ytff8mZfzG
 8QcA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Avd6zecACZv/ZG6yGxTs4COv1Rovh56fQqFJ+YzRI4EhBhDMapyK8aTC+qbWkVkWdLMuhs7GJgQ==@nongnu.org
X-Gm-Message-State: AOJu0YzodADPPSTWGUcCfh4w263duRV5kvUdFQpxPjmS5TUmUw5MnM8F
 cxh7KMPIc3ugnvpnyd/8RcV0oA1jcYlH1ZvOhKzg+rmpS0iFdgNsqRKA9M7+AQnL7VA=
X-Gm-Gg: AeBDieswH5TkBXXZF7udb4RwTsFWheZ0D4suCGlojdzaCt7mpAbf+ffkHgJrFwjR3Ve
 Obojm00Sw1kyFJyhYGar+rEwnWDM5pi2/y0casPrkchBLPcjxK89CumD6pwyuV2/yuvyZrmI2lE
 6ci3JzM2btbsz1DsTpfAhjxIKbVvIzIIRsv6qmDd1Ck67sqamLXoDJn/4Etr6uFwvwLO8Omupzp
 /CvKIVqG+xeacyLvNtLFNC66qqrltc2YsqgX7eLqCH9MKCgcqT/AsHx7ZT6JFYVxoaSEcypas8X
 N1xumsQ2skXCzA/2ZVwtWBVfLZy7zPT7L4/9wXjwYjRLGilo1aSLh4brOjGwUbe+/3eJoHuqkzO
 XQt5wH74nOXZtllFOFNYgB3LIqgaSHfBJGFzqhYqJuoQ7Wyy50c+CB4ScdGAXjMJtK9Hu0J1uOq
 xkEXyY07YX9NmMFgypTrPQC6Uog3idIcvh5A==
X-Received: by 2002:a05:600c:a103:b0:48a:58e1:6d17 with SMTP id
 5b1f17b1804b1-48a58e16ee0mr46804155e9.20.1776852645643; 
 Wed, 22 Apr 2026 03:10:45 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1cfbf2sm452139945e9.15.2026.04.22.03.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 03:10:44 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 835395F941;
 Wed, 22 Apr 2026 11:10:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 01/31] target/arm: migrate basic syndrome helpers to
 registerfields
Date: Wed, 22 Apr 2026 11:10:12 +0100
Message-ID: <20260422101043.1234229-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422101043.1234229-1-alex.bennee@linaro.org>
References: <20260422101043.1234229-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

We have a registerfields interface which we can use for defining
fields alongside helpers to access them. Define the basic syndrome
layout and convert the helpers that take the imm16 data directly.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 75 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 57 insertions(+), 18 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index bff61f052cc..517fb2368bc 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -25,7 +25,7 @@
 #ifndef TARGET_ARM_SYNDROME_H
 #define TARGET_ARM_SYNDROME_H
 
-#include "qemu/bitops.h"
+#include "hw/core/registerfields.h"
 
 /* Valid Syndrome Register EC field values */
 enum arm_exception_class {
@@ -76,6 +76,11 @@ enum arm_exception_class {
     EC_AA64_BKPT              = 0x3c,
 };
 
+/* Generic syndrome encoding layout for HSR and lower 32 bits of ESR_EL2 */
+FIELD(SYNDROME, EC, 26, 6)
+FIELD(SYNDROME, IL, 25, 1)
+FIELD(SYNDROME, ISS, 0, 25)
+
 typedef enum {
     SME_ET_AccessTrap,
     SME_ET_Streaming,
@@ -113,12 +118,12 @@ typedef enum {
 
 static inline uint32_t syn_get_ec(uint32_t syn)
 {
-    return syn >> ARM_EL_EC_SHIFT;
+    return FIELD_EX32(syn, SYNDROME, EC);
 }
 
 static inline uint32_t syn_set_ec(uint32_t syn, uint32_t ec)
 {
-    return deposit32(syn, ARM_EL_EC_SHIFT, ARM_EL_EC_LENGTH, ec);
+    return FIELD_DP32(syn, SYNDROME, EC, ec);
 }
 
 /*
@@ -133,49 +138,74 @@ static inline uint32_t syn_set_ec(uint32_t syn, uint32_t ec)
  */
 static inline uint32_t syn_uncategorized(void)
 {
-    return (EC_UNCATEGORIZED << ARM_EL_EC_SHIFT) | ARM_EL_IL;
+    uint32_t res = syn_set_ec(0, EC_UNCATEGORIZED);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    return res;
 }
 
+FIELD(ISS_IMM16, IMM16, 0, 16)
+
 static inline uint32_t syn_aa64_svc(uint32_t imm16)
 {
-    return (EC_AA64_SVC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
+    uint32_t res = syn_set_ec(0, EC_AA64_SVC);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    res = FIELD_DP32(res, ISS_IMM16, IMM16, imm16);
+    return res;
 }
 
 static inline uint32_t syn_aa64_hvc(uint32_t imm16)
 {
-    return (EC_AA64_HVC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
+    uint32_t res = syn_set_ec(0, EC_AA64_HVC);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    res = FIELD_DP32(res, ISS_IMM16, IMM16, imm16);
+    return res;
 }
 
 static inline uint32_t syn_aa64_smc(uint32_t imm16)
 {
-    return (EC_AA64_SMC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
+    uint32_t res = syn_set_ec(0, EC_AA64_SMC);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    res = FIELD_DP32(res, ISS_IMM16, IMM16, imm16);
+    return res;
 }
 
 static inline uint32_t syn_aa32_svc(uint32_t imm16, bool is_16bit)
 {
-    return (EC_AA32_SVC << ARM_EL_EC_SHIFT) | (imm16 & 0xffff)
-        | (is_16bit ? 0 : ARM_EL_IL);
+    uint32_t res = syn_set_ec(0, EC_AA32_SVC);
+    res = FIELD_DP32(res, SYNDROME, IL, is_16bit ? 0 : 1);
+    res = FIELD_DP32(res, ISS_IMM16, IMM16, imm16);
+    return res;
 }
 
 static inline uint32_t syn_aa32_hvc(uint32_t imm16)
 {
-    return (EC_AA32_HVC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
+    uint32_t res = syn_set_ec(0, EC_AA32_HVC);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    res = FIELD_DP32(res, ISS_IMM16, IMM16, imm16);
+    return res;
 }
 
 static inline uint32_t syn_aa32_smc(void)
 {
-    return (EC_AA32_SMC << ARM_EL_EC_SHIFT) | ARM_EL_IL;
+    uint32_t res = syn_set_ec(0, EC_AA32_SMC);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    return res;
 }
 
 static inline uint32_t syn_aa64_bkpt(uint32_t imm16)
 {
-    return (EC_AA64_BKPT << ARM_EL_EC_SHIFT) | ARM_EL_IL | (imm16 & 0xffff);
+    uint32_t res = syn_set_ec(0, EC_AA64_BKPT);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    res = FIELD_DP32(res, ISS_IMM16, IMM16, imm16);
+    return res;
 }
 
 static inline uint32_t syn_aa32_bkpt(uint32_t imm16, bool is_16bit)
 {
-    return (EC_AA32_BKPT << ARM_EL_EC_SHIFT) | (imm16 & 0xffff)
-        | (is_16bit ? 0 : ARM_EL_IL);
+    uint32_t res = syn_set_ec(0, EC_AA32_BKPT);
+    res = FIELD_DP32(res, SYNDROME, IL, is_16bit ? 0 : 1);
+    res = FIELD_DP32(res, ISS_IMM16, IMM16, imm16);
+    return res;
 }
 
 static inline uint32_t syn_aa64_sysregtrap(int op0, int op1, int op2,
@@ -246,7 +276,9 @@ static inline uint32_t syn_simd_access_trap(int cv, int cond, bool is_16bit)
 
 static inline uint32_t syn_sve_access_trap(void)
 {
-    return (EC_SVEACCESSTRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL;
+    uint32_t res = syn_set_ec(0, EC_SVEACCESSTRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    return res;
 }
 
 /*
@@ -361,12 +393,16 @@ static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
 
 static inline uint32_t syn_illegalstate(void)
 {
-    return (EC_ILLEGALSTATE << ARM_EL_EC_SHIFT) | ARM_EL_IL;
+    uint32_t res = syn_set_ec(0, EC_ILLEGALSTATE);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    return res;
 }
 
 static inline uint32_t syn_pcalignment(void)
 {
-    return (EC_PCALIGNMENT << ARM_EL_EC_SHIFT) | ARM_EL_IL;
+    uint32_t res = syn_set_ec(0, EC_PCALIGNMENT);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    return res;
 }
 
 static inline uint32_t syn_gcs_data_check(GCSInstructionType it, int rn)
@@ -388,7 +424,10 @@ static inline uint32_t syn_gcs_gcsstr(int ra, int rn)
 
 static inline uint32_t syn_serror(uint32_t extra)
 {
-    return (EC_SERROR << ARM_EL_EC_SHIFT) | ARM_EL_IL | extra;
+    uint32_t res = syn_set_ec(0, EC_SERROR);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    res = FIELD_DP32(res, SYNDROME, ISS, extra);
+    return res;
 }
 
 static inline uint32_t syn_mop(bool is_set, bool is_setg, int options,
-- 
2.47.3



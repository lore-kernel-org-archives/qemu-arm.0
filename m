Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52289CA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:12:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4dD-0006R4-D2; Tue, 26 Aug 2025 21:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4cZ-0004g4-I8
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:06:40 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4cR-0007MB-2Y
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:06:39 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-771e1e64fbbso3798818b3a.3
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756256769; x=1756861569; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDTC5pLbdDnYIIvrL8eH2HVsR8F9S2tn86RGWAaaihc=;
 b=aRfxc9g8AWNdyD5xFbHJhG8iaPjCqLTGNlQ3hkJ27+DdjNndBk32TuWjlSgScZ4uVs
 8/m52n98+hvLUwtfLWyFeL9xr7F31wqnEGvWNsbVgqcTktKnq0qDctwUiiZPdhPI/2cF
 6SK01RmJdFmsMK17yOyccP587bs++C81iStOIUgaIwSDcjWH7VyZWCd+lTrJOQ8Uay+9
 JulM1QpVHbO2FhrVxQiQCARHAq8u6NBl9LCFrrmQP+lxBuaagUIvq/SlGV/A40wvLog0
 1NwfonfupWP2/AlslImFIBlln88LQDCOiVH2ijmdBIdXcPKBuJhW80wSuEwn+QcMIzoZ
 Mhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256769; x=1756861569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NDTC5pLbdDnYIIvrL8eH2HVsR8F9S2tn86RGWAaaihc=;
 b=ongZoJP1SbyXtMvRfGB4GGdBJKhg70diaFu1NtGvaDZqfHpzhF/LqjgT7yx+NQrEhU
 WxwCFqrH7ci/1oY1hYIkzj8WY3abwr9SAgln7YVA9+pzpigg/WCIufXA2Ie7Gg+Y0gow
 qrUk6JYoKK4LaIc9uX1Aykn96GFlfb2QJj/L0BqebW65mjqZArMUQGs+bc7tvDeErD0S
 WQxwd7+DSvF1PeE9tKMIuvqVAiCzyvD7+SlHSGA3DXVA8l9E+Ebd7PROTl0gfNjQhi+h
 BFdWI6wjo6XMv1ejyfn1o1FVvTBZqhWSGFrc6Ya6Tf+ECQfP8tbz8TliE3Y0six87dsU
 oOCQ==
X-Gm-Message-State: AOJu0YzjDcvjQ6IuCXwpP9dHgH9TfPiLrH4WiB0TKkBalrxLfxfRusPF
 1xBsUh2kWEHNK2mAG5DPkj4RFKTWHJdCfOt71ZNLkw+PJhJAZ/s8euvz490U6VHz83w=
X-Gm-Gg: ASbGncuILR+7Gs3ssWHQv2Laotivu/cd1zCSKbZsyEtPOwIKB54lhwJPLoRYQWKVHoT
 THNkjAtXspE4+uGYEktZZk/fbhZYHlQbSofVCoWCNREzXkZ5HFWOay4GYnsvmed4c42McWz9naf
 EvZFeXwWjejstQS7kyvO8cQbf9AVVnn6mKk9Ivn7TFWxHnyRRVg6Sowa7ZceaMfNiZ6P/nBhql8
 TZmKOQDw9PLfH3/om/poffhTBQ8KjvXlMU6QaUqp4uZ4bndP2BLaqfjMErJ8B5NyRQgy694cYW6
 Oj2jhqsR4D1HPSay18a4p57SPQSaRlz8WZkttMmnRlAd0p8cNsehch7028GTxGFiND0C9LhJGL5
 Z/z89sLKyogni8ZsWuMnnw2GUqQ==
X-Google-Smtp-Source: AGHT+IH7g1WRL4BCFzaqXmyIoqYOZZYJWCd3K/Y7pVX8nsg2SuZYl6ShNcVSfwZbVtijizCcE0AqSg==
X-Received: by 2002:a05:6a00:3695:b0:76e:885a:c3ec with SMTP id
 d2e1a72fcca58-7702fc0aa85mr24528675b3a.32.1756256768528; 
 Tue, 26 Aug 2025 18:06:08 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720274534esm1419241b3a.47.2025.08.26.18.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:06:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 11/61] target/arm: Rename all ARMCPRegInfo from opaque to ri
Date: Wed, 27 Aug 2025 11:04:02 +1000
Message-ID: <20250827010453.4059782-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

These pointers are no opaque, they have a specific type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 10 +++++-----
 target/arm/helper.c |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index c9506aa6d5..3344a02bd3 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -841,15 +841,15 @@ typedef struct ARMCPRegInfo ARMCPRegInfo;
  * Access functions for coprocessor registers. These cannot fail and
  * may not raise exceptions.
  */
-typedef uint64_t CPReadFn(CPUARMState *env, const ARMCPRegInfo *opaque);
-typedef void CPWriteFn(CPUARMState *env, const ARMCPRegInfo *opaque,
+typedef uint64_t CPReadFn(CPUARMState *env, const ARMCPRegInfo *ri);
+typedef void CPWriteFn(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value);
 /* Access permission check functions for coprocessor registers. */
 typedef CPAccessResult CPAccessFn(CPUARMState *env,
-                                  const ARMCPRegInfo *opaque,
+                                  const ARMCPRegInfo *ri,
                                   bool isread);
 /* Hook function for register reset */
-typedef void CPResetFn(CPUARMState *env, const ARMCPRegInfo *opaque);
+typedef void CPResetFn(CPUARMState *env, const ARMCPRegInfo *ri);
 
 #define CP_ANY 0xff
 
@@ -1075,7 +1075,7 @@ void raw_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value);
  * CPResetFn that does nothing, for use if no reset is required even
  * if fieldoffset is non zero.
  */
-void arm_cp_reset_ignore(CPUARMState *env, const ARMCPRegInfo *opaque);
+void arm_cp_reset_ignore(CPUARMState *env, const ARMCPRegInfo *ri);
 
 /*
  * Return true if this reginfo struct's field in the cpu state struct
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d230f9e766..e03cbc0394 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1067,7 +1067,7 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
       .resetvalue = 0 },
 };
 
-static void arm_gt_cntfrq_reset(CPUARMState *env, const ARMCPRegInfo *opaque)
+static void arm_gt_cntfrq_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     ARMCPU *cpu = env_archcpu(env);
 
@@ -5407,7 +5407,7 @@ static const ARMCPRegInfo rndr_reginfo[] = {
       .access = PL0_R, .readfn = rndr_readfn },
 };
 
-static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaque,
+static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *ri,
                           uint64_t value)
 {
 #ifdef CONFIG_TCG
@@ -7730,7 +7730,7 @@ uint64_t arm_cp_read_zero(CPUARMState *env, const ARMCPRegInfo *ri)
     return 0;
 }
 
-void arm_cp_reset_ignore(CPUARMState *env, const ARMCPRegInfo *opaque)
+void arm_cp_reset_ignore(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     /* Helper coprocessor reset function for do-nothing-on-reset registers */
 }
-- 
2.43.0



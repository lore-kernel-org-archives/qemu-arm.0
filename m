Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BCECD5BAA
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:28:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlc6-00041B-8m; Wed, 20 May 2026 14:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlc2-0003mp-Op
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:25:46 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlc0-0001xd-Vm
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:25:46 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-368f25ff4c4so2747785a91.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301543; x=1779906343; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QG3SAWZXTLSfeqfkLdTcj+WQldu34LGY3+/Bb5YVXA=;
 b=RhopY10aq53B7JpUgCs+vsL1KcFRPFWEoJU5nyN3A69RFIyLreWYREViu4b4V/Mz8e
 YxYg5ouc2m3xN76eHxhEAxHF95yXn42hsVghhLUwVMEHW2RHZN+mRUmTqvtPShfgRomT
 YbOPcmwh5FJVZVxGQY60iSZ9l4yGXKu0Jn63LLIMe+6bSQBAk5KsSeeqbxP8WimTrJke
 P155gUe8FTqFfz9xmgbSdyNs+cC1p/dKronRraW9Jgf8R8prAa6szEpdKIvd2kR4T+6r
 baLXwwcESmxUcB8CExVQHRWPm9sCVfVwkJl9wwvfv5adebzrHU43o2C9ysFF2jTI9g+c
 zjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301543; x=1779906343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7QG3SAWZXTLSfeqfkLdTcj+WQldu34LGY3+/Bb5YVXA=;
 b=OS7nJWBwuwGIr5y1J3MxIxTqvxd6BojjdXZoin2NO4pMebxzfh1XoyMGk9jGFAkQb0
 uu///mAC7c3025dr/CuEEERDHShejdAQstBKQ0jwde+YUIpWrnbZM61SceBAQPfk5xZ9
 w5/XFF3eW7deVi3MpPFFDOODQD/ffU1ejkPWGuGkYqlLLp/UD/xeCKi6+zx3uoqasFSF
 /JJ9IdljEdun5Dfco3GCjW0F0U0Hc+r1uMd4Qi30VUQCfWtfRCFle5VyiAQ/1dojNTq/
 ig9glIwUUhOEi6sJ160YtrzmjR6UTa89jQ2XMY21jeiorGzbAYWN3zM9wHY4HNWrEub2
 OONQ==
X-Gm-Message-State: AOJu0Ywfd8wei+0kohLS/tOhYjwZ8m1jwDNnkC5aPxZ0FS8WoLvplsfs
 5E+At1gqIHWh4yIb3o1XY/l0DUgU7hgOkygGuOB0J/qjS5J9D73vrekLvBZn4h1x1AW8hXT5ym8
 CoGvhzvk=
X-Gm-Gg: Acq92OHqIAIF5Pv2S1mDajTVKSxWUP/YM+4lFmjRH6FBSgVWs7Bf+tzqsGsuV0wbzUW
 ZazxiB7KedhnO2u+tphK3g/YEwAh7Q0ZSlroAZbGk+XqtKGnI34QBMOtDisRSNBsCvMGYtKyMXE
 /EjbzN1OT+5k+y3lDIL89TaQsCqChJFBeAvbMBAXbU8B9qb4t+4fJ386AI9weBGzsNnuRzbA2Zi
 ey8RfvtghEpzBbWi3GK2sHmRVxPfvAUtwRB3t5GNemI399pCdSVaFWHnqIolx6wHzhS+u9jhXxz
 /yEER9yFc26nrkR6aEPR3iOVInPgQZTvgQUG/Q1A1inJeK2mdhz/dDa/yDxYrdE2pZe0pXxkbJF
 dSdVzyYZEnJJYa9lUKNET5jdUOSXG73+V+bohWRaPqv08FEdhmJpQ+86jhsKQ6YiiD2A0x41U2V
 RSnh4rPeJMUpN2GlBstTuaZzMDQ/VLeh6T1JRKb6s=
X-Received: by 2002:a17:90b:3845:b0:366:16d1:6a26 with SMTP id
 98e67ed59e1d1-369518b00c0mr25198534a91.5.1779301543345; 
 Wed, 20 May 2026 11:25:43 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c0605ddsm217413925ad.32.2026.05.20.11.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:25:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 40/64] target/arm: Enable FEAT_LUT for -cpu max
Date: Wed, 20 May 2026 11:21:49 -0700
Message-ID: <20260520182213.872945-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index a377f67b9c..bc866c5a67 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1263,6 +1263,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);       /* FEAT_HBC */
     t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
     t = FIELD_DP64(t, ID_AA64ISAR2, CSSC, 1);     /* FEAT_CSSC */
+    t = FIELD_DP64(t, ID_AA64ISAR2, LUT, 1);      /* FEAT_LUT */
     t = FIELD_DP64(t, ID_AA64ISAR2, ATS1A, 1);    /* FEAT_ATS1A */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 44c7196d09..cf8771d541 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -101,6 +101,7 @@ the following architecture extensions:
 - FEAT_LSE (Large System Extensions)
 - FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LSE128 (128-bit Atomics)
+- FEAT_LUT (Lookup table instructions with 2-bit and 4-bit indices)
 - FEAT_LVA (Large Virtual Address space)
 - FEAT_MEC (Memory Encryption Contexts)
 
-- 
2.43.0



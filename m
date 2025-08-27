Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF591CA0FF9
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:20:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4hc-0001RK-Sg; Tue, 26 Aug 2025 21:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hM-0000vp-4m
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:38 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4h8-000059-JT
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:35 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-770530175b2so2644799b3a.3
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257079; x=1756861879; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cJsmimIu7dr8vrnk5jz0WzsneJPGwlTRlLHJVKFaYTw=;
 b=Qm2txHIuIQf8apYKLwjFsVJQzO3NNkF4JxVDXPi1QA0AaxMm6e7Y5VqR0Vgn0FYC4E
 x7HmIdWMHbscvzPO/Fwf1U9n/4SNYCyw+4Ez8MiLEwTvKADda2gMcYl6Uo6txC0kjzqN
 YiAsay1kgH1eVwi5S99SjrhopRLRLhyFPg3wvRslRND6Z3XHnBqw+Ji6EEOPFlyPUAX4
 QXuyZgTe9M8vI0I9ygUmHonJtXwe7CEIbrlA0dIcaxTeEiw2IsI1YwB/SBgvcZ2becoR
 VgkvvL52ZTF2R+ot/vAb1Uh0x/qmtsiDxOsXRaCHFX6QGAfxZV4wxVzAN/66V3kDLI1Y
 q1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257079; x=1756861879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cJsmimIu7dr8vrnk5jz0WzsneJPGwlTRlLHJVKFaYTw=;
 b=ExuIl6lvriIBj0ntghAh7/KUyiJnytCBxkqCuYBJWWYNiZ1Ar9HBELR7DS7Uq/wnjJ
 O5qhEbD4v3ieMu2rZQmOMqx2+A/+uMTt7Bdsjz9/MeebOl7YAkET1svMZ6hDTZBBCcvz
 W4XRl2yU6SnoDCY7Q2qVOv6KRuMSfKSqC3qR1h04tyQNtlx4R0sLzs8AR+5mpuRAG32V
 OXS+t8G4yK0WfPQfgpyJDz6/BZuPVaGgIJ+JG6C9BieILClOTuVPjo/TCGyLCOGvZg8r
 nG64d2n39NNUQp45BSQorE1vVBUhUlB3L2R/Dno00OEr0PxNPbHAHYTsiCzeTjeYyJkK
 NB3g==
X-Gm-Message-State: AOJu0Yx4/o+tJc+dt5D7ccbCmjZJHBNR72NY+vhhAfOgD6X8QDKaRfOK
 zViwhgEv/8GQTaQtEqRnY0R/L0TmqHcNw9v2WqnNt0aCBZ95syr6zY7m1JsIsPrzoELt7olZo6E
 XQGOSu9g=
X-Gm-Gg: ASbGncuMoq6QyqR5P3VdqM4qo6KkE3SZT5iOgZIOh9S1/Wlue3TUQ0wd3nh2ijfWWkt
 Jg/C5EExCQum3RAJDO1caZzBXRv/STIhHsqEVIHwskfJumas+xLFWJw8pZWEFIFSw6etZW+uoro
 qtUaJf7ao6ESW4kLqq5TgIveJKtDfHJPOIiPb0O9vLZJ6/d1Wc4SwdkKllZookKrTEh0XRGMnZE
 1llNnjYjUOgjgco3pA0aZAQkszSuYmU3H5zMOe9vXdjJX/ZtxeLrnJDoIVg5hQZYonkBwfb79wT
 j4NOpbRhAD0ItJSLDgN0pD9Ujcmvf5H9RXVvwpj1FoC6NtBCtGE3O1f2N37p9FVCeDAnRVh2k42
 0qdSSgQ4k/lUt1/DTPSm5MzKvUw==
X-Google-Smtp-Source: AGHT+IFpXbvERlfbH8lvKcHAfFXSL4ExLtBeFodIJh4MsP6k+QtpbALQRkDzzg5W1v7tBAq69RB3pA==
X-Received: by 2002:a05:6a21:9997:b0:243:78a:8270 with SMTP id
 adf61e73a8af0-24340e1939emr27306031637.54.1756257079164; 
 Tue, 26 Aug 2025 18:11:19 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 42/61] target/arm: Add raw_read128, raw_write128
Date: Wed, 27 Aug 2025 11:04:33 +1000
Message-ID: <20250827010453.4059782-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 target/arm/cpregs.h |  5 +++++
 target/arm/helper.c | 17 +++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 90f14dbb18..0d8c45b60c 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -21,6 +21,7 @@
 #ifndef TARGET_ARM_CPREGS_H
 #define TARGET_ARM_CPREGS_H
 
+#include "qemu/int128.h"
 #include "hw/registerfields.h"
 #include "exec/memop.h"
 #include "target/arm/kvm-consts.h"
@@ -1065,6 +1066,10 @@ uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri);
 /* CPWriteFn that just writes the value to ri->fieldoffset */
 void raw_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value);
 
+/* Likewise for 128-bit fields. */
+Int128 raw_read128(CPUARMState *env, const ARMCPRegInfo *opaque);
+void raw_write128(CPUARMState *env, const ARMCPRegInfo *opaque, Int128 value);
+
 /*
  * CPResetFn that does nothing, for use if no reset is required even
  * if fieldoffset is non zero.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 18af67742d..7568b78c49 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -59,6 +59,8 @@ int compare_u64(const void *a, const void *b)
     (*(uint32_t *)((char *)(env) + (ri)->fieldoffset))
 #define CPREG_FIELD64(env, ri) \
     (*(uint64_t *)((char *)(env) + (ri)->fieldoffset))
+#define CPREG_FIELD128(env, ri) \
+    (*(Int128 *)((char *)(env) + (ri)->fieldoffset))
 
 uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
@@ -88,8 +90,23 @@ void raw_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     }
 }
 
+Int128 raw_read128(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    assert(ri->type & ARM_CP_128BIT);
+    assert(ri->fieldoffset);
+    return CPREG_FIELD128(env, ri);
+}
+
+void raw_write128(CPUARMState *env, const ARMCPRegInfo *ri, Int128 value)
+{
+    assert(ri->type & ARM_CP_128BIT);
+    assert(ri->fieldoffset);
+    CPREG_FIELD128(env, ri) = value;
+}
+
 #undef CPREG_FIELD32
 #undef CPREG_FIELD64
+#undef CPREG_FIELD128
 
 static void *raw_ptr(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631D2CCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:18:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lJA-00024D-LP; Tue, 14 Oct 2025 16:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJ5-00021W-Pz
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:41 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lIr-0005KQ-Rw
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:38 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b5a631b9c82so3559424a12.1
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472443; x=1761077243; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YKys7Ek9JC/8M9FIzy07UPULWMuqDXa5WsPfC4Eqf4Y=;
 b=CZgac3MAJdo86IIUA/jtoTZ185xQzNb5YJ1O4MRF+j/u1cyeNPt2iRI/C239z2kf74
 gVZeI7l9fPlGYKkoBk4rmRtS3Kco8YRB5GF2b4GXyFk60Io3LSpAln+FDimYchj4T8al
 XxniAvKMKjoMoD8ia+y7htmZlPP7ZvDU/hC4JoMDN+8xXnWhO2OTbDxwXM7oIqAwvCEQ
 +etWiVONnKeY0Fdl8TArTB48ZbJyDHrnzf9pNNsHdk996Dxts2oZMmgFUhMAQNdFQPgu
 YTZgeijBQXD+vjm17c+xw4X0EplqbbEWc7aYJWfUBs4zPdAyvt9Fkr1ZaA2MUSUqjBza
 6hRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472443; x=1761077243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YKys7Ek9JC/8M9FIzy07UPULWMuqDXa5WsPfC4Eqf4Y=;
 b=XdreVSCX++tDk4lGr9b846bk/j9wCWcTigCkPucGMGqVPn9TVd1ykI6cPsuMaJAtG2
 l7m4kv4uWMKeceoYLesXFClbnbCRD5GMko87GhJ60ZkMtWHtjEkDvPxpoEdKqCR8Ka8H
 D7O1PP/VnjfRrv7vNs/xOiL55vcJiXLhFNian+RhgXqkWfpX6aM8fbC/qNn3AbKqLxgF
 pbstbU35YrAWEol316J9ajekwXX5X3AIf5C4LVVOwu1h8PebK8rVbU9eJkDca0CNWzhg
 q6S1kqj4jxPn433trssPRgv5mB55O0sv24RXy0XwT8piaf+0u5yhUkfg1ofyJSqP8Pan
 sdNw==
X-Gm-Message-State: AOJu0YyLzlaYYXL3CYngd6F7+2uLBNm6GPnJ6A9vin9ybREwxjCYB1tG
 oInjoRdtcgg/G7aiffPJxv0xyHuUSXfVt/2FT1d7oZSHL0bXECbcYACwE8TBc5XX29s=
X-Gm-Gg: ASbGncs1JcOHF9lP24B42/526He/W2KWv0/u0wE4TV8oN+j/KzMA6aKPOYHwGsQqu+4
 IDKeoaM2DHszpWpp8Lrz4HEQbxJ3SkCaOMEgQ60FN8zE5A3ZgGXI5+NMc5n5MjIzrFM/jwfD0AR
 5oKK2a/rdU+adySszxpho0lOxN1QXXAgk4HzHxwxGevLnKouO2pBTUTUAR5yCSs06SwoVrwNNKU
 wTkPCNqdKju34TwRPKTMtMOrYn3opAq0H3GBmwwhrW76iwU2iU4/7U2mjlN4SzheIkd30AirI1T
 uqRN439g6eqthhpqEfYComlKSABATqjEgCzcuMpJQiXH0T5k8vQE/ugrH4zYq4Fpht01PMkIjpE
 qneNL8u2B+psINnPzx/uaF76mf0FwRGGG81UQ7ihYD1a+b7oGjZc=
X-Google-Smtp-Source: AGHT+IEvJbRlqQ+lwISubUX73MzC/51Jb6MrNgzjsGE1iisUSZVkkJ5XD3QBiWcLwLDerjzDMksaig==
X-Received: by 2002:a17:903:37c7:b0:275:b1cf:6dd9 with SMTP id
 d9443c01a7336-290272f80dfmr318866315ad.52.1760472443340; 
 Tue, 14 Oct 2025 13:07:23 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 06/37] target/arm: Add raw_read128, raw_write128
Date: Tue, 14 Oct 2025 13:06:47 -0700
Message-ID: <20251014200718.422022-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h |  6 ++++++
 target/arm/helper.c | 21 +++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index e1d54baead..0b0004eff9 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -21,6 +21,7 @@
 #ifndef TARGET_ARM_CPREGS_H
 #define TARGET_ARM_CPREGS_H
 
+#include "qemu/int128.h"
 #include "hw/registerfields.h"
 #include "exec/memop.h"
 #include "target/arm/kvm-consts.h"
@@ -1124,6 +1125,11 @@ uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri);
 /* CPWriteFn that just writes the value to ri->fieldoffset */
 void raw_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value);
 
+/* Likewise for 128-bit fields. */
+Int128 raw_read128(CPUARMState *env, const ARMCPRegInfo *opaque);
+void raw_write128(CPUARMState *env, const ARMCPRegInfo *opaque,
+                  uint64_t lo, uint64_t hi);
+
 /*
  * CPResetFn that does nothing, for use if no reset is required even
  * if fieldoffset is non zero.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c240edf182..e321f404e6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -59,6 +59,8 @@ int compare_u64(const void *a, const void *b)
     (*(uint32_t *)((char *)(env) + (ri)->fieldoffset))
 #define CPREG_FIELD64(env, ri) \
     (*(uint64_t *)((char *)(env) + (ri)->fieldoffset))
+#define CPREG_FIELD128_H64(env, ri) \
+    (*(uint64_t *)((char *)(env) + (ri)->fieldoffsethi))
 
 uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
@@ -88,8 +90,27 @@ void raw_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     }
 }
 
+Int128 raw_read128(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    assert(ri->type & ARM_CP_128BIT);
+    assert(ri->fieldoffset);
+    assert(ri->fieldoffsethi);
+    return int128_make128(CPREG_FIELD64(env, ri), CPREG_FIELD128_H64(env, ri));
+}
+
+void raw_write128(CPUARMState *env, const ARMCPRegInfo *ri,
+                  uint64_t valuelo, uint64_t valuehi)
+{
+    assert(ri->type & ARM_CP_128BIT);
+    assert(ri->fieldoffset);
+    assert(ri->fieldoffsethi);
+    CPREG_FIELD64(env, ri) = valuelo;
+    CPREG_FIELD128_H64(env, ri) = valuehi;
+}
+
 #undef CPREG_FIELD32
 #undef CPREG_FIELD64
+#undef CPREG_FIELD128_H64
 
 static void *raw_ptr(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-- 
2.43.0



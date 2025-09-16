Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506CCCAC598
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:23:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWaa-0005y5-Tg; Tue, 16 Sep 2025 10:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaT-0005t2-K2
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:18 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaL-0008MO-Br
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:13 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-772301f8a4cso7006831b3a.3
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032579; x=1758637379; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UIhMlSf7KJn7eRbwBzn/O5ACZwJPiK5MVS7jZdwVVVw=;
 b=v9jH6LPbj/XbN+c3m5f3wFzCcr5Tzgl7VZulHr1oxWhW4n9eiXUzTIb5n3sOec7lRG
 S/DgWTiW3DTh8F7va3OkJSQZ6PXcI7bzX2kxiIBQcgxb3ZCv+t5c+4v6QXHzU6X87e+k
 ouZripsyHyAg/uukcj9BkiWDkjkWZhgO8A7IL3hs/lGzHTHbhmb4TgjXEuhX3eCWzG54
 pCAmqB/VXWXYPK42d1ywgbLwePVl1/3xUrF9H19dOOxxz3KfUUkxfve+G4eTFFe/RBpG
 f1aDpfVZaregoqpTDQloqhPrnW1VwiGLHIvn4JhM3GNUFSgS0BxCQikYzYVB2ZtRfy/O
 7s+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032579; x=1758637379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UIhMlSf7KJn7eRbwBzn/O5ACZwJPiK5MVS7jZdwVVVw=;
 b=KF7pkufrTOw5BT3NSQM7DD9HB3RcN3/l6EaRvoi4CRV8ApMQXrMzPmLU8TeVADyjMv
 91ElIstAz8UoNJM/i7GUPYYpo1UnXeRy9HTZ7dGNh866knftmF8GwBF42Wq2zkwvftFQ
 xqgVcE3GNE11MDOFkTenOrRW6mQSPTv6nUAe3h9zT+b5vXu/a5ngWoqVBG9n+Loj8mZh
 Qbk31Z03dzDHei7KlT0fAALdrRWNhHNra9CurhKljvIRUT8yKkkB50DExzIXTtap6xrZ
 0dBwd2d3uTYJyn/ueQfSqqC1XGdSsIsbINPioML1eC0wEJq2N/42qRim5ahnm3Cm90Tv
 uc9g==
X-Gm-Message-State: AOJu0YwkcXtldu0SM39aEFZ2V3drs/GOtTue5nQj0vYOKcj/QqWUuIht
 oFaPkUEU2M0B25n/KXkWeljJZ3jNnuXA6WAivpNDh5VK+xfZs8enWGOBXm+uDtfRCWLITA5qRTf
 yLom1
X-Gm-Gg: ASbGncvC7qjVkxl6GPL0S4lWNalFPp+9MHbqk49Z6wdcRAE8OLoN1RImvRBshdKGzyY
 pnIoQAwwDyV9t3ku8eRwoeF0iZOW8fT7+rQy0V3aH5MRkydaedAjSS2/M49a5xXS8NYHtH7pNzY
 OCqiVDAS7z5jY2Essc3EdTf1e3Uhw8yAP6MiiSN0NrGequUug6QnhqKyk2g/Z/ncoYEeLCpfD/t
 riT8t1231Hzq+cl8oRmjiXtpRCZW8pbH9RS+jv3GnnCLCptSGNXUHc3xDdW+Ly73IeKr54A0/PH
 CXo9iGJaR6fEByaW92r6WMd4irl2JWZy28WSmKiUbmP4ZK8Ptm0q18ov5PVm9jVTMkvWmTRBOfl
 h4h8sufqGq99qU1Nh9MWH7f8r20Es
X-Google-Smtp-Source: AGHT+IHzjU4+JGC8n0zdYlJI2SNOnIixnl8wWzV9ja29tNKh5/6zNe0CWnwn6Wk1edOqGef8h5tF/w==
X-Received: by 2002:a17:903:478d:b0:264:8a8d:92dd with SMTP id
 d9443c01a7336-2648a8da428mr133264635ad.20.1758032578889; 
 Tue, 16 Sep 2025 07:22:58 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:22:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 25/36] target/arm: Split out alloc_cpreg
Date: Tue, 16 Sep 2025 07:22:26 -0700
Message-ID: <20250916142238.664316-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Include provision for a name suffix.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a5195e296d..7f55ea726d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7417,6 +7417,28 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 #endif
 }
 
+/*
+ * Copy a ARMCPRegInfo structure, allocating it along with the name
+ * and an optional suffix to the name.
+ */
+static ARMCPRegInfo *alloc_cpreg(const ARMCPRegInfo *in,
+                                 const char *name, const char *suffix)
+{
+    size_t name_len = strlen(name);
+    size_t suff_len = suffix ? strlen(suffix) : 0;
+    ARMCPRegInfo *out = g_malloc(sizeof(*in) + name_len + suff_len + 1);
+    char *p = (char *)(out + 1);
+
+    *out = *in;
+    out->name = p;
+
+    memcpy(p, name, name_len + 1);
+    if (suffix) {
+        memcpy(p + name_len, suffix, suff_len + 1);
+    }
+    return out;
+}
+
 /*
  * Private utility function for define_one_arm_cp_reg():
  * add a single reginfo struct to the hash table.
@@ -7429,7 +7451,6 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     CPUARMState *env = &cpu->env;
     ARMCPRegInfo *r2;
     bool ns = secstate & ARM_CP_SECSTATE_NS;
-    size_t name_len;
 
     /* Overriding of an existing definition must be explicitly requested. */
     if (!(r->type & ARM_CP_OVERRIDE)) {
@@ -7439,11 +7460,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         }
     }
 
-    /* Combine cpreg and name into one allocation. */
-    name_len = strlen(name) + 1;
-    r2 = g_malloc(sizeof(*r2) + name_len);
-    *r2 = *r;
-    r2->name = memcpy(r2 + 1, name, name_len);
+    r2 = alloc_cpreg(r, name, NULL);
 
     /*
      * Update fields to match the instantiation, overwiting wildcards
-- 
2.43.0



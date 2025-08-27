Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAC3CA0FF6
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:09:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4dk-0008OZ-HN; Tue, 26 Aug 2025 21:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4dQ-0007Eo-2H
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:07:33 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4dK-0007Xk-5J
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:07:31 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-76e6cbb991aso5480713b3a.1
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756256843; x=1756861643; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CiTPcH4cN132XrAlCNyqqTcsX5/+34SY6jW1V2d9z4Y=;
 b=YSoobIgLYB+MPPwTTpSTO9a/Z+NLKWDbEyFnylZEdnrbchBiWafC1rWvyoeG7KiHPa
 XvbtFNfK9whRxiK8N8RxVWiADFliMpDNh6puZHRHnvQLKCb9exHUP3Gb0C5+gGwsap+7
 oe4OOjT9wpVVYqffl5GAEHhu2O8PzCaiKNmcZlNgCg0lhBMbA10VeUWASF8fJceD4QXK
 Pv5sgLXwVqtAlWEOrZvFUriT9RL6WDO6uMkVkt65PwhXp8efyeuKeifch8RmSKxu2dE6
 RiqFPM2ktDe/G+cIQUYdTWvfiuXntGqAa+lFG1A1YsXQxUg8yQTIwUD/siNtg4hp0AWy
 GHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256843; x=1756861643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CiTPcH4cN132XrAlCNyqqTcsX5/+34SY6jW1V2d9z4Y=;
 b=LrStpW7tCcLaoaFTEobtUzP9CrM2hO12ZZjJSHzQragrzGPfWVIeQrk0DgYlB6i9St
 9G/qB4u11aztVFi3hbdlNyxBQu8mfaHd2sXXSTdalNzvof1PPa8m+ragV2cmzJnijakl
 sHkyfjYpTYF7Xhgcr5nx2QlQGOPhEq+73tp6qF9Ojf8ZZenE/EcZI33lbkQP8a39J1rs
 ZeEy3uNj82YeL5ncQ77UeCayL1eUPG0DnWquJMSSfLyLrZpRpNTt3ihcEOrw4ApeEKOh
 y4zGTym2ji2hNU5O00dM+vA0MWuF/8+3cHh3blq7xRtHJ7N3s1jrBQ+ive7GEdtcJ1ZK
 HzfQ==
X-Gm-Message-State: AOJu0Yybf/rKFijCKtrIrUdGh0btKn67lu2sZTSqUwmLGb/30gIKImr/
 iMdKk+iSJGd4ItinHYqMvD5jqmvDBhG+8k8xF3MfqwL8UzU7iy/L5nz3bJZMmzW4nkcaO4BFvFa
 uPy4WEfk=
X-Gm-Gg: ASbGncsYljQecjtUXcbbJCvlmLolOZfJfJZrIR77TDlgk9S0FDCh955haZuE2qReeIY
 ct1yiY4Q0UMVXULDwor9iqrxlEJgPrvdboN5K3gJF+Go5SFo5Ct6swXFoXh6RdGQvaZL9D3DSi1
 FP89Zzaadyqljpiu8y/0ZlDVrFGQcqkFek2NJsL1giWXC/Zws79aCRFU/A/2rJDKs99U3O3j598
 SRut61FFt30jzO73V2TFoVOA2Aw4Hrgt+xkIgbqdzmONSQaB+Km54m+eqjxUXHo221DN6EOMLyB
 TvcmKHWEPEJ5VLwUbnoURnO3Q5Y21/I6pEalDUY8LQmGhHbkMVYeTrbaBSH2uTyeRuglGgXUMSh
 EB+IyALiihPaYg/GhjxH8tczrKZB3jfXG1CVE
X-Google-Smtp-Source: AGHT+IFQVDWFOeS/wZ1LS5SwKVdpALVIw+/wXO+QLvv7MNvP1FXnvJv+ieUAx4+DxhLleFXj4N2waA==
X-Received: by 2002:a05:6a00:391f:b0:76e:99fc:db8d with SMTP id
 d2e1a72fcca58-7702fa08e63mr20625201b3a.3.1756256842850; 
 Tue, 26 Aug 2025 18:07:22 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720274534esm1419241b3a.47.2025.08.26.18.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:07:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 25/61] target/arm: Split out alloc_cpreg
Date: Wed, 27 Aug 2025 11:04:16 +1000
Message-ID: <20250827010453.4059782-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
index a4cd4cf232..0e4be14606 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7263,6 +7263,28 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
@@ -7275,7 +7297,6 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     CPUARMState *env = &cpu->env;
     ARMCPRegInfo *r2;
     bool ns = secstate & ARM_CP_SECSTATE_NS;
-    size_t name_len;
 
     /* Overriding of an existing definition must be explicitly requested. */
     if (!(r->type & ARM_CP_OVERRIDE)) {
@@ -7285,11 +7306,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
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



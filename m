Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDD4CA0FF6
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:07:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4cL-0004EM-2Z; Tue, 26 Aug 2025 21:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4bX-0003jK-1h
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:05:35 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4bV-0007Gt-3J
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:05:34 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-771e1e64fbbso3798348b3a.3
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756256730; x=1756861530; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j4IRJlXM6WlOC6HdRLDZoPfNGaWNXGIS7v/EQ+dzuD0=;
 b=ND8ogBivGoQ3ytY6EiM7geYKKsHDQwjcw97jezQZIuTwms8cndtttZ08jo/OGOxQIT
 Tp4dn7MRrtFkiPDD+zg2ifYXIJBPkIhNEN5H9y2QH8ReeFqh0vyU2gM60VU9oX8higso
 tL/FyhcLiyKraZYja03c/YHsm79WAGFVTts+/qymlaDSVfiiyvEo5O3nNlT+udxGAXlJ
 Ze6rjvTXWeVU9Eq8n9OdSCYBet9AmzskVrmfqlC31xCW4WWlTUk4gAWZPgxpknKmP9vM
 EIOgdLuuQJyM9zqwPfXnT3M50OXvjdyvZErd4ZKO9qLg2gbQCIJmDN5JM2pwaYsfXDvm
 LFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256730; x=1756861530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j4IRJlXM6WlOC6HdRLDZoPfNGaWNXGIS7v/EQ+dzuD0=;
 b=u18UmdIo8znO+c5JRmD2O0iN/vj94QVd1uKzsDXz1IBqLK/5d6dpksPXBe3dqmo7E/
 7B7okvz3mC2bp5OYnTiIy8rXAa3H5r3AWef/C7baBJIQhg/YR4K8HwUNNHlpb3r0JUli
 r5Ee5ZGXxySJ6/aswsJEKwYKMX7Yp5AdtxJtA8/f0zMRTxtfZtnfHYoP9RqcSE/5nePM
 zzjh2sEyfVHrKJ1KrVTt3VU4cWNyw071Idaf3p55JX0jaLS+i2bplAFaPknXkT9+roSJ
 i+1fcWxpqmDmThGzrEgnf9iznMSQ6uOJWf9ant8ObRSXlqT5DJ6vUe3nd5o5/3KHGdUi
 5R3Q==
X-Gm-Message-State: AOJu0YzcECNO1g20Agtq4Y1CInXN+/fG3o0BQquCaNMUmkxlyyeGJdUp
 xuY6M37ihlC+2Z3Jd4LzjVazXWSLkU49t55E4/m81TeIy9p9lIEAonfem1+58qrmAUE=
X-Gm-Gg: ASbGncuri52SW41nHMF9qJ/U8UOfTwVSSoAHi/E+jTLeUuGkQI+DvYvUBoGCJSW8k2b
 21RBR3f1Zt+SlQk7ojCxOdtSmQfXmM2Kc1p/dnInv3ZV2TCpfwI8OPw4W1rAdTn0V/H8lyYpDmk
 ZtfeFIYLdSktDcdCLheMnmPrBbMoXUKMtsqVx4LFSHNsUb/AMttX/qx4mx8+YrWlNBfwgGc/q8j
 qccifkGyKUL5xcUuplEuyRbRX4NSnF3oRufkblsWF/Q633NVdCiX/FvVQI2K30kCwAJhdeN6fKn
 6t6lKojEltKFb8AJ13C5PhPjmVaYSH8qKXiPUkA3QA8uucwpOUfEvDctx8DUrZ9++51vcgedxvR
 Nro4Y1N9mhIne88HB24hl+HYKLw==
X-Google-Smtp-Source: AGHT+IEfg0RV8HZ0MKe7sVyvR2MY0xdMsjAgdQp2skpx8s+Sto/jl962olvmqYF0Xp7BQRGztMgUlQ==
X-Received: by 2002:a05:6a00:7619:b0:771:b230:f0a3 with SMTP id
 d2e1a72fcca58-771b230f3a2mr10217489b3a.19.1756256730528; 
 Tue, 26 Aug 2025 18:05:30 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720274534esm1419241b3a.47.2025.08.26.18.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:05:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/61] target/arm/hvf: Add KVMID_TO_HVF, HVF_TO_KVMID
Date: Wed, 27 Aug 2025 11:03:53 +1000
Message-ID: <20250827010453.4059782-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Conversion between KVM system registers ids and the HVF system
register ids is trivial.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 7b0413093d..47165bd29c 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -403,6 +403,26 @@ struct hvf_sreg_match {
     uint32_t cp_idx;
 };
 
+/*
+ * QEMU uses KVM system register ids in the migration format.
+ * Conveniently, HVF uses the same encoding of the op* and cr* parameters
+ * within the low 16 bits of the ids.  Thus conversion between the
+ * formats is trivial.
+ */
+
+#define KVMID_TO_HVF(KVM)  ((KVM) & 0xffff)
+#define HVF_TO_KVMID(HVF)  \
+    (CP_REG_ARM64 | CP_REG_SIZE_U64 | CP_REG_ARM64_SYSREG | (HVF))
+
+/* Verify this at compile-time. */
+
+#define DEF_SYSREG(HVF_ID, ...) \
+  QEMU_BUILD_BUG_ON(HVF_ID != KVMID_TO_HVF(KVMID_AA64_SYS_REG64(__VA_ARGS__)));
+
+#include "sysreg.c.inc"
+
+#undef DEF_SYSREG
+
 #define DEF_SYSREG(HVF_ID, op0, op1, crn, crm, op2) \
     { HVF_ID, HVF_SYSREG(crn, crm, op0, op1, op2) },
 
-- 
2.43.0



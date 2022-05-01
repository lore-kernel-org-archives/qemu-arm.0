Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp473709lfu;
        Sat, 30 Apr 2022 23:17:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHtdbkEj/MHd3Et3Co9nN7fueCwaybOPBYIfi6lJ7PTAeQWW9fx8QGpUNVq6TiOrSPoDOs
X-Received: by 2002:a05:622a:1716:b0:2f3:9426:a072 with SMTP id h22-20020a05622a171600b002f39426a072mr5899398qtk.283.1651385876912;
        Sat, 30 Apr 2022 23:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651385876; cv=none;
        d=google.com; s=arc-20160816;
        b=jOWTtX+ui7MRc2I1Pj99ADq3FesPr6Po7ZGJOhvvtbznPrq15tUM18YAs6FUIHLddU
         T0Pms5qQgiCaxJbnZpA9l+8i6KohAnidNKrfo+L4Ro+4jBpWJM+9dZ5uhsueMlVEb1sa
         YxezFwrRzxTf0midoOPFrK+J6OdSKJAtwBNY58Qao+5Z1p8kHxNVNcuOFyQJXem+odX+
         ibzWC4tjR4y7iyDMCsl2S54KV/TSzB0PVvx2A1hW7tSucTP6Kl8gP3H+/sW4nHQiCKSJ
         SdV5RKEiJW38Fl99Wu5oDGxo+y9BG6qQl//nTlbMwQLDRxJDMfh53+nLbXidPyA1+tqN
         qarw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CHRhI+bX86VA6q/w81eljR54J64KB5RR2ukIj4TlNII=;
        b=J9PD8RlnRzQxDmmwz4l+UtRnMbqsxSWepWSpmQm2muNPmnkaXsDLOzOTc7Wun91O9R
         zr+S40XSpjXukJhJhiVlO7xFPokEuAYQsYA5tw8qvpD8h2tD7qVp6V9KT1Sbt76wN9r9
         pzRdp4nFbFgM1sJPwMMr/8rkqfpqHN3s3HH10Vw+1qQ03j0Ejz0Wq+DW1kMkaoR6w4jY
         kHdy5H/ELbVPVXW8LE7SSEKi1JXxAW2sIYbKTDvh7h52ZqzhVuha0GQtLO9zzZvzgJyr
         EQbuY8yUULQotk+2PQd2F0pLfSmOy9P7PzraR4k901VFEDLN5MjMVPSDEK1ggNkXaBGK
         FJCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E3Q64BpJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6-20020ac86b46000000b002f3810ad3e7si4018168qts.390.2022.04.30.23.17.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:17:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E3Q64BpJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl2u2-0007IA-JY
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tr-0006tJ-9U
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:58 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:44734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tn-0001II-Df
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:50 -0400
Received: by mail-pl1-x62b.google.com with SMTP id j8so10255296pll.11
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CHRhI+bX86VA6q/w81eljR54J64KB5RR2ukIj4TlNII=;
 b=E3Q64BpJDClA1H8nu5PtO0JbHilCY7GI4jNJie9eQs+c/PrJJHeBS4i2I9r8jnA23p
 KCTDp6gtpQUMFgmiDKpw4ktXBSERU4Pj2uBQj1jIRAufEygmbP9PGLbFhxaFBKf1AWLa
 sIL5Y0/wv/05ZG4EihItT71vVJd7uRfojwaIgg+avLjYmGzmksioD9vY6nthGRdiBw68
 0y5X5mz1x4LnsWi8aA7SjxGJ4XS+ZZn7S3BArF2Z2Ut7Oy1RPk/VFVm5yE0Er/TBuE+z
 J96zR94OqoJX5Z6g22GMXO7qHTjnty14/r3qia857tOjU/W6IVvt1H4x7mZAVlXevXl/
 0CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CHRhI+bX86VA6q/w81eljR54J64KB5RR2ukIj4TlNII=;
 b=EKEu2zqS23YAlDeYAy2OnK9f1Tp07o8xUWOsqftIh9iw4VqSwPA5kKXPGS/yqlJn9+
 WVWLhvdW0+DWoiRotOcfhq4qCz3OpI4q1MM/ZQmG2gzkJmc1l7LIkzIeqx7Y1UW6KXlx
 EXRuQEUuaQNuzUn8xQN13RfoT8F1vzlLnay4fsb1ndOnj5pGUmR5RDcWzXlCUSRTDN2O
 j2B1iNTGe5vpkYr4weQzTEL0gRZwusJseOhDwqfjnVhe41OF15Or0hQ0xLdTmkvUhUVr
 jrJscPtgcuczZhFgWAb84+lNSjX82LEprsPogbZcH4tcI1KKh2Z8p7vdvPnT3TznQJWQ
 W5Hw==
X-Gm-Message-State: AOAM532F0/b/zmWd3hXfHcgxjqRTuJCe9Bxo1HLcaEihDqzvwVCTy6c7
 J73Nc7NEVy4Hz9vONXj9n17m/xeRiVbSNA==
X-Received: by 2002:a17:90a:6501:b0:1ca:a7df:695c with SMTP id
 i1-20020a17090a650100b001caa7df695cmr7183277pjj.152.1651384246027; 
 Sat, 30 Apr 2022 22:50:46 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/45] target/arm: Perform override check early in
 add_cpreg_to_hashtable
Date: Sat, 30 Apr 2022 22:49:59 -0700
Message-Id: <20220501055028.646596-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yD46Dv4Ygdby

Perform the override check early, so that it is still done
even when we decide to discard an unreachable cpreg.

Use assert not printf+abort.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f1fbbdb9e0..2ed07795d8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8538,6 +8538,14 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         g_assert_not_reached();
     }
 
+    /* Overriding of an existing definition must be explicitly requested. */
+    if (!(r->type & ARM_CP_OVERRIDE)) {
+        const ARMCPRegInfo *oldreg = get_arm_cp_reginfo(cpu->cp_regs, key);
+        if (oldreg) {
+            assert(oldreg->type & ARM_CP_OVERRIDE);
+        }
+    }
+
     /* Combine cpreg and name into one allocation. */
     name_len = strlen(name) + 1;
     r2 = g_malloc(sizeof(*r2) + name_len);
@@ -8622,20 +8630,6 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         assert(!raw_accessors_invalid(r2));
     }
 
-    /* Overriding of an existing definition must be explicitly
-     * requested.
-     */
-    if (!(r->type & ARM_CP_OVERRIDE)) {
-        const ARMCPRegInfo *oldreg = get_arm_cp_reginfo(cpu->cp_regs, key);
-        if (oldreg && !(oldreg->type & ARM_CP_OVERRIDE)) {
-            fprintf(stderr, "Register redefined: cp=%d %d bit "
-                    "crn=%d crm=%d opc1=%d opc2=%d, "
-                    "was %s, now %s\n", r2->cp, 32 + 32 * is64,
-                    r2->crn, r2->crm, r2->opc1, r2->opc2,
-                    oldreg->name, r2->name);
-            g_assert_not_reached();
-        }
-    }
     g_hash_table_insert(cpu->cp_regs, (gpointer)(uintptr_t)key, r2);
 }
 
-- 
2.34.1


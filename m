Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp382732lft;
        Fri, 8 Jul 2022 09:35:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t91+bRrdGlGlI3FpGCN5El7D3364W6UAX6zPM/IHXJ4pMlRyyY4WQAqNO9pMrzs2x/mqpb
X-Received: by 2002:ac8:5c16:0:b0:31e:a602:dd69 with SMTP id i22-20020ac85c16000000b0031ea602dd69mr2874057qti.342.1657298151049;
        Fri, 08 Jul 2022 09:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657298151; cv=none;
        d=google.com; s=arc-20160816;
        b=lIkjg9ui/sdwCuZcSzjXptwcOqpYg9V0G21mBtQjYWLixv3IoLbd4VsOEGciQ/33uR
         trBZOzjwBXKi+Z9klyEDYdOl1rBs54PixMWdKt1xsCu5EfRWmAb4RGik4sea2gwU04ob
         U9cbWAv4+uAMa8XRgLMFw32/UbVyw5p7DR5u8Q5IAr+QTkZgfMhVc/6EVKAc1ggm4OW7
         lRXF8ar3bssSL8pZKsayLSvYTTcXbf1GEHRr2uRbJdob5P9tacY2meONyM3oiuCwIO9U
         xjq32lmMdDF3bGLONB5HG+ZDjRfnqGY8Dg/wF2bBHGTS8N76lBLUb1BgfSrTkvwrI0ap
         ABNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cT93Lxc9mPWCnChsVCUCuYS7cifJUMOpzXauTBVN+y4=;
        b=Obub4q+aZ4TR+dlXqmAk/Ur5bQT8prAqUYLqnjo5iggeu85je0+QS2lc/hcDb+/qst
         aTDAnSQcTakcR/ODSrrIW/tuwrJRdvIRdyVXeAwzEbb8zFzUl7cySwgOBglgYAVXV/ML
         iy7zJV8F7baHnJt85kwuvL7JORtJuyiCgAK+zUcBYIOmcB/dFLve9dAH9BCfBYPMva3T
         luE7vIDXv+1KjfRBoCjzpwSLrTmc0NRuBW5ltUW9DS4maL+4ScqJANnNUjlZ9rukBr2u
         9hK7jq15YX2OvqTGJXJxAW1dcvkJz15dFvUl2d4Q/9YvnCpsbRAZ+A/Xm1H0zbC4LMC9
         yVgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kLncZh2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eo5-20020ad45945000000b004733252d9a2si2622725qvb.159.2022.07.08.09.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 09:35:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kLncZh2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9qxK-0007yf-Fm
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 12:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qD7-0005ye-TJ
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:48:08 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:55110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qD5-0002X1-EV
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:48:05 -0400
Received: by mail-pj1-x102b.google.com with SMTP id s21so13826730pjq.4
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cT93Lxc9mPWCnChsVCUCuYS7cifJUMOpzXauTBVN+y4=;
 b=kLncZh2cCRZ0gNjwCfYl6p1PQyezmnZItOPl8xO95pu1Ti/hLdJbXVrou1ysqmXazB
 7PH9ENNq2Q5B4DeJMpxogBK0l9MYkeHiCoSBZRhkcmK9VEMZJQAetH+5Luc3G4n0inb9
 LARN+uSTx4uiUHwup0IrGD6hc5c5iEwp35LUboyTZJLxBrlWbxIBv34Qpf5aoFe0hpqw
 C4tp7+sNjjLemzpJZ9JnbnTPg5lfeeyADPfE8iDUbLEcgKmjKPNMJhauhx+Z6rOoRp9G
 Wz9bi7yTWfEIMMcehYPdAIKBTtok6KK1GAbp5ntrwgD7JOUg4Go66lcXxxsC3xnC9f9+
 uhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cT93Lxc9mPWCnChsVCUCuYS7cifJUMOpzXauTBVN+y4=;
 b=cUM4ThX7etRYdskkV3pfWydI0OfCD5XoLQVUOa4NqYEaGzbYZXJintwV1jagdd3GQc
 q/7WLWCZIj0/IWngIL+c+tjGwsffcmYY9Pbx0vKisKIbKjzbR+paFAXZGUzyvB/aIOaP
 NpknrkqFZFOoCcO1D8uHwf6TTnyBwhB8MNEzhEtLymDz2iWw4aa9VGkoZHhSmBTeHJ2p
 fGZo1etqPqhxBI4Y8OE+BtcHnxriAzOzYUQrAgkXo6xgTkcoDd24dljq9/zdT9BU5w0p
 yeXea59QEzUJZVCnF7o0z0p+P7GgWzxf4iIQSn+NzLkl2Dv51RMJAmlwiQoHDcQEDznK
 fFcg==
X-Gm-Message-State: AJIora8R+F+OA8CefZLaJ13gYmB/pyRZ/9OpoKttFa420tyVJusrIxDk
 fkkfSJ4cqaUKT5Ov8iBuj7kJ0w==
X-Received: by 2002:a17:902:7402:b0:16c:9e2:3b1c with SMTP id
 g2-20020a170902740200b0016c09e23b1cmr4179855pll.128.1657295282168; 
 Fri, 08 Jul 2022 08:48:02 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 18/29] Compute reginfo_size based on the reginfo
Date: Fri,  8 Jul 2022 21:16:49 +0530
Message-Id: <20220708154700.18682-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kAzoaI6mFQ82

This will allow dumping of SVE frames without having
to know the SVE vector length beforehand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.h                 | 2 +-
 risu.c                 | 9 +++++++--
 risu_reginfo_aarch64.c | 4 ++--
 risu_reginfo_arm.c     | 4 ++--
 risu_reginfo_i386.c    | 4 ++--
 risu_reginfo_m68k.c    | 4 ++--
 risu_reginfo_ppc64.c   | 4 ++--
 7 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/risu.h b/risu.h
index bfcf0af..3cad3d5 100644
--- a/risu.h
+++ b/risu.h
@@ -126,6 +126,6 @@ int reginfo_dump(struct reginfo *ri, FILE * f);
 int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f);
 
 /* return size of reginfo */
-const int reginfo_size(void);
+int reginfo_size(struct reginfo *ri);
 
 #endif /* RISU_H */
diff --git a/risu.c b/risu.c
index a248db1..a70b778 100644
--- a/risu.c
+++ b/risu.c
@@ -125,7 +125,7 @@ static RisuResult send_register_info(void *uc)
     case OP_TESTEND:
     case OP_COMPARE:
     case OP_SIGILL:
-        header.size = reginfo_size();
+        header.size = reginfo_size(&ri[MASTER]);
         extra = &ri[MASTER];
         break;
     case OP_COMPAREMEM:
@@ -209,7 +209,12 @@ static RisuResult recv_register_info(struct reginfo *ri)
             return RES_BAD_SIZE;
         }
         respond(RES_OK);
-        return read_buffer(ri, header.size);
+        res = read_buffer(ri, header.size);
+        if (res == RES_OK && header.size != reginfo_size(ri)) {
+            /* The payload size is not self-consistent with the data. */
+            return RES_BAD_SIZE;
+        }
+        return res;
 
     case OP_COMPAREMEM:
         if (header.size != MEMBLOCKLEN) {
diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index 028c690..7044648 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -69,7 +69,7 @@ void process_arch_opt(int opt, const char *arg)
 #endif
 }
 
-const int reginfo_size(void)
+int reginfo_size(struct reginfo *ri)
 {
     int size = offsetof(struct reginfo, simd.end);
 #ifdef SVE_MAGIC
@@ -194,7 +194,7 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
 /* reginfo_is_eq: compare the reginfo structs, returns nonzero if equal */
 int reginfo_is_eq(struct reginfo *r1, struct reginfo *r2)
 {
-    return memcmp(r1, r2, reginfo_size()) == 0;
+    return memcmp(r1, r2, reginfo_size(r1)) == 0;
 }
 
 #ifdef SVE_MAGIC
diff --git a/risu_reginfo_arm.c b/risu_reginfo_arm.c
index 3662f12..47c52e8 100644
--- a/risu_reginfo_arm.c
+++ b/risu_reginfo_arm.c
@@ -36,9 +36,9 @@ void process_arch_opt(int opt, const char *arg)
     abort();
 }
 
-const int reginfo_size(void)
+int reginfo_size(struct reginfo *ri)
 {
-    return sizeof(struct reginfo);
+    return sizeof(*ri);
 }
 
 static void reginfo_init_vfp(struct reginfo *ri, ucontext_t *uc)
diff --git a/risu_reginfo_i386.c b/risu_reginfo_i386.c
index 60fc239..50505ab 100644
--- a/risu_reginfo_i386.c
+++ b/risu_reginfo_i386.c
@@ -74,9 +74,9 @@ void process_arch_opt(int opt, const char *arg)
     }
 }
 
-const int reginfo_size(void)
+int reginfo_size(struct reginfo *ri)
 {
-    return sizeof(struct reginfo);
+    return sizeof(*ri);
 }
 
 static void *xsave_feature_buf(struct _xstate *xs, int feature)
diff --git a/risu_reginfo_m68k.c b/risu_reginfo_m68k.c
index 32b28c8..4eb30cd 100644
--- a/risu_reginfo_m68k.c
+++ b/risu_reginfo_m68k.c
@@ -23,9 +23,9 @@ void process_arch_opt(int opt, const char *arg)
     abort();
 }
 
-const int reginfo_size(void)
+int reginfo_size(struct reginfo *ri)
 {
-    return sizeof(struct reginfo);
+    return sizeof(*ri);
 }
 
 /* reginfo_init: initialize with a ucontext */
diff --git a/risu_reginfo_ppc64.c b/risu_reginfo_ppc64.c
index 071c951..39e8f1c 100644
--- a/risu_reginfo_ppc64.c
+++ b/risu_reginfo_ppc64.c
@@ -32,9 +32,9 @@ void process_arch_opt(int opt, const char *arg)
     abort();
 }
 
-const int reginfo_size(void)
+int reginfo_size(struct reginfo *ri)
 {
-    return sizeof(struct reginfo);
+    return sizeof(*ri);
 }
 
 /* reginfo_init: initialize with a ucontext */
-- 
2.34.1


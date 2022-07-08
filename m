Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp401734lft;
        Fri, 8 Jul 2022 10:07:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vgpAlOrXp2GTMxgNXsJWOtrZjSlX9g2NMymdGQEYRTkxJDu6BawR6LTO0tMZuqdLivV5qV
X-Received: by 2002:a05:6214:d4a:b0:470:49bf:a51e with SMTP id 10-20020a0562140d4a00b0047049bfa51emr3654541qvr.88.1657300046746;
        Fri, 08 Jul 2022 10:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657300046; cv=none;
        d=google.com; s=arc-20160816;
        b=kpEAeD6FgqfY6rvx46hwxLbWUJtq5Vk8vGlK/DqXeUZgcs4yJV8NdCUHF5fNU9HmWw
         osDKRYjpp/xYOBnpRglnlLWBpyxlgTC9rHohvb5CXgI9gCChz2quZ0mn7fyCoX6oumIZ
         Qf+rTL5zJQLtsmlsVRSkzGodIEX/Jm3xT+oXC4GyNZ3WxfQR6Ma7bC2mBOxd94IvssPb
         D86scbsHZ7zl3vMARzrmC1ztgGabX+jIj5y9roFjMZlaJzgh/HisqmFBNDgeskOx/j8Z
         3NnLY0Vw2004NjKThW5uDukZqfNzD9IFj7HvpwzNVap1oKHDHD6V8obHPH5uMXgz1BT/
         IXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=v0mp2fwMAm/3QWt6/khtoo1bYBedtATdI31SE5nBFNs=;
        b=hxUIMKmpPNjBPxJMg89h1deudYlDgZy/p3JrkNhXhMiFv4cgzbFQ2mFbo5/pNiYMVx
         9bJVEZePIO3sE4aUJugqu2yT4QO+Kdf+2GuSiq2B9SlF06riUiUZrQtHBb1qonEuI5fb
         0k8ICuIoy9XGivq0cRepZVLlQAOaPQAR+t4vE8zYlhz/oWGTYghSMxnAPAayPUfmZEpB
         mGjGdIbRcSeKPeeCGMFb37SUSYswkVowqyaNMaLLmA+d+tzI2/D/E/GPagjt55GYCa67
         qHvo3QdEf5uKn5lJ1r9BrPgoAz+o2NWTteQuYCnOC/9l4vlBD37YtBJUwlE4FGXQL8cO
         J0FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DyveKn7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y22-20020ac87056000000b002f3c66f704csi24271570qtm.678.2022.07.08.10.07.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 10:07:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DyveKn7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9rRu-0005NO-6d
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 13:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDa-0006uv-Bp
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:48:34 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDY-0002Ra-8z
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:48:34 -0400
Received: by mail-pj1-x1036.google.com with SMTP id fz10so12267112pjb.2
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v0mp2fwMAm/3QWt6/khtoo1bYBedtATdI31SE5nBFNs=;
 b=DyveKn7nHnlRo64TdMxrSezLt3U4Dqfw+SoJOH+Opg2LiBeRjKFVJsnsOx4/6dMef7
 A9V9viJSMUcJm+690shHgQHsbnkonWiawop1aJVX+0dld5H7lO2wqBoHUtXbGt6a2ogh
 fJsvTNKKx0naRn/amePeZITQ6HEaXgCiZydRK3gtA4KhPFuhI8fR1LhZsi5cxyQ38TxO
 H6RhM5iL8pc3OBHfKtB/0eke9P6/8Iyi3j/5Hub2Qs7i+kHYj23RKTGFkoRwvSd5TBRa
 jgq+WtDzbRsIAJs+OYJUKc7R2jX4bNyQnC7Vy2e2W3WcHyQXNigV2xyKo/zS9do2EnUa
 Um1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0mp2fwMAm/3QWt6/khtoo1bYBedtATdI31SE5nBFNs=;
 b=QkQAtzDhehjOptFM+LxWv2CNgE5oa2yeuRIyylOzPq88rbUfPUzK4fbZ6opLEmpz0Y
 3MHK8GmkwZSx37kA1Ue/N6384d1kYTzmTdnaPzk0IC7bDbdApBQtUSG6pONiOP1P9/mw
 Cbv/85uflLk6auw94oGVEPwM3hyLgpzOx7/eQoiNXS5TBFX24A4rfXWVUM0xX/A917AD
 ejh4F+/3iA4RTT+J4SoCk4Qmco+g7tqLeCwyVl4Q/m611c+BmCnB1zGm9jdsWmh8tIKU
 vVlNyuoj/Q7cBNLf2GnAbEc0x6RzEb3DRLCfZFS4MoalbXH6uY2NVDAGIsja9WNlHxzj
 x7hA==
X-Gm-Message-State: AJIora+on4WdT2KVVzhc71KuvRltLX42NZeQRcNpwBDrEFRu50XXfcAh
 2QmeAcLgYHvrJ9OyRapx6qoiF9OC+1XVkg8W
X-Received: by 2002:a17:902:f790:b0:16b:d796:3696 with SMTP id
 q16-20020a170902f79000b0016bd7963696mr4257201pln.97.1657295311415; 
 Fri, 08 Jul 2022 08:48:31 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 28/29] aarch64: Add support for ZA storage
Date: Fri,  8 Jul 2022 21:16:59 +0530
Message-Id: <20220708154700.18682-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Oeg0IVnT9kh

Require NVL == SVL on startup, to make it easier to manage reginfo.
Most of the time PSTATE.SM would be active with PSTATE.ZA anyway,
for any non-trivial SME testing.

Extend saved storage only when PSTATE.ZA is active.
Use a carefully reserved uint16_t for saving SVCR.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu_reginfo_aarch64.h |  52 ++++++++++++-
 risu_reginfo_aarch64.c | 161 ++++++++++++++++++++++++++++++++++++-----
 2 files changed, 191 insertions(+), 22 deletions(-)

diff --git a/risu_reginfo_aarch64.h b/risu_reginfo_aarch64.h
index 536c12b..097b7ad 100644
--- a/risu_reginfo_aarch64.h
+++ b/risu_reginfo_aarch64.h
@@ -21,6 +21,43 @@
 #define SVE_VQ_MAX 16
 
 #define ROUND_UP(SIZE, POW2)    (((SIZE) + (POW2) - 1) & -(POW2))
+
+#ifdef ZA_MAGIC
+/* System headers have all Streaming SVE definitions. */
+typedef struct sve_context risu_sve_context;
+typedef struct za_context  risu_za_context;
+#else
+#define ZA_MAGIC         0x54366345
+#define SVE_SIG_FLAG_SM  1
+
+/* System headers missing flags field. */
+typedef struct {
+    struct _aarch64_ctx head;
+    uint16_t vl;
+    uint16_t flags;
+    uint16_t reserved[2];
+} risu_sve_context;
+
+typedef struct {
+    struct _aarch64_ctx head;
+    uint16_t vl;
+    uint16_t reserved[3];
+} risu_za_context;
+
+#define ZA_SIG_REGS_OFFSET \
+    ROUND_UP(sizeof(risu_za_context), SVE_VQ_BYTES)
+
+#define ZA_SIG_REGS_SIZE(vq) \
+    ((vq) * (vq) * SVE_VQ_BYTES * SVE_VQ_BYTES)
+
+#define ZA_SIG_ZAV_OFFSET(vq, n) \
+    (ZA_SIG_REGS_OFFSET + (SVE_SIG_ZREG_SIZE(vq) * n))
+
+#define ZA_SIG_CONTEXT_SIZE(vq) \
+    (ZA_SIG_REGS_OFFSET + ZA_SIG_REGS_SIZE(vq))
+
+#endif /* ZA_MAGIC */
+
 #define RISU_SVE_REGS_SIZE(VQ)  ROUND_UP(SVE_SIG_REGS_SIZE(VQ), 16)
 #define RISU_SIMD_REGS_SIZE     (32 * 16)
 
@@ -36,12 +73,16 @@ struct reginfo {
     uint32_t fpsr;
     uint32_t fpcr;
     uint16_t sve_vl;
-    uint16_t reserved;
+    uint16_t svcr;
 
-    char extra[RISU_SVE_REGS_SIZE(SVE_VQ_MAX)]
+    char extra[RISU_SVE_REGS_SIZE(SVE_VQ_MAX) +
+               ZA_SIG_REGS_SIZE(SVE_VQ_MAX)]
         __attribute__((aligned(16)));
 };
 
+#define SVCR_SM  1
+#define SVCR_ZA  2
+
 static inline uint64_t *reginfo_vreg(struct reginfo *ri, int i)
 {
     return (uint64_t *)&ri->extra[i * 16];
@@ -59,4 +100,11 @@ static inline uint16_t *reginfo_preg(struct reginfo *ri, int vq, int i)
                                   SVE_SIG_REGS_OFFSET];
 }
 
+static inline uint64_t *reginfo_zav(struct reginfo *ri, int vq, int i)
+{
+    return (uint64_t *)&ri->extra[RISU_SVE_REGS_SIZE(vq) +
+                                  ZA_SIG_ZAV_OFFSET(vq, i) -
+                                  ZA_SIG_REGS_OFFSET];
+}
+
 #endif /* RISU_REGINFO_AARCH64_H */
diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index 9ea0acf..af620f3 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -25,25 +25,44 @@
 #include "risu.h"
 #include "risu_reginfo_aarch64.h"
 
+#ifndef PR_SME_SET_VL
+#define PR_SME_SET_VL 63
+#endif
+
 /* Should we test SVE register state */
 static int test_sve;
+static int test_za;
 static const struct option extra_opts[] = {
     {"test-sve", required_argument, NULL, FIRST_ARCH_OPT },
+    {"test-za", required_argument, NULL, FIRST_ARCH_OPT + 1 },
     {0, 0, 0, 0}
 };
 
 const struct option * const arch_long_opts = &extra_opts[0];
 const char * const arch_extra_help
-    = "  --test-sve=<vq>        Compare SVE registers with VQ\n";
+    = "  --test-sve=<vq>        Compare SVE registers with VQ\n"
+      "  --test-za=<vq>         Compare ZA storage with VQ\n";
 
 void process_arch_opt(int opt, const char *arg)
 {
-    assert(opt == FIRST_ARCH_OPT);
-    test_sve = strtol(arg, 0, 10);
-
-    if (test_sve <= 0 || test_sve > SVE_VQ_MAX) {
-        fprintf(stderr, "Invalid value for VQ (1-%d)\n", SVE_VQ_MAX);
-        exit(EXIT_FAILURE);
+    switch (opt) {
+    case FIRST_ARCH_OPT:
+        test_sve = strtol(arg, 0, 10);
+        if (test_sve <= 0 || test_sve > SVE_VQ_MAX) {
+            fprintf(stderr, "Invalid value for SVE VQ (1-%d)\n", SVE_VQ_MAX);
+            exit(EXIT_FAILURE);
+        }
+        break;
+    case FIRST_ARCH_OPT + 1:
+        test_za = strtol(arg, 0, 10);
+        if (test_za <= 0 || test_za > SVE_VQ_MAX
+            || (test_za & (test_za - 1))) {
+            fprintf(stderr, "Invalid value for ZA VQ (1-%d)\n", SVE_VQ_MAX);
+            exit(EXIT_FAILURE);
+        }
+        break;
+    default:
+        abort();
     }
 }
 
@@ -51,6 +70,31 @@ void arch_init(void)
 {
     long want, got;
 
+    if (test_za) {
+        /*
+         * For now, reginfo requires NVL == SVL.
+         * There doesn't seem to be much advantage to differing.
+         */
+        if (test_sve && test_sve != test_za) {
+            fprintf(stderr, "Mismatched values for SVE and ZA VQ\n");
+            exit(EXIT_FAILURE);
+        }
+
+        want = sve_vl_from_vq(test_za);
+        got = prctl(PR_SME_SET_VL, want);
+        if (want != got) {
+            if (got >= 0) {
+                fprintf(stderr, "Unsupported VQ for ZA (%d != %d)\n",
+                        test_za, (int)sve_vq_from_vl(got));
+            } else if (errno == EINVAL) {
+                fprintf(stderr, "System does not support SME\n");
+            } else {
+                perror("prctl PR_SME_SET_VL");
+            }
+            exit(EXIT_FAILURE);
+        }
+    }
+
     if (test_sve) {
         want = sve_vl_from_vq(test_sve);
         got = prctl(PR_SVE_SET_VL, want);
@@ -75,6 +119,9 @@ int reginfo_size(struct reginfo *ri)
     if (ri->sve_vl) {
         int vq = sve_vq_from_vl(ri->sve_vl);
         size += RISU_SVE_REGS_SIZE(vq);
+        if (ri->svcr & SVCR_ZA) {
+            size += ZA_SIG_REGS_SIZE(vq);
+        }
     } else {
         size += RISU_SIMD_REGS_SIZE;
     }
@@ -84,10 +131,11 @@ int reginfo_size(struct reginfo *ri)
 /* reginfo_init: initialize with a ucontext */
 void reginfo_init(struct reginfo *ri, ucontext_t *uc)
 {
-    int i;
+    int i, vq;
     struct _aarch64_ctx *ctx, *extra = NULL;
     struct fpsimd_context *fp = NULL;
-    struct sve_context *sve = NULL;
+    risu_sve_context *sve = NULL;
+    risu_za_context *za = NULL;
 
     /* necessary to be able to compare with memcmp later */
     memset(ri, 0, sizeof(*ri));
@@ -112,6 +160,9 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
         case SVE_MAGIC:
             sve = (void *)ctx;
             break;
+        case ZA_MAGIC:
+            za = (void *)ctx;
+            break;
         case EXTRA_MAGIC:
             extra = (void *)((struct extra_context *)(ctx))->datap;
             break;
@@ -134,21 +185,55 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
     ri->fpsr = fp->fpsr;
     ri->fpcr = fp->fpcr;
 
-    if (test_sve) {
-        int vq = test_sve;
+    /*
+     * Note that arch_init required NVL==SVL, so test_sve and test_za
+     * are equal when non-zero.  We will verify this matches below.
+     */
+    vq = test_sve | test_za;
+    ri->sve_vl = sve_vl_from_vq(vq);
 
-        if (sve == NULL) {
-            fprintf(stderr, "risu_reginfo_aarch64: failed to get SVE state\n");
+    if (test_za) {
+        if (za == NULL) {
+            /* ZA_MAGIC is supposed to be present, even if empty. */
+            fprintf(stderr, "risu_reginfo_aarch64: missing ZA state\n");
             return;
         }
+        assert(za->head.size >= ZA_SIG_CONTEXT_SIZE(0));
 
-        if (sve->vl != sve_vl_from_vq(vq)) {
+        if (za->vl != ri->sve_vl) {
             fprintf(stderr, "risu_reginfo_aarch64: "
-                    "unexpected SVE state: %d != %d\n",
-                    sve->vl, sve_vl_from_vq(vq));
+                    "unexpected ZA VQ: %d != %d\n",
+                    za->vl, ri->sve_vl);
+            return;
+        }
+        if (za->head.size == ZA_SIG_CONTEXT_SIZE(0)) {
+            /* ZA storage is disabled. */
+        } else if (za->head.size < ZA_SIG_CONTEXT_SIZE(vq)) {
+            fprintf(stderr, "risu_reginfo_aarch64: "
+                    "failed to get complete ZA state\n");
+            return;
+        } else {
+            ri->svcr |= SVCR_ZA;
+            memcpy(reginfo_zav(ri, vq, 0), (char *)za + ZA_SIG_REGS_OFFSET,
+                   ZA_SIG_CONTEXT_SIZE(vq) - ZA_SIG_REGS_OFFSET);
+        }
+    }
+
+    if (test_sve) {
+        if (sve == NULL) {
+            /* SVE_MAGIC is supposed to be present, even if empty. */
+            fprintf(stderr, "risu_reginfo_aarch64: missing SVE state\n");
             return;
         }
 
+        if (sve->vl != ri->sve_vl) {
+            fprintf(stderr, "risu_reginfo_aarch64: "
+                    "unexpected SVE VQ: %d != %d\n",
+                    sve->vl, ri->sve_vl);
+            return;
+        }
+
+        ri->svcr |= sve->flags & SVE_SIG_FLAG_SM;
         if (sve->head.size <= SVE_SIG_CONTEXT_SIZE(0)) {
             /* Only AdvSIMD state is present. */
         } else if (sve->head.size < SVE_SIG_CONTEXT_SIZE(vq)) {
@@ -156,7 +241,6 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
                     "failed to get complete SVE state\n");
             return;
         } else {
-            ri->sve_vl = sve->vl;
             memcpy(reginfo_zreg(ri, vq, 0),
                    (char *)sve + SVE_SIG_REGS_OFFSET,
                    SVE_SIG_REGS_SIZE(vq));
@@ -164,7 +248,18 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
         }
     }
 
-    memcpy(reginfo_vreg(ri, 0), fp->vregs, RISU_SIMD_REGS_SIZE);
+    /*
+     * Be prepared for ZA state present but SVE state absent (VQ != 0).
+     * In which case, copy AdvSIMD vregs into the low portion of zregs;
+     * pregs remain all zero.
+     */
+    if (vq == 0) {
+        memcpy(reginfo_vreg(ri, 0), fp->vregs, RISU_SIMD_REGS_SIZE);
+    } else {
+        for (i = 0; i < 32; ++i) {
+            memcpy(reginfo_zreg(ri, vq, i), &fp->vregs[i], 16);
+        }
+    }
 }
 
 /* reginfo_is_eq: compare the reginfo structs, returns nonzero if equal */
@@ -248,9 +343,11 @@ void reginfo_dump(struct reginfo *ri, FILE * f)
     fprintf(f, "  fpcr   : %08x\n", ri->fpcr);
 
     if (ri->sve_vl) {
-        int vq = sve_vq_from_vl(ri->sve_vl);
+        int vl = ri->sve_vl;
+        int vq = sve_vq_from_vl(vl);
 
-        fprintf(f, "  vl     : %d\n", ri->sve_vl);
+        fprintf(f, "  vl     : %d\n", vl);
+        fprintf(f, "  svcr   : %d\n", ri->svcr);
 
         for (i = 0; i < SVE_NUM_ZREGS; i++) {
             uint64_t *z = reginfo_zreg(ri, vq, i);
@@ -270,6 +367,14 @@ void reginfo_dump(struct reginfo *ri, FILE * f)
             sve_dump_preg(f, vq, p);
             fprintf(f, "\n");
         }
+
+        if (ri->svcr & SVCR_ZA) {
+            for (i = 0; i < vl; ++i) {
+                uint64_t *z = reginfo_zav(ri, vq, i);
+                fprintf(f, "  ZA[%-3d]: ", i);
+                sve_dump_zreg(f, vq, z);
+            }
+        }
         return;
     }
 
@@ -322,6 +427,10 @@ void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
         fprintf(f, "  vl     : %d vs %d\n", m->sve_vl, a->sve_vl);
     }
 
+    if (m->svcr != a->svcr) {
+        fprintf(f, "  svcr   : %d vs %d\n", m->svcr, a->svcr);
+    }
+
     if (m->sve_vl) {
         int vq = sve_vq_from_vl(m->sve_vl);
 
@@ -347,6 +456,18 @@ void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
                 sve_dump_preg_diff(f, vq, pm, pa);
             }
         }
+
+        if (m->svcr & a->svcr & SVCR_ZA) {
+            for (i = 0; i < vq * 16; i++) {
+                uint64_t *zm = reginfo_zav(m, vq, i);
+                uint64_t *za = reginfo_zav(a, vq, i);
+
+                if (!sve_zreg_is_eq(vq, zm, za)) {
+                    fprintf(f, "  ZA[%-3d]: ", i);
+                    sve_dump_zreg_diff(f, vq, zm, za);
+                }
+            }
+        }
         return;
     }
 
-- 
2.34.1


Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1319418lfb;
        Tue, 12 May 2020 09:41:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypKUXT8yiZ4cYlIYsIv70XaK9gkW7O83hzgvy9vNlJwVpG/H9ud+HWHsZvJNpybALflG+SxQ
X-Received: by 2002:ac8:66da:: with SMTP id m26mr22329056qtp.342.1589301699852;
        Tue, 12 May 2020 09:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589301699; cv=none;
        d=google.com; s=arc-20160816;
        b=g0An1CJPSkFiehJHBShDgn5GTo7Hpr2JCrjnQ+v8jR5vGJ/tT81Vs73brnOg+77f/9
         EHEcy8m4fc04XYWAgIzmFUbz1PzR30w+GylhHu+5hTNFVmBCRY5jcOb0MgeAu8P+HYq6
         iezy7i03ARNdNms1q8C3hzUrrGb9kd/SRLdVKElUl8cV2Y8Zm03cjfawciESDzlUy1bf
         YvnLVbrvX5KGVSMnVzBbIhDToGp98ZgJsEUZ8QphEwV7s6va3ekrirMmsRXDaWSvoRGX
         iAeKf72rGj2fCyskEbXZ8oXxayI+MCZuHWQN+/eaSAHA8+phpFc+2qSj46wZX9TYKDYk
         mDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LFie1FH/ju2YqNiDPeao+ABy38l5WYz9XJznVyORJzE=;
        b=wX3QPm7DMsv+5K9LKrW1QsaTXwnclqDDqUwFDm6nTTsit0tZ6K9MqEBLUJPUEin2az
         lKbYC/cOis1QCez18xaX9zNKL6MGhWfubV8K4dfbN9GhRzQmt0JlgVjZ1XKejnyiSf5D
         PGIzKN+WBSiW/q0Y3jE+QqXY5p5sxj95VeTZs5nrX7GeuA6Ct+07E9zZaC4vVbEZyEGb
         3sCOBXb34HMcQbTOa2ZtOTnNXFMHD6znFVTOEkx0P08VR83BxanJJ3l41vjZrnSXSr34
         fWAcw5trCvXKF36bOqTzmdJaBkJnGNyMga7WMtsv3EKH2XPA4xafMwr5XBPXi7gQS2q0
         EUmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KPYHlz8u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 195si7861280qkl.36.2020.05.12.09.41.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 09:41:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KPYHlz8u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYXyN-0000sj-4V
	for alex.bennee@linaro.org; Tue, 12 May 2020 12:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXwB-0006d9-N6
 for qemu-devel@nongnu.org; Tue, 12 May 2020 12:39:23 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXwA-0006Be-My
 for qemu-devel@nongnu.org; Tue, 12 May 2020 12:39:23 -0400
Received: by mail-wr1-x442.google.com with SMTP id e16so16301962wra.7
 for <qemu-devel@nongnu.org>; Tue, 12 May 2020 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LFie1FH/ju2YqNiDPeao+ABy38l5WYz9XJznVyORJzE=;
 b=KPYHlz8ul+lAQJ6bJDuLcalj9jDMSZ+4OzGpnGamenY7PToERdYP7YWNgAfOgmBEtL
 QoUq//MjRJKwRK2oDEp5t4cdeXuMzt+Ka+l30yKZZB9c1aOwq+GaFfqZfRZfuJ7FSQe/
 Tkn0KZWZ1yJBAHpsM8GyJNklAKYG4TS4GaGDgAcHyBxBIKkWe7wMV4WhXAQwlEz6LwHj
 S4kTTp2ekzCzWVI6g3FWcSz3IxEMQyLECdXUq6gLQJY9gQJuRqRYDo1G48oBr9ODWvTp
 EB4Ulxi9B5HSbzgEe6RiGvx1MA5YA8cOdxQXRyKE2EwWU3BMz1DySDiK44b/9B/5dUbW
 BC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LFie1FH/ju2YqNiDPeao+ABy38l5WYz9XJznVyORJzE=;
 b=DnQD+f/DRyxG6uBbsG40fYV1JTO9h4xL3CFukl4C8qsoSFjdIMYFFtpIz430UKrh9H
 88BoYQn6+cgyEZrYXHl7zHz00WE502IIb8/VUUXj3vC1pmEoTFKt//0WzYS+eebQeMBX
 pRcB3ORNFy66CtzzQdSOI7uNVfR8ehe9t1/etzyXh+4Y0XGeB6CsEZHPS8k44WN/5BEA
 s0BaK41i4CJH8ZHMMeUmCHxUc3IvI/tLBd0Ql9pwjFrzsBhJVsuoE8C/v4PnRTm9xnHV
 QlGxifSohbFzypXmkLSZzsec+CzTG0pyxF5BGeVxrF1rG3rKMgqn7EfGTqNnI///LaLv
 /LHQ==
X-Gm-Message-State: AOAM532g81LTmeMiBJpSIrT58x293up8WTgHVdTfdua3sDXqZC26/hb8
 SP3Su5er41vPyrs3dmY4yglrTnoFa943Ew==
X-Received: by 2002:a5d:4447:: with SMTP id x7mr1442653wrr.424.1589301561462; 
 Tue, 12 May 2020 09:39:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm18525981wmo.32.2020.05.12.09.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 09:39:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 10/17] target/arm: Convert Neon VQDMULH/VQRDMULH 3-reg-same
 to decodetree
Date: Tue, 12 May 2020 17:38:57 +0100
Message-Id: <20200512163904.10918-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200512163904.10918-1-peter.maydell@linaro.org>
References: <20200512163904.10918-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0LSqZG3/U5rK

Convert the Neon VQDMULH and VQRDMULH 3-reg-same insns to
decodetree. These are the last integer operations in the
3-reg-same group.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       |  3 +++
 target/arm/translate-neon.inc.c | 24 ++++++++++++++++++++++++
 target/arm/translate.c          | 24 +-----------------------
 3 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 9bbb2dd77e0..28e8333335d 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -153,6 +153,9 @@ VPMAX_U_3s       1111 001 1 0 . .. .... .... 1010 . . . 0 .... @3same_q0
 VPMIN_S_3s       1111 001 0 0 . .. .... .... 1010 . . . 1 .... @3same_q0
 VPMIN_U_3s       1111 001 1 0 . .. .... .... 1010 . . . 1 .... @3same_q0
 
+VQDMULH_3s       1111 001 0 0 . .. .... .... 1011 . . . 0 .... @3same
+VQRDMULH_3s      1111 001 1 0 . .. .... .... 1011 . . . 0 .... @3same
+
 VPADD_3s         1111 001 0 0 . .. .... .... 1011 . . . 1 .... @3same_q0
 
 VQRDMLAH_3s      1111 001 1 0 . .. .... .... 1011 ... 1 .... @3same
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index e0137364075..f52302f42b1 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -997,3 +997,27 @@ DO_3SAME_PAIR(VPMIN_S, pmin_s)
 DO_3SAME_PAIR(VPMAX_U, pmax_u)
 DO_3SAME_PAIR(VPMIN_U, pmin_u)
 DO_3SAME_PAIR(VPADD, padd_u)
+
+#define DO_3SAME_VQDMULH(INSN, FUNC)                                    \
+    WRAP_ENV_FN(gen_##INSN##_tramp16, gen_helper_neon_##FUNC##_s16);    \
+    WRAP_ENV_FN(gen_##INSN##_tramp32, gen_helper_neon_##FUNC##_s32);    \
+    static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
+                                uint32_t rn_ofs, uint32_t rm_ofs,       \
+                                uint32_t oprsz, uint32_t maxsz)         \
+    {                                                                   \
+        static const GVecGen3 ops[2] = {                                \
+            { .fni4 = gen_##INSN##_tramp16 },                           \
+            { .fni4 = gen_##INSN##_tramp32 },                           \
+        };                                                              \
+        tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, oprsz, maxsz, &ops[vece - 1]); \
+    }                                                                   \
+    static bool trans_##INSN##_3s(DisasContext *s, arg_3same *a)        \
+    {                                                                   \
+        if (a->size != 1 && a->size != 2) {                             \
+            return false;                                               \
+        }                                                               \
+        return do_3same(s, a, gen_##INSN##_3s);                         \
+    }
+
+DO_3SAME_VQDMULH(VQDMULH, qdmulh)
+DO_3SAME_VQDMULH(VQRDMULH, qrdmulh)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ce30417014d..561cb67286d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5432,6 +5432,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         case NEON_3R_VPMAX:
         case NEON_3R_VPMIN:
         case NEON_3R_VPADD_VQRDMLAH:
+        case NEON_3R_VQDMULH_VQRDMULH:
             /* Already handled by decodetree */
             return 1;
         }
@@ -5496,29 +5497,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             tmp2 = neon_load_reg(rm, pass);
         }
         switch (op) {
-        case NEON_3R_VQDMULH_VQRDMULH: /* Multiply high.  */
-            if (!u) { /* VQDMULH */
-                switch (size) {
-                case 1:
-                    gen_helper_neon_qdmulh_s16(tmp, cpu_env, tmp, tmp2);
-                    break;
-                case 2:
-                    gen_helper_neon_qdmulh_s32(tmp, cpu_env, tmp, tmp2);
-                    break;
-                default: abort();
-                }
-            } else { /* VQRDMULH */
-                switch (size) {
-                case 1:
-                    gen_helper_neon_qrdmulh_s16(tmp, cpu_env, tmp, tmp2);
-                    break;
-                case 2:
-                    gen_helper_neon_qrdmulh_s32(tmp, cpu_env, tmp, tmp2);
-                    break;
-                default: abort();
-                }
-            }
-            break;
         case NEON_3R_FLOAT_ARITH: /* Floating point arithmetic. */
         {
             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-- 
2.20.1


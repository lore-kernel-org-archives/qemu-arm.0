Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1321807lfb;
        Tue, 12 May 2020 09:44:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypJx6G0hdhG8fj5DURyL0/6MTMR6+1XfPSbOprYgqTCBUfIZrHYKaa+KqWSMmF9CZmx2B4nc
X-Received: by 2002:ac8:7586:: with SMTP id s6mr15221018qtq.96.1589301898439;
        Tue, 12 May 2020 09:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589301898; cv=none;
        d=google.com; s=arc-20160816;
        b=sSUJXEJyyxZLmOIHtoxb8buSWYR54lYkNp5xMxFq+qU9+SlUulOflFkvgRrWhXZcHl
         YZW565YfhA2Vjv07xWJfHOLnX7fvHZOVU8Ix9xKF0i/Yjb4JuGr+LkEUP2WGCo1GJW5L
         82k/oG/C723KRJw40qH9SC7N0kwCbPWXeRGqUSJYzswsm/VTyw1O+TqrozJ+g+DL2yYy
         lV0GrFg43INRWBQejuO2ECzzm/91PWNqBC5ndjMcjcVl630zXskfNJR3j2D0jHg/eTs6
         odMwHb+JPmBUQYFeSQ4XxKvEpPQcGtPsUlDdRVPoYhJXuNf2ZSYmAu8+Vyv1ozn2uY5O
         gHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kVCumtOJ/X5yIQDESAlRm3BAiW9FGll9wJVdRpfR4eg=;
        b=KxbX4rGqurC/AiAbs2DDq1LMl0VqgyoEyul7Tti/Yul/C50QLpYN54HEeDnAm7DyNu
         mrMqRLYLEK6tUygxjRUFXxO4K53S2sa8Q13WEh/aADd1EMOEBNsb43vqHulB6EYdepSo
         6dcsPvFWDIL5gr1+ybPsVmRLhpEErook0fYiv3h1Vj5NRMuMUgICyeBqB9K2J03O4UGQ
         W7Nmz8pzr+jB/i5KKiLOYEYmjOeXQDT4m0miDc5vUZ+cCdD1s9dThCmro011klbS3FRD
         wOJN6a7Z1SOcq0fMFdxBhFrv5/q5fIT9kx6+da5mr1ocMZugNFsPg1UIRbM6iv6HEADK
         yYQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gYvfBvPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a138si8140571qkc.26.2020.05.12.09.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 09:44:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gYvfBvPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYY1Z-00063O-MX
	for alex.bennee@linaro.org; Tue, 12 May 2020 12:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXwA-0006aQ-It
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:22 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:32997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXw9-0006A6-Pi
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:22 -0400
Received: by mail-wr1-x442.google.com with SMTP id l11so10390636wru.0
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 09:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kVCumtOJ/X5yIQDESAlRm3BAiW9FGll9wJVdRpfR4eg=;
 b=gYvfBvPUqHBPhvMm8rtMFXRdY9/euVj2Qr7pAEtIoYhvZ9YzMqVspNBzq+chcYPJ0i
 1UHS8MT6mL18s99a+MLzuoxY1PZ1gEbBY1cVaYqe0N7uNg9yQihx2i7KRhH557Up7tmk
 NZrBcI4kxdSOMJU6wELUj3mPLi6KrtbXjqmVTryaHuLwUmdVbKy1QNOpSFTbsOE7Ruq4
 JYIcV2FV8Yw6orA/uH4AOcsz2O3oRVSeUa/dBg5PkHbYNYLXHHQzBGT7vRe7VsJkXbob
 JRoNFF2zQHUr18zfoVe/9kphILGfpEVfLYfcwzE4Qp3evSK9npU0leSfqeVqYWLaytaZ
 V/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kVCumtOJ/X5yIQDESAlRm3BAiW9FGll9wJVdRpfR4eg=;
 b=baJK2CJ9OmsP57CqqqMhCNsg1RWiW6vaNVmo/FV+D5ovwJrvaMdRlPEo9Ilvf9ePnN
 8Bb6xfv2+KMDwJ+PxuFGgmgKBH3NEHex3S49pz9uxi98uUjCPzSJwvcGk26XiZsiQKSO
 28hvRvohe62f6HcTo6ECTYkg+uLbWg7PfDLAowdnvAOksC1fnF01pYoKXBWZM+UWLSLQ
 T1TO1pXt51J5FXgnVs2Rm0kL5ns28yL7Bayw1nF2dNhDqQMxpzryzNzKkVQR4Iu3bVEK
 qhiim78IPoGh4CipAShUWMilwwDmkeXR40BcCIhd8PiOnWhEW4UWhTJv7EVs4VQM91YI
 OP6g==
X-Gm-Message-State: AGi0PuY4oVxuAVl/zDl7KmoUoo/j+OHtvQWYNVcR7kh6xuCFqJ+jRTdA
 r7UJs1VEBSm0liPtwBgPd7XFLnEhPqGseA==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr25614588wrq.169.1589301560203; 
 Tue, 12 May 2020 09:39:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm18525981wmo.32.2020.05.12.09.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 09:39:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 09/17] target/arm: Convert Neon VPADD 3-reg-same insns to
 decodetree
Date: Tue, 12 May 2020 17:38:56 +0100
Message-Id: <20200512163904.10918-10-peter.maydell@linaro.org>
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
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S3e5iuQXmAvD

Convert the Neon integer VPADD 3-reg-same insns to decodetree.  These
are 'pairwise' operations.  (Note that VQRDMLAH, which shares the
same primary opcode but has U=1, has already been converted.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-dp.decode       |  2 ++
 target/arm/translate-neon.inc.c |  2 ++
 target/arm/translate.c          | 19 +------------------
 3 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 03f39a0b44b..9bbb2dd77e0 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -153,6 +153,8 @@ VPMAX_U_3s       1111 001 1 0 . .. .... .... 1010 . . . 0 .... @3same_q0
 VPMIN_S_3s       1111 001 0 0 . .. .... .... 1010 . . . 1 .... @3same_q0
 VPMIN_U_3s       1111 001 1 0 . .. .... .... 1010 . . . 1 .... @3same_q0
 
+VPADD_3s         1111 001 0 0 . .. .... .... 1011 . . . 1 .... @3same_q0
+
 VQRDMLAH_3s      1111 001 1 0 . .. .... .... 1011 ... 1 .... @3same
 
 SHA1_3s          1111 001 0 0 . optype:2 .... .... 1100 . 1 . 0 .... \
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 7db6b856598..e0137364075 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -990,8 +990,10 @@ static bool do_3same_pair(DisasContext *s, arg_3same *a, NeonGenTwoOpFn *fn)
 #define gen_helper_neon_pmax_u32  tcg_gen_umax_i32
 #define gen_helper_neon_pmin_s32  tcg_gen_smin_i32
 #define gen_helper_neon_pmin_u32  tcg_gen_umin_i32
+#define gen_helper_neon_padd_u32  tcg_gen_add_i32
 
 DO_3SAME_PAIR(VPMAX_S, pmax_s)
 DO_3SAME_PAIR(VPMIN_S, pmin_s)
 DO_3SAME_PAIR(VPMAX_U, pmax_u)
 DO_3SAME_PAIR(VPMIN_U, pmin_u)
+DO_3SAME_PAIR(VPADD, padd_u)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 82be4d40282..ce30417014d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5397,13 +5397,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             return 1;
         }
         switch (op) {
-        case NEON_3R_VPADD_VQRDMLAH:
-            if (!u) {
-                break;  /* VPADD */
-            }
-            /* VQRDMLAH : handled by decodetree */
-            return 1;
-
         case NEON_3R_VFM_VQRDMLSH:
             if (!u) {
                 /* VFM, VFMS */
@@ -5438,6 +5431,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         case NEON_3R_VQRSHL:
         case NEON_3R_VPMAX:
         case NEON_3R_VPMIN:
+        case NEON_3R_VPADD_VQRDMLAH:
             /* Already handled by decodetree */
             return 1;
         }
@@ -5448,9 +5442,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         }
         pairwise = 0;
         switch (op) {
-        case NEON_3R_VPADD_VQRDMLAH:
-            pairwise = 1;
-            break;
         case NEON_3R_FLOAT_ARITH:
             pairwise = (u && size < 2); /* if VPADD (float) */
             break;
@@ -5528,14 +5519,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 }
             }
             break;
-        case NEON_3R_VPADD_VQRDMLAH:
-            switch (size) {
-            case 0: gen_helper_neon_padd_u8(tmp, tmp, tmp2); break;
-            case 1: gen_helper_neon_padd_u16(tmp, tmp, tmp2); break;
-            case 2: tcg_gen_add_i32(tmp, tmp, tmp2); break;
-            default: abort();
-            }
-            break;
         case NEON_3R_FLOAT_ARITH: /* Floating point arithmetic. */
         {
             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-- 
2.20.1


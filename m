Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1118601wrp;
        Wed, 4 Sep 2019 12:37:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzLeSm6f5CNYo9bne+YYRGTubGgWofWamcy8SkEEymaMPvu84XbR1Y9u7GEUTaytAfKjjAE
X-Received: by 2002:ac8:4895:: with SMTP id i21mr41840600qtq.146.1567625837519;
        Wed, 04 Sep 2019 12:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567625837; cv=none;
        d=google.com; s=arc-20160816;
        b=qGUGqygcSebybIleBwplvgwfOUTSQVKDZAXG1N5H+X+nW8vSrsQ+5Qc7ecXimKNuPq
         SLq0k+vJIygarhwbkOgH9pPhmNFNqnGmGWnpa90j01EpR3drAjFflyZQGGSJxjmmP20X
         MABEh7R93qjbMHkoOGvfxFmKvfbLi/EJ1ykJ2uOQO+1GVWQAOb340LaLxJBC1Y5PElJv
         jLmPwckoxSddt5SVSw6TMV/M67ppcUPpB5u3FQqo+wHWL6L90Raqy0pfAsr9c6it6jOa
         u/gEM0+HbLQBFRtV0TujhBt2h+aHX25ihPplrmDqBPAUKAkEoV+i30w4A9sGB9+O6/Zm
         tP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=qTBjneugtZF+JoWXJ5FX48BYqpDgfu4BcdXmC9Vl7mc=;
        b=l9rGMYoc3uej1nhGCpb2NeyIsySMYN6kE6xx35G+j2dbIDCvoD/+LxXHjFvwM3OMrh
         uxJYuidI00p0hRYRD0lLPZVcahSYfVUqJwXEc6sBZmwyP5jL5+et9BvsJr8HRzxI5O3f
         dCRvk1nO+ET5ih1icP0AUxBd40F7+7uC400c2RM6E70Y6YW/ueA1xxZO1lKBz1tUGr4i
         RM9UKUvrnrzX1Zus5s3QxDwn6wdhcjtgOgqJdMtG2lPGnlmn65brpABTE0I2BmfEs2sr
         EBg9gmFndPASdBaWVel/XP0LxPdW0wpZyKTSET0UQsqb5UDnXWPZKcuN+n6x/bnecRwI
         +SNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DThbwQFo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b129si10622247qkg.11.2019.09.04.12.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 12:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DThbwQFo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5b5f-0001Xq-DA
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 15:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39837)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azr-0004E7-2p
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azp-0002AM-0z
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:14 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42287)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5azo-00029S-Ep
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:12 -0400
Received: by mail-pg1-x531.google.com with SMTP id p3so11766243pgb.9
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qTBjneugtZF+JoWXJ5FX48BYqpDgfu4BcdXmC9Vl7mc=;
 b=DThbwQFoX4lrYPGrFakxxGuxvnL9WS4y8KglsDchw1r2YrIJLI5zFITZGthASxkvKV
 94ZwvDXjVXNLUeJoD0XXl70UilJ3M3LGBZN1FQAG7C4IbGwBmAXvsu+WjGSJvZTTM2HU
 HSJkt66aMtBxiAhCjy+XU9ZTO+ZGnJnxvhRF/KzHc+RiZdwreIq7l1VdvxDsCqQYkESW
 Iw8R0/pGnq/LySiMttD9wpipucZkVpM3QxaVDaX/Siq6IsLHxTs1q9msTIcpkh+Y8ly3
 CfxZIz2pf7S/fIK16tY2YkMSqB/4wByf3C8017xXW+RYqZKCSt1kqenZLcId2r0rZkLu
 aTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qTBjneugtZF+JoWXJ5FX48BYqpDgfu4BcdXmC9Vl7mc=;
 b=Ao8ZyrIDWLxkbFFGZPXdO7eZJS0XmTC2RaSgah+wJGL7aXbksZWKalWjNf117ee+B8
 A9TDDVXXNpobvMPUg+3/PccOXBDowuFzSBxhZh2hVdi/Ng54Lem3dAl5NFnHpliUknVA
 AXpLpjN1mN9jA/z6p459ZhLDJk6HkAmuhLFpRxx42Nj1ry67XirSJ5K4mQrcdJULuhmb
 RPdm6CQEQIozw+GC7o7SUA5bMeWRuiZOoqvTfJrv+Kt5jgzzNXIKW5ZloKN0qdLMcFvt
 moakEK8LxYmJlH0gIrxjmYU3ynrDAhavFR63NxcFX47Y/DmgDymfsdzw+/qB2IKxDiEv
 ASnA==
X-Gm-Message-State: APjAAAWtZSazzmHndixBTWo1tfcfeAfNIRrwlmSnZm2stCcn+KWGZUtu
 6KUlSco8YObfbeTv76gAsJDMmw==
X-Received: by 2002:a17:90a:7783:: with SMTP id
 v3mr6417490pjk.109.1567625470998; 
 Wed, 04 Sep 2019 12:31:10 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:29:58 -0700
Message-Id: <20190904193059.26202-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::531
Subject: [Qemu-arm] [PATCH v4 08/69] target/arm: Convert Saturating addition
 and subtraction
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jFARezGW21uN

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 75 +++++++++++++++++++++++++++---------------
 target/arm/a32.decode  | 10 ++++++
 target/arm/t32.decode  |  9 +++++
 3 files changed, 67 insertions(+), 27 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8d70f15a4f..ddb2c764a1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8128,6 +8128,48 @@ static bool trans_UMAAL(DisasContext *s, arg_UMAAL *a)
     return true;
 }
 
+/*
+ * Saturating addition and subtraction
+ */
+
+static bool op_qaddsub(DisasContext *s, arg_rrr *a, bool add, bool doub)
+{
+    TCGv_i32 t0, t1;
+
+    if (s->thumb
+        ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
+        : !ENABLE_ARCH_5TE) {
+        return false;
+    }
+
+    t0 = load_reg(s, a->rm);
+    t1 = load_reg(s, a->rn);
+    if (doub) {
+        gen_helper_add_saturate(t1, cpu_env, t1, t1);
+    }
+    if (add) {
+        gen_helper_add_saturate(t0, cpu_env, t0, t1);
+    } else {
+        gen_helper_sub_saturate(t0, cpu_env, t0, t1);
+    }
+    tcg_temp_free_i32(t1);
+    store_reg(s, a->rd, t0);
+    return true;
+}
+
+#define DO_QADDSUB(NAME, ADD, DOUB) \
+static bool trans_##NAME(DisasContext *s, arg_rrr *a)    \
+{                                                        \
+    return op_qaddsub(s, a, ADD, DOUB);                  \
+}
+
+DO_QADDSUB(QADD, true, false)
+DO_QADDSUB(QSUB, false, false)
+DO_QADDSUB(QDADD, true, true)
+DO_QADDSUB(QDSUB, false, true)
+
+#undef DO_QADDSUB
+
 /*
  * Legacy decoder.
  */
@@ -8537,21 +8579,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             store_reg(s, rd, tmp);
             break;
         }
-        case 0x5: /* saturating add/subtract */
-            ARCH(5TE);
-            rd = (insn >> 12) & 0xf;
-            rn = (insn >> 16) & 0xf;
-            tmp = load_reg(s, rm);
-            tmp2 = load_reg(s, rn);
-            if (op1 & 2)
-                gen_helper_add_saturate(tmp2, cpu_env, tmp2, tmp2);
-            if (op1 & 1)
-                gen_helper_sub_saturate(tmp, cpu_env, tmp, tmp2);
-            else
-                gen_helper_add_saturate(tmp, cpu_env, tmp, tmp2);
-            tcg_temp_free_i32(tmp2);
-            store_reg(s, rd, tmp);
-            break;
+        case 0x5:
+            /* Saturating addition and subtraction.  */
+            /* All done in decodetree.  Reach here for illegal ops.  */
+            goto illegal_op;
         case 0x6: /* ERET */
             if (op1 != 3) {
                 goto illegal_op;
@@ -10024,18 +10055,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             op = ((insn >> 17) & 0x38) | ((insn >> 4) & 7);
             if (op < 4) {
                 /* Saturating add/subtract.  */
-                if (!arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)) {
-                    goto illegal_op;
-                }
-                tmp = load_reg(s, rn);
-                tmp2 = load_reg(s, rm);
-                if (op & 1)
-                    gen_helper_add_saturate(tmp, cpu_env, tmp, tmp);
-                if (op & 2)
-                    gen_helper_sub_saturate(tmp, cpu_env, tmp2, tmp);
-                else
-                    gen_helper_add_saturate(tmp, cpu_env, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
+                /* All done in decodetree.  Reach here for illegal ops.  */
+                goto illegal_op;
             } else {
                 switch (op) {
                 case 0x0a: /* rbit */
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 87bbb2eec2..7791be5590 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -27,6 +27,7 @@
 &s_rri_rot       s rn rd imm rot
 &s_rrrr          s rd rn rm ra
 &rrrr            rd rn rm ra
+&rrr             rd rn rm
 
 # Data-processing (register)
 
@@ -122,3 +123,12 @@ UMULL            .... 0000 100 . .... .... .... 1001 ....     @s_rdamn
 UMLAL            .... 0000 101 . .... .... .... 1001 ....     @s_rdamn
 SMULL            .... 0000 110 . .... .... .... 1001 ....     @s_rdamn
 SMLAL            .... 0000 111 . .... .... .... 1001 ....     @s_rdamn
+
+# Saturating addition and subtraction
+
+@rndm            ---- .... .... rn:4 rd:4 .... .... rm:4      &rrr
+
+QADD             .... 0001 0000 .... .... 0000 0101 ....      @rndm
+QSUB             .... 0001 0010 .... .... 0000 0101 ....      @rndm
+QDADD            .... 0001 0100 .... .... 0000 0101 ....      @rndm
+QDSUB            .... 0001 0110 .... .... 0000 0101 ....      @rndm
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 40cc69aee3..7c6226e0af 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -24,6 +24,7 @@
 &s_rri_rot       !extern s rn rd imm rot
 &s_rrrr          !extern s rd rn rm ra
 &rrrr            !extern rd rn rm ra
+&rrr             !extern rd rn rm
 
 # Data-processing (register)
 
@@ -117,6 +118,7 @@ RSB_rri          1111 0.0 1110 . .... 0 ... .... ........     @s_rri_rot
 @s0_rnadm        .... .... .... rn:4 ra:4 rd:4 .... rm:4      &s_rrrr s=0
 @s0_rn0dm        .... .... .... rn:4 .... rd:4 .... rm:4      &s_rrrr ra=0 s=0
 @rnadm           .... .... .... rn:4 ra:4 rd:4 .... rm:4      &rrrr
+@rndm            .... .... .... rn:4 .... rd:4 .... rm:4      &rrr
 
 {
   MUL            1111 1011 0000 .... 1111 .... 0000 ....      @s0_rn0dm
@@ -128,3 +130,10 @@ UMULL            1111 1011 1010 .... .... .... 0000 ....      @s0_rnadm
 SMLAL            1111 1011 1100 .... .... .... 0000 ....      @s0_rnadm
 UMLAL            1111 1011 1110 .... .... .... 0000 ....      @s0_rnadm
 UMAAL            1111 1011 1110 .... .... .... 0110 ....      @rnadm
+
+# Data-processing (two source registers)
+
+QADD             1111 1010 1000 .... 1111 .... 1000 ....      @rndm
+QSUB             1111 1010 1000 .... 1111 .... 1010 ....      @rndm
+QDADD            1111 1010 1000 .... 1111 .... 1001 ....      @rndm
+QDSUB            1111 1010 1000 .... 1111 .... 1011 ....      @rndm
-- 
2.17.1


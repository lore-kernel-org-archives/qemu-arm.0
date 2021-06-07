Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3704357lfa;
        Mon, 7 Jun 2021 10:38:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6gbfcw22RAjXp4KxeLMbSdmlUjh5vgL7qQpsSKebtnbtcUSj4jQfg+LF2dWPeQyIkvViA
X-Received: by 2002:a05:6638:d4f:: with SMTP id d15mr8933742jak.32.1623087483724;
        Mon, 07 Jun 2021 10:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623087483; cv=none;
        d=google.com; s=arc-20160816;
        b=h6Y727UAmRjY5Zk1aoWcBif4FduFuFdINACoT398g6LIwSDwvSxK++yQUTSLUkY2Yt
         007nEf3Z+VnxUJ9sblM9Pb7NyheScNSelBnoXZiXgaziySIHKZsZEAA0/j6z2kuXiTpX
         Uk41V4ntU648FFoXJJAYDPsNGXWtV7i7FSsv0f8LixTQdKFMuI34RGCcggWPTIOt+I/J
         sHVstEM6zjlVKD5Ig2NEQ1LKzQk4hg3j4u2MErkXEuLjZSH5AykI71HYqhTOX/o1YrTm
         +TkvND1IPGSQ47Ein/aJl91LwE/9awVB8Eb0p75IeWSgW1gQtEYjmcVbYXklNL0s837/
         uzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Mhk9x1c71fMqboSe7SlWTDZQhCtwoaWMB3BCsBAcMv0=;
        b=O+qPdaCGsIeYgjB6QnWrgoHIRMMHGVXDUqTbIX1b1YUuMACULvrMPWcbUrdTE48r5a
         piRkTFE/2z1v2LJxebCKqEV5jtI4Yelwh66iKL4cVLeLHA06Tts/epjzwhu0s+iSn040
         V/mQ/vxoE9f7RROz0WqPWleRqYnRTts8RHSneRIHCI7IHmSYwHabqEmkQhIjD63t8pW5
         QeStc4YnNRcDE9vYaYQCFlV1TGUNWYao6bW86I0OgVnzVZs04brHFVDYf83DFcnufZgI
         BxTC+B1pjcyBjO1B2WcobG9Avb3dba+XLeRKTsyrimqNXm+b/YD8aTnq2rl+ZkqCgwyq
         /s8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nqcn7YGC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si16941718iow.86.2021.06.07.10.38.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:38:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nqcn7YGC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqJCM-000640-T9
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbH-0008TF-77
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:43 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIab-00086C-LG
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:42 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m18so18443984wrv.2
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mhk9x1c71fMqboSe7SlWTDZQhCtwoaWMB3BCsBAcMv0=;
 b=Nqcn7YGC0ANNmjIVahcRhjlElrdgcr7/KqdMUhZ8ikhYDqSaxXM1rNM2YEvJ5XmT42
 2rfuPotSJEOYKnf5zbhReAb7A7IAqeCSjwlDloqXqcDvJMlTQBYtzbxIDlrsbe2HToRS
 xml2sMFMvHYJGd7V7e9rYAzqapRaJWKWkodbcEAHrZkDz51at5XZEYf0QroewNmc5IU7
 d3fVYi1gEdVJPDM5vOlULikmMCwNNHzLesepOnaa92F4K89pT+miUrq4fSOfLMyxuIfz
 FLlBwR0iqKM0U25zihzNY6gmycruuFGLCXeiATrqE8AUoh3BQz7nJh7+Fn3fgdiLr0HN
 1UtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mhk9x1c71fMqboSe7SlWTDZQhCtwoaWMB3BCsBAcMv0=;
 b=IglVLhkLMumtCsFCWlrXEtPPsHsU3MQoVnEBckCRBxS8dw8oWgSIczaEJ64TFjRfvP
 LT3hF/peLyd+NLL5wSQ3OXRHIh9hIus8q1rR9DjBSKgjHMESMuN1EXG7tHl4FoHIiH26
 aC4DxIefqHkIdFkzRtmfUESxEgqiKhNPFUW+rw+n+Qk4ASYI14iEtWKzkn28y8PvMRgD
 tD83yz2AAy0TiTCZG2p5UE2jvc6CHBN1SyElwgM2CRNTriegmHtCF9s5Iv//eLaj/G+4
 bp26yhfRiuZSzegrg1HnhbAgR7AsFwDsT3XwN9pHQ8PBKOiswUzjdepVfBdxuPkz17Yo
 /mLA==
X-Gm-Message-State: AOAM533H/JvVWTFxaFFNU+bvPvV6bcvJSjR2fs93a8fRftnq6qw7+OxV
 PLX+F1gx+B+ZD7CxjyQzsersvLz+ss913WHq
X-Received: by 2002:a5d:64a5:: with SMTP id m5mr17669832wrp.182.1623085139851; 
 Mon, 07 Jun 2021 09:58:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 46/55] target/arm: Implement MVE VRSHL
Date: Mon,  7 Jun 2021 17:58:12 +0100
Message-Id: <20210607165821.9892-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +HKKwxGziw/B

Implement the MVE VRSHL insn (vector form).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 49 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 6ef01d367b4..6939cf84c57 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -179,6 +179,14 @@ DEF_HELPER_FLAGS_4(mve_vshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vrshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vrshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vqshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index ebf156b46b5..c30fb2c1536 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -133,6 +133,9 @@ VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VSHL_S           111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
 VSHL_U           111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
 
+VRSHL_S          111 0 1111 0 . .. ... 0 ... 0 0101 . 1 . 0 ... 0 @2op_rev
+VRSHL_U          111 1 1111 0 . .. ... 0 ... 0 0101 . 1 . 0 ... 0 @2op_rev
+
 VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index c95d5a0fd8e..9c23e6b9b28 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -538,6 +538,42 @@ static inline int32_t do_sshl(int32_t n, int8_t shift, int esize)
 DO_2OP_S(vshls, DO_VSHLS)
 DO_2OP_U(vshlu, DO_VSHLU)
 
+static inline uint32_t do_urshl(uint32_t n, int8_t shift, int esize)
+{
+    if (shift >= esize || shift < -esize) {
+        return 0;
+    } else if (shift == -esize) {
+        return n >> (-esize - 1);
+    } else if (shift < 0) {
+        /* Use 64 bit intermediate: adding the rounding const might overflow */
+        uint64_t r = (uint64_t)n + (1 << (-1 - shift));
+        return r >> -shift;
+    } else {
+        return n << shift;
+    }
+}
+
+static inline int32_t do_srshl(int32_t n, int8_t shift, int esize)
+{
+    if (shift >= esize || shift <= -esize) {
+        return 0;
+    } else if (shift == -esize) {
+        return n >> (-esize - 1);
+    } else if (shift < 0) {
+        /* Use 64 bit intermediate: adding the rounding const might overflow */
+        int64_t r = (int64_t)n + (1 << (-1 - shift));
+        return r >> -shift;
+    } else {
+        return n << shift;
+    }
+}
+
+#define DO_VRSHLS(N, M) do_srshl(N, M, sizeof(N) * 8)
+#define DO_VRSHLU(N, M) do_urshl(N, M, sizeof(N) * 8)
+
+DO_2OP_S(vrshls, DO_VRSHLS)
+DO_2OP_U(vrshlu, DO_VRSHLU)
+
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
     if (val > max) {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 6eaa99bc0f5..6bc32379172 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -423,6 +423,8 @@ DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
 DO_2OP(VSHL_S, vshls)
 DO_2OP(VSHL_U, vshlu)
+DO_2OP(VRSHL_S, vrshls)
+DO_2OP(VRSHL_U, vrshlu)
 DO_2OP(VQSHL_S, vqshls)
 DO_2OP(VQSHL_U, vqshlu)
 DO_2OP(VQRSHL_S, vqrshls)
-- 
2.20.1


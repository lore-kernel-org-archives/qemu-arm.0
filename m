Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1493130lfb;
        Mon, 19 Apr 2021 13:36:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtT2b8lFuBKp/u38RbX713su3QgcEUl7z/o41Y2sz4pkG0WZaarqteD5nXFNLGsS/KWrqK
X-Received: by 2002:a92:cd43:: with SMTP id v3mr19681490ilq.11.1618864610370;
        Mon, 19 Apr 2021 13:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618864610; cv=none;
        d=google.com; s=arc-20160816;
        b=UKMBzT3WZckTZBbQYnntOxMFJZn3bDz31LfBJHWwXpP6MG9oMm2yi5Tzq2VuXEmyIK
         qatczNXLGZ6Ef3xKBb0f5Jy5RdnGWk+JktRfjUBh6JcCpa1xZ+5dldtCZbZ3tMGLdg9q
         z/mFSyI5nR/fhStxTC81nZaSNhUN41o+WsBHXoZjE2I+lFJaSJuN4MLs0nT6N929x7Fp
         FaDOayrtrGkH1MszCjpsAFyMYRCX0HNRB1pcjsafo8IVW9YLoRmIPAlf/Gaxp0PvpBTP
         TTxf2EX4Tbs19GS5rq4aIGuZjDlJkABYkDlr4KJpYgmt5daHKJIAPfZYoiS+Jb+Zy6UF
         3gag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=d4KAjGOIOOmhRwAXEkZoKVidF8e2kIGAWXOFwPXfIFY=;
        b=bWGkM7oCTmCstjNDrDL+7vH7rkMP8IAZDlFdHAZsu2GX9VXCLYUqOtLLq4tTg8nSU8
         x18xhN2sxV9dIBrxGQP2aQY5WeMLL50g8HdZ91V6hLFj47S0n31RrxWL3vPYgucItMrP
         4Xb6fr2xOHbdIDPDR0qS1N/08+6yG2caWTmHYPited26xjpvratYRd28IJDmv9VzGau6
         udKDcGZarMO7jU/nCP9Not/TCpakdd4FUhofXRB31O69TRCn5KWJXZa5JnvbWHy1keqA
         21Ou8IjdlHg6uoRJLokSvGeQ1zIueCglM7ETM9a2zJezPuylw7dRc68jlmXcTJWAJ6Q3
         Dcug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i8fkmY44;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si13560472ilr.157.2021.04.19.13.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:36:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i8fkmY44;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYadV-0003nI-Lx
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQY-0007IP-11
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:26 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:34574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQW-0002Yn-6N
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:25 -0400
Received: by mail-qv1-xf30.google.com with SMTP id j3so17545341qvs.1
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 13:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d4KAjGOIOOmhRwAXEkZoKVidF8e2kIGAWXOFwPXfIFY=;
 b=i8fkmY44VK+xNbBUJaeXrzVfxX/ZC2H4osW6AVj+Y2h8sOjdWoAolL3iCQ12HZYiaM
 zgfqfminHVDxHTYPBM7uWnIkz1DIhTVmCL8cNwZisK8nnIoys9GPGpSi4LV9WR2kLxwH
 XT3hoW4pe8K3tJCDxhUx2C2D4wtljc/63Wp3M+uC6nGDAOjYCOg4cVyLlzbTNynNA5+0
 wVkuXmKzecxEM0Huz6IxZgHiYGB6w2RvHDdLnDQEGpLhtk39McHzS0fYIH06wsuWL+L2
 TBf+qzCyrV+brXkuz4lTs8VJSCgkx4fT/d70i3sStZYP52fRsfXUcQ4euUO6YWroHKAN
 M4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d4KAjGOIOOmhRwAXEkZoKVidF8e2kIGAWXOFwPXfIFY=;
 b=e1tpbIRvO5hoVqLq5T3bkbqe8eP12lSSo9xQSvXGiB40fqm/dZnimcaSuGUu9W2vR/
 /W2RIHiSIzVXk2eicUlJOVApPhjLfjjL/aJh3dMmGzJqhSyntRb9ubP9EqygTaNLfiAq
 5wdHeHN8RnbbOvo/44x8tnFG1LrxiMGJWOYlAAxOsiJACojVe40ff6nG3usTXTVCCF6d
 0Yc8cwCWmHzo2fvh7C/q/A9ukIWpYYQbAo8gj0+rviCM2MlNARBaEIDAz1d2Ojxucb8V
 EAv0spxV71lGacmIotfjEupyrJYn0noGx82jZf2GMQBz5jOkL3RKR86gtGJzrm7LPQt6
 Oz9g==
X-Gm-Message-State: AOAM533p68kLtLaHb78uskROxrvjqYIylyycbHLQMfUEJfTDw65QMCcZ
 pGni7wvpJUtQ0b0EzT4bhAVfWA==
X-Received: by 2002:a05:6214:88d:: with SMTP id
 cz13mr23183596qvb.13.1618863803347; 
 Mon, 19 Apr 2021 13:23:23 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/31] target/arm: Merge gen_aa32_frob64 into
 gen_aa32_ld_i64
Date: Mon, 19 Apr 2021 13:22:38 -0700
Message-Id: <20210419202257.161730-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WOV5JGZ4YIVV

This is the only caller.  Adjust some commentary to talk
about SCTLR_B instead of the vanishing function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d46030248a..b47a58ee9a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -975,20 +975,17 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
         gen_aa32_st_i32(s, val, a32, index, OPC);                       \
     }
 
-static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
-{
-    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
-        tcg_gen_rotri_i64(val, val, 32);
-    }
-}
-
 static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
                             int index, MemOp opc)
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
-    gen_aa32_frob64(s, val);
+
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b) {
+        tcg_gen_rotri_i64(val, val, 32);
+    }
+
     tcg_temp_free(addr);
 }
 
@@ -4987,16 +4984,13 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         TCGv_i32 tmp2 = tcg_temp_new_i32();
         TCGv_i64 t64 = tcg_temp_new_i64();
 
-        /* For AArch32, architecturally the 32-bit word at the lowest
+        /*
+         * For AArch32, architecturally the 32-bit word at the lowest
          * address is always Rt and the one at addr+4 is Rt2, even if
          * the CPU is big-endian. That means we don't want to do a
-         * gen_aa32_ld_i64(), which invokes gen_aa32_frob64() as if
-         * for an architecturally 64-bit access, but instead do a
-         * 64-bit access using MO_BE if appropriate and then split
-         * the two halves.
-         * This only makes a difference for BE32 user-mode, where
-         * frob64() must not flip the two halves of the 64-bit data
-         * but this code must treat BE32 user-mode like BE32 system.
+         * gen_aa32_ld_i64(), which checks SCTLR_B as if for an
+         * architecturally 64-bit access, but instead do a 64-bit access
+         * using MO_BE if appropriate and then split the two halves.
          */
         TCGv taddr = gen_aa32_addr(s, addr, opc);
 
@@ -5056,14 +5050,15 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         TCGv_i64 n64 = tcg_temp_new_i64();
 
         t2 = load_reg(s, rt2);
-        /* For AArch32, architecturally the 32-bit word at the lowest
+
+        /*
+         * For AArch32, architecturally the 32-bit word at the lowest
          * address is always Rt and the one at addr+4 is Rt2, even if
          * the CPU is big-endian. Since we're going to treat this as a
          * single 64-bit BE store, we need to put the two halves in the
          * opposite order for BE to LE, so that they end up in the right
-         * places.
-         * We don't want gen_aa32_frob64() because that does the wrong
-         * thing for BE32 usermode.
+         * places.  We don't want gen_aa32_st_i64, because that checks
+         * SCTLR_B as if for an architectural 64-bit access.
          */
         if (s->be_data == MO_BE) {
             tcg_gen_concat_i32_i64(n64, t2, t1);
-- 
2.25.1


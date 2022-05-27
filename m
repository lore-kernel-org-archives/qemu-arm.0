Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1258272lfh;
        Fri, 27 May 2022 13:04:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwilTxWCCPpNscPeRaA3A5Fc4UAulG6960yucZ3b5jihhX4j81PGxE6KKbYFtGllBfCHoGG
X-Received: by 2002:a05:620a:2903:b0:6a0:4d8f:8b88 with SMTP id m3-20020a05620a290300b006a04d8f8b88mr29476419qkp.328.1653681893165;
        Fri, 27 May 2022 13:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653681893; cv=none;
        d=google.com; s=arc-20160816;
        b=XJVLds4rTfGrXjz5WfbnQaJpuO5cuBBShBN4Qw2m9u8rliC7m9HaXl+4n4bz5g3c/i
         EA4sRejL4YMwfP7Ek6XldQ2IH+RAWtyXASKMv52Y1sfL8ftnbp9W0/me13z3ui79u9Zt
         cQUaCIjraxPrRRYUa+N9crwypZO1AZ1bL8gz2vYhj+qXtbEuG3f8svMB9jlihw5sVjsD
         7zvMP41CNXzClbqSQs6qHCJV2S5Rdt1P+pw81E/P/3GpsjlgqfqonyLlsXYW2VNfk3Z4
         PpOS+gRgJYuhQNdwffl7k7pZSh/OKSt/7pxXf14DHYLf5eQ06ud1jrrdpvZrYy9FWi7/
         Iw4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8ygs+OMGKS8EkLzR53KKeWUpXL1YjpXft8HOELKtpOE=;
        b=P4MOLoOTAuyb1tQ/0arEncD4uIQXT0EaWl5TdAbKANYe/TFSIXYa//ll2ROWGMLJTx
         J3lBO7X/PnK6ot9bM9OVXi/KleXu5NfUUuUnwSuk6jCLmJVen4oHnjxEIIr3HSnH6cy7
         ZRTeXKAJU2aAF2j95C9pTUoPhqOGREOiKUZxSOh5xGo8zrQMNEHNWkJO98nbLH4wqZg7
         lqLz6k7fqFGFRdNSMiFpfHAeQGiknR7QgqoNKj4417XJ8Q+0g9/3MrtA/RguKIwxufQt
         Cf64jclLrJPDxSNWV+5ov+aixfcyQJMOl3Gnohmmm8ApmsLTy3cqTfu/TREUOIZvNoKm
         JVuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xtaadiON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5-20020a05622a15c500b002f38fc3ccd1si3865825qty.777.2022.05.27.13.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 13:04:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xtaadiON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nugCa-000490-M5
	for alex.bennee@linaro.org; Fri, 27 May 2022 16:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefl-00020L-2n
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:55 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:37544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefh-0005Of-Aa
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:52 -0400
Received: by mail-pf1-x42b.google.com with SMTP id bo5so5006593pfb.4
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ygs+OMGKS8EkLzR53KKeWUpXL1YjpXft8HOELKtpOE=;
 b=xtaadiONTDEpK0/r/MclG4c04ABx0JREehlVseIyWIWOhe1f1Z7qAaOgLUDNhWc1yB
 5tzSAyEoWwM74W/5j97Vx0H47eWs4uTidaP5hf2ss5iARo8Bw9jazZX3vw3ilK/hMoGW
 mOGVq8o3uA1f6ahpmquynbnuhor+ANAjEZAloNTbLwluQ6no5/oUnfjATkNNwl4pBykm
 +mp6E9NJ1Houg8KhEL1QP6BlKRpM9htZNwRGRNC/ciYSD8nSEonYoQvmmL/Lp8pcjnX5
 tXhjopBAR4KOEHb5lRtUyWOLNtGPmNkwu1PizMHaGdud0ZB59CypX2JKoBVaji6qwVnL
 0npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ygs+OMGKS8EkLzR53KKeWUpXL1YjpXft8HOELKtpOE=;
 b=Q/1MAF5LhWdPD40DbTUH5fOMwACcl2qbAXqUIi6ulFwuAlZA7Fdv5hWxigLtMR5ZIr
 mrfdFG90CH8Fi/Waea1hzaodpYEu7IRfRkGmzzTQLJIyOf5ywbefu3SJiKsHc5c7e9iy
 o0RXqP3YYmIIuFoAE5Um2mI6oBrJb7B0PC/nnicnkjYdFulvlvCI5oMW1WKYuZRXCvzl
 RmOSkJzz/d/P1X0PsqWeNweKyX+3pwThJj+rhy4fy0I8cGEvO4KZxKL1OQYdlORruY54
 MaxXTYWKvpW6qsHdkGxTgexvoMMBXL63QMElHjAJ+XD4w2lNikM6AJaTkP6FQVdv7EtV
 aDZQ==
X-Gm-Message-State: AOAM530M27pDzlZiYOSPPsZEmwhIIhnjKI28ZVKiq/InWib+REMv8zWW
 Vkh5Cg/6UHKQ5snHgIHuvfqFXA==
X-Received: by 2002:a63:5a23:0:b0:3f2:678b:8de8 with SMTP id
 o35-20020a635a23000000b003f2678b8de8mr38176178pgb.226.1653676006307; 
 Fri, 27 May 2022 11:26:46 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 104/114] target/arm: Use TRANS_FEAT for DO_FP_IMM
Date: Fri, 27 May 2022 11:18:57 -0700
Message-Id: <20220527181907.189259-105-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
X-TUID: cJ3WsAdUYutz

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b47d5d7f21..e2ae387d62 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3924,22 +3924,20 @@ static bool do_fp_imm(DisasContext *s, arg_rpri_esz *a, uint64_t imm,
     return true;
 }
 
-#define DO_FP_IMM(NAME, name, const0, const1) \
-static bool trans_##NAME##_zpzi(DisasContext *s, arg_rpri_esz *a)         \
-{                                                                         \
-    static gen_helper_sve_fp2scalar * const fns[4] = {                    \
-        NULL, gen_helper_sve_##name##_h,                                  \
-        gen_helper_sve_##name##_s,                                        \
-        gen_helper_sve_##name##_d                                         \
-    };                                                                    \
-    static uint64_t const val[4][2] = {                                   \
-        { -1, -1 },                                                       \
-        { float16_##const0, float16_##const1 },                           \
-        { float32_##const0, float32_##const1 },                           \
-        { float64_##const0, float64_##const1 },                           \
-    };                                                                    \
-    return do_fp_imm(s, a, val[a->esz][a->imm], fns[a->esz]);             \
-}
+#define DO_FP_IMM(NAME, name, const0, const1)                           \
+    static gen_helper_sve_fp2scalar * const name##_fns[4] = {           \
+        NULL, gen_helper_sve_##name##_h,                                \
+        gen_helper_sve_##name##_s,                                      \
+        gen_helper_sve_##name##_d                                       \
+    };                                                                  \
+    static uint64_t const name##_const[4][2] = {                        \
+        { -1, -1 },                                                     \
+        { float16_##const0, float16_##const1 },                         \
+        { float32_##const0, float32_##const1 },                         \
+        { float64_##const0, float64_##const1 },                         \
+    };                                                                  \
+    TRANS_FEAT(NAME##_zpzi, aa64_sve, do_fp_imm, a,                     \
+               name##_const[a->esz][a->imm], name##_fns[a->esz])
 
 DO_FP_IMM(FADD, fadds, half, one)
 DO_FP_IMM(FSUB, fsubs, half, one)
-- 
2.34.1


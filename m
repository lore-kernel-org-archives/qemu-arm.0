Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1260626lfm;
        Wed, 17 Jun 2020 21:29:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMxJsDM0LS5mhlNGGcncAo1cthJKyinaUlLI3hdork3MgojttjaKbgKY2JvbczWewZxkNm
X-Received: by 2002:a5b:bc6:: with SMTP id c6mr3674656ybr.302.1592454570806;
        Wed, 17 Jun 2020 21:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592454570; cv=none;
        d=google.com; s=arc-20160816;
        b=YEWENGyTUsSLla1whBV/rAyHN0UjbCsByxhejCj6ZxE6GrGcwtVP459KMgTxXFUR6e
         PPjkbztkSKZYB9PZTOwHT8YVIcAPbmQwMSpe7+GLDOSMMgl9u/iOTscDujVUdG8QN9zD
         Bc0+JglUMC6WQQmq7yrgyGT+7IVJVor0g3mZ0v1Ainntf1+kdUKXuzI8Af5cwAIZsA9a
         TGUjzdhobsxHQIbm8/PXqASFXWRsqUGzJmD/+yEa1Kv32EePCEUZsE2AXbRttUzN2jZE
         R8rZJkz6t2LN2XnfSwMGMFZvr5Y/3Nwj/4Ccpw15UeDuX9OJ9wkWe4ISMDmZsZZYEy8p
         KieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+ZmOpNN8xzx/C7OZZcIwUO8we6yz96THNL4bVhzwYm8=;
        b=DghMUtJjnfTyzVdc27z5sx1a914frhoYT/L1iPURKneMtqoqdbAL/rMr/5rVymnkQr
         6TXj4f75oy8xEH2yA1gLybvFfRqP2nRLUxw7RxtEaOKlTEW9sy7lby8+V2X3fFgIG3bE
         Hxnajyfv83et4De85pZ+0luIwLOXQb+35WwbW4FSaLCaxGQ2tR7qZmrqOdTs8KMOS0b5
         1C7yPwZLjJ4/PvWVlS+whnr75wxZoPQkHdPjQtabm++wHDMYpsqkM0C0xSEdGpC1kqpU
         s73j1d7x6CMhgssryuF8FPXY7/M/sRq4RJ9zky5a8lfGGjVBDEzh+3ahVRqjFKniPwl3
         AdAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HVbZu+Xo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v131si1397077ybv.418.2020.06.17.21.29.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:29:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HVbZu+Xo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmB8-0006q5-4a
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm8g-0001rY-6S
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:26:58 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:44454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm8e-0002HB-FT
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:26:57 -0400
Received: by mail-pg1-x541.google.com with SMTP id r18so2319050pgk.11
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ZmOpNN8xzx/C7OZZcIwUO8we6yz96THNL4bVhzwYm8=;
 b=HVbZu+XoGZ73X+iF5qB6aEZD2Gyjb0PJz4GLoKGjgr33olMT9x7/fhLp5KQ8Ks/m0x
 BXHloKWfln5cB7rRmt3+0fcuezgILsbxcXV4jf27uXRXgsrQgvKdqC1Fd9ybBc1QSsz1
 eoCXMU2GQYeNgFDmc77uii97xmHO4zmrLjkSAK1TZbmeC+DwLU1+AV1Bwl//Vmq4IvVj
 lSORALFCmHzwWHW8tTcugwXX4jzCtQ9bbP4Q0nehh9Ap21PTUy/5F8Q5ZfoRnt5xpJ1o
 4nyJ+YmJ9+GXx3f1wxzxN+yiWfyL0XpaS6RtEC5n8lZDPKJ4wvMNJ9j2JK19iwqWaens
 z4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ZmOpNN8xzx/C7OZZcIwUO8we6yz96THNL4bVhzwYm8=;
 b=d21qQoB+KQgOXe+olbDEejalc3IBl79KS7QB9hEIGly9t0xePyMtrMzDpoXyCPBmgV
 EHaIHfguvpnP/3SDGu3P4CHryOOop1LcIwK+DkdkH2PBiV83ETuXFoH+hltoIkgvqCEs
 luzMi7eXHM3L/qDz/sJiA6J1XfhNZ24F8b98ehKwov83v2mteLtb2c9XFfcZmGpT05k4
 HsX99GN2mznkGBTOdMMyN7+mHGEQTz5StmWScUodRjDN3tOXhjsJvbOsg8+nXWHCZ15A
 cJIkIJftJ7sr/DmCBhO5z38uP/pUl6KixGQHxOo1GD+iIRC3nf0GgzqrkXnwzi4dGqRc
 FpTQ==
X-Gm-Message-State: AOAM5314Dhu4K7LRHxD3ib8yXRu1G7JJCkMgY33F4CG8r0Fs1uXeNQXG
 c8/51UTyXYJ2M1Fkr5tTFWz/Qg==
X-Received: by 2002:a63:6bc5:: with SMTP id g188mr1734209pgc.395.1592454415186; 
 Wed, 17 Jun 2020 21:26:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o16sm1162035pgg.57.2020.06.17.21.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:26:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 006/100] target/arm: Merge do_vector2_p into do_mov_p
Date: Wed, 17 Jun 2020 21:25:10 -0700
Message-Id: <20200618042644.1685561-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rMcKXIIVwejm

This is the only user of the function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a8d5c7421d..b649b9d0b5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -178,18 +178,6 @@ static void do_dupi_z(DisasContext *s, int rd, uint64_t word)
     tcg_gen_gvec_dup_imm(MO_64, vec_full_reg_offset(s, rd), vsz, vsz, word);
 }
 
-/* Invoke a vector expander on two Pregs.  */
-static bool do_vector2_p(DisasContext *s, GVecGen2Fn *gvec_fn,
-                         int esz, int rd, int rn)
-{
-    if (sve_access_check(s)) {
-        unsigned psz = pred_gvec_reg_size(s);
-        gvec_fn(esz, pred_full_reg_offset(s, rd),
-                pred_full_reg_offset(s, rn), psz, psz);
-    }
-    return true;
-}
-
 /* Invoke a vector expander on three Pregs.  */
 static bool do_vector3_p(DisasContext *s, GVecGen3Fn *gvec_fn,
                          int esz, int rd, int rn, int rm)
@@ -221,7 +209,12 @@ static bool do_vecop4_p(DisasContext *s, const GVecGen4 *gvec_op,
 /* Invoke a vector move on two Pregs.  */
 static bool do_mov_p(DisasContext *s, int rd, int rn)
 {
-    return do_vector2_p(s, tcg_gen_gvec_mov, 0, rd, rn);
+    if (sve_access_check(s)) {
+        unsigned psz = pred_gvec_reg_size(s);
+        tcg_gen_gvec_mov(MO_8, pred_full_reg_offset(s, rd),
+                         pred_full_reg_offset(s, rn), psz, psz);
+    }
+    return true;
 }
 
 /* Set the cpu flags as per a return from an SVE helper.  */
-- 
2.25.1


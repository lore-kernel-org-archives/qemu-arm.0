Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1259081lfm;
        Wed, 17 Jun 2020 21:27:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD4D4hlD2m5Old+F5SGdW8DmHVupjDawHnyAqNZPR1jPm0IdKp4Aokhg73LEYjb20Zr0ua
X-Received: by 2002:a25:2415:: with SMTP id k21mr3640472ybk.349.1592454424353;
        Wed, 17 Jun 2020 21:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592454424; cv=none;
        d=google.com; s=arc-20160816;
        b=yGhXZWAmdO56f/w//4WZ0NMYcaccVBKF+CswOEq8RgSqVaD3mL13rBttUXXCYXIh3O
         9cukRp07g7N09QOukHdieztWPnQH/258Tz0fkWrR3fKSMuZS+89mVHEp4LQUBtNKUMO0
         NxwVm3I3JuVh6pJ0ODz9sDr3O8rz2bwGz0hNfrAjvTbsTwd2SHM5fLpF1A/p1uEeeSNv
         8LzqBWCK0LWU021gZB71HuJpzg76UyUp9btRwtR7t4SIU241XsM705usEtovdrV+9M3p
         +RZ5A8i9cHi7nHZiJ0vuLsHvMzH/yjYuB1KCK0SA2YKVzJHZ43uloBynfESgaas/Cyqy
         qrHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=b3K+zIM1Nh7bQpMoCRdNNiakP69Zq16vTWuZo+DM7NE=;
        b=oAyBO9Rvh1oPE98kloVapIS/KwYeFOLP2Aro1LmT3rjljvGe3A1VKmVv+hWUiEMzHe
         fdbCCVM9FvbmBPlv+S2K1yd6cYHo7zhFtscbH6ZWzptQuoxEYDgfMj47GOxu1xyD0nOh
         XOwyWgEv4Iww6Vn/dqJmZ4rUEDO9fPSOYPrjsUtpUVPJIgYRDR1zwtNSFE+lOIDHRMNq
         TFjYstRRwePRXdfULw9ty+aqHdkruylOhxoJ42EhX1r4lPbSyWRScccdjOTX3qrQDP4G
         9yaZkj7ihChzbl3DH9u93bP1HRJ+I6v7e8lrgGzRRCx27wDWN/fOvNYjS02XAHmjherE
         dIbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EQxNxuLM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si2147877ybt.495.2020.06.17.21.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:27:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EQxNxuLM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlm8l-0001jm-LF
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm8b-0001fx-Sa
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:26:53 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm8a-0002Fv-1z
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:26:53 -0400
Received: by mail-pf1-x443.google.com with SMTP id 23so2174586pfw.10
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b3K+zIM1Nh7bQpMoCRdNNiakP69Zq16vTWuZo+DM7NE=;
 b=EQxNxuLMUVLpSKljQbbj/LFwkmPkawLgGeHmeEy0Q3tRdJsXR68E383Q+mPRUGMVAk
 7/T85EA2JIxwHY0o++KAeReI/8x0htVgo3A8umD0IPkNEvjQbJlpdNc1KGK1wLxfceG9
 rpgIkt9jGh5VMcG5Pdt1eF3ioZFrJTBWYkxToLqaZv82o8N2R8A0uv4T4SH2aYV8tQWg
 0DXN6JOkwLHfuwZywfIoxpQrkpHQ9fH4zx7Drj5oZnjJx//Fp1PA0d6NsWuwh+5JU3/z
 TAm2q0NMfQSN67QBlREJH+HXOUvzM3LQPoEzr5PTEoCrNDWPOuOGCOo8DUQvDeVFu8g/
 4CWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b3K+zIM1Nh7bQpMoCRdNNiakP69Zq16vTWuZo+DM7NE=;
 b=dBoQrSNv7qjNU8ywJRdjwyCviDxCOfEVV/QGA0UueFxaYBC9798zviaQfVMZe6wmUt
 LJhaUtyrnqa34XctB8OBb1rV5uF3XCjqjdE+tkeJ5R+g+OjJKBEnlaPXYLKV1sBVHyvM
 wCj8hX7ejx3Y+PIWqVXT6aRBUokw+6I9qAEjDIjQmrAD2VKsujdmPl3F57iuV9EBKmNk
 VNgJmFK9SvHcx4P0mIzCxehN7AIWlj0RZqyfh8uNiKMXhBfIwQUuB7schwkXbJby0EZ2
 iEd3tNzTAbtRC7ss1qVEzqTTtQDEYxec6nNHhZzzdp4DLLTmFs7X2ci1cZzjqGTBKImq
 yKlQ==
X-Gm-Message-State: AOAM532QZlYddIzF4i0uureKcbrOhda3x5OdfuTX90Yd6r2fnZjp4OzQ
 Cz7BtEIRTNZyvvy2A2iePwy5mg==
X-Received: by 2002:a62:1917:: with SMTP id 23mr1935522pfz.272.1592454410476; 
 Wed, 17 Jun 2020 21:26:50 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o16sm1162035pgg.57.2020.06.17.21.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:26:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 003/100] target/arm: Split out gen_gvec_fn_zz
Date: Wed, 17 Jun 2020 21:25:07 -0700
Message-Id: <20200618042644.1685561-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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
X-TUID: pnaf0nMfag4T

Model the new function on gen_gvec_fn2 in translate-a64.c, but
indicating which kind of register and in which order.  Since there
is only one user of do_vector2_z, fold it into do_mov_z.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ac7b3119e5..bc286331cb 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -143,15 +143,13 @@ static int pred_gvec_reg_size(DisasContext *s)
 }
 
 /* Invoke a vector expander on two Zregs.  */
-static bool do_vector2_z(DisasContext *s, GVecGen2Fn *gvec_fn,
-                         int esz, int rd, int rn)
+
+static void gen_gvec_fn_zz(DisasContext *s, GVecGen2Fn *gvec_fn,
+                           int esz, int rd, int rn)
 {
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        gvec_fn(esz, vec_full_reg_offset(s, rd),
-                vec_full_reg_offset(s, rn), vsz, vsz);
-    }
-    return true;
+    unsigned vsz = vec_full_reg_size(s);
+    gvec_fn(esz, vec_full_reg_offset(s, rd),
+            vec_full_reg_offset(s, rn), vsz, vsz);
 }
 
 /* Invoke a vector expander on three Zregs.  */
@@ -170,7 +168,10 @@ static bool do_vector3_z(DisasContext *s, GVecGen3Fn *gvec_fn,
 /* Invoke a vector move on two Zregs.  */
 static bool do_mov_z(DisasContext *s, int rd, int rn)
 {
-    return do_vector2_z(s, tcg_gen_gvec_mov, 0, rd, rn);
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zz(s, tcg_gen_gvec_mov, MO_8, rd, rn);
+    }
+    return true;
 }
 
 /* Initialize a Zreg with replications of a 64-bit immediate.  */
-- 
2.25.1


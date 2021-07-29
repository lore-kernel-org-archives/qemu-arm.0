Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5549937lfc;
        Thu, 29 Jul 2021 04:33:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzr2CqpfuSSqFtaPylMQG0LqiUnVO3UoBhAo+hZc8IcDhEtQhDXkQy7bxkITMxFTjfSuHht
X-Received: by 2002:a25:28a:: with SMTP id 132mr6432596ybc.458.1627558415096;
        Thu, 29 Jul 2021 04:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627558415; cv=none;
        d=google.com; s=arc-20160816;
        b=I0aHDpIGE9LbNCMZqb+KNLhVDHmm10tyxo/LnFzbm3Fn44MDuqcvLgm7/Mx+CjvdjM
         4FB/ReN4H3DJlbH27ecgCSqIPorb9XxOQFOHCX8MNVlfPpHT1oPAznIQ0f1d7jAIKSQV
         VLG6NeFC+S73gUD4PpyVtBXSWFNXSg65r/n3u/W0AXcGlt2sjae+zEdrfLEVhvk4miyV
         dUUAriLqO3t9fFfa97rdMDtJfJerWslcJuO6GIGKZrQyAl7Cqu8Usee8v7iDFNdR+9qR
         Yj5m51KWiAUdQUctyIDqpJRIKGJroEUzKelYYKveY4L2sVt4iEdwPt2F5y1KmjBQ7cq9
         gYGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lONbbID3VHlgzJU0nIMD9RpteXWbXJ5QRJzmueidsYM=;
        b=pmfBYBkiRySHVNBHju8T4eSXz1m6nOCv0YX2RON9IE/YiyUPBOsyb0QTuw/sf3SO+k
         TEHBjedyFinfq97BofeUyQgWmtYKD81NWw0gksPIAmwR2kvC96tqyvRwN9m8iepw/KAW
         wtevTCj6F7rg1W3I+h3NTbReFcH1hA0/dqv79hLO1Boca8SkWB9ZVcKIkrl+xGvremfK
         ip9ktQpRs6DWk/Ari+NbandW6FbcSUag+YalFbj47+l4JsE5kx0FupgX9waLjkaXzUss
         NJutOtVSiwwz7Fdr0ZLwWgGdB48+iyC/qZRR/BJ27HJOxYfiLKQdMUHYpgWkPM4jzRA5
         FYHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a+RT+BAb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si3397333ybr.367.2021.07.29.04.33.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:33:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a+RT+BAb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m94IA-0003TO-DR
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940t-0000af-7w
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:44 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940d-00016s-U9
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:42 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso140050wms.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lONbbID3VHlgzJU0nIMD9RpteXWbXJ5QRJzmueidsYM=;
 b=a+RT+BAb0W6VuQZT6ipbN7pZscaDSnOzRGZEuwz/qU6E12J2ooS0nTkeU/as3jDccL
 afVxbW61VyaaRUxISM8Fd0e5LiG+NxjrZoY4TM9jGOBnN3KaYEOulr9Rcch3CPeOM14U
 6PnH5B82s2fCSv88lS2n4P8LUqdoH2UfhEphtAOv0XrGe1PqNMDUi0TxvJoWJ6LpAmcI
 7TUQNv9Mx4cIYxRt8Kra83l57c3bjF/ZV84tLuhnDM6VSs3N6AeaFY9kIKOFhDY1z2RN
 EjeSyEosBoJKhtR6I9bH5Wv0pKIGxocwoN1cgX3/finTtCXhpljnFLIOKenS3iKWR8Gi
 Hznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lONbbID3VHlgzJU0nIMD9RpteXWbXJ5QRJzmueidsYM=;
 b=eQ/PodWBAoltMHWNBigC5e+aGFzS8DGwdYgTUsPxGqe76oNK4UrYABBbIq1jf9rO+f
 +sWdU+qyNStmt64xv6+g4vu9a7+BQr29G5qksFRM4B1v7zhIIkRJJRUQoBGoQnhVxUZ5
 fHZS60ta1tQK/h29PfXLlSpXJ3cNf87YCgzZIA+ivGXSbNRp2FWbGJM4PeAWiu22ppce
 pNTmUlHPpDzCODCCJmWFxQOaCd/ha5+NXDzdgupU3YjFu8wrN0bkDpvYU8PLPXolfFML
 pU4TALKq5sbAYaj88FV9sBXAnFoeisVjuLwGljrsyL6cLKht7Z/2vuaHWC+6AjISI8uu
 jC6A==
X-Gm-Message-State: AOAM531K3WEjwa+LPK/NSrfafGJsUD6nAd9YUUzPA5vIC6ivpm3pG+T/
 6lkR/dTA67aGYha+5pWIL82UHXnzfVcMLg==
X-Received: by 2002:a05:600c:190e:: with SMTP id
 j14mr4026276wmq.19.1627557326439; 
 Thu, 29 Jul 2021 04:15:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 14/53] target/arm: Factor out gen_vpst()
Date: Thu, 29 Jul 2021 12:14:33 +0100
Message-Id: <20210729111512.16541-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: liI7ZYD3up2V

Factor out the "generate code to update VPR.MASK01/MASK23" part of
trans_VPST(); we are going to want to reuse it for the VPT insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-mve.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index a220521c00b..6d8da361469 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -737,33 +737,24 @@ static bool trans_VRMLSLDAVH(DisasContext *s, arg_vmlaldav *a)
     return do_long_dual_acc(s, a, fns[a->x]);
 }
 
-static bool trans_VPST(DisasContext *s, arg_VPST *a)
+static void gen_vpst(DisasContext *s, uint32_t mask)
 {
-    TCGv_i32 vpr;
-
-    /* mask == 0 is a "related encoding" */
-    if (!dc_isar_feature(aa32_mve, s) || !a->mask) {
-        return false;
-    }
-    if (!mve_eci_check(s) || !vfp_access_check(s)) {
-        return true;
-    }
     /*
      * Set the VPR mask fields. We take advantage of MASK01 and MASK23
      * being adjacent fields in the register.
      *
-     * This insn is not predicated, but it is subject to beat-wise
+     * Updating the masks is not predicated, but it is subject to beat-wise
      * execution, and the mask is updated on the odd-numbered beats.
      * So if PSR.ECI says we should skip beat 1, we mustn't update the
      * 01 mask field.
      */
-    vpr = load_cpu_field(v7m.vpr);
+    TCGv_i32 vpr = load_cpu_field(v7m.vpr);
     switch (s->eci) {
     case ECI_NONE:
     case ECI_A0:
         /* Update both 01 and 23 fields */
         tcg_gen_deposit_i32(vpr, vpr,
-                            tcg_constant_i32(a->mask | (a->mask << 4)),
+                            tcg_constant_i32(mask | (mask << 4)),
                             R_V7M_VPR_MASK01_SHIFT,
                             R_V7M_VPR_MASK01_LENGTH + R_V7M_VPR_MASK23_LENGTH);
         break;
@@ -772,13 +763,25 @@ static bool trans_VPST(DisasContext *s, arg_VPST *a)
     case ECI_A0A1A2B0:
         /* Update only the 23 mask field */
         tcg_gen_deposit_i32(vpr, vpr,
-                            tcg_constant_i32(a->mask),
+                            tcg_constant_i32(mask),
                             R_V7M_VPR_MASK23_SHIFT, R_V7M_VPR_MASK23_LENGTH);
         break;
     default:
         g_assert_not_reached();
     }
     store_cpu_field(vpr, v7m.vpr);
+}
+
+static bool trans_VPST(DisasContext *s, arg_VPST *a)
+{
+    /* mask == 0 is a "related encoding" */
+    if (!dc_isar_feature(aa32_mve, s) || !a->mask) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+    gen_vpst(s, a->mask);
     mve_update_and_store_eci(s);
     return true;
 }
-- 
2.20.1


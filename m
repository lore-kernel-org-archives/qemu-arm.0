Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1497534lfb;
        Mon, 19 Apr 2021 13:44:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBPJ6VrE8h46eRKmqOp4LocEbgQPz4w7YO8BA+j2G0zjOTvhOv2xhbnyOPiVgbWK12RPWp
X-Received: by 2002:a92:d8c1:: with SMTP id l1mr18753860ilo.74.1618865079009;
        Mon, 19 Apr 2021 13:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618865079; cv=none;
        d=google.com; s=arc-20160816;
        b=QW/WBpWPAcF/xkpUHl02aHXtAaPPWgZOjQy3oq1BvmoEJAN2J48j8H8dLjO78x3/oJ
         FJpdR8hp9IY090/b5c0E6pIKZOvsMICCcxxyxwE2pU+HcbAYH3YHVjHuAhIFLCOZiWAY
         R+cBwjO6VJcT0oDEOhoimDy0JnwsJ6xCoBF7zO7/FOiLTUOQWCMYpAs+ghqVRDeV6PU0
         2jDJjgAM3FZyGT1m3Y2n9owGeAAZ4Wu3zBsPt3NgyMJX/HTrUPKu9WzAURmbrRrUeoBo
         HuPjv9Bd4f1d5HRuf3JiCfA0up51S3E2y/6vfaQdE0yVijFnIiiTcotTRjnqpxfyUY47
         ziIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KALA1eSooGUfBo7CGQXBooa38v23DHVbjR3um2cG8+w=;
        b=hXqIybhyV31UotoLX4BFNjAgeAM1y1n9Qp4zpwxKUdCIwSwPbBovc8ETdN9z59lv3s
         kkd4y/TZ1OlcSKRNJjHuMwkLr6QQWfAmV2WvI05tS6r811XLvz3dWc/ynspmh+TQdWw6
         X/d2jsPmZKDBZ1vN3xlQ286jODRzzRc2bCNK9Vj9+bC2IpB7HIsAgVZmlGAfPnWeeybl
         2N+/UP6Bc0BxUlglfbfnfQaeLDlKBrpq++b/Jz6lbygNW5yJyVvp8duDf8+ATK/k8qk+
         wI/76pIl1oWHCYQeO1qLD9Sx6rPawErE2fQjfRJ9Pr17brqZzt6Zx6WYLo/KcOFsOmrC
         3DOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QlWb2VXD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si17034254ilb.46.2021.04.19.13.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:44:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QlWb2VXD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYal4-0005W0-AT
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQk-0007iA-Vt
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:39 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:39909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQj-0002gS-Ag
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:38 -0400
Received: by mail-qk1-x72e.google.com with SMTP id e13so27344011qkl.6
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 13:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KALA1eSooGUfBo7CGQXBooa38v23DHVbjR3um2cG8+w=;
 b=QlWb2VXDM3mNobkMRUQa5D/bLNODCJp3ZWa8T0QbIgrlvjSPt6wEKS7MzyNeUmQl5L
 DBzG1kdDFl8v/rnMPSz1DXTIMM375cAOJQiAI39z5tzRhglAE+S699S4ePJdRexw6Y2P
 2v9KhYqzcS8P1bupwgJHuctMUgCquw/6PoVebXOML3m2L2BBXKgGYZjAUz3NKKNLfbmx
 9WYNGMSDZGZD+o0eUQgbeCDddd6Fs5Mn82+6UbDQl5r/dady4KPRTOBoFNxAV5+3pNWJ
 kOVyRONCHtLwuvapWoSqs5vX5nehx2dplZc+wSh+a3Y6UQJfucwkbJAHlhYrbEuNXIXS
 fsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KALA1eSooGUfBo7CGQXBooa38v23DHVbjR3um2cG8+w=;
 b=NQ462hcRvyllrM91eupXRin1mDM/lNqeVcKTrS8r0SeHH26dmYPiOStXE8ZLMgZ0Sg
 Q/jFoe3tm01LDHgUMvV7wKOGEQ7vMOlpPIXPXZYKoH7WVhpylJvEDV4ZWL0AnA4L6Ak/
 Ck9QIcZOexyeKjeyqnzJQam3Iad3+hvbPUBuOIl5oFxNQ3meZI6yO7dcA9vNNbBttO6K
 pwi9OGwxvrB6btxBh6FDt+Kpgc3UNFG5qhUSnTL+YtjLEuaZ7AEPmF0H0XXjv48Xf/q1
 vZUSRYLNj4OppYS006ntQZMS0mPYTkHHXhvn0AqPnFjRgyi37Y1jCnw65JLnYZwmUrf3
 cRbQ==
X-Gm-Message-State: AOAM531pyGW3TyM6PUrahtVuyEwkR7D/iGnyiGWdtES/+IAnt/qDEKhP
 Ca+Yoaa5HcATY4Rn0LCQEY6omQ==
X-Received: by 2002:a05:620a:386:: with SMTP id
 q6mr1949054qkm.438.1618863816539; 
 Mon, 19 Apr 2021 13:23:36 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 20/31] target/arm: Enforce alignment for VLDM/VSTM
Date: Mon, 19 Apr 2021 13:22:46 -0700
Message-Id: <20210419202257.161730-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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
X-TUID: sAX0qPaABaXw

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 10766f210c..f50afb23e7 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1503,12 +1503,12 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
             vfp_store_reg32(tmp, a->vd + i);
         } else {
             /* store */
             vfp_load_reg32(tmp, a->vd + i);
-            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
@@ -1586,12 +1586,12 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+            gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
             vfp_store_reg64(tmp, a->vd + i);
         } else {
             /* store */
             vfp_load_reg64(tmp, a->vd + i);
-            gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+            gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
-- 
2.25.1


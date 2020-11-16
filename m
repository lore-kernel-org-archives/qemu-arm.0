Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3839579lfb;
        Mon, 16 Nov 2020 08:19:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtSoaL5vnWTH/uuFKTKxUalNbFlrZc3q3dU+1KoNYNPV9rdIm7nFqvzoXLPSIhIIANh7H5
X-Received: by 2002:a25:588b:: with SMTP id m133mr16679515ybb.522.1605543592394;
        Mon, 16 Nov 2020 08:19:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605543592; cv=none;
        d=google.com; s=arc-20160816;
        b=AQkTeBuiiZzEK8M9kWFVqI1OMSPfxPPj3EMOuiCf7YoIN2lvr/xdsecXssPUsd+y4k
         nEven+69wjqyP1cO3o3s6blNiBPdwJWcM9ErHehPdxEXXDXRg4eaRPYVvbiWpD/HE3KJ
         SK2ItMwb5dP7OAlBiV/PC0c00XRY6T345IwJenfCT98CsFSrt65mp5oOCGRkrruh9qW7
         UpZbMNdADpI0YdvkVmmKampOKLo76JpPXFQk03a/XTeyfxh8r4x0w47Idg/TObNFd3L3
         Ch5mu3Esf+sI4DCYBLUpyc+qHuh39pI5tuEsq7ydGeH/kYxPbIA7mfVYElVnevxTvud3
         Sb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ojq6mFjue/Cb7cv+9VNy9lJWWzr++JeLPodwO0KuPSM=;
        b=J5aDLY1XM9pXfzAtBQoteAqePJ4oMbOYLOvU6YOU+27Rg2LP/wJzWTMjsmlyrJ2aYo
         gucDmERno9j4ETkU5EsUXqOOnIaR9UQS3DrjakrmEXBikGF1PmkT44+83zSdV6W1OaSG
         GCY0U189SoaqIs8FkXrQauPofRrofq1rol/Ld6EX4RNUWtl7kvrP7NyISV6YkR58plDu
         AaZfpAv9F9qNMcRMuOT1/JFa/B6NHv1zicB3EkQls/2sDT3adp2C5sLcH1vL2+sKQQP2
         6kngS1OPLuCz+Mxb8ccS7p/jiyaKe5VXfU8xOu6UoArCCamWzrpR3ZoTgzzKqMmW6n/b
         0NXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gzvYgcnk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17si17707454ybl.338.2020.11.16.08.19.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 08:19:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gzvYgcnk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kehEN-0001KP-Px
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 11:19:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3c-0008Pm-F8
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:44 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3Z-0007pk-9U
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:44 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d12so19230101wrr.13
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ojq6mFjue/Cb7cv+9VNy9lJWWzr++JeLPodwO0KuPSM=;
 b=gzvYgcnkPF5RIQxhNjtVd3CwkJEuMoO7e2kEvyBAWvOoNA0O4Vza0DGAmcpQNIs3qS
 iKwcuFMeQ1iQIsVIZiidJSmFTFwRVAoj+Kl/SghcwE/epC3ADd+6QHPfAOduvUNv7wGH
 M3RezU5SsoOknlryQ+FPALBoInSgty1YBiHteyoFqV2aVyv7xheljWUewEsUMHuf0DZH
 LLnSkcO+aOI1lK40OkeRkb4l3ooyMjj2BDgggAB83BPUns5Rh3XRlUxcSRxSKmRcTuML
 HXzJZkkS8t448ppjADlB5h9snP/w6izVdyYE4UvT4vZHdIXjzU0YS0MqjHDMGQjhP8LT
 odNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ojq6mFjue/Cb7cv+9VNy9lJWWzr++JeLPodwO0KuPSM=;
 b=PfBJIwxVZm8k6dK9jxNCGFiYzlbSfpt6SNqGtlxs8TiFUvS2+aHFmKZ+tj3L/VwqFc
 0N9tUCXjUG2jCdoibdzOBG/wXTTEiuY223pooe/ZCdzdYw1S+S9+bjc6WzD5lZlXh1Px
 lt4n73TDbBwfptq+6UavAMqTtn/qbXSH72jP0lypYc5OjJc5nUAI/R5Qcb5ooerrARj5
 RPjoHUma9EAfjwE6P/za9BQ3c+p50ID/3/BXLpveksi5UibicF7gdx88KkIHE2hJvjHI
 Wn7aBKi9j9yIAv5MV9ODZJlLCe+J9DRtzVzyhXeCQMUId8LfDPSGWdm0qzS+/TLA2I6x
 K82Q==
X-Gm-Message-State: AOAM532pNaA0OwMJdBG7yFYyrpwm0eraOFItvz/yK92qYQU94SZHQRxD
 49bqp+RN8btG0vyiZFByrVmZ5fbYvEb1gQ==
X-Received: by 2002:a5d:438f:: with SMTP id i15mr20325739wrq.121.1605542919794; 
 Mon, 16 Nov 2020 08:08:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/15] target/arm: Implement CLRM instruction
Date: Mon, 16 Nov 2020 16:08:21 +0000
Message-Id: <20201116160831.31000-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: ZSILudW9DE3o

In v8.1M the new CLRM instruction allows zeroing an arbitrary set of
the general-purpose registers and APSR.  Implement this.

The encoding is a subset of the LDMIA T2 encoding, using what would
be Rn=0b1111 (which UNDEFs for LDMIA).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/t32.decode  |  6 +++++-
 target/arm/translate.c | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 8152739b52b..59ab974c661 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -609,7 +609,11 @@ UXTAB            1111 1010 0101 .... 1111 .... 10.. ....      @rrr_rot
 
 STM_t32          1110 1000 10.0 .... ................         @ldstm i=1 b=0
 STM_t32          1110 1001 00.0 .... ................         @ldstm i=0 b=1
-LDM_t32          1110 1000 10.1 .... ................         @ldstm i=1 b=0
+{
+  # Rn=15 UNDEFs for LDM; M-profile CLRM uses that encoding
+  CLRM           1110 1000 1001 1111 list:16
+  LDM_t32        1110 1000 10.1 .... ................         @ldstm i=1 b=0
+}
 LDM_t32          1110 1001 00.1 .... ................         @ldstm i=0 b=1
 
 &rfe             !extern rn w pu
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4b17b2e0d46..ac8c118427f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7965,6 +7965,44 @@ static bool trans_LDM_t16(DisasContext *s, arg_ldst_block *a)
     return do_ldm(s, a, 1);
 }
 
+static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
+{
+    int i;
+    TCGv_i32 zero;
+
+    if (!dc_isar_feature(aa32_m_sec_state, s)) {
+        return false;
+    }
+
+    if (extract32(a->list, 13, 1)) {
+        return false;
+    }
+
+    if (!a->list) {
+        /* UNPREDICTABLE; we choose to UNDEF */
+        return false;
+    }
+
+    zero = tcg_const_i32(0);
+    for (i = 0; i < 15; i++) {
+        if (extract32(a->list, i, 1)) {
+            /* Clear R[i] */
+            tcg_gen_mov_i32(cpu_R[i], zero);
+        }
+    }
+    if (extract32(a->list, 15, 1)) {
+        /*
+         * Clear APSR (by calling the MSR helper with the same argument
+         * as for "MSR APSR_nzcvqg, Rn": mask = 0b1100, SYSM=0)
+         */
+        TCGv_i32 maskreg = tcg_const_i32(0xc << 8);
+        gen_helper_v7m_msr(cpu_env, maskreg, zero);
+        tcg_temp_free_i32(maskreg);
+    }
+    tcg_temp_free_i32(zero);
+    return true;
+}
+
 /*
  * Branch, branch with link
  */
-- 
2.20.1


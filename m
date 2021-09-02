Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp357214lfb;
        Thu, 2 Sep 2021 08:09:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk3HrudhTMyoX9D8IKJoE/XI2gYPHGj97xM1KHJol5eu3KHwPrndJGlvJ/B2I1x4bC1X8k
X-Received: by 2002:a05:6512:12c6:: with SMTP id p6mr2900472lfg.599.1630595383452;
        Thu, 02 Sep 2021 08:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630595383; cv=none;
        d=google.com; s=arc-20160816;
        b=xwmkRRQ6/mXlZrr2HyzXFe5G1AesUOy37VjrQ3Q84e22qgdIf2I6kAV4vZWzdC0EYY
         6VdGWYXx/50g8s22QyUbLYnNGUQsMV1wzGn2zj2NOckJ20u55OmgQGMTs4Lh7Gjo4k7e
         UroSqXj2I82t9agMHlcQMdQZU3fAUwBEuztCFi1yUlF7RHjbU7xA5PDl5Qa5q5kNF56v
         QCe8k4kZzLpkictoLzHOfDh6Xg3PxrXuq13YQHLr6CbFBNXnm5gm8K6NuNyhq3gYwoCF
         ylDcrLC6m5JB5x5IUEnaCFxrM82SfbnsJSbGwxmDgtNPLZbvhzODi3wKqWMCcxEvOzB9
         4Yng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hTL0YVceSstDhE4eWuPfHB9Yy35Pz6ourVXwIf0vsMU=;
        b=WoO5Dy8Pufzk0Ltv04cn5m3jC8+Zj48E1zoWcqngpMmFYWz64WtTY3bhZCzNncLR/a
         dSx56U7nD/irw6WzRO1fsnchGhc3FmcTaYxorzAdSBgXWxX4G5rT1S9oxfF29SEJQykq
         nPpVkNF0AcV97m3cRKPQ92RXSxmXOD98f7D9oAv3PZtCZ1CpLRJke78VqygSn3W70c75
         /T80KDzR7GnubngF8i1pd1f/2bAfynidO6nQPP68yrOQ+mj9gLAtbtS1GO57Kimy9xZF
         SkOEIEPaM9VaRrHbVWFW3qwduvQFm0JSfiTqdQ/GiXci54v4tOn8HoZgsNLDf85kqA9j
         33hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jHnvrAQY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si3300220edi.51.2021.09.02.08.09.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 08:09:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jHnvrAQY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLoLW-0001Df-AT
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 11:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL9-0000Ys-Rp
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 11:09:19 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL7-0003Rs-Jy
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 11:09:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u16so3481414wrn.5
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 08:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hTL0YVceSstDhE4eWuPfHB9Yy35Pz6ourVXwIf0vsMU=;
 b=jHnvrAQYtPjAbycusOsjeAnyyqrreIFryg49SAPe4voxb0izxn5ES0syNU2FNpZ2qy
 CT22RkgtvNV2I3tvqx9p5u5t0uH4Z8NY7zPc3o7eIES2cpXCnZr5gSFffyFgJJMXjLpH
 YgAAF+spvWMpdMcpuSf3AyF6XWJJU+kEkuccqwV2hS+r+ZphqcMPJ80CeHE6kYbbwzTb
 Bz9AngrzlMLY3peHe+ReR9UIkZ1QvTRSDMnscQ45gn4BMQAYpogu7OJdYryVW3OH5/Cy
 wPiaZt1r7Cehs5zSj9W/WlMMdDa8geZy2xubDosQuP35YOkW6wbBr8Ioe3w6J2GoaFv0
 2gsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hTL0YVceSstDhE4eWuPfHB9Yy35Pz6ourVXwIf0vsMU=;
 b=c0CtMOw2ohwuFtjf7QeL7xA2mL0H0Rrd7YKmRIqLzpx1N349wE8TmlgmUReNWIbEmP
 L2MGpkBXfBFYWpFaOu3BBDtZwE+EiZd1VpZWCfPR948W48kiKoS0iss1VOoL1hZS/3a9
 bcD84P7BsQGU/fHNhYIgJkGuqUstFp8wPlIWoEf0XbiIbW/gUQ96ZBoz70W8thdaGizL
 ol0xqlXF+Cb3BHltsWG+Yckss8dMrfCI+xCPe+qJFOYsg8yt4R4MnE1cjhQtZA2U8fX2
 haLnLk/HcTmFl4WwUxtChZk5kH3g5TNuldycHaDk2rDGOicEA+4KMKQFH70eHAri5IXD
 a//g==
X-Gm-Message-State: AOAM531DcB1hDrFlLluQpKtesyd88vpuKPveuUpdoFBfbeA4Ght9Hwwj
 WJqG2VPp8wEpQvmoDWBbW9y7Mp+XdxiSDw==
X-Received: by 2002:a5d:4e51:: with SMTP id r17mr4532791wrt.308.1630595356307; 
 Thu, 02 Sep 2021 08:09:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c24sm2107842wrb.57.2021.09.02.08.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:09:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/arm: Optimize MVE VNEG, VABS
Date: Thu,  2 Sep 2021 16:09:10 +0100
Message-Id: <20210902150910.15748-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902150910.15748-1-peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rIvKTtwNfXKd

Optimize the MVE VNEG and VABS insns by using TCG
vector ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-mve.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 5bc5a3a2063..32c5ff6ea06 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -500,7 +500,8 @@ static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
     return true;
 }
 
-static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
+static bool do_1op_vec(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn,
+                       GVecGen2Fn vecfn)
 {
     TCGv_ptr qd, qm;
 
@@ -514,16 +515,25 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
         return true;
     }
 
-    qd = mve_qreg_ptr(a->qd);
-    qm = mve_qreg_ptr(a->qm);
-    fn(cpu_env, qd, qm);
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qm);
+    if (vecfn && s->mve_no_pred) {
+        vecfn(a->size, mve_qreg_offset(a->qd), mve_qreg_offset(a->qm), 16, 16);
+    } else {
+        qd = mve_qreg_ptr(a->qd);
+        qm = mve_qreg_ptr(a->qm);
+        fn(cpu_env, qd, qm);
+        tcg_temp_free_ptr(qd);
+        tcg_temp_free_ptr(qm);
+    }
     mve_update_eci(s);
     return true;
 }
 
-#define DO_1OP(INSN, FN)                                        \
+static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
+{
+    return do_1op_vec(s, a, fn, NULL);
+}
+
+#define DO_1OP_VEC(INSN, FN, VECFN)                             \
     static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
     {                                                           \
         static MVEGenOneOpFn * const fns[] = {                  \
@@ -532,13 +542,15 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
             gen_helper_mve_##FN##w,                             \
             NULL,                                               \
         };                                                      \
-        return do_1op(s, a, fns[a->size]);                      \
+        return do_1op_vec(s, a, fns[a->size], VECFN);           \
     }
 
+#define DO_1OP(INSN, FN) DO_1OP_VEC(INSN, FN, NULL)
+
 DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
-DO_1OP(VABS, vabs)
-DO_1OP(VNEG, vneg)
+DO_1OP_VEC(VABS, vabs, tcg_gen_gvec_abs)
+DO_1OP_VEC(VNEG, vneg, tcg_gen_gvec_neg)
 DO_1OP(VQABS, vqabs)
 DO_1OP(VQNEG, vqneg)
 DO_1OP(VMAXA, vmaxa)
-- 
2.20.1


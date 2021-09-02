Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp356973lfb;
        Thu, 2 Sep 2021 08:09:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7odoX4G5Y74NfVQHyEGacJgxtYok+cUN9IGSTC/+C35BKSxF6Spl0n4sOYKSmsJN4ct2Y
X-Received: by 2002:a05:6402:148:: with SMTP id s8mr3985557edu.298.1630595374091;
        Thu, 02 Sep 2021 08:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630595374; cv=none;
        d=google.com; s=arc-20160816;
        b=r9E8nU8pJxzPifCUKTbtQAB9YtDYN1638SqIl6s3FRMwhp2BPCX/OJ05AOPDrc7yPG
         b/CPAYJQFeaIu5owrPN4vYmXxJ5G9UnbnjzmoLpByP/3XxydiLyUvUjHm0V7oZdQC43+
         7QMUX13Y/iRaMCu1igwnQ21wRm+/SfAWp13F45KdvIQLu0zXNRlRIH8vRdACz0rWj9yJ
         LGSGAUvfVqrY7RvIaUpSWjGyY7SUUhyv2ASnZIzFNZqTC4Sab1RPHncPJzNiVAHZfds+
         Zvthpl2jUNCpZ2FRwoO7X5yZaSkP6dYUUwti61Ay9LMkbB7Y33uvP2sEH+QjiBtOZdSP
         XdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IOs+ybtxzQvBd0zTnc8h9eQMrze7nEv95Ct+IYf1dzY=;
        b=qsdgY+Lm1N51XRrsZ+IFxP76pndsvYJdDivolsWiJbNQ49iFMxa9pB0eqVHGJl8z0X
         eK6uDPQPTiNqk4QAwv4p9LmpfIbmSw43ifUFtdUfKOjm3nOz0jjuzZMBVG/YCGRPpQER
         spxBZonrSx2k2bzkki6x/LRvZZNOS9Q9I8rC8qDlhfKKdVEbcWzBdzCh+4o/Zm7M/Iqb
         FWvJwU0+UW12qYmg620oi23BR7eYZwCC6b+8a5UuDvZy38LjOYvkiSaxzFxLWMh0NWXV
         38+p9YSvsqv5vv9TJSMUjLUrUK7FUgYIxOyUnH1mVk0Utg/7P7e9gOGxjcoI7ZkndYhN
         +x8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TTQVdtRM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si2365410edr.232.2021.09.02.08.09.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 08:09:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TTQVdtRM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLoLN-0000gS-4C
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 11:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL8-0000V0-Ja
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 11:09:18 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL5-0003PX-MN
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 11:09:18 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so1331496wme.0
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 08:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IOs+ybtxzQvBd0zTnc8h9eQMrze7nEv95Ct+IYf1dzY=;
 b=TTQVdtRMl79lUFvi/5MnSRHMqI4lwLDMAuQ3QwZCzd1D/omBeMZ9W5pPQIoJ/36fhn
 AVjt3f2CUz7ea959LqNR0PkxwWUPCQyv19EBQVGCHEoNxUiVkLGobINtZafPagFOvCPR
 me4qRVa686byFU9xQ5G2UqgWPKMyQd75s13qA9Tv/r6nxpBRiEThrFTDu05FsGFChH0y
 wKrizWiKyH5D5SC9IG+/rfUdTFySCnV+pTJcyv9MgMdyDHItx4auEgUCPIvDL1EowM3+
 RJnOJ2TUg+re5e3iVCFCfvUlRhR/2542QDhXKHzqWtq+wR0LunXyBxoGM+kTy0M47QXp
 BK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IOs+ybtxzQvBd0zTnc8h9eQMrze7nEv95Ct+IYf1dzY=;
 b=khuwZSnp7udYQuCxIFRKTwdgtynvgdd426Tr9zMaVckwJ3KrQLLjaN958Hb+34qrLr
 ov7YLK36Eth4xfwqjqipdWB55IAstPfShEt96uQYpvnF2geckV+56DarAsXEZf69m9UE
 1ssXdC4c0Uitk1WAneevuU9NnaMScL5tPzI3NUqCEot33i1pxVQCxP8oCfJ5p4c34HMw
 PgGw4qrCAYLMRnUpNpSilN6XXMeBRpiP+hIDFQVmxseJGu171xfZwlBT0HzaRpKMW8sj
 3kgCsWvfdlA44UXGCH07Ud8WC4IrWXqS0R86ys+d5DJVrxZcdux+4uF2gqIWyXzV8VqL
 QMcg==
X-Gm-Message-State: AOAM531mCcoMEgbJCUyN+C4X1Bs7bqvl1xsiXRotGX+ZTsCITyIeSKAy
 bXxSlTMEoS+jb7KChegyk/oNwUAgP2+Xvg==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr3681019wma.33.1630595354213;
 Thu, 02 Sep 2021 08:09:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c24sm2107842wrb.57.2021.09.02.08.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:09:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/arm: Optimize MVE logic ops
Date: Thu,  2 Sep 2021 16:09:08 +0100
Message-Id: <20210902150910.15748-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902150910.15748-1-peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: NTXzMpJrO2jv

When not predicating, implement the MVE bitwise logical insns
directly using TCG vector operations.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-mve.c | 41 ++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d95807541b1..087d60f0d81 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -774,7 +774,8 @@ static bool trans_VNEG_fp(DisasContext *s, arg_1op *a)
     return do_1op(s, a, fns[a->size]);
 }
 
-static bool do_2op(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn)
+static bool do_2op_vec(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn,
+                       GVecGen3Fn *vecfn)
 {
     TCGv_ptr qd, qn, qm;
 
@@ -787,28 +788,38 @@ static bool do_2op(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn)
         return true;
     }
 
-    qd = mve_qreg_ptr(a->qd);
-    qn = mve_qreg_ptr(a->qn);
-    qm = mve_qreg_ptr(a->qm);
-    fn(cpu_env, qd, qn, qm);
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qn);
-    tcg_temp_free_ptr(qm);
+    if (vecfn && s->mve_no_pred) {
+        vecfn(a->size, mve_qreg_offset(a->qd), mve_qreg_offset(a->qn),
+              mve_qreg_offset(a->qm), 16, 16);
+    } else {
+        qd = mve_qreg_ptr(a->qd);
+        qn = mve_qreg_ptr(a->qn);
+        qm = mve_qreg_ptr(a->qm);
+        fn(cpu_env, qd, qn, qm);
+        tcg_temp_free_ptr(qd);
+        tcg_temp_free_ptr(qn);
+        tcg_temp_free_ptr(qm);
+    }
     mve_update_eci(s);
     return true;
 }
 
-#define DO_LOGIC(INSN, HELPER)                                  \
+static bool do_2op(DisasContext *s, arg_2op *a, MVEGenTwoOpFn *fn)
+{
+    return do_2op_vec(s, a, fn, NULL);
+}
+
+#define DO_LOGIC(INSN, HELPER, VECFN)                           \
     static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
     {                                                           \
-        return do_2op(s, a, HELPER);                            \
+        return do_2op_vec(s, a, HELPER, VECFN);                 \
     }
 
-DO_LOGIC(VAND, gen_helper_mve_vand)
-DO_LOGIC(VBIC, gen_helper_mve_vbic)
-DO_LOGIC(VORR, gen_helper_mve_vorr)
-DO_LOGIC(VORN, gen_helper_mve_vorn)
-DO_LOGIC(VEOR, gen_helper_mve_veor)
+DO_LOGIC(VAND, gen_helper_mve_vand, tcg_gen_gvec_and)
+DO_LOGIC(VBIC, gen_helper_mve_vbic, tcg_gen_gvec_andc)
+DO_LOGIC(VORR, gen_helper_mve_vorr, tcg_gen_gvec_or)
+DO_LOGIC(VORN, gen_helper_mve_vorn, tcg_gen_gvec_orc)
+DO_LOGIC(VEOR, gen_helper_mve_veor, tcg_gen_gvec_xor)
 
 static bool trans_VPSEL(DisasContext *s, arg_2op *a)
 {
-- 
2.20.1


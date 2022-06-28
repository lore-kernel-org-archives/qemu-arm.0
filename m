Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2890651lft;
        Mon, 27 Jun 2022 21:40:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vuPuKRM+B4R9S3X3gfw4jsrmoWYYNJALWNzlrcjO5gE7s07mZwOjH1YkLChtN/9mD3hKpb
X-Received: by 2002:a05:620a:4588:b0:6af:4b8:2fc5 with SMTP id bp8-20020a05620a458800b006af04b82fc5mr10589750qkb.702.1656391225315;
        Mon, 27 Jun 2022 21:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656391225; cv=none;
        d=google.com; s=arc-20160816;
        b=Exc7WU4Sfr+iEx8v6j74IbOIM17lZy+5k5ljnuXIJzpY1ZSnRevYeDQ7byeVG8rGf4
         Crmmd1hdRLZh8T9BdGwSCa0d5W4UkWau3pxLNESMByhG8R2ypddZU0v99mBOhLaTlo2S
         iQBBILxt3ZC/9BYJ8AM+lZT8MrMSHXViiGfPq5AJTbXJ7VZZHbqCRc7cGQJamTsExgS3
         y6Z/Zwd741NCA/Aj4FOpIxS/lOX8CrSiTaeairIOu0wpgBIu8c4hN07tYbgPmZoTZs3s
         NRpN95DOZhCHAppfx5LmLcJGj1HRwDsYAdYDqoOclVPKVJ9BL/o3Bragpl9xc2KR96OQ
         dlBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8q6UgHZNxgLAwjYyD3emx4pnHnGEMm3xg5CqdRKZ5yA=;
        b=AU5fSVk93XDsgElBz1/8sknPq+3O+BnhH51cYwv1sOi7RQ1OdnRsED5Ycf0GiXVYvm
         7hoq65fhsGe+ppaLEWVHtNF+aRUJjWIbhyOZDuEssqyMs26j59LjtG54U0nbwXG7bm1l
         f80CsfvExkhvyVY0pVBMFoLaZTW0oipJvWBMKLmmzkEgLVmUUpX8PdsWB3vsbEmXfCu9
         IRk3VfmnTArbKXiY+328XGlxCoKzW4S3ejgJeHBVjG0Tf8fNXNSIJVy84GHdpChwJK+A
         PNRF332zbp+3oAxEiuhcioyzryPEVMUqH/tVVWujg+GLR4EaPmMM0rlGVhvDJFW97m6E
         wBzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nMHrFNGY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp36-20020a05622a1ba400b0030511b90b77si7684593qtb.506.2022.06.27.21.40.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:40:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nMHrFNGY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o631L-0004JJ-02
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jr-00021k-7z
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:12 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jm-0003gy-B0
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:10 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 c6-20020a17090abf0600b001eee794a478so3905963pjs.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8q6UgHZNxgLAwjYyD3emx4pnHnGEMm3xg5CqdRKZ5yA=;
 b=nMHrFNGYDi/NUNXEogGwiq/O1hHL5qWjpeGrlOBZ1gWVxd8190i8RdpUW+qJ/nllzm
 QWxYwcy6smdO19PsjSzIEKrPc0IRTKFg2OWymKqCaI8CUtCg/lUm1+CnK1GvaVPfliZG
 e4XSjRulLGrAeX80QmojPSqa/RmdOU0nNUpAWAMz8x+gomn5iUDng9Hb6ETJoT2y06Z3
 FVT2i3OJQ1QI6WktLFgzM5cifz3QnUMxgSX0zwScNdC+G6KcVQtZL4AZN9LGbnRE84FJ
 5PVSwVR1YL0151x9QXTvVpXewZBXkru6RqcQ39jt4wHvHwB22+Sue+k/odWxHS6/YnpO
 RQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8q6UgHZNxgLAwjYyD3emx4pnHnGEMm3xg5CqdRKZ5yA=;
 b=pPj2YcJliatP3i7VpJ1p6dDpojnmP5ZMX85QC6aHsUbPYrbE6RFDHJZnA/lUBsiWy3
 AjKyiECf/kQ/EYOVfsG0iDcDPPGVPtI38zfwKPRXvcv2bMhQLARGzQa4+u+fejR+X4pK
 gR6mGV9VyXIgVMSifRcIPMXPi7IDhU3td82jHUyaBoFCF/xI3yQzS8e2jPy7x9d0vYzp
 +/OEVAdj2UX2NhBvPmbiTMhT7LeGQaz4o6LpogQJQ05W9CgY/ab0Vm57JmZvFOpOJd1K
 C2OMj9HXMoYEaPbXOSlhPiNUqiSDNByeqB+2hzjtMp2thQRSvjr99UDFKyMtU59/pukd
 bepQ==
X-Gm-Message-State: AJIora/s/0FoXevkZAaRkmtHprJL0Yv4Vnx7xDl282MENBQzKMuRPKXB
 U0ScfcMYikyYXC4D133aLSSPCw==
X-Received: by 2002:a17:902:f683:b0:16a:6456:5369 with SMTP id
 l3-20020a170902f68300b0016a64565369mr1641887plg.136.1656390124644; 
 Mon, 27 Jun 2022 21:22:04 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 18/45] target/arm: Implement SME ZERO
Date: Tue, 28 Jun 2022 09:50:50 +0530
Message-Id: <20220628042117.368549-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: biztRyut+0fD

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Fix ZA[] comment in helper_sme_zero.
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/sme.decode      |  4 ++++
 target/arm/sme_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-sme.c | 13 +++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 3bd48c235f..c4ee1f09e4 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -19,3 +19,5 @@
 
 DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
+
+DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index c25c031a71..6e4483fdce 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -18,3 +18,7 @@
 #
 # This file is processed by scripts/decodetree.py
 #
+
+### SME Misc
+
+ZERO            11000000 00 001 00000000000 imm:8
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index b215725594..eef2df73e1 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -59,3 +59,28 @@ void helper_set_pstate_za(CPUARMState *env, uint32_t i)
         memset(env->zarray, 0, sizeof(env->zarray));
     }
 }
+
+void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
+{
+    uint32_t i;
+
+    /*
+     * Special case clearing the entire ZA space.
+     * This falls into the CONSTRAINED UNPREDICTABLE zeroing of any
+     * parts of the ZA storage outside of SVL.
+     */
+    if (imm == 0xff) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+        return;
+    }
+
+    /*
+     * Recall that ZAnH.D[m] is spread across ZA[n+8*m],
+     * so each row is discontiguous within ZA[].
+     */
+    for (i = 0; i < svl; i++) {
+        if (imm & (1 << (i % 8))) {
+            memset(&env->zarray[i], 0, svl);
+        }
+    }
+}
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 786c93fb2d..971504559b 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -33,3 +33,16 @@
  */
 
 #include "decode-sme.c.inc"
+
+
+static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_za_enabled_check(s)) {
+        gen_helper_sme_zero(cpu_env, tcg_constant_i32(a->imm),
+                            tcg_constant_i32(streaming_vec_reg_size(s)));
+    }
+    return true;
+}
-- 
2.34.1


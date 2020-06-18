Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1260906lfm;
        Wed, 17 Jun 2020 21:30:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxc9aY0bJqMxqANqwol2RiT6G6gI30jIqJRkxCddIwGfT7Q80wMoSg/OCk4xGiWUDjq5bVu
X-Received: by 2002:a25:dfd6:: with SMTP id w205mr3466656ybg.216.1592454600811;
        Wed, 17 Jun 2020 21:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592454600; cv=none;
        d=google.com; s=arc-20160816;
        b=EcDUFGiUoGs1UjmmpjDoJgSNiCETJaMWUto99SWWb2d3F9GFVMWGQy2V7MbgZu+C/z
         UPqzfTz9bv+BHtZ/sIo+I2vJQIWvj1xmmlFgS97Pg3Zf5bt4FhKRcjAov+m9IN9LTh+x
         gSfkenfitYIXxd9es7wZrP1Jeh+aXA7z2J1RegNqDdVEpPUwmWdpL94ebNvaFa0xV4Os
         R3TDbalW9uwsrKjr1n7MqI7ndYn5jeMJ1i3HkLjmEsMjXMpyUKP4U1E4i/xOais273uF
         zQYrc1b0N0f7vr+Ym8bcdVpD4KEQQ+gbbkPdDkIeKOfIanUyyblB0gFlwQC2iobkl2rO
         Ly1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LZL+dDMhzUt93arvpWQQJPSTREHQqTYfTwzJjttMTfc=;
        b=Eb58B28wXlIRKRmzB3vGAR96ocvA625RNPjqmZhTYeAuwGs1X/6VhKY0Hhs0Jo0W5h
         cMtbiMpFpZtrkjoWkjCuA46GlfH6wkORub/5D/e0h2KK/zsi22T1jNnsy/cpszntp3fC
         P6GuNj5JLWthp4d6L5BFy4ssSSn9Sd/l7lzafSPYAbpys6sMla4zJP7LTUWM2u/dF9zW
         EVR5Bk8tj4qqjiQtD8NMurWJZyDRrYIbU8hAlFxJoDJL1F/5f3ijfKFtOiFPurU9BbhB
         FM/+Lcx8Pv3cJ7gT75mS7R+6uw1VoRQCptTFbNEorWHYtwdJM+bOL8XN+fRLXerwVanh
         SD9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iSNvsbF7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p196si1431513ybg.113.2020.06.17.21.30.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:30:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iSNvsbF7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmBc-0008JL-2f
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9L-0003AD-GY
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:27:39 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:40674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9G-0002R3-Fn
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:27:39 -0400
Received: by mail-pl1-x641.google.com with SMTP id x11so1905431plo.7
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LZL+dDMhzUt93arvpWQQJPSTREHQqTYfTwzJjttMTfc=;
 b=iSNvsbF77Gs3ZEB4ZL0L3TJ6R9mD8vfmYlDEA08drQ+UL+gf9XvNABdK8LhALR2HHa
 wymk4P2IMvX3Cr1IIWuy0usxOlh1pSqnUkulhhNCEWNQ3+BM1v2PViH+ahhDeO8pIh6i
 SB5qLRfYKNNp2iDiWV2moNOvBckB/vp5tstEqcdSQUAIhM3AkdXLgX62MX1O5vhzPfrs
 wygBVxZ1ods5RM1P2bo3rkV4vhOg1KAw4BDNWT6jQtUsyfXKXB2xoosvmOdXktOl/7t+
 YwJ+LLhd9f6svrDZz2XKgS0MxgqgfWnCBAflsCQQQ4C43jsQE7tvNO5afRBFRVjbBoPM
 4eyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LZL+dDMhzUt93arvpWQQJPSTREHQqTYfTwzJjttMTfc=;
 b=lQTdMr4z2kFNw12mTV9IvDe88/yMnlnBCXz3wEojOdY1mffBR8Tv7q0dAk3zsVDKvA
 gWDeiQBsCsIBiS1IpFNUD5nG45Wkx5B9w9iFpfy0J1nhTuEzKnS2j9aP6y3S5GE35tTE
 RRum6tpN7WMwQ319VwRiZ+l2YGm47v7OWdLp9xhVq++dapYSv2igToJ+ZZLUY6yrnFCe
 KC3v7xOcODJUpR9eLPp3hSikbTG89s4tzlk8eSDnfXEeFEJI9YQ6DailwN0QFzTi8Sld
 SRKyucJzq3QLuXuYEPuX/IKL16nH0Yh7xxXTaGwlZDv/LYsADOATVAqpbrYLvat66HoL
 tGRg==
X-Gm-Message-State: AOAM532uGpkK2d9VkpDV3CDbcHLBr0buRItMXQ+EfwuP3N2vtwSLXXD4
 veMjfY60bUv+cVI+h+OmTFCNOA==
X-Received: by 2002:a17:902:744b:: with SMTP id
 e11mr2063612plt.71.1592454453256; 
 Wed, 17 Jun 2020 21:27:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id u61sm964897pjb.7.2020.06.17.21.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:27:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 012/100] target/arm: Split out gen_gvec_ool_zzz
Date: Wed, 17 Jun 2020 21:25:16 -0700
Message-Id: <20200618042644.1685561-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
X-TUID: /qt2oDTrN3Rs

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 53 +++++++++++++-------------------------
 1 file changed, 18 insertions(+), 35 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3e9bbaca94..6bdd62d4f2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -142,6 +142,17 @@ static int pred_gvec_reg_size(DisasContext *s)
     return size_for_gvec(pred_full_reg_size(s));
 }
 
+/* Invoke an out-of-line helper on 3 Zregs. */
+static void gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
+                             int rd, int rn, int rm, int data)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       vec_full_reg_offset(s, rm),
+                       vsz, vsz, data, fn);
+}
+
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
 static void gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int pg, int data)
@@ -769,11 +780,7 @@ static bool do_zzw_ool(DisasContext *s, arg_rrr_esz *a, gen_helper_gvec_3 *fn)
         return false;
     }
     if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vsz, vsz, 0, fn);
+        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
     }
     return true;
 }
@@ -947,11 +954,7 @@ static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
 static bool do_adr(DisasContext *s, arg_rrri *a, gen_helper_gvec_3 *fn)
 {
     if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vsz, vsz, a->imm, fn);
+        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, a->imm);
     }
     return true;
 }
@@ -1012,11 +1015,7 @@ static bool trans_FTSSEL(DisasContext *s, arg_rrr_esz *a)
         return false;
     }
     if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vsz, vsz, 0, fns[a->esz]);
+        gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
     }
     return true;
 }
@@ -2067,11 +2066,7 @@ static bool trans_TBL(DisasContext *s, arg_rrr_esz *a)
     };
 
     if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vsz, vsz, 0, fns[a->esz]);
+        gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
     }
     return true;
 }
@@ -2244,11 +2239,7 @@ static bool do_zzz_data_ool(DisasContext *s, arg_rrr_esz *a, int data,
                             gen_helper_gvec_3 *fn)
 {
     if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vsz, vsz, data, fn);
+        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, data);
     }
     return true;
 }
@@ -3373,11 +3364,7 @@ static bool trans_DOT_zzz(DisasContext *s, arg_DOT_zzz *a)
     };
 
     if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vsz, vsz, 0, fns[a->u][a->sz]);
+        gen_gvec_ool_zzz(s, fns[a->u][a->sz], a->rd, a->rn, a->rm, 0);
     }
     return true;
 }
@@ -3390,11 +3377,7 @@ static bool trans_DOT_zzx(DisasContext *s, arg_DOT_zzx *a)
     };
 
     if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vsz, vsz, a->index, fns[a->u][a->sz]);
+        gen_gvec_ool_zzz(s, fns[a->u][a->sz], a->rd, a->rn, a->rm, a->index);
     }
     return true;
 }
-- 
2.25.1


Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1157714wrs;
        Wed, 28 Aug 2019 12:14:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzeqpazftRY5qcrHivM7Ao42TemgGUoYVBKrKpgf4ucODWMQFjtyKpzocIr7dgYpIhbKlVu
X-Received: by 2002:a0c:fac3:: with SMTP id p3mr3995297qvo.237.1567019660645;
        Wed, 28 Aug 2019 12:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567019660; cv=none;
        d=google.com; s=arc-20160816;
        b=BIObmV8lvj323Mx++ZGstkhu/Md1yNeptdxjDhr3v9c5lsf+gdfoXZUeLW7wEuAoww
         iFbx8Ehw5A6HgnlgMJQbgmWFg2wfe7JXDOlzlfxEpZUhWgF1H0IMVMQkQkxecbgUleyy
         2uZ+9mDXrZCS62wI8JqQjsDxFYrSd4TYvBUIi1mGPHea430YCdnO1HDAwkffniFkHfVm
         pIMt+Y3gonIrPqBPq6fSwwBceDWsBPDwOtfB12uGHfEuRzBGIzwcHecYi24TagNbyNz5
         E0/bDmKcbpEi/xdDVX+nKFH2iHLg8bpRgo/e2vmA4YAoKiVBSA8yR9ZA9a1n6GcWKvGm
         t6gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=XK0pfbS5nVG6fwyWU5L/Wqmb0aEonSQXz/8cuqg+DQA=;
        b=OKLVEoCyKYi9w8gKvEFwBIcXpeBZDgvhddJwUX6/qCx8bXKshjkpbnmjKYI2xmXvMg
         oENSGYCw6m33URpkKhOKYQLgcjHovrloAZxFpn1YKWcQabtNaHOnzrI0HPMn3yXVJjMq
         yCGjTToBka4a+boDXEk/M1HHeBX4/9dKmauTP0t0bob0JRI3mTtMA/oLajlzB4Uq/dtv
         sFfM1zqPYWewwLDSC95FDYt4xeYIuNp0GfajPtC1EH+ER8SARAuHbX1M5lqcvC/Nzg3x
         w049i6EcHA8H7WOkDGJcRwCZ/rxx+4AnEp97V7yeWLPHh0/pzrGiwSR3jo6oL+R44uWw
         hxTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="feOtS/Zq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si25481qtc.270.2019.08.28.12.14.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:14:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="feOtS/Zq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33Oc-0003TQ-J1
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37591)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Ft-00039l-5N
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Fr-0008K1-7M
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:16 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38450)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Fq-0008J5-Bh
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:15 -0400
Received: by mail-pf1-x444.google.com with SMTP id o70so391850pfg.5
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XK0pfbS5nVG6fwyWU5L/Wqmb0aEonSQXz/8cuqg+DQA=;
 b=feOtS/ZqFlgBkJZ5pdTynYGbMfBpLK0CfrWpuWVF9HIw+VTK/yoKK9RpuibcvLQqx3
 q5OUGEyPoH0zjc4pJQa/otLTy951BOV5GVXbq/8iMZ/aS/ad7L6/U+yvTr0IzbXpKHJh
 vgP1DgHnYRmb+bMyY9763H/UCKW0jKTx4IHRmeYRIZg7i1fBnpC9lj2+fywG19R/MJP8
 g96AMqPv6oM6gTcXiLkIZjaDS6up0+EpDLWakz+XauTQ1nOSzRQPZ1XmuHGXhobFkgNp
 b7mzL3VgbLHQ0aMzkCH1aQorwt4fJ5pJTgLT3utQlC0JaKyzSQRenRhNsMAQqlySOGKB
 /gtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XK0pfbS5nVG6fwyWU5L/Wqmb0aEonSQXz/8cuqg+DQA=;
 b=hb00ZW4VuZxQW8LYMZbs4SKZRsytCPpzaScwpYOBDM2k6uoJdlWpAGM4hGBST/VSPK
 VFQIfzG5ZBcmGFOY81+c7VCM7qQZ5BHeh9/Al+CqxKOwO0uKfL/amon9vI7FSDhZfsRq
 1foK/mc/I9LhQyaPUHpTsRjjnqvL3H4/hQvE1dqKWCYqNsaH0WWl7MQ8cr3yN7mgWqsT
 iNCzYvvXkn3ZZ5SrJ9jBTUxlRwSHmcUpEWEotRD8gFkX5zFutrEyz7m0vxPMl6Aepuz5
 DPD7H7fPqtJiAMh/SUA7f6P8M/5khPML2SZOB7SYUzf3qFn41xvOBzeWJbN/Bv3r4k+V
 KF3A==
X-Gm-Message-State: APjAAAWV2sevgOlpgiq/jpqjabSKf9pw+hAqhnoPKkQr63FtzQAKIL9h
 5h6pSgEG5y1KPKk36TjpxCXA3w==
X-Received: by 2002:a63:607:: with SMTP id 7mr4768185pgg.240.1567019113050;
 Wed, 28 Aug 2019 12:05:13 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:03:58 -0700
Message-Id: <20190828190456.30315-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v3 11/69] target/arm: Simplify op_smlawx for
 SMLAW*
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uUfsr9U2KPvT

By shifting the 16-bit input left by 16, we can align the desired
portion of the 48-bit product and use tcg_gen_muls2_i32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8813d40a2c..fad07499d2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8216,7 +8216,6 @@ DO_SMLAX(SMLALTT, 2, 1, 1)
 static bool op_smlawx(DisasContext *s, arg_rrrr *a, bool add, bool mt)
 {
     TCGv_i32 t0, t1;
-    TCGv_i64 t64;
 
     if (!ENABLE_ARCH_5TE) {
         return false;
@@ -8224,16 +8223,17 @@ static bool op_smlawx(DisasContext *s, arg_rrrr *a, bool add, bool mt)
 
     t0 = load_reg(s, a->rn);
     t1 = load_reg(s, a->rm);
+    /*
+     * Since the nominal result is product<47:16>, shift the 16-bit
+     * input up by 16 bits, so that the result is at product<63:32>.
+     */
     if (mt) {
-        tcg_gen_sari_i32(t1, t1, 16);
+        tcg_gen_andi_i32(t1, t1, 0xffff0000);
     } else {
-        gen_sxth(t1);
+        tcg_gen_shli_i32(t1, t1, 16);
     }
-    t64 = gen_muls_i64_i32(t0, t1);
-    tcg_gen_shri_i64(t64, t64, 16);
-    t1 = tcg_temp_new_i32();
-    tcg_gen_extrl_i64_i32(t1, t64);
-    tcg_temp_free_i64(t64);
+    tcg_gen_muls2_i32(t0, t1, t0, t1);
+    tcg_temp_free_i32(t0);
     if (add) {
         t0 = load_reg(s, a->ra);
         gen_helper_add_setq(t1, cpu_env, t1, t0);
-- 
2.17.1


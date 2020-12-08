Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4241716lfb;
        Tue, 8 Dec 2020 10:13:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmIH7Mg3EK/FkCUTazXjdsETHU6KEg2fVBzkmyaVFYorKZ1golxbvwjn9RGQZyxBZam/re
X-Received: by 2002:a25:3102:: with SMTP id x2mr31816265ybx.495.1607451214915;
        Tue, 08 Dec 2020 10:13:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607451214; cv=none;
        d=google.com; s=arc-20160816;
        b=zCSn9xe4kzBhZDQ+68KLFW8YygbNn4PdQchVvpWKGDCdPTZ0FQhFayoSHF1uA1whqR
         STdWAIsaUjQ1wWIswAaBsEKVtEMV5r2M4LIKSqxaf+b87t8Sc1qDmYaMpD4JpvhKnr0E
         KKCSLyfHJfJ32y7xLn0SuKtiGGCVPx8lRVylnrm7XpPtcctRn7jjvaQX2j71KliFVe6Z
         V5hSGx5DXbbPXR6gS1K4IIQHjSkjEzgkn5VewB9xgTUmR8UarzUFJ4SUtnR98tfAKV48
         nZPd2uuc3L5OAvkWuaLLEHpckRaUUTQ4UGuLnICN15HBuNl2RAfrm9GKyAqWakCNwfr6
         KCJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ywn1xFxnrreGuCNq6h+Wr2lOdbd/pesbHQZ1k8i3mW8=;
        b=wjyK6ZJwgD+pLbY4rOTumdN8fcPfNbJxxSykBkbs5v1wuW1654kSx8KOMcnlCzJOme
         AUKij1Xq2LAYPHBK+KIFo5+4ghPoUhoteAmtcnEAvwz+v16Sk2PHolllE4ej45IWHAJE
         0yZXNkSEJ7aqwM/dwyTgvw/5SLu9Uej/V37GbUhPgQUMB9km41DCWOIvo9toFXYTSk0x
         2f99SFBKaBDC5USCLnyZSItjZ1P3SJGTd6lykQOcf5WiU8PaOLBldXh90Srg5Qmww4lw
         UraqZG/xrY31aYZW878JiJnrrZMki9I8gFax4oGIWxH4QeAHBuY2x8lAAahyWcY7V27k
         aPig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="xk/ClVEC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m142si14749819ybm.454.2020.12.08.10.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:13:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="xk/ClVEC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhUU-0002UJ-93
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJA-0007yh-FG
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:52 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJ1-0006O9-Ng
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:52 -0500
Received: by mail-oi1-x243.google.com with SMTP id p126so20307511oif.7
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 10:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ywn1xFxnrreGuCNq6h+Wr2lOdbd/pesbHQZ1k8i3mW8=;
 b=xk/ClVEC9xTJ7WgicriCb5qe3NEdBJb9ZfB8IfOlo49aGrbQgI5pghb1xBhjk5zetv
 S+1LsDC4TzaLRj9sv0ninXVEjVgbnGbkd/4dxXrqrzkf5eXRRz5GrCu/wi74i7U1zpB8
 7DG38s60a3rSNUQ3Klkxps3NGbYeDA12b4975G4FHY0wyectPAePx0zpuIoGkuvYolnu
 c7dR22UiQsnOL9hDgzhJIRyHktQE2AoBa7QFyXNVhNDIaVD7gzA1HZJ9bqtMydoI+nHi
 khEtj5IA5CJCviFRIYNYLMonYaPOqgmgLW0NtcMVxH4Ipg5Jp6MbmPyA1gXpTAbRedVG
 RIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ywn1xFxnrreGuCNq6h+Wr2lOdbd/pesbHQZ1k8i3mW8=;
 b=XX2Gsa9WEcKoLkggvpWeXi1Xtt+kQDZYUqYNbpBRbrAczMi0uf3hryKW2gJDg2weaV
 g3WvIn5sNczOaFi5Rj/syYAW1UYNyl363p/lOj818Ta0/G9lK2U+ZNzBiLHm3TO89nCj
 lnQMtF33DxMVZbO261ew97gFcxHYlV9AcuVUUNO4pu+iZXqj5jL5XtW8XxZLTxFO1/Fo
 X4wfoYqcBfkNqoGXPiL9EA7eBnqm5V46wTfhA5aD75mtRWYPfb+o7zy6hXgjZOxsYO6D
 5NpodOKRwf7eCFQkwKQtz3g0w/ECfBiVNCmPrI+W+wEQ3th/r4N2gIJhlJ5Z6HXwtJaK
 Cv+A==
X-Gm-Message-State: AOAM532fOZxjU6mDyzXmpR49Y8zsL2fBwlWs2q5pqBQH55AOStgilk1m
 1yDxhRafZXY1jrLjnF5N1yoF0XYMOSEtyZ4v
X-Received: by 2002:aca:c4c2:: with SMTP id u185mr3487753oif.177.1607450502615; 
 Tue, 08 Dec 2020 10:01:42 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/24] target/arm: Enforce alignment for VLDR/VSTR
Date: Tue,  8 Dec 2020 12:01:07 -0600
Message-Id: <20201208180118.157911-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VrZSGVav5m+s

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 98e4ae30eb..122e409f39 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -926,11 +926,11 @@ static bool trans_VLDR_VSTR_hp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UW | MO_ALIGN);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st16(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UW | MO_ALIGN);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -960,11 +960,11 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -1001,11 +1001,11 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i64();
     if (a->l) {
-        gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
         vfp_store_reg64(tmp, a->vd);
     } else {
         vfp_load_reg64(tmp, a->vd);
-        gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
     }
     tcg_temp_free_i64(tmp);
     tcg_temp_free_i32(addr);
-- 
2.25.1


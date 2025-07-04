Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1264460dyc;
        Fri, 4 Jul 2025 07:47:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNLpqCv/kSvH4cTpa1r3VK/RAucrlSgxwhCDn/aGR1UlwBigjTc/JcgBjLwHGL35oU7slew8PjjokafQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGAnKCHI1YPLFibft3HX5Cg5hgUhjRsDnsw0C7OzYEAgLJQ3XB+MAIP7I34mJfp2COiX6oi
X-Received: by 2002:ad4:5fc8:0:b0:6fa:c5be:dac3 with SMTP id 6a1803df08f44-702c6d0e5damr39841146d6.3.1751640427060;
        Fri, 04 Jul 2025 07:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640427; cv=none;
        d=google.com; s=arc-20240605;
        b=cyFuFQ6Ln4saTWRl3rpVuQMgby1lKxMJo1RrKDkycLgQHnrNohhfkUDVT7jfUjbdpF
         EQcyreXFL6zEcV0VzQzED45kcRJJyO3ot7eyZB19EJgWm7Q5tfyLll75YWVqUDoKq9dr
         MdLS0m/bqHahk5JpI7Px10LGWJT2M/uJnFt+XqgTDBw3FA7ieI+I/eWkBJiCvzrkbqj4
         ie53ZbMLMuKPbdK/n8YZX55rZVDFx4o90q77rZ7mlsQe41NO45qH7OWjjpoPDuXqCWbO
         3Bl3e6m56HGya+r7cpiujQlTMF/eObJW/ltTH0fIEG7iSKfU0hqYdMiirItte2OVWK/e
         +iEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mE+L0a4Yv78oWbvNtAlRfemO9fxwjgUBwoQXmXgyee0=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=YhcjE3rlPs2x6/qBgsaNak6m08mxDBqSPNPdliXWFImf7oC/fIhp/qJJ3w7P9Bzt1l
         //u1PbgBXxCa6kxdHu4wnpr6R3pXk+dR8Vj2+PysAPj/wUWq/Q+DQcBSXcOf83+oH0Fc
         fpNwXwiItIfD3DjavxbMCruLv46UqIaYkYjbA53WuSn+k2b1wVbyWnIdmCV9cuL2tYSU
         02tO08DD8Rv5m5CDd0cKaQqJl0i5L4kNFVhnNqtc3UunDBq7NSS/qSr34YsoJquLqPrQ
         ZUjO8Qa8BnXX+ZtalqjgtBt47kSgfR6WiOrTciP5Wgyj4d82Ah3/+cHOKIl9Y6yztTlr
         FoNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rio9bp1J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702c4ccc0f9si21097056d6.40.2025.07.04.07.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rio9bp1J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhTg-0001Kt-4Y; Fri, 04 Jul 2025 10:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhP9-0002Po-E2
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:28:44 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhP6-0001Jb-Bh
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:28:42 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-2e95ab2704fso963618fac.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639318; x=1752244118; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mE+L0a4Yv78oWbvNtAlRfemO9fxwjgUBwoQXmXgyee0=;
 b=Rio9bp1Jdd5OE3gIF4RwlMyd29XkIYF8aBl7MN3KE3fMUf+QtR7sJZqGzmvgAfMfvs
 O3hsWzs9h8SHoWpP41xpDNRr4rs7YmilH1MtOo+LJ6l6m9H9xjLee8u0vO/gQi3P/fDE
 SoauYTPswF+QTwl3JhQI+Sr4c08kYqCOkO4+h8BM7PPAqdR05IspoKR+vC1pW3quxd2F
 xAMoMTEZ/3Io+F2KvG6AwOsgyTaEcqaJmwsAHMpyNT9p125N5J6ucbZesXWH+d/2Y8HU
 QzIPYvl5GFRCz4Kc8EfWyaJlbHPQ6PZsHSspN8jDwwmm210Hl9XzP74iH7tLssav2utm
 57yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639318; x=1752244118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mE+L0a4Yv78oWbvNtAlRfemO9fxwjgUBwoQXmXgyee0=;
 b=vfEkhV/G4MJ7Ft1R0Ww6fKBpZC8XmzS0+XVENRtpr/qH8gup7uOqKxWYSrMdnt33vC
 2VKZuvwISgTXFLmWhYOzydNYPW/+/bEdjIVIbR4MVXB80PjtcTSxEzoOJAKw1IPTcsxj
 +WT+tzj6EAqtcjrda/gYSnLE0UynQtoGLKZD2YZCBYSRj/77GzZ3wXOAyorvfASaqEHO
 BI8QhAEyVUVAYltJRYBS3SewQwMDheiQPXo8VFluAKiYr236zK2az0GA+4M55FmbK8Iy
 pvpOi0KXPY6Qkn7hG3ui1Q40Np4Ux+IgYRyOd5t/5zI47l/JrVeK2Xk+NkGSmwQFaugC
 rojA==
X-Gm-Message-State: AOJu0YwIsr7AsV2YaEhhr39I7Ph7pDLQUk8/Xd/PlX1LW4ltH4rQfhmH
 DTj42uQ32An0a+9s2cRY5Mg0+slFXw2damtl5E8ttPs/XT7dZpjDJzYkD8m1YmigxPg=
X-Gm-Gg: ASbGncsPU5awNG54OC6xjZgfyqMO9h1EdOLCFvxJQM/til7CXPzwofPbCpWVCiwHMMK
 fQP+Gc2HeA0l9+vFLvfy1MwYLV37HnWhvYWazeTcYtlQZDvpaQWh6krz13Vpv6cW+LkiiCo2mR9
 Ypq0CFd46mUXcqbksOzJW8PXbrw58UUnCd0Gp+5SU1Tyuva05KYqB1f2bKzgSNd60OA5KP0SNfx
 NXdN5qhil/4Tul3/u3sB3STfE92yF7MQs2ltzQcjmbkXpLahPMwm3FFAKsNzXmjk00EheYS2+VQ
 zl1l6Z6h3NVufJhNzkWA6SuuJSxfhuinXxgXrejg6w4q8960yAuhzd7A2ym90GfjlbElJheZKQC
 swkkZd6h/k+QDTro3BeZOpPBl77mfHVIRZdBfUIMHkCIIY0l9
X-Received: by 2002:a05:6870:ac0d:b0:2d8:957a:5163 with SMTP id
 586e51a60fabf-2f791d4ecedmr2340480fac.10.1751639318497; 
 Fri, 04 Jul 2025 07:28:38 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff55633sm531448fac.20.2025.07.04.07.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:28:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 080/108] target/arm: Implement SVE2p1 PTRUE (predicate as
 counter)
Date: Fri,  4 Jul 2025 08:20:43 -0600
Message-ID: <20250704142112.1018902-81-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: g3KlO325oYvc

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 16 ++++++++++++++++
 target/arm/tcg/sve.decode      |  1 +
 2 files changed, 17 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index c93dca224c..651b4aa378 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -1679,6 +1679,22 @@ static bool do_predset(DisasContext *s, int esz, int rd, int pat, bool setflag)
 
 TRANS_FEAT(PTRUE, aa64_sve, do_predset, a->esz, a->rd, a->pat, a->s)
 
+static bool trans_PTRUE_cnt(DisasContext *s, arg_PTRUE_cnt *a)
+{
+    if (!dc_isar_feature(aa64_sme2_or_sve2p1, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        /* Canonical TRUE is 0 count, invert bit, plus element size. */
+        int val = (1 << 15) | (1 << a->esz);
+
+        /* Write val to the first uint64_t; clear all of the rest. */
+        tcg_gen_gvec_dup_imm(MO_64, pred_full_reg_offset(s, a->rd),
+                             8, size_for_gvec(pred_full_reg_size(s)), val);
+    }
+    return true;
+}
+
 /* Note pat == 31 is #all, to set all elements.  */
 TRANS_FEAT_NONSTREAMING(SETFFR, aa64_sve,
                         do_predset, 0, FFR_PRED_NUM, 31, false)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 389a72d824..3517efb31b 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -730,6 +730,7 @@ PTEST           00100101 01 010000 11 pg:4 0 rn:4 0 0000
 
 # SVE predicate initialize
 PTRUE           00100101 esz:2 01100 s:1 111000 pat:5 0 rd:4
+PTRUE_cnt       00100101 esz:2 1000000111100000010 ...          rd=%pnd
 
 # SVE initialize FFR
 SETFFR          00100101 0010 1100 1001 0000 0000 0000
-- 
2.43.0


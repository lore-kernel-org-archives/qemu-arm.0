Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2155830njk;
        Sun, 1 Dec 2024 07:19:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWsCucoXOzWn1FIO592boXx3NfDj7EyGsc9dsahbBm9J0/rM3QXUObt82xLpZ7RRmvUV5OHYBrqroRDOA==@linaro.org
X-Google-Smtp-Source: AGHT+IGTL8kHGh/cU/TlgRVd8eWwe5YxT574pBP4BYKJLchDW43JqtZvw8HyFFujtw25wXYY2xlo
X-Received: by 2002:a05:6102:4bc6:b0:4af:f45:d360 with SMTP id ada2fe7eead31-4af555ecd66mr20469758137.5.1733066354621;
        Sun, 01 Dec 2024 07:19:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733066354; cv=none;
        d=google.com; s=arc-20240605;
        b=dCGmmiv9whvNmQzhmCRyKgLMZLVTxXA9vPsn+YN1xyHNbhl1dvbohauLf6zagkQxL3
         D+M2NaSSq2fUaUZYAM+KfwdktcVRfuzXQfw1YJqpmn3WxWqnBGZORm6UJHfMoffU3uuF
         LtoKZHxWastN8aRKipND2yTp5UkxGv3Ufh6lHxIS+xAw2/P4i38hqhiZpNNQV2vve+Mw
         vVjnPnOBHTrKq9CMN3VLGqG2JkQ84Y06CcCUTpIS5xdACBrhgxsMiaal5tHvJ329aogH
         oHEwpnhFwJ7116byAhiourkKCsY5V3VxmwUTjhGH0EPPKX3DgRRNIqI416ePpJs53R/q
         ZqMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KxvxaRx+jKJoX6+NSZwlFhN/rQnNMO6tpe+/xhbNgm8=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=SebSvydwGtzNNdBBwuAXud625hZ4n5J06HUMKzglUuJYkbhPHYsmkEFvrxS7BZzDU9
         AS+WygQJbK6bv6sH07tIVEIzyTrIT70UgosRrvh4ReootxB2AGkHRxhbCbAn2AgXQmTX
         PudOx53avgu9Mc6NpTG9qrNYrYKEPmjlRMi/TkLh1wGbJdkIhSk0xtP6kjy7BxvxPCL/
         vSaVEm0Bx3gE6GQlbCL2Qn/wX4Hd4sKj3FexiHDy0qAvnWya19iRp5+cDQ8DJIm2S5NO
         axZFeuELUK8lpkmLvjhApD21VAHFFQmB67POwyaFgy4diHLQ/BWur3teaDYGY8Ah/Bv3
         jNow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="E/xjjzzV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af590d983esi3137453137.60.2024.12.01.07.19.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:19:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="E/xjjzzV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlcE-0006PB-6C; Sun, 01 Dec 2024 10:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlac-0000Nt-4s
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:26 -0500
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaa-0005Jg-8R
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:25 -0500
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5ee1c3dbeb9so1585066eaf.1
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065823; x=1733670623; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KxvxaRx+jKJoX6+NSZwlFhN/rQnNMO6tpe+/xhbNgm8=;
 b=E/xjjzzV/FpvsZRdxaYTIsemV1LeKrnJs/s/Ni1hh5GZc8fgy1qXtqlQWcOaZYmf2i
 l8VhTUBV67kH+vSNiwFaEJ5RVZKOa+Pv7SDSSunCHZdOapc78vtcVH9IDD8IdjrCgmZA
 NOiB74PIH+0OCjEZLupxsacC46YaZ/PXvPX/GkE5WSy6fkpjcSEogXinNzLGz3upVU2v
 6/FNKVd9K9eKGCmitbGlO5/cTm9SQicVE8CMYUpNqWaNDQuOM8rde6JomL+X/ZsjHwGV
 N9fPc/tUba2UguKqOmPuD/Wyx0f7D4TIKh0B9C1jpYgOpkSpwZBqtlXlb/FxmGu7faQz
 RjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065823; x=1733670623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KxvxaRx+jKJoX6+NSZwlFhN/rQnNMO6tpe+/xhbNgm8=;
 b=SZTIwdBsOtZHYHuYP3bdNQBBoSeyWDOOqjLQ+4PHZ3U8O+oH3EAkp2NB6mVJ0Utvqn
 3+OI0QZmdI0KBuuNj+KIpKKPpJ30oKFG0tywnbTp80SzaM/ocE5valqkwv6c/vhP0Z04
 QhnPVqXo3jLsb1/Jlcz5GuBfdS2BZviKTSypmTz1MYPsoYWq088L4YGvJr64VrfKXmaL
 q9y8YjevIoTZ9OSRCjPOY/4EZUHdPlaQlOJhdamhGUEENnjppsHWi/7Ua80ckWdVSINk
 Z8Vtppshr7dP4kKiO769AiNuE+Ao9L+SnEgkQ+o+dsttXgXlOuhE+b75sR41stv1Zeif
 Va6Q==
X-Gm-Message-State: AOJu0YwvFJzBnKkFswStdxsLBqVbYhgiskcSI7OwmCADkUuHVnK5iLQr
 2l9FCurwRypRkeoJiUb/qMqbL2jQVvBrhdM0RPud+KVAzaO+QmZZb8SPgVu2gN/rAk9+qlk1xFv
 q2Kc=
X-Gm-Gg: ASbGncsRNKLKNrhIW0sWA24C98pMVHkpUpQHBACEIUaxm2RBBVtx7WwG/TYsxHR091G
 KjQDO32llMpIiRE5erZ+ePpjisFWKXS6ujChq3zNHvDBwTojPbc6GJXTEuSyjvrEnS2TaKqQIFR
 dBwJO/DBunePfL2ZHO4RhK8HcQnu+3QEybnGN9nCepkqCbT7RBrP8EHt41HsGTjJJ7St/jjXPtn
 KI+lh1qDXxkZKQiz1XIlc3lPwQNVvFZsMgdoXAUu88NJHEZH1ZTjDIhTIIyJnp2eAx/SWTE7SPq
 5yiHQqCdf+Qpuck04Q0kPW5l67twc0eEYD4j
X-Received: by 2002:a05:6820:2110:b0:5f1:e75c:9e3a with SMTP id
 006d021491bc7-5f217a0f4f3mr9583288eaf.3.1733065822920; 
 Sun, 01 Dec 2024 07:10:22 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f21a4cd78fsm1807008eaf.32.2024.12.01.07.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:10:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 65/67] target/arm: Introduce gen_gvec_urecpe, gen_gvec_ursqrte
Date: Sun,  1 Dec 2024 09:06:04 -0600
Message-ID: <20241201150607.12812-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: sWmlb1Ws1YdH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  3 +++
 target/arm/tcg/translate.h      |  5 +++++
 target/arm/tcg/gengvec.c        | 16 ++++++++++++++++
 target/arm/tcg/translate-neon.c |  4 ++--
 target/arm/tcg/vec_helper.c     | 22 ++++++++++++++++++++++
 5 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 1132a5cab6..9919b1367b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1121,6 +1121,9 @@ DEF_HELPER_FLAGS_4(gvec_uminp_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_uminp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_uminp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(gvec_urecpe_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_ursqrte_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "tcg/helper-a64.h"
 #include "tcg/helper-sve.h"
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index edd775d564..228b195a22 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -602,6 +602,11 @@ void gen_gvec_uaddlp(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
 void gen_gvec_uadalp(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                      uint32_t opr_sz, uint32_t max_sz);
 
+void gen_gvec_urecpe(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_ursqrte(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                      uint32_t opr_sz, uint32_t max_sz);
+
 /*
  * Forward to the isar_feature_* tests given a DisasContext pointer.
  */
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 2755da8ac7..a6935a7188 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -2697,3 +2697,19 @@ void gen_gvec_uadalp(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     assert(vece <= MO_32);
     tcg_gen_gvec_2(rd_ofs, rn_ofs, opr_sz, max_sz, &g[vece]);
 }
+
+void gen_gvec_urecpe(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t opr_sz, uint32_t max_sz)
+{
+    assert(vece == MO_32);
+    tcg_gen_gvec_2_ool(rd_ofs, rn_ofs, opr_sz, max_sz, 0,
+                       gen_helper_gvec_urecpe_s);
+}
+
+void gen_gvec_ursqrte(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                      uint32_t opr_sz, uint32_t max_sz)
+{
+    assert(vece == MO_32);
+    tcg_gen_gvec_2_ool(rd_ofs, rn_ofs, opr_sz, max_sz, 0,
+                       gen_helper_gvec_ursqrte_s);
+}
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index cea400e1f5..af06c0887b 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -3086,7 +3086,7 @@ static bool trans_VRECPE(DisasContext *s, arg_2misc *a)
     if (a->size != 2) {
         return false;
     }
-    return do_2misc(s, a, gen_helper_recpe_u32);
+    return do_2misc_vec(s, a, gen_gvec_urecpe);
 }
 
 static bool trans_VRSQRTE(DisasContext *s, arg_2misc *a)
@@ -3094,7 +3094,7 @@ static bool trans_VRSQRTE(DisasContext *s, arg_2misc *a)
     if (a->size != 2) {
         return false;
     }
-    return do_2misc(s, a, gen_helper_rsqrte_u32);
+    return do_2misc_vec(s, a, gen_gvec_ursqrte);
 }
 
 #define WRAP_1OP_ENV_FN(WRAPNAME, FUNC) \
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 0f4b5670f3..c824e8307b 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3105,3 +3105,25 @@ void HELPER(gvec_rbit_b)(void *vd, void *vn, uint32_t desc)
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_urecpe_s)(void *vd, void *vn, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint32_t *d = vd, *n = vn;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = helper_recpe_u32(n[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_ursqrte_s)(void *vd, void *vn, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint32_t *d = vd, *n = vn;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = helper_rsqrte_u32(n[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.43.0


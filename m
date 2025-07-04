Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1251627dyc;
        Fri, 4 Jul 2025 07:25:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2nxyPB7TpYhxCo8SJ3GKlOisHbu5M2RgUjbPIXzoYmENeSUZ1KxvyHh6lKBTmofHu0Af26VPzlHDCDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IElFq83Sz+qRXrdlg19BIehfeRbL+eghHh7oSEOC8yMXpJ40HZ3FCoJo9RGxqZzMZndX8/T
X-Received: by 2002:ac8:690b:0:b0:4a9:783e:9dd1 with SMTP id d75a77b69052e-4a994f7fb63mr50441991cf.21.1751639130357;
        Fri, 04 Jul 2025 07:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639130; cv=none;
        d=google.com; s=arc-20240605;
        b=DpAwz8+HpY6d7QYBTV1D5PUcNaZgWqEB3/6zyfROPJjfrDiMQkzwWb6ApaWW3dd1+C
         cnB9f7CbB8lGkmllEof5rP8sk/T1+vQhBGdgOBYH0A/96a4FBdM0UtDXOtzifZHz2ufn
         fgDwgw0HgsfwjHI27oRXgbLVXkBvae3TK8NNGR6D3VPz1c6JBMyTlMXfY5Cx/O7q7wOV
         6v/Q1x1zvBB+x96Tn0E/Q+RLQOW8mxoDLq5n9CnJdNHg51vea0r/n0VlmLUQG9/Uz4W3
         K52HT9Fodv+gYYMKFfKXwkileU8kImpa35EvYVleTvQ6m7nu4gZZiIwIuvR/enHxdmmo
         bTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vNZtaHI5O3n0iljnyaa7aMe3WPZsbbr5by4hbzbNhjg=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=MCjfe6s4jMvkvlFMRtbph91BA8wvAws2FniXOm3n7tPLlcZbgvRY29JFqNSMwIcKhy
         LFzLk0vHDYIDHYndq7TIobx/0P9ZXdCFJHoIx62RBzoeAfAHDgekywcJsmyFeZ/1t4ce
         hQPRDFDKNidrnd/YkqI3AlnQZjWLFYoTHJnf0A1gNcjHAT5gUd8BdDblXx64xPg+lOA5
         c0qFy3+9apou5XdqVG6lc0QrGtlnUozoX/zIj46Iu/xJVuDmWXZVG09oX0JLbDb8lSRx
         l1rBY78SYe+OQoIlPgCo53y7WFPC9554+AhCXH0MHyVJsKM3S9g6WuIeUj4s6DwNg4NW
         X0Aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HebmlD3D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994ace8eesi20102521cf.386.2025.07.04.07.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HebmlD3D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhLb-0003WC-1v; Fri, 04 Jul 2025 10:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIL-0005Im-JZ
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:43 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIJ-0005w3-Ls
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:41 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-2ea65f5a0easo751247fac.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638898; x=1752243698; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vNZtaHI5O3n0iljnyaa7aMe3WPZsbbr5by4hbzbNhjg=;
 b=HebmlD3DvB+PxKtezevm47UMMlrVzYsCHM8IiyqOQKYwWBwFcxXLS6USWgnshhiQwQ
 qP/RJlmRjD7eqF+UufmVc/JuzKeESe7d69047dGrETWDevVBzW4sL7qK0K4vf+Jb6zP8
 8od8jRo9xC4uCkURQ4YOVxkioXWqYdowpYLfFeAMWkflV8s05FkIZNGe7ZX4rTfbmG3F
 R27p3GdCBKas6+TOQoJX3BHfxo+ZK3Nqt6S2G0LwgOh3thD401m0aQj4swd8mxPQ4d7r
 FyCYJ4Lb5MyojFKbsMASvjlAw6V8dW1s/rf2uXkdjVyS6iJZTZaw6FOipg4owZz4LWDu
 bOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638898; x=1752243698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vNZtaHI5O3n0iljnyaa7aMe3WPZsbbr5by4hbzbNhjg=;
 b=Ul37vJ4oOngViaCaFe23L7VhYq+SCrZP0zxzoKH9/hcTTCYe2z+L6XGsIdZKvD3nhC
 +uES1G429d3/XNYn0WvQZWLJVE1+mH/L03q7RjF9qqLnUKgPHSuMM/b5CEVX6JbTgejp
 w1TS5cTjc+VCAbbuRPef/QctJaNizfhJaRpcZnwbt6aW9gHT1+MPpiTgnFQo+T0uUTyM
 apsXVpWb7/r5r/pO1koQzokbXQphdv2/NF753JKfsr+CVTk6D/iDoImjCSLQEgYNTuhV
 JoOpkxuXTgJfe5tNDivBSf1Y92xkKjn5P5lTeTSy6UbRJf/6XgpBXbrxRL8a1Sz6OUpF
 1p3w==
X-Gm-Message-State: AOJu0YwiaLRqcXMNMWym9y3gkLwmTw8bSID3t+i7K51ABZQes3SUb2/0
 KCXoFFBJYZIPpHMLXHFHFxlTX4/U1KSV9GD2ql3uabAF4RP0mFuVMGPQgWE9C+0+3cc=
X-Gm-Gg: ASbGncuskFgwfTjrq6f/cCWvjFbcYkUjcwuZdT0aawUcLCOYPclLSDt4JzGFIzIMpeb
 fclaOrEODz1u6zuMKpKePKFGoEK7VB1Olsq04PYdsLJlVoSqW6dcxj4YYZIbcqI67B+49VGVad0
 LlsZvlYIy6QbeOLBk7PVQ2rpNcGos0PfL4etJ1zWdeoxoaxocbzMSf+5Ey2ohsEslAdLHLceHtu
 m96sUtEoDVgYZoyPPq9EJ1dV7dGUTHioqwMX641xXKpFaQ/wAEgZmJKo6+jVjljVlC4ak0oInT8
 crFC4u2zGWiAcajyI3CYl3DoezlUfyEYFAL+yj8cx5jFWefvvN9ZADW0QdmchkUYRPLMGnFiofP
 hMudcxnSbMbLAC56MYGjf1D40w7cgWs5DP917rY2H6HGgyNi9jYkXRjFfXxs=
X-Received: by 2002:a05:6870:8885:b0:2b8:608d:5dd1 with SMTP id
 586e51a60fabf-2f7904b4ac5mr2889471fac.18.1751638898422; 
 Fri, 04 Jul 2025 07:21:38 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 022/108] target/arm: Rename MOVA for translate
Date: Fri,  4 Jul 2025 08:19:45 -0600
Message-ID: <20250704142112.1018902-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
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
X-TUID: So+IHU41JH8C

Prepare for more kinds of MOVA from SME2 by renaming the
existing SME1 MOVA to indicate tile to/from vector.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 12 +++++-----
 target/arm/tcg/sme.decode      | 42 +++++++++++++++++-----------------
 2 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index e22ec393fd..2c8cb24b7c 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -151,7 +151,7 @@ static bool trans_ZERO_zt0(DisasContext *s, arg_ZERO_zt0 *a)
     return true;
 }
 
-static bool trans_MOVA(DisasContext *s, arg_MOVA *a)
+static bool do_mova_tile(DisasContext *s, arg_mova_p *a, bool to_vec)
 {
     static gen_helper_gvec_4 * const h_fns[5] = {
         gen_helper_sve_sel_zpzz_b, gen_helper_sve_sel_zpzz_h,
@@ -173,9 +173,6 @@ static bool trans_MOVA(DisasContext *s, arg_MOVA *a)
     TCGv_i32 t_desc;
     int svl;
 
-    if (!dc_isar_feature(aa64_sme, s)) {
-        return false;
-    }
     if (!sme_smza_enabled_check(s)) {
         return true;
     }
@@ -189,14 +186,14 @@ static bool trans_MOVA(DisasContext *s, arg_MOVA *a)
 
     if (a->v) {
         /* Vertical slice -- use sme mova helpers. */
-        if (a->to_vec) {
+        if (to_vec) {
             zc_fns[a->esz](t_zr, t_za, t_pg, t_desc);
         } else {
             cz_fns[a->esz](t_za, t_zr, t_pg, t_desc);
         }
     } else {
         /* Horizontal slice -- reuse sve sel helpers. */
-        if (a->to_vec) {
+        if (to_vec) {
             h_fns[a->esz](t_zr, t_za, t_zr, t_pg, t_desc);
         } else {
             h_fns[a->esz](t_za, t_zr, t_za, t_pg, t_desc);
@@ -205,6 +202,9 @@ static bool trans_MOVA(DisasContext *s, arg_MOVA *a)
     return true;
 }
 
+TRANS_FEAT(MOVA_tz, aa64_sme, do_mova_tile, a, false)
+TRANS_FEAT(MOVA_zt, aa64_sme, do_mova_tile, a, true)
+
 static bool do_movt(DisasContext *s, arg_MOVT_rzt *a,
                     void (*func)(TCGv_i64, TCGv_ptr, tcg_target_long))
 {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index efe369e079..459b96805f 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -27,29 +27,29 @@ ZERO_zt0        11000000 01 001 00000000000 00000001
 ### SME Move into/from Array
 
 %mova_rs        13:2 !function=plus_12
-&mova           esz rs pg zr za off v:bool to_vec:bool
+&mova_p         esz rs pg zr za off v:bool
 
-MOVA            11000000 00 00000 0 v:1 .. pg:3 zr:5 0 off:4  \
-                &mova to_vec=0 rs=%mova_rs esz=0 za=0
-MOVA            11000000 01 00000 0 v:1 .. pg:3 zr:5 0 za:1 off:3  \
-                &mova to_vec=0 rs=%mova_rs esz=1
-MOVA            11000000 10 00000 0 v:1 .. pg:3 zr:5 0 za:2 off:2  \
-                &mova to_vec=0 rs=%mova_rs esz=2
-MOVA            11000000 11 00000 0 v:1 .. pg:3 zr:5 0 za:3 off:1  \
-                &mova to_vec=0 rs=%mova_rs esz=3
-MOVA            11000000 11 00000 1 v:1 .. pg:3 zr:5 0 za:4  \
-                &mova to_vec=0 rs=%mova_rs esz=4 off=0
+MOVA_tz         11000000 00 00000 0 v:1 .. pg:3 zr:5 0 off:4  \
+                &mova_p rs=%mova_rs esz=0 za=0
+MOVA_tz         11000000 01 00000 0 v:1 .. pg:3 zr:5 0 za:1 off:3  \
+                &mova_p rs=%mova_rs esz=1
+MOVA_tz         11000000 10 00000 0 v:1 .. pg:3 zr:5 0 za:2 off:2  \
+                &mova_p rs=%mova_rs esz=2
+MOVA_tz         11000000 11 00000 0 v:1 .. pg:3 zr:5 0 za:3 off:1  \
+                &mova_p rs=%mova_rs esz=3
+MOVA_tz         11000000 11 00000 1 v:1 .. pg:3 zr:5 0 za:4  \
+                &mova_p rs=%mova_rs esz=4 off=0
 
-MOVA            11000000 00 00001 0 v:1 .. pg:3 0 off:4      zr:5  \
-                &mova to_vec=1 rs=%mova_rs esz=0 za=0
-MOVA            11000000 01 00001 0 v:1 .. pg:3 0 za:1 off:3 zr:5  \
-                &mova to_vec=1 rs=%mova_rs esz=1
-MOVA            11000000 10 00001 0 v:1 .. pg:3 0 za:2 off:2 zr:5  \
-                &mova to_vec=1 rs=%mova_rs esz=2
-MOVA            11000000 11 00001 0 v:1 .. pg:3 0 za:3 off:1 zr:5  \
-                &mova to_vec=1 rs=%mova_rs esz=3
-MOVA            11000000 11 00001 1 v:1 .. pg:3 0 za:4       zr:5  \
-                &mova to_vec=1 rs=%mova_rs esz=4 off=0
+MOVA_zt         11000000 00 00001 0 v:1 .. pg:3 0 off:4      zr:5  \
+                &mova_p rs=%mova_rs esz=0 za=0
+MOVA_zt         11000000 01 00001 0 v:1 .. pg:3 0 za:1 off:3 zr:5  \
+                &mova_p rs=%mova_rs esz=1
+MOVA_zt         11000000 10 00001 0 v:1 .. pg:3 0 za:2 off:2 zr:5  \
+                &mova_p rs=%mova_rs esz=2
+MOVA_zt         11000000 11 00001 0 v:1 .. pg:3 0 za:3 off:1 zr:5  \
+                &mova_p rs=%mova_rs esz=3
+MOVA_zt         11000000 11 00001 1 v:1 .. pg:3 0 za:4       zr:5  \
+                &mova_p rs=%mova_rs esz=4 off=0
 
 ### SME Move into/from ZT0
 
-- 
2.43.0


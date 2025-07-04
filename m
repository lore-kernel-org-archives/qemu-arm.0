Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1263412dyc;
        Fri, 4 Jul 2025 07:45:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLcgOrCfPFTDt+5FqWlWAH1gTJo8DuqyAZXKty0z2FY5imZVmmN57XzkHipk5XEsyBpniiVQfKtzXpIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEBZRUbODlmkQp4MIc+z8HEhrLhXIwjxv4xnGKphXzvfbBB6+XpK2dhqoHy/VlajGpqEueJ
X-Received: by 2002:a05:6102:6481:20b0:4ec:c513:f3d with SMTP id ada2fe7eead31-4f2f1bb51b3mr1137594137.25.1751640316132;
        Fri, 04 Jul 2025 07:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640316; cv=none;
        d=google.com; s=arc-20240605;
        b=JyYmob/uHamh7x7o91nE7labWqld/b4KB/yV81Av9CxsUpxJZ3iw9vp30BLjlmmagL
         h6qzsHVLmUtAt0KQJythBmW1/WWfDxfJHn2lKmFkOQ9ECFBdXi5ULYX/5HXLXnt01Pht
         RtlNZAFs97F4ZaiXzTXL2uFU9noaGaq6EoUhu7eNCwRv4ARbeUADTaDStx3b8FY4uczA
         iP/lOIEaT2W6qa8YVdRfc6MNYzZnVcQFPSmYe+JID2wcIqZkadpbKBEHQSY+0OhyzaSf
         NJ7IME97lDiiyI1FaqaRFZNEw/YmeoRLh5tOYdQXokMK17Bnb8wpOnm0d+ErlPW9NZ4e
         LTsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=e72HPrwLrbdL1jX39eQb8H3bN7lS2PKV0Eo2nzZUj34=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=AMGSZisV4MWH657Dl8IESd6WpduUPh88dBHqVmScvi6HrOfMVnxNWS/A2ZMRbZNEXd
         XF5jVa/xV2qCq/FahzVGNqGS563hl1Vu0aD7m4vnnqmairPDUpw1M1ce0wQcpMkbXP9o
         HKlX5yDesFfNDmLgcVNjTxKoX1UR2Pf36kORNDR9cnEkR7Dz67p3MaFjkXZYK3r4dVWh
         ONlN8R5AudX/jSwPxTEJPMEF0sVK992SMCZ2el4NqSr1Nir4r9Bog0krbXq19BSZfr9Q
         4DjV11m0os3QXUTwQVcWE0meNHGo70Gg2oR+upyMcoi0BdVCJ1nLV0wAWw7AeDqx+vPV
         +Eow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CnRhtyfU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea536e50si664024137.151.2025.07.04.07.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:45:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CnRhtyfU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhOX-0001gK-W8; Fri, 04 Jul 2025 10:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM1-0004Oi-Mb
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:31 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLv-00082y-Gx
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:29 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-610d86b3da9so260839eaf.0
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639122; x=1752243922; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e72HPrwLrbdL1jX39eQb8H3bN7lS2PKV0Eo2nzZUj34=;
 b=CnRhtyfUKAYMCFJnHcvwatmRobwlUO9nJrk53Ez213vK32NbDW8S7ZjZXfCUkTlvmZ
 n4EfWTD5TOhypx8tJA6jJNPoOpEN47h21FRxSzNWmFiD61RceEydec20fcLWCE1vFzUV
 DRUg29CrfoxXbwfn/6Z0A8MYGQvgHM7u7zghUYrAXGLkePh3Fr4NK3lS/UmwRsYVAQW1
 ZdurxAnSz0LM4TQDUjjbkONtugS8H64nK0LgRxa4cLCHc1j1Y2tEA+uY1otVWwo2w42N
 8UpGXnPcIZDEbg4e9TdmdR/qgw/WbI82MNdZ7Czt/hV7K0wE37aLNCRCYoSoWfD9g8dR
 J6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639122; x=1752243922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e72HPrwLrbdL1jX39eQb8H3bN7lS2PKV0Eo2nzZUj34=;
 b=qSFH7PJ7+0bcZe+fFD1ygF2q1YPp6mZsLe7w9oTTcBXtrSCuvYYioJo7LPK9tqogy2
 HkrZRdG/NaivnMRZXRL0/2YNnYFFeH9uHLQBpvjkAbk2xMTgHvO2eSGaZwrT8B1+cL+V
 bxbsGs6LvaGsqbR6dqtZk3/sOgCGLj/rEzeltuyN7wNP9SdLK/PysHT7z8Q6/Yjm5/CQ
 na0lj9Z3n787TSdtQqvmVHa4P8bsBHs5KSnkxT2+dFwkz9vQ9x2yqZ1sBcmhbGe+0+C1
 KoR8wbQoheIlFEAiW0VMpHFaBdnJfskG6KmyVrtrDN6GdoH/k1oZw/uaqwMItbnIPkTW
 zpig==
X-Gm-Message-State: AOJu0Ywe9pfcQvaM3MK+IkKW1vLy2OSREYAcqjSTbin6w6xcrGFYLDmG
 ZCAVxh3xT+lUHAERAu9RIj6RhXfuHxfiLxZmQhNUeSTpk89xUd19HaTiFoIbqNM2F6I=
X-Gm-Gg: ASbGncuNpIPuJ/ZWP2ZqsY6gwRW/k+3UhJs9hLYXgrCiyUiKYAkT5EhAwg9/+1eM4Hr
 LlaCTtYqq9qhH6G0vAYU0Xzz5Qxm+168wGfdzlaFT2HFn/TnHHP/AvyhNXKzy1aZlFUrZg7DgV9
 xxckoNtcgL+FwUdV0/Bz+viWfaO8yfcHlicxjkT8oGeVH6iqhxyrrNKX0MumA3qwXQGAx+bHyQT
 nGTE7jpMiy0Wvp3vz9QsTlCWi5hn60rxpD3x0wSoLLU771o1X9YeYySldqSl2VkgrSuSEFE0u4n
 A+dNAVbfdaFzi5eWEoWwVPtFJqx0LsMA54OUZniWXyowZLUZQulPpst0LppsPdd0HlVUGSHGz3s
 hY0u7kH57e/JbeuRbbsIb35VWj9pkQSKj61o1DCoGXtLWCA0P
X-Received: by 2002:a4a:ee0a:0:b0:613:87ee:10e with SMTP id
 006d021491bc7-613900eb5dcmr1926617eaf.5.1751639121898; 
 Fri, 04 Jul 2025 07:25:21 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 063/108] target/arm: Move do_urshr,
 do_srshr to vec_internal.h
Date: Fri,  4 Jul 2025 08:20:26 -0600
Message-ID: <20250704142112.1018902-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2b.google.com
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
X-TUID: ryy5HfwG2xjZ

Unify two copies of these inline functions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/vec_internal.h | 21 +++++++++++++++++++++
 target/arm/tcg/mve_helper.c   | 21 ---------------------
 target/arm/tcg/sve_helper.c   | 21 ---------------------
 3 files changed, 21 insertions(+), 42 deletions(-)

diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index a1c10c60a1..5efd257c50 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -230,6 +230,27 @@ int64_t do_sqrdmlah_d(int64_t, int64_t, int64_t, bool, bool);
 #define do_usat_h(val)  MIN(MAX(val, 0), UINT16_MAX)
 #define do_usat_s(val)  MIN(MAX(val, 0), UINT32_MAX)
 
+static inline uint64_t do_urshr(uint64_t x, unsigned sh)
+{
+    if (likely(sh < 64)) {
+        return (x >> sh) + ((x >> (sh - 1)) & 1);
+    } else if (sh == 64) {
+        return x >> 63;
+    } else {
+        return 0;
+    }
+}
+
+static inline int64_t do_srshr(int64_t x, unsigned sh)
+{
+    if (likely(sh < 64)) {
+        return (x >> sh) + ((x >> (sh - 1)) & 1);
+    } else {
+        /* Rounding the sign bit always produces 0. */
+        return 0;
+    }
+}
+
 /**
  * bfdotadd:
  * @sum: addend
diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 506d1c3475..b9b2faa3a7 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -2164,27 +2164,6 @@ DO_VSHLL_ALL(vshllt, true)
     DO_VSHRN(OP##tb, true, 1, uint8_t, 2, uint16_t, FN)         \
     DO_VSHRN(OP##th, true, 2, uint16_t, 4, uint32_t, FN)
 
-static inline uint64_t do_urshr(uint64_t x, unsigned sh)
-{
-    if (likely(sh < 64)) {
-        return (x >> sh) + ((x >> (sh - 1)) & 1);
-    } else if (sh == 64) {
-        return x >> 63;
-    } else {
-        return 0;
-    }
-}
-
-static inline int64_t do_srshr(int64_t x, unsigned sh)
-{
-    if (likely(sh < 64)) {
-        return (x >> sh) + ((x >> (sh - 1)) & 1);
-    } else {
-        /* Rounding the sign bit always produces 0. */
-        return 0;
-    }
-}
-
 DO_VSHRN_ALL(vshrn, DO_SHR)
 DO_VSHRN_ALL(vrshrn, do_urshr)
 
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index f9052f2164..0e59ad2262 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -2050,27 +2050,6 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)  \
    when N is negative, add 2**M-1.  */
 #define DO_ASRD(N, M) ((N + (N < 0 ? ((__typeof(N))1 << M) - 1 : 0)) >> M)
 
-static inline uint64_t do_urshr(uint64_t x, unsigned sh)
-{
-    if (likely(sh < 64)) {
-        return (x >> sh) + ((x >> (sh - 1)) & 1);
-    } else if (sh == 64) {
-        return x >> 63;
-    } else {
-        return 0;
-    }
-}
-
-static inline int64_t do_srshr(int64_t x, unsigned sh)
-{
-    if (likely(sh < 64)) {
-        return (x >> sh) + ((x >> (sh - 1)) & 1);
-    } else {
-        /* Rounding the sign bit always produces 0. */
-        return 0;
-    }
-}
-
 DO_ZPZI(sve_asr_zpzi_b, int8_t, H1, DO_SHR)
 DO_ZPZI(sve_asr_zpzi_h, int16_t, H1_2, DO_SHR)
 DO_ZPZI(sve_asr_zpzi_s, int32_t, H1_4, DO_SHR)
-- 
2.43.0


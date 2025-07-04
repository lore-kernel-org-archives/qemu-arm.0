Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1258591dyc;
        Fri, 4 Jul 2025 07:36:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXY4wYTYSmvNyoJ716DkiHDbfJc2yJ+0LAGvAjXoFuu4J2nChgMiz8ybyKMcPYHW3/iYb0Ag4JtNVTsGA==@linaro.org
X-Google-Smtp-Source: AGHT+IFZVQSsLmu6LGYrSqurn8vjRUZRfp6WpJ/ENJfo8aIbxKJtYOvf1cMDoNkZa2EwBjRdUEWS
X-Received: by 2002:a05:6122:3708:b0:531:2f51:7676 with SMTP id 71dfb90a1353d-5347c0328a6mr1886121e0c.9.1751639788951;
        Fri, 04 Jul 2025 07:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639788; cv=none;
        d=google.com; s=arc-20240605;
        b=ZfTRnJzJAW9o2j9MOn9b9iKGnw6BgEWtjJCkTBdK8zzDyh5YUOpk4BLcfpPA4lSbIs
         G/JX4wXcih2IwilM4Kf9E8qN6e4iflOfQzzKuh/OKFnhJ2OMSncI8Ex/SoXhNr4CI648
         fNcjSiDOVgFEBLLgowJI8QIRfr3rywFl3T4tB1spWOxmtJUysIVXp8KMr86HoDA1zxAP
         AKJ/MRb4FoyvCjhGHG8mo2ZV5hmo7nd4r4SBLZTj2zPpUOU8TBHpvUxUejiXi1zzOe68
         Np5pio16kXG5m8PGF3bahEsGY4sQzLV4xlQ9lONKbhAFQvVoohAnxrDrioHQeXWftPsj
         49Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6bLvhBwNEmDsnka8cIDU5PrrUCOcipDYGvxoPFyUBc4=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=g8XmmN5tIW3uL0HF4xW9BFZ7K3+7yPDW/GdRVO29TK4sU53rMJoypnpKp25zfEYJzH
         71752gb/WRx4nimkTKWMDtSBUte+DNbV62Nhrp3hcWgj6lUvRA5XYowvjTF9sIFcVh6q
         zvPPOZIWA6A7u8eegK3DUZDuszetqmS85BeKWZ6oYz+vF89HltIzOrVXmKmsGPWDaF1F
         /nK3l/sDmymN+xKMThRKEWWF+7KTo3nK7rSsI0o36RMAAWCa0SoB3OSJJM2Z8cB7+UYq
         TatfvsoamSRiVAMTLC16ZtWLN/xtgjwZHGx0RoIj0o63gvWgYSV8gE7E0+YMOgY5kYZT
         Phug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vDc2C2rM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea787fcesi665670137.610.2025.07.04.07.36.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:36:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vDc2C2rM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhVM-0005q5-EJ; Fri, 04 Jul 2025 10:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM7-0004bI-AJ
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:39 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM1-00087Z-GJ
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:34 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-60d6303a11eso567366eaf.0
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639128; x=1752243928; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6bLvhBwNEmDsnka8cIDU5PrrUCOcipDYGvxoPFyUBc4=;
 b=vDc2C2rMeVVG6QK5W4T8/NKnhMOFn4Rxl/rDsV7vwinOqSRNCtdIBg48OUymM2T0Ky
 A+ywlxURYwXoOGQfIa+4ZDaB83meW2LcCK46flRRqfdOtuz7jQwnkfSfs1Ot4YjFclxQ
 pscbBnPbX6Gfm+9mQ0GUfflvGTagiRca5LAD8w/fKTSW6IP2Xy8BRmm/NxcnH0Izt+gn
 TNFtvZwi+i6wA4U8QWTKf0h6PjctriI2rLvKD2tzrbAlJpF135fhlHhnFxQiyBVqMX/1
 9E1tRMdpem4+6sX60pnqcmTk3Jl+nia9ajFS2bX13rRQhFpnoyb8q+bAuZ6pRpYKye6a
 FpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639128; x=1752243928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6bLvhBwNEmDsnka8cIDU5PrrUCOcipDYGvxoPFyUBc4=;
 b=i/beWD2xv1rTrr6au4Xv5ZIWx+/zN5clUkx9irJl1t0QIVb8ZFEhT87HPGE5L8oO1X
 KBZxpFkbw61357phjMDy4SnCrIMI+O26SnFU6jZ5duqIQD0c8kfj3zToLLwMVS7JFoH1
 bspUj4TwfuURIRHAi+wsUFFB4DeEcj3vDjgZEkBXE8LOS+RqMXtRIUAncKnz/jqWCB8S
 TygbbAb5QExEToQx3ZzcEIxsff8gEOPvp/CLEmgM8qJ8nqfYs/P5DHNrudS5f9LTpfqF
 EyLr2TY3Q3c1QVwKtEgeYDUjFTHnV+jXdHcSy+olOy2VDK5KbCwHPpCM2ZterDimRz/f
 Hvxg==
X-Gm-Message-State: AOJu0YzCau5En5RfUVqTh2br7RYVj9YloRMvWxGFYsF4gSPocPea09xW
 fiDwxnah2JWfNzMvcPV1Qh2VfpwBB+fVZbuJYBskOeKCDMqNWA+fjisNgnQrfpgntJY=
X-Gm-Gg: ASbGnctNgr5DsVBaiu7GNTc511cQrc74gt8q0EAogR7Z+eW8YttMZT4RuB0+qjP1r6c
 sRqeYnOVle+F1e1rG7iGEqR46FYc8Uq9MGhzq1NC6M0PCGJzEnRlCCzJWPAIyvN2gGJZNn+50TN
 o2iBUggPHhowBylv0LRl0M0C2lzlqnufd5SweZEpbjLa1UVQjFVjenKrCmdTA2QrifBDm3AeOA4
 yL8PkGDDkJ3yvG7LJ6a2Md7EPuGw1ElVcWj+VgpKZd/kQVw/GFIewNufbUzXGtlyr6HPw5/rZ/D
 8n6mS5anNG3BZoGEIzbqwHL0Yz6klaKTn5hrOmLkvtx+BAFNwkAUw90xlTBor+5ZNmti9Wtkgaa
 k5ircDjLJycWHG/expIGDemfFvw9BDA1hoA3n0/yDmWQG4AA+Qe7GoV8fKro=
X-Received: by 2002:a05:6820:1e88:b0:613:8456:51ac with SMTP id
 006d021491bc7-6138fe859cemr1633774eaf.0.1751639128110; 
 Fri, 04 Jul 2025 07:25:28 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 070/108] target/arm: Introduce pred_count_test
Date: Fri,  4 Jul 2025 08:20:33 -0600
Message-ID: <20250704142112.1018902-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
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
X-TUID: h5+iSTju46h3

For WHILE, we have the count of enabled predicates, so we don't
need to search to compute the PredTest result.  Reuse the logic
that will shortly be required for counted predicates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 81 +++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 35 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 0e59ad2262..5b5871ba13 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4102,30 +4102,46 @@ uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
     return sum;
 }
 
+/* C.f. Arm pseudocode PredCountTest */
+static uint32_t pred_count_test(uint32_t elements, uint32_t count, bool invert)
+{
+    uint32_t flags;
+
+    if (count == 0) {
+        flags = 1;                              /* !N, Z, C */
+    } else if (!invert) {
+        flags = (1u << 31) | 2;                 /* N, !Z */
+        flags |= count != elements;             /* C */
+    } else {
+        flags = 2;                              /* !Z, !C */
+        flags |= (count == elements) << 31;     /* N */
+    }
+    return flags;
+}
+
 uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
 {
     intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     uint64_t esz_mask = pred_esz_masks[esz];
     ARMPredicateReg *d = vd;
-    uint32_t flags;
-    intptr_t i;
+    intptr_t i, oprbits = oprsz * 8;
+
+    tcg_debug_assert(count <= oprbits);
 
     /* Begin with a zero predicate register.  */
-    flags = do_zero(d, oprsz);
-    if (count == 0) {
-        return flags;
+    do_zero(d, oprsz);
+    if (count) {
+        /* Set all of the requested bits.  */
+        for (i = 0; i < count / 64; ++i) {
+            d->p[i] = esz_mask;
+        }
+        if (count & 63) {
+            d->p[i] = MAKE_64BIT_MASK(0, count & 63) & esz_mask;
+        }
     }
 
-    /* Set all of the requested bits.  */
-    for (i = 0; i < count / 64; ++i) {
-        d->p[i] = esz_mask;
-    }
-    if (count & 63) {
-        d->p[i] = MAKE_64BIT_MASK(0, count & 63) & esz_mask;
-    }
-
-    return predtest_ones(d, oprsz, esz_mask);
+    return pred_count_test(oprbits, count, false);
 }
 
 uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
@@ -4134,34 +4150,29 @@ uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
     intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     uint64_t esz_mask = pred_esz_masks[esz];
     ARMPredicateReg *d = vd;
-    intptr_t i, invcount, oprbits;
+    intptr_t i, invcount, oprbits = oprsz * 8;
     uint64_t bits;
 
-    if (count == 0) {
-        return do_zero(d, oprsz);
-    }
-
-    oprbits = oprsz * 8;
     tcg_debug_assert(count <= oprbits);
 
-    bits = esz_mask;
-    if (oprbits & 63) {
-        bits &= MAKE_64BIT_MASK(0, oprbits & 63);
-    }
-
-    invcount = oprbits - count;
-    for (i = (oprsz - 1) / 8; i > invcount / 64; --i) {
-        d->p[i] = bits;
+    /* Begin with a zero predicate register.  */
+    do_zero(d, oprsz);
+    if (count) {
+        /* Set all of the requested bits.  */
         bits = esz_mask;
+        if (oprbits & 63) {
+            bits &= MAKE_64BIT_MASK(0, oprbits & 63);
+        }
+
+        invcount = oprbits - count;
+        for (i = (oprsz - 1) / 8; i > invcount / 64; --i) {
+            d->p[i] = bits;
+            bits = esz_mask;
+        }
+        d->p[i] = bits & MAKE_64BIT_MASK(invcount & 63, 64);
     }
 
-    d->p[i] = bits & MAKE_64BIT_MASK(invcount & 63, 64);
-
-    while (--i >= 0) {
-        d->p[i] = 0;
-    }
-
-    return predtest_ones(d, oprsz, esz_mask);
+    return pred_count_test(oprbits, count, true);
 }
 
 /* Recursive reduction on a function;
-- 
2.43.0


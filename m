Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp471279lfg;
        Fri, 30 Apr 2021 13:33:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN4xp/w/3waufJeERohBpzDj8kKUBkueziRyvGaeaJokVHyR9F/jidBvXUdyyqX1bMzKLA
X-Received: by 2002:a92:c005:: with SMTP id q5mr5297281ild.202.1619814806917;
        Fri, 30 Apr 2021 13:33:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619814806; cv=none;
        d=google.com; s=arc-20160816;
        b=ZBkt9U54oFJpvBT3LzGyaZ0nyWTXj4pCct4/e2ohmm+rdl/5uGPUmYxzeSW9hm1Wm4
         6kugPzgltwbGTFbfGwnxcn7Z3aoAgh84kvGQ1LD23Tca59NAARImQh//2Lu840NJLYL8
         llZAV1woZKA5TGEWaIz944bgZ8X4CThoiizWzdSrnANczc6WezBeBNJxkgTnWTRHqnU8
         TQoGPQCtDMSUENSgHl1VafuHh+oaJ8GZEwe9n9Xfu8ZqKR9h77FKvCbT/ryeXwGlTh33
         L01bQ1h0ihMGEEkTtCzI1luBBAlz32srF/KUAGv6QCKHUadXcM+UUstqI4Jsy/1fVHoD
         VMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9fGS2Fo4Z7uDA+2XxvFopAIhWZ1dSlmsnRxCQI2Tn/s=;
        b=drPVZEKBqQL06vIVTwiSk6JdqBZ0nq25ugGvPgeQTCdxCJixZUoA3vefFrV3NSp6Qb
         upE00LheTEsfY5FlKS0OuN7Oqz/KFRQGKOeD0KW0DI3I0n8+yQUYxXiHbD3xL8HCvgdk
         4Sm/310cSbUAkVUOhtYpCpcKicYnWnU6rXr053sogDZ6u41r/gv0ln9uDW+mOd2L6751
         v/eWfnqoBIXHqzQ2zGYMCkwmWMApFvNGODprIKnPC6R3RHyssMwU+TC4JxTNCgRQ/MjQ
         dgDa7NYZstLjKQaK3KXdEOos5HeYEQCET/VRjmoZHwoCmp/8MSNkGh5i8twMvePGNzc6
         o6vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AkAo7J7V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si5335879iow.4.2021.04.30.13.33.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:33:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AkAo7J7V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcZpG-0006R0-3D
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiQ-0008Et-Ej
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:22 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiK-0005wC-Tf
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:22 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso2374406pjs.2
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9fGS2Fo4Z7uDA+2XxvFopAIhWZ1dSlmsnRxCQI2Tn/s=;
 b=AkAo7J7VLDa9cbE2lZulVNBdrMvYaz1gCtFQkqoYhIEryX/Pqrx9jzquXJ5e+QRp5L
 p7B/GSeBRDkiYtnLxOSkSRB7GhOGcH0kuKaqG5gL58VOExui3FE7fyG0Z3Dz2inkukGU
 sB06QJQ2UH0ccZCDHXw+GvM7+UFZDLUYdbgEbugeUR+wG+I01WNTkTP8NuQdcWLEu6A1
 x7DyxyRZ7spR4c5k2rRpte2kaCDUe0fHJybutzyTD0xHwU+yKdYo2y4rC+goaWQH/N+9
 xZq9l6bbV3dA3n0WkkEvamL2J87Rd/58G3HTBA20B+dknb25OudwQsUN/ZuEtU51cmQx
 Xaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9fGS2Fo4Z7uDA+2XxvFopAIhWZ1dSlmsnRxCQI2Tn/s=;
 b=LcTWlT0FvOuJpJabrMnmn8m4YOMsKrjACeoNtyL8ik3A8LlM7IifDmLlXK5DnRtNsc
 KZzgsz5Cp19vG74G3dzicLT9DTsFKCYies5huJE7Bl0wvmzqygpGgKu7ZfesKlW2jh7N
 ySnT70VwkmY+nsdL+amWxfUOGO2p3yK6UvZMmZTqvjIIF+qffJRqwM3qdZRIluCrSzXY
 auEkCV9sW7/PYfmQDYQ30LI68/acs7EjTKp+RubK1T2FoqOdQy01x8ogG9lmzXKlUcCf
 bVLXeaPD/OFkTxVyQDo0kzYL422l4oY58mOCoOTFcruCYsw0fV2eEVknqTgebBFgWhil
 /75w==
X-Gm-Message-State: AOAM530Xvflsmzn/jYQSqfNryTq4N82O+g2jDBkxcDHXv1IKUsuqzFtI
 IVpMnv9aA8lvV8vdgcKPQ2b0zQ==
X-Received: by 2002:a17:90b:294:: with SMTP id
 az20mr17142766pjb.229.1619814375598; 
 Fri, 30 Apr 2021 13:26:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/82] target/arm: Implement SVE2 integer halving
 add/subtract (predicated)
Date: Fri, 30 Apr 2021 13:24:55 -0700
Message-Id: <20210430202610.1136687-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +SoEs6sHA9ol

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 54 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 11 ++++++++
 target/arm/sve_helper.c    | 39 +++++++++++++++++++++++++++
 target/arm/translate-sve.c |  8 ++++++
 4 files changed, 112 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 62106c74be..5fdc0d223a 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -226,6 +226,60 @@ DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_d, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 93f2479693..58c3f7ede4 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1129,3 +1129,14 @@ SQRSHL          01000100 .. 001 010 100 ... ..... .....  @rdn_pg_rm
 UQRSHL          01000100 .. 001 011 100 ... ..... .....  @rdn_pg_rm
 SQRSHL          01000100 .. 001 110 100 ... ..... .....  @rdm_pg_rn # SQRSHLR
 UQRSHL          01000100 .. 001 111 100 ... ..... .....  @rdm_pg_rn # UQRSHLR
+
+### SVE2 integer halving add/subtract (predicated)
+
+SHADD           01000100 .. 010 000 100 ... ..... .....  @rdn_pg_rm
+UHADD           01000100 .. 010 001 100 ... ..... .....  @rdn_pg_rm
+SHSUB           01000100 .. 010 010 100 ... ..... .....  @rdn_pg_rm
+UHSUB           01000100 .. 010 011 100 ... ..... .....  @rdn_pg_rm
+SRHADD          01000100 .. 010 100 100 ... ..... .....  @rdn_pg_rm
+URHADD          01000100 .. 010 101 100 ... ..... .....  @rdn_pg_rm
+SHSUB           01000100 .. 010 110 100 ... ..... .....  @rdm_pg_rn # SHSUBR
+UHSUB           01000100 .. 010 111 100 ... ..... .....  @rdm_pg_rn # UHSUBR
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7eff204c3b..3703b96eb4 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -639,6 +639,45 @@ DO_ZPZZ(sve2_uqrshl_zpzz_h, uint16_t, H1_2, do_uqrshl_h)
 DO_ZPZZ(sve2_uqrshl_zpzz_s, uint32_t, H1_4, do_uqrshl_s)
 DO_ZPZZ_D(sve2_uqrshl_zpzz_d, uint64_t, do_uqrshl_d)
 
+#define DO_HADD_BHS(n, m)  (((int64_t)n + m) >> 1)
+#define DO_HADD_D(n, m)    ((n >> 1) + (m >> 1) + (n & m & 1))
+
+DO_ZPZZ(sve2_shadd_zpzz_b, int8_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_shadd_zpzz_h, int16_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_shadd_zpzz_s, int32_t, H1_4, DO_HADD_BHS)
+DO_ZPZZ_D(sve2_shadd_zpzz_d, int64_t, DO_HADD_D)
+
+DO_ZPZZ(sve2_uhadd_zpzz_b, uint8_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_uhadd_zpzz_h, uint16_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_uhadd_zpzz_s, uint32_t, H1_4, DO_HADD_BHS)
+DO_ZPZZ_D(sve2_uhadd_zpzz_d, uint64_t, DO_HADD_D)
+
+#define DO_RHADD_BHS(n, m)  (((int64_t)n + m + 1) >> 1)
+#define DO_RHADD_D(n, m)    ((n >> 1) + (m >> 1) + ((n | m) & 1))
+
+DO_ZPZZ(sve2_srhadd_zpzz_b, int8_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_srhadd_zpzz_h, int16_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_srhadd_zpzz_s, int32_t, H1_4, DO_RHADD_BHS)
+DO_ZPZZ_D(sve2_srhadd_zpzz_d, int64_t, DO_RHADD_D)
+
+DO_ZPZZ(sve2_urhadd_zpzz_b, uint8_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_urhadd_zpzz_h, uint16_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_urhadd_zpzz_s, uint32_t, H1_4, DO_RHADD_BHS)
+DO_ZPZZ_D(sve2_urhadd_zpzz_d, uint64_t, DO_RHADD_D)
+
+#define DO_HSUB_BHS(n, m)  (((int64_t)n - m) >> 1)
+#define DO_HSUB_D(n, m)    ((n >> 1) - (m >> 1) - (~n & m & 1))
+
+DO_ZPZZ(sve2_shsub_zpzz_b, int8_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_shsub_zpzz_h, int16_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_shsub_zpzz_s, int32_t, H1_4, DO_HSUB_BHS)
+DO_ZPZZ_D(sve2_shsub_zpzz_d, int64_t, DO_HSUB_D)
+
+DO_ZPZZ(sve2_uhsub_zpzz_b, uint8_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_uhsub_zpzz_h, uint16_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_uhsub_zpzz_s, uint32_t, H1_4, DO_HSUB_BHS)
+DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6c1561d897..43690999ab 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5949,3 +5949,11 @@ DO_SVE2_ZPZZ(SRSHL, srshl)
 DO_SVE2_ZPZZ(UQSHL, uqshl)
 DO_SVE2_ZPZZ(UQRSHL, uqrshl)
 DO_SVE2_ZPZZ(URSHL, urshl)
+
+DO_SVE2_ZPZZ(SHADD, shadd)
+DO_SVE2_ZPZZ(SRHADD, srhadd)
+DO_SVE2_ZPZZ(SHSUB, shsub)
+
+DO_SVE2_ZPZZ(UHADD, uhadd)
+DO_SVE2_ZPZZ(URHADD, urhadd)
+DO_SVE2_ZPZZ(UHSUB, uhsub)
-- 
2.25.1


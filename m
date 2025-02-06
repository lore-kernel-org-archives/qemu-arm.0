Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1784476njb;
        Thu, 6 Feb 2025 12:08:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUVwBimB2yVkIu57sR0WgnNyiA7plLbe0oZ7kJ82NXLG8lBIczlhR3V2kqZEf3VBRYZYNIrtwaJAOUVaw==@linaro.org
X-Google-Smtp-Source: AGHT+IFN24KNzpHEPtK0l8WZ6Iwt1SteEkhQbv7mqdY9sXS7kx0qawU1dOkv50Fad98Sz5F4JT8T
X-Received: by 2002:a05:622a:610a:b0:46e:267c:4f9d with SMTP id d75a77b69052e-47167acc556mr9280031cf.39.1738872522990;
        Thu, 06 Feb 2025 12:08:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872522; cv=none;
        d=google.com; s=arc-20240605;
        b=ORmEjBlIuYb+tDiCXDqOoIpWcW4cq+DPIVV6grA9eLbJQSAoGoDKztDVfmuGUTzpzB
         LElW0y3wVoPD13qLJx1xqscpP2941aNqbjqPmaMGc+ZEvj0bMK/KaCpMpsoiJmhk3LiD
         sLXaoS2Mk7S2lzJwBF82tz5YWUYx1yJd5xXrWc5mqPfwuj5LvCKOujpRhtZrSIt+24O6
         3TNImWVwFaHK6l5Yh4AxyIA1BoYz1cjTmp1SrmKdBDqi2K/uQxnB4BsqRDVaAV6/itzl
         RAxqhW8ez+rkGBg2lMVfSeFJzeQdFaMWQtXExdvpurcGqFMa2Hvx6AqAA00OeoFg3DcX
         MSzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wNFB5ts/K8reAfo0orokKIvM3jJBf7iDwufUOaWOLhs=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=YiJk92nVNKmWQ/gpg/eH4HcLMLPfosbux1nv0a7Cg5yqkqotZsK5VbwbBk0fl4ESXX
         7aNa8l72KDMw4m4WOxsp53r0msrf2zbJOND0w3Bikn+vat72pV2+cw+Q+Mv3iI8G+hzn
         4yfgjnawxXrmPmvU0V6PnuVJ/Cmt7ssSDsu1y3r+TAP84AP81vlB4TvAyOtIqCd0JYV9
         cXf7QT4JWxkYQ8rhwdfeKBTTJAeK3tTwWAFLw15ZraRlqTzYtZ1cOv9deGtWJ+x8Dilw
         Ey7sN2desyIzDO70M2b7Eg/IT2tesPA3xh9t6nDK/4iH4yjNq86DauYKAJKUZEQauac+
         j/4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Odw4cnjg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b913bfsi16559101cf.350.2025.02.06.12.08.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:08:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Odw4cnjg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tg80o-0007oq-0O; Thu, 06 Feb 2025 14:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80R-0007K0-7I
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 14:57:48 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80N-0000bE-85
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 14:57:46 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-21f3c119fe6so23481875ad.0
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2025 11:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871861; x=1739476661; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wNFB5ts/K8reAfo0orokKIvM3jJBf7iDwufUOaWOLhs=;
 b=Odw4cnjgQ8AI0ZMRrR0zEirEpPEmEQhyC00jNMpcFUjZVC5mtDjr0s9HTga2txVGuW
 zLWeSD5HnNFob+ppkvnIVF9Vwq3gXOxd144jzoMBC6Wh3LFdprLZgzHCc3iRDxcDY6i1
 v2GcZbn9GovGpT2QwTAGxm6BcGzcPcVQzGVjouUp04SXx2cBau8W3Eb/A8ZZhsBwtavj
 yG9+0ptKVhlQH52JyePMTWSrwyknfGBNFnTRDXVwSR3enbPYhFSKC7Axit0WOT7tkR7v
 LasRhF2nomP7QRBBZcB5r0yDz4n+Hq/XIpB2qIyU0ZuCrDeY4WuMNNn/A6YlRf1QkEiI
 muRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871861; x=1739476661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wNFB5ts/K8reAfo0orokKIvM3jJBf7iDwufUOaWOLhs=;
 b=qeDpB0vQ3CyEuIJ/L7qmOxWHKwGmBxnYHN1bWHMX2WAd18vI7j89HnkbcEFyAXr8bG
 yFv7F3AE3WcHyNis7GWN0YWDAjrlviP/lypuni8dnYRD0sBNF5tmjZSMb5qTNusJFgRx
 FyhZdMwQ9SVEHyBhsaHO/RlEKkY4tcDRl6xTHgsZ87jWe2fhHSrQtY2j1zAZ0ruX3iO4
 ngeokXLMRlLQgujFn96pfdyfzHzk04OfDPC3Pd08CB+jz3Vi/h3Wrwz2W7BwnHVUxtTM
 Fy5dihYpOpfxX6rzWZRmuGdg0yKzMOLqj6ZWA6iljHIAI0LNaNh3o8au+6TGz3yzd2JM
 6E8A==
X-Gm-Message-State: AOJu0YwYxlt8VqdkCHMbB6IQUKN15AaRepPQGxo3Kod84GT5XEJvsa9A
 ExY++GRUE/S5FmHIzzOwaZ76YTki6a+Un26r7RJAt+Ol850HwcQcuzHChbz0JTpGa6P5auuopFW
 B
X-Gm-Gg: ASbGncsDuEoJtAusuk2PVWkyFWM7oIKtRPlqljh2QMBpkezWkwjhUAGjaGCI3Eg9Q6Q
 RF0HHF9NhRJo0E3I+XUlVe9w6/zVrVC4Ib0NcnBUpszshH3UfRNNlhgrAt58dyXkjtZCveD78Dj
 GKQ3OVoS3vKXMUN8MpzR1rOatSidj7BTvgBp72Yx7O9vgkcgz+HLEll59wGPrNRnw5+V3sRYgZg
 vH3Cz3urgoe6jo0HTozyure75JAuAMJsCflMJkcMVH2A6sCFr5fydxvaVr9OepvOFbT2qBY2Nrb
 Q/rjBYvliBmwGRj5ieV34Rx7rbVMwiTnjllRI2Ah8qiDRn8=
X-Received: by 2002:a05:6a00:999:b0:72d:9b11:1ebb with SMTP id
 d2e1a72fcca58-7305d44ad5emr863083b3a.8.1738871861443; 
 Thu, 06 Feb 2025 11:57:41 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 33/61] target/arm: Implement SME2 BFDOT
Date: Thu,  6 Feb 2025 11:56:47 -0800
Message-ID: <20250206195715.2150758-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dU5I4tSOwPou

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 17 +++++++++++++++++
 target/arm/tcg/sme.decode      |  9 +++++++++
 2 files changed, 26 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 2885655cc5..c03daa535d 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -862,3 +862,20 @@ static bool do_fdot_nx(DisasContext *s, arg_azx_n *a)
 }
 
 TRANS_FEAT(FDOT_nx, aa64_sme2, do_fdot_nx, a)
+
+static bool do_bfdot(DisasContext *s, arg_azz_n *a, bool multi)
+{
+    return do_azz_acc_fp(s, a->n, 1, a->rv, a->off, a->zn, a->zm, 0, 0,
+                         multi, FPST_ENV, gen_helper_gvec_bfdot);
+}
+
+TRANS_FEAT(BFDOT_n1, aa64_sme2, do_bfdot, a, false)
+TRANS_FEAT(BFDOT_nn, aa64_sme2, do_bfdot, a, true)
+
+static bool do_bfdot_nx(DisasContext *s, arg_azx_n *a)
+{
+    return do_azz_acc_fp(s, a->n, 1, a->rv, a->off, a->zn, a->zm, a->idx, 0,
+                         false, FPST_ENV, gen_helper_gvec_bfdot_idx);
+}
+
+TRANS_FEAT(BFDOT_nx, aa64_sme2, do_bfdot_nx, a)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index a2b93519c4..18e625605f 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -288,6 +288,9 @@ BFMLSL_n1       11000001 001 1 .... 0 .. 010 ..... 110 ..   @azz_nx1_o2x2 n=4
 FDOT_n1         11000001 001 0 .... 0 .. 100 ..... 00 ...   @azz_nx1_o3 n=2
 FDOT_n1         11000001 001 1 .... 0 .. 100 ..... 00 ...   @azz_nx1_o3 n=4
 
+BFDOT_n1        11000001 001 0 .... 0 .. 100 ..... 10 ...   @azz_nx1_o3 n=2
+BFDOT_n1        11000001 001 1 .... 0 .. 100 ..... 10 ...   @azz_nx1_o3 n=4
+
 ### SME2 Multi-vector Multiple Array Vectors
 
 %zn_ax2         6:4 !function=times_2
@@ -328,6 +331,9 @@ BFMLSL_nn       11000001 101 ...01 0 .. 010 ...00 110 ..    @azz_4x4_o2x2
 FDOT_nn         11000001 101 ....0 0 .. 100 ....0 00 ...    @azz_2x2_o3
 FDOT_nn         11000001 101 ...01 0 .. 100 ...00 00 ...    @azz_4x4_o3
 
+BFDOT_nn        11000001 101 ....0 0 .. 100 ....0 10 ...    @azz_2x2_o3
+BFDOT_nn        11000001 101 ...01 0 .. 100 ...00 10 ...    @azz_4x4_o3
+
 ### SME2 Multi-vector Indexed
 
 &azx_n          n off rv zn zm idx
@@ -365,3 +371,6 @@ BFMLSL_nx       11000001 1001 .... 1 .. 1 .. ...00 11 ...   @azx_4x1_o2x2
 
 FDOT_nx         11000001 0101 .... 0 .. 1 .. ....0 01 ...   @azx_2x1_i2_o3
 FDOT_nx         11000001 0101 .... 1 .. 1 .. ...00 01 ...   @azx_4x1_i2_o3
+
+BFDOT_nx        11000001 0101 .... 0 .. 1 .. ....0 11 ...   @azx_2x1_i2_o3
+BFDOT_nx        11000001 0101 .... 1 .. 1 .. ...00 11 ...   @azx_4x1_i2_o3
-- 
2.43.0


Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp770694njc;
        Tue, 25 Jun 2024 13:33:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgZt162bnHkliJQb1TBYxCv+bkZ8v6upx1WNdDnunjqOETaZJjxt4WH7dZkf2luj2C+wOeniBYegewZXuIAbOXaXLKUgwB
X-Google-Smtp-Source: AGHT+IFLC/624HiKA4SMAIObrIlXqaSp+L7DhBuC1BfbSGPoXrgxPTmmhpJVZsy8v59G6oaSZrZI
X-Received: by 2002:a05:6808:17a1:b0:3d1:d0f7:3922 with SMTP id 5614622812f47-3d5459c225cmr10786813b6e.27.1719347583709;
        Tue, 25 Jun 2024 13:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719347583; cv=none;
        d=google.com; s=arc-20160816;
        b=TvzuY59D1wLJzBq5KbrBudfeRZkwYa/soVwACaUBIApbqcp+pXyeJxDWjSHnoQrSi6
         R5qMN8LJD3jtUkQ8DTyjcrrCjq5wFRF//oEXPPaJt/PTFkKD9+SLqmNuZ8GuWtwoufJT
         9nJgML5h+Zq6t9YcY8aMC39CojfLHZLxa4tFb9L1fUWHDx7hob/kPRSfA93CDIDSIs3d
         lwo/ijXBqF/ezFI2oIe25kcUgo8bbuPBcg4JVgtldXAfgseucjh1mCwLQKtJruAuaB4H
         n/Bjn8ymWBT4lFGCZ9h+dS+9L66yQxPOpSM3A4UUkSWJqDPMRUS3WzVGl7Yf8R2rCMoQ
         TCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Mj7QlXoeP2V1pOBsxsghEG+3S3aDNGmpRLT6MqBN1Ws=;
        fh=ZcJeIuJ0l6vALYCr1DZMZXnfBb1Sl86FXIV/sEmtGxc=;
        b=JDS7/NfGivHvDRDXZMqihXN+7DAqjBMNHdS2rFKKqFzcmeuOkvwL362ZzpS0UQs55F
         8gFcSXxql1+tcsisgzOlDzOhsFgqM0h6XNeY2STWaIZjODWj9JJeUw/vSGfU2EmD+ds7
         yR9G/7+lY1Df957FXIXRGvpt9c+e6xhCs1bNep5DQuXl3pF3pYvbII20HndONY22OSc7
         QZercQCV7x72ev2Se+mOVmVFSLfQ2n9a8WGP0RoZjoX2enatrPChantS2cHTd/7vegwm
         9HmNpMzrsYw+0X9npVyOn2DbCRhiZ35Xz6XMa+HN3dsVleQYczOQvAE6fjfGP0quMsR9
         bVMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zW6UbYpV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce92bf78si1138034785a.460.2024.06.25.13.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 13:33:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zW6UbYpV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMBR0-0007Bk-6Q; Tue, 25 Jun 2024 15:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMBCG-00030b-R1
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 14:47:48 -0400
Received: from [2607:f8b0:4864:20::431] (helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMBBL-0007B3-Vv
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 14:47:00 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-706683e5249so2701873b3a.2
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 11:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719341053; x=1719945853; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mj7QlXoeP2V1pOBsxsghEG+3S3aDNGmpRLT6MqBN1Ws=;
 b=zW6UbYpVQk3Zx14hbGl+IHsmkkhwJP9j5M2ioTFBLPW5KA0s9UzF9sc2Ku26qHxUJz
 sDYyL81cWFsv5mAS9ctDC4ap1R4R46IA30hGqmTLpLRP7IIpZJ4FVdfYxiWWgrjZRmaZ
 xr03Pnj0NgyqRabKoR5++r/ihV+qXSGELMnV3roximhA8woTx86wWmaXZSnWVR2d8+R+
 1aOfK7mBHjjmNHeykF0cDjDXfb2VR4y3/m7DXoIQBl4VYEz9OAmw0fhGQjVfF2VfHY2v
 2gL/LxP6wZbGiv4aUETDYsvtP4WpaL2InQmCACokOc1NM7HOhcEXomVqt7p0CDW1//Nt
 8taw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719341053; x=1719945853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mj7QlXoeP2V1pOBsxsghEG+3S3aDNGmpRLT6MqBN1Ws=;
 b=l9vyN9AR0DWS0XHY9b/dAUAKTiE2Yp5kvE1uow1i3ULMB7k8tmVePkRFO/BZbYVpRU
 5DJkhWpKh/oKXRyZo6WW5Mej2VmKpk2mYxuloB3FKMA588IQEPrSh6Gwhx4k5E0tk3Ar
 Jq3q481o0mrmUMVzgxLGz1yPT7pSOz2qgr5v7Q1N+uu+cHZfBwISDnoYAFQhEMHOUXED
 d4HjtU+H/j2vCcbN5K6wQ3fm0YKOkXa+R10S6TInxUs9DgG+K74FSvjXkBPBaylm5eJF
 B13jEGcNjXXwWur4uZijoSiIeIoHngpP7XItU96hpLSxjgHmcGwvrXgB54z3Q4x0KO3X
 Eszw==
X-Gm-Message-State: AOJu0Yy3m9PJ7ASw3q/if85mGiC+JzyMrJNR9PSiqjrwOQwmHPmdwu02
 P7HJWsMIqLM0znZmbPd4q/9VxPhAFzwMdnADQY8ZDzm9bUf2AHJAHcZEueTsULIEC5kT7wNTL1k
 8
X-Received: by 2002:a17:902:bd07:b0:1f7:23d9:f530 with SMTP id
 d9443c01a7336-1fa23f8df23mr67334385ad.66.1719340539628; 
 Tue, 25 Jun 2024 11:35:39 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c6027sm84693235ad.133.2024.06.25.11.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:35:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 02/13] target/arm: Fix SQDMULH (by element) with Q=0
Date: Tue, 25 Jun 2024 11:35:25 -0700
Message-Id: <20240625183536.1672454-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625183536.1672454-1-richard.henderson@linaro.org>
References: <20240625183536.1672454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (deferred)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-TUID: ZKDkZMOE6Jde

The inner loop, bounded by eltspersegment, must not be
larger than the outer loop, bounded by elements.

Cc: qemu-stable@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/vec_helper.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 7b34cc98af..d477479bb1 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -317,10 +317,12 @@ void HELPER(neon_sqdmulh_idx_h)(void *vd, void *vn, void *vm,
     intptr_t i, j, opr_sz = simd_oprsz(desc);
     int idx = simd_data(desc);
     int16_t *d = vd, *n = vn, *m = (int16_t *)vm + H2(idx);
+    intptr_t elements = opr_sz / 2;
+    intptr_t eltspersegment = MIN(16 / 2, elements);
 
-    for (i = 0; i < opr_sz / 2; i += 16 / 2) {
+    for (i = 0; i < elements; i += 16 / 2) {
         int16_t mm = m[i];
-        for (j = 0; j < 16 / 2; ++j) {
+        for (j = 0; j < eltspersegment; ++j) {
             d[i + j] = do_sqrdmlah_h(n[i + j], mm, 0, false, false, vq);
         }
     }
@@ -333,10 +335,12 @@ void HELPER(neon_sqrdmulh_idx_h)(void *vd, void *vn, void *vm,
     intptr_t i, j, opr_sz = simd_oprsz(desc);
     int idx = simd_data(desc);
     int16_t *d = vd, *n = vn, *m = (int16_t *)vm + H2(idx);
+    intptr_t elements = opr_sz / 2;
+    intptr_t eltspersegment = MIN(16 / 2, elements);
 
-    for (i = 0; i < opr_sz / 2; i += 16 / 2) {
+    for (i = 0; i < elements; i += 16 / 2) {
         int16_t mm = m[i];
-        for (j = 0; j < 16 / 2; ++j) {
+        for (j = 0; j < eltspersegment; ++j) {
             d[i + j] = do_sqrdmlah_h(n[i + j], mm, 0, false, true, vq);
         }
     }
@@ -512,10 +516,12 @@ void HELPER(neon_sqdmulh_idx_s)(void *vd, void *vn, void *vm,
     intptr_t i, j, opr_sz = simd_oprsz(desc);
     int idx = simd_data(desc);
     int32_t *d = vd, *n = vn, *m = (int32_t *)vm + H4(idx);
+    intptr_t elements = opr_sz / 4;
+    intptr_t eltspersegment = MIN(16 / 4, elements);
 
-    for (i = 0; i < opr_sz / 4; i += 16 / 4) {
+    for (i = 0; i < elements; i += 16 / 4) {
         int32_t mm = m[i];
-        for (j = 0; j < 16 / 4; ++j) {
+        for (j = 0; j < eltspersegment; ++j) {
             d[i + j] = do_sqrdmlah_s(n[i + j], mm, 0, false, false, vq);
         }
     }
@@ -528,10 +534,12 @@ void HELPER(neon_sqrdmulh_idx_s)(void *vd, void *vn, void *vm,
     intptr_t i, j, opr_sz = simd_oprsz(desc);
     int idx = simd_data(desc);
     int32_t *d = vd, *n = vn, *m = (int32_t *)vm + H4(idx);
+    intptr_t elements = opr_sz / 4;
+    intptr_t eltspersegment = MIN(16 / 4, elements);
 
-    for (i = 0; i < opr_sz / 4; i += 16 / 4) {
+    for (i = 0; i < elements; i += 16 / 4) {
         int32_t mm = m[i];
-        for (j = 0; j < 16 / 4; ++j) {
+        for (j = 0; j < eltspersegment; ++j) {
             d[i + j] = do_sqrdmlah_s(n[i + j], mm, 0, false, true, vq);
         }
     }
-- 
2.34.1


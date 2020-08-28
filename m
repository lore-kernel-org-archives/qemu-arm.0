Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1700713lfc;
        Fri, 28 Aug 2020 11:55:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHWnFMpYY1g/V6VFeHXr9Q9vmK1kjlWoUn8WTGJjvzXJYhXuvnMfpG7agRMdHc4zu0lZv+
X-Received: by 2002:a25:db81:: with SMTP id g123mr3962636ybf.145.1598640901609;
        Fri, 28 Aug 2020 11:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598640901; cv=none;
        d=google.com; s=arc-20160816;
        b=y0qjvfemH6pGCjSI2TTku6BU+Y0vNrtooaxjoek9sBeZ7LRzq4U5lAkQ1ROtOnjIBN
         iArz33tqy5uaLtIFY+EI4HCiRUYQHRWtnVyWtqoHVvMcgS2E7eEa40+DHfzIO4Le0e5d
         0JZfyCHIan5kZk/yb06ev2dxCaFJOoQ1X82DOP1V8Q/6sto7NF3NWX+g4C5+BJIifX2Y
         Kli4BXRZhTieZZvDtlHX4bZMi58jo37M1zWSDQIt7lepwqeJc/L2CE0CrkTLkOUSahCM
         SL/V60ww1U8SfPDONZeMNFmaTyqIf3cIYg11ebM3X02WWRWSNOfTDpRW1dZDgaQX2xM5
         nyUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=utIVepL1HuQRNNAxKKmGmf0ciz/CjvNHj8UaXUfKars=;
        b=uEl+qxoZVPzR1g6xFYjfnpe8P9KjXTQH9hZwufumACMljA5ZfWZYQsPn+JnL5tpzCL
         eK6wI9SWXoJVC3pAGVrugxRd/DJK3JupPMOdbsUU91ViR1BQ+egRUyO/iAY6MpF+s+PP
         fwUq+yUiE4CVNj94dDDV7Ej6pL4oQfmGyNrmkqE7gDly/62ucE1ZTIcFRXlPWeHrZaR4
         rEgsY592KwyH2G/tetDkSoYSL1TWHsosnT/TQXoE3/bGkxUIw58Lj2G4vZHa51r/kGNX
         V6DNzRrwpl1kheJ1f58X8yxKKppFQrjs29YYwr+Y5Wjnc18ekccf/ABu2F+ogOHiGUX+
         NwPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NyUWJHEa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 187si124501ybb.268.2020.08.28.11.55.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:55:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NyUWJHEa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjWe-0001W2-TV
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjDB-0003V9-RR
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:53 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjD7-00066y-MC
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:53 -0400
Received: by mail-wm1-x341.google.com with SMTP id k20so106652wmi.5
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=utIVepL1HuQRNNAxKKmGmf0ciz/CjvNHj8UaXUfKars=;
 b=NyUWJHEa4W5epyfV6iOgNg8+OYGCKNyqtxTfMrEkRFcjYBWEGMNwNo6W3CLCfrjINO
 9f+R8YbQXMwszKjXisTSd4wmwolUgI6sSrze7M5aeNpJ3Hg5ETLj/fQaalZzDBbkJyEg
 iHKOxqcG3NUyXSWNFJnCJLIpMNxfc8VUKlOkr6DIm5wbIcz0HLhb/J97iNSDrMk/pdfY
 gqG0XGjYmzIfV5QzVi+ZRhSvQ900AuiWkXn3C9GimQmGsJoXfPUnYBdH8Fd1VqaDEANs
 Y7vUJMXH8SFHV9/4noYF1dGGbkOKM+uB6aRcZHnDLwKSaN45WnCg7K2uTeQAPTZcUhwd
 V1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=utIVepL1HuQRNNAxKKmGmf0ciz/CjvNHj8UaXUfKars=;
 b=C1rfTP8/A6jLT+I/Cz9K8ccm7wkLPfFhl6r1Nbkk52LSLHoENWRI8IRnl7wmEhwDDN
 +eqyhIkHuI3PyzI2CE7mwC5ki/UXWFJoNkYmpTdIMJi+OLFXe8eyr5Fw+aIfU+PIS1iG
 ULcgiMtKtyiVl4VRrDsUidaK9AKxCvFirFxcpvVJDKodmuTtJloFIQeXseUXxGHMQCxk
 vf7J/KaPQP6px8o8H1hvY2g+5zBARss07vDE7RCVyCkIzCfS2ZE8gHB4gyHkq5BYMAu2
 aMiBzJphf3PCFxw3EJnDbDDz0wANgUXIwW7uteQnRGTngaAjIOLs14CmixN4C0HYEYLp
 ngzg==
X-Gm-Message-State: AOAM532M25F/8HriaxfwlieeeiOMN/CVN95T7sBMrr4I317JL2xFHKd8
 /BcjwsqRBF1pUXAphB22QJ1yFi5G0KldK2gC
X-Received: by 2002:a7b:cc0b:: with SMTP id f11mr26911wmh.31.1598639687005;
 Fri, 28 Aug 2020 11:34:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 42/45] target/arm/vec_helper: Handle oprsz less than 16
 bytes in indexed operations
Date: Fri, 28 Aug 2020 19:33:51 +0100
Message-Id: <20200828183354.27913-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gggZLJxmAi16

In the gvec helper functions for indexed operations, for AArch32
Neon the oprsz (total size of the vector) can be less than 16 bytes
if the operation is on a D reg. Since the inner loop in these
helpers always goes from 0 to segment, we must clamp it based
on oprsz to avoid processing a full 16 byte segment when asked to
handle an 8 byte wide vector.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vec_helper.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 20f153b47a1..b27b90e1dd8 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -1040,7 +1040,8 @@ DO_MULADD(gvec_vfms_s, float32_mulsub_f, float32)
 #define DO_MUL_IDX(NAME, TYPE, H) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                                          \
-    intptr_t i, j, oprsz = simd_oprsz(desc), segment = 16 / sizeof(TYPE);  \
+    intptr_t i, j, oprsz = simd_oprsz(desc);                               \
+    intptr_t segment = MIN(16, oprsz) / sizeof(TYPE);                      \
     intptr_t idx = simd_data(desc);                                        \
     TYPE *d = vd, *n = vn, *m = vm;                                        \
     for (i = 0; i < oprsz / sizeof(TYPE); i += segment) {                  \
@@ -1061,7 +1062,8 @@ DO_MUL_IDX(gvec_mul_idx_d, uint64_t, )
 #define DO_MLA_IDX(NAME, TYPE, OP, H) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)   \
 {                                                                          \
-    intptr_t i, j, oprsz = simd_oprsz(desc), segment = 16 / sizeof(TYPE);  \
+    intptr_t i, j, oprsz = simd_oprsz(desc);                               \
+    intptr_t segment = MIN(16, oprsz) / sizeof(TYPE);                      \
     intptr_t idx = simd_data(desc);                                        \
     TYPE *d = vd, *n = vn, *m = vm, *a = va;                               \
     for (i = 0; i < oprsz / sizeof(TYPE); i += segment) {                  \
@@ -1086,7 +1088,8 @@ DO_MLA_IDX(gvec_mls_idx_d, uint64_t, -,   )
 #define DO_FMUL_IDX(NAME, TYPE, H) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, void *stat, uint32_t desc) \
 {                                                                          \
-    intptr_t i, j, oprsz = simd_oprsz(desc), segment = 16 / sizeof(TYPE);  \
+    intptr_t i, j, oprsz = simd_oprsz(desc);                               \
+    intptr_t segment = MIN(16, oprsz) / sizeof(TYPE);                      \
     intptr_t idx = simd_data(desc);                                        \
     TYPE *d = vd, *n = vn, *m = vm;                                        \
     for (i = 0; i < oprsz / sizeof(TYPE); i += segment) {                  \
@@ -1108,7 +1111,8 @@ DO_FMUL_IDX(gvec_fmul_idx_d, float64, )
 void HELPER(NAME)(void *vd, void *vn, void *vm, void *va,                  \
                   void *stat, uint32_t desc)                               \
 {                                                                          \
-    intptr_t i, j, oprsz = simd_oprsz(desc), segment = 16 / sizeof(TYPE);  \
+    intptr_t i, j, oprsz = simd_oprsz(desc);                               \
+    intptr_t segment = MIN(16, oprsz) / sizeof(TYPE);                      \
     TYPE op1_neg = extract32(desc, SIMD_DATA_SHIFT, 1);                    \
     intptr_t idx = desc >> (SIMD_DATA_SHIFT + 1);                          \
     TYPE *d = vd, *n = vn, *m = vm, *a = va;                               \
-- 
2.20.1


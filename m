Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp468745ocs;
        Sat, 1 Oct 2022 09:49:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4KrnhDRQ011tgxFhm+8xhVZU7w8xHSdchQ1NSDaZmyRwYIe+Ky8Toga1lU+jDbSq9RUNH6
X-Received: by 2002:ac8:5c8a:0:b0:35c:c485:d16c with SMTP id r10-20020ac85c8a000000b0035cc485d16cmr11174967qta.352.1664642976403;
        Sat, 01 Oct 2022 09:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664642976; cv=none;
        d=google.com; s=arc-20160816;
        b=Cr9JK5A6YTx+3X9QLc5cBsrySHxNER/3pojBpNcCVvAXHf/PG8mbW4EoNCpE0tQDn1
         xUYJfzvKjfaUzFxSMVa1Pn7uG8dZPZ5Qw4F/yYw9KJj01YrKkHAizkk3g9RoqI6fvZ/W
         F7gFT5HjDMUH+98PyvDA/a1byUcd1eRcjobicqkZCQ8S8Pfgs3vO5G2Ppz7/4HjuR8Gq
         DcH3Og443Grfui4pZUmg5PzX5sO5W1vufJOr31Ga3GqFNIbMp9pKHIhDKfCPEFbtt1Dq
         YpJCa0xpMIjLSp6/BN9TPYJLqPKIVqxHSXIz8NSVGNQ88A+KWEv3qMDnTwGYpY5C4F4n
         RXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=D/bcq+Rmc5kTJJoslvPDGiIa/oqbD812IdeJZK1JGaY=;
        b=dmcudGr5nfETKe9CJa/UI/LZuk8Vlrgndxfw52U98iFIGi31/B9rQ4y9wf5jXpA2Mv
         nEmwMu1zShYQ5LWVa+AkSPvgEYa/pThwhuNlvXc8BGN0uh4POY+Hsx7MEly0cSlLldQN
         0K7o4pS1sm8bXuXk34oj1APQHDPDA+HH8bCTh5LQndRPOTfscZP1UTyJG5potKg0u6L6
         LAUvXmfZFCkprKddadp2dd4NxFZgCY86WS3SWjVYh4w2/aQ4E7pNJWLQUILP4tiBc4jK
         EyOwSFT+1j0l19N4ZB+YpNBjkYLTVzflnNlUZau8xz+4r5KGDISRwXl0fv9WsTGl/aOd
         whUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxCcT0K6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d81-20020a376854000000b006bc20560015si2376676qkc.333.2022.10.01.09.49.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:49:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxCcT0K6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefgF-0001rG-Vt
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIR-0000qS-KY
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:59 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:46857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIP-0006PQ-Md
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:59 -0400
Received: by mail-qk1-x736.google.com with SMTP id d17so4524905qko.13
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=D/bcq+Rmc5kTJJoslvPDGiIa/oqbD812IdeJZK1JGaY=;
 b=hxCcT0K6+ZzCqFH5oQoUbsABqZ8bSoWdTWeORD+slU7Jvei/qRyHxbMK92KRrW2lVE
 EDjQP4ApwtkYIQcYY3+INFU93R1uhGEQTNL7WB1BIO8MrIufksZm/ReFFPHsw5XczItu
 Y2DFSNYVf3cL9REV/Ollr87AadMJ5DUkyzucuT+6H0CyAC6jZB7Hj0CsTptKSO5YCkVn
 UyPLcJjEv88/JdCP/7vXSsvtx0MeTdfuqqbrvm782K6K22F3jVpNBOQh/C/E3jNud55H
 cqnqU5tuNfKSLVtuz+Hzwnfca8u2I7hqxm7zv0cBc9vzTi30irzJVfoZk1qWscxGm+q/
 rULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=D/bcq+Rmc5kTJJoslvPDGiIa/oqbD812IdeJZK1JGaY=;
 b=jDPuvCjWSUJdedVsUPuTussd4UBoSu0UpEyAFlhFpgsI0Autmej9Ha0AxIqhc2CA7I
 hBLtMoFB8dvQIxG++hSJLXp3a8+CZ2LP4Wzl7/NfOOySxgzvdxBGr0ViH3TKkYQA3ArC
 +iIH3bmrkqXdNcqXtGmyD4b4Bke7i6X5r6pAvWMWNJq/RJG1z/4kNgNFRYZrYAdCWrgE
 cWvGr+ujgbeIkTfZqkbprKpZ/xgKySkNg+U1ODtRTy6jrLSWd18RBGVuqGKLT+heWs8A
 B8KxFCllztGK0p43taNklclp+Ot3aWtAom7awql75QIYvSqmrwlabR9ONTluD4WvQLYu
 UjMQ==
X-Gm-Message-State: ACrzQf2cWVizcDBiVp/7d6cNL7KEX4LxM/q1IHq0dqWL06jmRZ/nn9TP
 bOcX1KiIVhbcir3MGG0SnxahtdIi7laNIQ==
X-Received: by 2002:a37:a83:0:b0:6cf:8255:8676 with SMTP id
 125-20020a370a83000000b006cf82558676mr9568666qkk.628.1664641496986; 
 Sat, 01 Oct 2022 09:24:56 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 39/42] target/arm: Don't shift attrs in get_phys_addr_lpae
Date: Sat,  1 Oct 2022 09:23:15 -0700
Message-Id: <20221001162318.153420-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7KIPIEwPOJvE

Leave the upper and lower attributes in the place they originate
from in the descriptor.  Shifting them around is confusing, since
one cannot read the bit numbers out of the manual.  Also, new
attributes have been added which would alter the shifts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 01a27b30fb..c68fd73617 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1071,7 +1071,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     hwaddr descaddr, indexmask, indexmask_grainsize;
     uint32_t tableattrs;
     target_ulong page_size;
-    uint32_t attrs;
+    uint64_t attrs;
     int32_t stride;
     int addrsize, inputsize, outputsize;
     uint64_t tcr = regime_tcr(env, mmu_idx);
@@ -1341,49 +1341,48 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     descaddr &= ~(page_size - 1);
     descaddr |= (address & (page_size - 1));
     /* Extract attributes from the descriptor */
-    attrs = extract64(descriptor, 2, 10)
-        | (extract64(descriptor, 52, 12) << 10);
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         /* Stage 2 table descriptors do not include any attribute fields */
         goto skip_attrs;
     }
     /* Merge in attributes from table descriptors */
-    attrs |= nstable << 3; /* NS */
+    attrs |= nstable << 5; /* NS */
     guarded = extract64(descriptor, 50, 1);  /* GP */
     if (param.hpd) {
         /* HPD disables all the table attributes except NSTable.  */
         goto skip_attrs;
     }
-    attrs |= extract32(tableattrs, 0, 2) << 11;     /* XN, PXN */
+    attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
     /*
      * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
      * means "force PL1 access only", which means forcing AP[1] to 0.
      */
-    attrs &= ~(extract32(tableattrs, 2, 1) << 4);   /* !APT[0] => AP[1] */
-    attrs |= extract32(tableattrs, 3, 1) << 5;      /* APT[1] => AP[2] */
+    attrs &= ~(extract64(tableattrs, 2, 1) << 6);   /* !APT[0] => AP[1] */
+    attrs |= extract32(tableattrs, 3, 1) << 7;      /* APT[1] => AP[2] */
  skip_attrs:
 
     /*
      * Here descaddr is the final physical address, and attributes
      * are all in attrs.
      */
-    if ((attrs & (1 << 8)) == 0) {
+    if ((attrs & (1 << 10)) == 0) {
         /* Access flag */
         fi->type = ARMFault_AccessFlag;
         goto do_fault;
     }
 
-    ap = extract32(attrs, 4, 2);
+    ap = extract32(attrs, 6, 2);
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         ns = mmu_idx == ARMMMUIdx_Stage2;
-        xn = extract32(attrs, 11, 2);
+        xn = extract64(attrs, 54, 2);
         result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
-        ns = extract32(attrs, 3, 1);
-        xn = extract32(attrs, 12, 1);
-        pxn = extract32(attrs, 11, 1);
+        ns = extract32(attrs, 5, 1);
+        xn = extract64(attrs, 54, 1);
+        pxn = extract64(attrs, 53, 1);
         result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
@@ -1408,10 +1407,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         result->cacheattrs.is_s2_format = true;
-        result->cacheattrs.attrs = extract32(attrs, 0, 4);
+        result->cacheattrs.attrs = extract32(attrs, 2, 4);
     } else {
         /* Index into MAIR registers for cache attributes */
-        uint8_t attrindx = extract32(attrs, 0, 3);
+        uint8_t attrindx = extract32(attrs, 2, 3);
         uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
         assert(attrindx <= 7);
         result->cacheattrs.is_s2_format = false;
@@ -1426,7 +1425,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     if (param.ds) {
         result->cacheattrs.shareability = param.sh;
     } else {
-        result->cacheattrs.shareability = extract32(attrs, 6, 2);
+        result->cacheattrs.shareability = extract32(attrs, 8, 2);
     }
 
     result->f.phys_addr = descaddr;
-- 
2.34.1


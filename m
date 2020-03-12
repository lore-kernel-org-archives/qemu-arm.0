Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1088124lfc;
        Thu, 12 Mar 2020 12:43:10 -0700 (PDT)
X-Received: by 2002:a62:3854:: with SMTP id f81mr9761249pfa.81.1584042190101;
        Thu, 12 Mar 2020 12:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042190; cv=none;
        d=google.com; s=arc-20160816;
        b=l6amMnVX4U6Hn78ZrYNamOIjY/Gma3e1gwmKyNq3Z+iHViLi+d4ezAEjQjQlEbvuks
         RF6/ZqcvuZRXqbQBnaQDAHqy2ga1Bf0PV2u+x2FPnpxJP69VBT51Y77T8BqlsyDGvk+K
         RC3KqMCo9ipKbMeT6va1oD75PTFCgbYWHB8z4typyjwMULDNwzZXLKO53VQFb6TQj0Po
         eXZHNy2hs4HaGp0QOCrhwUZW1Wk05SXS+dJOM/qQCQ8akYu7SquIIlI3KLZS7QHYsc7l
         dLBZjqlLTTLMiaJPNlwEcCfsMHO3SAlE4HkGG9Gj1JKHBp0/2Qvw+waWj+2q4qEB6Ie0
         m9aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Gnv7Nm+EiE7Yup2Obmp1aYhEBmLkRamccQdcwDUw4Ic=;
        b=vqGHZxS877z+gk7CQfZGJ3rrq9AZSQwGsrGSFoAxNWibEj6gnW0Q6cgYAw+CuRd8/D
         TZEuZ8NXhMI3+O3OGQaTPvB0NPAirej+h1WyP/iAaNM8AlQqmzpdxmPIMQOKJFtk2Lvx
         XgWbz69s5pnnsZsTOi1pR831QIXmX+fiiU8g7jGp/K3qEsfUnMfgYFwubRIdxLyINTlC
         JDxfXoQGE0v2S++HVvxvffrANkKAodDftDs1nk6AY9Ag7azbySNnjkma2JXM7CcGSLwO
         vU2NdgaiWEERw9uBPYaEigxe0ce/DFN3BV3EqE2qD7na2xqGcT22yFe4UbnjMaqSdEVc
         XzDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OUjas1Lp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 61sor7726625plb.63.2020.03.12.12.43.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:43:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OUjas1Lp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gnv7Nm+EiE7Yup2Obmp1aYhEBmLkRamccQdcwDUw4Ic=;
        b=OUjas1Lpm5ElFi3Oe3+IXmX7PzF7P/I8eW0eXP2SdL3grVqNSRT1yDGJWGRHTT7b0W
         1uqI2v+Bbxec0Uww9RPPi3XdM6TxvOwXctChC3fsJFIYUbPcccgUrq7YduSzJTOJfgdq
         N4DLwi4zRobc3pdZiJma0l8c2TayxOtZ83BjfUNvaxvkiOgBLjM+uvZpAirKKhIcW2vr
         C6u1OdaaEtz7J1+N+EbwMVydYXftFK0W5fYpT/0Wp8CaP4fnEJkgROhT8zLw6JpQZJ+j
         fpS0uMxAOY71cUNC0x1Js3DsR18UMImVEXfCxwCT+9IKpNbGVWPfEcU6Tr9PdLXeN24n
         UK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gnv7Nm+EiE7Yup2Obmp1aYhEBmLkRamccQdcwDUw4Ic=;
        b=rr10yOpIvznhCos9KGiB/XssJte4687jbxfzYJcv9geLlKQ43xMnXMtYNFzUiZrcXO
         RvdfoJduJbFdqLzp7SVZwL+J4MkZY5L+AjFU07N9aIL7W3GHlOqqrLP+6hAIm+pS+My4
         glYsyZLmGYQpoG2eXL2kCeZjcLHJCCqzp0cjbvzoh3mIBVMaTuiTTzEeUYoy3/wvqaKw
         BT5P28/XQQgzv1Ty5F6c/K/RwmCRT8fbeJyIhhtdjgjZtp2N/J6VoIe4IAAurXNqUNdG
         5xokKpPOialpwz++5KLmqMbIDhcdavTUjMBey8K3jMR53uOzq9k1031gbQigqFQB2KCk
         TltQ==
X-Gm-Message-State: ANhLgQ2Y/Qvmfv0r2ix4+3cneu31i4jGciv0gqiB+MySUpQ+AfFPsWBe
	CrlVvHJLDnvvm6g+i2YnXEjdu0Yf
X-Google-Smtp-Source: ADFU+vvVDQfCs9u6FyL5ll4yBCPcrmV9TDU47yKjZBlap8zIwHf04e13ln6nakD5lDcXT2VsSSpr4A==
X-Received: by 2002:a17:902:728d:: with SMTP id d13mr9450869pll.92.1584042189569;
        Thu, 12 Mar 2020 12:43:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:43:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 36/42] target/arm: Complete TBI clearing for user-only for SVE
Date: Thu, 12 Mar 2020 12:42:13 -0700
Message-Id: <20200312194219.24406-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xOQmw6CSC1Iz

There are a number of paths by which the TBI is still intact
for user-only in the SVE helpers.

Because we currently always set TBI for user-only, we do not
need to pass down the actual TBI setting from above, and we
can remove the top byte in the inner-most primitives, so that
none are forgotten.  Moreover, this keeps the "dirty" pointer
around at the higher levels, where we need it for any MTE checking.

Since the normal case, especially for user-only, goes through
RAM, this clearing merely adds two insns per page lookup, which
will be completely in the noise.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 566a619300..f0afbd0faf 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3985,7 +3985,7 @@ typedef void sve_ldst1_tlb_fn(CPUARMState *env, void *vd, intptr_t reg_off,
  *
  * For *_tlb, this uses the cpu_*_data_ra helpers.  There are not
  * endian-specific versions of these, so we must handle endianness
- * locally.
+ * locally.  See sve_probe_page about TBI.
  *
  * For *_host, this is a trivial application of the <qemu/bswap.h>
  * endian-specific access followed by a store into the vector register.
@@ -4009,7 +4009,7 @@ static void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host)  \
 static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
                              target_ulong addr, uintptr_t ra)               \
 {                                                                           \
-    TYPEM val = BSWAP(TLB(env, addr, ra));                                  \
+    TYPEM val = BSWAP(TLB(env, useronly_clean_ptr(addr), ra));              \
     *(TYPEE *)(vd + H(reg_off)) = val;                                      \
 }
 
@@ -4018,7 +4018,7 @@ static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
                              target_ulong addr, uintptr_t ra)               \
 {                                                                           \
     TYPEM val = *(TYPEE *)(vd + H(reg_off));                                \
-    TLB(env, addr, BSWAP(val), ra);                                         \
+    TLB(env, useronly_clean_ptr(addr), BSWAP(val), ra);                     \
 }
 
 #define DO_LD_PRIM_1(NAME, H, TE, TM)                   \
@@ -4152,6 +4152,19 @@ static bool sve_probe_page(SVEHostPage *info, bool nofault,
     int flags;
 
     addr += mem_off;
+
+    /*
+     * User-only currently always issues with TBI.  See the comment
+     * above useronly_clean_ptr.  Usually we clean this top byte away
+     * during translation, but we can't do that for e.g. vector + imm
+     * addressing modes.
+     *
+     * We currently always enable TBI for user-only, and do not provide
+     * a way to turn it off.  So clean the pointer unconditionally here,
+     * rather than look it up here, or pass it down from above.
+     */
+    addr = useronly_clean_ptr(addr);
+
     flags = probe_access_flags(env, addr, access_type, mmu_idx, nofault,
                                &info->host, retaddr);
     info->flags = flags;
-- 
2.20.1

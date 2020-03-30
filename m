Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3193221lfi;
        Mon, 30 Mar 2020 14:04:37 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu07yCFcNMPjcblgzps2HirSDfyLgnTu5FhJDIOhSzPm2CnLUR82eRSCJdRloWV4VBFxiFv
X-Received: by 2002:ac8:1941:: with SMTP id g1mr2034069qtk.70.1585602277154;
        Mon, 30 Mar 2020 14:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585602277; cv=none;
        d=google.com; s=arc-20160816;
        b=YrfYj9qdFVS/JyMBMDkJZvVHJIok4sKCp+laxNUMO4qL9xaJc16HkLitLnCLtkCRn8
         oTozDyKduufY9ICmBfozcUCtk1MRTPUSQPJ565QantgGhp+JeUMWEkgVbox4n8RsJ11w
         ZkottZKVH3dpRCYdb7646z9F9zILZJVmO1Bno+hyh4QQq9JIGs1CitBg3z8dxWcSNRoa
         S3P/xTPcHB2Mk7mucXPW2ZQvGbxWxbR1TjvnZfjVx26u8/iVlHQItm//a5GKU6y42Fkw
         eGMM1mFHiNRkqBhZijFbqdH4xLNF9rQVJ7i2hRjyB1HKM3EkHOwFH59pnDYmjM4F91Gr
         Pp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ace17zOZApynr6koxMRZ66roRKXXaZNKYw00Y2JeNxs=;
        b=s+z3aO101VPNdRiA18uYSLx0btbPMrK0ybPHAfTxcUYB4Rri/dNbu/awuDCa3BlqiA
         X47Y94mpdX0CXG2cnxXDTEdjgmpiDtGsraJGMdgelSL3G4tlh596dNfvA9Gw1feYh49S
         98OaX1phd6LgnNKiL90oWdX7wCC7QdtJZSGQEIBiQL+4IcLo4CYUUjVdQmtdZldXY50h
         GezMgGJ1vIRUw26WrLltzLcPUKh5Sw3OIxMUUTKHsrU1H2WfD3VT6a8XXZw2EXDlzSbK
         mgKsZ/N4D05XoylTbtBouuPDeuDR1JiaRY1eLRuCiYI15omqJxguXH8dgRbGqsC5DV4/
         g3ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y0tqWz0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si8076213qte.315.2020.03.30.14.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 14:04:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y0tqWz0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJ1aG-00070X-HP
	for alex.bennee@linaro.org; Mon, 30 Mar 2020 17:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40555)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jJ1Zo-0006Y5-E0
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 17:04:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jJ1Zm-0002gZ-W9
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 17:04:08 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:56069)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jJ1Zm-0002fm-Q4
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 17:04:06 -0400
Received: by mail-wm1-x343.google.com with SMTP id r16so326321wmg.5
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2020 14:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ace17zOZApynr6koxMRZ66roRKXXaZNKYw00Y2JeNxs=;
 b=y0tqWz0dKsYhvpxQP/MCKg5anmIE647vIIhg7IsytaQz4hJt+Yqypf4cRulW1B2ZOU
 5m2R5SbPFvlQzG2hZnDQV5neQYLCkTHrE8wWMG9i7Nn0B9JYGYYDLJUJEjdA5xCIRR0E
 lCWlhDmzkkloHACtx9ns/YVktrpcYMWJarhn+gzl/bpMV2Unyre9/8rugENAUh1FwcoJ
 bnkR6Ke8+rHB3AHtGzOsy1tojsjnQcxo0WgJ7kpBgxQxJpVufBT34XLKL1+bdXSWa0LK
 UDEg7Np2PmB8tZyTpIpzhYr/V7Vu2MYL0KVCoFoVKnFi1xbcBh6KpJl1OFSg0+Lg/DUM
 g8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ace17zOZApynr6koxMRZ66roRKXXaZNKYw00Y2JeNxs=;
 b=dEBKpRIP5UqhiJI8G/iJ80izEAb9w6FOwffl1qw1ZbDuXFFL9PT8PteRghOn9S3kR7
 Tk39Mgt6YpCTqmMDeoV3nsf7t0hP2goJd3d0H+gTHJN147B1hs5JuoLImZtKlW6wZA3d
 VZhVErAH0i5T8hLgkihdMzTqEUueoWuH9o3cL0e6JKMcZrBltZd0grc4ZiLH9d/4SEuq
 E318sApkLbsF4bbaSltS6P1tDGLJf5LS+D14mD0kWAIjFj50FBc4Mbh1lFkMGEoXSblX
 EJbstvlnG7EQicWmGHZUt0RRst+fimjeKC4k4UYe7Sbpotfq+bEFn/XaTTgoAHyCdQGq
 e/Hw==
X-Gm-Message-State: ANhLgQ0FzwAToMF9aqZk59hTHMHyJWbENlhLIQMoqM0ixlJW0VeN94Vd
 yj9IQ40fRbLDPCeu8pZ+EQTqBGDlfmpGcg==
X-Received: by 2002:a1c:6505:: with SMTP id z5mr1227546wmb.137.1585602245494; 
 Mon, 30 Mar 2020 14:04:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p21sm1012700wma.0.2020.03.30.14.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 14:04:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/arm: Add new 's1_is_el0' argument to
 get_phys_addr_lpae()
Date: Mon, 30 Mar 2020 22:03:59 +0100
Message-Id: <20200330210400.11724-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200330210400.11724-1-peter.maydell@linaro.org>
References: <20200330210400.11724-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H1uXgy9mKI6A

For ARMv8.2-TTS2UXN, the stage 2 page table walk wants to know
whether the stage 1 access is for EL0 or not, because whether
exec permission is given can depend on whether this is an EL0
or EL1 access. Add a new argument to get_phys_addr_lpae() so
the call sites can pass this information in.

Since get_phys_addr_lpae() doesn't already have a doc comment,
add one so we have a place to put the documentation of the
semantics of the new s1_is_el0 argument.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 25439bf6fd9..47a175b8e9d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -41,6 +41,7 @@
 
 static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool s1_is_el0,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr,
                                ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs);
@@ -10036,6 +10037,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         }
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, ARMMMUIdx_Stage2,
+                                 false,
                                  &s2pa, &txattrs, &s2prot, &s2size, fi,
                                  pcacheattrs);
         if (ret) {
@@ -10638,8 +10640,32 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
     };
 }
 
+/**
+ * get_phys_addr_lpae: perform one stage of page table walk, LPAE format
+ *
+ * Returns false if the translation was successful. Otherwise, phys_ptr, attrs,
+ * prot and page_size may not be filled in, and the populated fsr value provides
+ * information on why the translation aborted, in the format of a long-format
+ * DFSR/IFSR fault register, with the following caveats:
+ *  * the WnR bit is never set (the caller must do this).
+ *
+ * @env: CPUARMState
+ * @address: virtual address to get physical address for
+ * @access_type: MMU_DATA_LOAD, MMU_DATA_STORE or MMU_INST_FETCH
+ * @mmu_idx: MMU index indicating required translation regime
+ * @s1_is_el0: if @mmu_idx is ARMMMUIdx_Stage2 (so this is a stage 2 page table
+ *             walk), must be true if this is stage 2 of a stage 1+2 walk for an
+ *             EL0 access). If @mmu_idx is anything else, @s1_is_el0 is ignored.
+ * @phys_ptr: set to the physical address corresponding to the virtual address
+ * @attrs: set to the memory transaction attributes to use
+ * @prot: set to the permissions for the page containing phys_ptr
+ * @page_size_ptr: set to the size of the page containing phys_ptr
+ * @fi: set to fault info if the translation fails
+ * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
+ */
 static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool s1_is_el0,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr,
                                ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
@@ -11736,6 +11762,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
             /* S1 is done. Now do S2 translation.  */
             ret = get_phys_addr_lpae(env, ipa, access_type, ARMMMUIdx_Stage2,
+                                     mmu_idx == ARMMMUIdx_E10_0,
                                      phys_ptr, attrs, &s2_prot,
                                      page_size, fi,
                                      cacheattrs != NULL ? &cacheattrs2 : NULL);
@@ -11860,7 +11887,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     }
 
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, address, access_type, mmu_idx,
+        return get_phys_addr_lpae(env, address, access_type, mmu_idx, false,
                                   phys_ptr, attrs, prot, page_size,
                                   fi, cacheattrs);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
-- 
2.20.1


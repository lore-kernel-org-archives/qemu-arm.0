Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1086002ejc;
        Thu, 23 Feb 2023 12:44:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9JKMgAklBHllGSPWsvOo51YMHuLjVWJxhWrFlbLtvTlKSje4q2F0fygqAcLYN+KzhZKtZv
X-Received: by 2002:a05:6214:2a86:b0:56f:5466:20d8 with SMTP id jr6-20020a0562142a8600b0056f546620d8mr22472169qvb.3.1677185063350;
        Thu, 23 Feb 2023 12:44:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677185063; cv=none;
        d=google.com; s=arc-20160816;
        b=yQUnaF0KEp6nFcWvQj7Zb2LrXs3cxaFerLhg3u00Ci2oonZeLcU9Q6pyx2fDvApN53
         RtdBLrFBW+oRsaITNW3QiHP/iiaiUo5VNHSV50CMB9OtPOCHXiey3wX3imli53r+JmgZ
         9eiI96hB2vB5s8+fv3mrayzEMdt6v7NsWhyplsme3mS4zOwqCpIcJwzRX4g7V5zdHCBt
         VNBq64FSI+q2pWW3PwnQl2QsS1rR9sIep/gkjNDywlSHXrPJWILVpofzlfLEN7M/2zWw
         wLgtlWdS00LqHNCv2VyO7EX3fRRryy5k7CMLVO+eAJ9jXSlz+3k/ozDvPo5qEc4qo8xa
         oNgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1DYpXgLa7aKwNkf25RMtvRP9iUFACK26xYqqO1SJ46k=;
        b=Z5Yz8a9mozh7wAgh0VbTTctx8Q1ZBIvPZhaKZ7G1dm5ddvjmzhKp9l880WrmmYAnR/
         NZ1stSqTdyRc9uS8bF2naUNj1RFrimxWpk1WGOMlMikmpL1ex+2e+ITliglly9VDzAv3
         aKlFJbNJDzKtNOzWuBZheSWMmnwjg6Djc8CnlezrCky0TDvRvgvnFnsmFAvgSyzEl46k
         f3qj9J/zR/vGxnvgm/hNCMNvN4M6P2mQ4AFWR2Hx4Vwl7Z9HloHn8d4LSzNpYgu5aFp4
         JDTQanTeOWM/MawrgJHKr9eozACRhe1JXXc4lMSHntXrFG4VggZgjtAOlEheo3X8mfxc
         R1vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J9edVt+D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11-20020a0ccb8b000000b00570bc9840ddsi12022130qvk.237.2023.02.23.12.44.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 12:44:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J9edVt+D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVIRo-00031d-TL; Thu, 23 Feb 2023 15:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRn-0002yt-83
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 15:44:11 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRl-0007Us-L0
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 15:44:10 -0500
Received: by mail-pl1-x643.google.com with SMTP id e5so15563978plg.8
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 12:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DYpXgLa7aKwNkf25RMtvRP9iUFACK26xYqqO1SJ46k=;
 b=J9edVt+DQkk4SsCK7WGgpyl7038DZpsJFyk0xkT17XAmYJemHoRyEHJBKrxcZRRtyu
 K6OsRxo+BnPP0vmWA9tnjJl9myTqinuYiPowQl4pfYf5UDr8cfLzURiVIcQNzRZzDZQ4
 FoUMZn6ejtr6B40MdhvWmKFSv5S6H4C3QS7FGu231cNA4lLbouZ+qyVx3+Gzn0diT3VS
 Z77lXRHFp2/SyoF0XeMQVcw0tXkjYeCu0A98ffqHnAkKGmPP6DP79DmR8I9qdu/At6nd
 nb9BpJhHFlQj3Nk1HW++Ta8aXXGeS23YuqX4FN8Q5tU7HK9ewKkZO5g6pNXJOhLeC2IU
 h8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DYpXgLa7aKwNkf25RMtvRP9iUFACK26xYqqO1SJ46k=;
 b=BsRmR8XIDiDXjgvMu3Q4lIR5yZohfl2/0XuwxEiOD/TxTZN53w83hdrS5CzQupNEa5
 ygaizf1Mh8IcuewGQfw93ViIvH9EUVipYn1Q1rnUMfYNEyd4T6G4SIFcF4VF//n+tzYF
 l3M0gyOiUu64xDz97/Qx/uVKT7EgiBa+WHATgKnBvk06HlKMGP8yWgdjvAx+MdMnWwrP
 Nd0HHk8jem0hOxwclOYE3iF/MghjBmYbKN8wKPCtDvLyz8wnSMnH48A415lgai9mVWtW
 twGYV8p2Pc+zCGSB7h7bsVLgggi8/dMVQbIsEPVZOsQjlo+9GDb02Jrzrk34Wmwf542W
 lC1g==
X-Gm-Message-State: AO0yUKUqup+9oxvu7dTkooKtQGV+E6rxhOqhJEDCfGm64dfFnbOn8Ieo
 gVeAz8UpnyfoPrw64V7MGh0wRA==
X-Received: by 2002:a17:90b:4c50:b0:233:ce0b:8655 with SMTP id
 np16-20020a17090b4c5000b00233ce0b8655mr13021290pjb.28.1677185048034; 
 Thu, 23 Feb 2023 12:44:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:44:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 13/13] target/arm: Do memory type alignment check when
 translation enabled
Date: Thu, 23 Feb 2023 10:43:42 -1000
Message-Id: <20230223204342.1093632-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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
X-TUID: ElR1Ua6/lLE3

If translation is enabled, and the PTE memory type is Device,
enable checking alignment via TLB_CHECK_ALIGNMENT.  While the
check is done later than it should be per the ARM, it's better
than not performing the check at all.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2b125fff44..19afeb9135 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -194,6 +194,16 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
+static bool S1_attrs_are_device(uint8_t attrs)
+{
+    /*
+     * This slightly under-decodes the MAIR_ELx field:
+     * 0b0000dd01 is Device with FEAT_XS, otherwise UNPREDICTABLE;
+     * 0b0000dd1x is UNPREDICTABLE.
+     */
+    return (attrs & 0xf0) == 0;
+}
+
 static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
 {
     /*
@@ -1188,6 +1198,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     bool aarch64 = arm_el_is_aa64(env, el);
     uint64_t descriptor, new_descriptor;
     bool nstable;
+    bool device;
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
@@ -1568,6 +1579,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     if (regime_is_stage2(mmu_idx)) {
         result->cacheattrs.is_s2_format = true;
         result->cacheattrs.attrs = extract32(attrs, 2, 4);
+        device = S2_attrs_are_device(arm_hcr_el2_eff_secstate(env, is_secure),
+                                     result->cacheattrs.attrs);
     } else {
         /* Index into MAIR registers for cache attributes */
         uint8_t attrindx = extract32(attrs, 2, 3);
@@ -1575,6 +1588,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         assert(attrindx <= 7);
         result->cacheattrs.is_s2_format = false;
         result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
+        device = S1_attrs_are_device(result->cacheattrs.attrs);
+    }
+
+    /*
+     * Enable alignment checks on Device memory.
+     *
+     * Per R_XCHFJ, this check is mis-ordered, in that this alignment check
+     * should have priority 30, while the permission check should be next at
+     * priority 31 and stage2 translation faults come after that.
+     * Due to the way the TCG softmmu TLB operates, we will have implicitly
+     * done the permission check and the stage2 lookup in finding the TLB
+     * entry, so the alignment check cannot be done sooner.
+     */
+    if (device) {
+        result->f.tlb_fill_flags |= TLB_CHECK_ALIGNED;
     }
 
     /*
-- 
2.34.1


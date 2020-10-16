Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1881602lfa;
        Fri, 16 Oct 2020 14:08:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9IFZWhha2McOgj343Gs2JffnpFIchv1nwfTgdLM5pDu/y3eT8CFeDGHTAF9F8VCjUMRlw
X-Received: by 2002:a25:8546:: with SMTP id f6mr8191761ybn.476.1602882509637;
        Fri, 16 Oct 2020 14:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602882509; cv=none;
        d=google.com; s=arc-20160816;
        b=zsZVPUY0c2WgrjIhC5kBs657pk2Wwjdc2FVhyS18BZTlyOv2mvW4uvc2BAYVn1VSqF
         KVmgYW/tioBWQtW5oFX1XpMAzBq2ZYoYGot2GusYu6Bk/wnVfk2z1uFmhh+vwGZTAB+h
         soGLDvL8hzFtvegOpEvrLk8MrIgghdXjEhSgiJDldc8Ywbcvq3806cZ8BLozQLCdBE+2
         fYmptstcEBK1xBQ6ZX2IySaCaEK0VWENCuu27xRkiI0teamLAYOdwLpSt7YpqCSJ1qIW
         xU3s3LkGSGeOD9odLytFKsnMlBDhxTdc0ekCKuL3ZonGCIbxeRKc9xqQZ05txAdJnYdB
         F40w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=i1O+zLokmvq0z3Tswej92vaAb5atW04s8IFUi7ThT68=;
        b=YKL2Ul9yEgUr2LZgf1kdnC4T64dmTXgdL95Kuqhe3LpvWDzKBFkg/A45wsnkh5hi4m
         IvaOD8tFLym/vMhFmSAPvaccZxOlgJpkxqjjYeUwMOyhstyvHkEMTt8mF516m6TFHhV5
         p0FJLg76u6ZwuYffKR5RDGGVOZ8svtmiUqvDn03rC9U2r/K04fgDSieqb6Gp7MBmYV7T
         kdI+2fasDQB1e2ykfwdW74kBIKij6BS8HihmbhoyktfptaJ0kqD/Pt5+ikFvhocowEa3
         fEu64lvee51A7ceQfIvx4UrcOxSpE3TxKbUsiZ4QeILQft7X/qNU/LG9W9URBjMwu+Ae
         WIlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=prKSL23V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si3585185ybo.204.2020.10.16.14.08.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Oct 2020 14:08:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=prKSL23V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kTWxh-0000iq-0i
	for alex.bennee@linaro.org; Fri, 16 Oct 2020 17:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTWxG-0000do-UF
 for qemu-arm@nongnu.org; Fri, 16 Oct 2020 17:08:02 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:33746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTWxF-0004nT-2k
 for qemu-arm@nongnu.org; Fri, 16 Oct 2020 17:08:02 -0400
Received: by mail-pf1-x443.google.com with SMTP id j18so2209374pfa.0
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2020 14:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i1O+zLokmvq0z3Tswej92vaAb5atW04s8IFUi7ThT68=;
 b=prKSL23VnHl4+YXJKW/1H4TQb2rexuy1oU5YNBjZmlI73kxY4dtf77zWXvba4pFPAa
 5qzRTZh40P3h4R7UUQcepGWTQcLmZNPNUq5ROYpD2Ci6nZf550MW2eSynoSR+PerrsCX
 c07sR3WMNNYyC7frBADkhn3HPCqCfvf0gEhzRabZN9oF07Ei0xprRhWkdMQSzOsqgT+x
 TLwDHf27NKZK+VWj6DdiRGP2/OohL24iHOwnIfujzszJsw/o+B4N55aLKsrP+ubwHijU
 JriJ88NcI/U69/lwJGoqR3+fZ/9+PDBbxpSJ8sfVZgEiPHkbal27Sz/eBqWK+//7tERH
 LtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i1O+zLokmvq0z3Tswej92vaAb5atW04s8IFUi7ThT68=;
 b=oMrOD8BBP7BOc/sZoUk6xkLb2xRv402/pNBgofO4tCjpGZ0Tu4OyNYTKblo+sUQJcU
 R/MErl+Oxb6RbYnpBDPnA/Vn4pj+GJDZP2BIb5WxN9dXU02XZE9FlwVwCz0Q/z8ecLBn
 xECbL5EmDe+RvdVvup8qH0tyFTQaAdAA0/7MaGj66EcanJ0/AhHFMHfNOUaP3iivR0TY
 dL4pT+SEWNjHr9MgLj9idAOzFRIs8P6+rXJnhezLtUQipeMGm5R9IkYNFmbcRLXpSuLO
 tF2cOrXiRlRvZJFTBcXLEYKPNAgmwIF1qJ2kx2HgA59JRykMx4oP3y1DGEiRKCqKInzr
 hmQA==
X-Gm-Message-State: AOAM532URCEhivdU+NJnkhsPONPKQaBD1I6ig7H5PbgQ6NUiaL1LqEOr
 ntrQsBsQIFhvSJ2GtF5vHnRZjg==
X-Received: by 2002:aa7:8e9c:0:b029:152:8a25:548d with SMTP id
 a28-20020aa78e9c0000b02901528a25548dmr5610613pfr.73.1602882479566; 
 Fri, 16 Oct 2020 14:07:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 198sm3682324pfy.41.2020.10.16.14.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 14:07:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] target/arm: Use tlb_flush_page_bits_by_mmuidx*
Date: Fri, 16 Oct 2020 14:07:54 -0700
Message-Id: <20201016210754.818257-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016210754.818257-1-richard.henderson@linaro.org>
References: <20201016210754.818257-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Jordan Frank <jordanfrank@fb.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FsFPUcKBAceA

When TBI is enabled in a given regime, 56 bits of the address
are significant and we need to clear out any other matching
virtual addresses with differing tags.

The other uses of tlb_flush_page (without mmuidx) in this file
are only used by aarch32 mode.

Fixes: 38d931687fa1
Reported-by: Jordan Frank <jordanfrank@fb.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 46 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cd0779ff5f..f49b045d36 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -50,6 +50,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
 #endif
 
 static void switch_mode(CPUARMState *env, int mode);
+static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
 
 static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
@@ -4457,6 +4458,33 @@ static int vae1_tlbmask(CPUARMState *env)
     }
 }
 
+/* Return 56 if TBI is enabled, 64 otherwise. */
+static int tlbbits_for_regime(CPUARMState *env, ARMMMUIdx mmu_idx,
+                              uint64_t addr)
+{
+    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
+    int tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
+    int select = extract64(addr, 55, 1);
+
+    return (tbi >> select) & 1 ? 56 : 64;
+}
+
+static int vae1_tlbbits(CPUARMState *env, uint64_t addr)
+{
+    ARMMMUIdx mmu_idx;
+
+    /* Only the regime of the mmu_idx below is significant. */
+    if (arm_is_secure_below_el3(env)) {
+        mmu_idx = ARMMMUIdx_SE10_0;
+    } else if ((env->cp15.hcr_el2 & (HCR_E2H | HCR_TGE))
+               == (HCR_E2H | HCR_TGE)) {
+        mmu_idx = ARMMMUIdx_E20_0;
+    } else {
+        mmu_idx = ARMMMUIdx_E10_0;
+    }
+    return tlbbits_for_regime(env, mmu_idx, addr);
+}
+
 static void tlbi_aa64_vmalle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                       uint64_t value)
 {
@@ -4593,8 +4621,9 @@ static void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     CPUState *cs = env_cpu(env);
     int mask = vae1_tlbmask(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
+    int bits = vae1_tlbbits(env, pageaddr);
 
-    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, mask);
+    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
 }
 
 static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4608,11 +4637,12 @@ static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     CPUState *cs = env_cpu(env);
     int mask = vae1_tlbmask(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
+    int bits = vae1_tlbbits(env, pageaddr);
 
     if (tlb_force_broadcast(env)) {
-        tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, mask);
+        tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
     } else {
-        tlb_flush_page_by_mmuidx(cs, pageaddr, mask);
+        tlb_flush_page_bits_by_mmuidx(cs, pageaddr, mask, bits);
     }
 }
 
@@ -4621,9 +4651,10 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
+    int bits = tlbbits_for_regime(env, ARMMMUIdx_E2, pageaddr);
 
-    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                             ARMMMUIdxBit_E2);
+    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                  ARMMMUIdxBit_E2, bits);
 }
 
 static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4631,9 +4662,10 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
+    int bits = tlbbits_for_regime(env, ARMMMUIdx_SE3, pageaddr);
 
-    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                             ARMMMUIdxBit_SE3);
+    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                  ARMMMUIdxBit_SE3, bits);
 }
 
 static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.25.1


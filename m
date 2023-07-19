Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7196914eje;
        Wed, 19 Jul 2023 08:58:03 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF15ba2Ru7eDaUwBrJYNAETedD+aB4javh348MjgzuA0EAQj9MHw9deKdXunx0CaNXjwzkk
X-Received: by 2002:a05:620a:2406:b0:765:aa35:f03f with SMTP id d6-20020a05620a240600b00765aa35f03fmr3323606qkn.37.1689782283718;
        Wed, 19 Jul 2023 08:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689782283; cv=none;
        d=google.com; s=arc-20160816;
        b=dUret9XSWsgwQjRtTevtPZUQP+MBnWIhiR8WKlgLBvjTAbM6E0OVyGogrPTgjiToSG
         af8+/f2fTsaN5r7L00RGS50Vy3+teuBV42Yuoqxd2GlwFPS1TjBZPOVipXlAuKAi3ZTv
         WBN94QM+gS5ZZCBMFZLAkAM9bKDo4UjRk+cVt8UvZ3LtylHz5upLFl7qohQEwoVMNdc1
         BwzGX+08YNEpLtFJNxT0bJQ08GoI3jlhLTCypoaT0Ej5IMf+6RjyUKQpW1qvGTGl/zzV
         7sx6RUCASmWzyAXDLFkC+c3QgBWd139/bkqbRa695Q9kCV4npCFOrfHRtDVgnP+lBFy7
         xszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1ZtPVN3lBHeAgdj1nKPqBU2sV0M1JQVXfLkLVtYjNIk=;
        fh=zMLmPP9ozJY0jj0bAXqZquWHP0BgmjJZ9lKiHhJNaWU=;
        b=eR0gMmQwdo4ZAdVVw7JsnUIPnLJd2ZPssVm5VOuwLFEUJ/m0xqXYewxDW1iaAx+wge
         +/r5jUDXLp85LI9/2xPq+dIdWkYYfJgz4UdnwdlwoPTipyBGqWQgVTtyEw6cblOQhr1f
         bq9s5F/IfGDuZ6UroeWq7uwPA1bsq9MldkA6kRj35ZfB6CtqigMd73Nqzgwinb9vQozA
         WV+hS0eYbqIOIlespw0nnHRWZx0vXJ4/l38J4zHnBhNt4cqJZIwSeIppN6ZrFWoKE4lM
         VBaYmIJYFGVoh6U4beFYEyCGZXg+bBfR0MQkiUyB6900E6ko5GM7XVAxrlsEPJVNY+eB
         Aw7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LcMW5US7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12-20020ae9e40c000000b007670139e5e4si2664864qkc.559.2023.07.19.08.58.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jul 2023 08:58:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LcMW5US7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qM9Y0-0003AA-PA; Wed, 19 Jul 2023 11:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qM9Xv-000392-RU
 for qemu-devel@nongnu.org; Wed, 19 Jul 2023 11:57:00 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qM9Xl-0007Ib-7X
 for qemu-devel@nongnu.org; Wed, 19 Jul 2023 11:56:59 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fbb281eec6so11519698e87.1
 for <qemu-devel@nongnu.org>; Wed, 19 Jul 2023 08:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689782206; x=1690387006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ZtPVN3lBHeAgdj1nKPqBU2sV0M1JQVXfLkLVtYjNIk=;
 b=LcMW5US7HuKk425kIMl9dpCMTAV07lLJ+lgPGYmwTXVYLGs1RH2m7Hdsa2tTeWOxtF
 nDI2OGPOLD7apiSTFojae0QsOAzshIbf9rbz0pKJLvZ6SXzL4IZmA1RRbIR+iUEpwV+N
 HG+aTkIY7GKJEPzDNS3/HGj6y355LlNJYQy/WQzCdfo0QLf/4sqhlZrzj0TOXcwdAxng
 MrprCfYEpVKyzqoyTj/detLhIPO6h3xzrBKypEUbTR7oXCaXsfK5AlHlNxqTvhuH5iEC
 q4HL7JjzD01QQqXAXikG8KdCSxy+zzkdfK/TAMegAj+IrcMmG/z0yZb6cjRWFbSrd8uZ
 MT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689782206; x=1690387006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ZtPVN3lBHeAgdj1nKPqBU2sV0M1JQVXfLkLVtYjNIk=;
 b=VQgjjnAx/FypqutZtSrlaWP6M0W7SDF7kh7R50ZpBF2yakMmTcte21765MzqhWS32u
 SE4oz6E2oGEniJ8bNC44M3fgz5OaiCYo+cMNfVxFumnqPvy5SANIuoD7uyhO0/dpWcjC
 n+xYnTevAQu/DIWhCt1fV8XepyeW2HFuDPLooJzatmkBbVaF/QYCvX/kIRj52C4GRqGc
 L7NI2wr4Cnw7O7EIHcr68Vn9/76Fke20ztQXE4E7vdPPJedTNpgNRFhfUessfgWx/sIz
 ezxSTU7dhZT9AhjvDeCf6arxq5D0rN1GhwLQVugxewT3nj8hSNJ1QKYyuJGsRgcfRgeF
 9p4Q==
X-Gm-Message-State: ABy/qLY2pJWjDW9LUGzlqH6Mqp0Yoi3ced2zI+MPHa+9b4/yCJezBKHw
 PyyVVhPyKYHgi2hfyBHn2EenHQ==
X-Received: by 2002:a05:6512:2507:b0:4f8:46e9:9f19 with SMTP id
 be7-20020a056512250700b004f846e99f19mr312891lfb.1.1689782206107; 
 Wed, 19 Jul 2023 08:56:46 -0700 (PDT)
Received: from localhost.localdomain ([2.219.138.198])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a1c790e000000b003fc3b03caa4sm2351006wme.0.2023.07.19.08.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 08:56:45 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 2/5] target/arm/helper: Fix vae2_tlbmask()
Date: Wed, 19 Jul 2023 16:30:16 +0100
Message-ID: <20230719153018.1456180-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719153018.1456180-2-jean-philippe@linaro.org>
References: <20230719153018.1456180-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=jean-philippe@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Un/UgWJW6s9r

When HCR_EL2.E2H is enabled, TLB entries are formed using the EL2&0
translation regime, instead of the EL2 translation regime. The TLB VAE2*
instructions invalidate the regime that corresponds to the current value
of HCR_EL2.E2H.

At the moment we only invalidate the EL2 translation regime. This causes
problems with RMM, which issues TLBI VAE2IS instructions with
HCR_EL2.E2H enabled. Update vae2_tlbmask() to take HCR_EL2.E2H into
account.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/helper.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e1b3db6f5f..07a9ac70f5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4663,6 +4663,21 @@ static int vae1_tlbmask(CPUARMState *env)
     return mask;
 }
 
+static int vae2_tlbmask(CPUARMState *env)
+{
+    uint64_t hcr = arm_hcr_el2_eff(env);
+    uint16_t mask;
+
+    if (hcr & HCR_E2H) {
+        mask = ARMMMUIdxBit_E20_2 |
+               ARMMMUIdxBit_E20_2_PAN |
+               ARMMMUIdxBit_E20_0;
+    } else {
+        mask = ARMMMUIdxBit_E2;
+    }
+    return mask;
+}
+
 /* Return 56 if TBI is enabled, 64 otherwise. */
 static int tlbbits_for_regime(CPUARMState *env, ARMMMUIdx mmu_idx,
                               uint64_t addr)
@@ -4781,7 +4796,7 @@ static void tlbi_aa64_vae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * flush-last-level-only.
      */
     CPUState *cs = env_cpu(env);
-    int mask = e2_tlbmask(env);
+    int mask = vae2_tlbmask(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
     tlb_flush_page_by_mmuidx(cs, pageaddr, mask);
@@ -4838,11 +4853,11 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                    uint64_t value)
 {
     CPUState *cs = env_cpu(env);
+    int mask = vae2_tlbmask(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
     int bits = tlbbits_for_regime(env, ARMMMUIdx_E2, pageaddr);
 
-    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                                  ARMMMUIdxBit_E2, bits);
+    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
 }
 
 static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -5014,11 +5029,6 @@ static void tlbi_aa64_rvae1is_write(CPUARMState *env,
     do_rvae_write(env, value, vae1_tlbmask(env), true);
 }
 
-static int vae2_tlbmask(CPUARMState *env)
-{
-    return ARMMMUIdxBit_E2;
-}
-
 static void tlbi_aa64_rvae2_write(CPUARMState *env,
                                   const ARMCPRegInfo *ri,
                                   uint64_t value)
-- 
2.41.0


Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5118082ejc;
        Mon, 27 Feb 2023 15:02:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/JV+cW90vSEiqWQoz1X8cKOmmhhGlocqIz6BA8mmsPvyL8apUK/R7r0TJL2AksFuFwSSQO
X-Received: by 2002:a05:622a:199d:b0:3b8:6ae9:b107 with SMTP id u29-20020a05622a199d00b003b86ae9b107mr1685686qtc.17.1677538956359;
        Mon, 27 Feb 2023 15:02:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677538956; cv=none;
        d=google.com; s=arc-20160816;
        b=kWtVzKLpaxcTyxg/mN6wY+VY58Y6Jhw4NkAL6EbRowNdS7XBEEcs8rG7eIJ/q9lG6o
         vI5PVlrhl2/q+MKKxbqwfXOBWpoR4NkjhxZP4HpNVo3e6UxSa2t9yrC4GDieAlZaco+l
         MwlpVNPIcJ6cj50ilsk9NY2R4+xdsNMpiFkbVj3u9k/TSxuSd2x4Xp3YLud8x0VLubT+
         OtqH3mQTU/b89uDi5i9E2tv/BOIVmM2W3He+nou9QwUtR7poj6EGc08ugHkTjvk3cIV4
         02YXoyGzG7V9yvGlGJeEUnhaa14vdTmBEHEoCyXdxF7jVtxN0GLimfRUzVa0r/r8IWOL
         2ezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sfKYqEChfrtTh13e431O8E/j8Wi+d7VSKgI7shCtu0o=;
        b=WgqLQqXGkFf4Vo1mElBQYEdQD/3R9/dgpwA5JeVroM8bY6BMtjIEOrLiseHr9dywW6
         TVElKqEfVIpLfRpG+2eoQgMFObHtFwwetfbJABFOos/LpsVEQ9N+k5NhneVN5mgZ4sR+
         6VjM/5Xl48P2/SsVN932vDvsV6/MmVgxrzXmDLXznbIA9OUvGM8DoyW+P5DjdvEmwoa4
         +YbVMgE28TTIIMSNAy+o7/+O4nFD/fksrV5/YWQBnLZ9LkwNRbffJFEYKNUGyj31SL/2
         LA7kJUPaxW0LNFGfKp5OV7WzXfhIXKxvuagmBeE4EGaW6EHZPjTxQ3OX+8EcSsOpuQ0X
         aMgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=One1GNUX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020ac840c8000000b003b1b92b7c90si6573522qtm.721.2023.02.27.15.02.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 15:02:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=One1GNUX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmVF-0007lP-It; Mon, 27 Feb 2023 18:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmV3-0007jk-2S
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:41 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmV1-00011a-Bg
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:40 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso943683pjr.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sfKYqEChfrtTh13e431O8E/j8Wi+d7VSKgI7shCtu0o=;
 b=One1GNUXbCurN1VIU+A9CbGg4mkih2JLVqr32t0seIYiMHiyhU0Ngj2bw5//jtCtlG
 hW3eDUC1Zz7VCBQHgxxaigqOqIVcv/LfgWsCHLKDmVLD3XEOpcAhwVqs7f/LwmRc7hQ+
 NwjMHB8bI0oMTgJEqFllPqUOEU70nphcuPxripcjMcGxXbWkYHgJdjoH+t/wGgaq56dU
 iLNlV9/EGpNJmPV58QWP1a5uA5A57wA+jkBYHWgNL6fbHcSAEEyfyGrM2L8zYMep6g3O
 vu/cJmRpvNM3nxtFXhL/jjwEUcTyyB9LrAtDIKerp6/2lXEv8iNjMhsm876UcnYQmdzA
 sV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sfKYqEChfrtTh13e431O8E/j8Wi+d7VSKgI7shCtu0o=;
 b=WvEvbW5pIrLV0rGlWfOgTpME/0O7Z7jvPUs8cHHLmAFbf9jR3LsbixNZeg3rSFXse9
 kK5ocicqEITegfVES1WK/knE4caq7NpL1nCKTCjRUeIW633YZbS+fCZQNBYXm3cgmvMm
 mt240yJNqJGZqB1yeFcyvBjylbZygFVFec5LQt1jRQNsKvlEUfIK5qDQ/zD7cP9hYoqK
 uaRNIbwupS9KNstmr/gPKVb170AIb15/oHvEoKTGJXFbP6dLcXr8JzW0VIbEAD0ZsXXV
 Yy7AUFeDNJVBJGCf2L2P9JRpa8vOihk49mWcVZT/Txkik+GcxSlPWIIsc7VyFCuQDhac
 fK3Q==
X-Gm-Message-State: AO0yUKW3cbtX0D6sxLFeOvOtpOFrSiAPap81gtJgp+2/Mblmwv484Mjc
 RnaptxVsWpSdLuXnGx/yI+Mex9tzRNeQ5gosdX4=
X-Received: by 2002:a05:6a20:1610:b0:c0:c429:cbbd with SMTP id
 l16-20020a056a20161000b000c0c429cbbdmr1067065pzj.6.1677538898075; 
 Mon, 27 Feb 2023 15:01:38 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 08/21] target/arm: Introduce ARMMMUIdx_Phys_{Realm,
 Root}
Date: Mon, 27 Feb 2023 13:01:09 -1000
Message-Id: <20230227230122.816702-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: qjzNfo1ABmyh

With FEAT_RME, there are four physical address spaces.
For now, just define the symbols, and mention them in
the same spots as the other Phys indexes in ptw.c.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h |  2 +-
 target/arm/cpu.h       | 23 +++++++++++++++++++++--
 target/arm/ptw.c       | 10 ++++++++--
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 53cac9c89b..8dfd7a0bb6 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -47,6 +47,6 @@
     bool guarded;
 #endif
 
-#define NB_MMU_MODES 12
+#define NB_MMU_MODES 14
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c5fc475cf8..05fd6e61aa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2865,8 +2865,10 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Stage2    = 9 | ARM_MMU_IDX_A,
 
     /* TLBs with 1-1 mapping to the physical address spaces. */
-    ARMMMUIdx_Phys_S    = 10 | ARM_MMU_IDX_A,
-    ARMMMUIdx_Phys_NS   = 11 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_S     = 10 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_NS    = 11 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_Root  = 12 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_Realm = 13 | ARM_MMU_IDX_A,
 
     /*
      * These are not allocated TLBs and are used only for AT system
@@ -2930,6 +2932,23 @@ typedef enum ARMASIdx {
     ARMASIdx_TagS = 3,
 } ARMASIdx;
 
+static inline ARMMMUIdx arm_space_to_phys(ARMSecuritySpace space)
+{
+    /* Assert the relative order of the physical mmu indexes. */
+    QEMU_BUILD_BUG_ON(ARMSS_Secure != 0);
+    QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS != ARMMMUIdx_Phys_S + ARMSS_NonSecure);
+    QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_Root != ARMMMUIdx_Phys_S + ARMSS_Root);
+    QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_Realm != ARMMMUIdx_Phys_S + ARMSS_Realm);
+
+    return ARMMMUIdx_Phys_S + space;
+}
+
+static inline ARMSecuritySpace arm_phys_to_space(ARMMMUIdx idx)
+{
+    assert(idx >= ARMMMUIdx_Phys_S && idx <= ARMMMUIdx_Phys_Realm);
+    return idx - ARMMMUIdx_Phys_S;
+}
+
 static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
 {
     /* If all the CLIDR.Ctypem bits are 0 there are no caches, and
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5aa58c200c..0788c342b8 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -182,8 +182,10 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     case ARMMMUIdx_E3:
         break;
 
-    case ARMMMUIdx_Phys_NS:
     case ARMMMUIdx_Phys_S:
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_Root:
+    case ARMMMUIdx_Phys_Realm:
         /* No translation for physical address spaces. */
         return true;
 
@@ -2636,8 +2638,10 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     switch (mmu_idx) {
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_Stage2_S:
-    case ARMMMUIdx_Phys_NS:
     case ARMMMUIdx_Phys_S:
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_Root:
+    case ARMMMUIdx_Phys_Realm:
         break;
 
     default:
@@ -2834,6 +2838,8 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     switch (mmu_idx) {
     case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_Root:
+    case ARMMMUIdx_Phys_Realm:
         /* Checking Phys early avoids special casing later vs regime_el. */
         return get_phys_addr_disabled(env, address, access_type, mmu_idx,
                                       is_secure, result, fi);
-- 
2.34.1


Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1942121wrq;
        Sun, 10 Feb 2019 17:09:24 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZBsYnugovCAJiHbNYx3B1EpmfS8yMH0Cr25cvankiS+UDw0+832uXgNW3g81l6Up8oszZh
X-Received: by 2002:a1c:f613:: with SMTP id w19mr7061922wmc.0.1549847364184;
        Sun, 10 Feb 2019 17:09:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847364; cv=none;
        d=google.com; s=arc-20160816;
        b=UWXLO+OwwOxrTkp5a5S6qR1kmJcLBmdOJBU31WnU4o3o2bVNutPfGkeQ8gqY795RYM
         44jAalfzeWO0HU3jpMHr6y15rVLDNBJEUOBvEaSkjsmD/kc788U4wFTrqtTautJm+sWa
         wa/8qfzz4GRM3Omlk7Y3M9TRIZ1Oim3agout7vUS6FnRZdqp0pbCFGKjvFxrdmRl1efU
         jmbn5bRyOjckqq9PF20Bcvve8jjSYIRp6SlhTvxIFLVTOHWJK7b/nBDYN1cWG3RvnAMR
         2hF9mswqPSC9mRQUX9/FelNWmeypzTJ0fYi21o4SohWMYL15TYtCwpKnqp+FDhISJU/S
         lNHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=3Dd817zt1y/TGuEmTtxVfosE+MfIs8+VAHxl36iblpQ=;
        b=bgxOLc/w9nVZl+WwZkMPAojpMleO2mgftbNkslGuaoR7m7urOWfsX4JxUv/AHlPq0R
         d5WG439bTJbuwX0hf2oUmh9xVjwNNuH3pvmXEiLGGum1iAjBRVr/DJoWkURLDifusD/C
         RTlEIacMrrxeQ5tZxQSD3iQ+5/pT/l1HQ8mYHbmiwHCr82shXphKG9aMz/eaAmovdazj
         oIEk2G2zAPIYbNscxJVqafGPGlWl/aC6EE1Nnb93aTZ9U5d305Lu56TMZBQKJt5jlKxG
         wYClPJhd/tffRyRAHDNzunIgUbv5MBMPBahu1MNzlJ87dTaMTC49LnogHbguuL8iqZPE
         woBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TwELF4Am;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si7631714wmb.4.2019.02.10.17.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:09:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TwELF4Am;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt067-0005qK-4c
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:09:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05i-0005eh-4W
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05g-0008Kf-70
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:58 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:39980)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05d-00088P-1Q
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:53 -0500
Received: by mail-pg1-x543.google.com with SMTP id z10so4201329pgp.7
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 17:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3Dd817zt1y/TGuEmTtxVfosE+MfIs8+VAHxl36iblpQ=;
	b=TwELF4AmRVVHwOXmRY8bPlGw/WabjF2SjIxw2wIfBnVJa8CUU3nRZuN7ibMngRRMWb
	f2VTZstIUS96YDaR6Z2+7HAEuaFh8rwYqk2LUx6Y+POXz4wVyFUBMZRypkXg8EOQKfro
	zP+BDDxUGEwnHQd07U3Xu/CJwkn4hoI6a5enunXWLTYdW35MZOXZea6umpDcNnO0QuPe
	On+ezL63ZFeeEtf7KE52ZyxU3nmhvFPzWuq7cv5MbksgLoRFwS7iQrCz/gLAv3MEJCQZ
	hXPVtdiH5h9VIbE2tpSSh8wsGHQ09zyP9xeW0e9eUvmUapgZwfc93Rpgyg8QD4vaTm31
	TFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3Dd817zt1y/TGuEmTtxVfosE+MfIs8+VAHxl36iblpQ=;
	b=GLckTYy/xpUjur2pv/tP7TtXtKTUr4tRHKEIRT/6eSqxloVeKzXLQnQt+FS83zrBt5
	F97gTKDlgchQceBdT11wPW1jLFxLgwylL+tY4VvAL02U+wWhf/add3h/PvUsNUZ+i0Yh
	ynKsADi2zgTNjgW1lk/++ZXkNeWVb2cQUpzoymszFsp1p1fpa0tH78/RwCcehUBX5e/9
	uANb7+xBzD/r/q6TRFRRd0gdi6vmXXg8qUQ0U85g6eOvgm5EedXSag0Wj7x8/wxKlwGv
	KeZMxS89wCYnOxkryOMiQEiVBIAHVg3hqit1f4uGvzz7EO8bmVNHy1DE4YTXwnE3qvN3
	wDQw==
X-Gm-Message-State: AHQUAuY2x/eC/c+7JtjLURC8/E/4bZM9zpiNFUtnSOix/wltDJnASH4R
	r859Fw0lq4tOolc62iFssw0oSRtzuZw=
X-Received: by 2002:a62:e201:: with SMTP id a1mr33670343pfi.75.1549847324960; 
	Sun, 10 Feb 2019 17:08:44 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:13 -0800
Message-Id: <20190211010829.29869-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-arm] [PATCH v2 10/26] target/arm: Implement the IRG
 instruction
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 70LJcn/T+DIo

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update to 00eac5.
    Merge choose_random_nonexcluded_tag into helper_irg since
    that pseudo function no longer exists separately.
---
 target/arm/helper-a64.h    |  1 +
 target/arm/mte_helper.c    | 57 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  7 +++++
 3 files changed, 65 insertions(+)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index fa4c371a47..7a6051fdab 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -104,3 +104,4 @@ DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
 DEF_HELPER_FLAGS_2(mte_check, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index d086925a91..493c2f7bb2 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -65,6 +65,31 @@ static int allocation_tag_from_addr(uint64_t ptr)
     return extract64(ptr, 56, 4);
 }
 
+static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
+{
+    if (exclude == 0xffff) {
+        return 0;
+    }
+    if (offset == 0) {
+        while (exclude & (1 << tag)) {
+            tag = (tag + 1) & 15;
+        }
+    } else {
+        do {
+            do {
+                tag = (tag + 1) & 15;
+            } while (exclude & (1 << tag));
+        } while (--offset > 0);
+    }
+    return tag;
+}
+
+static uint64_t address_with_allocation_tag(uint64_t ptr, int rtag)
+{
+    rtag -= extract64(ptr, 55, 1);
+    return deposit64(ptr, 56, 4, rtag);
+}
+
 uint64_t HELPER(mte_check)(CPUARMState *env, uint64_t ptr)
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
@@ -145,3 +170,35 @@ uint64_t HELPER(mte_check)(CPUARMState *env, uint64_t ptr)
         return sextract64(ptr, 0, 56);
     }
 }
+
+uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
+{
+    int el = arm_current_el(env);
+    uint64_t sctlr = arm_sctlr(env, el);
+    int rtag = 0;
+
+    if (allocation_tag_access_enabled(env, el, sctlr)) {
+        /*
+         * Our IMPDEF choice for GCR_EL1.RRND==1 is to behave as if
+         * GCR_EL1.RRND==0, always producing deterministic results.
+         */
+        uint16_t exclude = extract32(rm | env->cp15.gcr_el1, 0, 16);
+        int start = extract32(env->cp15.rgsr_el1, 0, 4);
+        int seed = extract32(env->cp15.rgsr_el1, 8, 16);
+        int offset, i;
+
+        /* RandomTag */
+        for (i = offset = 0; i < 4; ++i) {
+            /* NextRandomTagBit */
+            int top = (extract32(seed, 5, 1) ^ extract32(seed, 3, 1) ^
+                       extract32(seed, 2, 1) ^ extract32(seed, 0, 1));
+            seed = (top << 15) | (seed >> 1);
+            offset |= top << i;
+        }
+        rtag = choose_nonexcluded_tag(start, offset, exclude);
+
+        env->cp15.rgsr_el1 = rtag | (seed << 8);
+    }
+
+    return address_with_allocation_tag(rn, rtag);
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d0f8c314c9..5e7d7f2d5e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5126,6 +5126,13 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
     case 3: /* SDIV */
         handle_div(s, true, sf, rm, rn, rd);
         break;
+    case 4: /* IRG */
+        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        }
+        gen_helper_irg(cpu_reg_sp(s, rd), cpu_env,
+                       cpu_reg_sp(s, rn), cpu_reg(s, rm));
+        break;
     case 8: /* LSLV */
         handle_shift_reg(s, A64_SHIFT_TYPE_LSL, sf, rm, rn, rd);
         break;
-- 
2.17.2


Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1149892ejb;
        Mon, 30 Jan 2023 10:26:49 -0800 (PST)
X-Google-Smtp-Source: AK7set//jfk+Ba7QbCCtJLcH4GA6N2fRYKYf/6XhmIi8cV4kWyoRSkQVMN/LQ4HGN9GbLTaLVfsu
X-Received: by 2002:ac8:5a41:0:b0:3b8:6db0:7565 with SMTP id o1-20020ac85a41000000b003b86db07565mr4039716qta.11.1675103209299;
        Mon, 30 Jan 2023 10:26:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675103209; cv=none;
        d=google.com; s=arc-20160816;
        b=hdz6AJ8T//8o0/yTbagx1FIKy8wAd0xDaV2A4e8VjqTJEbyymo0y2zqdqhA2Rfl9vU
         2lTpF7l+RRwkxU4Xw94Jk92FGeAfg34n06BOc9M7dXtKsgzrTmgNg3//ZpuNM26vs8jS
         jRiaYJs/K9akhjnzVq/cPMht00rzqykViIkujHFgNg+Q2mJmTccCgf7QnQ+Orn6/WVfo
         8Fzrmdy4C++R28Gxvlne7CdrUFAF/pS5UU3CXnQR33g6WXePzHGmSH1CaeIQDIhNX9cf
         lue8mCp3FNyvUNneEFEJzvlt+C4Z7IflioeCRjmv/bnToaOK0M9TS3rUJQZNH/QVCRjv
         nFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=i3PZZa+UR17dkZmHlwEV5fYemHt27708BnOn+3KkbpA=;
        b=B10VVBN7F+9F4W4fXF47o1ebhnPrSnBJrtDfPqPeBDjeXdI31KyCKAhl5CoMaChJn5
         ffr1jsIB6phl59SzeCCn/PyxV21fXNJAisGctUAB/AfEzJLg/LTWibkC1z4/YD3JT6nB
         I/U0gej7WnQffsE1qlsUVD1kewqTuKZ2IjddPct7NthIPew2tg4XAhfO3s3MXF0RXe1o
         NEej6k7Olhe1PBX4tstIgijLhP5jbN/pP/gKzjL0hqH7zzumbOQoKDVWe7tjpJhD8u5g
         AnssC1swwunntqKpzWncaKwg0Zc6OPthzHS5MQK0hPjdpZQrrMFyCw6bdk4nLjTCZqrX
         pigg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gd5ndaKn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s62-20020ae9de41000000b006fbdef09390si6854492qkf.96.2023.01.30.10.26.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 10:26:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gd5ndaKn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMYqJ-00015s-Va; Mon, 30 Jan 2023 13:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqA-00010B-GP
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:15 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq5-0008Or-4Z
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:14 -0500
Received: by mail-wr1-x42c.google.com with SMTP id m7so11983432wru.8
 for <qemu-arm@nongnu.org>; Mon, 30 Jan 2023 10:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=i3PZZa+UR17dkZmHlwEV5fYemHt27708BnOn+3KkbpA=;
 b=Gd5ndaKn7442bBjZ0aruwzRjuBHGIE+iG4aXpSpuP3kdaARRujyOFKxIVCk2W9UYiI
 jp7f2uO/shhz0jHRycK9EEIZJcKCxfNxiGy2a21uAhnccYN7gGCT/t/148S4OWxrZFPD
 c+2alkwZpAEeUP+4HB0eHNNVARxSt0KxpvQjZMbWEONgUZrPcO6p5ryN7EnftYHaU/tl
 bSfW/s95zL5LOXhMgYsTI+t8cP8dIaUzXxJ44CCRC0mS9IyeIsmsKN54hPeWFlYsWc0j
 gZR8U3Umhxf1HBuEDzx2iwIFdGI01aZbHr0SaU3NZDdiY5mi0UVZJkXDRFBgE/B8FdBk
 U5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i3PZZa+UR17dkZmHlwEV5fYemHt27708BnOn+3KkbpA=;
 b=uId0Q+lY2Bxiehy8Bu4KC72Qrh/n+oKG12Dk179D9XHGb/EhcfH6/BEcvAk2tnaD65
 OtjwTyA+JzWp+ma4IELcKKQzYhwKUioH6rRALZfxRhDW5u72/gXRuQWMKiXAPlUbqXvY
 pNFeQqgOVH9leweHYjI8VRmrRl/91WFsQG3eADP6+QK6j98Zc4O7oETeQGUByxobhEvy
 Bgzh9Zi/Ti2l9kTdNBFYvhbzzr72Rjm+Dk4+1tiW5zGuIx8Z3k68f4JeoUGSRhRWap4m
 QSEXgeZ4XgEfb7fLxfz4AKHfsiKxdEHo2+bWZPAgL8R88KZSOOHtqiRMQsQX3Sc/V1KF
 KYHw==
X-Gm-Message-State: AO0yUKWKVFncUI/PMHKrm2tbbxDqi5lU7qTSJLuzOwgwUnASs+yBHQsu
 GoOwjGQImL8E7PG0RGlKzxhi4NMiFVxisqQf
X-Received: by 2002:a5d:4584:0:b0:2bf:dfa2:976f with SMTP id
 p4-20020a5d4584000000b002bfdfa2976fmr7687163wrq.39.1675103106666; 
 Mon, 30 Jan 2023 10:25:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/23] target/arm: All UNDEF-at-EL0 traps take priority
 over HSTR_EL2 traps
Date: Mon, 30 Jan 2023 18:24:41 +0000
Message-Id: <20230130182459.3309057-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PTmvXwCxxm9i

The HSTR_EL2 register has a collection of trap bits which allow
trapping to EL2 for AArch32 EL0 or EL1 accesses to coprocessor
registers.  The specification of these bits is that when the bit is
set we should trap
 * EL1 accesses
 * EL0 accesses, if the access is not UNDEFINED when the
   trap bit is 0

In other words, all UNDEF traps from EL0 to EL1 take precedence over
the HSTR_EL2 trap to EL2.  (Since this is all AArch32, the only kind
of trap-to-EL1 is the UNDEF.)

Our implementation doesn't quite get this right -- we check for traps
in the order:
 * no such register
 * ARMCPRegInfo::access bits
 * HSTR_EL2 trap bits
 * ARMCPRegInfo::accessfn

So UNDEFs that happen because of the access bits or because the
register doesn't exist at all correctly take priority over the
HSTR_EL2 trap, but where a register can UNDEF at EL0 because of the
accessfn we are incorrectly always taking the HSTR_EL2 trap.  There
aren't many of these, but one example is the PMCR; if you look at the
access pseudocode for this register you can see that UNDEFs taken
because of the value of PMUSERENR.EN are checked before the HSTR_EL2
bit.

Rearrange helper_access_check_cp_reg() so that we always call the
accessfn, and use its return value if it indicates that the access
traps to EL0 rather than continuing to do the HSTR_EL2 check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-6-peter.maydell@linaro.org
---
 target/arm/op_helper.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index def5d3515e2..660dae696dd 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -640,10 +640,24 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
         goto fail;
     }
 
+    if (ri->accessfn) {
+        res = ri->accessfn(env, ri, isread);
+    }
+
     /*
-     * Check for an EL2 trap due to HSTR_EL2. We expect EL0 accesses
-     * to sysregs non accessible at EL0 to have UNDEF-ed already.
+     * If the access function indicates a trap from EL0 to EL1 then
+     * that always takes priority over the HSTR_EL2 trap. (If it indicates
+     * a trap to EL3, then the HSTR_EL2 trap takes priority; if it indicates
+     * a trap to EL2, then the syndrome is the same either way so we don't
+     * care whether technically the architecture says that HSTR_EL2 trap or
+     * the other trap takes priority. So we take the "check HSTR_EL2" path
+     * for all of those cases.)
      */
+    if (res != CP_ACCESS_OK && ((res & CP_ACCESS_EL_MASK) == 0) &&
+        arm_current_el(env) == 0) {
+        goto fail;
+    }
+
     if (!is_a64(env) && arm_current_el(env) < 2 && ri->cp == 15 &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         uint32_t mask = 1 << ri->crn;
@@ -661,9 +675,6 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
         }
     }
 
-    if (ri->accessfn) {
-        res = ri->accessfn(env, ri, isread);
-    }
     if (likely(res == CP_ACCESS_OK)) {
         return ri;
     }
-- 
2.34.1


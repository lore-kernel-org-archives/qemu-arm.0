Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287790lfk;
        Wed, 9 Feb 2022 20:04:56 -0800 (PST)
X-Received: by 2002:a17:902:aa47:: with SMTP id c7mr5836967plr.98.1644465895793;
        Wed, 09 Feb 2022 20:04:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465895; cv=none;
        d=google.com; s=arc-20160816;
        b=fE9ZFoRouYd4jD57FaZbHTP3rAWOxnacKrV8alMZ4/QniK64kiiIm91X0R44wIPB96
         kK7g/cAmZHnd3PSv15CvuuLM6qoqX/eHQhR4joE8YH387rBzoo05BkFhpMfwgPfpkgyR
         duXOEIzOCoHlMVxIVWPTIYuCdl5oAdqirbHHBNHBT7LnT4Br/jV/5ywaLmShkekWUuUq
         W9OqLPW9SHb8vQ90Q2VlcG3gc/mgFyrha4bLfu0lOs63cZSyWLdBL2u0ZNlbeqifgLSU
         qnF1e8cZFUXHoBjRYVRBTJlBwS5JxtGpn806XkcBZRQ3q17TJavmHc84C6ZZjljLePDT
         Sr9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yVExx3SXXr9h6DkfYn7yNhxsG0U7fq7HrQiNwR7HpZk=;
        b=xB2TjKTbohNXTO1FjvVloOtqQCfW1NZnMRyZIVeKNOsmYGk/FS4D8PQQA1ROFb6o/p
         GOe0VO+xJ/ZJMXBqWYpU7m4Zkx/pJ+mKuqo/hrUaw6goITeaU1TbLaS1MOFql46i8x+Q
         yXdr44TRlR+YRH8KyDYZkk4Ld1cPVD5Dsfb5uchjgXppQvq/g6SWrZQ0LaZMMLvXQ4qr
         hN0pqZK386hSLZ7HZCNNeTbdvSNXd01yaoOcGnD6uJbjmDNY1i6TiHcMv21kLuNhv401
         O+umTHqVhjxxgWVpMLWBDouu+BLOn3rcIBqdzpeNe3TVB0tKedFKvpJhyd+t9bFddQep
         tiXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fsL5LBG8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t77sor1426742pfc.45.2022.02.09.20.04.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:04:55 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fsL5LBG8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yVExx3SXXr9h6DkfYn7yNhxsG0U7fq7HrQiNwR7HpZk=;
        b=fsL5LBG8K3oCMUeM+JopWyclUVsDw32EhvAFlE6HRLkdXrVz1Nk5yOcqw6SLxGVs9V
         eBXZgOUdIE+wK8ttHqJlRwnvm9tmzVwsvayxQZAP/zIm67vNOmcOamGe49MVWIJUESaD
         /DmWuWCwx1netcN011x6pGw8Jn4huH+5Txx123X0QiVF67SQvAmjLUGZnWyH1Sqj3z8V
         2DVUOuwh/j4keI3yyWke6EwfCHrfSc6HBRQGcdkO4AHuoGkzXcZBuFwFxr3lSjDwhFhx
         755dlRqwk58lj+b1V2zPAdGX1bZFJi1USPe/OjCDLZqDzdL7hWLxzCO2rgK0TBrCf3Oh
         kt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yVExx3SXXr9h6DkfYn7yNhxsG0U7fq7HrQiNwR7HpZk=;
        b=p/d8rejrFtD7aQ8iUNfrDQY0VoxIZ9kiXlCMtuvcTUcTETb6C66qHwQh3Uqbq1J4vJ
         2DggcipEnfZ9Q+HtepjGkrJQOwxwbgn2YmvG67Aaod/zd6Oxg3E0myFrDsPwjnzXyH7p
         46HxRQWrXPgnQ0O0qRvCNVR0zJu01NPHHZ9Xrd5UEWaPPtFOYWeBrt6ubAdcFV2e7SWO
         XdDuIvQnkntcmkTbPo8AZY3viEtwiP8/thjcuuOoGXUM5mUYzm2YMBVC3exAju6Aontc
         GFO775txcX8DV476IYcCVPiTKhtBLUyvwnTc0QQ8CEUOQ3IRuThBwSElRtXTV1fwR067
         IikA==
X-Gm-Message-State: AOAM530qT0JqRn5LG5SyFWiDVujbPkgPvdN+cXEHN29SXiC93lqUSaLC
	ddvw4/0Kfi2FmVKnDSXpXMNa3xPN
X-Google-Smtp-Source: ABdhPJxE6sexassuQZ3i6aFXfBTQ3MnkusE7fg3W1cI/KiQ23+CrL/DagQE7BWRIC42FYOS32hEvjA==
X-Received: by 2002:a63:4182:: with SMTP id o124mr4654288pga.479.1644465895232;
        Wed, 09 Feb 2022 20:04:55 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:04:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 08/15] target/arm: Prepare DBGBVR and DBGWVR for FEAT_LVA
Date: Thu, 10 Feb 2022 15:04:16 +1100
Message-Id: <20220210040423.95120-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cIj1noqC+trW

The original A.a revision of the AArch64 ARM required that we
force-extend the addresses in these registers from 49 bits.
This language has been loosened via a combination of IMPLEMENTATION
DEFINED and CONSTRAINTED UNPREDICTABLE to allow consideration of
the entire aligned address.

This means that we do not have to consider whether or not FEAT_LVA
is enabled, and decide from which bit an address might need to be
extended.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 015f992f02..e5050816cf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6421,11 +6421,18 @@ static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     ARMCPU *cpu = env_archcpu(env);
     int i = ri->crm;
 
-    /* Bits [63:49] are hardwired to the value of bit [48]; that is, the
-     * register reads and behaves as if values written are sign extended.
+    /*
      * Bits [1:0] are RES0.
+     *
+     * It is IMPLEMENTATION DEFINED whether [63:49] ([63:53] with FEAT_LVA)
+     * are hardwired to the value of bit [48] ([52] with FEAT_LVA), or if
+     * they contain the value written.  It is CONSTRAINED UNPREDICTABLE
+     * whether the RESS bits are ignored when comparing an address.
+     *
+     * Therefore we are allowed to compare the entire register, which lets
+     * us avoid considering whether or not FEAT_LVA is actually enabled.
      */
-    value = sextract64(value, 0, 49) & ~3ULL;
+    value &= ~3ULL;
 
     raw_write(env, ri, value);
     hw_watchpoint_update(cpu, i);
@@ -6471,10 +6478,19 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
     case 0: /* unlinked address match */
     case 1: /* linked address match */
     {
-        /* Bits [63:49] are hardwired to the value of bit [48]; that is,
-         * we behave as if the register was sign extended. Bits [1:0] are
-         * RES0. The BAS field is used to allow setting breakpoints on 16
-         * bit wide instructions; it is CONSTRAINED UNPREDICTABLE whether
+        /*
+         * Bits [1:0] are RES0.
+         *
+         * It is IMPLEMENTATION DEFINED whether bits [63:49]
+         * ([63:53] for FEAT_LVA) are hardwired to a copy of the sign bit
+         * of the VA field ([48] or [52] for FEAT_LVA), or whether the
+         * value is read as written.  It is CONSTRAINED UNPREDICTABLE
+         * whether the RESS bits are ignored when comparing an address.
+         * Therefore we are allowed to compare the entire register, which
+         * lets us avoid considering whether FEAT_LVA is actually enabled.
+         *
+         * The BAS field is used to allow setting breakpoints on 16-bit
+         * wide instructions; it is CONSTRAINED UNPREDICTABLE whether
          * a bp will fire if the addresses covered by the bp and the addresses
          * covered by the insn overlap but the insn doesn't start at the
          * start of the bp address range. We choose to require the insn and
@@ -6487,7 +6503,7 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
          * See also figure D2-3 in the v8 ARM ARM (DDI0487A.c).
          */
         int bas = extract64(bcr, 5, 4);
-        addr = sextract64(bvr, 0, 49) & ~3ULL;
+        addr = bvr & ~3ULL;
         if (bas == 0) {
             return;
         }
-- 
2.25.1

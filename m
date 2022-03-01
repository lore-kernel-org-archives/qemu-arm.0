Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209822lfo;
        Tue, 1 Mar 2022 14:00:16 -0800 (PST)
X-Received: by 2002:a62:ee12:0:b0:4e1:2ec1:cba2 with SMTP id e18-20020a62ee12000000b004e12ec1cba2mr29590775pfi.71.1646172016254;
        Tue, 01 Mar 2022 14:00:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172016; cv=none;
        d=google.com; s=arc-20160816;
        b=jWxAa0EGet5zupwXxEd++6xhv4ZTZJdyvWerLpzc4gd3H7P9958RFq9EXevcVDiFOf
         esY5do3YSQdcUDpycyUAt+xn9CYk1pS9/E0LCsZDXhYbE+d5KxRXQjaB6v94yYiY2O3N
         bX9K4Q1uoP0rIsGXqUpQRXDSFZFa6/UiUEVtWGJzB8JYErUSc+CKnjBbYNwbfotKT1HX
         bDFC48cvmxvBy33YykE7BFOufIYgX60obC0h+SjT4X8h8OeRY5BlfPmRo0hRLDQywHgX
         ohJDWOpHzFDNo7ATWhVj0tYBsvDbpPVLnWEybcgpRcub8VWfcCFUKcoDT6b+GwiFL0W1
         gWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TmxawEn4TT//u8dncYbu6ycL9fZfNNpmMP+qU1HcQZ0=;
        b=T1QefLOKA0SRA2vd3SCjjVessEc101dXWVDhfbOxm2iuGw9tpcT61w3A1C4+VpaaJK
         WJ/gA5D83KClgOhh1neZxt4h7bzXCWh4sCw1S0/aeX+NwO1V5gJ1dL+57oFKO/1Rp07m
         NiYYooJTbqkWevRvnKrKG/65O1dlVw4Rvps7jjc2VQvE3e1atkaHyHWOmKADCFUcFf4w
         aEfpnrAHg7MR1dsapFa9oPUy4MnZ2lB9alJD73JgiKGlPMTjX8V7XDwOvhlXZrdJuPuC
         m8MxZ/a+L9RoYJynm9T5VlhKeDV6aRNvCMP3j7Zv5jYbN7IEu75WXGR9ajrqZtHi11Lo
         K7JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sBO36gXv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id il7-20020a17090b164700b001b7e4a855b9sor6698152pjb.16.2022.03.01.14.00.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:16 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sBO36gXv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TmxawEn4TT//u8dncYbu6ycL9fZfNNpmMP+qU1HcQZ0=;
        b=sBO36gXviA0Dkd1Weoc5SQH5qIidteDHrXdZvzNSh04ezoQXqD3irIVtzPo0aiDabp
         Zqcl6sdxJrcV6Zia6zLj7h4AyxU4p35rGc6UgJZ/6MecQgHArxvLhX4MeH6tekIZxzsM
         AmdAeeRJNJdHdDqtjUfg+MHgbiVaITH1X+Ta6DJJq/saUj08WLcxFBNj2bDFdb8l66H4
         jHd+0z3RVeO+hgd1i0cnj/ROz365/Aj001f8RVNYC8UfbGXDhJI/1O+X+Ohe2GCV/Sjo
         PyouSQUCjy+CjzDTwTfeXNuVpB90pSJxRUgOT3Jc1NPaa6VDXBL5+JAAnjswxZ+kJQFj
         kinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TmxawEn4TT//u8dncYbu6ycL9fZfNNpmMP+qU1HcQZ0=;
        b=wGNb2AuZNdDmdOS1gi/T/oXcOdF/lxHd87VNxATDwUHzq04srsNeTTNyPz6SLTn5uv
         E6a/iRzwLP+XQrQLllz9a/BLNpc3aYMh2QoTXxIO9eTCuZYUs3pEdyaCOR71NiXiwUph
         P2YW17Yk1RbmaydP51WOS+Jjug9yrvSDtcP+BenltutAJD24g05Ztlqtr6qGS1pNFsKv
         yQg+iMtkVbVvmFNzUUCtGlTafpeqfclzIegfQQ9/0jVHVEMaeDztbAxmwJK6eUG5sU+9
         t729R97X+jYHvkZJI87Hs1bLEfJj9F3YtS2ZpTACpByn7UHbTiZDbvgWe3b9Kdjkor5q
         kYEQ==
X-Gm-Message-State: AOAM5333inF+tvv0426pU5dsj/HPwsqVW0AqydzWNuXz1SyZR0S8SKFZ
	RuUQq2YeT32n650iJXmCFh4o+bfWLvqqLA+r
X-Google-Smtp-Source: ABdhPJzl+Xfe3pUBDjpVmZd+C+BA1tI2FPwW4ojS6nrsqJPaGXzyQE6J+SM1oK2oReCv0dPo0RhKzw==
X-Received: by 2002:a17:90b:3503:b0:1bc:5d68:e7a2 with SMTP id ls3-20020a17090b350300b001bc5d68e7a2mr24014517pjb.29.1646172015667;
        Tue, 01 Mar 2022 14:00:15 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 08/18] target/arm: Prepare DBGBVR and DBGWVR for FEAT_LVA
Date: Tue,  1 Mar 2022 11:59:48 -1000
Message-Id: <20220301215958.157011-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8rLtwRN1urXt

The original A.a revision of the AArch64 ARM required that we
force-extend the addresses in these registers from 49 bits.
This language has been loosened via a combination of IMPLEMENTATION
DEFINED and CONSTRAINTED UNPREDICTABLE to allow consideration of
the entire aligned address.

This means that we do not have to consider whether or not FEAT_LVA
is enabled, and decide from which bit an address might need to be
extended.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c002100979..2eff30d18c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6423,11 +6423,18 @@ static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -6473,10 +6480,19 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
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
@@ -6489,7 +6505,7 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
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

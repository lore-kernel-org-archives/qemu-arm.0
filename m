X-Received: by 2002:a65:4c4e:0:b0:375:5fb1:6a54 with SMTP id l14-20020a654c4e000000b003755fb16a54mr1387955pgr.231.1645655514467;
        Wed, 23 Feb 2022 14:31:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655514; cv=none;
        d=google.com; s=arc-20160816;
        b=ttTUoR2hgDGBDgilctfe9RkuU3CMN2SNh+j6Hf1/v7Pz4cMRjt773VVYuKmVbOHWE9
         TvkrslsA1Gw0Z9PbZ2c8C8FzoEZbEYyf+GpzeK6fo2dUW1laq4TfdFxnHOoufXzHKw3y
         1u+M3N/TpU0l1WeW1bTuyGSzoGc/A+tokvHq+wkb+FqSxnsRFZV7a/zhCSXP8fF3x9zm
         k7mRoX3UhuKQq445vBSiUg3IFGVD+uapqVjOyEgqN/rEXUOEmcVv5jEXZqOWWuEqfIYh
         1mxGtAuGc9TjCLZaJbTj5PU2lrGlFRPT182QcUqMotZjfx6yHuulAxUw+dDP9z08kqB5
         6O/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TmxawEn4TT//u8dncYbu6ycL9fZfNNpmMP+qU1HcQZ0=;
        b=Zc5OUKHQzeGLBECo5AObiYmqx67fN3LwVib8ImL6UO6uzs+KqaiXRl5fimzEjYSFTq
         600TF8RETcgw9CRVnn6+CxRCjeo1Y1NSVwQI4GxUkGh5IlkzNyLBz3U0BJWo9VJE7BHq
         qrrW+Xqkp4xhFC8mE+gcv9kEJGk2nk4xFc/HhTDiHEHiqmykJS444sqdHSFu/2X4P1kZ
         /3epxykSoxkCvnNBzDuF/6Gx7L05GEyOu0EyQjB1qsMeT5nBcpyqcJvUJIlXNBMuAHcz
         G/C3LDXDcYPln5GOcubmgGCVsmeJIJ0WtWGo/rc212eI1RepMf4K5RYhqoz9hHy2C+RP
         LLfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WMB2Erux;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gg3-20020a17090b0a0300b001b852d7bf70sor1939885pjb.31.2022.02.23.14.31.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:31:54 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WMB2Erux;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TmxawEn4TT//u8dncYbu6ycL9fZfNNpmMP+qU1HcQZ0=;
        b=WMB2EruxU8tOMv86xci1GCeZnQzzwlFrwKXA+WdpfLvaDMd4xi/hu+S3AJHqEVLv1M
         +1UJLNqZFjVUepZCpdlhMwT90DX7tPPYe65gi3PjkJbfQNpvq+oNB9utjhfCC/3W7aPu
         Op7qkuVLuKUejRkOh+zXzw1WaeTNaTD1MImlfuGaWb5HNjKHt5PwGaoFE6YzE8X14cQ1
         MP9lGdodL2GHUzi6ndbYxwCLOGcwBKXjc58ZtnyG2pAHW12HKc79UQ9MNk7zfXChoO5W
         9HKe+obfwnr6YGnN/WzxJHMUNJu9Qe/TQLpUBNz9RDIMV1qoKX+l64PGyvlEYlsElYo5
         fLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TmxawEn4TT//u8dncYbu6ycL9fZfNNpmMP+qU1HcQZ0=;
        b=KXpc5SrwP4e60thQuhpzwyzXKRdVU674Ka+GQdHUxt/19QXpkVuygN1QYpDPb+BZV1
         fPaadRXR5DTGpL6HKz4Sdu26Jho3l1DbtnhQBEz87h2yDwaCrJjpwWfttE63v61oqYvL
         q8O+RlrUp9DfLU2S4miQIzMJngZTccq/HhpQx1y0qAqMw3SP7bu7rS/0pqDzaE63ILy2
         1hNRzjBtJE+CtWlZW0vCd01CF5NCk6e/wmTt9Q16sSc7lGmjlPSf72qjKB3RdjsX1JGs
         wb/FICu6qm7kLuf/+DY6qSqBMc82Y7uVq4p5/rxOJpm5T3MwruNeR+A69axQVk4OIIY2
         hZBA==
X-Gm-Message-State: AOAM5332k/TYTkhorWfcJXlmeniO+DfPvlSb1kAaFATyRYopcf00+KH7
	jWhKKEnKYlV8P/yTSYozZvpWZUmC
X-Google-Smtp-Source: ABdhPJzrsrFx4RwHA0FAUSMfgVojhBCkRGPrQipXIYF3e0RTh/NJOVeTkxz70Z2rDG4IC9foRPFxpg==
X-Received: by 2002:a17:90a:4149:b0:1bc:ba63:247e with SMTP id m9-20020a17090a414900b001bcba63247emr964850pjg.173.1645655513960;
        Wed, 23 Feb 2022 14:31:53 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:31:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 08/17] target/arm: Prepare DBGBVR and DBGWVR for FEAT_LVA
Date: Wed, 23 Feb 2022 12:31:28 -1000
Message-Id: <20220223223137.114264-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: J+hbmSGcffwk

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

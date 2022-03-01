Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209769lfo;
        Tue, 1 Mar 2022 14:00:11 -0800 (PST)
X-Received: by 2002:a17:90b:228a:b0:1bc:7ca4:efaf with SMTP id kx10-20020a17090b228a00b001bc7ca4efafmr24171068pjb.245.1646172011609;
        Tue, 01 Mar 2022 14:00:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172011; cv=none;
        d=google.com; s=arc-20160816;
        b=vy1ki8lOm5Lde3ULtx4wf/kFjjtebGDq6zpYVWdvpbo0HX3WRiUv7BbKMZmDJmXAcS
         wn2VCMckc8LqFnXXD2IcuRcre5CZ5iZxnzUrjLiY49a07xAPioBEc644iXDy9fi9reo2
         I1fninr2kUx9DE2K93yDBqlh8XU2o1pD4qM+ZVUJ8nFakFx0744WEYYj/1BUi6OsR9iY
         CFPy7axmn6GvO+PPKO6Xfx3a6p3YgwM1dyV6Mao5wC3F4fK8tjeuTY08QK0xfc/vpRvv
         NDO9WB3908OQ1hslwxAxI1QTQ3Omk5Ij52YmazuFgzew441YBnVGbysJ0c4KxlBjhYMY
         MTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TAU62jUEHWqZmP/omH+DP65D27WXovgj7reF6QpCfzg=;
        b=zUvckGkOCFaB7QL/nqq9OJPudZZh3+2YRCd1pin2G/n73pYX39roX5HmoIqle2IalB
         ojA0Dea/Jwo7VDNhmtXJZ6cOlNevREwjfkXmKjMWsMcs7sgpyjLY4zpcdYbnmpQpLNV/
         pE1BYh0CVAJF8fwQD9E6MCGvaYXp23m0jjJTWOMeo4Kh2EHAUG6mUXd4M9mOkCXqt1dk
         6jNQT/XpnoOptvcz3AY50JVNqvvY8Gw9iQrHqjlmRZUjgtXlKv3N3XylX54FUTspmlUx
         3l9DWlFmDrhFlaIdjqAogym5TowwMO44yUaysCb7bRVpai7GPGcPHnbFRntr6XnOZ0rf
         cwGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lx/zx7CQ";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d17-20020a639911000000b00373d9816d81sor8300626pge.20.2022.03.01.14.00.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:11 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lx/zx7CQ";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TAU62jUEHWqZmP/omH+DP65D27WXovgj7reF6QpCfzg=;
        b=lx/zx7CQmy7S+laRnK1Ai9SXcDDOkBCpkt2dczgZncBdqZ8lXGbfpdGWs31V1X8yhG
         HclFvpk0Ug62EJjCY0ghcLZjHEhn6BXaNy8/kvFnsueZANzfl3nSXkPvA68mwGWrerQz
         ktk6iw5s7bn83YEOC0y8LK6wljjLWdFcr2X4SgkSnmBjH3zdVJLqdL0Eda8hnJ4fXkia
         gaEbT/+jERDSi0nEKZSaCLb2ZADCDgNYNnNfRsBzufQiDRduaHrfJkEdeVt8ajfUKmOg
         dWm3Tbyfp4xgU6Q89PT+L92eD57PnpWdpk/hXKuRpOeM/P7j6ATwF7TIktxUQ+gzKZDm
         Ef3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TAU62jUEHWqZmP/omH+DP65D27WXovgj7reF6QpCfzg=;
        b=sZgmv+lnvyhXIjpEm75LgpoeYIkeFMQm3ePU452NOQrOTFfofI/1vzI4Ayf38b/oti
         Cu6Eq2B1G7QZStv16J+XJVdwZRXGACOmNMP58gyuyAhPc89pxZC1HzJktVP4N/RrdHkd
         tF1RtoPi5jT+jAC4AtoPJTYDD258L/laSolwvV3dKK21RKxF5IKub9068nHL68GslyWO
         X6nx06ODBYiYOSt+N+SvjjEBmv6iAVHgO6/It2nvCR+25LGfU/tWq24fCKVl2ICeMxlt
         chVUku5uGtOBwkq5WujtR8ms7EAXvTCaQLCpSuf+a3JD0wi9ZwrG66sTuCmiFfEoGFdr
         Hxag==
X-Gm-Message-State: AOAM533SB5m3WI2XaKoDI/GaaK9iayf0SUv7NAPVRe5ZpHALgfhMxjMh
	IZY2kH0q6evoIyXuw4OjWWR1FsBu
X-Google-Smtp-Source: ABdhPJwK0vGv5f4s3xA2uSrWs43eUyFt+yvSf7JTEiAnizyYMy9tCvouJHferqBSVV1X978KmdJePg==
X-Received: by 2002:a65:6d0a:0:b0:373:9242:3a13 with SMTP id bf10-20020a656d0a000000b0037392423a13mr23744681pgb.452.1646172011103;
        Tue, 01 Mar 2022 14:00:11 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 05/18] target/arm: Pass outputsize down to check_s2_mmu_setup
Date: Tue,  1 Mar 2022 11:59:45 -1000
Message-Id: <20220301215958.157011-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ilzBmPQ4nlMf

Pass down the width of the output address from translation.
For now this is still just PAMax, but a subsequent patch will
compute the correct value from TCR_ELx.{I}PS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 71e575f352..431b0c1405 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11065,7 +11065,7 @@ do_fault:
  * false otherwise.
  */
 static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
-                               int inputsize, int stride)
+                               int inputsize, int stride, int outputsize)
 {
     const int grainsize = stride + 3;
     int startsizecheck;
@@ -11081,22 +11081,19 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
     }
 
     if (is_aa64) {
-        CPUARMState *env = &cpu->env;
-        unsigned int pamax = arm_pamax(cpu);
-
         switch (stride) {
         case 13: /* 64KB Pages.  */
-            if (level == 0 || (level == 1 && pamax <= 42)) {
+            if (level == 0 || (level == 1 && outputsize <= 42)) {
                 return false;
             }
             break;
         case 11: /* 16KB Pages.  */
-            if (level == 0 || (level == 1 && pamax <= 40)) {
+            if (level == 0 || (level == 1 && outputsize <= 40)) {
                 return false;
             }
             break;
         case 9: /* 4KB Pages.  */
-            if (level == 0 && pamax <= 42) {
+            if (level == 0 && outputsize <= 42) {
                 return false;
             }
             break;
@@ -11105,8 +11102,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
         }
 
         /* Inputsize checks.  */
-        if (inputsize > pamax &&
-            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
+        if (inputsize > outputsize &&
+            (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
             /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
             return false;
         }
@@ -11392,7 +11389,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     target_ulong page_size;
     uint32_t attrs;
     int32_t stride;
-    int addrsize, inputsize;
+    int addrsize, inputsize, outputsize;
     TCR *tcr = regime_tcr(env, mmu_idx);
     int ap, ns, xn, pxn;
     uint32_t el = regime_el(env, mmu_idx);
@@ -11422,11 +11419,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
+        outputsize = arm_pamax(cpu);
     } else {
         param = aa32_va_parameters(env, address, mmu_idx);
         level = 1;
         addrsize = (mmu_idx == ARMMMUIdx_Stage2 ? 40 : 32);
         inputsize = addrsize - param.tsz;
+        outputsize = 40;
     }
 
     /*
@@ -11511,7 +11510,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         /* Check that the starting level is valid. */
         ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
-                                inputsize, stride);
+                                inputsize, stride, outputsize);
         if (!ok) {
             fault_type = ARMFault_Translation;
             goto do_fault;
-- 
2.25.1

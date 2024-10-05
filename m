Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147703njb;
        Sat, 5 Oct 2024 13:06:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZg2tsjs59YSIMNDXrPgm4pM5bSiCTQzgo2Nf7/vB2zrgPsv3nnns24aXPMpQa9fnqwj49gFV+3q1olw==@linaro.org
X-Received: by 2002:a17:903:32c4:b0:20b:9098:4693 with SMTP id d9443c01a7336-20bfde659c8mr100952855ad.5.1728158776174;
        Sat, 05 Oct 2024 13:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158776; cv=none;
        d=google.com; s=arc-20240605;
        b=lDGSsd66bGuIDPGjZ6BBRSVVfunPLAShJWhaFNve5nsIpjB2cPtptNCYTeeswhLXf/
         fv0dbfWh0UPjf3dUbkXGk7a4bryb1inErKEfcLhtY7fru/mwDOHZKdeH79ans28EYKuV
         Kr4Wg/yQtCv8pCGT8K0jWkpCw5JFqKxi33lGNBPWMVCVV+VV/4cMZk+qmcHeWWpkejIf
         i5Qyf50i6rbvn6tPx1EneTuDfxpJzXFoFmJo994huTyTfrngAlUmkr7tj0QGpZH/V2Wq
         PdySsexP2YCrgHib3Ffs9ShzC0qSReeavAcSflVUMxRFQXL2Z1JHxaxDPPie7LUDtiPR
         YzPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4X5zP7zXx4H0vSkmfgBSYylbUDArgVMPw2dfqzvhfaA=;
        fh=oLnRyIkluKvUPKDWQOjtVNJmFzvBvuFx3Vc4RwS7XZ8=;
        b=IxDsLzbdbrW9ffGJDFolDXuOmQGu+QF7CPWRx7NNK3Cxo6Dn6HcKoNwr5uYoSDOdv7
         tM/xqk04fa7MP0K22MUfImLCJE/1Q5b01AT/VKzX1Ry4ohX1kpeN6K6cmnYeIBEsg60n
         HzvdM9vkXV5PFd4Q1UnZPj8NClYYu/9ZrKSePtYbrSCZDUKBZa1mjai2jlnBwbYnQZ/D
         9gCS3n/1BExdX+qtFH4I7o0kyj9yndHIyapyKcE/ZNPkENg3GV2+pz4glC23UYoOU4ys
         6m1bgAw+tZtv3dwtTwK4eyZDnrlO0mKISTUWEBJ4PaHmfOsVX7oka8h1iA4tSSz8o3oM
         ed+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FBIzsV/5";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138f6691sor17053875ad.11.2024.10.05.13.06.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FBIzsV/5";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158776; x=1728763576; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X5zP7zXx4H0vSkmfgBSYylbUDArgVMPw2dfqzvhfaA=;
        b=FBIzsV/5hI7E45zoZoL8UUIr9wua6oD2Cq4ABAmSVGGQs4b3bIRuEBLFBmJOR6gfWN
         3grAPMWBoJKjvn3FGjkeTTDxbUmjSW5aQdiJzYdvidBPkckCePYTNq1Fvo8iyUn3COLS
         wEctKCuyZpRaY/Woiw1myukkJBcrCra4XE3swcqpW/YhAsD2zCxAhj6sQ5SvSQf89wAS
         f3HKKHewbW5vWWJM4yfB7tvWKJ4u35gE73i0mKke6piGmow4DBKRZ5nMEyHIpf6ABXxk
         uNx/83nVduNt+PdCuMHYC9e0ypkdIDcl1UOjV+RsvZe95ChUGYrjRTJ4PlwZzC2+RzHF
         sdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158776; x=1728763576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4X5zP7zXx4H0vSkmfgBSYylbUDArgVMPw2dfqzvhfaA=;
        b=ca82BVf7CMqEf3zT7Su87OYF3FCHOuhAAO214K0cWwkp27yxBkCkRE3drMojip6/QH
         8Piq5edyCfVPNAYABTvND2wH/hhnJckBD+ijn/Yf6jU0u8NgCZChZhZgH+O8mteRNiZw
         mreeFpuwnUQDMKNqGLmEBL81AwvL7j2RfXYyjwvzMjqolF9x5pYTgj/gBGpfyidpxT2u
         EjB7vsdFLSdEYi0QW8wc7+w5BUVENKdiOcH+w4xdOsMPilhI+/uv3OPevgWHGZTv0331
         yE4ckhNWQ+rwslCA8UoZk9wFBr7Je6TAjDqfkQp+7UUCuttOUPrzXjUDOxO5j8oVwTu0
         cVKA==
X-Forwarded-Encrypted: i=1; AJvYcCU+Ag2yeCTq+6otfg3cojlx5oePGLeBgKEM5tr1vbq5fkU3T4418GojHQVnBOqgu8sF08BUaIgTLNgYRw==@linaro.org
X-Gm-Message-State: AOJu0YxCcWWLLgAJB5gZHuXyTInKuff2dbpcfITbkfH3DIVRWJ7DIIJ1
	NNJAaL1Pw4XGbJzo5xKTDpJUIkxwPLJMxmOK401cNrxgXShic3myK0Z416NRaEABhQ==
X-Google-Smtp-Source: AGHT+IEx5vHtVkprUThlZwV+Lqo7Z029AoCfFZ0CZWDgQlrwN//FsMIaExtuwtG6PQ0wcXYm3ZJH7Q==
X-Received: by 2002:a17:902:e84f:b0:20b:b7b2:b6c5 with SMTP id d9443c01a7336-20bfee383c2mr91865325ad.54.1728158775790;
        Sat, 05 Oct 2024 13:06:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 15/21] target/arm: Pass MemOp to get_phys_addr_gpc
Date: Sat,  5 Oct 2024 13:05:54 -0700
Message-ID: <20241005200600.493604-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: atxonzTncdVL

Zero is the safe do-nothing value for callers to use.
Pass the value through from get_phys_addr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9af86da597..e92537d8f2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -81,7 +81,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
 
 static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                               vaddr address,
-                              MMUAccessType access_type,
+                              MMUAccessType access_type, MemOp memop,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi);
 
@@ -579,7 +579,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         };
         GetPhysAddrResult s2 = { };
 
-        if (get_phys_addr_gpc(env, &s2ptw, addr, MMU_DATA_LOAD, &s2, fi)) {
+        if (get_phys_addr_gpc(env, &s2ptw, addr, MMU_DATA_LOAD, 0, &s2, fi)) {
             goto fail;
         }
 
@@ -3543,7 +3543,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
 
 static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                               vaddr address,
-                              MMUAccessType access_type,
+                              MMUAccessType access_type, MemOp memop,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi)
 {
@@ -3641,7 +3641,8 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
     }
 
     ptw.in_space = ss;
-    return get_phys_addr_gpc(env, &ptw, address, access_type, result, fi);
+    return get_phys_addr_gpc(env, &ptw, address, access_type,
+                             memop, result, fi);
 }
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
@@ -3660,7 +3661,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     ARMMMUFaultInfo fi = {};
     bool ret;
 
-    ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, &res, &fi);
+    ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, 0, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
-- 
2.43.0

Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19474njj;
        Wed, 30 Apr 2025 23:23:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCIwsERnuGFGHjSP1OLaalzKXeonA+13AlFYjXm+ZjsYUWnLxyKkftK2kQYhgzQraYsTDdepSvYtM3Ig==@linaro.org
X-Received: by 2002:a05:6a00:3987:b0:73c:a55c:6cdf with SMTP id d2e1a72fcca58-7404775cd09mr2293503b3a.1.1746080632818;
        Wed, 30 Apr 2025 23:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080632; cv=none;
        d=google.com; s=arc-20240605;
        b=lcHK3NeYupcngZwlCMyzo0XRFBYSnvJ4OCrFk0qNO6l+VC7bL3eAVnRslpOJVYlt24
         g8S0DFJYxZKcgPkcTMEJcI2qv5WZNHN0bWtYUkDmmLCzeX7IDt+G6Rz8BEu88hjfWKCe
         vP9pt7Zzn/Z4AGB9N3KDxEkCD2DQn5RQWr0bO0WKn7ywwZiATJYXSy9dz/aCfOv62jp/
         5RNcQek2ADFkK40lpwzCe96nrYGJ1t9a9n0NLXb9MVoeoh90p1oalAiFb9ZUXJnGay0/
         SwnwPYj8KJeksk5BW7UImN8cL1bgCTHGrK4NSrxmYtxfD1cg5mICgjoC/wQM75A+iF9k
         mYBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=v1JmSJqnxYquNU/v4UOEtwOcqbxnEb6aDiKyyBWqJ6s=;
        fh=/HAGe46gOeNkLXwORnMfA6DcxWfej4qaYrtjLUf4Yr4=;
        b=JSvClkuOzmgmg2SvVD7FMgwG7fi4bvTzQmn6MOcNTwuSDC+xA32ntBQJJ+JiAtPIh2
         ckHKhJcsrxWLodOY8dvHEPvCzjC5zNH2ZwCRqWLUnujjICTiXkJJZg/FMLEC0Mb31qfo
         c6QIe7HvRYFI2FD12CiQasPmUUJUXs1G7eM/xkgWxYSgX0roIyyOuMIbzPctC0LDon0L
         vbsbrnnfEnWw5jL4GdBwSQQY+aCRWknwD/f7Q74uiiwaOUVSXmBCL2raPeYCCuu1R80W
         RKMtduU8x8uxfSC04hAyBtv5tNe1h8lJ5M4vkacYFmb+kkHyIjWBQhMAOnr5D0JpFnPf
         ShoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CVUSI3Jc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404e5ab54bsor126762b3a.0.2025.04.30.23.23.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:23:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CVUSI3Jc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080632; x=1746685432; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1JmSJqnxYquNU/v4UOEtwOcqbxnEb6aDiKyyBWqJ6s=;
        b=CVUSI3JcMBN04768WcnKMXgRafp2FRoC5PVkZFVzNQ/hcN44R3UzTDGGsedAOA6jVW
         UPAZvImZ0shqPxZmNkoMP0huyd8aS836AnaHkHBopDuoAp//5tyXrlokcxb0C/Lrm4l/
         EP6l2UMyLbimu8y34qW/LwXfnOc6xjOBJL7gXASth4CHBsUdFWQ7CKT4SOgfpgkB4VlM
         0DRm0os5ZGKKpORgjH/LeLCd12mrBdNdKzEaRvLs5hlNzafYZkEpdP1mimiBTgCgInPz
         tiZ/Ee+/IYp5gjJpm0Mx5OSnvp9XJTuCnWrPlZc4t18oupDA/Y3IAzXosq9ngDnexVv0
         A7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080632; x=1746685432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1JmSJqnxYquNU/v4UOEtwOcqbxnEb6aDiKyyBWqJ6s=;
        b=qQmrrVHX7V4ffiK6IxR3brHPl53X3hzepuMIFxPo3fMdNHNSjxzWIVpmNCEAchbPlg
         ea98QnOIWccYMrXrk1AVBjYePN9IME4YUwvFYNU5DbHzjkYYQxKwrjXj/OcbKd5P6i8D
         17UAePn+zmhl1PAsuMBVEupskvLQuIeu4c4wZ5S+0p1DvsFWu+zTLaLwTNBF+n2S612m
         Lh6IWiuAoKny/0+JVwcePy/4buOls+Hd0LaD5UGjEmsSU1zd1lAqdX8MFEH7U/LG+owR
         Cob6sTMA50zqq/rxLQzXO5iO/6yUIjx3dvfaBNza+t8XnK/jFNKNSs2vHYsUkUbL7FeV
         Hj3A==
X-Forwarded-Encrypted: i=1; AJvYcCXhcZDaASsQiy0oo4Dw0ih++7ObsuGOv3UeRi/Gtj4xezCXNud2795fwZzO5oavyk0JNi5ktZYcZQOtGA==@linaro.org
X-Gm-Message-State: AOJu0Yz+6PVa/hBwdccy769lI5QBB6LK6VYvIGbQQRX2du30yQyIUilj
	GtpXuGhKvLoAxwQiLoqVGsqCAZRj2MezL3RhA6lfA0aq/nNBHYfZhDROlpm43S1SVQ==
X-Gm-Gg: ASbGnct9igjZnrg+9AMr/BR+9X+dMmjYKrJesG66677H671alCOjpjXtDyU47JdTRuw
	Fl0Bwa/E9Xo4HwR6geuLh2/1KBUDMkeWgEfZyj/V56IdxHJluS6d6HUUzxvndW9T+f0pqeWcCL8
	FaTB5lzgdKUxMuWld2yyTFoRZS6zb6L2scMf0d5NpWNS3BFGeiGINOm0shwO75hlEK1hjCTLjgZ
	ilXaWKfBbO/n8Ls4rYcEjF3sihRwW7cJcjqkQ3+jfS5tGdh3ODPXlDN3r1MtecAxn/dCUBjbHwP
	TL892f2wud4OaS3m1QVQnT+nhWP+PRIEcu+SrbyoDsVhs+6sYF0=
X-Google-Smtp-Source: AGHT+IFOfDiSKDNI2z7vj3bMYhWzkjC1FmgVSWCJcnFqyW6oYKX9smD6/m/Yr79c3SgHzyGvhdUaQw==
X-Received: by 2002:a05:6a20:7d9b:b0:1f5:79c4:5da6 with SMTP id adf61e73a8af0-20ba6a181acmr2684589637.5.1746080632405;
        Wed, 30 Apr 2025 23:23:52 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:23:52 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 01/33] target/arm: Replace target_ulong -> uint64_t for HWBreakpoint
Date: Wed, 30 Apr 2025 23:23:12 -0700
Message-ID: <20250501062344.2526061-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wjNTcmigQdf9

From: Philippe Mathieu-Daudé <philmd@linaro.org>

CPUARMState::pc is of type uint64_t.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/internals.h   | 6 +++---
 target/arm/hyp_gdbstub.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 4d3d84ffebd..c30689c9fcd 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1949,9 +1949,9 @@ extern GArray *hw_breakpoints, *hw_watchpoints;
 #define get_hw_bp(i)    (&g_array_index(hw_breakpoints, HWBreakpoint, i))
 #define get_hw_wp(i)    (&g_array_index(hw_watchpoints, HWWatchpoint, i))
 
-bool find_hw_breakpoint(CPUState *cpu, target_ulong pc);
-int insert_hw_breakpoint(target_ulong pc);
-int delete_hw_breakpoint(target_ulong pc);
+bool find_hw_breakpoint(CPUState *cpu, uint64_t pc);
+int insert_hw_breakpoint(uint64_t pc);
+int delete_hw_breakpoint(uint64_t pc);
 
 bool check_watchpoint_in_range(int i, vaddr addr);
 CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, vaddr addr);
diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
index 0512d67f8cf..4d8fd933868 100644
--- a/target/arm/hyp_gdbstub.c
+++ b/target/arm/hyp_gdbstub.c
@@ -54,7 +54,7 @@ GArray *hw_breakpoints, *hw_watchpoints;
  * here so future PC comparisons will work properly.
  */
 
-int insert_hw_breakpoint(target_ulong addr)
+int insert_hw_breakpoint(uint64_t addr)
 {
     HWBreakpoint brk = {
         .bcr = 0x1,                             /* BCR E=1, enable */
@@ -80,7 +80,7 @@ int insert_hw_breakpoint(target_ulong addr)
  * Delete a breakpoint and shuffle any above down
  */
 
-int delete_hw_breakpoint(target_ulong pc)
+int delete_hw_breakpoint(uint64_t pc)
 {
     int i;
     for (i = 0; i < hw_breakpoints->len; i++) {
@@ -226,7 +226,7 @@ int delete_hw_watchpoint(vaddr addr, vaddr len, int type)
     return -ENOENT;
 }
 
-bool find_hw_breakpoint(CPUState *cpu, target_ulong pc)
+bool find_hw_breakpoint(CPUState *cpu, uint64_t pc)
 {
     int i;
 
-- 
2.47.2

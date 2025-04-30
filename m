Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1004524njm;
        Wed, 30 Apr 2025 07:58:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3+8Aafny9NiLPR2uCDA1wbomr4JjPkwajYdsAJLC59DuZXUx9zVVzlaw0ozWxMVxRl7zT0Zht0rxKOQ==@linaro.org
X-Received: by 2002:a17:90b:2e41:b0:2ee:af31:a7bd with SMTP id 98e67ed59e1d1-30a343ce7ddmr4415122a91.5.1746025132038;
        Wed, 30 Apr 2025 07:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746025132; cv=none;
        d=google.com; s=arc-20240605;
        b=d9f9vlYB0z680i7nUrKxPVser2HhxGSXn1jK4R88Rt0Gno23FtCbdmb+HYtwJbNlt1
         0fFJWzx+6iioHs1WtgNZJt14CsfwNlE36Updf9W+MCG6qdY4Fa9HlbHvyxRiUXlqq/wI
         xgItw/ZuTcbhoc1yweBBkzwY7NbokyBYJCw0U6PPAOxPVf87qw/isinP/IDUIHFM4SkP
         9autJzQjWxriRyyODn2pKASd9I9qkn0L+m0gp7JdzxmFZuhZ/adp+3R4Xb3L39QnkoCJ
         XUsGxu0WTR7WG8i0w3lSppOsAsS5vAJHTSAkrTz7tPoK0ON38JrRG11Gypmy8Fiyw6A3
         dfIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=v1JmSJqnxYquNU/v4UOEtwOcqbxnEb6aDiKyyBWqJ6s=;
        fh=TAsr/tE6UKoBjgrHfmCvOLBDEmXYT0E5OhyQ6gtUNGU=;
        b=hnuTaxXzw7+mclZTyfYSG2lqz4DcrNbUTAnLJUT3+79+W/QMWJWa6RGSI037Dgt43m
         H9+PIODuBWjcKBzfizsG5KvruazAlZklzwpfXpaKd0qwnG8sAN1t7vCdZbTiqi7xf/v7
         FUyPaSWNs6kREoP1IPpU+oD3gYjGV2U6wG2XMA02GXZSO5Y5aw5D07DY43zHa/3rfPPO
         anqDYh0Hy9AuIDaS+y+kMetdzLmM2IK54/JgXHfIn2sBQY1Cv9AZo009MN4KO8VpBi4L
         RqQ5ytSEXiw9BPu5836RHm/SbRZufqhXOON+cETwELKDqeFfF/fqpmTADZRinH2mxwkB
         shEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hFypoqO2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-309ee84891fsor9288615a91.8.2025.04.30.07.58.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 07:58:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hFypoqO2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746025131; x=1746629931; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1JmSJqnxYquNU/v4UOEtwOcqbxnEb6aDiKyyBWqJ6s=;
        b=hFypoqO2tVHilfiDJSp4QAwzaVNvdfESu4AOP9uvGtXiwHyK8NkEEJ+u8+GTmr0rig
         oV1Hm45yKmq8dT1wq88IJHxyfoxo+ZIPm5WX507vdf6b6NOHprqUuLQOVdlfi/5t28/O
         sF8/nsxpinXocuuyQWIRjQPvQvCWZMtZ91WekqRG6AFiLsecokSEHgRvyR5bTuPRlUOt
         hjWpm/PM8V0EsKtRBmRdHmvWrcgTreDHAkmv+8fVQNRboCIorMf788AvmnRietqDb0eY
         byN/3euGXi8f6iJCG47lG5eiMAWfF5O/ypj1VsB5xcHg9x2t9j7OXqFQXEFvsh3pHuYF
         2img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025131; x=1746629931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1JmSJqnxYquNU/v4UOEtwOcqbxnEb6aDiKyyBWqJ6s=;
        b=Ntg2yIGENP0MHpPKs+SxdDmpxGTspK0R/UZ86o/YQ5RQNEOglNeDR9E6q/lQD2joAl
         UKnHj3H/a8A445DRVLYZzlqBqX23SJmm3/ZkJF/695RBgUksSdRNdPECXRCcEDZZM3q4
         jAHl9XbI3H5qdmeSMldGzlObnNMOybwS5yA21rG7qpW+0TUZSv0b7FKsYVFi3hm42RNj
         JMOpEDImwBv+hJXQsKJAm8c7A4HYRJoa2WZXcgpvqzSuQsq+GlkaWCuVOY1DDVoD47A9
         9xVdF2xLMaP+7LI/JExmvMSUvF8NUAr/MloSv1uwMRaiY6kZLkW9s23uAm+9K0HaEBpz
         03+w==
X-Forwarded-Encrypted: i=1; AJvYcCUzfGHAcBPw4Tby9w+R7d0JS1ITcn6r2breAXUCwGEQPsdZ9ZxD2gUvIWKLnWRynh8TywxX6J5KRYsY+Q==@linaro.org
X-Gm-Message-State: AOJu0YxSl+o+ExguJBCLwsaJN9IQWg9/ogQKu7GMjVUf87hEoTy7jmpZ
	32KGH0IVXR/kyRhqLecOkA96HpRHrqrKtzKZ+8eSomrZqM7+NJzPDHB83xJiJu1VOg==
X-Gm-Gg: ASbGncuZjdT5Ft3hQLAsHNE7QxyKa65tSWHfko5Bx5PLsTfsx/5kX+n41KPrIut6j5Z
	34QuNLEMp1mVmWrihNQMtZ+k4KseELUisdNnr0DjKjScAgyuN2JYvpOm4suuZfUVP4sat7oyQuh
	+hlbz36PM3kQi0hmE6GzJAexgda9bZS2d9l5aLHXHfbJT/pb4mgHMPU3ZWSEgRRgOFosVtx+qS8
	8Hzd2TpL6Wkuekygbs1qj4K+kJaVOLgGTxyeBhCmwjgtUNEG1ITz14Tgyoe06AfYWbtqHGIyJbd
	Elo8r6rdg8KI8ms/mSgUqUHb9JbXJiVkF8akChdS
X-Google-Smtp-Source: AGHT+IFi3zhIVBlI4fvnZXF3ndodFDug/+ZjzkjEgZ4p9GMyQhZU6U0C5qlme+C9qszLASfwf7Vv4g==
X-Received: by 2002:a17:90b:3504:b0:301:cba1:7ada with SMTP id 98e67ed59e1d1-30a343ce72cmr3932692a91.1.1746025131606;
        Wed, 30 Apr 2025 07:58:51 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a5bd78sm1705652a91.42.2025.04.30.07.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:58:51 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	anjo@rev.ng,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 01/12] target/arm: Replace target_ulong -> uint64_t for HWBreakpoint
Date: Wed, 30 Apr 2025 07:58:26 -0700
Message-ID: <20250430145838.1790471-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: odZo8ZXtTCMB

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

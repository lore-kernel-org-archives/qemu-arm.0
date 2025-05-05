Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778127njj;
        Mon, 5 May 2025 16:20:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSn5CgOcghR/+emmOWtYHzKqhRUFqXZ8q+hcyiAKKrvcKAvFv4/1Rjkrgy7BGWzTMb89/Ncr7yfFnOHw==@linaro.org
X-Received: by 2002:a17:90a:c884:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-30a4e5a50bdmr20947859a91.8.1746487222024;
        Mon, 05 May 2025 16:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487222; cv=none;
        d=google.com; s=arc-20240605;
        b=A1oebMxMDnyjEtCAeO97byAAfrY7VM+tGuby1eMJJ0g8+OVocceGNPtOpAWr/dnV28
         9DZmBfYk/2ren2+/Ngpiee5flZQ45izRLB5Mu83pgG2zcMLZo5v/YTxmf1s8GRMyI9W8
         QC8PueRRKwFU/f9+RJeDZSEz0HmQgm18TOmroaMxF/FO+AEXwnUhjDamolAOAh89mgZw
         WFIxkF/B5uh76c8wAAXLvORiF32g1MCL+951PsuoQBxjDd88aIQCc6sRg8YXdEiacA14
         wW0XaMqy1nEq8Nr43F3opcUEIaKYZETDh3MPnwtTKKfSGTU1W/dchTbXAjVU5UzifoAE
         EFOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hghY4IeLObm8ysFk0eCwCGh3lWvsG0krLPTha8KLWmo=;
        fh=GL6Nm6qIjiSBhu5NIv35VOnHaI0kuQJeb9u5qJM5YYc=;
        b=MoWqkQvi/4NKg2KxQjiMZulLzasUF8Fsq8h8L71XERH9qfAkeDdUTzNtLDm/P/OTq/
         TLsH33uuHBaIwVaN2heuiP/1RskMtVEP5j15nFdteYl6RWSyAQWI2ZItwT/mz+HbfbPJ
         6Fe+3rLmTjhhVjlUZVr44ykSZlZ2avxcyl8nTw7S8pdfuZB34k0xp6ducqbEx99Y6XiB
         XM3AXcCw9fMcp/EG1PuiAqAb2BAotq9n/NhBGHE3QQNMncXIigLUWx4BUWIbTfle3NfQ
         Rv2ptSIOg3FFQY+aacfpeQW8jr4vdnyIcavJVhU7DHB16yjX76E4XCC2fK7lg2i135Pd
         d4qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ut6aeTEJ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30a47462c44sor6644904a91.1.2025.05.05.16.20.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ut6aeTEJ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487221; x=1747092021; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hghY4IeLObm8ysFk0eCwCGh3lWvsG0krLPTha8KLWmo=;
        b=Ut6aeTEJyQINRZqDoKP/pIWMw9SMThSi4h7UBXGTudOcsVlkFPGsouArlQhoXdCID+
         S2WlAvZ1bWl0m5ujjzzlr5ho0xlLrvfaZ3tseN3KdYZA7kFuMkY4bzcvz/qyel2h4mrX
         2IUUzVGOVtSvqFy4jmSzXONCEbMlDbYS+VbZ6MwLJSbO2loqu/tjZcyT5BfwwWs/b38d
         GsVIAuMnIJPs5XbJ11mXn40pNl02Ye1yHGvpDpJrf/7Bugn+/nHkw43uNNK+7RymxcCC
         xQaMqdQ1ty5EJsU7JoY5iGnx68zWYIsYptaBpYvZ+DhN+TGDtiQ8SvAcY8ETBvf8G60Z
         f5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487221; x=1747092021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hghY4IeLObm8ysFk0eCwCGh3lWvsG0krLPTha8KLWmo=;
        b=kREwdi4e+nHqlIw+vjFET7OgktaA7x3A3/xk2LGotm4zQwEtJ3aFz1+Q0H7BapO9cw
         9mtNtsyIpuTj7AoPJUUp0hxw9uZKuORWZWSOxxN/c7VBp4pG6Uq1D2mCJivfMPxFr5Cr
         EvWqRIUTXLNkITI9fOHG7a00V0MYBZqaiap7A8C7Fw8Y4ASKqC2jMjgytwhE5HBchpQj
         I4SS3beivKfq1bRPsaDf+bFeAZO9nP4c249SSHIn04WFFhSdo79erapA0akFFWe93ULL
         s28bstSbaFDpogzrEgZJ/1pszRedCkTN1w+gBoMmQeTQyne4OXfEahJuukzI+FhmSCwy
         +hSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJU1701IK5CTitE8yCdP476C7SHHLIdcEkB4OM3+QAcSGb0mQaKm030cepkogRIaV5UEhvYSciPhhsgQ==@linaro.org
X-Gm-Message-State: AOJu0YyJkavEgdB1D9eqIUFcwRp3GianW2vc9L7ZspDLVe2uBR2J046I
	CIK8LctI+8IFG8FbuK4ZT1uN/Sr2ZvUfwy2boDVZYYvycS9qMZJn5DqJbOctturgkA==
X-Gm-Gg: ASbGncv3qUfXPcNNUyGPLiOQQQ2JXUFx2VlKpSSQq2jlse+7BhL6+tDQk7BFWAoCnxH
	YYIYaYwHvemfnqFbUcz971OcmMzDGS/NovMX+XhnqvIU5A6RkGTA9S9vKMVqkFLfYO4DcSe/g9m
	SY37FlwIKoxrtmNrqByGeFJgxh7jN3uJ3mXFM6K0NDitqERskrdNBKx8VpgSVI5kZ1UIYWDr4qB
	YZ+pKR6yJco1vf1npMNpc5ZYzqlhhe9Lpeo3guHHHze4+4fVQwTm5X6vbFasREKX4FV8tCIgcI1
	V7nm9WHfwbRkUxg48wYv3zcBiGh9kiArJc5qn8qJ
X-Google-Smtp-Source: AGHT+IGyW/h0d+P++2N9HLg6A6FxaGbouVs5I8Cg2OUIrJYht0qMsNp9z55lD9B0AK5WzHNucV8FRQ==
X-Received: by 2002:a17:90b:5824:b0:309:eb44:2a58 with SMTP id 98e67ed59e1d1-30a4e623cb7mr18849133a91.22.1746487221594;
        Mon, 05 May 2025 16:20:21 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:21 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 01/50] target/arm: Replace target_ulong -> vaddr for HWBreakpoint
Date: Mon,  5 May 2025 16:19:26 -0700
Message-ID: <20250505232015.130990-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XaDuck/7Qf2C

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/internals.h   | 6 +++---
 target/arm/hyp_gdbstub.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 4d3d84ffebd..79a7449041c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1949,9 +1949,9 @@ extern GArray *hw_breakpoints, *hw_watchpoints;
 #define get_hw_bp(i)    (&g_array_index(hw_breakpoints, HWBreakpoint, i))
 #define get_hw_wp(i)    (&g_array_index(hw_watchpoints, HWWatchpoint, i))
 
-bool find_hw_breakpoint(CPUState *cpu, target_ulong pc);
-int insert_hw_breakpoint(target_ulong pc);
-int delete_hw_breakpoint(target_ulong pc);
+bool find_hw_breakpoint(CPUState *cpu, vaddr pc);
+int insert_hw_breakpoint(vaddr pc);
+int delete_hw_breakpoint(vaddr pc);
 
 bool check_watchpoint_in_range(int i, vaddr addr);
 CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, vaddr addr);
diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
index 0512d67f8cf..bb5969720ce 100644
--- a/target/arm/hyp_gdbstub.c
+++ b/target/arm/hyp_gdbstub.c
@@ -54,7 +54,7 @@ GArray *hw_breakpoints, *hw_watchpoints;
  * here so future PC comparisons will work properly.
  */
 
-int insert_hw_breakpoint(target_ulong addr)
+int insert_hw_breakpoint(vaddr addr)
 {
     HWBreakpoint brk = {
         .bcr = 0x1,                             /* BCR E=1, enable */
@@ -80,7 +80,7 @@ int insert_hw_breakpoint(target_ulong addr)
  * Delete a breakpoint and shuffle any above down
  */
 
-int delete_hw_breakpoint(target_ulong pc)
+int delete_hw_breakpoint(vaddr pc)
 {
     int i;
     for (i = 0; i < hw_breakpoints->len; i++) {
@@ -226,7 +226,7 @@ int delete_hw_watchpoint(vaddr addr, vaddr len, int type)
     return -ENOENT;
 }
 
-bool find_hw_breakpoint(CPUState *cpu, target_ulong pc)
+bool find_hw_breakpoint(CPUState *cpu, vaddr pc)
 {
     int i;
 
-- 
2.47.2

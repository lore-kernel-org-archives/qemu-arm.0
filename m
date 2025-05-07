Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94224njb;
        Wed, 7 May 2025 16:42:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0eORKBkWbLZ7EBa9iPA+/oFmuCIkVWnBRolS5dYYAQ1EYu0kUPvokZKgaHJynFfcVjHr/iVsEr/nOCQ==@linaro.org
X-Received: by 2002:a17:902:e742:b0:22e:4db0:6b2 with SMTP id d9443c01a7336-22e5ea38b67mr85005035ad.9.1746661364810;
        Wed, 07 May 2025 16:42:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661364; cv=none;
        d=google.com; s=arc-20240605;
        b=g7Ld7rLEtihUJPqnaozsRo4iDFcTP4fyCQMpJrvTJbOdk6rLtDubZ+SH/VcS/obt44
         IbnG1N09empnhuB1Xhk4AfzlZQeemBMn+C2rN14X86AioM5yttEdMqiLRvk0IXQAo54A
         2KZ62EM/VleMnRnYXz1SHeAz1wafdyeIk6Swj3VRrErJOO789c+6AKm46f0z21lu5pvz
         pUzDOjbNmEiDbmuepmJ+rsrKS8NeVLlPgixOMb0M2IPfRhvtZdOZCUlp9KQn7q8w/Yxu
         VmuyftpfTnHDDmpmt7cO9FEWGNlUjy//+S1/aynWWosXpjY4HsgK2NKKKNtg8/zCdXGs
         uAuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+wT6DnXqbX5AENDmRydoGeLBXcyCT3Vy8ui4SCalzaQ=;
        fh=rVJyypUOgGSXauJ9qBTOF67BlYpVMpDXcP+zEoLeTto=;
        b=BZJ844QdgX0GvD5VLn7xGSlHLjHClv5m4C2F5/kCnBiM3ZD6o9F/N/m4iddd0+KtY1
         u8DBcGARRrXH7wFB8ZTVyc6puB3geT3jI8GiPGx2seg6eCXfvE0QMdej7QNAuAKloTnp
         tGhxalElRKpIkRxPXiZM5w4bJeNDahCi5w0aXpqveOUpsdtfvLe0ZJQtEyF9im3EgDWN
         NpI1xsIZdc1ADqmFGt8H+DLqmC0ZFAUVjEUaKPbNwUjDIB7FxyzUTgevepsWgN4RuPt3
         GgqpTz7a4LhCbLbXILtxFaC/DFokBj3KRSPXaGL6QbmYPwvhT2e9BFxjfImJIlIpHdJf
         CNOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bKjz6kNk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e7e9e08b7sor8127175ad.3.2025.05.07.16.42.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bKjz6kNk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661364; x=1747266164; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wT6DnXqbX5AENDmRydoGeLBXcyCT3Vy8ui4SCalzaQ=;
        b=bKjz6kNkPIEvrfee4nUzyVXMdFTTvskrcNQNfrpPiyZcLYfEUWUCoVpcO2NxPldOef
         wHkRjsH4FOA1DSnhDbUYDbAoTcT5lXLs6pwDg1cPTBH1dA5H01dQ/E7SPOlFyQvvcxNJ
         LYa9ewMMbK16KsXbiz049Nmu4AMuAjo/cUHfwIC8C+s1HYJ4kGd9iVj96djsw7RxwsR9
         0dgR9/U4VzVX0QeDGbtSxWtx6WDGTtpOZvz/hgkN1K6Oid0VxoWLGKjCqLysbhbbmjaP
         9wIr5iN6sDNh2T50lz42+ngQImLu1tny6ekk8p9eEH2tsn+eD+jJRqv2nh7/4jVjX8LK
         RBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661364; x=1747266164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wT6DnXqbX5AENDmRydoGeLBXcyCT3Vy8ui4SCalzaQ=;
        b=ms3KWgu3x0gEIrcbJ7GLQCYPT3aaCD9QuO3rwmvvqYKeaumQIhQ1rXK2qSmISlstPI
         j7B423NRzODptfjBIje+qcbSVQwQZlkGXV16cWr2gBmMJcQXN6/v4qRUOnq0Y9sRZjHi
         gw2mwNdTXL4h0Rd8SE2KBusv2F773IL/9UOpV6vsWe+Av/Pp/ro6vGMP3/AG2ZTkEk3N
         TGVu/QokhIeXS7VawkjCi+bclRH0uB03xnu2MtSeoLyzyUX04DaYvRvDsbN4xQVRnTQZ
         Sd523cY9CElcHvDvZOvS0p70I65ZGm1+axde6xlOq1xBQ7lmCWNSaNuNFCNrptje0HfW
         +kpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuGkkiBSNgSK7CBt+kdsc3zNVGSr5Zei9GwTKHJPUIUOpHhFUcJRGF1NK2BMBwacwzZHGn+qItIVnwnw==@linaro.org
X-Gm-Message-State: AOJu0YywMkedawpnf0e57Me3PJLFoLZ58SWzP1e9+kkc8vJ5l+TTgNfr
	bL2qRjePVnS4F0ms7vkhOmuvJslp8RFIWffy+Rs6PYdaqLQfpYqw47htNPmzDiONqw==
X-Gm-Gg: ASbGncub4nQezugfYlv1ygZkVW/OCmfLmT34yf9kANxNhcG+GrHl7oXqjEO3sHQorbQ
	3Axce2Qh3V7v3WyjvojiHvdZdncmWyy/b2HcTfeqv8pkM2w+a5jmkeF+QjtfdQMgza2UnLv9qMa
	6OXBrTiktKxVJ0p7T9vy7nX72G7n1JxOlngHqRvGLNC3qw9xSHCX8LBOrAffK0+pNFLcV1CtNnL
	SyZ/Ma6mTIUbtg56Fv9CLAJGC04rNO99Uhy8FTK/VsZjsMCh0LzqvPuzI7bDvcSaXI54/VQnBS1
	sCMlEHUPJcX9utXqW1NURY/fhWqBA2vf8eS1XrA7
X-Google-Smtp-Source: AGHT+IH9jmSZoEfyBfxc66HFb7NLtse6xLVjOyrIpvtO2+/5/1e3pQZm95IdBBwOL7DhDe1MFZOmAA==
X-Received: by 2002:a17:902:f606:b0:224:1af1:87f4 with SMTP id d9443c01a7336-22e5ea91381mr89954445ad.22.1746661364459;
        Wed, 07 May 2025 16:42:44 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:44 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 01/49] target/arm: Replace target_ulong -> vaddr for HWBreakpoint
Date: Wed,  7 May 2025 16:41:52 -0700
Message-ID: <20250507234241.957746-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Fu3V94GbUIpw

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
index 660d3a88e07..5b421bc4ecd 100644
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

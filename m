Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp654707njc;
        Wed, 22 Jan 2025 01:30:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUGQ05mhs/PU95gTOUbJVTSXfN25WT9XzXfrLF7Jqkyzio7TvKb3B1vBofZCbO+wCHdpfHiZJbXi1YO4Q==@linaro.org
X-Received: by 2002:a05:600c:468e:b0:436:5165:f1ec with SMTP id 5b1f17b1804b1-4389143145bmr196987155e9.30.1737538240309;
        Wed, 22 Jan 2025 01:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737538240; cv=none;
        d=google.com; s=arc-20240605;
        b=MoMJWthP5FkWqAzzpBdGoaDjRsIRrJ/tvWtqQjho3WPKcf7CUNe+LkvN2vjBe0jDbW
         +nBj4givEMfpF6Y5TUhKxWRhKcIWqTe+OEAacrVBWRd3Ng9+Ttj/4lIJfQNjEHi8BpnY
         EqD5C0u8If54mSJcv1wwnkLhAqXx4K5xm2YAXdifI4uSPF+RbFq5n03rg//q5qbG1zqT
         p92+RKLug3QEz4jGXmre3NaK6Uz48mU6nd1qqJ+WHqolaiAU7h0+PkJ6z/q9asolJbKv
         RjoW/E1vhgHFnv8+XyOJEmoZJCeXY/g6KS5uHKu5anB7HzRbScwzAOQpn6VQVUBkwU3K
         utjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Exwv2SUshKwTjHy8msyqoapLFQlZN2ZYaumIRAoksx4=;
        fh=T1IIHRqhWfZdkJsRipNrLOIgGVyaIKcExdN2E58tJPY=;
        b=bugQVQzHk2AfFBYGEYcw8JWS6ORfhEwV3ViFSjhYLuVmV13qyyBdlp6hAD5skLgg7y
         iOoZ6uXgmHf8k+YNqwFA4zc4emM0nZLo6WMc1gE8LUiyAuRtmnmCjMf3bl9wAISLvEzY
         NllflM0DpyomSfZeNYGL3wqTtPNQsuAvXQG43QHecfhzRH8rflBYLEEK53D5SvK8XDHO
         OVdJ5/Dg00r35lQJfZLRclm7HOQniAeRvZw0F14P/NMJOOqITTbvVVEABI9IrarIQIav
         TiL6W/leHnFtlXb9qzEuA8FzXRvlZcE2EQ9BaHdnYHyv0g5Pv5jAaumLJbCuKcgDHEaF
         sv0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VWJF4LNM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4389041d2e8sor52704125e9.4.2025.01.22.01.30.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Jan 2025 01:30:40 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VWJF4LNM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737538240; x=1738143040; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Exwv2SUshKwTjHy8msyqoapLFQlZN2ZYaumIRAoksx4=;
        b=VWJF4LNMiZmlEvX222FEwEniNWWd5zzhvjWyMbnU8+H7dYSFcuCsNR7A+eVL4U/kAC
         tvBWGakqxC2BcfGljVhpQ3zB1jZNAt37NZA9yx+AiOJN5Yh3dRhWTsBz9bOcc0bHqst6
         Bb+HaFSSQ/tuLbuUUrBP/E97AYKhnOD+yvRZg22ITXhXt3KaELjsTsiUTjfhrSUgNrKW
         8Z9c1Vk2LhMiddT2egh4L8maCYv98MytB1NcHHDxhLjzF4HI/btowkQ1vNWiMnFAMJTJ
         89uwF3U8SVh0xPo2PHXaQCTVYWmsHvSzCKsXh/aetvNZ1UFVNsKwlbwP9WFkGr7NDLvG
         i31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538240; x=1738143040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Exwv2SUshKwTjHy8msyqoapLFQlZN2ZYaumIRAoksx4=;
        b=Tnxw8yLw+moMwxyEZY5Y341m7k/mcIr1Osp5/StuWIcFh1TguWdB6sZ3d5fjUyvpfY
         YJShAfymuq8PkhbGPlm78+16oG1bj3eNyOsmxsFNGRC9zfc0KysEeWbT7cNngCnv0COY
         XZXrOSPj0OvCQkvah6t8mgQhJunNTJuBqYa8fXu1sBBdpiVoL0tXELqQxpTk26izmcne
         DDNEqFDpexPjfsV8mV7XHWp4KgxYEEfVQQ4609EvKXMiWe9LNAFvX+sNkT2migpmep2x
         DqnF0Kh2AduAnl+uJ9O5dYZiKWdV2yMD7hpECjIoBd12cXWX25d3vuNOdCIkPuet18wA
         mOFA==
X-Forwarded-Encrypted: i=1; AJvYcCV6uoPqxsF5Umo8VtwgxGkQkDWr6IIwQryf47GsTQAPIy81gVVaciXyqjxb3VUEg+3fXcqpnHaLBxkBbw==@linaro.org
X-Gm-Message-State: AOJu0Yzn/NTKMvJ6PSOYeJLXpHri1T1fBXWeZkfQ9W9Z2sk/sl8JuJyA
	kOkjR/vpN7PStiGjQkbEjH2LygHIy/5eioiLbNN6oaNf4MGifcXOwZi0sfoc1E8KTxUV2aJcq7V
	2T454iA==
X-Gm-Gg: ASbGncu/Ng7usLTkE+AMBzaxdMAGBucd9Rg9hYOtmhOS6jY6SbhDvXh9kbvl4lTauJx
	GqOc0EQ8JAk45KcSSs8+cNeS7rna13XP2q8nZkKi+aJbxNQjqLVZ9jmSqaidch5eEcShYlY7z3P
	5B3S9ebDvbSMtfYqbR8lLLa6RpjQ4J6ncUcaqnrfWpIsrY08ObzeSALFwPUDUexvFv7vrjlwnUb
	FHB8Ks9FPVMde0t6eJvj0noPCGbCfWVDNW/2G8YK9g9wJwU1NCR+5Hwprvv7x8N49ETzSKGJMef
	Vbq3QftMJgxUON4ITPoL55jDb+rvUillkAutkuVTsjuj
X-Google-Smtp-Source: AGHT+IEZYV0UXoFjfU+tl1VOkpos+WFwna6iC8gUcKm8PVyAYHRasOGF7v+cm7JbdRsSBECp5+5ksg==
X-Received: by 2002:a05:600c:ccc:b0:436:1bbe:f686 with SMTP id 5b1f17b1804b1-4389141c073mr153240065e9.21.1737538239766;
        Wed, 22 Jan 2025 01:30:39 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31afb70sm17224715e9.19.2025.01.22.01.30.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jan 2025 01:30:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/10] gdbstub: Clarify no more than @gdb_num_core_regs can be accessed
Date: Wed, 22 Jan 2025 10:30:20 +0100
Message-ID: <20250122093028.52416-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122093028.52416-1-philmd@linaro.org>
References: <20250122093028.52416-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: J553dH13FQCt

Both CPUClass::gdb_read_register() and CPUClass::gdb_write_register()
handlers are called from common gdbstub code, and won't be called with
register index over CPUClass::gdb_num_core_regs:

  int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
  {
      CPUClass *cc = CPU_GET_CLASS(cpu);

      if (reg < cc->gdb_num_core_regs) {
          return cc->gdb_read_register(cpu, buf, reg);
      }
      ...
  }

  static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
  {
      CPUClass *cc = CPU_GET_CLASS(cpu);

      if (reg < cc->gdb_num_core_regs) {
          return cc->gdb_write_register(cpu, mem_buf, reg);
      }
      ...
  }

Clarify that in CPUClass docstring, and remove unreachable code on
the microblaze and tricore implementations.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h       | 2 ++
 target/microblaze/gdbstub.c | 5 -----
 target/openrisc/gdbstub.c   | 5 -----
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fb397cdfc53..7b6b22c431b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -124,7 +124,9 @@ struct SysemuCPUOps;
  * @get_pc: Callback for getting the Program Counter register.
  *       As above, with the semantics of the target architecture.
  * @gdb_read_register: Callback for letting GDB read a register.
+ *                     No more than @gdb_num_core_regs registers can be read.
  * @gdb_write_register: Callback for letting GDB write a register.
+ *                     No more than @gdb_num_core_regs registers can be written.
  * @gdb_adjust_breakpoint: Callback for adjusting the address of a
  *       breakpoint.  Used by AVR to handle a gdb mis-feature with
  *       its Harvard architecture split code and data.
diff --git a/target/microblaze/gdbstub.c b/target/microblaze/gdbstub.c
index 09d74e164d0..d493681d38d 100644
--- a/target/microblaze/gdbstub.c
+++ b/target/microblaze/gdbstub.c
@@ -110,14 +110,9 @@ int mb_cpu_gdb_read_stack_protect(CPUState *cs, GByteArray *mem_buf, int n)
 
 int mb_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
-    CPUClass *cc = CPU_GET_CLASS(cs);
     CPUMBState *env = cpu_env(cs);
     uint32_t tmp;
 
-    if (n > cc->gdb_num_core_regs) {
-        return 0;
-    }
-
     tmp = ldl_p(mem_buf);
 
     switch (n) {
diff --git a/target/openrisc/gdbstub.c b/target/openrisc/gdbstub.c
index c2a77d5d4d5..45bba80d878 100644
--- a/target/openrisc/gdbstub.c
+++ b/target/openrisc/gdbstub.c
@@ -47,14 +47,9 @@ int openrisc_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 
 int openrisc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
-    CPUClass *cc = CPU_GET_CLASS(cs);
     CPUOpenRISCState *env = cpu_env(cs);
     uint32_t tmp;
 
-    if (n > cc->gdb_num_core_regs) {
-        return 0;
-    }
-
     tmp = ldl_p(mem_buf);
 
     if (n < 32) {
-- 
2.47.1

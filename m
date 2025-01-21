Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp24439njc;
        Tue, 21 Jan 2025 03:41:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW7iEEPQGdG3ffo/PSPI3uOeXYzABsOAKOP87DB6NQAnYBgc+ULvFHzOKxMU1ASCI+QUBRo8k+jcbKSVg==@linaro.org
X-Received: by 2002:adf:9d92:0:b0:385:df17:2148 with SMTP id ffacd0b85a97d-38bec542a49mr14360561f8f.20.1737459686384;
        Tue, 21 Jan 2025 03:41:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737459686; cv=none;
        d=google.com; s=arc-20240605;
        b=TmtinMrS9H76FGjuU6qRDFdRN5RzblvmpD8sV4d+UOxh0+oO/oNAWpXlVqN+h/s5Mk
         JepF1YA5V4EFH/r6o8sbePU9RdF5IQjAMYGllBQA91ZUWlu1umOVNBpZn4nO06oMDS5M
         s2bZ3FNTAWxhe3Ip4+FZNptLLPKgkbQ34AW7zlxHKWJn/9sm+eF35DYP1W8CB9r/FIZ3
         dCSirX6WNqX/DEc5WC3oRFHfQq97Rh4IJJlZAT2eg7JBLdQPcL++o7ce/MFTf8YXNKnU
         IEWbonHl4YjtvnHN5HFv3/tR6emQpfbdgGpE5X/wTbIpV36GFgId1qsVxIjsldcG0giG
         hjnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cyX5PKm7gMuZd0pQEaHJ3A+gIhVc1meczJHLvspqXIY=;
        fh=zRSY4xK1rS8YjeFMxP9jmzgRuBO1OENYdrekfwIHvV0=;
        b=Q9s7IkL/rEKTtOfEa7RI6I9IenOxjuv4I/H/I0L0L1stdGX77p5cXeuKhxa+FhYrfx
         4huf97SMZUBex4wGCz9uakKaowrlq2STy/efsN6hCUhl2RbK0mCm3P57MZC/dt3si01y
         /W4wiel8ACNCD1SFQhRSzmPracS/ZvG+rBEWU6LvznNGwqluA7x4idXyWale9YH8Uc4c
         E4Gq66CE1AfCYCFXJYyxCALsjXHYccKF6X1MfmT7HYTgE2U5wQWXRJicAMYYU9xiYjwV
         7STL6Hl/0YbC7Rk0ae6Grvty2P8lgcKsLbZrq0x8baMBSulbbLY4gqaQuBp3IY9QjUxV
         9Naw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o0Z3RIlP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-437c75ee1cbsor37761905e9.5.2025.01.21.03.41.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 03:41:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o0Z3RIlP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737459686; x=1738064486; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyX5PKm7gMuZd0pQEaHJ3A+gIhVc1meczJHLvspqXIY=;
        b=o0Z3RIlPuIr4FZ/vQ3BqXNUTe0ZhFFxY9mNi36nTV/P5SrsiIbJW7m6i+FJGqUvgjs
         ha59SWdSWQK1VQuMol2dyQtYUVCsyGpK9zw9tSfabsgmU1tDXrnEAnPnMPUu58o/UhOU
         NKrKTtw86nHIPcOh4K8Mg1cTAepQ09/u5QlB4Mb7ki8Ed/QlQf/olETCX6GvF1OBWE2q
         7EEbbm8/XLr2I+WIvvpdTvX8oYdk78jZa0RD+7P62zc9UeBvJTTurZsO24WHmBWN+QFb
         8WjoP/H2frFg6Jo4bzT1v/RwGcGwQsI+bFajN0ptjxuqsRS7T5GVEJUJbLVu0MLYYfzQ
         aeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737459686; x=1738064486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyX5PKm7gMuZd0pQEaHJ3A+gIhVc1meczJHLvspqXIY=;
        b=Qb4zO2s9nFUd/HfGr/s8cxe/L8bdw2HODPHb5Ebql/Fjsp01rh63J3tSfiF7gIcGP+
         svqAN9mDi6FSx2EEU6Fo5mT90dd01KOoJFDu9im4Yzdgpyx/IIH8KYo83fp3HgLiZnS+
         q4pXt0o7u4ebYwgT3jW80tJ9x055k9aU0jdKTKigZRZkWFGBlk8J0JdW+sPR7UBlaZJB
         LT2C+TBg7j3ikZ90sl+a8fRbkPo6xf1zkEimWDBPvsiSZhRP6MbaXtaAa4nGIf5kH2iY
         x/8v4Ch+CoOvuAvj7B7qSST6zQwarP7w5DEEFsp84XHuboFEVbi5p4s+2zR3/UR44sTR
         jATA==
X-Forwarded-Encrypted: i=1; AJvYcCVLax1kxE++sWdEszZ8VBb2tlGNe5z/1RBfeE5ic4c1K0dRfXGHQ9FxUS/iDhi6AWf6C1sPMTTIr3O5CQ==@linaro.org
X-Gm-Message-State: AOJu0Yw+VMq13HXgRQ3d1kqFFSDvDPRlsGU2RCEHy4TAndGweYq+9Lv4
	t9/1i6obzTGTgjpDtpeN5TieBqvV0OX+U75OuDA8NVvn1fhDTF8mp2IegDULfVQiuQ==
X-Gm-Gg: ASbGncsz9QCRdLce/QKO/h4NprAMIw/UHZLCOyzq4SjEzlyphPyp2yVhT0L4zWUcv2A
	D5CaUSoRQWsAn7Z12eFaiodO1ggzjIkuWP+NqZQDguImFnlK0Rq7qoRze+nLHwrDof/Pv+P0gKE
	1XpyWK4oQy7+Oa+tasIOQ3gnmBJGIXLIaP/SbyAtrrCXhYpP4chPq3WLqgArYXjt8Pupfi1V2Qn
	FhtqESGqvq3LP6i7/YsNO0+ysCEaC7HU5Dj4aRstDRACgja3aAy9r2VfMZKNS4VfA68N1G4JzWd
	jz5fp3XjKMbq79lVPeFHhroCOORlmlUv5kHch2HEuNdp
X-Google-Smtp-Source: AGHT+IEx+UQCtRLciv8/c/J74uoXTeSchq83sY/i+Oe2hK2uv70zHQ4B8Ug2Kfgs3imx44w9PRo+uQ==
X-Received: by 2002:a05:6000:2a1:b0:386:42b1:d7e4 with SMTP id ffacd0b85a97d-38bec54287fmr18087643f8f.19.1737459685675;
        Tue, 21 Jan 2025 03:41:25 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046c59csm177990735e9.40.2025.01.21.03.41.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jan 2025 03:41:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/11] gdbstub: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Tue, 21 Jan 2025 12:40:51 +0100
Message-ID: <20250121114056.53949-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121114056.53949-1-philmd@linaro.org>
References: <20250121114056.53949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GyjpnwjU2W6e

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 gdbstub/gdbstub.c     | 26 +++++++++-----------------
 gdbstub/system.c      |  7 ++-----
 gdbstub/user-target.c |  6 ++----
 gdbstub/user.c        |  7 ++-----
 4 files changed, 15 insertions(+), 31 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index e366df12d4a..282e13e163f 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -354,7 +354,6 @@ static const char *get_feature_xml(const char *p, const char **newp,
                                    GDBProcess *process)
 {
     CPUState *cpu = gdb_get_first_cpu_in_process(process);
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     GDBRegisterState *r;
     size_t len;
 
@@ -377,11 +376,11 @@ static const char *get_feature_xml(const char *p, const char **newp,
                          "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
                          "<target>"));
 
-            if (cc->gdb_arch_name) {
+            if (cpu->cc->gdb_arch_name) {
                 g_ptr_array_add(
                     xml,
                     g_markup_printf_escaped("<architecture>%s</architecture>",
-                                            cc->gdb_arch_name(cpu)));
+                                            cpu->cc->gdb_arch_name(cpu)));
             }
             for (guint i = 0; i < cpu->gdb_regs->len; i++) {
                 r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
@@ -520,11 +519,10 @@ GArray *gdb_get_register_list(CPUState *cpu)
 
 int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     GDBRegisterState *r;
 
-    if (reg < cc->gdb_num_core_regs) {
-        return cc->gdb_read_register(cpu, buf, reg);
+    if (reg < cpu->cc->gdb_num_core_regs) {
+        return cpu->cc->gdb_read_register(cpu, buf, reg);
     }
 
     for (guint i = 0; i < cpu->gdb_regs->len; i++) {
@@ -538,11 +536,10 @@ int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 
 static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     GDBRegisterState *r;
 
-    if (reg < cc->gdb_num_core_regs) {
-        return cc->gdb_write_register(cpu, mem_buf, reg);
+    if (reg < cpu->cc->gdb_num_core_regs) {
+        return cpu->cc->gdb_write_register(cpu, mem_buf, reg);
     }
 
     for (guint i = 0; i < cpu->gdb_regs->len; i++) {
@@ -570,7 +567,7 @@ static void gdb_register_feature(CPUState *cpu, int base_reg,
 
 void gdb_init_cpu(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
+    CPUClass *cc = cpu->cc;
     const GDBFeature *feature;
 
     cpu->gdb_regs = g_array_new(false, false, sizeof(GDBRegisterState));
@@ -1646,11 +1643,8 @@ void gdb_extend_qsupported_features(char *qflags)
 
 static void handle_query_supported(GArray *params, void *user_ctx)
 {
-    CPUClass *cc;
-
     g_string_printf(gdbserver_state.str_buf, "PacketSize=%x", MAX_PACKET_LENGTH);
-    cc = CPU_GET_CLASS(first_cpu);
-    if (cc->gdb_core_xml_file) {
+    if (first_cpu->cc->gdb_core_xml_file) {
         g_string_append(gdbserver_state.str_buf, ";qXfer:features:read+");
     }
 
@@ -1697,7 +1691,6 @@ static void handle_query_supported(GArray *params, void *user_ctx)
 static void handle_query_xfer_features(GArray *params, void *user_ctx)
 {
     GDBProcess *process;
-    CPUClass *cc;
     unsigned long len, total_len, addr;
     const char *xml;
     const char *p;
@@ -1708,8 +1701,7 @@ static void handle_query_xfer_features(GArray *params, void *user_ctx)
     }
 
     process = gdb_get_cpu_process(gdbserver_state.g_cpu);
-    cc = CPU_GET_CLASS(gdbserver_state.g_cpu);
-    if (!cc->gdb_core_xml_file) {
+    if (!gdbserver_state.g_cpu->cc->gdb_core_xml_file) {
         gdb_put_packet("");
         return;
     }
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 8ce79fa88cf..215a2c5dcad 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -452,8 +452,6 @@ static int phy_memory_mode;
 int gdb_target_memory_rw_debug(CPUState *cpu, hwaddr addr,
                                uint8_t *buf, int len, bool is_write)
 {
-    CPUClass *cc;
-
     if (phy_memory_mode) {
         if (is_write) {
             cpu_physical_memory_write(addr, buf, len);
@@ -463,9 +461,8 @@ int gdb_target_memory_rw_debug(CPUState *cpu, hwaddr addr,
         return 0;
     }
 
-    cc = CPU_GET_CLASS(cpu);
-    if (cc->memory_rw_debug) {
-        return cc->memory_rw_debug(cpu, addr, buf, len, is_write);
+    if (cpu->cc->memory_rw_debug) {
+        return cpu->cc->memory_rw_debug(cpu, addr, buf, len, is_write);
     }
 
     return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
diff --git a/gdbstub/user-target.c b/gdbstub/user-target.c
index 22bf4008c0f..355b1901b4f 100644
--- a/gdbstub/user-target.c
+++ b/gdbstub/user-target.c
@@ -233,10 +233,8 @@ void gdb_handle_query_offsets(GArray *params, void *user_ctx)
 static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
                                          uint8_t *buf, int len, bool is_write)
 {
-    CPUClass *cc;
-    cc = CPU_GET_CLASS(cpu);
-    if (cc->memory_rw_debug) {
-        return cc->memory_rw_debug(cpu, addr, buf, len, is_write);
+    if (cpu->cc->memory_rw_debug) {
+        return cpu->cc->memory_rw_debug(cpu, addr, buf, len, is_write);
     }
     return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
 }
diff --git a/gdbstub/user.c b/gdbstub/user.c
index c2bdfc3d491..375f7f80653 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -665,11 +665,8 @@ int gdb_continue_partial(char *newstates)
 int gdb_target_memory_rw_debug(CPUState *cpu, hwaddr addr,
                                uint8_t *buf, int len, bool is_write)
 {
-    CPUClass *cc;
-
-    cc = CPU_GET_CLASS(cpu);
-    if (cc->memory_rw_debug) {
-        return cc->memory_rw_debug(cpu, addr, buf, len, is_write);
+    if (cpu->cc->memory_rw_debug) {
+        return cpu->cc->memory_rw_debug(cpu, addr, buf, len, is_write);
     }
     return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
 }
-- 
2.47.1

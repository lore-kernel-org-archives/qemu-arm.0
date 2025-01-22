Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp654908njc;
        Wed, 22 Jan 2025 01:31:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXp8Cmb8/zWeexxi4jHRsR1DoLUyZJ7fzkBE5Yb/y5a8sTflfsk1gYRQUVrh1B/QvwRxmFp6ScrSfdyjQ==@linaro.org
X-Received: by 2002:a05:6000:4022:b0:38b:dbeb:63a2 with SMTP id ffacd0b85a97d-38bf57d2dc0mr18073469f8f.55.1737538267865;
        Wed, 22 Jan 2025 01:31:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737538267; cv=none;
        d=google.com; s=arc-20240605;
        b=fRhpR/3C072pgJ/gS/SulWc3cQWpriMuDlRsv1OeZLrVe9lgEh3Ju0aUlUrehp8GBo
         hVEfxSLaQzL5iFxxl1rsFk2ch1bsZ6cVoqpXpM42EWIv6fQn5Cvxf7c8/EM5njOdP/9h
         5qvGG6J+OykJYPT9B+k3BaAVQdXVo6H3vXbyJ0gVcswJzFc2wUX666RQoV+0qenyW4MM
         KzQV/ZyNzC2vDF3l1LEmNW4b6z1hBmoSuhWtD4Dn6fDrN7u5moUcNmoB1A/ZUg8AiBNk
         +n3NKFWElGKAUxnKkzR/9wmQvqNWOzjq/4Ifej/NVwFYKG2iIOObyZHibs0ErvCV8XUA
         KPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oNGgwti16N0RaYgdrpqIsRq0rprgvC+KnfZZxJFop+c=;
        fh=gtTF+H6MUxUD6xjDxzzhX0d87aHNLY/BHG/W7brm5EE=;
        b=P0TZF5k1IMQWmnn2JsUmWZYNcY2diYIpMCiZPge3hdJnFQjiN7acvtFjOeSed9wEp/
         Y8ojLPN6XVyVRxXSGlcTt2iA3RQ+/cUGW6BftR8lWFG8Bfq+h9LZBOsOF296HIG/ENTz
         UaJB5YXQMEefT/DvPm1GPjtyRLOrMW+7SnBHVZfu6m76Cqt5HO/zHzRUtrnIW1aofvLb
         rev7dY5Mc3V8KvFiK28GMCDQB3vGhYzP98i/k3K/OtIqE/5vMvI9fQK7BsN6lwalZcHe
         ahlJWxik0JzUr5DOe9Ianwti07w6/Ydvzw/pKSTxo7LdZmQ+Btm0HlOavAUM7/OeGMf8
         k/dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U76L9Hu2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4389048e095sor52617455e9.11.2025.01.22.01.31.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Jan 2025 01:31:07 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U76L9Hu2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737538267; x=1738143067; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNGgwti16N0RaYgdrpqIsRq0rprgvC+KnfZZxJFop+c=;
        b=U76L9Hu2j1ADodKtbGiU64c6scuKg4ZffcCgQuFREIePS+suuXgc6MVgKzXTKYW9lr
         ua2iOmgMZO5ePtosMFHzrIjb//ajd0iptVeZYtFmi1/emBZDxepTeDQvOCec7yGpbUlE
         YCfz6hiO676eyAdijJBkg/Zn4hHQZMNMzbm1294Hlciy+hFwTLOxOu8LjhHtlestVJts
         fCSFMB2VFHJyQwq0qfa0kQWYt29Vvz47EKumxfTBydf0OJaCNEvoz+3rjqCOEMsgsF/l
         qsaE8Hq9pTL88E+c2VjgrlNgCLdpa6rrqdrQ7aG6bRt9xZG+58c0pXYGmzAZlLIXrsQC
         6Rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538267; x=1738143067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNGgwti16N0RaYgdrpqIsRq0rprgvC+KnfZZxJFop+c=;
        b=Of5JPJzGwJitQKMrX66cyiuKVQMiJHTXbOwkiIJHI2sOhaWOHnCPrJhMpn9zNgHdpR
         CN2n1ZRPMhGAxP2EZ3TGAJotpRgofhKhraJ7xnsF2S78RA4ZIjYqDyw3yomSZ0p2edtY
         nR4g1IoKroO8aGEhWc6Cp1uehPB0bxAngShkrMM8MeEMBVFHR17hYg+XVX0pTF28sZd3
         ohvqkywpnsvMvJgdiuUtzzxQ3MZ1hoW4IKbQ4UcEbrOvM9y1nommaFkYflRvzuF+pnwT
         mrhChhwjuzvwANdA/EzG+xU7VB1GUx/ryjOOqMfehJmAljt9AyupNrmz3R+1U0D9bdwU
         tXsA==
X-Forwarded-Encrypted: i=1; AJvYcCXhZTyUdLINkwnypnBebx8e+c3yxgUBSSARKduhv9Ffuro2TGywtCNcwuRcoIDzvxa575X48+lO2XpiWQ==@linaro.org
X-Gm-Message-State: AOJu0YwmLYBvhTDTpnhDQTdWYEHV5YhY2r3AIeXSiS4DSBcbmAt3/zRv
	vmNwK15q/U3mkUpEkjbqOofJz0vfal+ef7nI7Ou8drcUJYkgTlLxlRszykju+qj+IQ==
X-Gm-Gg: ASbGncvOMwysfG1R4cafFG9jXklE6EFy8xd8RCqUfHKxI7yT4ZS/pI68RpJfij+hWPb
	gas2BtGHBxVFwKjtZV0OEsFdBrGZO4Ni9PQot+6mU0G6Oh9fKLZmMZbj65ZiMkG09Mclm7xpYcZ
	uLWw6IV/OtZDKAJHUe0CfT2P52+w5sURUnyr6+qRGchicJCLKFidnU1pDbLzPyV/6jhpMlQOsPp
	4znBo07ttZYOFxSpc71pNbomSQhNpomCn0k/or6He8QeCeIcws3jgKqE5M47RSiboBOX0hEGImr
	mFCz1iMqovG8UID7/92NsZjhlGFYFlMj7/PTqcucMKo5
X-Google-Smtp-Source: AGHT+IGuXAL20mHd9R2/lClWS7l1W26KPDxoiKT0W+da+K9wiLYkg9YH5EALMh5dy9yk4m8BTc+Cyw==
X-Received: by 2002:a05:600c:468d:b0:434:a75b:5f59 with SMTP id 5b1f17b1804b1-438913bdb19mr175725585e9.3.1737538267345;
        Wed, 22 Jan 2025 01:31:07 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31afaf8sm17294715e9.21.2025.01.22.01.31.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jan 2025 01:31:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 08/10] gdbstub: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Wed, 22 Jan 2025 10:30:26 +0100
Message-ID: <20250122093028.52416-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122093028.52416-1-philmd@linaro.org>
References: <20250122093028.52416-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KP5w0uW6I851

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

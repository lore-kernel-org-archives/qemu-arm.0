Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475419njc;
        Tue, 20 May 2025 05:53:13 -0700 (PDT)
X-Received: by 2002:a17:903:41cc:b0:223:325c:89de with SMTP id d9443c01a7336-231d43d9c96mr232605195ad.1.1747745593102;
        Tue, 20 May 2025 05:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745593; cv=none;
        d=google.com; s=arc-20240605;
        b=AvdaymSZU0krZnRx0bJvqGerUhYfhKIUlbzbHe4nya9ItwDY+1xvBxd/7mG1QGfGhF
         XHyEelWkMuFbOz2ZwQozsbDxnwUNbw1+XPiz4Zn96C+eBPncBiWqbIQPYV/0Q9ZlLLv8
         Vs6aU6wH20COJZyac0shgLLsPdvqhTct23rDw6Hp3qRl9Hkns0FFDZaXblyNmziv5g2u
         fQoHk7SCwUnz0vU2K9Ni6MQ47fGa0MjEdxMp8fPQ8IG4gNbth/M7L9xF5NAvNRrQkN64
         fpWahqzgjwR8zIXZQxscFCxrdkMz2l3ifKvIh1kPPr7WI/mQYp3vMlx8u5pjd0yj4/QF
         00Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rd5mjjrQF9ATa0gHuVt6j9q1L70Kmu641JXtCbaxJks=;
        fh=/HP0Ft8KKW+TESCPNmxQuhIV0650i9s5O/h6mveUhp8=;
        b=CFcBJz8R8tk5Sz6eyAVi+GMFtTRyMuOwqllzNiL31Ej20jO4Ujdk+pO4SNY265W462
         0wcwhKCQkkvP+eNmY9Cq2HZ1yghq+3uvO6/3dOY5FXvGQT5glLH1ZapEPPgIzeQUf3LT
         tivV8Hr64rk+GJTeIg6BLwmLZTZtFlHkNlAcSxWPxDAQdhXz+skperNQy06krG9qNSF/
         SYENxzNdimfBOITkITkYae0nHd+Oa9d68Op/7FnyWncxA3maPC1wlhsfI3O48XkUOuBn
         lOFXacWoWdFKlBNeQ423Zy/wk4o11OYyhVpuX1X4sPaDZfsc+z1XP+8L5fXJXP998Ho0
         usqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=l915xCzD;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e7d59e920sor7447906a91.8.2025.05.20.05.53.12
        (Google Transport Security);
        Tue, 20 May 2025 05:53:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=l915xCzD;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745592; x=1748350392; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rd5mjjrQF9ATa0gHuVt6j9q1L70Kmu641JXtCbaxJks=;
        b=l915xCzDGyi83HHkcKyEkAao4hcoS7lhdf2vmEyhilwI63mTQAac9zO9ao1Kb7TdT2
         j2dFv/M5ACeGrOGhXXAJlR1w0fdv/Sti7qMSUIu7wpvTnf8lLXW+bu0L2e8QbE8nrLGr
         Wwe7cL/7HXxecnbqwCwXKsIQ6ibiYDDNrd/6xR99E7Nl7QvDtZxGu+QNLMPjvoaZhKM7
         VuAho0TVfVayhrX3FKnMp7wL8q6db95tSk2qm1nnVAuFyxVrr40xr/wXwFaVp5SDYSWD
         oz7TttBHxdImdP+DESwyCoUv7CNsuJkWkoZZ5l0W165SZn3ArzZ9Yl307bKdARober2I
         j0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745592; x=1748350392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rd5mjjrQF9ATa0gHuVt6j9q1L70Kmu641JXtCbaxJks=;
        b=nzBi7qISMBBnfx8IqRAbAPC8FIsdfkNpqQO3FpTQf9GOtOXXR1wbCgsaCjTMElonMZ
         oeclUpbAyMeMGPrcEosh4Zyn42+EeniYoqCI6RBbq+jpgCSa6ehIUwW8sIedUWuQ36sP
         Ctlm3xr6gyTWacfLddhHM4j52ELoVF47Qeu6PGtVLctSa3TZ0EdlCeb2XVc2yJHSidhN
         NiL/AcwYmOrMQAGpEjlwMxWp5f6IUOLK1OMubcZWyAHDEbQXKLsMTC0AejXdiEW2UgYz
         0BHY5LiNAuAZjATAnkNzOiNDDwD5nljQXKNBfCVAPfbC+qC5RvZgA+jsvjghgqWQyjiv
         7Dpg==
X-Forwarded-Encrypted: i=1; AJvYcCVFg4WRWq0ztRni5Hoc3D+wcQv2igxAf1t7J+tRDLXI97JrBSUGR+pL2KDx4V98t2vhlaFaKSCwFnwdC/Oe78bGAA==@linaro.org, AJvYcCWy6WcOAe4Y0SWNcXH53LfsAct05woREfDZQaB5Ntwa6jvUbVDvmNwWJj6y9yu28UjHeXIt4QE=@linaro.org, AJvYcCXcW2aw1nvCBuEwGTP9gyN6ggGdiNgSJKjcaSAIIAIv7i8uXFZn8vkTqQB+TTgdk1sgSypjQmBoWpsqGIkE5wprH9k=@linaro.org
X-Gm-Message-State: AOJu0Ywi32Pw/SGHgEiLVyxzLwtJwSUFt9LZ+yAh283aBh8U3o3bB4tp
	H5WaBo9MBw6TliT49eHby5jdMHLchEBEFGFfw1mjpim8UaXo8jaEKu6U
X-Gm-Gg: ASbGncs7zDl8foUOLfwahGjgsY8hhmgeX2ATa2znTEc7q8I7/K9KCTesl3vAOwVTokI
	ckGulDsLm6UE6KvJvu2huPVPNL6RupK+0NehtPFXKdHvxXD5HtdXlHcuJ/dvTA4eRM5kKlZTXEJ
	iwf6zYfczeyFjP1/zGPXge8IOXS/41HI7GiYW2QyN3wt8gAumFgF1Zk0jW3DLc0DuU5X4chAaj2
	WWwMOP3QTaPI+ktrxLqPBxP8PfIHIdPbnCpyu+UBHLXFXwSeH+oaOKPXQPiK5brvlZmmEJIrcH5
	BIxrWJf3FnBysiktgzn0HSxoKx9qXVMzTQkROXAL1eEQsJRchKI=
X-Google-Smtp-Source: AGHT+IF2FW3kjy4TuydJk2c6oRxPAshlC6eugRri80AQsOEYEwiyFGuQRsLOkSsx4VXlAPW/OPcUHw==
X-Received: by 2002:a17:90b:3c8f:b0:30c:540b:9ba with SMTP id 98e67ed59e1d1-30e7d51fa7cmr25863329a91.10.1747745592411;
        Tue, 20 May 2025 05:53:12 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:53:11 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	WANG Xuerui <git@xen0n.name>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 10/33] tcg/wasm32: Add load and store instructions
Date: Tue, 20 May 2025 21:51:12 +0900
Message-ID: <aacc0ad78d1fff04fa22b14e129bb6f5a4e0862e.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: keleUNw49d8p

This commit implements load and store operations using Wasm memory
instructions. Since Wasm's load/store instructions don't support negative
offset, address calculations are performed separately before the memory
access.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 242 ++++++++++++++++++++++++++++++++++++
 1 file changed, 242 insertions(+)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index d732d2f3c0..9b024b03b9 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -232,6 +232,10 @@ static void tcg_wasm_out_op_i64_extend_i32_u(TCGContext *s)
     tcg_wasm_out8(s, 0xad);
 }
 
+static void tcg_wasm_out_op_i32_add(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x6a);
+}
 static void tcg_wasm_out_op_i32_and(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x71);
@@ -279,6 +283,11 @@ static void tcg_wasm_out_op_global_set_r(TCGContext *s, TCGReg r0)
 {
     tcg_wasm_out_op_global_set(s, tcg_target_reg_index[r0]);
 }
+static void tcg_wasm_out_op_global_get_r_i32(TCGContext *s, TCGReg r0)
+{
+    tcg_wasm_out_op_global_get(s, tcg_target_reg_index[r0]);
+    tcg_wasm_out_op_i32_wrap_i64(s);
+}
 
 #define tcg_wasm_out_i64_calc(op)                                       \
     static void tcg_wasm_out_i64_calc_##op(                             \
@@ -366,6 +375,19 @@ static void tcg_wasm_out_leb128_sint64_t(TCGContext *s, int64_t v)
     }
 }
 
+static void tcg_wasm_out_leb128_uint32_t(TCGContext *s, uint32_t v)
+{
+    uint8_t b;
+    do {
+        b = v & 0x7f;
+        v >>= 7;
+        if (v != 0) {
+            b |= 0x80;
+        }
+        tcg_wasm_out8(s, b);
+    } while (v != 0);
+}
+
 static void tcg_wasm_out_op_i32_const(TCGContext *s, int32_t v)
 {
     tcg_wasm_out8(s, 0x41);
@@ -378,6 +400,68 @@ static void tcg_wasm_out_op_i64_const(TCGContext *s, int64_t v)
     tcg_wasm_out_leb128_sint64_t(s, v);
 }
 
+static void tcg_wasm_out_op_loadstore(
+    TCGContext *s, uint8_t instr, uint32_t a, uint32_t o)
+{
+    tcg_wasm_out8(s, instr);
+    tcg_wasm_out_leb128_uint32_t(s, a);
+    tcg_wasm_out_leb128_uint32_t(s, o);
+}
+
+static void tcg_wasm_out_op_i64_store(TCGContext *s, uint32_t a, uint32_t o)
+{
+    tcg_wasm_out_op_loadstore(s, 0x37, a, o);
+}
+static void tcg_wasm_out_op_i64_store8(TCGContext *s, uint32_t a, uint32_t o)
+{
+    tcg_wasm_out_op_loadstore(s, 0x3c, a, o);
+}
+
+static void tcg_wasm_out_op_i64_store16(TCGContext *s, uint32_t a, uint32_t o)
+{
+    tcg_wasm_out_op_loadstore(s, 0x3d, a, o);
+}
+
+static void tcg_wasm_out_op_i64_store32(TCGContext *s, uint32_t a, uint32_t o)
+{
+    tcg_wasm_out_op_loadstore(s, 0x3e, a, o);
+}
+
+static void tcg_wasm_out_op_i64_load(TCGContext *s, uint32_t a, uint32_t o)
+{
+    tcg_wasm_out_op_loadstore(s, 0x29, a, o);
+}
+
+ static void tcg_wasm_out_op_i64_load8_s(TCGContext *s, uint32_t a, uint32_t o)
+{
+    tcg_wasm_out_op_loadstore(s, 0x30, a, o);
+}
+
+static void tcg_wasm_out_op_i64_load8_u(TCGContext *s, uint32_t a, uint32_t o)
+{
+    tcg_wasm_out_op_loadstore(s, 0x31, a, o);
+}
+
+static void tcg_wasm_out_op_i64_load16_s(TCGContext *s, uint32_t a, uint32_t o)
+{
+    tcg_wasm_out_op_loadstore(s, 0x32, a, o);
+}
+
+static void tcg_wasm_out_op_i64_load16_u(TCGContext *s, uint32_t a, uint32_t o)
+{
+    tcg_wasm_out_op_loadstore(s, 0x33, a, o);
+}
+
+static void tcg_wasm_out_op_i64_load32_s(TCGContext *s, uint32_t a, uint32_t o)
+{
+    tcg_wasm_out_op_loadstore(s, 0x34, a, o);
+}
+
+static void tcg_wasm_out_op_i64_load32_u(TCGContext *s, uint32_t a, uint32_t o)
+{
+    tcg_wasm_out_op_loadstore(s, 0x35, a, o);
+}
+
 static void tcg_wasm_out_op_not(TCGContext *s)
 {
     tcg_wasm_out_op_i64_const(s, -1);
@@ -547,6 +631,154 @@ static void tcg_wasm_out_sextract(TCGContext *s, TCGReg dest, TCGReg arg1,
     tcg_wasm_out_op_global_set_r(s, dest);
 }
 
+static void tcg_wasm_out_ld(
+    TCGContext *s, TCGType type, TCGReg val, TCGReg base, intptr_t offset)
+{
+    tcg_wasm_out_op_global_get_r_i32(s, base);
+    if (offset < 0) {
+        tcg_wasm_out_op_i32_const(s, offset);
+        tcg_wasm_out_op_i32_add(s);
+        offset = 0;
+    }
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_i64_load32_u(s, 0, offset);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_op_i64_load(s, 0, offset);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    tcg_wasm_out_op_global_set_r(s, val);
+}
+
+static void tcg_wasm_out_ld8s(TCGContext *s, TCGReg val,
+                              TCGReg base, intptr_t offset)
+{
+    tcg_wasm_out_op_global_get_r_i32(s, base);
+    if (offset < 0) {
+        tcg_wasm_out_op_i32_const(s, offset);
+        tcg_wasm_out_op_i32_add(s);
+        offset = 0;
+    }
+    tcg_wasm_out_op_i64_load8_s(s, 0, offset);
+    tcg_wasm_out_op_global_set_r(s, val);
+}
+
+static void tcg_wasm_out_ld8u(TCGContext *s, TCGReg val,
+                              TCGReg base, intptr_t offset)
+{
+    tcg_wasm_out_op_global_get_r_i32(s, base);
+    if (offset < 0) {
+        tcg_wasm_out_op_i32_const(s, offset);
+        tcg_wasm_out_op_i32_add(s);
+        offset = 0;
+    }
+    tcg_wasm_out_op_i64_load8_u(s, 0, offset);
+    tcg_wasm_out_op_global_set_r(s, val);
+}
+
+static void tcg_wasm_out_ld16s(TCGContext *s, TCGReg val,
+                               TCGReg base, intptr_t offset)
+{
+    tcg_wasm_out_op_global_get_r_i32(s, base);
+    if (offset < 0) {
+        tcg_wasm_out_op_i32_const(s, offset);
+        tcg_wasm_out_op_i32_add(s);
+        offset = 0;
+    }
+    tcg_wasm_out_op_i64_load16_s(s, 0, offset);
+    tcg_wasm_out_op_global_set_r(s, val);
+}
+
+static void tcg_wasm_out_ld16u(TCGContext *s, TCGReg val,
+                               TCGReg base, intptr_t offset)
+{
+    tcg_wasm_out_op_global_get_r_i32(s, base);
+    if (offset < 0) {
+        tcg_wasm_out_op_i32_const(s, offset);
+        tcg_wasm_out_op_i32_add(s);
+        offset = 0;
+    }
+    tcg_wasm_out_op_i64_load16_u(s, 0, offset);
+    tcg_wasm_out_op_global_set_r(s, val);
+}
+
+static void tcg_wasm_out_ld32s(TCGContext *s, TCGReg val,
+                               TCGReg base, intptr_t offset)
+{
+    tcg_wasm_out_op_global_get_r_i32(s, base);
+    if (offset < 0) {
+        tcg_wasm_out_op_i32_const(s, offset);
+        tcg_wasm_out_op_i32_add(s);
+        offset = 0;
+    }
+    tcg_wasm_out_op_i64_load32_s(s, 0, offset);
+    tcg_wasm_out_op_global_set_r(s, val);
+}
+
+static void tcg_wasm_out_ld32u(TCGContext *s, TCGReg val,
+                               TCGReg base, intptr_t offset)
+{
+    tcg_wasm_out_op_global_get_r_i32(s, base);
+    if (offset < 0) {
+        tcg_wasm_out_op_i32_const(s, offset);
+        tcg_wasm_out_op_i32_add(s);
+        offset = 0;
+    }
+    tcg_wasm_out_op_i64_load32_u(s, 0, offset);
+    tcg_wasm_out_op_global_set_r(s, val);
+}
+
+static void tcg_wasm_out_st(TCGContext *s, TCGType type, TCGReg val,
+                            TCGReg base, intptr_t offset)
+{
+    tcg_wasm_out_op_global_get_r_i32(s, base);
+    if (offset < 0) {
+        tcg_wasm_out_op_i32_const(s, offset);
+        tcg_wasm_out_op_i32_add(s);
+        offset = 0;
+    }
+    tcg_wasm_out_op_global_get_r(s, val);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_i64_store32(s, 0, offset);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_op_i64_store(s, 0, offset);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_wasm_out_st8(TCGContext *s, TCGReg val,
+                             TCGReg base, intptr_t offset)
+{
+    tcg_wasm_out_op_global_get_r_i32(s, base);
+    if (offset < 0) {
+        tcg_wasm_out_op_i32_const(s, offset);
+        tcg_wasm_out_op_i32_add(s);
+        offset = 0;
+    }
+    tcg_wasm_out_op_global_get_r(s, val);
+    tcg_wasm_out_op_i64_store8(s, 0, offset);
+}
+
+static void tcg_wasm_out_st16(TCGContext *s, TCGReg val,
+                              TCGReg base, intptr_t offset)
+{
+    tcg_wasm_out_op_global_get_r_i32(s, base);
+    if (offset < 0) {
+        tcg_wasm_out_op_i32_const(s, offset);
+        tcg_wasm_out_op_i32_add(s);
+        offset = 0;
+    }
+    tcg_wasm_out_op_global_get_r(s, val);
+    tcg_wasm_out_op_i64_store16(s, 0, offset);
+}
+
 static bool patch_reloc(tcg_insn_unit *code_ptr_i, int type,
                         intptr_t value, intptr_t addend)
 {
@@ -786,6 +1018,7 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
         op = INDEX_op_ld32u;
     }
     tcg_out_ldst(s, op, val, base, offset);
+    tcg_wasm_out_ld(s, type, val, base, offset);
 }
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
@@ -1585,6 +1818,7 @@ static void tgen_ld8u(TCGContext *s, TCGType type, TCGReg dest,
                       TCGReg base, ptrdiff_t offset)
 {
     tcg_out_ldst(s, INDEX_op_ld8u, dest, base, offset);
+    tcg_wasm_out_ld8u(s, dest, base, offset);
 }
 
 static const TCGOutOpLoad outop_ld8u = {
@@ -1596,6 +1830,7 @@ static void tgen_ld8s(TCGContext *s, TCGType type, TCGReg dest,
                       TCGReg base, ptrdiff_t offset)
 {
     tcg_out_ldst(s, INDEX_op_ld8s, dest, base, offset);
+    tcg_wasm_out_ld8s(s, dest, base, offset);
 }
 
 static const TCGOutOpLoad outop_ld8s = {
@@ -1607,6 +1842,7 @@ static void tgen_ld16u(TCGContext *s, TCGType type, TCGReg dest,
                        TCGReg base, ptrdiff_t offset)
 {
     tcg_out_ldst(s, INDEX_op_ld16u, dest, base, offset);
+    tcg_wasm_out_ld16u(s, dest, base, offset);
 }
 
 static const TCGOutOpLoad outop_ld16u = {
@@ -1618,6 +1854,7 @@ static void tgen_ld16s(TCGContext *s, TCGType type, TCGReg dest,
                        TCGReg base, ptrdiff_t offset)
 {
     tcg_out_ldst(s, INDEX_op_ld16s, dest, base, offset);
+    tcg_wasm_out_ld16s(s, dest, base, offset);
 }
 
 static const TCGOutOpLoad outop_ld16s = {
@@ -1630,6 +1867,7 @@ static void tgen_ld32u(TCGContext *s, TCGType type, TCGReg dest,
                        TCGReg base, ptrdiff_t offset)
 {
     tcg_out_ldst(s, INDEX_op_ld32u, dest, base, offset);
+    tcg_wasm_out_ld32u(s, dest, base, offset);
 }
 
 static const TCGOutOpLoad outop_ld32u = {
@@ -1641,6 +1879,7 @@ static void tgen_ld32s(TCGContext *s, TCGType type, TCGReg dest,
                        TCGReg base, ptrdiff_t offset)
 {
     tcg_out_ldst(s, INDEX_op_ld32s, dest, base, offset);
+    tcg_wasm_out_ld32s(s, dest, base, offset);
 }
 
 static const TCGOutOpLoad outop_ld32s = {
@@ -1653,6 +1892,7 @@ static void tgen_st8(TCGContext *s, TCGType type, TCGReg data,
                      TCGReg base, ptrdiff_t offset)
 {
     tcg_out_ldst(s, INDEX_op_st8, data, base, offset);
+    tcg_wasm_out_st8(s, data, base, offset);
 }
 
 static const TCGOutOpStore outop_st8 = {
@@ -1664,6 +1904,7 @@ static void tgen_st16(TCGContext *s, TCGType type, TCGReg data,
                       TCGReg base, ptrdiff_t offset)
 {
     tcg_out_ldst(s, INDEX_op_st16, data, base, offset);
+    tcg_wasm_out_st16(s, data, base, offset);
 }
 
 static const TCGOutOpStore outop_st16 = {
@@ -1735,6 +1976,7 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
         op = INDEX_op_st32;
     }
     tcg_out_ldst(s, op, val, base, offset);
+    tcg_wasm_out_st(s, type, val, base, offset);
 }
 
 static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
-- 
2.43.0

Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475979njc;
        Tue, 20 May 2025 05:54:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2c8c:b0:30e:823f:ef31 with SMTP id 98e67ed59e1d1-30e823ff071mr24002228a91.29.1747745644173;
        Tue, 20 May 2025 05:54:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745644; cv=none;
        d=google.com; s=arc-20240605;
        b=FJajH+RbCg5YuPuyVywvnk6jV8PkPPg6M2cUJjUCJ7fiZyYIga9UJAyFExbm0ELaD1
         HUpQgaWVUXt7IPgUgFYUjYU6Cy+1lpzSi+I4KavCmb4iRbwsrEwIj+ay/Eds8OaB0Rgt
         bej7iL6dZD8CSc8Pb0uY12vLDDF2VXw2nXO35zP3Xi/k6RWojlYp7C5YVVT07fo9pWXy
         A5f+/uaThOn6aO4mx9CtbMA+PPuOLlEJ8W9G527sxxj4E2BfBBjoycmAflIyvwkgzhJc
         nt46+zRaPt08QHrnzXSAQUoTd/FV92C3AWGymyR8mstgNL+VoVMBPINB37iBsqExfEEh
         KG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ny2gj+P5qO3fOEdwuuQ9ZXSBwum4GBrBb6IEryXJJDw=;
        fh=gZ/JqBsrpOtmqvf/AzOKlHziyA+Gp9CGKQdOxeJHwLs=;
        b=CjCE2iSwY4bittyT0B9LzFRCQLlwYd/1TVD3K3nEhO1Hg9941O2ETPgXymXoEYDl+A
         hqvmqIHx4h+i5wYKmc9n7iyqCVe3Iyt6WxF3sC88wKr6ur2POJKXxQXwz6dsimqHA+qA
         VjVB5dzKmJJRruNHrxRWK5eoWGKoPzR+XKachTosq64Jo7T0C9Fpot1tjSKjSeL6FsYx
         02DobLrHGO6Fq45hGn69WEELE9moxAqgohaTb2KQFsGMBsdKinfJO6695Ug+mfl/B2/h
         sCyxoKWQxgQLP4vT7pAXqu+9R0EpLDiZn2fdDq/yBnKA70mGdj7UOk3CzZiwTFZXD21b
         h+Lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YpM+EpjO;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e7d474f20sor8961375a91.2.2025.05.20.05.54.03
        (Google Transport Security);
        Tue, 20 May 2025 05:54:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YpM+EpjO;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745643; x=1748350443; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ny2gj+P5qO3fOEdwuuQ9ZXSBwum4GBrBb6IEryXJJDw=;
        b=YpM+EpjO+x8qcbU9vzu8E7tfCw90hBSYJIQjuyvsdo82Krt/tECJgMsPf6tifHSHAx
         p2WXZwnO8DrjFEiCuQ+3/4AG/hl7J2sFy1tavUTBCI0tX0KaGATjvahwJuQLKRwVN26S
         zuQU2kygHPsuTBsz3S1D71GErwIncPrixBRiP7HRnkZGk2ow1wTd97+X5CG3xsEI6yl1
         vSbrpzTOqzIEGI0eCZdL8zTJ3HAupWIZrMaGEisGlotDxwyfT/AxN6ZP5yMGLXGeGxIQ
         uyZO4Vm7Jz5LMNHeKmiChcUFXAZ184rhFrdTj+BYpJSLEqf2dLiswymSAZjDCPlrNxCf
         Y7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745643; x=1748350443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ny2gj+P5qO3fOEdwuuQ9ZXSBwum4GBrBb6IEryXJJDw=;
        b=sJJcga6O63a6U0KNJABhc86CCg1YZXXeC6BvSLSObsXzYt+L8uwkMOT+fik/5KrFuu
         Ckd0RDAglzH6MwtgWFd+cZl/SNwhcREuiuEcJ3I/ZpKYWuywNEd0iS6N89RkvfwEMIJm
         QCZX/ty4EEQUnuAWDYUrjEk3Yx2hugYlsQtgbB2nF2TEDHn3bQpkr/+xcKdiMaG6g+CX
         DjNTedrfncsb/SKkXq/6mMhC+oJ1Z1sX8j7KlpTLKMNd4MQmqyLgxSMQ77ohAuqQWdzA
         rNxyMivknArPtIa/RU7S9Yk9ipDto99Q1WgyCYOaexALKQHYIScLNW6bcQMmCOAKAYTw
         HNag==
X-Forwarded-Encrypted: i=1; AJvYcCUmJGz6f5RAKLT3kEKOhJirD2d4nd7MSjf+LXJ9KvZPRnh5tim+G4bNvmmf6iVDcKmMOjX79+ay8vV6ogp1v2+87g==@linaro.org, AJvYcCVQ2EehEVOGBGZZBZBU4waeUoWecbGanCY5wkZ7Tb/yomTPktKwUyG436RU+iXPHtep6jWTc7Q=@linaro.org, AJvYcCVwWgCIQBIWfnTAJJTFSZ73zy5qKsKcUGO1LpQeUcC1IMrCpwo115Skh7vGUVh6yJajkFEusJhXoUQiX2qHsHkS4oo=@linaro.org
X-Gm-Message-State: AOJu0Ywi2xxz8qDo99VRWqnYJUp9PHA+FUqA/vuQWOjRQq13tv4bq8XL
	r80mp4LvdEItgoK6DxWOqQSHa/+3LcmdbZYsw/g4PpSZJWBK1+wXlNTo
X-Gm-Gg: ASbGncv1r1ND7jFEuZyTsEoCMyHFhjHoiGGGu3YQ1xcMtAh3Khpht67AsUjSCBVoW2+
	Ik2f8jcZ+gKTUjreuC/knF+cUp7VwH/s0lXTH70nIh6IPhhp/vflyH9NpagJCdlqS9I2wAbAcbL
	eSxI0ashOrelBrfCQuyDkFsTSyGa1oXtYGMFSHpWiOaOhc4QIzQ0QTBw7nsckcHzpF0kUOmmqcJ
	yd2nTbWzI6qGUnymRjg8jjZ8Yd+VTGGFxtS16Wuobsc9/WmLf0L6+Mq0Eq68M5nMOFPkX04gNxU
	eAvFg3xTpjAHlTxBFWiJ2MYXO4WEIi1aEFpHtWW5cF13ANx1c/g=
X-Google-Smtp-Source: AGHT+IG3jBPOn/k3aPkAjgq6xDexOXXxHya/0hQuUYzVk8W1vJT86lB8gaIyA+uiA0eBqDY/HQ+GKA==
X-Received: by 2002:a17:90b:4b0f:b0:2f6:be57:49d2 with SMTP id 98e67ed59e1d1-30e7d545920mr29666251a91.17.1747745643411;
        Tue, 20 May 2025 05:54:03 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:54:02 -0700 (PDT)
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
Subject: [PATCH 19/33] tcg/wasm32: Add br/brcond instructions
Date: Tue, 20 May 2025 21:51:21 +0900
Message-ID: <65a405aecd6e2212217919337a546379699f1ed0.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 772WDcfB4vVS

Wasm does not support direct jumps to arbitrary code addresses, so
label-based control flow is implemented using Wasm's control flow
instructions. As illustrated in the pseudo-code below, each TB wraps its
instructions inside a large loop. Each set of codes separated by labels is
placed inside an "if" block. Br is implemented by breaking out of the
current block and conditionally entering the target block:

loop
  if
    ... code after label1
  end
  if
    ... code after label2
  end
  ...
end

Each block within the TB is assigned a unique int32 ID. The topmost "if"
block is assigned ID 0, and subsequent blocks are assigned incrementally.

To control br, this commit introduces a 17th Wasm variable BLOCK_PTR_IDX
which holds the ID of the target block. The br instruction sets this
variable to the target block's ID, breaks from the current if block, and
allows the control flow to move forward. Each if block checks whether the
BLOCK_PTR_IDX variable matches its assigned ID. If it does, execution
proceeds within that block.

The start of the global loop and the first if block is generated in
tcg_out_tb_start. To properly close the blocks, this commit also introduces
a new TCG backend callback tcg_out_tb_end which emits the "end" instructions
for the final if block and the loop block in the Wasm backend.

Another new callback tcg_out_label_cb is used to emit block boundaries,
specifically the end of the previous block and the if of the next block, at
label positions. In this callback, the mapping between label IDs and block
IDs is recorded in LabelInfo, which is later used to resolve br
instructions.

Since the block ID for a label might not be known at the time a br
instruction is generated, a placeholder (longer than 32bit and encoded as
LEB128) is emitted instead. These placeholders are tracked in
BlockPlaceholder and resolved later.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/aarch64/tcg-target.c.inc     |  11 ++
 tcg/arm/tcg-target.c.inc         |  11 ++
 tcg/i386/tcg-target.c.inc        |  11 ++
 tcg/loongarch64/tcg-target.c.inc |  11 ++
 tcg/mips/tcg-target.c.inc        |  11 ++
 tcg/ppc/tcg-target.c.inc         |  11 ++
 tcg/riscv/tcg-target.c.inc       |  11 ++
 tcg/s390x/tcg-target.c.inc       |  11 ++
 tcg/sparc64/tcg-target.c.inc     |  11 ++
 tcg/tcg.c                        |   7 ++
 tcg/tci/tcg-target.c.inc         |  11 ++
 tcg/wasm32/tcg-target.c.inc      | 180 +++++++++++++++++++++++++++++++
 12 files changed, 297 insertions(+)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 4cb647cb34..78ad3e913a 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -3518,6 +3518,17 @@ static void tcg_out_tb_start(TCGContext *s)
     tcg_out_bti(s, BTI_J);
 }
 
+static int tcg_out_tb_end(TCGContext *s)
+{
+    /* nothing to do */
+    return 0;
+}
+
+static void tcg_out_label_cb(TCGContext *s, TCGLabel *l)
+{
+    /* nothing to do */
+}
+
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 {
     int i;
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 447e43583e..2d911b1fe6 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -3441,6 +3441,17 @@ static void tcg_out_tb_start(TCGContext *s)
     /* nothing to do */
 }
 
+static int tcg_out_tb_end(TCGContext *s)
+{
+    /* nothing to do */
+    return 0;
+}
+
+static void tcg_out_label_cb(TCGContext *s, TCGLabel *l)
+{
+    /* nothing to do */
+}
+
 typedef struct {
     DebugFrameHeader h;
     uint8_t fde_def_cfa[4];
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 09fce27b06..2c7bad092f 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -4761,6 +4761,17 @@ static void tcg_out_tb_start(TCGContext *s)
     /* nothing to do */
 }
 
+static int tcg_out_tb_end(TCGContext *s)
+{
+    /* nothing to do */
+    return 0;
+}
+
+static void tcg_out_label_cb(TCGContext *s, TCGLabel *l)
+{
+    /* nothing to do */
+}
+
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 {
     memset(p, 0x90, count);
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index e5580d69a8..113c5df7fc 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -2658,6 +2658,17 @@ static void tcg_out_tb_start(TCGContext *s)
     /* nothing to do */
 }
 
+static int tcg_out_tb_end(TCGContext *s)
+{
+    /* nothing to do */
+    return 0;
+}
+
+static void tcg_out_label_cb(TCGContext *s, TCGLabel *l)
+{
+    /* nothing to do */
+}
+
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 {
     for (int i = 0; i < count; ++i) {
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 2c0457e588..965c4717c6 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2745,6 +2745,17 @@ static void tcg_out_tb_start(TCGContext *s)
     /* nothing to do */
 }
 
+static int tcg_out_tb_end(TCGContext *s)
+{
+    /* nothing to do */
+    return 0;
+}
+
+static void tcg_out_label_cb(TCGContext *s, TCGLabel *l)
+{
+    /* nothing to do */
+}
+
 static void tcg_target_init(TCGContext *s)
 {
     tcg_target_detect_isa();
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 2e94778104..d0b1e46709 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2859,6 +2859,17 @@ static void tcg_out_tb_start(TCGContext *s)
     }
 }
 
+static int tcg_out_tb_end(TCGContext *s)
+{
+    /* nothing to do */
+    return 0;
+}
+
+static void tcg_out_label_cb(TCGContext *s, TCGLabel *l)
+{
+    /* nothing to do */
+}
+
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
 {
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R3, arg);
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index f9417d15f7..de76d9fa8d 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -2983,6 +2983,17 @@ static void tcg_out_tb_start(TCGContext *s)
     init_setting_vtype(s);
 }
 
+static int tcg_out_tb_end(TCGContext *s)
+{
+    /* nothing to do */
+    return 0;
+}
+
+static void tcg_out_label_cb(TCGContext *s, TCGLabel *l)
+{
+    /* nothing to do */
+}
+
 static bool vtype_check(unsigned vtype)
 {
     unsigned long tmp;
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 7ca0071f24..c4404c999c 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -3830,6 +3830,17 @@ static void tcg_out_tb_start(TCGContext *s)
     /* nothing to do */
 }
 
+static int tcg_out_tb_end(TCGContext *s)
+{
+    /* nothing to do */
+    return 0;
+}
+
+static void tcg_out_label_cb(TCGContext *s, TCGLabel *l)
+{
+    /* nothing to do */
+}
+
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 {
     memset(p, 0x07, count * sizeof(tcg_insn_unit));
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 9e004fb511..7f9b8e5aad 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1017,6 +1017,17 @@ static void tcg_out_tb_start(TCGContext *s)
     /* nothing to do */
 }
 
+static int tcg_out_tb_end(TCGContext *s)
+{
+    /* nothing to do */
+    return 0;
+}
+
+static void tcg_out_label_cb(TCGContext *s, TCGLabel *l)
+{
+    /* nothing to do */
+}
+
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 {
     int i;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 2746458a64..778e84c40c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -115,6 +115,7 @@ static void tcg_register_jit_int(const void *buf, size_t size,
 
 /* Forward declarations for functions declared and used in tcg-target.c.inc. */
 static void tcg_out_tb_start(TCGContext *s);
+static int tcg_out_tb_end(TCGContext *s);
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
                        intptr_t arg2);
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
@@ -186,6 +187,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
 static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot);
 static bool tcg_target_const_match(int64_t val, int ct,
                                    TCGType type, TCGCond cond, int vece);
+static void tcg_out_label_cb(TCGContext *s, TCGLabel *l);
 
 #ifndef CONFIG_USER_ONLY
 #define guest_base  ({ qemu_build_not_reached(); (uintptr_t)0; })
@@ -360,6 +362,7 @@ static void tcg_out_label(TCGContext *s, TCGLabel *l)
     tcg_debug_assert(!l->has_value);
     l->has_value = 1;
     l->u.value_ptr = tcg_splitwx_to_rx(s->code_ptr);
+    tcg_out_label_cb(s, l);
 }
 
 TCGLabel *gen_new_label(void)
@@ -7045,6 +7048,10 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start)
     if (!tcg_resolve_relocs(s)) {
         return -2;
     }
+    i = tcg_out_tb_end(s);
+    if (i < 0) {
+        return i;
+    }
 
 #if !defined(CONFIG_TCG_INTERPRETER) && !defined(EMSCRIPTEN)
     /* flush instruction cache */
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 35c66a4836..d99d06c1da 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -1301,6 +1301,17 @@ static void tcg_out_tb_start(TCGContext *s)
     /* nothing to do */
 }
 
+static int tcg_out_tb_end(TCGContext *s)
+{
+    /* nothing to do */
+    return 0;
+}
+
+static void tcg_out_label_cb(TCGContext *s, TCGLabel *l)
+{
+    /* nothing to do */
+}
+
 bool tcg_target_has_memory_bswap(MemOp memop)
 {
     return true;
diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index 167850ea7c..ea0d1ca874 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -123,6 +123,11 @@ static const uint8_t tcg_target_reg_index[TCG_TARGET_NB_REGS] = {
  */
 #define CARRY_IDX 16
 
+/*
+ * Global variable Index used for storing the current block index
+ */
+#define BLOCK_PTR_IDX 17
+
 /* Temporary local variables */
 #define TMP32_LOCAL_0_IDX 1
 #define TMP32_LOCAL_1_IDX 2
@@ -341,6 +346,16 @@ static void tcg_wasm_out_op_i64_eqz(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x50);
 }
+static void tcg_wasm_out_op_br(TCGContext *s, int i)
+{
+    tcg_wasm_out8(s, 0x0c);
+    tcg_wasm_out8(s, i);
+}
+static void tcg_wasm_out_op_loop_noret(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x03);
+    tcg_wasm_out8(s, 0x40);
+}
 static void tcg_wasm_out_op_if_noret(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x04);
@@ -1357,6 +1372,152 @@ static void tcg_wasm_out_div_u(
     }
 }
 
+typedef struct LabelInfo {
+    struct LabelInfo *next;
+    int label;
+    int block;
+} LabelInfo;
+
+__thread LabelInfo *label_info;
+
+static void init_label_info(void)
+{
+    label_info = NULL;
+}
+
+static void add_label(int label, int block)
+{
+    LabelInfo *e = tcg_malloc(sizeof(LabelInfo));
+    e->label = label;
+    e->block = block;
+    e->next = NULL;
+    if (label_info == NULL) {
+        label_info = e;
+        return;
+    }
+    LabelInfo *last = label_info;
+    for (LabelInfo *p = last; p; p = p->next) {
+        last = p;
+    }
+    last->next = e;
+}
+
+typedef struct BlockPlaceholder {
+    struct BlockPlaceholder *next;
+    int label;
+    int pos;
+} BlockPlaceholder;
+
+__thread BlockPlaceholder *block_placeholder;
+
+__thread int block_idx;
+
+static void init_blocks(void)
+{
+    block_placeholder = NULL;
+    block_idx = 0;
+}
+
+static void add_block_placeholder(int label, int pos)
+{
+    BlockPlaceholder *e = tcg_malloc(sizeof(BlockPlaceholder));
+    e->label = label;
+    e->pos = pos;
+    e->next = NULL;
+    if (block_placeholder == NULL) {
+        block_placeholder = e;
+        return;
+    }
+    BlockPlaceholder *last = block_placeholder;
+    for (BlockPlaceholder *p = last; p; p = p->next) {
+        last = p;
+    }
+    last->next = e;
+}
+
+static int get_block_of_label(int label)
+{
+    for (LabelInfo *p = label_info; p; p = p->next) {
+        if (p->label == label) {
+            return p->block;
+        }
+    }
+    return -1;
+}
+
+static void tcg_wasm_out_new_block(TCGContext *s)
+{
+    tcg_wasm_out_op_end(s); /* close this block */
+
+    /* next block */
+    tcg_wasm_out_op_global_get(s, BLOCK_PTR_IDX);
+    tcg_wasm_out_op_i64_const(s, ++block_idx);
+    tcg_wasm_out_op_i64_le_u(s);
+    tcg_wasm_out_op_if_noret(s);
+}
+
+static void tcg_out_label_cb(TCGContext *s, TCGLabel *l)
+{
+    add_label(l->id, block_idx + 1);
+    tcg_wasm_out_new_block(s);
+}
+
+static void tcg_wasm_out_op_br_to_label(TCGContext *s, TCGLabel *l, bool br_if)
+{
+    int toploop_depth = 1;
+    if (br_if) {
+        tcg_wasm_out_op_if_noret(s);
+        toploop_depth++;
+    }
+    tcg_wasm_out8(s, 0x42); /* i64.const */
+
+    add_block_placeholder(l->id, sub_buf_len());
+
+    tcg_wasm_out8(s, 0x80); /* filled before instantiation */
+    tcg_wasm_out8(s, 0x80);
+    tcg_wasm_out8(s, 0x80);
+    tcg_wasm_out8(s, 0x80);
+    tcg_wasm_out8(s, 0x00);
+    tcg_wasm_out_op_global_set(s, BLOCK_PTR_IDX);
+    if (get_block_of_label(l->id) != -1) {
+        /*
+         * The label is placed before this br, branch to the top of loop
+         */
+        tcg_wasm_out_op_br(s, toploop_depth);
+    } else {
+        /*
+         * The label will be generated after this br,
+         * branch to the end of the current block
+         */
+        tcg_wasm_out_op_br(s, toploop_depth - 1);
+    }
+    if (br_if) {
+        tcg_wasm_out_op_end(s);
+    }
+}
+
+static void tcg_wasm_out_br(TCGContext *s, TCGLabel *l)
+{
+    tcg_wasm_out_op_br_to_label(s, l, false);
+}
+
+static void tcg_wasm_out_brcond(TCGContext *s, TCGType type,
+                                TCGReg arg1, TCGReg arg2,
+                                TCGCond cond, TCGLabel *l)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_cond_i32(s, cond, arg1, arg2);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_op_cond_i64(s, cond, arg1, arg2);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    tcg_wasm_out_op_br_to_label(s, l, true);
+}
+
 static bool patch_reloc(tcg_insn_unit *code_ptr_i, int type,
                         intptr_t value, intptr_t addend)
 {
@@ -2512,6 +2673,7 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond cond,
 {
     tgen_setcond_tci(s, type, cond, TCG_REG_TMP, arg0, arg1);
     tcg_out_op_rl(s, INDEX_op_brcond, TCG_REG_TMP, l);
+    tcg_wasm_out_brcond(s, type, arg0, arg1, cond, l);
 }
 
 static const TCGOutOpBrcond outop_brcond = {
@@ -2576,6 +2738,7 @@ static void tcg_out_mb(TCGContext *s, unsigned a0)
 static void tcg_out_br(TCGContext *s, TCGLabel *l)
 {
     tcg_out_op_l(s, INDEX_op_br, l);
+    tcg_wasm_out_br(s, l);
 }
 
 static void tgen_ld8u(TCGContext *s, TCGType type, TCGReg dest,
@@ -2796,6 +2959,23 @@ static inline void tcg_target_qemu_prologue(TCGContext *s)
 static void tcg_out_tb_start(TCGContext *s)
 {
     init_sub_buf();
+    init_blocks();
+    init_label_info();
+
+    tcg_wasm_out_op_loop_noret(s);
+    tcg_wasm_out_op_global_get(s, BLOCK_PTR_IDX);
+    tcg_wasm_out_op_i64_eqz(s);
+    tcg_wasm_out_op_if_noret(s);
+}
+
+static int tcg_out_tb_end(TCGContext *s)
+{
+    tcg_wasm_out_op_end(s); /* end if */
+    tcg_wasm_out_op_end(s); /* end loop */
+    tcg_wasm_out8(s, 0x0);  /* unreachable */
+    tcg_wasm_out_op_end(s); /* end func */
+
+    return 0;
 }
 
 bool tcg_target_has_memory_bswap(MemOp memop)
-- 
2.43.0

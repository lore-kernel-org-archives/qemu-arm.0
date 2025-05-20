Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475189njc;
        Tue, 20 May 2025 05:52:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3905:b0:2ff:5357:1c7f with SMTP id 98e67ed59e1d1-30e7d5cfddbmr23728082a91.30.1747745564937;
        Tue, 20 May 2025 05:52:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745564; cv=none;
        d=google.com; s=arc-20240605;
        b=NsRVQolSoJoWy8BmoDp1R7tt0ITmhA467GsHG9Wq3OmXmV12JekWDEYDnfl6UWxHJJ
         pcfTuqd8Zh/85Zx3DlL7ySbj/xdnsmbC11hrA+E3P7WtoJumfRPUXzAzxN8JKc4Feko0
         624OGUrWekK7b2GKhlIgaHm2MRfmQrJchnk2n2FkEUuVy4OTet8HP+H8NUnX4KxsHthE
         rB1bAFVpmbtoaWDdm46nC0Cyj37EMiFnFy7JGiJzXS8sjUVVtVDPJmtGLGwCMb3pUgtZ
         KujGP5T66ujm8fV2TpzgQHV8vCwSd9AbFCY/s6iT9sAvQ8H7Wzm5qNQhPP2WVMdVPePm
         yCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=p6Z5PLd1E/Owph8lAEt4RDxXTFlaySbmORvNcNjfV1I=;
        fh=ffD/SAvt7wSPC/xcy8574ABjjLV51ZeAjvxX+zWLr4g=;
        b=HdpR6Lk7s4D8p4nHB7txvh4PJ2xc/S95rNmG9ffvERL26YncatQ2TCGkbb3vkv3UKS
         0w8h/en1wS1+F1fZJt2rjQApv/4/msg21UX0jBnpzhatOxNxKz+6j/RDh+olGFgF3PZJ
         3ZmXJbBsarLMGlpipPebeYJzeOZCu75FByQfmRe20QvaKYGW6uU03yDm+VJ6EQ5tH5c3
         ZEVMZtLz8bqRNYdxqY33dyPanrlOQmcS4GvyBwmWHhzHb5jwoF825rJ9IIKOlsuE7TUK
         TME6wPEeMrmP9C7Ruxixd3ONOXuVZMIaZku0+zdc67HVGAT5FLnz/nPv2yXL1br7CyRU
         Zsgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=VNfuRhac;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e7d592480sor6968081a91.8.2025.05.20.05.52.44
        (Google Transport Security);
        Tue, 20 May 2025 05:52:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=VNfuRhac;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745564; x=1748350364; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6Z5PLd1E/Owph8lAEt4RDxXTFlaySbmORvNcNjfV1I=;
        b=VNfuRhac33EfiX8YdXfDLSvBphddBsbUWPHmM/nwjmgfSU17dqWn1sQA9H/XAuTRwD
         bNAI3Pd72wxm67GG5nXBlqaMhOlaJiUCy9uEN4wZ1b+cHV3M/dzw6mEfwbn/3MTj0698
         ct4Tm137dPlTlx1we361XZ70GJTzsSkD8+R00prjCvGThLckjkDwueBLyY/UnR8qXxz1
         +h+W1IkdNKkET/eEQaD3InZ9o6SOy2ejm8Y3cqS5pXdg8dNRgfAYym1EoKl/x3oc1jMq
         TpKX7uO/xDzylL7AsyuAx1KXWEZ3pegN4dJt05RyHa19A+Ax9V7u9+0rz3Uxs8LbSTP5
         CucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745564; x=1748350364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6Z5PLd1E/Owph8lAEt4RDxXTFlaySbmORvNcNjfV1I=;
        b=kHM/SDNBaZMruBmkwuGnBv9fn9FgB+lWy8W25xTVV0AwSaa8Y4J2RWBKpt0il2t6yk
         k/++aeY4EG7k5eengUCFyT6Zp+i31qxenO0xBKXha5d0kUo0josGUtL0QVmge0AKJp50
         WslIG8KjYnGpFP+N8khIdOF0uh67+wfj4hAZXNS+rEfcS4lH620S2Mdv3ES4LS2HAuRf
         /YE3qRHxKj3BCdJbbxEKYUoGW8hxUlVlx+y83itG7mS5fJ0aA5czWn8cV4G7qAyhdfUL
         XO62MQjs/bj+6DWjF0Vo/jWKow/mZRvh1vxLN4FwNS+AIRWObYcbFvMJTgSdYoFkUhIu
         W6rA==
X-Forwarded-Encrypted: i=1; AJvYcCUYzONUKP7eMOdaSaktq/4oz6qYAZ7FUrl0vYfpuUn8uWmzcsCRmDzNtEg1HmJ7fy6BscwEt7Vi3LzaMzGuYiYj2A==@linaro.org, AJvYcCVI8B0YCwhzRrqRLCkxJSaj6tuGP7gv6SVUTJMH02sw/ngWHkLWPm+QAdqC6DKWZrYxG1gtqiE=@linaro.org, AJvYcCWAH1aZWsY1IC4NtVmHhwLIv55eWPtWEjxqnG4o9i1/FomzBaCH1tdBJRa6/XDsKuehjPy6MYCi9JBewt6VbDcSI38=@linaro.org
X-Gm-Message-State: AOJu0Yw4a99Nt/M9WiC7575FyWMsATPU0pfoTEmCpdqDOuzQkr5DRb0l
	nFo1U2MdMDJZszEn4wZmItb43Qk98UZSidS98KM6JqE9RmnCSHhc6Ye/
X-Gm-Gg: ASbGncuvK5PrBRt1synknyIaEiJZUOd5y4VEaUE8eQzielCMgziVh/QeLs3N43Bz4O+
	UXDUJlwoXWuCKDNQ1fdvBLGdf2Ht1EVrdeCncYDwUfKuu54hhA+nH+gxU8utwAmgm3lK9YGdAD6
	7fwo8zG8H+Dkgn3k/2pbEY8NpfdFZ9A0cs/gcNYCD8gpNmnySoNKFy2Si5yed3zaEs9B6d7EuSy
	Uv7BKxFXTz05El0awgJq3jEmu13jG7zxuPNq3gjvkoz4LL6OAZaN/mC+MPuzTaot5wJezaHkUam
	sBNSHgJ1Ju982H/8RhRA0oHBJ5EV61bH1kFTYAaHZ8H7d2H+WZU=
X-Google-Smtp-Source: AGHT+IGav8G7VTphYSuRGrIc749qNZXTTFQq2XCpKhtKKY5hmmw6L/nazwAm2gCLphSuQxNyXadgJA==
X-Received: by 2002:a17:90a:e7cf:b0:30a:9025:84d1 with SMTP id 98e67ed59e1d1-30e7d558d59mr29217944a91.16.1747745564197;
        Tue, 20 May 2025 05:52:44 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:52:43 -0700 (PDT)
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
Subject: [PATCH 05/33] tcg/wasm32: Add and/or/xor instructions
Date: Tue, 20 May 2025 21:51:07 +0900
Message-ID: <582f109d49c5ef294ce7ad55ac75466f3128431a.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 9DrP8UvBjXHl

This commit implements and, or and xor operations using Wasm
instructions. Each TCG variable is mapped to a 64bit Wasm variable. In Wasm,
and/or/xor instructions operate on values by first pushing the operands into
the Wasm's stack using get instructions. The result is left on the stack and
this can be assigned to a variable by popping it using a set instruction.

The Wasm binary format is documented at [1]. In this backend, TCI
instructions are emitted to s->code_ptr, while the corresponding Wasm
instructions are generated into a separated buffer allocated via
tcg_malloc(). These two code buffers must be merged into the final code
buffer before tcg_gen_code returns.

[1] https://webassembly.github.io/spec/core/binary/index.html

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 137 +++++++++++++++++++++++++++++++++++-
 1 file changed, 136 insertions(+), 1 deletion(-)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index 126f9c0de7..e3a35c8415 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -98,6 +98,138 @@ static const char *const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 };
 #endif
 
+/* converts a TCG register to a wasm variable index */
+static const uint8_t tcg_target_reg_index[TCG_TARGET_NB_REGS] = {
+    0,  /* TCG_REG_R0 */
+    1,  /* TCG_REG_R1 */
+    2,  /* TCG_REG_R2 */
+    3,  /* TCG_REG_R3 */
+    4,  /* TCG_REG_R4 */
+    5,  /* TCG_REG_R5 */
+    6,  /* TCG_REG_R6 */
+    7,  /* TCG_REG_R7 */
+    8,  /* TCG_REG_R8 */
+    9,  /* TCG_REG_R9 */
+    10, /* TCG_REG_R10 */
+    11, /* TCG_REG_R11 */
+    12, /* TCG_REG_R12 */
+    13, /* TCG_REG_R13 */
+    14, /* TCG_REG_R14 */
+    15, /* TCG_REG_R15 */
+};
+
+#define BUF_SIZE 1024
+typedef struct LinkedBuf {
+    struct LinkedBuf *next;
+    uint8_t data[BUF_SIZE];
+    uint32_t size;
+} LinkedBuf;
+
+static LinkedBuf *new_linked_buf(void)
+{
+    LinkedBuf *p = tcg_malloc(sizeof(LinkedBuf));
+    p->size = 0;
+    p->next = NULL;
+    return p;
+}
+
+static inline LinkedBuf *linked_buf_out8(LinkedBuf *buf, uint8_t v)
+{
+    if (buf->size == BUF_SIZE) {
+        buf->next = new_linked_buf();
+        buf = buf->next;
+    }
+    buf->data[buf->size++] = v;
+    return buf;
+}
+
+static inline int linked_buf_len(LinkedBuf *buf)
+{
+    int total = 0;
+    for (LinkedBuf *p = buf; p; p = p->next) {
+        total += p->size;
+    }
+    return total;
+}
+
+static inline void linked_buf_write(LinkedBuf *buf, void *dst)
+{
+    for (LinkedBuf *p = buf; p; p = p->next) {
+        memcpy(dst, p->data, p->size);
+        dst += p->size;
+    }
+}
+
+/*
+ * wasm code is generataed in the dynamically allocated buffer which
+ * are managed as a linked list.
+ */
+__thread LinkedBuf *sub_buf_root;
+__thread LinkedBuf *sub_buf_cur;
+
+static void init_sub_buf(void)
+{
+    sub_buf_root = new_linked_buf();
+    sub_buf_cur = sub_buf_root;
+}
+
+static inline int sub_buf_len(void)
+{
+    return linked_buf_len(sub_buf_root);
+}
+
+static inline void tcg_wasm_out8(TCGContext *s, uint32_t v)
+{
+    sub_buf_cur = linked_buf_out8(sub_buf_cur, v);
+}
+
+static void tcg_wasm_out_op_i64_and(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x83);
+}
+static void tcg_wasm_out_op_i64_or(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x84);
+}
+static void tcg_wasm_out_op_i64_xor(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x85);
+}
+static void tcg_wasm_out_op_var(TCGContext *s, uint8_t instr, uint8_t i)
+{
+    tcg_wasm_out8(s, instr);
+    tcg_wasm_out8(s, i);
+}
+static void tcg_wasm_out_op_global_get(TCGContext *s, uint8_t i)
+{
+    tcg_wasm_out_op_var(s, 0x23, i);
+}
+static void tcg_wasm_out_op_global_set(TCGContext *s, uint8_t i)
+{
+    tcg_wasm_out_op_var(s, 0x24, i);
+}
+static void tcg_wasm_out_op_global_get_r(TCGContext *s, TCGReg r0)
+{
+    tcg_wasm_out_op_global_get(s, tcg_target_reg_index[r0]);
+}
+static void tcg_wasm_out_op_global_set_r(TCGContext *s, TCGReg r0)
+{
+    tcg_wasm_out_op_global_set(s, tcg_target_reg_index[r0]);
+}
+
+#define tcg_wasm_out_i64_calc(op)                                       \
+    static void tcg_wasm_out_i64_calc_##op(                             \
+        TCGContext *s, TCGReg ret, TCGReg arg1, TCGReg arg2)            \
+    {                                                                   \
+        tcg_wasm_out_op_global_get_r(s, arg1);                          \
+        tcg_wasm_out_op_global_get_r(s, arg2);                          \
+        tcg_wasm_out_op_i64_##op(s);                                    \
+        tcg_wasm_out_op_global_set_r(s, ret);                           \
+    }
+tcg_wasm_out_i64_calc(and);
+tcg_wasm_out_i64_calc(or);
+tcg_wasm_out_i64_calc(xor);
+
 static bool patch_reloc(tcg_insn_unit *code_ptr_i, int type,
                         intptr_t value, intptr_t addend)
 {
@@ -557,6 +689,7 @@ static void tgen_and(TCGContext *s, TCGType type,
                      TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_and, a0, a1, a2);
+    tcg_wasm_out_i64_calc_and(s, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_and = {
@@ -747,6 +880,7 @@ static void tgen_or(TCGContext *s, TCGType type,
                      TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_or, a0, a1, a2);
+    tcg_wasm_out_i64_calc_or(s, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_or = {
@@ -918,6 +1052,7 @@ static void tgen_xor(TCGContext *s, TCGType type,
                      TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_xor, a0, a1, a2);
+    tcg_wasm_out_i64_calc_xor(s, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_xor = {
@@ -1305,7 +1440,7 @@ static inline void tcg_target_qemu_prologue(TCGContext *s)
 
 static void tcg_out_tb_start(TCGContext *s)
 {
-    /* nothing to do */
+    init_sub_buf();
 }
 
 bool tcg_target_has_memory_bswap(MemOp memop)
-- 
2.43.0

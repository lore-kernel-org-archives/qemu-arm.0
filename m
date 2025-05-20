Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475695njc;
        Tue, 20 May 2025 05:53:43 -0700 (PDT)
X-Received: by 2002:a17:902:f54a:b0:224:1eab:97b2 with SMTP id d9443c01a7336-231de3baf53mr237249715ad.53.1747745623028;
        Tue, 20 May 2025 05:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745623; cv=none;
        d=google.com; s=arc-20240605;
        b=NlxjuSF8Af3spLXfYok8ph4gV1Tw8zseXE343bSO9tmc8hRqfA0H7y278JEqrNtjmC
         4WnS1Eo20WHXFDfBFnDSRIPwah8KNy3P6tOXGGpzVWLKvhJfMbiKowNnptvcYe/TLkvN
         UF2Dilg5ytI7nBgRLdkeI9zxijE2xSVcKueOqPEZgwAx9hVVNBKp1Ag5YJhXIdmK+/em
         TQEump9fiXLTY08Z0qWZf1pI6AHB104nNi/fQIaRD2I1VJK16RxiuDx4kM7iLYSOY7SZ
         F/u5Pf8uRtMdrQVqLvdhgHLFERH1gFDYWzcfzqJUQGywGezcm9hUqpNAI5Ds1720QPuz
         1UFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=u2q8jR3NRvJr0acKyFRjELmA4piI07T787KQwfPUSTw=;
        fh=tWTt8Olro8PC37fQdxD6xuQ6xgO4WCqVV5dOPMANeFQ=;
        b=bHf8jolOP8ipc92WmL3hCTNjjHSmXxYbNeDF4RV9Dx+7sseP7DLrzeeuO5ghhCBzs+
         JlnVAlyRl3XImXQCPWCSNOeB/kxUgpFegchUYYtK+L/VWp9itB4uVOsBoAEbawyrFVQB
         kpFxLiDOp/HXd7jhNkiXbzm5QtmhvXhQ+8y1EjwdcLFAFKP8ZYuFpTz0qZnLlYgs/80B
         gNsl+5ctnLJIop2Gp2xV2zssJjCNkQD/b9jq4K+sbV0vvVccqgnriXlKrulJA8JGF2gA
         /m5PXqcjsNZ5zRuPH1VQz7Snf61GFKhIiNtPSUJYwqP/aJVhTnQ7kVwLkoZras6tRb++
         QuqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kwCVSG18;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-231d4ad7ddasor62076075ad.6.2025.05.20.05.53.35
        (Google Transport Security);
        Tue, 20 May 2025 05:53:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kwCVSG18;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745615; x=1748350415; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2q8jR3NRvJr0acKyFRjELmA4piI07T787KQwfPUSTw=;
        b=kwCVSG184kMlByYAnSTTWQ130lyxgdGIxkHgu/mKx/Yn1KINDO3qWVSwFMT+rS28pf
         A/LocJVfXvzR/m9eaDSHaym6unp1CVpqZ4J76D3Qr4WlieSwzKESycY5LXRL/1aBzXok
         07wi3DPFsAF+cnWT8JvCIqwg5iQj/spnxujtOEErhitUy5AiU8YIgAOYYChGK9uiA3ye
         R0L0iBBjA0B65PVbqLFsk1HbNSmZItjMA8ZmBxMV3/2YIUCM6jVpW4yLaclt/cTzHdg0
         uh/g+tDu1njlLeZckxVvpgN+oH3+O9uE/0dOHh6/3O14W0UN6CedSDc+1rVhsoF7LXVa
         iACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745615; x=1748350415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2q8jR3NRvJr0acKyFRjELmA4piI07T787KQwfPUSTw=;
        b=R5t7jva5NGv4K3VZ3lnb7sSYDvHM3k+t9JrtKpA+9Uy1+YIvXrWi01fFSkBKrVRyL3
         NR7Dj1OdUwaPL7MvA6pVjTXhCTpY0lZ4Z43548EwacvO0T7dCa6ge8hjiMDVqfhFYKK/
         JUa57tgcNzxf0lhL3V9sckdqCtBZfrxYKGyE0BnbVhk5DmDs/6m87uJXx+4Ar1B05dLC
         ssxYgmqMc1zZ7Mgz185GoOR6be5YrhD+kMopFRLWWG3bAo5wMfQM5goGHXucZGZwYXAb
         IuPzyqKgDstmlaXES0qX8w2UziLBdgv9UwTWZ5l/cS1I+hokbRTpcoIZTKRg7Q++CGg6
         AXUw==
X-Forwarded-Encrypted: i=1; AJvYcCU5bPKTZiMeDLETCDZZq8+QZZ1Z6hNpNXkfbc+zxJ+04qlJnyC6tcbH/dP1ASTMKirgemc2W2ItFHk7Ypy/6KW+Ag==@linaro.org, AJvYcCUu1XayhloYOG68oyVQiqVZaKe7v+svR39nIFmN71hEe4wnpx0r3EtP3oJaIsvzKcOfZqO11V0QSmkMqLZoY17l64g=@linaro.org, AJvYcCVxBGL8bd+Hn5wEF29QxvauytbViZR4by/Wh/UsC8V++n1L/qZU+s/xgWjlZLdopGuWs2novKg=@linaro.org
X-Gm-Message-State: AOJu0YzZSbVjyRjx3tzlduriaF/oxxbpklIhThB5Vf2qFFAm/3Sleibw
	wsVhlMQ3zn6Va+TkG9zTwYbPV9ViUnEK0FE06FRskPqpzzclOHptos2DRpng2urX
X-Gm-Gg: ASbGncsiI3qU9lBGfm0dHtLfTsIyZ/ca1CRBqUv597ZM6/3mLL7uVmDICsM2y8Wp4gr
	sIOP4pd13+ujlvXu77X0QaPxz/MiAoLmLonHEVH6jHyYgmfw84+KaxT4T9NUO92C+HtT2jLlkA7
	Z3igFtG2v+mgQpTiV5WXr2ONP6IH9XUNDDqTq0fDLn21376eeMPapbGemEulYSMWpQS3HRON/pI
	PnMjtqXnhrcqMGu/KOrbLUN4fLyDXTXAZIa4m/qS4LmoRrrqCLBHDsyOJ0IUxd9ekYrx0sOErSl
	C6uZFGIN8nUy0NP07S3959rd8iIw4k5r0DwKWiDQm4m8/VZu+4Fyk+ykesJByQ==
X-Google-Smtp-Source: AGHT+IH4pYR+xBvjcKBjbRkQTBRJT8LDwYpUVuUOiwlfPNjevxQmlAFw2Wowy5/kkLk1V1frDu+5lA==
X-Received: by 2002:a17:90a:e70f:b0:2ff:5e4e:864 with SMTP id 98e67ed59e1d1-30e832162d4mr26751801a91.25.1747745615178;
        Tue, 20 May 2025 05:53:35 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:53:34 -0700 (PDT)
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
Subject: [PATCH 14/33] tcg/wasm32: Add rem/div instructions
Date: Tue, 20 May 2025 21:51:16 +0900
Message-ID: <46ce312e6bfd409ab1ba882470bf4f1508e545e5.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nve8UXZuRBOs

This commit implements rem and div operations using Wasm's rem/div
instructions.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 120 ++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index 1a6069e288..66d3977d31 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -212,6 +212,22 @@ static void tcg_wasm_out_op_i64_mul(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x7e);
 }
+static void tcg_wasm_out_op_i64_div_s(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x7f);
+}
+static void tcg_wasm_out_op_i64_div_u(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x80);
+}
+static void tcg_wasm_out_op_i64_rem_s(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x81);
+}
+static void tcg_wasm_out_op_i64_rem_u(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x82);
+}
 static void tcg_wasm_out_op_i64_shl(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x86);
@@ -995,6 +1011,106 @@ static void tcg_wasm_out_movi(TCGContext *s, TCGType type,
    tcg_wasm_out_op_global_set_r(s, ret);
 }
 
+static void tcg_wasm_out_rem_s(
+    TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1, TCGReg arg2)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        tcg_wasm_out_op_i64_extend_i32_s(s);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        tcg_wasm_out_op_i64_extend_i32_s(s);
+        tcg_wasm_out_op_i64_rem_s(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i64_rem_s(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_wasm_out_rem_u(
+    TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1, TCGReg arg2)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i64_const(s, 0xffffffff);
+        tcg_wasm_out_op_i64_and(s);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i64_const(s, 0xffffffff);
+        tcg_wasm_out_op_i64_and(s);
+        tcg_wasm_out_op_i64_rem_u(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i64_rem_u(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_wasm_out_div_s(
+    TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1, TCGReg arg2)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        tcg_wasm_out_op_i64_extend_i32_s(s);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        tcg_wasm_out_op_i64_extend_i32_s(s);
+        tcg_wasm_out_op_i64_div_s(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i64_div_s(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_wasm_out_div_u(
+    TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1, TCGReg arg2)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i64_const(s, 0xffffffff);
+        tcg_wasm_out_op_i64_and(s);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i64_const(s, 0xffffffff);
+        tcg_wasm_out_op_i64_and(s);
+        tcg_wasm_out_op_i64_div_u(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i64_div_u(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static bool patch_reloc(tcg_insn_unit *code_ptr_i, int type,
                         intptr_t value, intptr_t addend)
 {
@@ -1556,6 +1672,7 @@ static void tgen_divs(TCGContext *s, TCGType type,
                      ? INDEX_op_tci_divs32
                      : INDEX_op_divs);
     tcg_out_op_rrr(s, opc, a0, a1, a2);
+    tcg_wasm_out_div_s(s, type, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_divs = {
@@ -1574,6 +1691,7 @@ static void tgen_divu(TCGContext *s, TCGType type,
                      ? INDEX_op_tci_divu32
                      : INDEX_op_divu);
     tcg_out_op_rrr(s, opc, a0, a1, a2);
+    tcg_wasm_out_div_u(s, type, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_divu = {
@@ -1718,6 +1836,7 @@ static void tgen_rems(TCGContext *s, TCGType type,
                      ? INDEX_op_tci_rems32
                      : INDEX_op_rems);
     tcg_out_op_rrr(s, opc, a0, a1, a2);
+    tcg_wasm_out_rem_s(s, type, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_rems = {
@@ -1732,6 +1851,7 @@ static void tgen_remu(TCGContext *s, TCGType type,
                      ? INDEX_op_tci_remu32
                      : INDEX_op_remu);
     tcg_out_op_rrr(s, opc, a0, a1, a2);
+    tcg_wasm_out_rem_u(s, type, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_remu = {
-- 
2.43.0

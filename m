Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475063njc;
        Tue, 20 May 2025 05:52:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4987:b0:30e:9349:2d8e with SMTP id 98e67ed59e1d1-30e9349311dmr22248405a91.7.1747745548320;
        Tue, 20 May 2025 05:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745548; cv=none;
        d=google.com; s=arc-20240605;
        b=LGINkgxW2hrX4T//+auCmqyBfWRcfqhuRFLQw9t80/hUh+jewb8lBHAVM8K+SPMBBv
         0/hmh/QTc73pJfgNwk/3e2kAiWiU5lAF2GfUSQyl+sKNV+BvfoZIfZiHSovzNaoif5ex
         CC7rc6rSkcudDAkazyq3e3kpRwyITiRKh6Q9TSW/+SRX4a/xwwmsNE1mUDLmbrZtad9l
         P4JUouIr8oiTekLNzc2Xtz3vwM7c633kIxe2wR7rmyYGYcx69TDOeEORWn+GrcWGZpKI
         QQYt/ROATDbVb1YkB1IT2xQuadyO5Kjlg7XSF5fcT2uXvHzuaw6dhQ7mnaJMbz6ov5G1
         H4Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YCCbP2uzO+MJ8NbcqqepaB7q1+AuafpCtigscHDquGQ=;
        fh=0qRjdJ4RCOCYE8s7skUiTF1gmDfG0ybiSZ6CG/4HU3M=;
        b=kL6k8cxH6g7Vq4WUETBRoOwfoIE+/yG+ZY2dzlgcFQB1lP6CSZQ70/X4oeWUnFhz8v
         IlD02agYsWHVpk2EriH+Z8K4VWH4e8N9eNn/+9koB18G2ERU68+1JiF3Zv3z46BFJ7Vg
         NJMbYNMna/1wNR9ncw+4pjthue2vJXRHxD6k0Fx2AIzaaMd3UtMZYnvdwhU0opzpek+X
         ldqxFijQufG1Ol5sS1uFSeyB5cJOZ72JD0NRKUZiVM6GpD+SO/42uXsUdWj66ngsWgK3
         BGT71kZ6sx1hrS+0OfUlZv7kZ618mKuxY9XcbjKNRpOFN/RE+dbhjxk74nwucUa0gYdk
         rnzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=R9cB1Wbr;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b26c6eb1db3sor6961129a12.1.2025.05.20.05.52.27
        (Google Transport Security);
        Tue, 20 May 2025 05:52:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=R9cB1Wbr;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745547; x=1748350347; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCCbP2uzO+MJ8NbcqqepaB7q1+AuafpCtigscHDquGQ=;
        b=R9cB1Wbr2MzNsJL5KvhcKD/4jWqs6zbLn82OUibqELnMv2hx1kKpoCzYGdYFdLo7EA
         pB0xbwSnUz9d3/QcwizwEGiCAgwhWc37rJZCxeYUpjybgxZIzijHk7azPP2g9BEHC3lQ
         tcEPW58me0UciucQ9hJlU/Dumjc5eSISJiOGYzOUawF1DndE/LhvsWf52y624o8JE3vo
         e/3wDPuBSB2FIy4PpW+IUtwiOJiJ8JdNOc/RV6iN8ayJTQua7BYlRSfs6FbtAkPlauqD
         CxD21mwzOCeQyELFyhI9fKmDZja3MktDiaHFKrgH+F2OQC/utwyK+kbCxxIbxED3EhPR
         dyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745547; x=1748350347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCCbP2uzO+MJ8NbcqqepaB7q1+AuafpCtigscHDquGQ=;
        b=p8CYlqaAozGuFb+9dkJsjT9qsAQzsM6hmnH/N8akANrvmTrtsIbXtZSlr3mjrqEApJ
         +aTfyHsmJmndOQkA9kXwGUOc5wNwGj0CM17qSeitzqrfJOLPs+t1kJbbQmXqmt6nljaC
         LR0cAXPKAYjYlV5QHvwS8DRgCf/V+fZM/svoWvcNT/DBA4PUHlgKh76rwbD+fKfnKZSV
         2pnop+SgfN0j7mlUj4wQ7Qiu8Bt16W2t03jWVvTuZ/JlkdHnv33XqzVuWoGCIwyLjXPs
         c+/GQbeex4S4UbI4v+jFfh96ptf8g+ZoCkINwkLHtv97tCt0F7+k0CJ71pgF3JIKTR3A
         1IQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy/+BmkIPEL3Pf3/W79/e+NWCCWD0QkKcCXfvb8IG/yaglIm8hP1pXfoN0RJ0g+GGcqiZMv7cuFQS32GmjrxyCbg==@linaro.org, AJvYcCW4UUfl6G1DGDKYxMweRLYTlrmRqCnQePBuf98V9YVgwYjwLVWMrJBPa/b8nTzL7IV7HMPAKB2x1cW8oba2EZDZ0G0=@linaro.org, AJvYcCWxo2UdztphOUiJz3vY7kH0AKVh90Y3gez/rjQspSigmVJSHW1kSRqOdmLZpgPLVbEDk+rtinU=@linaro.org
X-Gm-Message-State: AOJu0YxQL18jIALx+eexceHnx4AA6hGvYnQGAZ5nUiMnNoG3bDf/PLKC
	S4n6m5ExobYaSL9Lrlog/D7JHNAhFjqkliYfl1QrtJ2tjv57qrIyWoNN
X-Gm-Gg: ASbGnctTLj8mnUbKU5IgcMDhndA/jqeB8BQUUNrPGjT1HLlOdEUEegBmGBh4hh4XFm8
	aqpvFQPXpHlLW+6yPWdqkHteN2SZDGoYtzCUJ/LXXjph1yzt0r/PL6oTwUqqCY9p0x3BhNvAPPZ
	KwYr3xHnppcuFzpnVKUx689W2hFa/oWYks2isawEJPrz3Q1VKCsvlKKx+cwsV1HgWsJ3Ju1mr0j
	PC6XaOh7nhjpFZUjgZsvXZxUDCj3ictXaIuUrkrsrzZfaipq59EooQlD800Ueh9vUksYR3i0hpt
	lvJS92vC9lptMpY7aeqh5qJqHYl5eEDOdGhaJBnAynECTgiyJLA=
X-Google-Smtp-Source: AGHT+IEjBag9dXZJu+xHTsTGS7j8HoI7T587dh1AvKbVfugRzu2h05FUzil69GsAslX9TWOh2Ke26Q==
X-Received: by 2002:a17:90a:e7c2:b0:30e:8e0f:9bfc with SMTP id 98e67ed59e1d1-30e8e0f9f15mr21819390a91.13.1747745547437;
        Tue, 20 May 2025 05:52:27 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:52:26 -0700 (PDT)
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
Subject: [PATCH 02/33] tcg/wasm32: Do not use TCI disassembler in Wasm backend
Date: Tue, 20 May 2025 21:51:04 +0900
Message-ID: <ab67d558ed437ae7bbeb00721aca1e1aa1260c61.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7EWZ8upCZJEZ

Wasm backend should implement its own disassember for Wasm
instructions.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32.c | 243 +--------------------------------------------------
 1 file changed, 1 insertion(+), 242 deletions(-)

diff --git a/tcg/wasm32.c b/tcg/wasm32.c
index 6de9b26b76..4bc53d76d0 100644
--- a/tcg/wasm32.c
+++ b/tcg/wasm32.c
@@ -831,246 +831,5 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 }
 
 /*
- * Disassembler that matches the interpreter
+ * TODO: Disassembler is not implemented
  */
-
-static const char *str_r(TCGReg r)
-{
-    static const char regs[TCG_TARGET_NB_REGS][4] = {
-        "r0", "r1", "r2",  "r3",  "r4",  "r5",  "r6",  "r7",
-        "r8", "r9", "r10", "r11", "r12", "r13", "env", "sp"
-    };
-
-    QEMU_BUILD_BUG_ON(TCG_AREG0 != TCG_REG_R14);
-    QEMU_BUILD_BUG_ON(TCG_REG_CALL_STACK != TCG_REG_R15);
-
-    assert((unsigned)r < TCG_TARGET_NB_REGS);
-    return regs[r];
-}
-
-static const char *str_c(TCGCond c)
-{
-    static const char cond[16][8] = {
-        [TCG_COND_NEVER] = "never",
-        [TCG_COND_ALWAYS] = "always",
-        [TCG_COND_EQ] = "eq",
-        [TCG_COND_NE] = "ne",
-        [TCG_COND_LT] = "lt",
-        [TCG_COND_GE] = "ge",
-        [TCG_COND_LE] = "le",
-        [TCG_COND_GT] = "gt",
-        [TCG_COND_LTU] = "ltu",
-        [TCG_COND_GEU] = "geu",
-        [TCG_COND_LEU] = "leu",
-        [TCG_COND_GTU] = "gtu",
-        [TCG_COND_TSTEQ] = "tsteq",
-        [TCG_COND_TSTNE] = "tstne",
-    };
-
-    assert((unsigned)c < ARRAY_SIZE(cond));
-    assert(cond[c][0] != 0);
-    return cond[c];
-}
-
-/* Disassemble TCI bytecode. */
-int print_insn_tci(bfd_vma addr, disassemble_info *info)
-{
-    const uint32_t *tb_ptr = (const void *)(uintptr_t)addr;
-    const TCGOpDef *def;
-    const char *op_name;
-    uint32_t insn;
-    TCGOpcode op;
-    TCGReg r0, r1, r2, r3, r4;
-    tcg_target_ulong i1;
-    int32_t s2;
-    TCGCond c;
-    MemOpIdx oi;
-    uint8_t pos, len;
-    void *ptr;
-
-    /* TCI is always the host, so we don't need to load indirect. */
-    insn = *tb_ptr++;
-
-    info->fprintf_func(info->stream, "%08x  ", insn);
-
-    op = extract32(insn, 0, 8);
-    def = &tcg_op_defs[op];
-    op_name = def->name;
-
-    switch (op) {
-    case INDEX_op_br:
-    case INDEX_op_exit_tb:
-    case INDEX_op_goto_tb:
-        tci_args_l(insn, tb_ptr, &ptr);
-        info->fprintf_func(info->stream, "%-12s  %p", op_name, ptr);
-        break;
-
-    case INDEX_op_goto_ptr:
-        tci_args_r(insn, &r0);
-        info->fprintf_func(info->stream, "%-12s  %s", op_name, str_r(r0));
-        break;
-
-    case INDEX_op_call:
-        tci_args_nl(insn, tb_ptr, &len, &ptr);
-        info->fprintf_func(info->stream, "%-12s  %d, %p", op_name, len, ptr);
-        break;
-
-    case INDEX_op_brcond:
-        tci_args_rl(insn, tb_ptr, &r0, &ptr);
-        info->fprintf_func(info->stream, "%-12s  %s, 0, ne, %p",
-                           op_name, str_r(r0), ptr);
-        break;
-
-    case INDEX_op_setcond:
-    case INDEX_op_tci_setcond32:
-        tci_args_rrrc(insn, &r0, &r1, &r2, &c);
-        info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s",
-                           op_name, str_r(r0), str_r(r1), str_r(r2), str_c(c));
-        break;
-
-    case INDEX_op_tci_movi:
-        tci_args_ri(insn, &r0, &i1);
-        info->fprintf_func(info->stream, "%-12s  %s, 0x%" TCG_PRIlx,
-                           op_name, str_r(r0), i1);
-        break;
-
-    case INDEX_op_tci_movl:
-        tci_args_rl(insn, tb_ptr, &r0, &ptr);
-        info->fprintf_func(info->stream, "%-12s  %s, %p",
-                           op_name, str_r(r0), ptr);
-        break;
-
-    case INDEX_op_tci_setcarry:
-        info->fprintf_func(info->stream, "%-12s", op_name);
-        break;
-
-    case INDEX_op_ld8u:
-    case INDEX_op_ld8s:
-    case INDEX_op_ld16u:
-    case INDEX_op_ld16s:
-    case INDEX_op_ld32u:
-    case INDEX_op_ld:
-    case INDEX_op_st8:
-    case INDEX_op_st16:
-    case INDEX_op_st32:
-    case INDEX_op_st:
-        tci_args_rrs(insn, &r0, &r1, &s2);
-        info->fprintf_func(info->stream, "%-12s  %s, %s, %d",
-                           op_name, str_r(r0), str_r(r1), s2);
-        break;
-
-    case INDEX_op_bswap16:
-    case INDEX_op_bswap32:
-    case INDEX_op_ctpop:
-    case INDEX_op_mov:
-    case INDEX_op_neg:
-    case INDEX_op_not:
-    case INDEX_op_ext_i32_i64:
-    case INDEX_op_extu_i32_i64:
-    case INDEX_op_bswap64:
-        tci_args_rr(insn, &r0, &r1);
-        info->fprintf_func(info->stream, "%-12s  %s, %s",
-                           op_name, str_r(r0), str_r(r1));
-        break;
-
-    case INDEX_op_add:
-    case INDEX_op_addci:
-    case INDEX_op_addcio:
-    case INDEX_op_addco:
-    case INDEX_op_and:
-    case INDEX_op_andc:
-    case INDEX_op_clz:
-    case INDEX_op_ctz:
-    case INDEX_op_divs:
-    case INDEX_op_divu:
-    case INDEX_op_eqv:
-    case INDEX_op_mul:
-    case INDEX_op_nand:
-    case INDEX_op_nor:
-    case INDEX_op_or:
-    case INDEX_op_orc:
-    case INDEX_op_rems:
-    case INDEX_op_remu:
-    case INDEX_op_rotl:
-    case INDEX_op_rotr:
-    case INDEX_op_sar:
-    case INDEX_op_shl:
-    case INDEX_op_shr:
-    case INDEX_op_sub:
-    case INDEX_op_subbi:
-    case INDEX_op_subbio:
-    case INDEX_op_subbo:
-    case INDEX_op_xor:
-    case INDEX_op_tci_ctz32:
-    case INDEX_op_tci_clz32:
-    case INDEX_op_tci_divs32:
-    case INDEX_op_tci_divu32:
-    case INDEX_op_tci_rems32:
-    case INDEX_op_tci_remu32:
-    case INDEX_op_tci_rotl32:
-    case INDEX_op_tci_rotr32:
-        tci_args_rrr(insn, &r0, &r1, &r2);
-        info->fprintf_func(info->stream, "%-12s  %s, %s, %s",
-                           op_name, str_r(r0), str_r(r1), str_r(r2));
-        break;
-
-    case INDEX_op_deposit:
-        tci_args_rrrbb(insn, &r0, &r1, &r2, &pos, &len);
-        info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %d, %d",
-                           op_name, str_r(r0), str_r(r1), str_r(r2), pos, len);
-        break;
-
-    case INDEX_op_extract:
-    case INDEX_op_sextract:
-        tci_args_rrbb(insn, &r0, &r1, &pos, &len);
-        info->fprintf_func(info->stream, "%-12s  %s,%s,%d,%d",
-                           op_name, str_r(r0), str_r(r1), pos, len);
-        break;
-
-    case INDEX_op_tci_movcond32:
-    case INDEX_op_movcond:
-    case INDEX_op_setcond2_i32:
-        tci_args_rrrrrc(insn, &r0, &r1, &r2, &r3, &r4, &c);
-        info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s, %s, %s",
-                           op_name, str_r(r0), str_r(r1), str_r(r2),
-                           str_r(r3), str_r(r4), str_c(c));
-        break;
-
-    case INDEX_op_muls2:
-    case INDEX_op_mulu2:
-        tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
-        info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s",
-                           op_name, str_r(r0), str_r(r1),
-                           str_r(r2), str_r(r3));
-        break;
-
-    case INDEX_op_qemu_ld:
-    case INDEX_op_qemu_st:
-        tci_args_rrm(insn, &r0, &r1, &oi);
-        info->fprintf_func(info->stream, "%-12s  %s, %s, %x",
-                           op_name, str_r(r0), str_r(r1), oi);
-        break;
-
-    case INDEX_op_qemu_ld2:
-    case INDEX_op_qemu_st2:
-        tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
-        info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s",
-                           op_name, str_r(r0), str_r(r1),
-                           str_r(r2), str_r(r3));
-        break;
-
-    case 0:
-        /* tcg_out_nop_fill uses zeros */
-        if (insn == 0) {
-            info->fprintf_func(info->stream, "align");
-            break;
-        }
-        /* fall through */
-
-    default:
-        info->fprintf_func(info->stream, "illegal opcode %d", op);
-        break;
-    }
-
-    return sizeof(insn);
-}
-- 
2.43.0

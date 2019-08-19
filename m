Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3184112wrs;
        Mon, 19 Aug 2019 14:58:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx1JkCjSiIHvZjMUhXbZY99QLfEl/EViDGzY+kOcLglbViaqae0L6dqKFlr5DPKSZT3sTgX
X-Received: by 2002:a05:6402:1446:: with SMTP id d6mr28176063edx.102.1566251883226;
        Mon, 19 Aug 2019 14:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566251883; cv=none;
        d=google.com; s=arc-20160816;
        b=1CiRHiq8XA62ItMh90LdXhYwPwHY6j4N3xsU1Z0I4Pu07qK6f8+X+x4LHJUHwefWG5
         /tcWR1aeisavgeyaf7NMu+Q8qr3rXScanlUHuhZX1NqDZVQRB/HNQhzdXsVDH5BYqdGz
         zbGeI13Ru1bzcGte7NOb+M+hMzQNxbj5pOBQ2KxUOgj0Tnax+wcHqoiQwZAne8lKwSjM
         Pz6pu2GiWEviMqfH2RK79hlhpLCu/1yJbMrFByT1VNPlYzc6FMn2ecUGqH+m0DBwzNR5
         DfcqJyK7QONjBN9BgTOIJpAohTTvGeRyuYvtuKKUnjcoZOkqNMHOTJ56LUh93kdQ1vYm
         1B/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=E5jCqhd4j782M1OXjBueNYjMszsPuCY448GdoglEKE4=;
        b=coWhExu0uFy4ZEwru4AsqMdX+fPaY56TXlk9DIWAT6tpbVyyV1be4ssWOnC/dAY+4a
         X4lE1NEybOiElOk8HtyMSt0JSKI44mTm/Lr5/zgzxJB7qN6W7B3hLCJCExd0yWxdyoNq
         imF8eH2i4Tr+gHvQ/ztGPhj1F4gMUtjikB8/muqPsJNgWkRRSe855xqytuRpKYFvd/aF
         kTRBfEjHTuEUHhmFVfB3BvI4vSCQ0xOXALw6oMziEb7WddgoRkfTa/jFk59/jCaiVAo5
         A2J0HS/f3aRlW+qSPJVndXzhBKzfuvlcqnRfuhTU6NteXQdEFScNhO/MUz12phc1oKG0
         qtfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SrpWT4l3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si9161377eda.360.2019.08.19.14.58.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:58:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SrpWT4l3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpf7-00022E-Lc
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59140)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMI-00023R-TM
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMG-0006L3-CV
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:34 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:43139)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMG-0006KT-3F
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:32 -0400
Received: by mail-pg1-x542.google.com with SMTP id k3so1921547pgb.10
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=E5jCqhd4j782M1OXjBueNYjMszsPuCY448GdoglEKE4=;
 b=SrpWT4l3bKxHSBB33gh3xRkrSURvlXj3ZVyZLImMhl86D4Jh1Y7sLf2ftdW5e5qSpA
 F3M3UMUYWtM4rQebyBbP8HAFRXvjazeV7lH1YBqI9jAcAuyQZQwyytuI9IXAL6XaoFTJ
 cVKr7qg1WSmXtciVPMRuZs6b9MB5YTd0IrczNBta7QivMwiPCgdZvzLluIfl1vBtkcbR
 Y9WXdzYq7eF/NSLAQkXWWptdNamPdSTrqZwcUh/oLdoMGYgkyzh0nyy3jFTYxO5VFHIn
 C+3NpgJgojprqLCWqPTzqyz7TDnC0Pn3ADiQdUMwqPfljeZvk/1qRUYL8SSOkkyKjv4g
 oReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=E5jCqhd4j782M1OXjBueNYjMszsPuCY448GdoglEKE4=;
 b=UmVB02CF6ol7RfeAsYXPqEGDKZ048MzITVfFYppojSY117hvSDljHs8qoU5PEPe0Ul
 ljHktBjfbpHVta8u+v66XOXUsqWknCSLRxh3MMxyd5tSE1uTMUYJ7izVYB2hH1MSOd2Z
 nSu4JOZRsd9BzO3dMN0s0thCZUE0ODKsHkkr+UxdMwoQCSmHihBbmXtnvl5Pv1Y98/2s
 f4ocyCMOGR1Qg51uUaXP1zpdNxKgTmGit2Yi8lewNbooZNcKqY+wx/obkQ/Hsr9Nvxxi
 l+8n40h+1/p/baTIHy6n8uLySSvpM1+tuuP6G9tFUMvgpQfZuDO4Nm7SFHgCUt5w1xdE
 mdEw==
X-Gm-Message-State: APjAAAVhaDU0Tg91coH1wqMc0ZbY99RMQXZQFZMCTapycmCcjJhvXwdl
 E3Ow2HcvXwz45gKQrRLMDDb2vfKOZRA=
X-Received: by 2002:a17:90b:949:: with SMTP id
 dw9mr23134183pjb.49.1566250710980; 
 Mon, 19 Aug 2019 14:38:30 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:14 -0700
Message-Id: <20190819213755.26175-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v2 27/68] target/arm: Convert LDM, STM
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PCyuI/92jhyj

This includes a minor bug fix to LDM (user), which requires
bit 21 to be 0, which means no writeback.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 426 ++++++++++++++++++++++-------------------
 target/arm/a32.decode  |   6 +
 target/arm/t32.decode  |  10 +
 3 files changed, 241 insertions(+), 201 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 81eae286e8..4451adbb97 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9671,6 +9671,227 @@ static bool trans_UDIV(DisasContext *s, arg_rrr *a)
     return op_div(s, a, true);
 }
 
+/*
+ * Block data transfer
+ */
+
+static TCGv_i32 op_addr_block_pre(DisasContext *s, arg_ldst_block *a, int n)
+{
+    TCGv_i32 addr = load_reg(s, a->rn);
+
+    if (a->b) {
+        if (a->i) {
+            /* pre increment */
+            tcg_gen_addi_i32(addr, addr, 4);
+        } else {
+            /* pre decrement */
+            tcg_gen_addi_i32(addr, addr, -(n * 4));
+        }
+    } else if (!a->i && n != 1) {
+        /* post decrement */
+        tcg_gen_addi_i32(addr, addr, -((n - 1) * 4));
+    }
+
+    if (s->v8m_stackcheck && a->rn == 13 && a->w) {
+        /*
+         * If the writeback is incrementing SP rather than
+         * decrementing it, and the initial SP is below the
+         * stack limit but the final written-back SP would
+         * be above, then then we must not perform any memory
+         * accesses, but it is IMPDEF whether we generate
+         * an exception. We choose to do so in this case.
+         * At this point 'addr' is the lowest address, so
+         * either the original SP (if incrementing) or our
+         * final SP (if decrementing), so that's what we check.
+         */
+        gen_helper_v8m_stackcheck(cpu_env, addr);
+    }
+
+    return addr;
+}
+
+static void op_addr_block_post(DisasContext *s, arg_ldst_block *a,
+                               TCGv_i32 addr, int n)
+{
+    if (a->w) {
+        /* write back */
+        if (!a->b) {
+            if (a->i) {
+                /* post increment */
+                tcg_gen_addi_i32(addr, addr, 4);
+            } else {
+                /* post decrement */
+                tcg_gen_addi_i32(addr, addr, -(n * 4));
+            }
+        } else if (!a->i && n != 1) {
+            /* pre decrement */
+            tcg_gen_addi_i32(addr, addr, -((n - 1) * 4));
+        }
+        store_reg(s, a->rn, addr);
+    } else {
+        tcg_temp_free_i32(addr);
+    }
+}
+
+static bool op_stm(DisasContext *s, arg_ldst_block *a)
+{
+    int i, j, n, list, mem_idx;
+    bool user = a->u;
+    TCGv_i32 addr, tmp, tmp2;
+
+    if (user) {
+        /* STM (user) */
+        if (IS_USER(s)) {
+            /* Only usable in supervisor mode.  */
+            return false;
+        }
+    }
+
+    list = a->list;
+    n = ctpop16(list);
+    /* TODO: test invalid n == 0 case */
+
+    addr = op_addr_block_pre(s, a, n);
+    mem_idx = get_mem_index(s);
+
+    for (i = j = 0; i < 16; i++) {
+        if (!(list & (1 << i))) {
+            continue;
+        }
+
+        if (user && i != 15) {
+            tmp = tcg_temp_new_i32();
+            tmp2 = tcg_const_i32(i);
+            gen_helper_get_user_reg(tmp, cpu_env, tmp2);
+            tcg_temp_free_i32(tmp2);
+        } else {
+            tmp = load_reg(s, i);
+        }
+        gen_aa32_st32(s, tmp, addr, mem_idx);
+        tcg_temp_free_i32(tmp);
+
+        /* No need to add after the last transfer.  */
+        if (++j != n) {
+            tcg_gen_addi_i32(addr, addr, 4);
+        }
+    }
+
+    op_addr_block_post(s, a, addr, n);
+    return true;
+}
+
+static bool trans_STM(DisasContext *s, arg_ldst_block *a)
+{
+    return op_stm(s, a);
+}
+
+static bool trans_STM_t32(DisasContext *s, arg_ldst_block *a)
+{
+    /* Writeback register in register list is UNPREDICATABLE for T32.  */
+    if (a->w && (a->list & (1 << a->rn))) {
+        return false;
+    }
+    return op_stm(s, a);
+}
+
+static bool do_ldm(DisasContext *s, arg_ldst_block *a)
+{
+    int i, j, n, list, mem_idx;
+    bool loaded_base;
+    bool user = a->u;
+    bool exc_return = false;
+    TCGv_i32 addr, tmp, tmp2, loaded_var;
+
+    if (user) {
+        /* LDM (user), LDM (exception return) */
+        if (IS_USER(s)) {
+            /* Only usable in supervisor mode.  */
+            return false;
+        }
+        if (extract32(a->list, 15, 1)) {
+            exc_return = true;
+            user = false;
+        } else {
+            /* LDM (user) does not allow writeback.  */
+            if (a->w) {
+                return false;
+            }
+        }
+    }
+
+    list = a->list;
+    n = ctpop16(list);
+    /* TODO: test invalid n == 0 case */
+
+    addr = op_addr_block_pre(s, a, n);
+    mem_idx = get_mem_index(s);
+    loaded_base = false;
+    loaded_var = NULL;
+
+    for (i = j = 0; i < 16; i++) {
+        if (!(list & (1 << i))) {
+            continue;
+        }
+
+        tmp = tcg_temp_new_i32();
+        gen_aa32_ld32u(s, tmp, addr, mem_idx);
+        if (user) {
+            tmp2 = tcg_const_i32(i);
+            gen_helper_set_user_reg(cpu_env, tmp2, tmp);
+            tcg_temp_free_i32(tmp2);
+            tcg_temp_free_i32(tmp);
+        } else if (i == a->rn) {
+            loaded_var = tmp;
+            loaded_base = true;
+        } else if (i == 15 && exc_return) {
+            store_pc_exc_ret(s, tmp);
+        } else {
+            store_reg_from_load(s, i, tmp);
+        }
+
+        /* No need to add after the last transfer.  */
+        if (++j != n) {
+            tcg_gen_addi_i32(addr, addr, 4);
+        }
+    }
+
+    op_addr_block_post(s, a, addr, n);
+
+    if (loaded_base) {
+        store_reg(s, a->rn, loaded_var);
+    }
+
+    if (exc_return) {
+        /* Restore CPSR from SPSR.  */
+        tmp = load_cpu_field(spsr);
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
+        gen_helper_cpsr_write_eret(cpu_env, tmp);
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_io_end();
+        }
+        tcg_temp_free_i32(tmp);
+        /* Must exit loop to check un-masked IRQs */
+        s->base.is_jmp = DISAS_EXIT;
+    }
+    return true;
+}
+
+static bool trans_LDM_a32(DisasContext *s, arg_ldst_block *a)
+{
+    return do_ldm(s, a);
+}
+
+static bool trans_LDM_t32(DisasContext *s, arg_ldst_block *a)
+{
+    /* Writeback register in register list is UNPREDICATABLE for T32. */
+    if (a->w && (a->list & (1 << a->rn))) {
+        return false;
+    }
+    return do_ldm(s, a);
+}
+
 /*
  * Legacy decoder.
  */
@@ -9949,142 +10170,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         case 0x5:
         case 0x6:
         case 0x7:
-            /* All done in decodetree.  Reach here for illegal ops.  */
-            goto illegal_op;
         case 0x08:
         case 0x09:
-            {
-                int j, n, loaded_base;
-                bool exc_return = false;
-                bool is_load = extract32(insn, 20, 1);
-                bool user = false;
-                TCGv_i32 loaded_var;
-                /* load/store multiple words */
-                /* XXX: store correct base if write back */
-                if (insn & (1 << 22)) {
-                    /* LDM (user), LDM (exception return) and STM (user) */
-                    if (IS_USER(s))
-                        goto illegal_op; /* only usable in supervisor mode */
-
-                    if (is_load && extract32(insn, 15, 1)) {
-                        exc_return = true;
-                    } else {
-                        user = true;
-                    }
-                }
-                rn = (insn >> 16) & 0xf;
-                addr = load_reg(s, rn);
-
-                /* compute total size */
-                loaded_base = 0;
-                loaded_var = NULL;
-                n = 0;
-                for (i = 0; i < 16; i++) {
-                    if (insn & (1 << i))
-                        n++;
-                }
-                /* XXX: test invalid n == 0 case ? */
-                if (insn & (1 << 23)) {
-                    if (insn & (1 << 24)) {
-                        /* pre increment */
-                        tcg_gen_addi_i32(addr, addr, 4);
-                    } else {
-                        /* post increment */
-                    }
-                } else {
-                    if (insn & (1 << 24)) {
-                        /* pre decrement */
-                        tcg_gen_addi_i32(addr, addr, -(n * 4));
-                    } else {
-                        /* post decrement */
-                        if (n != 1)
-                        tcg_gen_addi_i32(addr, addr, -((n - 1) * 4));
-                    }
-                }
-                j = 0;
-                for (i = 0; i < 16; i++) {
-                    if (insn & (1 << i)) {
-                        if (is_load) {
-                            /* load */
-                            tmp = tcg_temp_new_i32();
-                            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-                            if (user) {
-                                tmp2 = tcg_const_i32(i);
-                                gen_helper_set_user_reg(cpu_env, tmp2, tmp);
-                                tcg_temp_free_i32(tmp2);
-                                tcg_temp_free_i32(tmp);
-                            } else if (i == rn) {
-                                loaded_var = tmp;
-                                loaded_base = 1;
-                            } else if (i == 15 && exc_return) {
-                                store_pc_exc_ret(s, tmp);
-                            } else {
-                                store_reg_from_load(s, i, tmp);
-                            }
-                        } else {
-                            /* store */
-                            if (i == 15) {
-                                tmp = tcg_temp_new_i32();
-                                tcg_gen_movi_i32(tmp, read_pc(s));
-                            } else if (user) {
-                                tmp = tcg_temp_new_i32();
-                                tmp2 = tcg_const_i32(i);
-                                gen_helper_get_user_reg(tmp, cpu_env, tmp2);
-                                tcg_temp_free_i32(tmp2);
-                            } else {
-                                tmp = load_reg(s, i);
-                            }
-                            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
-                            tcg_temp_free_i32(tmp);
-                        }
-                        j++;
-                        /* no need to add after the last transfer */
-                        if (j != n)
-                            tcg_gen_addi_i32(addr, addr, 4);
-                    }
-                }
-                if (insn & (1 << 21)) {
-                    /* write back */
-                    if (insn & (1 << 23)) {
-                        if (insn & (1 << 24)) {
-                            /* pre increment */
-                        } else {
-                            /* post increment */
-                            tcg_gen_addi_i32(addr, addr, 4);
-                        }
-                    } else {
-                        if (insn & (1 << 24)) {
-                            /* pre decrement */
-                            if (n != 1)
-                                tcg_gen_addi_i32(addr, addr, -((n - 1) * 4));
-                        } else {
-                            /* post decrement */
-                            tcg_gen_addi_i32(addr, addr, -(n * 4));
-                        }
-                    }
-                    store_reg(s, rn, addr);
-                } else {
-                    tcg_temp_free_i32(addr);
-                }
-                if (loaded_base) {
-                    store_reg(s, rn, loaded_var);
-                }
-                if (exc_return) {
-                    /* Restore CPSR from SPSR.  */
-                    tmp = load_cpu_field(spsr);
-                    if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                        gen_io_start();
-                    }
-                    gen_helper_cpsr_write_eret(cpu_env, tmp);
-                    if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                        gen_io_end();
-                    }
-                    tcg_temp_free_i32(tmp);
-                    /* Must exit loop to check un-masked IRQs */
-                    s->base.is_jmp = DISAS_EXIT;
-                }
-            }
-            break;
+            /* All done in decodetree.  Reach here for illegal ops.  */
+            goto illegal_op;
         case 0xa:
         case 0xb:
             {
@@ -10351,73 +10440,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                             insn & (1 << 21));
                 }
             } else {
-                int i, loaded_base = 0;
-                TCGv_i32 loaded_var;
-                bool wback = extract32(insn, 21, 1);
-                /* Load/store multiple.  */
-                addr = load_reg(s, rn);
-                offset = 0;
-                for (i = 0; i < 16; i++) {
-                    if (insn & (1 << i))
-                        offset += 4;
-                }
-
-                if (insn & (1 << 24)) {
-                    tcg_gen_addi_i32(addr, addr, -offset);
-                }
-
-                if (s->v8m_stackcheck && rn == 13 && wback) {
-                    /*
-                     * If the writeback is incrementing SP rather than
-                     * decrementing it, and the initial SP is below the
-                     * stack limit but the final written-back SP would
-                     * be above, then then we must not perform any memory
-                     * accesses, but it is IMPDEF whether we generate
-                     * an exception. We choose to do so in this case.
-                     * At this point 'addr' is the lowest address, so
-                     * either the original SP (if incrementing) or our
-                     * final SP (if decrementing), so that's what we check.
-                     */
-                    gen_helper_v8m_stackcheck(cpu_env, addr);
-                }
-
-                loaded_var = NULL;
-                for (i = 0; i < 16; i++) {
-                    if ((insn & (1 << i)) == 0)
-                        continue;
-                    if (insn & (1 << 20)) {
-                        /* Load.  */
-                        tmp = tcg_temp_new_i32();
-                        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-                        if (i == rn) {
-                            loaded_var = tmp;
-                            loaded_base = 1;
-                        } else {
-                            store_reg_from_load(s, i, tmp);
-                        }
-                    } else {
-                        /* Store.  */
-                        tmp = load_reg(s, i);
-                        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
-                        tcg_temp_free_i32(tmp);
-                    }
-                    tcg_gen_addi_i32(addr, addr, 4);
-                }
-                if (loaded_base) {
-                    store_reg(s, rn, loaded_var);
-                }
-                if (wback) {
-                    /* Base register writeback.  */
-                    if (insn & (1 << 24)) {
-                        tcg_gen_addi_i32(addr, addr, -offset);
-                    }
-                    /* Fault if writeback register is in register list.  */
-                    if (insn & (1 << rn))
-                        goto illegal_op;
-                    store_reg(s, rn, addr);
-                } else {
-                    tcg_temp_free_i32(addr);
-                }
+                /* Load/store multiple, in decodetree */
+                goto illegal_op;
             }
         }
         break;
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 341882e637..1267a689e2 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -40,6 +40,7 @@
 &mrs_bank        rd r sysm
 &ldst_rr         p w u rn rt rm shimm shtype
 &ldst_ri         p w u rn rt imm
+&ldst_block      rn i b u w list
 &strex           rn rd rt rt2 imm
 &ldrex           rn rt rt2 imm
 &bfx             rd rn lsb widthm1
@@ -514,3 +515,8 @@ SMMLA            .... 0111 0101 .... .... .... 0001 ....      @rdamn
 SMMLAR           .... 0111 0101 .... .... .... 0011 ....      @rdamn
 SMMLS            .... 0111 0101 .... .... .... 1101 ....      @rdamn
 SMMLSR           .... 0111 0101 .... .... .... 1111 ....      @rdamn
+
+# Block data transfer
+
+STM              ---- 100 b:1 i:1 u:1 w:1 0 rn:4 list:16   &ldst_block
+LDM_a32          ---- 100 b:1 i:1 u:1 w:1 1 rn:4 list:16   &ldst_block
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index f315fde0f4..f1e2b934f8 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -37,6 +37,7 @@
 &mrs_bank        !extern rd r sysm
 &ldst_rr         !extern p w u rn rt rm shimm shtype
 &ldst_ri         !extern p w u rn rt imm
+&ldst_block      !extern rn i b u w list
 &strex           !extern rn rd rt rt2 imm
 &ldrex           !extern rn rt rt2 imm
 &bfx             !extern rd rn lsb widthm1
@@ -563,3 +564,12 @@ SXTAB16          1111 1010 0010 .... 1111 .... 10.. ....      @rrr_rot
 UXTAB16          1111 1010 0011 .... 1111 .... 10.. ....      @rrr_rot
 SXTAB            1111 1010 0100 .... 1111 .... 10.. ....      @rrr_rot
 UXTAB            1111 1010 0101 .... 1111 .... 10.. ....      @rrr_rot
+
+# Load/store multiple
+
+@ldstm           .... .... .. w:1 . rn:4 list:16              &ldst_block u=0
+
+STM_t32          1110 1000 10.0 .... ................         @ldstm i=1 b=0
+STM_t32          1110 1001 00.0 .... ................         @ldstm i=0 b=1
+LDM_t32          1110 1000 10.1 .... ................         @ldstm i=1 b=0
+LDM_t32          1110 1001 00.1 .... ................         @ldstm i=0 b=1
-- 
2.17.1


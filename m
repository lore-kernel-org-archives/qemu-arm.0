Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1332670ejc;
        Fri, 13 Oct 2023 00:56:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA4n6ZdqX1NzLd9asCIv2p6APEMDxi1wgarEmL7x3gKoS2avZKrsSbXL6ulOr+n9e8NGA5
X-Received: by 2002:a05:622a:4cb:b0:418:1059:dfbc with SMTP id q11-20020a05622a04cb00b004181059dfbcmr30396996qtx.45.1697183791290;
        Fri, 13 Oct 2023 00:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183791; cv=none;
        d=google.com; s=arc-20160816;
        b=toN+VM6YGWYX5IeT81LaAXJYBgu9hKo0KYQus7C+vN/rYkVb6Yo+RmlA5cXMkbswLG
         OvJS94xUGf6g/Zw/WOKKTzOXhq1UygxG4r7t4AV46WMu0vsQCws1tlJZn2I/5DSKsqXU
         Z9SDGKXbSZdCkpQGgGWnP6ks3YWU1kNFpCiyiqNWKIWDxJXJka0faqOMb06R6ix5WvSX
         JiLUdmEM4Z3qT9oApEAV229ndc9W538sa61fbovloe5h/5aSn9sC3iR/6GUbjwC1FZ/U
         Q+MuMiU5IXIdeoBXACZ0nAsgIhSm/x7qN/JSlHabHDcpqVrd4HvI9kFdU19VqQp/ItZR
         qvfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=p/mY16veta2LBLEr6jX5WmGFOjQvyhNpevencSIkR3g=;
        fh=i4+TEAhTfbgm8NhF7vrLFCUdiAyN6ynqjBGpXaLhBQ0=;
        b=w2N/qD83SMy8taczywBl2ybmYG/9YkXov2TwALt7FGs11DSYdHTnrgK03MsjgoR9NK
         j8EEEud3do20NQT5YxpGT9GnonNQetuYbFYLzGCO1dcyjHlSxhnFmKV63QR+MNvd8LcB
         czWYa2KZYsPSRDzZfis0vgaXahvf75rRbQfXA43U1GkHHu5MAobYNVIZUvLb2TCohD81
         lEiFX+nGmL/nMoqRqfrFFXIgoCw5fmkpDffDozpSKxbYPeaggkzPj6tSbdMNiiKvZ2+i
         X5oZmaPwcJ2ZHGbzrH83uz+Rs/0F9Bm9JUF5LA8e6ZIiWZCdQ6KCipZukedi7BlG6Vvz
         lEZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EtkacZ9W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w35-20020a05622a192300b004196273dbbbsi836696qtc.267.2023.10.13.00.56.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:56:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EtkacZ9W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCxc-00086b-6b; Fri, 13 Oct 2023 03:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwp-0005W8-0j
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:03 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwZ-0004qg-Ta
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:02 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40572aeb673so19450645e9.0
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183446; x=1697788246; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p/mY16veta2LBLEr6jX5WmGFOjQvyhNpevencSIkR3g=;
 b=EtkacZ9WAoacBrGTYKnf9E4SNBK3NzIUDFlR2xP5M89dKvnEWkwNZX8S0qX0ojszCb
 GBHh8K9kyKS/XDnVPnDNTMK/txfenTbNEL14bVHIDD1AARnS9KsqXvXalNU+plDCSzif
 q6QzUbtXe7VriGjyUhyc3Z4ohm0XfGDYegBl4eVYQDRnBkzS2sR9n2eLYcyQ57M+fqDy
 9lb/2waqKOBn14131+lHsRgMvIdRBaqrWqhpbFKc6vbE1w+j0R8eRNBZ6MWnrtPfEUQq
 /5KCIwRt8Y0Vi/vxbwFrwF9WxLZf3CRhD9ASOE3o2MvvTN69b6xL7ynWYQ4cfxEDUfOx
 m0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183446; x=1697788246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p/mY16veta2LBLEr6jX5WmGFOjQvyhNpevencSIkR3g=;
 b=Nt2B4PlnNyiqE4J+6D02bpI7IxP4WXHLNe5/fTq/3ZVS6jF3/v/ByZvtf+cybiD5qa
 J1tZHCAvsbMU3fWzeblJzBCNsOeyrAfPysJjOkOBGbkO1mskR7XooUTcCkUNYSi7yriH
 AVwwyOEqlsdXHgmJyPsiB0rFqGWc64PsUdzS3nqyyyWqYwTwFXCfDef2ZHXSeC2Ooa78
 KUFrZp8ewyQLYM5EB3R38o9B0SkX2jU9wNIjDWkOJj0F2KjIhJE0KZ0gLZV3BI1ytBk+
 kRxLIYWFg9+RA4hL5/cdgGVdHvuHjBe1UjR1m5fD4PQwg+9X5BULJlciOsrnkQw57jfV
 thzQ==
X-Gm-Message-State: AOJu0YyrxUOz4W83qkr5THiimjC0Q72d6ysL/EAAi85Hgh+WqNR0nI5G
 +FQzmtoCyo9y9zW+3G8wSjWYVg==
X-Received: by 2002:a05:600c:207:b0:405:1c19:476d with SMTP id
 7-20020a05600c020700b004051c19476dmr22126994wmi.39.1697183446628; 
 Fri, 13 Oct 2023 00:50:46 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:50:46 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [RFC PATCH 30/78] target/nios2: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:34 +0300
Message-Id: <8cb3ca5179261aca2fae0f5eaf22f3ce19f71498.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7+nPmY+BP1NU

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/nios2/helper.c    | 6 +++---
 target/nios2/translate.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index bb3b09e5a7..b44e73768e 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -125,136 +125,136 @@ static void do_eic_irq(Nios2CPU *cpu)
 void nios2_cpu_do_interrupt(CPUState *cs)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
     uint32_t tlbmisc_set = 0;
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         const char *name = NULL;
 
         switch (cs->exception_index) {
         case EXCP_IRQ:
             name = "interrupt";
             break;
         case EXCP_TLB_X:
         case EXCP_TLB_D:
             if (env->ctrl[CR_STATUS] & CR_STATUS_EH) {
                 name = "TLB MISS (double)";
             } else {
                 name = "TLB MISS (fast)";
             }
             break;
         case EXCP_PERM_R:
         case EXCP_PERM_W:
         case EXCP_PERM_X:
             name = "TLB PERM";
             break;
         case EXCP_SUPERA_X:
         case EXCP_SUPERA_D:
             name = "SUPERVISOR (address)";
             break;
         case EXCP_SUPERI:
             name = "SUPERVISOR (insn)";
             break;
         case EXCP_ILLEGAL:
             name = "ILLEGAL insn";
             break;
         case EXCP_UNALIGN:
             name = "Misaligned (data)";
             break;
         case EXCP_UNALIGND:
             name = "Misaligned (destination)";
             break;
         case EXCP_DIV:
             name = "DIV error";
             break;
         case EXCP_TRAP:
             name = "TRAP insn";
             break;
         case EXCP_BREAK:
             name = "BREAK insn";
             break;
         case EXCP_SEMIHOST:
             name = "SEMIHOST insn";
             break;
         }
         if (name) {
             qemu_log("%s at pc=0x%08x\n", name, env->pc);
         } else {
             qemu_log("Unknown exception %d at pc=0x%08x\n",
                      cs->exception_index, env->pc);
         }
     }
 
     switch (cs->exception_index) {
     case EXCP_IRQ:
         /* Note that PC is advanced for interrupts as well. */
         env->pc += 4;
         if (cpu->eic_present) {
             do_eic_irq(cpu);
         } else {
             do_iic_irq(cpu);
         }
         break;
 
     case EXCP_TLB_D:
         tlbmisc_set = CR_TLBMISC_D;
-        /* fall through */
+        fallthrough;
     case EXCP_TLB_X:
         if (env->ctrl[CR_STATUS] & CR_STATUS_EH) {
             tlbmisc_set |= CR_TLBMISC_DBL;
             /*
              * Normally, we don't write to tlbmisc unless !EH,
              * so do it manually for the double-tlb miss exception.
              */
             env->ctrl[CR_TLBMISC] &= ~(CR_TLBMISC_D |
                                        CR_TLBMISC_PERM |
                                        CR_TLBMISC_BAD);
             env->ctrl[CR_TLBMISC] |= tlbmisc_set;
             do_exception(cpu, cpu->exception_addr, 0, false);
         } else {
             tlbmisc_set |= CR_TLBMISC_WE;
             do_exception(cpu, cpu->fast_tlb_miss_addr, tlbmisc_set, false);
         }
         break;
 
     case EXCP_PERM_R:
     case EXCP_PERM_W:
         tlbmisc_set = CR_TLBMISC_D;
-        /* fall through */
+        fallthrough;
     case EXCP_PERM_X:
         tlbmisc_set |= CR_TLBMISC_PERM;
         if (!(env->ctrl[CR_STATUS] & CR_STATUS_EH)) {
             tlbmisc_set |= CR_TLBMISC_WE;
         }
         do_exception(cpu, cpu->exception_addr, tlbmisc_set, false);
         break;
 
     case EXCP_SUPERA_D:
     case EXCP_UNALIGN:
         tlbmisc_set = CR_TLBMISC_D;
-        /* fall through */
+        fallthrough;
     case EXCP_SUPERA_X:
     case EXCP_UNALIGND:
         tlbmisc_set |= CR_TLBMISC_BAD;
         do_exception(cpu, cpu->exception_addr, tlbmisc_set, false);
         break;
 
     case EXCP_SUPERI:
     case EXCP_ILLEGAL:
     case EXCP_DIV:
     case EXCP_TRAP:
         do_exception(cpu, cpu->exception_addr, 0, false);
         break;
 
     case EXCP_BREAK:
         do_exception(cpu, cpu->exception_addr, 0, true);
         break;
 
     case EXCP_SEMIHOST:
         do_nios2_semihosting(env);
         break;
 
     default:
         cpu_abort(cs, "unhandled exception type=%d\n", cs->exception_index);
     }
 }
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index e806623594..2cfe77c90a 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -617,64 +617,64 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 /* ctlN <- rA */
 static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     if (!gen_check_supervisor(dc)) {
         return;
     }
 
 #ifdef CONFIG_USER_ONLY
     g_assert_not_reached();
 #else
     R_TYPE(instr, code);
     TCGv v = load_gpr(dc, instr.a);
     uint32_t ofs = offsetof(CPUNios2State, ctrl[instr.imm5]);
     uint32_t wr = dc->cr_state[instr.imm5].writable;
     uint32_t ro = dc->cr_state[instr.imm5].readonly;
 
     /* Skip reserved or readonly registers. */
     if (wr == 0) {
         return;
     }
 
     switch (instr.imm5) {
     case CR_PTEADDR:
         gen_helper_mmu_write_pteaddr(tcg_env, v);
         break;
     case CR_TLBACC:
         gen_helper_mmu_write_tlbacc(tcg_env, v);
         break;
     case CR_TLBMISC:
         gen_helper_mmu_write_tlbmisc(tcg_env, v);
         break;
     case CR_STATUS:
     case CR_IENABLE:
         /* If interrupts were enabled using WRCTL, trigger them. */
         dc->base.is_jmp = DISAS_UPDATE;
-        /* fall through */
+        fallthrough;
     default:
         if (wr == -1) {
             /* The register is entirely writable. */
             tcg_gen_st_tl(v, tcg_env, ofs);
         } else {
             /*
              * The register is partially read-only or reserved:
              * merge the value.
              */
             TCGv n = tcg_temp_new();
 
             tcg_gen_andi_tl(n, v, wr);
 
             if (ro != 0) {
                 TCGv o = tcg_temp_new();
                 tcg_gen_ld_tl(o, tcg_env, ofs);
                 tcg_gen_andi_tl(o, o, ro);
                 tcg_gen_or_tl(n, n, o);
             }
 
             tcg_gen_st_tl(n, tcg_env, ofs);
         }
         break;
     }
 #endif
 }
 
 /* prs.rC <- rA */
-- 
2.39.2


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481CEC982D0
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 00:46:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7Mje-0003Yg-By; Thu, 17 Sep 2026 20:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7MjB-0002im-JR
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:45:27 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7Mj7-0002C0-A8
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:45:20 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 98e67ed59e1d1-396ccafb74fso231644a91.3
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 17:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789692315; x=1790297115; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ALiHSj+euPMoIoUn770TjZ5j6Dr421aIYEuWyqZaC+I=;
 b=POR+Qb48PESHiFw4NdtI5qcbQgmZi/YIMYHKodpu92ptiTNQZqz/DOw4ObCcsvJrDq
 QR/RwGPWu4eYq3KmGobYh1EIWY2YkG/nbz/VqQLIvJKYcUyZHy/VA9i1Yrt/nzp4M2Ga
 l/OnZoLBFg2bkipXAJz+uCed6Cq/EGZ0qt/PCNY9EbrK64BIeIaESW1/ohQRT4yxc4AF
 9rmXwm7uWLo1cyvb4976ZdlYIBpJLbYrWSH8ja3Lq/mRQL0f54GOosvLLIQQs7gb04jp
 6W9SoaRQjFOFJlfyU7x23+zpfi2mtn/cW09EhZeZ6d4je22z0+VQBD0oXZoPUpO/W7lE
 WpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789692315; x=1790297115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ALiHSj+euPMoIoUn770TjZ5j6Dr421aIYEuWyqZaC+I=;
 b=baO/K1WY35m87pLXaoxbX2wjX+kwK/pibsQ/xvBg+ooVXGhtLMv8TQz3ZkXJq82xrT
 6L8QRSLklvEpWj0kdpSqlR51CDW0YxmHhIXo/J6VUu9KyGEd7WOLV8K02Z+C3n6RokZ/
 LqfVDvyjvD5fMfg0n0eYHfQQCn8tI3xWD2xVdClLicDUt8Xc3Sh85o2zA88tPlNOp8WE
 7EPWoUAJlqWfDUbo0LowXXV8wxdXIM/F0OyXdFdPnDAKxSIX6NjQGAwcNN39vPM3TDiS
 2+UqrSOIxCy/9G8lwNIXNVLUVBVHricnZwmg1qUTIHhisRX3pYgvO+E6z0SCzsHHOsFZ
 +/8g==
X-Forwarded-Encrypted: i=1;
 AKwUvBwlXF4TBWDXCEypRIL9M/KrE5DPqSh7jACZq8yqckbrnsMK7bA7CzGO/p+NmjfADDArEpyxtO0Glg==@nongnu.org
X-Gm-Message-State: AFuF++kWdzO7WNSvc5Wk0tNKacCgHBpkP1Y7m5/gJcbUVZzPpUI38LLm
 6RNvQ4IvCAuHIm+aaADHwWUMRii9MeIqBDZeyF9UwoX0284UswXG2iF5
X-Gm-Gg: AYBFou0SDTPfMOWniyMDP+tuFtN/kA34HvjiIi8+IpTX36oGDctognn9ofqlS79YIT3
 ePR9WIgw6TIC3o+A3sKZxodeJFNqxnvxURHx+tfrHuJ9QeLAuCSt+ZkclxYXiRQGcZK+68SwenC
 kgOHes4OZvm5sOhvbMwNf/q/kMf3YulE/wp0xheLNkQNHwQ/JuVcYvSO1jeR/pNa9bhLMmX2DPx
 Ub9dp72xCs8cES8mfVrg0k6Lk0WRgjnxdJaSs4+5I2kCnTVIDQDhZvlnEtCZ340cH5+xRmwlWkz
 no9wUBw17RY0MEWHeHdpEa6gl/i+Q/Dw8GDQ6XUI0pNZqSP6RSUsNdNm6UOGqPNmnPJGQ3hMm7i
 2cA6FzVYXUGF2eyLLwOGXfijtF2sJMMOQkLEooALhK1Q7WHXcfSGca50sKO51Yje7dEb0H7QXFH
 MT4QPB2X91EUyRqLPqr+ZIedHjpVcDcmtAU3rleHAYx2zHXpohZUQgTi98cntMzby9RiwMyroSt
 noPsbADZ2v+W3GUGUNB2/oORJq38x3L
X-Received: by 2002:a17:90b:2243:b0:39d:f773:37b5 with SMTP id
 98e67ed59e1d1-39e549c5057mr2997434a91.0.1789692314588; 
 Thu, 17 Sep 2026 17:45:14 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144cdfc3df2sm600286c88.5.2026.09.17.17.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:45:13 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Nicholas Piggin <npiggin@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 18/21] target/riscv: convert raise_exception to
 riscv_raise_exception
Date: Fri, 18 Sep 2026 08:42:20 +0800
Message-ID: <20260918004225.827-19-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260918004225.827-1-luoyonggang@gmail.com>
References: <20260918004225.827-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Prefix leftover TCG raise_exception to riscv_raise_exception so
translate still decrements instret then exits with restore 0. Keep
C riscv_raise_exception via cpu_loop_exit_excp.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/helper.h                             |  2 +-
 target/riscv/tcg/insn_trans/trans_rvi.c.inc       |  6 ++----
 target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc |  3 +--
 target/riscv/tcg/op_helper.c                      |  5 ++---
 target/riscv/tcg/translate.c                      | 10 +++++++---
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 4fc2d3a1559..3fdd41aef3c 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1,5 +1,5 @@
 /* Exceptions */
-DEF_HELPER_2(raise_exception, noreturn, env, i32)
+DEF_HELPER_2(riscv_raise_exception, noreturn, env, i32)
 
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
diff --git a/target/riscv/tcg/insn_trans/trans_rvi.c.inc b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
index cc1b5dbbadc..d8e49a75633 100644
--- a/target/riscv/tcg/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
@@ -55,8 +55,7 @@ static bool trans_lpad(DisasContext *ctx, arg_lpad *a)
          */
         tcg_gen_st8_i32(tcg_constant_i32(RISCV_EXCP_SW_CHECK_FCFI_TVAL),
                         tcg_env, offsetof(CPURISCVState, sw_check_code));
-        gen_helper_raise_exception(tcg_env,
-                      tcg_constant_i32(RISCV_EXCP_SW_CHECK));
+        gen_raise_exception(RISCV_EXCP_SW_CHECK);
         return true;
     }
 
@@ -68,8 +67,7 @@ static bool trans_lpad(DisasContext *ctx, arg_lpad *a)
         tcg_gen_brcondi_tl(TCG_COND_EQ, tmp, a->label, skip);
         tcg_gen_st8_i32(tcg_constant_i32(RISCV_EXCP_SW_CHECK_FCFI_TVAL),
                         tcg_env, offsetof(CPURISCVState, sw_check_code));
-        gen_helper_raise_exception(tcg_env,
-                      tcg_constant_i32(RISCV_EXCP_SW_CHECK));
+        gen_raise_exception(RISCV_EXCP_SW_CHECK);
         gen_set_label(skip);
     }
 
diff --git a/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc b/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc
index d47a9f9c7d2..087328a12ef 100644
--- a/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc
@@ -43,8 +43,7 @@ static bool trans_sspopchk(DisasContext *ctx, arg_sspopchk *a)
     tcg_gen_brcond_tl(TCG_COND_EQ, data, rs1, skip);
     tcg_gen_st8_i32(tcg_constant_i32(RISCV_EXCP_SW_CHECK_BCFI_TVAL),
                     tcg_env, offsetof(CPURISCVState, sw_check_code));
-    gen_helper_raise_exception(tcg_env,
-                  tcg_constant_i32(RISCV_EXCP_SW_CHECK));
+    gen_raise_exception(RISCV_EXCP_SW_CHECK);
     gen_set_label(skip);
     tcg_gen_addi_tl(addr, addr, tmp);
     tcg_gen_ext_tl_i64(wide_addr, addr);
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index 3e94005d2bd..2b1521658dd 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -44,11 +44,10 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
                           riscv_cpu_get_trap_name(exception, false),
                           env->pc);
 
-    cs->exception_index = exception;
-    cpu_loop_exit_restore(cs, pc);
+    cpu_loop_exit_excp(cs, exception, pc);
 }
 
-void helper_raise_exception(CPURISCVState *env, uint32_t exception)
+void HELPER(riscv_raise_exception)(CPURISCVState *env, uint32_t exception)
 {
 #ifndef CONFIG_USER_ONLY
     riscv_pmu_decr_instret(env);
diff --git a/target/riscv/tcg/translate.c b/target/riscv/tcg/translate.c
index 9684dbe7528..da0bcc7bb66 100644
--- a/target/riscv/tcg/translate.c
+++ b/target/riscv/tcg/translate.c
@@ -254,10 +254,15 @@ static void gen_update_pc(DisasContext *ctx, target_long diff)
     ctx->pc_save = ctx->base.pc_next + diff;
 }
 
+static void gen_raise_exception(uint32_t excp)
+{
+    gen_helper_riscv_raise_exception(tcg_env, tcg_constant_i32(excp));
+}
+
 static void generate_exception(DisasContext *ctx, RISCVException excp)
 {
     gen_update_pc(ctx, 0);
-    gen_helper_raise_exception(tcg_env, tcg_constant_i32(excp));
+    gen_raise_exception(excp);
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -1394,8 +1399,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         tcg_ctx->emit_before_op = QTAILQ_NEXT(ctx->base.insn_start, link);
         tcg_gen_st8_i32(tcg_constant_i32(RISCV_EXCP_SW_CHECK_FCFI_TVAL),
                         tcg_env, offsetof(CPURISCVState, sw_check_code));
-        gen_helper_raise_exception(tcg_env,
-                      tcg_constant_i32(RISCV_EXCP_SW_CHECK));
+        gen_raise_exception(RISCV_EXCP_SW_CHECK);
         tcg_ctx->emit_before_op = NULL;
         ctx->base.is_jmp = DISAS_NORETURN;
     }
-- 
2.52.0.windows.1



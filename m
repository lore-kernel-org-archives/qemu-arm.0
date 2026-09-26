Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF71C98338
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 11:09:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAQH0-00084W-Me; Sat, 26 Sep 2026 07:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQGu-00082u-Lw
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 07:08:50 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQGt-0002ke-2l
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 07:08:48 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-145047ad220so591249c88.3
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 04:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790420926; x=1791025726; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=guuk/GU2+6svkxqusCAEMJJEdeLkWutsxCBXdBcfQM0=;
 b=KbzpJANR2X4BdWMVG0sJeiF8+TfaXtbJZ2ETcfziNfVV8i2Bu99jTfJoLUtSefrrmt
 0pRq3lONT4WI3g79kofEUZecc4fg1JUxRLNg+h3AeLSo5OhU60qIpc6oJPx0U4pT5AHz
 qcUiRqNgCr9wZWNa3aVAtlOUftEtDG9UA+TRjEhqPbQHsGsZ4+pk3xnN6qthlPO1RQ87
 j1n9C7ix+TLfwLqGzuE10CD6NqrzVjTBEvdwwwXxRH6uXQzXAPgz62it5baMVFepqVJD
 kzRbeLFBHBaWdhj6FdFXs9GxgSzA5/ytfUwIgHenlzsK0wCnMuD1gQnarzL1tPEuy3Az
 Actg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790420926; x=1791025726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=guuk/GU2+6svkxqusCAEMJJEdeLkWutsxCBXdBcfQM0=;
 b=UoTSIhs8jwRcHLTz8PtCqcPDGlPpuc9gR6auxhtHHGjJz+DXLyrjy1Z+wiU6DcpN2A
 bybIzCSweJvVWcEaM7aRzuQ/jgtrEpiNOqJikKftTCMZ6TzL8wC32eqPOuWHkmy2ih7K
 9B6LbRMBQibZ3AGSHvYHfWP4SEv/0Q85Ucd7cDHnyXj+8oyQmJQC4ESXr6rq9vwS8AjO
 ZWMERn+O+oTDSh/S6qA3kfFDYEU5XiAxB4pwulczUfLf0nfwviWT93DeltTx2aFy0/Ks
 ePqrd9ANqxdqL9RkQdBvvv29q1n37MtIKvXtDew4orZoDjXdSE5IQ0VuX0Ij0pomW/Xz
 H6yw==
X-Forwarded-Encrypted: i=1;
 AKwUvBySp/77kN+IojwPH/+tfl88d9KR3QmxCsWSQK4PZF/NeTwUl0iEdQqh9oPx1sJouPAPfTQh1AYn4g==@nongnu.org
X-Gm-Message-State: AFuF++nr/h17p5B0jFBiPmlN9WPjoXJBOBf0PzMBuE7uOy4b6tJcbx4F
 ZPvUeDKsTFLlIF7Xo1kcviFpLy9p9KZ5SKJucmdQ9TMYNL7gcvv6k8UQ
X-Gm-Gg: AYBFou1RJ4tP6nLM/N4GV7dKd/P/nEmLs/rRe/Me2/EO2uGE56dajSaJJH9Ciy2x17G
 DPLqhhHpdF4Uj1g+kCpG4P9PPPYXoKpFbAUjYNYrUAugQpEvA3qctANuLscNc6gsGc3uQIPn2rc
 xYUfKTTDDQW3ThyHWuXzWyz9hd8auQSi8d7ENEfi3kYoBaoUhAHtjoOpgisAnKyc5yq1JM6Yn5G
 KeXcCxuwuWePrR62iObaTGkzyLU/hia4bPD99Kg0lcqmNtNXhqt/UyusM1jAAOPXmLIcv+r6RGT
 XXmQdMUcsqu5NTPW/uHjydS6+aPKO8THiydND4grOiTmw8NpIf8drQXsQFvZ4Uyo8QJv+WxYlHQ
 5GpKxy19eD7vD6/y7PC1DtF6KmjnDssJ3hdY9v1q41ybyVMRRTxMeyUIW3U3pRZXluNP2qgU0ui
 MZ+2sJRKoLqbCDu9RoGHvH9YX8wxgspurdcgvR4vggpjgowDH3yyXfzbClLxo7IsMzQUxJOL71B
 /csxcG5jSghRFhlBlKE2aZhHq27GOY=
X-Received: by 2002:a05:701b:4343:b0:143:26ed:2dd4 with SMTP id
 a92af1059eb24-146cfcd91c7mr2281470c88.30.1790420925630; 
 Sat, 26 Sep 2026 04:08:45 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-145a7318afcsm11414045c88.0.2026.09.26.04.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 04:08:44 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Song Gao <17746591750@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>, Ani Sinha <anisinha@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 3/9] target/hexagon: rename helper_wait to helper_hexagon_wait
Date: Sat, 26 Sep 2026 19:08:11 +0800
Message-ID: <20260926110818.1912-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926110818.1912-1-luoyonggang@gmail.com>
References: <20260926110818.1912-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

helper_wait is a global C symbol. Prefix it and take the resume PC
as vaddr.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/hexagon/gen_tcg_sys.h | 2 +-
 target/hexagon/helper.h      | 2 +-
 target/hexagon/op_helper.c   | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/hexagon/gen_tcg_sys.h b/target/hexagon/gen_tcg_sys.h
index af5032214c4..489d2780470 100644
--- a/target/hexagon/gen_tcg_sys.h
+++ b/target/hexagon/gen_tcg_sys.h
@@ -80,7 +80,7 @@
 #define fGEN_TCG_Y2_wait(SHORTCODE) \
     do { \
         RsV = RsV; \
-        gen_helper_wait(tcg_env, tcg_constant_tl(ctx->pkt.pc)); \
+        gen_helper_hexagon_wait(tcg_env, tcg_constant_vaddr(ctx->pkt.pc)); \
     } while (0)
 
 #define fGEN_TCG_Y2_resume(SHORTCODE) \
diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h
index 71c8da4c46d..030ed6dcef5 100644
--- a/target/hexagon/helper.h
+++ b/target/hexagon/helper.h
@@ -136,7 +136,7 @@ DEF_HELPER_3(sreg_write_masked, void, env, i32, i32)
 DEF_HELPER_3(setprio, void, env, i32, i32)
 DEF_HELPER_2(start, void, env, i32)
 DEF_HELPER_1(stop, void, env)
-DEF_HELPER_2(wait, void, env, i32)
+DEF_HELPER_2(hexagon_wait, void, env, vaddr)
 DEF_HELPER_2(resume, void, env, i32)
 DEF_HELPER_1(resched, void, env)
 DEF_HELPER_3(modify_ssr, void, env, i32, i32)
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 4f00ca773f3..7f026292ce8 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -1741,7 +1741,7 @@ static void set_wait_mode(CPUHexagonState *env)
     SET_SYSTEM_FIELD(env, HEX_SREG_MODECTL, MODECTL_W, thread_wait_mask);
 }
 
-static void hexagon_wait_thread(CPUHexagonState *env, uint32_t PC)
+static void hexagon_wait_thread(CPUHexagonState *env, vaddr pc)
 {
     CPUState *cs;
 
@@ -1768,7 +1768,7 @@ static void hexagon_wait_thread(CPUHexagonState *env, uint32_t PC)
         return;
     }
     set_wait_mode(env);
-    env->wait_next_pc = PC + 4;
+    env->wait_next_pc = pc + 4;
 
     cpu_interrupt(cs, CPU_INTERRUPT_HALT);
 }
@@ -1836,12 +1836,12 @@ void HELPER(resched)(CPUHexagonState *env)
     resched(env);
 }
 
-void HELPER(wait)(CPUHexagonState *env, uint32_t PC)
+void HELPER(hexagon_wait)(CPUHexagonState *env, vaddr pc)
 {
     BQL_LOCK_GUARD();
 
     if (!fIN_DEBUG_MODE(env->threadId)) {
-        hexagon_wait_thread(env, PC);
+        hexagon_wait_thread(env, pc);
     }
 }
 
-- 
2.52.0.windows.1



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1570CCD3436
	for <qemu-arm@archiver.kernel.org>; Tue,  5 May 2026 11:21:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKDpI-0007KH-KC; Tue, 05 May 2026 07:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wKDpA-0007Hd-N2
 for qemu-arm@nongnu.org; Tue, 05 May 2026 07:20:24 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wKDp7-0005qO-SX
 for qemu-arm@nongnu.org; Tue, 05 May 2026 07:20:24 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4891b0786beso34848495e9.1
 for <qemu-arm@nongnu.org>; Tue, 05 May 2026 04:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777980020; x=1778584820; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qtXqU1v3S6F08KlnlXStnvY5Za2Hngy695ogoXb86Wc=;
 b=kv/UuOD5OzmuMRRNsE4R8nM/aTlHRfBamolRmWSaDXKKAfAwpsi26mJPIYg3rAoS0+
 ivsNa3P3PCuvdx+ndHkh8pS+F0nsGI+SDFefmCOC7B8mmnNP8irUr9wMDb7PPB97ugJX
 Uefd4vPUU/9jfgsf29/z8eIbpg7gn8r2hjxceLaNIIyRk7oMOoQkqSh4YfQharnRjBsg
 +5VJ0PgNX66YHaCeBbmjWDhGRJFkY19bRWDBLGK4IfUtPTgpt7q1zFrk975IZ63DT6eC
 QPJdXD6i6f3vyfJqRHyTGRU8EgUt0FPVK/6PuvkJjivh92WC/5Yvk5YJxMrQ0m+R9gEF
 ccGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777980020; x=1778584820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qtXqU1v3S6F08KlnlXStnvY5Za2Hngy695ogoXb86Wc=;
 b=HvHgVTk4ROasFs7VooPPlfgF9ItEcpcQjz2yGw5ItKO1k3wNBoUvKTo+uCwKUpnltO
 ZjydYr70qdSp1XM4V9xbKsqN4QIAi5IRERn8p+N1aQIo+6Ys8OFTSQ8kQM7oKkeHH29K
 asEnl8EpNWX2IwrVPgRPXMB2YCD2qCEEGH645aRFlg/RGX3ExQLQuwzTtSQjLNd8RY0T
 bST0BV7lYe58enUpvI7vzc9ERmpDviOCHa8o7FujbZhdYAGoCEOGkmJ4jQW2OlkJ8J12
 d3aQ3I5N0t2SL2/IejeWPsDvC75y2mKqov6lnEfjlGQcT5nRErgOtNTaKxv6xl688KhW
 kpRg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+i+YF1bQDEJUL0JfaO9qx1cukxEVpGwwFkgnznGbqz0jv/QPNWwmN8+9ck6TbbzzRUZe7C7XOA7Q==@nongnu.org
X-Gm-Message-State: AOJu0Yysnh6n6XVZ6kgYQBUGlnmz7EzCULh2rfV9/b+WmO5+SehCe2jL
 n/vlbXMiqFUA9oSOI3M+nhKkUabmNuIjJwhmXfWGbWdNrI0LCTGpRCHd2LSvMFcd85c=
X-Gm-Gg: AeBDieuS6WIUyNlhOGVkzq/3dtVwEP2CMpOojIlc6M/UVSMSs0gO2pK/8uls2qBevqz
 vOtWZL/6uNd+sQUk+N1N21hx30aHco2cjuf8/a+Nz3xqs+g/ZamnqgXEVaYmjDvCiNBikzINNQI
 0WIte6MfaWmOSfjFMLzowy9aZ66W8ZLBW2K3D2Wro8rawV54A5QOc9LJa7NUgt2JK9eBJZTULvF
 EmpjyBCttuocNofTKj5O9pwsx4Db5ph4fVb9kjO+n3uPdkKS2Wxqo6KP7gtnBK1f8XNLgzAF0lg
 Ua3O/uHJEGWvkXA0Cq/d538iEfr+43BAvIIuREXFIFId61HabF2fitMQO/eRkzjR9FskN9OpEDI
 VIyDRKzBgr2is75L+C/AGVsoA0uHTrY87QfE6JfW31WbRJ+LU7MIvSrbxo3cO6eWbxI+86zivA7
 jtMEL5UwrAj0BV8X5Bu3BinSoM/yorfjRsVw==
X-Received: by 2002:a05:600c:c089:b0:48a:7965:b943 with SMTP id
 5b1f17b1804b1-48a98676d56mr196011525e9.29.1777980020274; 
 Tue, 05 May 2026 04:20:20 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48d17ff35eesm15818675e9.14.2026.05.05.04.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 04:20:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E06465FAF9;
 Tue, 05 May 2026 12:20:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Alexander Graf <agraf@csgraf.de>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 6/7] target/arm: handle the WFE trap case
Date: Tue,  5 May 2026 12:20:12 +0100
Message-ID: <20260505112014.102993-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505112014.102993-1-alex.bennee@linaro.org>
References: <20260505112014.102993-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Now WFE can actually suspend on A-profile we also need to handle when
its trapped. To do this we need to pass the instruction size so we can
deal with the is_16bit syndrome encoding.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/helper-defs.h   |  2 +-
 target/arm/tcg/op_helper.c     | 13 ++++++++++++-
 target/arm/tcg/translate-a64.c |  2 +-
 target/arm/tcg/translate.c     |  2 +-
 4 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index a05f2258f29..ebdf09be38a 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -54,7 +54,7 @@ DEF_HELPER_2(exception_swstep, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, vaddr)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
-DEF_HELPER_1(wfe, void, env)
+DEF_HELPER_2(wfe, void, env, i32)
 DEF_HELPER_2(wfit, void, env, i32)
 DEF_HELPER_1(yield, void, env)
 DEF_HELPER_1(pre_hvc, void, env)
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 8284dacbdf6..1349bcc7929 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -574,7 +574,7 @@ static int64_t gt_calc_next_event_stream(CPUARMState *env)
 }
 #endif
 
-void HELPER(wfe)(CPUARMState *env)
+void HELPER(wfe)(CPUARMState *env, uint32_t insn_len)
 {
 #ifdef CONFIG_USER_ONLY
     /*
@@ -600,6 +600,17 @@ void HELPER(wfe)(CPUARMState *env)
         return;
     }
 
+    /* We might sleep, so now we check to see if we should trap */
+    if (target_el) {
+        if (env->aarch64) {
+            env->pc -= insn_len;
+        } else {
+            env->regs[15] -= insn_len;
+        }
+        raise_exception(env, excp, syn_wfx(1, 0xe, 0, false, WFE, insn_len == 2),
+                        target_el);
+    }
+
     /*
      * If the CPU has entered the exclusive region we could sleep
      * until the global monitor moves from Exclusive to Open Access.
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 8b97136e78b..a6f392a28f8 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10938,7 +10938,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
          */
         case DISAS_WFE:
             gen_a64_update_pc(dc, 4);
-            gen_helper_wfe(tcg_env);
+            gen_helper_wfe(tcg_env, tcg_constant_i32(4));
             tcg_gen_exit_tb(NULL, 0);
             break;
         case DISAS_WFI:
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 3ab49887ce6..686980b58e3 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6836,7 +6836,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             tcg_gen_exit_tb(NULL, 0);
             break;
         case DISAS_WFE:
-            gen_helper_wfe(tcg_env);
+            gen_helper_wfe(tcg_env, tcg_constant_i32(curr_insn_len(dc)));
             /*
              * The helper can return if the event register is set, so we
              * must go back to the main loop to check for events.
-- 
2.47.3



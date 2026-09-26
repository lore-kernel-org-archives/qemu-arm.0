Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F676C98318
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 11:10:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAQGq-00082J-SC; Sat, 26 Sep 2026 07:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQGp-00081Y-9J
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 07:08:43 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQGn-0002k8-SH
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 07:08:43 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-145ab8fd39cso1532946c88.2
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 04:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790420919; x=1791025719; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/jLASucLyba2qelSD7n1s06CsRjfE29IQw8Hf32tRFs=;
 b=beibw3UIT/aLNf/tOpFUFTmnY9NnctmCZ4ETHhGqdDiGmg+JVdzYKTAkD56pmTY7+/
 iNnJU8VuesIQPXyHWc3FGg20jc8YpdpZVVO83FfwCPWLAFUR98VumsP0ZjfdICvJwNbp
 rZXoBcy4qnW1oOqB8hGyPs6sTi9oZ2esQD1gXj66Fzcr3hJa11kjdS4E8E+5WiRMCRdf
 +7ObdWk37Q96kkqxuGP3TsBrI3XtjpVWGgiSwI+Ywh75YDzyUvRLfvBohILYaG/sb6br
 OVr8RnANRjg97R3lgxEbvT7yd7nZgdtD6DRxl/3MJhcThghkuNKdPaQYrN8AZ2wxY/jk
 SKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790420919; x=1791025719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/jLASucLyba2qelSD7n1s06CsRjfE29IQw8Hf32tRFs=;
 b=Z0E7ko5ie287eB2RPSLPx/cnBWye3AepMz0giQcleN9IpFQDMfBgWKlvR6I/Upjd8W
 thTC1RvVmZCQNhso0jVqpJt/fgYtTxa7jf7uEHQHfQCcfD0YBHrRJA5bVc3oMYgUsQKH
 1UOaSjhTA4fmIW/HeTY07hITWqyduP+A3thvhG6suUrp3uq0FXkuu7oerwslbm6r7pP9
 JR00Gtz0oXWx5dFhJSqLTzvonjVNimkbv/ftPve4RpBgGMb3uN4tf285SXuGojm0iGuc
 GMd/Hf80wBFFAmK2jvhkx3Kk8HUfQdyS6reaO1o6CykUeEwdBTcSYyBk44epGBEEuruu
 j4MA==
X-Forwarded-Encrypted: i=1;
 AKwUvByUdMyA2WBcbgFo9ASKSv3Qu9zyUGW5PVZESILRyVC9KEfzY197JD0KOFSu9qV/xv18rXui/by6pA==@nongnu.org
X-Gm-Message-State: AFuF++kB6S8b4iMU5QM6tCrAzd7zI4XwTyKr8PCoNzDDv2jDgF/pspH9
 IKX+OAw3z//UgDGztofoItNmCiWwaLd2RdXumP88ar2KplheFCVuZp+7
X-Gm-Gg: AYBFou0PjLInxx2gwNWlb8fkRl9otYCrGbLCHTKyDaOe5SdZn2ZydH/UCRuc76rwsdr
 dwGggFULBIS5fvke1zFtdHiMDFAMOsdCv+3x1nKUrIKFtDzrdIgXs8MbKAXIA7RXkuEVEgS/5PV
 bJ0bILh/SqE4Z4Xd5A4BSKqk2V0RfQ+/7TBQMTwQ3gTN3Aa3bcvSVCvStxMRC9jsTXmWiW5Lshx
 MkndxQuWl3G/h0UvanAelgGMxgQENSt9z8Z6xB9s9Eb3P7+bpAfZB/p9wiW8ypMPlNChgPM4x4U
 ZTTQKArVEdur6RqM9JachZ6e3g6/jyMDQrqtJ3Dj8ryeJBYbb7+Yrsr6LZRSdr4nmTZrRgHCiWs
 nBliO8/BGTQ7V7aa4mYqjLShapjpgjJntJukzUmjQXSGek1BeMAtysw5rYTPTQ5cTnT4qKE1z4Y
 9oKIwd+gzIvRoD3ibXpMIAZgegOqBRwSfNJUbEvLDWFGmi6UDgFdIYNgsfiBOyiygcBZDG7Tw9H
 jx5hyQ6Uk08QL9v0DY4+NWsM9VNQ5IbEeTJhXagtw==
X-Received: by 2002:a05:701b:20de:20b0:145:5c7:71bc with SMTP id
 a92af1059eb24-146cddbcfddmr2949754c88.5.1790420919456; 
 Sat, 26 Sep 2026 04:08:39 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-145a7318afcsm11414045c88.0.2026.09.26.04.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 04:08:38 -0700 (PDT)
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
Subject: [PATCH 2/9] target/rx: rename helper_wait to helper_rx_wait
Date: Sat, 26 Sep 2026 19:08:10 +0800
Message-ID: <20260926110818.1912-3-luoyonggang@gmail.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

helper_wait is a global C symbol. Prefix it so one binary can keep
that short name free for another target.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/rx/helper.h    | 2 +-
 target/rx/op_helper.c | 2 +-
 target/rx/translate.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/rx/helper.h b/target/rx/helper.h
index 8cc38b0cb71..e88782cf227 100644
--- a/target/rx/helper.h
+++ b/target/rx/helper.h
@@ -1,7 +1,7 @@
 DEF_HELPER_1(raise_illegal_instruction, noreturn, env)
 DEF_HELPER_1(raise_access_fault, noreturn, env)
 DEF_HELPER_1(raise_privilege_violation, noreturn, env)
-DEF_HELPER_1(wait, noreturn, env)
+DEF_HELPER_1(rx_wait, noreturn, env)
 DEF_HELPER_2(rxint, noreturn, env, i32)
 DEF_HELPER_1(rxbrk, noreturn, env)
 DEF_HELPER_3(fadd, f32, env, f32, f32)
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 36df7d377e5..4bd25bb7d00 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -445,7 +445,7 @@ G_NORETURN void helper_raise_illegal_instruction(CPURXState *env)
     raise_exception(env, 23, GETPC());
 }
 
-G_NORETURN void helper_wait(CPURXState *env)
+G_NORETURN void helper_rx_wait(CPURXState *env)
 {
     CPUState *cs = env_cpu(env);
 
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 132d495710c..b2e3d346147 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2197,7 +2197,7 @@ static bool trans_WAIT(DisasContext *ctx, arg_WAIT *a)
 {
     if (is_privileged(ctx, 1)) {
         tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
-        gen_helper_wait(tcg_env);
+        gen_helper_rx_wait(tcg_env);
     }
     return true;
 }
-- 
2.52.0.windows.1



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AA6C982D0
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 00:44:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7MhS-0007Tn-IH; Thu, 17 Sep 2026 20:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7MhR-0007Se-FV
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:43:33 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7MhP-0001ed-Pd
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:43:33 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 98e67ed59e1d1-396cccbba92so180545a91.0
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 17:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789692210; x=1790297010; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hmDO6zTK1S69QUicgCowNUg+ALAjpN+7pbeoaU6cbXI=;
 b=XCPypPlH+aGVyrgjQ3O/m/nVIO3ToNHGA7MTEIwPbVAz+ldFmTws6O+dPiOTOGhemj
 hUV9ketk1mEijENKtrazfSvd1UNfhfjn4OXA76+ZuEc8c9HUEuCazIzdW9ZfpEd6GFe1
 9pipNfXWJbcYabWnpnIAGnDmTWQUg+O7NDKX0lMZPp3VxHHhyMA0RvdWOkoypHJtfn60
 ZlIb3EtRnOjkgyl/HTGSWrvzDCRLI3GclYmRWVN8v/aEW5BpCBfFpXVH5SGcHigPJ52L
 40xAVsyBjl01cZHJQ5F4xZtGioeMGc8afVukUWvgAja+lHaDzDvUmbBwt0PtJYfMFCCf
 Zedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789692210; x=1790297010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hmDO6zTK1S69QUicgCowNUg+ALAjpN+7pbeoaU6cbXI=;
 b=KaLVqMgKjj7YaFgIYUc3x16ek2rcZY+NzfXG8CCWBdVj5bF6NJoPGbK/QbcMZD/d7Y
 jr0PqVaONPhpxGkiVDRtnHLDDFR3UCbgTmiwYuIACJhM4KpkIGa7PvvXy45Y+ol5Ejgm
 pwSG1a0tYPoYMDq81BomrzKpBpHpdWOcDnWkE9ntxgfzisJM1MS2hU8LpoW1RDPWOa8D
 aprsN+V8L0OSoLG8fDlVE50wquNVQpqYv1NO2qHsXlmHjyqUvQl4pk3MpMV3bN3H/bBh
 65hRO5tK7qU+6G6wakPbosiSCg/f/ypPKZgC0rTkbNQXVKfBzE0HlXJPiP9vCkUW1AcK
 o1tQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz9OQWljwpBGI0voYrAplrhmV1FiIX/DrnRkx+9E68QpLUQ8QwQ0H+XZPzAJgK2j5gtanyJ7jNFvA==@nongnu.org
X-Gm-Message-State: AFuF++nv7O2V5hAtddWq8p9gO38e96TBXykZa9ZGNFUXt8fuudUSkFpL
 jwHaDE+Zin9nsEvuTZN8r9e9aMnSbAoY3DQU6qRxwkHbho6bgIGoUC/K
X-Gm-Gg: AYBFou2QeKS3CcX7M8yqxC086hVT0BryHLIY/KpTnPvGaLlIxdyS30pSXZlmQz9ll6Q
 gFwfrTMln+RmqDip7W/RmpfAfzukmFpjumeMBB0VOZtufALzGf4u2vP/eDpxwTy4UHPVlC/nWGt
 IMDCqXALr7DzO2znPnGQV1anQjRRoPyszVS26vResRuP2TYK2GkXNq1s/jP3p8m3+5qfALkdvHG
 GDpvOty/yBR96XgPBXMpQHY3g3D1Yh6+eP7HouRISL57lOgdUDGEXkQAzSndMwW3ZObyErXkFQ2
 Tumq5Q1XQPZUWrx6IeWTtQ4jFUJpGHR7yRVq0ePOnn1YiPnZN4ZKR9IFqvyOgfgniqLzuQD7bGo
 FmTryLoixs59E7pAiDxgTPogdRWf1T/p46iMGY0SHEDJklvbzVU7qFCf3DdmhLRF2lBDs1bJ3WM
 q5j9+y6xmalpHaEy7fDZp3GsnR1RyAD8UpsuTDG53rZXswmQ9Aqz4V5Lleo2rNVyPHmxE0NIYEc
 H3frwQMpqrTrSBJjyR66GpxSkI+SMFX1QDUyNWmZBs=
X-Received: by 2002:a17:90a:d00e:b0:39d:fd82:de0c with SMTP id
 98e67ed59e1d1-39e54aeed0emr1765463a91.2.1789692210488; 
 Thu, 17 Sep 2026 17:43:30 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144cdfc3df2sm600286c88.5.2026.09.17.17.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:43:29 -0700 (PDT)
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
Subject: [PATCH 06/21] target/m68k: convert raises to raise_excp
Date: Fri, 18 Sep 2026 08:42:08 +0800
Message-ID: <20260918004225.827-7-luoyonggang@gmail.com>
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

Translate through gen_helper_raise_excp with restore 0. Drop TCG
raise_exception and the one-line raise_exception_ra wrappers. Keep
leftover raise_exception_format2.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/m68k/helper.c    | 12 ++----------
 target/m68k/helper.h    |  1 -
 target/m68k/op_helper.c | 19 -------------------
 target/m68k/translate.c |  2 +-
 4 files changed, 3 insertions(+), 31 deletions(-)

diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 5f91d206f59..3c62e15735d 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -162,14 +162,6 @@ void HELPER(cf_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
     }
 }
 
-static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = tt;
-    cpu_loop_exit_restore(cs, raddr);
-}
-
 void HELPER(m68k_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
 {
     switch (reg) {
@@ -291,7 +283,7 @@ void HELPER(m68k_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
     }
 
     /* Invalid control registers will generate an exception. */
-    raise_exception_ra(env, EXCP_ILLEGAL, 0);
+    cpu_loop_exit_excp(env_cpu(env), EXCP_ILLEGAL, 0);
 }
 
 uint32_t HELPER(m68k_movec_from)(CPUM68KState *env, uint32_t reg)
@@ -394,7 +386,7 @@ uint32_t HELPER(m68k_movec_from)(CPUM68KState *env, uint32_t reg)
     }
 
     /* Invalid control registers will generate an exception. */
-    raise_exception_ra(env, EXCP_ILLEGAL, 0);
+    cpu_loop_exit_excp(env_cpu(env), EXCP_ILLEGAL, 0);
 
     return 0;
 }
diff --git a/target/m68k/helper.h b/target/m68k/helper.h
index 0bda8f8152d..a6ca811ebe2 100644
--- a/target/m68k/helper.h
+++ b/target/m68k/helper.h
@@ -111,7 +111,6 @@ DEF_HELPER_3(set_mac_extu, void, env, i32, i32)
 DEF_HELPER_2(flush_flags, void, env, i32)
 DEF_HELPER_2(set_ccr, void, env, i32)
 DEF_HELPER_FLAGS_1(get_ccr, TCG_CALL_NO_WG_SE, i32, env)
-DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 DEF_HELPER_FLAGS_3(bfffo_reg, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 38f7a689814..5f539f8fd75 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -539,25 +539,6 @@ bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
 #endif /* !CONFIG_USER_ONLY */
 
-G_NORETURN static void
-raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = tt;
-    cpu_loop_exit_restore(cs, raddr);
-}
-
-G_NORETURN static void raise_exception(CPUM68KState *env, int tt)
-{
-    raise_exception_ra(env, tt, 0);
-}
-
-void HELPER(raise_exception)(CPUM68KState *env, uint32_t tt)
-{
-    raise_exception(env, tt);
-}
-
 G_NORETURN static void
 raise_exception_format2(CPUM68KState *env, int tt, int ilen, uintptr_t raddr)
 {
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 138c89d3e53..15f368afd54 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -252,7 +252,7 @@ static void gen_jmp(DisasContext *s, TCGv dest)
 
 static void gen_raise_exception(int nr)
 {
-    gen_helper_raise_exception(tcg_env, tcg_constant_i32(nr));
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(nr), tcg_constant_i32(0));
 }
 
 static void gen_raise_exception_format2(DisasContext *s, int nr,
-- 
2.52.0.windows.1



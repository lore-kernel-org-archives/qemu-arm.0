Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF38C98328
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 05:25:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB3p4-0004KK-K7; Mon, 28 Sep 2026 01:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3oY-00042o-CQ
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 01:22:18 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3oV-0007uQ-CI
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 01:22:09 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-1460bcc512eso1245934c88.1
 for <qemu-arm@nongnu.org>; Sun, 27 Sep 2026 22:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790572926; x=1791177726; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xjVMaYr3kqXJVYCxY7VYQbjUgY58Olm454tDy/V29P8=;
 b=SJhS9+CiSDo+Zq/cmcA18DOl6MifkeEU0zjgha0YeJRXXvnODvbEiBLRbLpKceKGK1
 VaCODKhqjNaDPdaYSBfEiGxAJ1RGIlLfR3UF27OyYSB2b/JydvDtvx6A3vXCukQxPTkk
 CCX/h7cVKLARman6P5nWzFmWLJPMdQcANB85MaEewl3J3IwOAGuOSTWRpg04TGERzXZL
 peDbugWCrPSE4s8fbL9M1DzISS7DJuSdbRULCiRp1knMxy1hbItHGDYk9ZHXNcMEqgIK
 r2wEGguIvsrcLpI0FaOEDxrhG6AqZ4uyDPQbrtZ0jFllqRwB8+TDYypEJUoSXr42QL/Y
 HrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790572926; x=1791177726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xjVMaYr3kqXJVYCxY7VYQbjUgY58Olm454tDy/V29P8=;
 b=b8EOgXqBAuOMMtYLG4+RpBuzg8F7uVRCcfuynXTyCGLup6VCSUEZcuGA3y4D4djrKG
 bVDogkS7vp8dbE1PcxuIIC/RtBCiWEY4Nxd6KoGGRJEID6N5pRcJ9xDZfVze+C+DIOVr
 mFk7OMnYWCCdr+B8eVc9cJCH7RH9QOjETY3LqsvNoHkwb9FHTBBrcmFSuf0ljMk78bZd
 u7kfxgSfQG4vAVTOfDSBLuzdtGTP9GikIt0Dr88OkLz5N/eH8icS+PcoO696QiE4FM2l
 pchNgn1FIm2fz6oh0SPvOn7MaTwOMAQkAsXwICj2MvOa4rQNr5YqvqgAGPXhXvQvpoGY
 z2wA==
X-Forwarded-Encrypted: i=1;
 AKwUvBycWT61byKSQkH7EdYkuXMeG1ELfGw5LssEECrxZhTw4QtbFKwW3e3ysfxSJVJ2EKlJPJJN0OUBGw==@nongnu.org
X-Gm-Message-State: AFuF++nia7MnXRZ4sC6UqwSLO5IoQL28hF3i1WdjP2psXM+Jd8tuQQYt
 NyfSM0LsuEGiBWCrwVcTjp8GHluARe1xK/aqT6INSRu6dwM01ewf/tJl
X-Gm-Gg: AYBFou0EnqPcvhwwjlO79D6vC/UDoJ9GoqqLfwAEFj+XAT3BhhU6jch2ExwWnEIdJHe
 jVjjI3xiM5/QtDraD9X3sNROlI5iQEfI7NE3XjJvaCWyAMhE7NF3EBy2jlqsxRXnP+fQi6C09Ay
 1rmSU7qJbW4fuoX+BXX6fLwNKq4QTPJQi5v8ZD+HL2vfFgL+bmgiicOHnUvQKTPLCpGIGgntZTM
 BbQ86/d2AW45awkgDu13JZrP2ztDNyQ3tc7scGyHLpexerr/gdvO0aLCD3DoUKUZPMAZwMi6RQj
 EodyULD4SCByfnHCqn3Yi2CgKqmH7kYH/oD6RTfZHliX3jglErt6Jlu58kt1O4e7W9NekMxiYcE
 ZAKOSuLQp6qjg6WN+0gLm0csHAdyNUA+lBxSP1rYv1H9BhSQ5fEXQDLmcPJN9mS4QTjVCX6FaXG
 pjiRsawSyJbuWRGBVmoUoAhnrkwCzoBblvk53Rc5RrNZGgj1ikt26HIF5nSQ1Zyf0yesBq/1C23
 Uue8Z7fvKNNij1hngztGQHsT1ZM6M+EiwiBh/g9Kg==
X-Received: by 2002:a05:701b:20ce:20b0:143:33de:978f with SMTP id
 a92af1059eb24-146d077c01cmr8389566c88.43.1790572925881; 
 Sun, 27 Sep 2026 22:22:05 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-146bb6551d9sm14726248c88.9.2026.09.27.22.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 22:22:05 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Subject: [PATCH v2 08/24] target/m68k: convert raises to raise_excp
Date: Mon, 28 Sep 2026 13:20:34 +0800
Message-ID: <20260928052051.251-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260928052051.251-1-luoyonggang@gmail.com>
References: <20260928052051.251-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0f.google.com
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

Translate through raise_excp. Drop TCG raise_exception and the
one-line raise_exception_ra wrappers. Keep leftover
raise_exception_format2.

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
index 138c89d3e53..b5ce0ee6ccd 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -252,7 +252,7 @@ static void gen_jmp(DisasContext *s, TCGv dest)
 
 static void gen_raise_exception(int nr)
 {
-    gen_helper_raise_exception(tcg_env, tcg_constant_i32(nr));
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(nr));
 }
 
 static void gen_raise_exception_format2(DisasContext *s, int nr,
-- 
2.52.0.windows.1



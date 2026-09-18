Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F52C982D9
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 00:44:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7Mie-0000bG-UT; Thu, 17 Sep 2026 20:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7MiI-0008C1-SZ
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:44:30 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7MiF-0001nl-8W
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:44:26 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 d9443c01a7336-2d91a931f66so1095175ad.0
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 17:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789692262; x=1790297062; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WNXBxaNnSlslm4zpK6Xw+nWzcyt79miFA0kJKI+2fds=;
 b=FN6+Qzltszza3oIza1CRsbWpiGfwXWrOk80aJicol658C8OxZySQXZ1DgYavhXqsah
 4L8IiLow2SwlsPJuqWLdfMmE2mtdxHqoO4mz5Op4k5sBB/LhFHh+Sjmpa5h++w+2LlRV
 HO9pE552BM58Py58D5tF+Vwnr8G0hcAy/GHnnXq8VLkju/0WmgZknHRaYOYygumr/mbZ
 h/7C7wnZXwvbVO/3mNxDHvWSifB3ZNCpA9E55xO2hETTyppLCpnQGmV9K+PL+0avzYRY
 Qm2p4wTCgeNvD7Tyn60itBtWRXZ76vYiZAtiuUMC7r+OSa3D7StXc98HsbJF3ObeAWQn
 jNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789692262; x=1790297062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WNXBxaNnSlslm4zpK6Xw+nWzcyt79miFA0kJKI+2fds=;
 b=oFCShoDAZZTGGk6u7buD65yqNRI7dGzRE4ppiiAAA4Z0zOYczAtffn3B8U9L4xy/tt
 YlBzITQNCbOSLuwyELqS7gvuVrw49zTj78sodUoiarUhVumltylqFEYIfo7nVYSWzOAj
 RbvLcIg3eizuXsArryjFowPj2Oq4i1yNt3vB3cR7pXi4lnHF+LknBFXsaG+is+YELZT7
 GFN/j1y5kqrDqttr3CPsduywsgkI6m5wNwoIW7C2fwfQ31sn3pNho8k2mDhHyiU2hefG
 an3UEdcIiCF74GSkXEPwDkMAAB5w05pwFsTRx7tjtDR5Cb5q/6n51FJZQx8h18OsSSzu
 p6KA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx9jo1XvTe9HXrKnfG052GzmVLHXvMD1n+fVcerqTeRXsR7QiQXczDF/noLR+4nUMEoFSxAVIFojQ==@nongnu.org
X-Gm-Message-State: AFuF++kuBU9Hdp5pYhv0Rfp/dTvFMBOgrINFUT4FAPJJ9qEv/YCVHG4k
 VBL3Vem5nBnYMuijDvE+zKE54ShY01p1rGTni4pYAm2w5MkT8yL25ZB2
X-Gm-Gg: AYBFou0Rn+plfk8cKnKhZxccKSFEiQtYf5fkp5bFdNpy/qK5w7/RrxJdkMTnEjVoqWj
 wgsw3umHZRitBvXTotGS9L2bzfkG4k776XAC8kgwLAGC4G1JVj6nme9IOuLV0mye23Q3nazL/mB
 dTaFtSX8q3A6nOEhI0kuGZ/hMTjc3LRWSiG9HI5bXw9e1q51QlS3s4YXOe7zx+RkLDKFzFnG6HY
 XCWqZOqMUA1548wn3f1by5TYQCPXMYwg5m60QtGGXEAox6YDuxkWwRdZCFwUK1i6o0pb4pbqXbT
 yQY4JVKKmh1RaKjxpvc7pdJwuQpmSN3zRHEt6j+veVs0ZXipFRYoyI27s76IBP/9t8DEzS6gdIC
 eNgDWZjh37463OlkCOl5CzArRt1iHR8pHlx1ZVjjTpCIcbwkOoXFRM8y9/uuf77O8wLyEBHBkqn
 F5nc8BijNujLnOvoR5Nv2rTIML1VrOWDvFNto5ZbjHZbbRkWd44cJXF5M/iDZsikYFJSkGjAXCp
 TsslBn6FLR5vvhTnUixTC83QRmry6DE
X-Received: by 2002:a17:90b:2d50:b0:39e:288:80c9 with SMTP id
 98e67ed59e1d1-39e54f9d274mr1689299a91.19.1789692261922; 
 Thu, 17 Sep 2026 17:44:21 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144cdfc3df2sm600286c88.5.2026.09.17.17.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:44:21 -0700 (PDT)
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
Subject: [PATCH 12/21] target/hppa: convert excp to raise_excp
Date: Fri, 18 Sep 2026 08:42:14 +0800
Message-ID: <20260918004225.827-13-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260918004225.827-1-luoyonggang@gmail.com>
References: <20260918004225.827-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj2-x11.google.com
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

Drop TCG excp and call gen_helper_raise_excp with restore 0. Keep
C hppa_dynamic_excp and use cpu_loop_exit_excp. Route leftover C
callers through hppa_dynamic_excp instead of helper_excp.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/hppa/helper.h     |  2 --
 target/hppa/op_helper.c  | 15 ++-------------
 target/hppa/sys_helper.c |  4 ++--
 target/hppa/translate.c  |  3 ++-
 4 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/target/hppa/helper.h b/target/hppa/helper.h
index 8369855d78e..5ed39e01e31 100644
--- a/target/hppa/helper.h
+++ b/target/hppa/helper.h
@@ -1,5 +1,3 @@
-DEF_HELPER_2(excp, noreturn, env, int)
-
 DEF_HELPER_FLAGS_3(stby_b, TCG_CALL_NO_WG, void, env, tl, tl)
 DEF_HELPER_FLAGS_3(stby_b_parallel, TCG_CALL_NO_WG, void, env, tl, tl)
 DEF_HELPER_FLAGS_3(stby_e, TCG_CALL_NO_WG, void, env, tl, tl)
diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index 76a8d8a0d34..c4651f0d85a 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -30,20 +30,9 @@
 #include "user/page-protection.h"
 #endif
 
-G_NORETURN void HELPER(excp)(CPUHPPAState *env, int excp)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = excp;
-    cpu_loop_exit(cs);
-}
-
 G_NORETURN void hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t ra)
 {
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = excp;
-    cpu_loop_exit_restore(cs, ra);
+    cpu_loop_exit_excp(env_cpu(env), excp, ra);
 }
 
 static void atomic_store_mask32(CPUHPPAState *env, target_ulong addr,
@@ -341,7 +330,7 @@ target_ulong HELPER(probe)(CPUHPPAState *env, target_ulong addr,
         if (excp == EXCP_DTLB_MISS) {
             excp = EXCP_NA_DTLB_MISS;
         }
-        helper_excp(env, excp);
+        hppa_dynamic_excp(env, excp, 0);
     }
     return (want & prot) != 0;
 #endif
diff --git a/target/hppa/sys_helper.c b/target/hppa/sys_helper.c
index 88109f0181a..dd3be1bfc90 100644
--- a/target/hppa/sys_helper.c
+++ b/target/hppa/sys_helper.c
@@ -51,13 +51,13 @@ void HELPER(write_interval_timer)(CPUHPPAState *env, target_ulong val)
 void HELPER(halt)(CPUHPPAState *env)
 {
     qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
-    helper_excp(env, EXCP_HLT);
+    hppa_dynamic_excp(env, EXCP_HLT, 0);
 }
 
 void HELPER(reset)(CPUHPPAState *env)
 {
     qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
-    helper_excp(env, EXCP_HLT);
+    hppa_dynamic_excp(env, EXCP_HLT, 0);
 }
 
 target_ulong HELPER(swap_system_mask)(CPUHPPAState *env, target_ulong nsm)
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 002189ddfbd..6221c98fbf7 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -726,7 +726,8 @@ static void install_link(DisasContext *ctx, unsigned link, bool with_sr0)
 
 static void gen_excp_1(int exception)
 {
-    gen_helper_excp(tcg_env, tcg_constant_i32(exception));
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(exception),
+                          tcg_constant_i32(0));
 }
 
 static void gen_excp(DisasContext *ctx, int exception)
-- 
2.52.0.windows.1



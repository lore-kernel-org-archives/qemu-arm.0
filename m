Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EA3C982D2
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 00:45:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7Mib-0000O6-TX; Thu, 17 Sep 2026 20:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7Mhz-0007ul-4H
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:44:09 -0400
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7Mhx-0001ke-EI
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:44:06 -0400
Received: by mail-pz2-x0e.google.com with SMTP id
 41be03b00d2f7-cc1cea50db3so55360a12.1
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 17:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789692244; x=1790297044; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lulph+1uLiSsZprj2WnOvAAVxiVP07eJais76hf0yd8=;
 b=dNm/fQlj0DvQHlDCIxoqLggwufXm/0metJBY+I8/lA0Nvdt+a5eFnmloumiehIq49A
 76ff0TkFWbfqgyzTKECacVdXduna3w1V5wpdD924kVFaNTnf+ETGS/GjwV8KQD8qKgFE
 jouB88FeW/KiGKqNgg0U0W9zAbHyJpOY0oyw76N24HWQ1f9sxDzE9ZbzOZveC14lC5/d
 HaCKxjQfZ0M63sl7jWaoQ207br5G8uiC3bHXIBqbnBE0PtEG6sCH4xmT0XyXhLpK9HcT
 yjKuLAr6P/88z+7ndHNlCbOrlTV9MYwoGBwdL+F/577LMGOMt0Q8ysGdX8bQJDeK7nLq
 j6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789692244; x=1790297044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=lulph+1uLiSsZprj2WnOvAAVxiVP07eJais76hf0yd8=;
 b=p2JQ/YTi8K+cK+TaFD/jg2ihRT4sX5B2SM2m68NjvUsKIwd8RZ1veXfcgf7nSdV6cf
 fV+snxKePWtrWYgl7FKWKmONahlwEOr8qin/Tbc38Uw/h8Nlmkn6mIhcbvayEhtjC5S1
 ml6J+awJVU3AnybTUwGqZ4YnWXUJ2fbsMF2jw+/wOB1igtBRz9WvruHLne7VAOGLHCm6
 2C72Q2JAsTzvZ2GAzjRxo/HgurBHi8V+odFtI3puPKI7zdlbdR4tD53scEdDoJ2wgrNX
 aecogmwIsxWcvMwzKmu4EzNrkDjhV1kaW1h73V41DWYJGLgJemHzDBZyeEZ4qyhQdhpY
 hDjg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxAex3HxHJcgGC5vyec140ZUTceBnAaTXGeNmuZ73q6szFG0Sr545Rn25r8+YlY8/LC8c6qwPtB1A==@nongnu.org
X-Gm-Message-State: AFuF++logjKMU3+WRIi9E/pisOWiMrD4kcEAeeDvobguig6G7u92S/V7
 6KahapvmGTntX8WEBkv7HYOk7TlRwmtrzQn49OkEmHiNKMuwBZujRqoo
X-Gm-Gg: AYBFou1R7bIAFgFh4ag+OpRKJuPaMDN+xBhM8wQkXr3NrV9YfaRGc6JxJz1GyIlqOsC
 chqPeFtEcT7UUzX7hIwd7oWix4ZF7ZIbdx+vIpBf79EdYg2kd4+iY4B8L6+uKGL0wsplu1i1UIM
 7366Uuwfw//amFotSqGUzJSXIIFDwNeCqrVVv3PgnA9H55OSsVVzhK8gmuqjcMPUI6PPI+hbwTj
 lp3UAIcLtb/UrCFlb/zikjDvMbfpk/JTvV4KI6+FWwkabD/upD/8VLRSrrNZSrKVowp3BVSxdFk
 8Ir7tn0TtUuCNnZmKziSFGK2AlZ591aaLOtiM5tMqzxJMN6Ket53OUzY4nGX8JdXyVWUEOjUSKI
 EnYKKky3hpWppsO2yukH2o5y2rB2KbpIXA1ZSdAkLO2GetEnb03Bs2yq8ENaLiPYcP9oq8CxYzV
 lV3uKSax5phMc5b+aJ6JnI6ndXDb8PnQetaCUF+RzQQYqBmUj5MXjSMekv615c1IyRCKMZwew1Y
 hFVYjs+upJe0cp1lQE1MOf1851yBIpj
X-Received: by 2002:a05:6a20:3d8d:b0:3d3:ad3c:49a9 with SMTP id
 adf61e73a8af0-3dd8c516adbmr1396998637.23.1789692244095; 
 Thu, 17 Sep 2026 17:44:04 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144cdfc3df2sm600286c88.5.2026.09.17.17.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:44:03 -0700 (PDT)
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
Subject: [PATCH 10/21] target/loongarch: convert raise_exception to raise_excp
Date: Fri, 18 Sep 2026 08:42:12 +0800
Message-ID: <20260918004225.827-11-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260918004225.827-1-luoyonggang@gmail.com>
References: <20260918004225.827-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-pz2-x0e.google.com
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

Translate through gen_helper_raise_excp with restore 1 after
storing PC. Drop TCG raise_exception. Keep C do_raise_exception
and use cpu_loop_exit_excp.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/loongarch/tcg/helper.h    | 2 --
 target/loongarch/tcg/op_helper.c | 6 ------
 target/loongarch/tcg/tcg_cpu.c   | 4 +---
 target/loongarch/tcg/translate.c | 3 ++-
 4 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/target/loongarch/tcg/helper.h b/target/loongarch/tcg/helper.h
index e76c73c7755..e3a7bc9e9da 100644
--- a/target/loongarch/tcg/helper.h
+++ b/target/loongarch/tcg/helper.h
@@ -3,8 +3,6 @@
  * Copyright (c) 2021 Loongson Technology Corporation Limited
  */
 
-DEF_HELPER_2(raise_exception, noreturn, env, i32)
-
 DEF_HELPER_FLAGS_3(asrtle_d, TCG_CALL_NO_WG, void, env, tl, tl)
 DEF_HELPER_FLAGS_3(asrtgt_d, TCG_CALL_NO_WG, void, env, tl, tl)
 
diff --git a/target/loongarch/tcg/op_helper.c b/target/loongarch/tcg/op_helper.c
index f41f0cb1e6e..36719617b85 100644
--- a/target/loongarch/tcg/op_helper.c
+++ b/target/loongarch/tcg/op_helper.c
@@ -16,12 +16,6 @@
 #include <zlib.h> /* for crc32 */
 #include "cpu-csr.h"
 
-/* Exceptions helpers */
-void helper_raise_exception(CPULoongArchState *env, uint32_t exception)
-{
-    do_raise_exception(env, exception, GETPC());
-}
-
 /* loongarch assert op */
 void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
diff --git a/target/loongarch/tcg/tcg_cpu.c b/target/loongarch/tcg/tcg_cpu.c
index 4b1d44a1644..56ef0d912cc 100644
--- a/target/loongarch/tcg/tcg_cpu.c
+++ b/target/loongarch/tcg/tcg_cpu.c
@@ -69,9 +69,7 @@ void G_NORETURN do_raise_exception(CPULoongArchState *env,
                   __func__,
                   exception,
                   loongarch_exception_name(exception));
-    cs->exception_index = exception;
-
-    cpu_loop_exit_restore(cs, pc);
+    cpu_loop_exit_excp(cs, exception, pc);
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/loongarch/tcg/translate.c b/target/loongarch/tcg/translate.c
index 124dce62695..ddadfb84285 100644
--- a/target/loongarch/tcg/translate.c
+++ b/target/loongarch/tcg/translate.c
@@ -95,7 +95,8 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
 void generate_exception(DisasContext *ctx, int excp)
 {
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-    gen_helper_raise_exception(tcg_env, tcg_constant_i32(excp));
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(excp),
+                          tcg_constant_i32(1));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.52.0.windows.1



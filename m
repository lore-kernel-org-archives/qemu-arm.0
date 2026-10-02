Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812E2CA5FE0
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 18:00:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xChYk-0006VZ-8r; Fri, 02 Oct 2026 14:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChSH-0006BF-5j
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:54:01 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChSF-0007qG-GV
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:53:56 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-34b3e517e6dso2359611eec.1
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 10:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790963634; x=1791568434; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=be9pR789RqOevAubKubuImhGiaujKFqfN5I1ORufONw=;
 b=b+8iTlAwP7weAATpLPOjkzTGqqkEGlIxc9bRbBZa/0x8WuTFOFPSHwhTpctVF1ZY9e
 yPoTpukEIV8Ktpnwr25+lN+SwjNhTRB+nl3bkrNC7vM9SwshKADY+l0sOrlo4Sq50upg
 GG+i5+ooqTXTP1m3v7T7+wTcLkXLJvDyeoNgGexBwWQMOwEX0fbt+XoLXzVjcMCbMnK3
 kJXz7j62+dzUVob93wCBRyeUcrKoyZ/j2PbzLjTYEYkpy7XdQraTWbfTx3YmBUCINlqs
 RdAlRipVR8SPS+c9OWLou+PKQJsquBSDmZH+BkT0sXkc/eJXl8UCKb5J+18cyIim1K6C
 nTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790963634; x=1791568434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=be9pR789RqOevAubKubuImhGiaujKFqfN5I1ORufONw=;
 b=E/317lEYL0PcK9iOJ9TwihSwkkUau4HpkgGkl5nf+3toKWLDn91Y2Xpbnm53w32Ny2
 zuxKf3OqzyxfHRO5Z+wtT7hLjcJ8WEjtc7SFrBzDc3/1zMLzmNK8E7GDjdTy8N9eKPtM
 83XPzUIXqTDhO/PJKXwWZwTZt8bH/AO3Lgs7KQnTfi8qVKXSVDEBj86LGnCNelkZcckW
 hhPGFgi7xnRk5tKc7esMm1h415bx/bX3Erasg1g43JIr0EtdtIyBXgdyceELneZCanXE
 GU8uFIXqzicOShzJNiedBVc8nCLHgZ6vbBJHHEKUFlsyf0FY38Dwp34z92mzX7RF8ThR
 2JMw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy3iSk57ZWi3GdUB8t0ETrgsT/YczGlrAIGRYpdGsTSsaoRVaaZmYJ68DBWke3uT2CNzSHkrcvEkw==@nongnu.org
X-Gm-Message-State: AFq9FYI34CHd4fkWSu6CXodb/+cT+8X1pByFYiLgQpWGfFyYoeFdYseP
 2AU3pXmzqk26YAdzmuC8IEaC2nv8S+E6XmqQ7QvvSkH0JAtCN7bDuzYx
X-Gm-Gg: AYBFou1GzlEij0HiCdgod+P/V2HWsN67k6auQ0xmr31tzys5rKGrRvPY59UeaPEcTry
 /NwEOi/MQQ6EUiCJXG7JtZV9xB5WD9VjB/Kl5xfCNAvXl4gjLxhO/7mma3FxfTX+DrbiFtfqQB8
 sgJnb56rrGHccNQyvGg0Cc+HFPrw+0VwwKrHK1x5BhLHB4VCX0ZN8/kmOC8AKqCWk4K4VCb8n1m
 moIODxD9g71TC4rx8EY4kU6cZ7qCQ2inO36M8SLgVa9qIwHWY+0wK5yEsDnX8FRgtlefpyBmwXV
 MUtCGogQMD/UGboTT4n4XYLUGYvLhBo1+m9muXKAw2tG5K4QfhQc71mtsKt1BxfG2dOo16kMv4p
 xEFTq7U8mShagNnggBRYWWDNXwYJlnbwy5zUhWv3Rg3+9czBIce6KUXPzbbvIo9yMru79xRxCwz
 AQVuZSXq5e81to7FKnWuaJ3EKKOKc7Xz5teYAUn9EodOodgc+wp4IPgPylem9p/1JnFK4YXP1ya
 bcOV3K3jJNzyE3GBTxfWbrXLdUCidA=
X-Received: by 2002:a05:7301:1526:b0:34e:f8bb:4e23 with SMTP id
 5a478bee46e88-34f150b0142mr3668009eec.19.1790963634017; 
 Fri, 02 Oct 2026 10:53:54 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34f14f9f2afsm18027361eec.18.2026.10.02.10.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 10:53:53 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, qemu-s390x@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Helge Deller <deller@gmx.de>, Chinmay Rath <rathc@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 24/27] target/mips: call do_raise_exception directly
Date: Sat,  3 Oct 2026 01:50:32 +0800
Message-ID: <20261002175037.1747-25-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261002175037.1747-1-luoyonggang@gmail.com>
References: <20261002175037.1747-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0f.google.com
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

Use do_raise_exception() directly for reserved-instruction traps in the
FPU helpers, passing GETPC() to restore guest state. Keep helper_wait() on
the zero-PC path, where the guest PC was already updated.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/mips/tcg/exception.c  | 7 +------
 target/mips/tcg/fpu_helper.c | 6 +++---
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 630b8b809fa..514880ccba8 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -60,11 +60,6 @@ void helper_raise_exception_debug(CPUMIPSState *env)
     do_raise_exception(env, EXCP_DEBUG, 0);
 }
 
-static void raise_exception(CPUMIPSState *env, uint32_t exception)
-{
-    do_raise_exception(env, exception, 0);
-}
-
 void helper_wait(CPUMIPSState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -75,7 +70,7 @@ void helper_wait(CPUMIPSState *env)
      * Last instruction in the block, PC was updated before
      * - no need to recover PC and icount.
      */
-    raise_exception(env, EXCP_HLT);
+    do_raise_exception(env, EXCP_HLT, 0);
 }
 
 void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb)
diff --git a/target/mips/tcg/fpu_helper.c b/target/mips/tcg/fpu_helper.c
index 36af9808025..ce68cda1e43 100644
--- a/target/mips/tcg/fpu_helper.c
+++ b/target/mips/tcg/fpu_helper.c
@@ -61,7 +61,7 @@ target_ulong helper_cfc1(CPUMIPSState *env, uint32_t reg)
             if (env->CP0_Config5 & (1 << CP0C5_UFE)) {
                 arg1 = (env->CP0_Config5 >> CP0C5_FRE) & 1;
             } else {
-                helper_raise_exception(env, EXCP_RI);
+                do_raise_exception(env, EXCP_RI, GETPC());
             }
         }
         break;
@@ -120,7 +120,7 @@ void helper_ctc1(CPUMIPSState *env, target_ulong arg1, uint32_t fs, uint32_t rt)
             env->CP0_Config5 &= ~(1 << CP0C5_FRE);
             compute_hflags(env);
         } else {
-            helper_raise_exception(env, EXCP_RI);
+            do_raise_exception(env, EXCP_RI, GETPC());
         }
         break;
     case 6:
@@ -132,7 +132,7 @@ void helper_ctc1(CPUMIPSState *env, target_ulong arg1, uint32_t fs, uint32_t rt)
             env->CP0_Config5 |= (1 << CP0C5_FRE);
             compute_hflags(env);
         } else {
-            helper_raise_exception(env, EXCP_RI);
+            do_raise_exception(env, EXCP_RI, GETPC());
         }
         break;
     case 25:
-- 
2.52.0.windows.1



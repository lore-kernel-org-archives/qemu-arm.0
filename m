Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08829FF5136
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 20:03:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wACaX-0004IO-09; Tue, 07 Apr 2026 15:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaU-0004Ds-Sd
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:50 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaS-0007Pe-Rg
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:50 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-35da9c0c007so5170821a91.2
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775591987; x=1776196787; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w1aGwGyO2YY6SzUT/zKzGV0tzioOEkhUypHu0oxYM8M=;
 b=UhJUmrB5uVkABB0Nj3QIWLqmund6jHeHKRSHDkaVOwlFhgm7p7w4pISq/WfX4g0Zk4
 COgDW0OOblY9ghnYzIXpix3DNnvj3IbxmUA1bTVnPpgwK/uaTDGeyFMcqCq3/Jnb6Hkg
 SmtJKlTYzVmAYi97Z4PWrgKeHRurRP+6mIw3LnSgQIAlCcX/0XAjGQ5Zq6ZVuIDI0vgw
 odjEV6onlvxa5jseiiSP7iHglax+Bio5QwujGbWRalAZSCZbrbnA+JaWdlBd9825u3po
 jCMOM6fvsTaTYyL3BAihbxjpCesqtWNSh4jWMx/GQEsnwZhyBGFcVT9J007yTLuFkuWR
 wQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775591987; x=1776196787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=w1aGwGyO2YY6SzUT/zKzGV0tzioOEkhUypHu0oxYM8M=;
 b=KxuS6lSy8+wdEmKP7Mx2rq8Ejv1+Xq469QRO7p7jEWtqIjxlMhEdCh8xe55Z0fqxlG
 9Zs77yE5Ig/HyThBMNv9SMdFCZiRmlVUvTGwU0u00x84LpLRCaEeodiezO6kuSKbUTCw
 S5SmaiL1lzTKt3HBcC6bgFXcAo9PoUSZqQOcxmxzIPYhpPUnY1jgD6z4UpkMTm+s6Fh2
 pXgZ1MpTWWR4duRYWigRCvNQ8DbSLFKwABkwkA22W5SXc+TtnTaPwuLqz4dYQsT650uT
 JltaYznTa+472znjrnE14hWDXJCawQz0RbT7BYpyd5b5gmIGgijyhgVAE+5WkE0QhHQG
 orXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfMep/fsiLs5tfCzujkXOfT/BtWotTRp99rHm7uGIdv11x6unMHVzpA6Acq+b7l3eLL+jqGmKtCw==@nongnu.org
X-Gm-Message-State: AOJu0Yy1eUbM61gdrdEzSsY8p2oVMC6v96T4iXy35q4SRNKJos10S/Vs
 ztWx1FPjQhqkUW/MOVNqyJHvmbVJwPAt6ExglHljAD0GUBRsBOoir4FNqyCikco65koQWYiiv9x
 BIUNgMec=
X-Gm-Gg: AeBDieuXlTiMvBjgxXDSEZylkBlRpDKreohMsWVkaEgM/VIDd/heyuYbua9GqCw2nsq
 4z4lcsz2J7YP+BwXCAVnp31XY58Oe8A0bAFQWMTnZKGmHTtKqus3l2YoM7tY3s9I66phDZS+Nod
 MXESpVWHjzw5jmBI4fEtWyLOmtI7HGBkmjAKw1WGeH+uaWXikyffOyTWYbf/aOZ6aC5N57YB08p
 kUf4WO5MQMsdo7ERUKzdxjtCwMvupDh4is12NJZW69Bfn9iJqknFakg7OhhlNIMf9Ii1CaqdzpE
 i5vobxB4Bp+TfoQj2DtsuqOuCP9zM1NIHzfOniS6EZ7l8VSm6JErK7CDJucncda6dEFVHbaj0iX
 uvUEggqlZxbZkE96gSAtZwMIwCJAQ9y0zNcSMHqvqQ4ebmG4xxsvuMmaU5Z4jVAGjY99jhQCNAW
 vvMVFG8UHG0lvXnR7D6b5B1T8zLAOFrzT0NpRqqbr86GlUTXoL/L69Mgo1r3EP4k98gR+X4TMah
 R0C
X-Received: by 2002:a17:90b:2ec7:b0:356:1db4:8fe5 with SMTP id
 98e67ed59e1d1-35de6956919mr17108339a91.29.1775591987335; 
 Tue, 07 Apr 2026 12:59:47 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35e27c9855csm126911a91.3.2026.04.07.12.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 12:59:46 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 18/21] target/arm/tcg/translate.c: replace
 translator_ldl_swap with translator_ldl_end
Date: Tue,  7 Apr 2026 12:59:19 -0700
Message-ID: <20260407195922.196410-19-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102c.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 20f5bdcbe2c..c432de2a268 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6284,14 +6284,13 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 static uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
                               target_ulong addr, bool sctlr_b)
 {
-#ifndef CONFIG_USER_ONLY
-    /* In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
-       within each word.  Undo that now.  */
+    MemOp end = MO_LE;
     if (sctlr_b) {
+        /* In BE32 mode, adjacent Thumb instructions are swapped. */
         addr ^= 2;
+        end = MO_BE;
     }
-#endif
-    return translator_lduw_swap(env, s, addr, bswap_code(sctlr_b));
+    return translator_lduw_end(env, s, addr, end);
 }
 
 static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
@@ -6532,7 +6531,7 @@ static void arm_post_translate_insn(DisasContext *dc)
 static uint32_t arm_ldl_code(CPUARMState *env, DisasContextBase *s,
                              target_ulong addr, bool sctlr_b)
 {
-    return translator_ldl_swap(env, s, addr, bswap_code(sctlr_b));
+    return translator_ldl_end(env, s, addr, sctlr_b ? MO_BE : MO_LE);
 }
 
 static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
-- 
2.47.3



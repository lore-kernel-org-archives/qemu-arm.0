Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2AEF46C6D
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 18:27:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9oeo-0007Y9-Sz; Mon, 06 Apr 2026 14:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oem-0007Ut-Qu
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:40 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oek-0002R6-1n
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:40 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c70c112cb61so2489016a12.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 11:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775499996; x=1776104796; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QAUbPIMZvgGd8a5iLZaOYN2p4X0WpUbxXjz1zyQUBdM=;
 b=TK5UDexO48J7+LkutXRrcNQhii/vHiU9ew9GJufNAgUxmgXfGZs/mVZr3+RyANdYAZ
 gd6ovPg2VpWwpZH8QrojUlLK8Zx2dukABoBoF+LLlbhBNqKwQxeOOrYAhpR8WbUPaPEp
 KsxkZe/P1HnWQ9v/oiVcf+8MJ70mNcdUdQUVVOqfPYnX060GkRMb5RaYZairzSpCX1mg
 6AebjZ/Iqmgv3feR1FSbdNvGRe99OCEWwFr/Ja1+44V0sSIu9FhQBjTz35wHnfGWed6s
 R38PUFwCW8M/UhRN/KAHCQcmepkV3PPoLdFmWxX5CL27d13rQgQx6jcfnr7qocxH40JG
 zuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775499996; x=1776104796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QAUbPIMZvgGd8a5iLZaOYN2p4X0WpUbxXjz1zyQUBdM=;
 b=F+sCn9BQLFs5m4VRP+MfedUpp37cOaCJZtpJ8MIXBe7MEii7hlJc8eLtkZjbnXPRCq
 jOU/eyq43oJftNsPJ80a9jLt+pGGfPlKQ6GrIX7D1S/zxkBUgEtqIi/5KZoHUeVhny5I
 PYKe60jxfOj0uU0aPQpvKl/8VuRHvEzPeMJpxDPTB9O4nELceOcDlYv1Eavsl5bB2S7P
 O6TODc2CiJgO9CSS1wszci0dfifZyWe2Dpb6zRy2rbzYLiE3Fd5AZuN+ve8TChyai1GD
 VTMiVKOK1D4EtaucwBTlhM4SBYGL4aB64AA74qfhYwPKphoAKkvjzVx8JwiH1V+1WRDy
 f6JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKfRa87q7asjC+F81Fymu6qT8VjCVK3KatyDzLk/3o6g7v36+ldIlqNWXJss0/hU8hv4PoQfL57g==@nongnu.org
X-Gm-Message-State: AOJu0YzQg7mDPhpPuuBfaLX53I9tjyEDALQxgnqta6Z8CyE+q0pjs+u0
 84ZJ7tLqSuHYfa6woSnlYMcgZ6hL8zB9/BZeGQvRCiVM52D1D0MdNJrv390KGmalCzE=
X-Gm-Gg: AeBDievSYp8/Eye9cKL2oruLBjVQsOUEe1TI/xwAHg9ytpF+75WpqVxXL+YdOmmU0Cx
 Bi5MKThZqYdG63tUryujVBPuzE/QVZJuqflm/Nh6DZ166ogdVCaagP3IeStnnMdxxDirWr/I2yb
 M1y4br0Kv4sn9Fu8bX7hCXeVNCZL4f23jrREULfIFiD4poyiY0FBr884S6NcULTFPA+eMlhg3PG
 otaJ5ZC/D+grJTMEwTNAlrRkAOzyWYk/ZmBMQ6WzkZeBLN3c+aRds8qCqL57MrrjWbR/W0nbqrx
 AunutGVj/kPkMwffXnBceKBRIeIOVkFJwLKJ3Y1+pR0WNc9udIj9KRr+S8y3D4FENutCXoOSnxk
 m2myffAOcydx6zgIjt0HBjTT4OR7Sskqv5l/E9jfASHoH9dYuR9gYuZ7BM5B2Habw3DLlr81BTF
 Pn/iNQ393CnwhXAKu4COL15AMrTZwbX5hdM4CEToLL9gH6hES52cps09JozI4F2X8gZslaVNvhv
 N2q
X-Received: by 2002:a05:6a20:6a28:b0:398:8db5:4131 with SMTP id
 adf61e73a8af0-39f2ed95189mr13110011637.9.1775499996376; 
 Mon, 06 Apr 2026 11:26:36 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c6561fe9sm12765080a12.15.2026.04.06.11.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 11:26:35 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
Subject: [PATCH v8 17/20] target/arm/tcg/translate.c: replace
 translator_ldl_swap with translator_ldl_end
Date: Mon,  6 Apr 2026 11:26:06 -0700
Message-ID: <20260406182609.193886-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x533.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 7fcf0656630..68f050746d4 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6279,6 +6279,13 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     }
 }
 
+static MemOp arm_memop_endian_swap(bool sctlr_b)
+{
+    MemOp t = target_big_endian() ? MO_BE : MO_LE;
+    bool do_swap = bswap_code(sctlr_b);
+    return t ^ (do_swap * MO_BSWAP);
+}
+
 /* Ditto, for a halfword (Thumb) instruction */
 static inline uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
                                      target_ulong addr, bool sctlr_b)
@@ -6290,7 +6297,7 @@ static inline uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
         addr ^= 2;
     }
 #endif
-    return translator_lduw_swap(env, s, addr, bswap_code(sctlr_b));
+    return translator_lduw_end(env, s, addr, arm_memop_endian_swap(sctlr_b));
 }
 
 static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
@@ -6531,7 +6538,7 @@ static void arm_post_translate_insn(DisasContext *dc)
 static inline uint32_t arm_ldl_code(CPUARMState *env, DisasContextBase *s,
                                     target_ulong addr, bool sctlr_b)
 {
-    return translator_ldl_swap(env, s, addr, bswap_code(sctlr_b));
+    return translator_ldl_end(env, s, addr, arm_memop_endian_swap(sctlr_b));
 }
 
 static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
-- 
2.47.3



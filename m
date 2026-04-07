Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E53FB5180
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 02:30:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9wB2-0007kK-7Q; Mon, 06 Apr 2026 22:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAr-0007eW-AH
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:17 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAp-00071r-1W
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:16 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-35d9c7bf9a1so4065891a91.3
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 19:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775528892; x=1776133692; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkkWjXX1NFf1Ce9oy2vn5af40ysgrY5koOcHNtjg0zY=;
 b=qvHSgIfWdOePf3B0XRDuqc8f0ynBhtrF4ij4lIQ4+R7qtG9yymcaJmRStWmG16nHAo
 QAsPeAdwffZY+zBlxz2yvTEUyoD8mC97PU7p9FSYGyb9fJz+NQ0D36TjkEd4HjlrGo3L
 AHFFqY/QOzyRwNAR/RM+3s1WqbC5lBw0CU8PTidUk9D0R+qVl1wvgSCvMT1P8VrQwj//
 EcdHDNC4XV8QH0d2LIk2rGRizpQjaeR5Y7hDUfhpkqYunmx1AEXaAbd/vmp3vx4zyOIi
 CIIcWN2YCYhpzrFIZ2Jr+cDvHOhrcVSLWN3Zq9/98aPfQYXyhu5xPpiX5Zc/SOJ7puKs
 zfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775528892; x=1776133692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bkkWjXX1NFf1Ce9oy2vn5af40ysgrY5koOcHNtjg0zY=;
 b=ndJtLUomlhmSCPKf7QaTYmaNrxvG4A4MAHOZqaWDC95OsJpsxkT2AxA4jsM7pjrX/P
 3ZoTYSsjYCPUmlGB1VXDNw+uFIV1JZ6ztKVTomEDfP1LsBr8RSiPdAScJJ6kGDv224Am
 kI6EhUw5T6jct38kjvRqmO0U93xFtiQARI9Z1B+Vr9pjpyvyngc2Wy8wFdrBgR8lf1oJ
 sPm5A168+jKb9FDe7RPDCJquOetqV+vyZUJjlcpt9bbWbMwYAqjK4jTtrL7unLOHkrJJ
 7ynZ5oDE3lNcrkXdl6KHkW8YCQ9pQKc/w8cnTAt2DP4Y4rZRw8hZQJgpkG2SnGc+W0xs
 8AGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqkFguiwPAj4lKtG0IRRjog6tuDYGjsSPjfY49GXdYcyWVoG6+kUpNoX8goopSZNkYzYem/fn+/g==@nongnu.org
X-Gm-Message-State: AOJu0Yw9uo1uj1+0piSa07GAO3w58DZwUsJo78qHJKnVqVlnoXQhGAHA
 CMzaqZUl3ZLes938eTKQETBWHH7/xe43EtMy1vricviWSl4+Yq4OiCEQRWoYilQbIkA=
X-Gm-Gg: AeBDieshz59n/Ob5GLmF2ILsAa22+6FAtHSdNYemK6S7LExppWYRvQfVds1eFIyUXN9
 24b6mL8bpSDZkwnofkWGEAL16DqQz9ZbDF5pFLXAVfIw/qVXai4VZPSvJQfZ781WQFKn9ke9oXP
 OIWxZZlYHy9qGloHjvrzZvmE7oZklVk0+NdaM5eFx5ZKVU7qFRXhiSMraBLVRbb+Cdu6yrTwwR2
 blZ0J4Oool6ZAZQY3DWE4eFXEEiykhrrEKm4HisXbf+F1hzwwhtKLpszPV9tdmFG1YuwoMnMnxS
 0//osX+FGOt5pK7gC38+HKFbtYWufQBMNctW5kdoX77e8b496eRFjxd0LnMwWDm75pfLYK7xT5C
 U8YR2xqtTD/DLrO3syM1d4/rrN5aEap6LgHJsrziNCbY8Bx5bGm9OZPW13tLcN+0JaahKsRXNNs
 /fFzuEXIbcyCF9fv30/DY532dYA5kOAi/9UULB3PUdQcbkaoa4GUiJrAkqROqcI/quSiT3K+F3g
 IUP
X-Received: by 2002:a17:903:3903:b0:2b0:643b:41c9 with SMTP id
 d9443c01a7336-2b28167325fmr168230265ad.9.1775528891927; 
 Mon, 06 Apr 2026 19:28:11 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749794e8sm161423685ad.53.2026.04.06.19.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 19:28:11 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
Subject: [PATCH v9 19/20] target/arm/tcg/translate.c: remove target_ulong
Date: Mon,  6 Apr 2026 19:27:47 -0700
Message-ID: <20260407022748.57629-20-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1035.google.com
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

We can replace it with uint32_t, because we know it's limited to 32-bit
target.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 5b6a80930af..ee3407fbd7f 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6281,7 +6281,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 
 /* Ditto, for a halfword (Thumb) instruction */
 static uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
-                              target_ulong addr, bool sctlr_b)
+                              uint32_t addr, bool sctlr_b)
 {
     MemOp end = MO_LE;
     if (sctlr_b) {
@@ -6528,7 +6528,7 @@ static void arm_post_translate_insn(DisasContext *dc)
 
 /* Load an instruction and return it in the standard little-endian order */
 static uint32_t arm_ldl_code(CPUARMState *env, DisasContextBase *s,
-                             target_ulong addr, bool sctlr_b)
+                             uint32_t addr, bool sctlr_b)
 {
     return translator_ldl_end(env, s, addr, sctlr_b ? MO_BE : MO_LE);
 }
-- 
2.47.3



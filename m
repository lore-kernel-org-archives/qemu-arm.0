Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (unknown [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A3710F996B
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 18:37:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAXlB-0000ME-2P; Wed, 08 Apr 2026 14:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAXl8-0000Fy-Gt
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:36:14 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEoe-0000sq-OI
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:38 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2a7a9b8ed69so50693285ad.2
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600555; x=1776205355; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GvkuUT6EU9HfeBGg9ezoDCR/MS6DW8Aqbv4Ef+j2FkU=;
 b=fAVz7gDoSFwq6JRS/+NQSa8ZTE7k+d7VTh3l2YZPFE0pssaQMW+irYnV37QK8fMi51
 xAI39cPre1qNDRFF97RI3vVn8fEQI16rCPkrYZ0yDU0dbUQR/RzXtS+XzpcPHMz1IRYP
 wbeSfOmuTyf2t+/1TKKWQqZmBf1+v5IO8UG9gVrB5KYlB/pPRqJ4aUzM2kE886wEHy+O
 uwhlocc9C+EgHLQRNGnYdC7vPa4BLor02yUA+ecDAwRnUcOEBmL9noHxNPEKRWkiIAbh
 mFGEdT3qM09gROLk18LYzje/rWI2NWhdKyYE/Dabx6G44IQpqoAMBv7xlsPkhFsFZ/sQ
 Gs5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600555; x=1776205355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GvkuUT6EU9HfeBGg9ezoDCR/MS6DW8Aqbv4Ef+j2FkU=;
 b=T3jX/YwJi9PzSMA/9TgDpCz1CI3MrUknxwXd+TmWS51G7C4bJmSvhJ+zmQ1ZmVmSeH
 CPuoJ2nd/p6GszVeH6kbMtufjhr7lCjCD7NznI6nPMsXfMN6a2OANzNDeI5eCk5aJL3K
 NS9XbUhR2C7+LlxiG4jFV5uAmrm88n87yrkR5Z1RoXQWeEv8rCxvlXLzo/VrGzWaTG8m
 f71+tIW9lF/ZKpNKhkfCMfeWciNdaVxkiylwsO9hoS2sqvbmxjo6wFvVh258pBls2wna
 i0TrnINEu0k6s9/t5fZ1duizaY6e7mMAzacGbEN8c0as0m2U0x/Mqy7nk3YGvLckaDXE
 TOjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZxs+tFgMCaLy3dgScLAU6GJfSExNDwXPNbd7JTrOmnCmLpELd2kxcWVEmhQ2RHSjAes7C6O411Q==@nongnu.org
X-Gm-Message-State: AOJu0Yxtat9497XAf8uLKK6mIGQG5Y6p8dOl2iay27RtBYOVX4Tsrf7X
 YuB1ZyC/33jYOduHSRe/Rh9O+VOZu82Vt8eZi1srQrisUx7j+UcQFWXewZhXDVxgQYc=
X-Gm-Gg: AeBDievjR1JxPZTXrZpBvyyJhhmPYAqIwcWMc+p6VJ//gxCdvaAd7vcQL+YIEYSVZe3
 yK5ekoy8ZHxuiA2ed4bOQ7wZimgEBiGqQjKVSTSycrEH1YUvfXd6mlArkkBRnYQnbnS/cLcWWSp
 cLuLSzE6QftKNO/BtnfsojlxAFAsJnqcU9UZeABgFu7cSLXJtDw0Z12sliTEIVdLJVaGlzG3SYa
 DeErQFT60eIwx2IIcbRel6+YgnraHVRa4TiVUNRbEozFriEuMUGAoZJcpml3OJ5OmI8pv6b4KIT
 AL5Th8FgiQcMPK6MmMeSnJTDM5wZ7nlmy9eVsWkICS3ut86qiwTKKAIF0T2fV+XIXsOqZAUWNNr
 HBlewsWLABKVCAZEx3mTCu0Kr04ObT9AJgHA39nyU38uboP+kHDKf7pzwishAUD34E6yLBTL7an
 C5qIhcBQCUHWgWcy4JHaZFm1QPd038MtJGWygtMOlB0/TQZ4BmdQ5yyzl9q6KM6fv5X3tNw1Ck7
 AVB
X-Received: by 2002:a17:903:388c:b0:2ae:4150:3118 with SMTP id
 d9443c01a7336-2b2816c7b2dmr199418345ad.12.1775600555391; 
 Tue, 07 Apr 2026 15:22:35 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:34 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 18/21] target/arm/tcg/translate.c: replace
 translator_ldl_swap with translator_ldl_end
Date: Tue,  7 Apr 2026 15:22:05 -0700
Message-ID: <20260407222208.271838-19-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62b.google.com
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
 target/arm/tcg/translate.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index b6abaff4903..c432de2a268 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6284,16 +6284,13 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 static uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
                               target_ulong addr, bool sctlr_b)
 {
-#ifndef CONFIG_USER_ONLY
-    /*
-     * In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
-     * within each word. Undo that now.
-     */
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
@@ -6534,7 +6531,7 @@ static void arm_post_translate_insn(DisasContext *dc)
 static uint32_t arm_ldl_code(CPUARMState *env, DisasContextBase *s,
                              target_ulong addr, bool sctlr_b)
 {
-    return translator_ldl_swap(env, s, addr, bswap_code(sctlr_b));
+    return translator_ldl_end(env, s, addr, sctlr_b ? MO_BE : MO_LE);
 }
 
 static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
-- 
2.47.3



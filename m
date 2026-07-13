Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54081C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 23:04:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjPfu-0006BZ-Jp; Mon, 13 Jul 2026 19:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjPfr-00068Z-O8
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 19:02:55 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjPfq-0005oK-6N
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 19:02:55 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2cce6a0c9c3so32857615ad.1
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 16:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783983773; x=1784588573; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3rqfigLspY1b2yaZ2w3pjxnJUalskgeOLYUrf4vXRKg=;
 b=yYD+zEqN2hmYtbgP0DdccO46C2Cj3agCGMQeePqL40aZ1PEsdCVxq97MkzW68kGXBY
 aUmSE0GrTSDgY4WaW5w1Uf+cE7y5gOuZAvLFoEXEKq5ePpTUYM6/KWTe+MTn8yCSq9nv
 x43IA83HdOCuQP0CFVtOJxtPm1TWKZvQGPyPZmPAKhvz01Sq9+j6mJSw3HUhCqhPNBsh
 VVY1vlaLa6rEHOKc0FQyK9qGs+ZQ6zXl0el5DseNbLegzIK0GY9Z1Qg78Lp7JEi7CNYh
 m1mgc64fg++SdxQyhBUE0VoNriWyXKaTI+wIjqbnm8LDpQoXPY7crZubLjdleW7FE1ea
 RTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783983773; x=1784588573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3rqfigLspY1b2yaZ2w3pjxnJUalskgeOLYUrf4vXRKg=;
 b=Vt7OV1M7atMOTD1AVpUuWI08XEWeLfwDQxnFFzHFfMmxrGWGkUyWs3mCPmAZNzZdCP
 miTe6/pMonH+fNXA2f4FqE60jRmQ5vb44NmGd8kFoWcNvteesj+peidf5oH8g8LGVEV4
 BghVJVczFOkW5DNJN1l+FxzgW4yWUYSBwcoCFBKnZM4bMQNcEWiKdi//vVzEdU9NAphg
 7Y4nhH4W27JAN+O7S2a0puQTEAa9sS3Qc9dcUnNt6i2wAE6NQcOo5wCHULlEuromLyWa
 Ebk4aIRwPtChQx6KkwaeDA44Vs8gcYIZ6KddtErguVDV/QCILN91hTA2jXn/9GEq0A+K
 28WQ==
X-Gm-Message-State: AOJu0YyDwLTjMKOtjRxQhYm5HIlV+BnyZUobAXcensPf0DPoMTnaPNTw
 2wnYCGLjQELD+VW07jXa0JgDUoc7Ivu3NKx4NdhMRo54U1AnxqBaLw5eQj+azbkoeZY=
X-Gm-Gg: AfdE7cnf5GibCJuJqDq8eTWMNeULqXk97EmK0Yk+AnfVD2WsfydgPIZWsQ/ztRbqqhp
 rgL7BEZv6aOTBHginjsmAhbSFjoCrFMdJck+40bVwO5dRm/fchvArKRl8yiyKyJo4j+vZ5QJtc3
 iNylqEOBDJ1IXT0cNl4rQvka2wcyWoaZRjGGOJqorxncPWsi2H7tVlKmMjfbuCl9njxXqx5jQ4D
 9877MZAjVs7lkkVGKBX7rMY4dQTFxXKLrT7hEgw3a0jChjmOUfRG4xfEm/IYV96cC7p4wXLfjxA
 CPQG4RA5jELTqhNCEzJ4/fdfTcxVKF8MlEL1woDE7KsNhBETmiItPEUzH0VqBbg0EC4Jp/LFLMn
 9iPBwIBxizOUfL7D6zKj/614BfS263P9rY9lEHeucGY9xm4dATzR6sBy46N5/WAyVQ0QO22sTNQ
 xLBBwYA7BBi9uddDTKyQ==
X-Received: by 2002:a17:902:d2cb:b0:2c9:a247:171 with SMTP id
 d9443c01a7336-2ce9e7adb4fmr106609905ad.1.1783983772668; 
 Mon, 13 Jul 2026 16:02:52 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bf8e9csm106902965ad.24.2026.07.13.16.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 16:02:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/10] target/arm: Implement {S,SU,US,U}TMOPA (4-way)
Date: Mon, 13 Jul 2026 16:02:43 -0700
Message-ID: <20260713230244.70174-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713230244.70174-1-richard.henderson@linaro.org>
References: <20260713230244.70174-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme-defs.h |  5 +++++
 target/arm/tcg/sme_helper.c      | 14 ++++++++++++++
 target/arm/tcg/translate-sme.c   |  9 +++++++++
 target/arm/tcg/sme.decode        |  5 +++++
 4 files changed, 33 insertions(+)

diff --git a/target/arm/tcg/helper-sme-defs.h b/target/arm/tcg/helper-sme-defs.h
index 1de72b7472..b8cb643367 100644
--- a/target/arm/tcg/helper-sme-defs.h
+++ b/target/arm/tcg/helper-sme-defs.h
@@ -414,3 +414,8 @@ DEF_HELPER_FLAGS_6(sme_ftmopa_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, env
 
 DEF_HELPER_FLAGS_5(sme_stmopa_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_utmopa_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sme_stmopa_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sme_sutmopa_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sme_utmopa_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sme_ustmopa_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 951cbbf58e..9de95428d2 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -3168,3 +3168,17 @@ IMOP4_4WAY(usmop4a_dh, +, int64_t, uint16_t, int16_t)
 IMOP4_4WAY(usmop4s_dh, -, int64_t, uint16_t, int16_t)
 
 #undef IMOP4_4WAY
+
+#define ITMOP_4WAY(TNAME, MNAME)                                        \
+void HELPER(sme_##TNAME)(void *vza, void *vzn, void *vzm,               \
+                         void *vzk, uint32_t desc)                      \
+{                                                                       \
+    sme_tmop_4way_sb(vza, vzn, vzm, vzk, NULL, desc, inner_##MNAME);    \
+}
+
+ITMOP_4WAY(stmopa_sb, smop4a_sb)
+ITMOP_4WAY(utmopa_sb, umop4a_sb)
+ITMOP_4WAY(sutmopa_sb, sumop4a_sb)
+ITMOP_4WAY(ustmopa_sb, usmop4a_sb)
+
+#undef ITMOP_4WAY
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 9c641de5c0..fb296ae02f 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -2202,3 +2202,12 @@ TRANS_FEAT(STMOPA_sh, aa64_sme_tmop, do_tmop_int,
            a, MO_32, gen_helper_sme_stmopa_sh)
 TRANS_FEAT(UTMOPA_sh, aa64_sme_tmop, do_tmop_int,
            a, MO_32, gen_helper_sme_utmopa_sh)
+
+TRANS_FEAT(STMOPA_sb, aa64_sme_tmop, do_tmop_int,
+           a, MO_32, gen_helper_sme_stmopa_sb)
+TRANS_FEAT(SUTMOPA_sb, aa64_sme_tmop, do_tmop_int,
+           a, MO_32, gen_helper_sme_sutmopa_sb)
+TRANS_FEAT(USTMOPA_sb, aa64_sme_tmop, do_tmop_int,
+           a, MO_32, gen_helper_sme_ustmopa_sb)
+TRANS_FEAT(UTMOPA_sb, aa64_sme_tmop, do_tmop_int,
+           a, MO_32, gen_helper_sme_utmopa_sb)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 08036c60c0..e8176fffdb 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1154,3 +1154,8 @@ FTMOPA_sb       1000 0000 011 ..... 000 ... .... .. 00 ..       @tmop_o2
 
 STMOPA_sh       1000 0000 010 ..... 100 ... .... .. 10 ..       @tmop_o2
 UTMOPA_sh       1000 0001 010 ..... 100 ... .... .. 10 ..       @tmop_o2
+
+STMOPA_sb       1000 0000 010 ..... 100 ... .... .. 00 ..       @tmop_o2
+SUTMOPA_sb      1000 0000 011 ..... 100 ... .... .. 00 ..       @tmop_o2
+USTMOPA_sb      1000 0001 010 ..... 100 ... .... .. 00 ..       @tmop_o2
+UTMOPA_sb       1000 0001 011 ..... 100 ... .... .. 00 ..       @tmop_o2
-- 
2.43.0



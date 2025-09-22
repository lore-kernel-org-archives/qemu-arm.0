Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE67CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:55:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lbp-0004pn-JK; Mon, 22 Sep 2025 14:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbk-0004k0-5H
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:52 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbe-00047V-4D
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:50 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-77f454c57dbso790020b3a.2
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566983; x=1759171783; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pjDdAknr01k7YxkbZX1BtFHr9eMT0hUzaWlnonFMe1U=;
 b=B8H8RuHzjKuMgtVt8c6UyZoPDC9PXzpNIQd2kgw1ng+ZM2ysuU+ep0YHoc/fAJxlnQ
 2KgQBHKm0iEILPyTm5aS0hP3Y0SCWE2m8EGQ+MvEzGG4LRodbvR7/AJFTTTdu4em/v7R
 eVCyrSNIkFnQxkoOu1Zgjm44EShHnDtJjOF4MttVQh7BRH1+uxjLs9wVjqYen0OGC7dr
 JTyob8qpR0lAxibb13QMATA/seQ5coPBPN2najqW8HT+TctWELREz/X9GU/JywbJArHX
 OCvETn6sv5oKEGgHIMDUnNwfo8Lc0BzWFPhq0fXrRtjeeTZYBXxQR11ZAa132QgLBtRF
 pyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566983; x=1759171783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pjDdAknr01k7YxkbZX1BtFHr9eMT0hUzaWlnonFMe1U=;
 b=m4bm4aVmT1zx7yDbWbSN4tMQ8m16UL5Y2GDH+dgDISkuRwQo/yQh5hzZqe30P0Hfkh
 FewyY1IbvEdzKgaxmTkrxqMWm5Rg1RpqR0Tw/78MthNLHp9JxOBdvh6f1T9k7KiFRvs2
 I05aUGXFapns8ZfNbu+btp7Wg4R8xBdD+EscaiPIxiZZWADSA6buosnvVbjVTnXcK/8m
 +pm0yV+7GqpukToQ7uENzaflbCmKURAJ2O4PCQ3TmoBVDEA7lRPYB1pQZisPxRQdAfTw
 2qG1EevKPCQAYjgqhru8jBNkMJTygukMx1OemnFgrV0AoJFzw/+Od9YD6rHQtMzUXVkI
 J0zA==
X-Gm-Message-State: AOJu0YxtazIKhLWIK6BurxRX1P6OW6cy8mGehF7OSYOll834RArZLy+U
 5QaWaOxM3LYsFBq17hJLtMy/uD+qA/651TgNa/e7lMdLErDqex2/NHtrW436KSU+q64=
X-Gm-Gg: ASbGncu+ETgNO8V/Nkfz/R6yblEt/2aksve6FAOm0LIfBFumvbzcLmlLgRMAUTWGqgK
 KgRijyw+jPygrsGSPZEa3P0GWw5YC6qnZzHROtnFPsrQutDbxm7a0Kjh7LzwvFrsqu/RKMJ71fq
 LJsPJExpYSEni2piv4bPn5cuOsRW9gYCOo1TxokSEFy3Jog0RSFSTGduSHyRQu98E32m2GBoGCx
 b1S3pLwH1IZcPyILyYAo0vHlYxN9WJ7KnAO6Ev79z8xPkwpj3ZJWJWhkaqWFJv+43FTlbce6XDw
 K3DmVd0annluEHZuR+pjsxKkFL4oE66RZWsEwE3l+AMjxkV56ujLk6kYuHm0SWrnGk/GfxUJ99X
 D53RTo6mq5CGOeV62RtcjR40ftKa6
X-Google-Smtp-Source: AGHT+IG9l/E5qxoU415HfVm19C5uvxsbygJtQKbxCJJ7q9D7/rqC6pLuePWOnQuVt3LEXzJjlFjqBg==
X-Received: by 2002:a05:6a00:b8b:b0:77f:2e62:1e32 with SMTP id
 d2e1a72fcca58-77f2e621f28mr7111628b3a.2.1758566982569; 
 Mon, 22 Sep 2025 11:49:42 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 12/76] target/arm: Enable FEAT_S1PIE and FEAT_S2PIE on -cpu
 max
Date: Mon, 22 Sep 2025 11:48:20 -0700
Message-ID: <20250922184924.2754205-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index abef6a246e..76193826ce 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1253,6 +1253,8 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR3, TCRX, 1);       /* FEAT_TCR2 */
     t = FIELD_DP64(t, ID_AA64MMFR3, SCTLRX, 1);     /* FEAT_SCTLR2 */
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
+    t = FIELD_DP64(t, ID_AA64MMFR3, S1PIE, 1);    /* FEAT_S1PIE */
+    t = FIELD_DP64(t, ID_AA64MMFR3, S2PIE, 1);    /* FEAT_S2PIE */
     SET_IDREG(isar, ID_AA64MMFR3, t);
 
     t = GET_IDREG(isar, ID_AA64ZFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 6b04c96c8c..94a6192fa9 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -122,6 +122,8 @@ the following architecture extensions:
 - FEAT_RME (Realm Management Extension) (NB: support status in QEMU is experimental)
 - FEAT_RNG (Random number generator)
 - FEAT_RPRES (Increased precision of FRECPE and FRSQRTE)
+- FEAT_S1PIE (Stage 1 permission indirections)
+- FEAT_S2PIE (Stage 2 permission indirections)
 - FEAT_S2FWB (Stage 2 forced Write-Back)
 - FEAT_SB (Speculation Barrier)
 - FEAT_SCTLR2 (Extension to SCTLR_ELx)
-- 
2.43.0



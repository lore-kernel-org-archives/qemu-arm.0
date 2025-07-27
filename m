Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66E9C87FCE
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:17:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwRf-0004E6-H6; Sun, 27 Jul 2025 04:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPj-0003fz-7G
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:23 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPh-0004rm-Dn
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:22 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2352400344aso30526505ad.2
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603640; x=1754208440; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3aRYtrkrc/9kZo8KuhActa/u/OWLIUyr4LApQE/Ub6k=;
 b=tTSUMHAl/7n/nH2wIloQhShbcZqDasJIFXLLJdgUJib8Y+TSrSJGRbEYvw6iSc+xfF
 niTxMWBkoqCZqKl3MdOgO2BSJUGowBxqXF7ARGZ1NOzq27O1fR3d7h+27jSKBt8bvxux
 YYGsZJpiB4HSMVj1ktnILZrgY+j4JYM60pFNYXiZntmgUD97azgA0vO1a9ENnlbnbQw8
 gOQE3OHHRmi/g+2Xbcqj7w9uoXMuKaAmDXfUZjr8pu6zQyPpQ2iuraLrt5iG3pi8yeSs
 2tP8i/BOSWEeHvIxfDyly9HXnSy7SGmMhOifATPuhcplPtNsB8gCBNK13Iza40Q2VOWo
 faBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603640; x=1754208440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3aRYtrkrc/9kZo8KuhActa/u/OWLIUyr4LApQE/Ub6k=;
 b=vCzd3SiG1QQMwWxYogYGTikyWKQMW6mEaFVwMwkepwWhdEemuEbDxwsj5fIGyWOhoQ
 HsgeSFEWpgpgUtF90H6mjr0F7nrxtYQFmkXJxFZ+tAMr9gcbu8GukxnT9FJyrmg3H/Fl
 B2+J9/vC6XpBiTJy0uHsIh6oZBYd+TwBzrEX+ETMZv5m2UiSEp71SmEU7X9Uu/gCu4mz
 MW3wJ3GfDs2EcU0m99shmBMqfAQS1nmAsjL8LkAfn5/8WuxAb1O2V8hQuUhDGjRz0M2W
 nVSYSs5Fbl4jpJmm4Vw6l2ycYFk/T9LsptaW4H1A4qOW/IPQLBJ5/IYuhfTI6hb83M2y
 1//A==
X-Gm-Message-State: AOJu0Yw50LhQWJFviNeSTUGEgDBljqHkMGvLJ/0E2FEp5BzrvTSKFKC/
 kARX1huK8cV7x1HAFCKulNrH2wFO9KU1cnVhAFzi2V3666v9tYCctSm9m6th4+cSoyHSiQUl4TD
 iV13u
X-Gm-Gg: ASbGnctDQvvovvdNBI3P/iywJTHXgStQaHfvWwwIPyezWGKrqKjIC57WvSz5AjnH7BI
 OdlyZyA5vV3H5Yqsn1QMumUg8qKRsa8F0i3VsYtQyr1IzWhfyLO1FpsKItycG/mNJKi8Zymiqh2
 nVw2tTS8u14yECH+w2fBWofi7q0YW9JpGH3qaqJrlDdITxZnQSBk5tbXBiulWYQOsCKIbg0r036
 s5u+MVG+raU2x7xgUcWE9AKkmkS2+Zft87lGq79kikpsh3oxpNkH1uG017vNcdnBm+/EGv2U27j
 sRuV9S9JOReo+tZxIyC/LMcGU+o2lRoJZ1gGjBKzebFLCNL0UG+TAqM/0KdRt1M63goieqv5Lgn
 XqAdD1CdRk/FoiV3df+i4zFOKD5aAtQPbHf5+0yPzfB5ViDLkafSHm1Eb+zJMHmx3NMgMbE7tyN
 J8Ideh2TOGXw==
X-Google-Smtp-Source: AGHT+IEeP+A39mBZ6PlXL8UX44ZOiw0oYRQFS/jwuY/iWxLsPsXXx4nHwqubE7GS+C2auFS9DgJPlA==
X-Received: by 2002:a17:902:f607:b0:240:9f9:46a0 with SMTP id
 d9443c01a7336-24009f948aamr17984795ad.38.1753603640071; 
 Sun, 27 Jul 2025 01:07:20 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 69/82] target/arm: Implement EXLOCK check during exception
 return
Date: Sat, 26 Jul 2025 22:02:41 -1000
Message-ID: <20250727080254.83840-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
 target/arm/tcg/helper-a64.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index f61adf1f80..7ab7ddf7c4 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -694,6 +694,17 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
         goto illegal_return;
     }
 
+    /*
+     * If GetCurrentEXLOCKEN, the exception return path must use GCSPOPCX,
+     * which will set PSTATE.EXLOCK.  We need not explicitly check FEAT_GCS,
+     * because GCSCR_ELx cannot be set without it.
+     */
+    if (new_el == cur_el &&
+        (env->cp15.gcscr_el[cur_el] & GCSCR_EXLOCKEN) &&
+        !(env->pstate & PSTATE_EXLOCK)) {
+        goto illegal_return;
+    }
+
     bql_lock();
     arm_call_pre_el_change_hook(cpu);
     bql_unlock();
-- 
2.43.0



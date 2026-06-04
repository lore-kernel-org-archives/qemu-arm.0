Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9BFCD6E75
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:52:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHoC-0006jh-7e; Thu, 04 Jun 2026 19:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo9-0006gd-QW
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:05 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo6-0007sv-7l
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:05 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2c0c3543590so9349675ad.2
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616941; x=1781221741; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iZbZ68SsOMffdmPWgLqwXRMUNHW1rI65Hp4imBurWZ8=;
 b=wv5gGnWyuaqM0Ptu+KVhqAcNgGpWn58sA7aA10ZF388DWGg3Mz2YLtMzDk9QCNKlcB
 IYtPPkLNgRl4ra44HTLaP2/Sg1DrLxFa/rjLkIxu0TLyrUkoziIkWaXYesZephwhkxas
 kSn5/6SRabxat1fiUUd+E3DUVU/8uilRZm/+Cyk9PsqdRx0Tf+gMRulXWHwmQKhOsV9W
 aGduBey4nWC1DF7Z4/CdK1tEj/yOwa+0QZ2yqvk2Vljs9fTqlYAQChO3RgmSOekKGyoY
 C3qmaJrGtfChwqLiyLneR4RJnk1yeSGIvObbPCCWd+geK9KBIUU9ioK6TCgFGsXyRqmz
 tQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616941; x=1781221741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iZbZ68SsOMffdmPWgLqwXRMUNHW1rI65Hp4imBurWZ8=;
 b=nnpQ3XQwUh7xAhX0QdrAD11GW7jdqG6ss4auqOxk6l4fkfOD0cKNafURRg4EsvukE0
 ETxe3/i8nUumVb7LGEX0C5amezC/umRZt9kTS7x7PsWcOGlXyR4aZUWXQ9oUqtOWDlkP
 ijSGOARh6H2cYHzBia/PRN0s4QNlC8Ln0daOYG4q5keIap6QpFiPPtrktLf/orKen9JG
 bbyPYmXmY4lFpl7bFvew9KjrMoVLuXIgoztxoCGlMzQmIkdz5lzObpP854zkG6ACG1Gx
 8ABKU4HgoPyG9xLA2p30TLjUQyJ3kjD28z5jMmg9J8ib8QtsAM9MaauZUMb2aYCzfUUc
 aNng==
X-Gm-Message-State: AOJu0Ywm3NJlW/FI8skB6bK3Jbc3CPpGRntFwmKropgrAp8IG7clxOyF
 CXXex1uKo/w/MRjkDQU6UFRiGIQ8EtLl2fQ/hAGcFqLgXwqBYo9ezRRma78ZU8eRZ9k=
X-Gm-Gg: Acq92OH2IyY05MuAw6aMkGc1i3Ea4hEeDqvpZ6POqI3CioM93D5m0KVvE6UfLhyUNx9
 FlpmPSEShKOUCUOYzj1X5NIo1Du+K9yvfkvZ4vyQXFWdLv4RwZbzqx/jfpcJFMUGkAtuXG8V2iN
 KXURgTH9QlEpfxmLkQlh3rjvQ7JdO/a0ITdmMowg8QQ1SoX9/FOnBLFdtEQQ0sRkRkLGEok4E0Y
 QUxqKPkffniobDehWuL3IDzoir7gbQc/+3vurWHwrhhS3UvGknz8mqXhilqQ2PXgJGHIllyM3Zz
 2ykdIlkhQNME+RN7rInFOFNOX+lHfh9oPXPEILmXjT/AJ2ZusaqWOZK4ilbao6PIS7EWoSUnlWi
 wx6XVmlZq12TVXe9dEH41Uc4W/cBQoyX0C/CCb88eBfmcWFtRQQkPrY8UmEg6tIeEDkvKuacq53
 vBtaZMRWibrI3JDi3Pa4YIU1ZfsH996Os+fCEFOlkI7Qnq3W5D+g==
X-Received: by 2002:a17:902:d58f:b0:2bf:195d:21d2 with SMTP id
 d9443c01a7336-2c1e7e44e91mr7549405ad.16.1780616940600; 
 Thu, 04 Jun 2026 16:49:00 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:49:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/25] target/arm: Implement SVE2 integer unary operations
 (predicated, zeroing)
Date: Thu,  4 Jun 2026 16:48:36 -0700
Message-ID: <20260604234852.573178-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
References: <20260604234852.573178-1-richard.henderson@linaro.org>
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

This includes URECPE, URSQRTE, SQABS, SQNEG.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 6 ++++++
 target/arm/tcg/sve.decode      | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index ad9d30d92d..083b70b487 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -6791,21 +6791,27 @@ TRANS_FEAT(UADALP_zpzz, aa64_sme_or_sve2, gen_gvec_ool_arg_zpzz,
 
 TRANS_FEAT(URECPE_m, aa64_sme_or_sve2, gen_gvec_ool_arg_zpz,
            a->esz == 2 ? gen_helper_sve2_urecpe_s : NULL, a, 0)
+TRANS_FEAT(URECPE_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           a->esz == 2 ? gen_helper_sve2_urecpe_s : NULL, a, 1)
 
 TRANS_FEAT(URSQRTE_m, aa64_sme_or_sve2, gen_gvec_ool_arg_zpz,
            a->esz == 2 ? gen_helper_sve2_ursqrte_s : NULL, a, 0)
+TRANS_FEAT(URSQRTE_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           a->esz == 2 ? gen_helper_sve2_ursqrte_s : NULL, a, 1)
 
 static gen_helper_gvec_3 * const sqabs_fns[4] = {
     gen_helper_sve2_sqabs_b, gen_helper_sve2_sqabs_h,
     gen_helper_sve2_sqabs_s, gen_helper_sve2_sqabs_d,
 };
 TRANS_FEAT(SQABS_m, aa64_sme_or_sve2, gen_gvec_ool_arg_zpz, sqabs_fns[a->esz], a, 0)
+TRANS_FEAT(SQABS_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz, sqabs_fns[a->esz], a, 1)
 
 static gen_helper_gvec_3 * const sqneg_fns[4] = {
     gen_helper_sve2_sqneg_b, gen_helper_sve2_sqneg_h,
     gen_helper_sve2_sqneg_s, gen_helper_sve2_sqneg_d,
 };
 TRANS_FEAT(SQNEG_m, aa64_sme_or_sve2, gen_gvec_ool_arg_zpz, sqneg_fns[a->esz], a, 0)
+TRANS_FEAT(SQNEG_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz, sqneg_fns[a->esz], a, 1)
 
 DO_ZPZZ(SQSHL, aa64_sme_or_sve2, sve2_sqshl)
 DO_ZPZZ(SQRSHL, aa64_sme_or_sve2, sve2_sqrshl)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 45f8633fd3..f1cf7a628d 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1545,6 +1545,11 @@ URSQRTE_m       01000100 .. 000 001 101 ... ..... .....  @rd_pg_rn
 SQABS_m         01000100 .. 001 000 101 ... ..... .....  @rd_pg_rn
 SQNEG_m         01000100 .. 001 001 101 ... ..... .....  @rd_pg_rn
 
+URECPE_z        01000100 .. 000 010 101 ... ..... .....  @rd_pg_rn
+URSQRTE_z       01000100 .. 000 011 101 ... ..... .....  @rd_pg_rn
+SQABS_z         01000100 .. 001 010 101 ... ..... .....  @rd_pg_rn
+SQNEG_z         01000100 .. 001 011 101 ... ..... .....  @rd_pg_rn
+
 ### SVE2 saturating/rounding bitwise shift left (predicated)
 
 SRSHL           01000100 .. 000 010 100 ... ..... .....  @rdn_pg_rm
-- 
2.43.0



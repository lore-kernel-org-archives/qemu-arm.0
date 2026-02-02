Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF861E7316F
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 13:39:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmu47-0006nw-Fh; Mon, 02 Feb 2026 08:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vmu43-0006lh-L7
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 08:34:03 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vmu41-0002c3-Od
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 08:34:03 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4806bf03573so21720545e9.2
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 05:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770039240; x=1770644040; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ay+tH20ip5bhixA+bYgnF6LAzF+PwWUB9/hETGcO/pE=;
 b=hwVYFmE99CJc1VVNvS5vE6FySNKt2DKCFWBH+n5Pi3UHe/oX3uoEsQTBPrJIRnfoVP
 DY23HkXiM9kL/vFfqVnFrKGdoe0eqNPEJqj1uSJKr0j6EYjirQXBmSsvodk6hHQZH1ZA
 vLREXumuesGjKrDoZyia8rewBzZVH2vFqXaglrD/xIEbd/b8rss6GSSKqEbvQe9uDFaf
 sxNSoGEv/dHMrdzVA0spCBBo+U7ZE/DNCF/j4IHLdRaAqVfd2+Qe6gufd5J8kmSUHdgy
 J5ZbMa4cWF+NpeKKTaogXPtgwiqmZ+kZZt+1EelXvyxYwpzef+A+aAynrRpoQ+EmikK6
 fjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770039240; x=1770644040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ay+tH20ip5bhixA+bYgnF6LAzF+PwWUB9/hETGcO/pE=;
 b=HCbIigAQntdKgD02Fc7/ugCKRvAjAblErRt1dBTelDh6n3MBLywgw9wcxdQJeLoZHe
 8nsm7LBNKv7uLAoiZ/LLMkWz8nmkG5UYxP4tzyijY5viNcbp4BdMWh0RyBfHkfAw++Fk
 4B8iN8mgnnqeqxb5wA0rrrTQwr/zPXoyP9roWyIeOzfKo4mzOjXXawOGPv4sUVGTxcP7
 H4cavakZsSqXlMPWdNe2WQlf8TJ9i6N7xN08KUfXDqJsC06YK0eeCMmg3jlYBlTlYEF+
 ntKhOeiGdvTocBaXuLC+o5dMgJA/orxn1RI2fCxW9PnFJhA7An8vfLOAV68fHQTprbKQ
 TQyw==
X-Gm-Message-State: AOJu0YxdNJgAKcjD+JVWypW9G0rPyWIrpKh6PHCBTrNPCnlad3d65I/J
 zr0/uku2ZHjXunBVLens6QmKlhEYtkEcRVZEYVLREZi4eIyps6+5Zo4bQ1RfgziSNvCgM4rXm7G
 49VNv
X-Gm-Gg: AZuq6aIJhUJXAjc5/iV9URcCXPx00ZqnINH7c//z/Uc/iDsyFw/fTUEQoKPqUvNsCcu
 K1hk9QEDUDudmRhCpuJhM+27Zv6ymo9SBlNTgKK6JEtqoPTfAXJxZknLO7Q53nWIx/3lhDe1TKw
 XtZf8H6wspVS1E7cYoTWvpb2PE0UXneF7F6SHpr8w61/+yOVhSkZn44DVS2tmiuytlAneFoE96R
 8EYRO6z0LF0VzXxn2ilYkEuWaXLhizOG/N7+JG45qBrsMDrX7bq0FDTj2fFbmMmNi9mtLf45mwi
 8nmhoMhq7W/bFuX9Nd5n5Oy3vRR9+3rmnaHyXLmG6nltIPbk0RIG8ZHnH0DK2wYDOTwOgDA3/Eh
 aa2+3Ddu3WlFWd5VjecsPgaeEHtzwXUAMsopnzdbVqIR9eqWhl9IGI9mVhfvXbDljC9FCgKFr7R
 DAUtGPhCaDUTT+lgF2dMsu3xlMzomhjg==
X-Received: by 2002:a05:600c:3b23:b0:477:7af8:c8ad with SMTP id
 5b1f17b1804b1-482db4a01edmr169731355e9.31.1770039240266; 
 Mon, 02 Feb 2026 05:34:00 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c42895sm478054495e9.14.2026.02.02.05.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 05:33:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 04/15] target/arm/tcg: Allow SVE RAX1 in SME2p1 streaming
 mode
Date: Mon,  2 Feb 2026 13:33:42 +0000
Message-ID: <20260202133353.2231685-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202133353.2231685-1-peter.maydell@linaro.org>
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

The SVE RAX1 instruction is permitted in SME streaming mode starting
from SME2p1.  We forgot to allow this relaxation when we implemented
SME2p1.

Cc: qemu-stable@nongnu.org
Fixes: 7b1613a1020d2 ("target/arm: Enable FEAT_SME2p1 on -cpu max")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-sve.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 81f487152c..e853b4dd0a 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7803,8 +7803,17 @@ TRANS_FEAT_NONSTREAMING(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
 TRANS_FEAT_NONSTREAMING(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
                         gen_helper_crypto_sm4ekey, a, 0)
 
-TRANS_FEAT_NONSTREAMING(RAX1, aa64_sve2_sha3, gen_gvec_fn_arg_zzz,
-                        gen_gvec_rax1, a)
+static bool trans_RAX1(DisasContext *s, arg_RAX1 *a)
+{
+    if (!dc_isar_feature(aa64_sve2_sha3, s)) {
+        return false;
+    }
+    if (!dc_isar_feature(aa64_sme2p1, s)) {
+        /* SME2p1 adds this as valid in streaming SVE mode */
+        s->is_nonstreaming = true;
+    }
+    return gen_gvec_fn_arg_zzz(s, gen_gvec_rax1, a);
+}
 
 TRANS_FEAT(FCVTNT_sh, aa64_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtnt_sh, a, 0, FPST_A64)
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734CACD98F8
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 04:17:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa4Ab-0005no-5n; Thu, 18 Jun 2026 00:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa4A7-0005VL-66
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:15:31 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa4A5-0005cG-JL
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:15:30 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2bf125989f2so3172515ad.3
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 21:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781756128; x=1782360928; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GynljLkvf1uEGLizdqiJ74gfCC4X3KXAsxV/9RvicuU=;
 b=gX7GPTkHO0Bi2AoR7lWylctvb2MvsXO+0t2oPSXpiTf0phBlhJ+P8GLi0GxkGxV5yn
 aFxLumJZg4mD+mI+eG1KM7y4brpHzvirqWOofs7B52mFv/KrBmVF+o9X+sz4ufIIRLjb
 X0RcRmmKG19Gv+N9c5l83tm4CmTpV7481IwwMjg27g1nTLQfy28MZh+S3vFyp9ERItUW
 Mrv4mYQGbRXKkZzTxvqZPtTPr09Pr2YboVSL+fQaZRm4Pl2DORV8/R0uY5KOSeJ6AlXc
 hjeaqGwNgJg1+GkVNklFygJg9uWm0lLZ0osctRBpYQJGg9TBw+Wk0u4pB9lRSETzPl8Q
 E2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781756128; x=1782360928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GynljLkvf1uEGLizdqiJ74gfCC4X3KXAsxV/9RvicuU=;
 b=Doh/3orubN6pSJrak4+5ivyzIFhKfHMNIEAVMcRPYELrMuaL8Ld1D/H+rRFSUw4E/s
 t/4whubko5AA8q4gDr9u+22m0aKtjcv3rDRM2bMb3l/Pu3OqH+yFKCFRZXczbkF5l25f
 DyrvLTDjfkq28Wzzdg8lonRstRZwpFVK/iVeUQ2kqtjFtvrp231n0ch7O2GBW3Y3U/uJ
 uwolgASvMbKGuLxxzIRRXVqRIrtIJjkmwkFjnVEoCMvTgIt/RBx1YT27HtPHvGZrdLeT
 EFOBgHNpMFBnEPdrj4Q/4ZNr73YVDKPevDHtoiYgcxG0jcnmAyLxMLoImxdYnS1s6wtK
 Glcw==
X-Gm-Message-State: AOJu0YwlWrs7wqCpBmmMrH4qZB0FQpu1R6uKKLs0u6JEvOcpTWiftuJ9
 WNiGdZlqn53ONQcfMcY9gAmKO9BH4SgTvz89wj9WC/UodzFSG5iOhSDK8MWv/ceKyfm3JZjijv+
 BeBuQ
X-Gm-Gg: AfdE7ckxMPVmz80Q0j7DK4oc3OdaUNAuXewE7PakTNTZmNSUfeOrKpR+2zJDGTko7XP
 fI9G6pF386MDj6s0W3TGXXQN3hceRQATHJWQ18BFC5y5epNhJWu9H4SxqJjPlMf4X7fIU8YQKFN
 FcsUK1s+6W+qNWJ8vqYxRomt1x6UOOB6nAXhUbWYYZxgAc0YGybUDUQtrgOrpuKTx8Zx0EO8Qiv
 KcRqQyVbfnZ1GjpO+jpfopjTDdswC2tID8af72BMjBuugRWzywIJRjiDO4RVNujw1Pj643VGHW8
 YclqBgmp9Hjro6MMN52Fr70BYJKdQnsVu/tRnqkqMghgInNS5xWuhuOGwLymeWpVgk/M8sqglRg
 dCOqrcxVm8Gtp0L3a1e0fk9/lyqTruoDszU82qXNZQuclmlaPTY24OhSebGr9/HQ6TPbWg7aVwD
 QVEYj9iBy2TpALZk4t/mSrit5eRWjix+cClSKYf84oMktc1Ky3aw==
X-Received: by 2002:a17:903:1ae5:b0:2bc:ac76:c1cf with SMTP id
 d9443c01a7336-2c6bc224cbcmr71604955ad.24.1781756128122; 
 Wed, 17 Jun 2026 21:15:28 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c42f2e535csm173905935ad.6.2026.06.17.21.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 21:15:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/10] target/arm: Implement FDOT (multiple vector)
Date: Wed, 17 Jun 2026 21:15:14 -0700
Message-ID: <20260618041517.573469-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618041517.573469-1-richard.henderson@linaro.org>
References: <20260618041517.573469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 1 +
 target/arm/tcg/sme.decode      | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 8fea451089..467b44e832 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1177,6 +1177,7 @@ static bool do_fdot_fp8(DisasContext *s, arg_azz_n *a, bool multi)
 }
 
 TRANS_FEAT(FDOT_n1_sb, aa64_sme_f8f32, do_fdot_fp8, a, false)
+TRANS_FEAT(FDOT_nn_sb, aa64_sme_f8f32, do_fdot_fp8, a, true)
 
 static bool do_fdot_nx(DisasContext *s, arg_azx_n *a)
 {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 3c7caf8bdb..04dd0e6df0 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -575,6 +575,9 @@ FMLS_nn_d       11000001 111 ...01 0 .. 110 ...00 01 ...    @azz_4x4_o3
 FMLALL_nn_b     11000001 101 ....0 0 .. 000 ....1 0000 .    @azz_2x2_o1x4
 FMLALL_nn_b     11000001 101 ...01 0 .. 000 ...01 0000 .    @azz_4x4_o1x4
 
+FDOT_nn_sb      11000001 101 ....0 0 .. 100 ....1 10 ...    @azz_2x2_o3
+FDOT_nn_sb      11000001 101 ...01 0 .. 100 ...01 10 ...    @azz_4x4_o3
+
 &az_n           n off rv zm
 @az_2x2_o3      ........ ... ..... . .. ... ..... .. off:3  \
                 &az_n n=2 rv=%mova_rv zm=%zn_ax2
-- 
2.43.0



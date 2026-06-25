Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21032CDB47C
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 01:54:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcZGD-0004qf-Cr; Wed, 24 Jun 2026 21:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZGB-0004ol-5x
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:07 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZG9-0008Rj-Ej
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:06 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2c7ed771dbfso7414085ad.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 18:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782352324; x=1782957124; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhQjgUZ4wEXX+w1LARBO37AImF6ObWFM7kPnocwBdvc=;
 b=rqklORS22tDupVfuHOIqGtpsUUd5rqI4TYUHMYG2EFr6g1qNFaqBQGoEpuQNoxE6Xq
 GI5HEHHzD+Xu28lNxsRkWroIBsGPFjgX6co+JV0jeFcJtqkRgJGMOVtUWB255tz4OCSp
 6KraC092sxYdD96M2+7qE4w8Nk+zssLLghg+1qqCgqTPfK1oNt7rkEVHkgZWAwTdJZ5J
 RFMTRsFIFFoqlfyB4bd1LaVYmwKD7hFPzvEuZVEkw6oHcZD1s9Wdv+F/dltzV6AGk21Y
 vAZB0WeXJLOdkoRrcL/S+3k/Cl6ZY9KNJCsIYutHA7TxL45nsGQwrJs3O37F89uLAv1U
 JIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782352324; x=1782957124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uhQjgUZ4wEXX+w1LARBO37AImF6ObWFM7kPnocwBdvc=;
 b=geHy5Lv61jJvnPA23bYqvaRrfzo8b5QN9POUFo7+/JAR9VIsjNCRtlE5wNd5p3SDzE
 wc4SX4GfSDO+EwEA8nIhwXQIpt6ZqKx2qSKpx4VNB6MKTf7qOpxl/yigd/G43Rah2x/w
 7qFSehgMFsqQsHzX0MIOJTqOc4neEdFCJv+pHfs2qkI0hwTinwLaasf7p1Q6mycD6eQ9
 cHHlURs90rzafa3vWsttjwwAs+E/RuQgXQlFrYvPW3ibDHMchHHkv+K+DFFtlKFZkkLF
 p0K4pu4lHmkSia1vcUAmIJIbKwGIKVOIPjfjaI4vex40nTmwc8YkwG/x4Mt7kFJTftkX
 BIEA==
X-Gm-Message-State: AOJu0Yy38AYEcJjv8WaoDHcMss/qzazFo4xMTYWYHnXHNMIrqTvumN9U
 UwRWa0MSbnOEN+i/c7m5LBwQsVc1SHoa3cdQn7soH/P5vbOfI9l2fjsvPDNs9cFPkNc=
X-Gm-Gg: AfdE7ck77r9z4C3E0Qebn2VM72yvm7zgCDwn7ihsnf1xxQq+BUzH0lO0oqL5JiNDMs1
 +XKKN3s8QbaqiYqbqL1eHcOBjyWgmFkohxCC61b0D+9bCouCztgG9v2qGPkVSkz4jRTJ1NL7nGc
 N34vABT2nv109RSZ+ra5SyDI56Di2IlaVlxy7mPX4bK7DYPT9Px3JXmrQnt3VoMg0dx12uxwT94
 dSddICKJGwW1+f1SfDJg+fIUGuMRbwpzIMZXyLweCJ8qrE3yaC4YPBWvsV+YGzx2RwWNPsyO1X/
 2u//BwhMeLGu+OtQIcts9jkP7rx0UiNtslpWcGpQyGw3WOkHq4f3WNpHrvQcY2nUXIXCjIS3inp
 mR3Pank0xXdH3WTy4Ar3+AAAVlzyU9zMzvIL7hi3SeWOOSwDTV1UX9koLn+2I+GN/fP9V5jjVIw
 hTLRSmERGrBWzFlxSV1+2Z8PPIws73C7jI9OG+PDcEHR8D4zFiQQ==
X-Received: by 2002:a17:902:e744:b0:2c7:9b17:6676 with SMTP id
 d9443c01a7336-2c7fc75a664mr7204515ad.23.1782352323612; 
 Wed, 24 Jun 2026 18:52:03 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f5ac8908sm9060635ad.8.2026.06.24.18.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 18:52:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/10] target/arm: Implement FMLAL (multiple and indexed,
 FP8 to FP16)
Date: Wed, 24 Jun 2026 18:51:52 -0700
Message-ID: <20260625015159.719300-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625015159.719300-1-richard.henderson@linaro.org>
References: <20260625015159.719300-1-richard.henderson@linaro.org>
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
 target/arm/tcg/translate-sme.c |  4 ++++
 target/arm/tcg/sme.decode      | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 7cb7b71e74..98f6eb0b70 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1140,6 +1140,10 @@ static bool do_fmlal_nx(DisasContext *s, arg_azx_n *a, bool sub)
 TRANS_FEAT(FMLAL_nx_sh, aa64_sme2, do_fmlal_nx, a, false)
 TRANS_FEAT(FMLSL_nx_sh, aa64_sme2, do_fmlal_nx, a, true)
 
+TRANS_FEAT(FMLAL_nx_hb, aa64_sme_f8f16, do_azz_acc_fp8,
+           a->n, 2, a->rv, a->off, a->zn, a->zm,
+           a->idx << 2, 0, false, gen_helper_gvec_fmla_idx_hb)
+
 static bool do_bfmlal(DisasContext *s, arg_azz_n *a, bool sub, bool multi)
 {
     return do_azz_acc_fp(s, a->n, 2, a->rv, a->off, a->zn, a->zm,
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index b735f3de82..c6e22c4999 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -791,6 +791,19 @@ FMLALL_nx_b     11000001 0001 .... 1 .. 0.. ...10 00.. .    @azx_4x1_i4_o1
 FDOT_nx_b       11000001 0101 .... 0 .. 0.. ....1 11 ...    @azx_2x1_i2_o3
 FDOT_nx_b       11000001 0101 .... 1 .. 0.. ...00 01 ...    @azx_4x1_i2_o3
 
+%idx4_15_10_3   15:1 10:2 3:1
+%idx4_10_2      10:2 2:2
+@azx_1x1_i4_o3x2 ........ .... zm:4 . .. . .. zn:5 .. ...    \
+                 &azx_n n=1 rv=%mova_rv off=%off3_x2 idx=%idx4_15_10_3
+@azx_2x2_i4_o3x2 ........ .... zm:4 . .. . .. .... .. .. ..  \
+                 &azx_n n=2 rv=%mova_rv zn=%zn_ax2 off=%off2_x2 idx=%idx4_10_2
+@azx_4x4_i4_o3x2 ........ .... zm:4 . .. . .. ... ... .. ..  \
+                 &azx_n n=4 rv=%mova_rv zn=%zn_ax4 off=%off2_x2 idx=%idx4_10_2
+
+FMLAL_nx_hb     11000001 1100 .... . .. 0.. ..... 0. ...    @azx_1x1_i4_o3x2
+FMLAL_nx_hb     11000001 1001 .... 0 .. 1.. ....1 1.. ..    @azx_2x2_i4_o3x2
+FMLAL_nx_hb     11000001 1001 .... 1 .. 1.. ...01 0.. ..    @azx_4x4_i4_o3x2
+
 %idx2_10_3      10:1 3:1
 @azx_4x2_i2_o3  ........ .... zm:4 . .. ... .... ... off:3 \
                 &azx_n n=4 rv=%mova_rv zn=%zn_ax2 idx=%idx2_10_3
-- 
2.43.0



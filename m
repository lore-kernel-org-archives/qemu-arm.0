Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5551DCD98FA
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 04:17:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa4AM-0005Yw-NV; Thu, 18 Jun 2026 00:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa4A8-0005WQ-QD
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:15:33 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa4A7-0005cl-7Q
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:15:32 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2c0c3546924so4457735ad.3
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 21:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781756130; x=1782360930; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T+ZFcB7hmPMQ0d58EGVQ3yeZwBQzynsJic03YTjk5bk=;
 b=vPv0wfNLKKTl/EKE7Yg3/9ewuWWEmKlqq4nZyUYikN403WCYttyfJkCF8SFS1JsWsB
 +Cz4X+wQ4tD/R6DlpKYcErl3+gwyUj29Zt6+ogd5ersaMdXVbhVhd0brr63vmiebfgEt
 yW8sS2j1C+gzFYa1WgdXnHMDBzR/mvnl37gMjNwbdK1ClZwnqWxvc18Io4PhihauNjUq
 C73YuLxcIh+1Q8pDHnT+Y9sJ/yPiVebRCGSn0SFbGXD36Uo+921z+0KSj+j4qBf/tWiv
 xH7VnGiShg0SXvK3ldEBeu8LBYDEeQMvX89g0v9ZY2CZQi4tMDuV7jM3bHHL+NUCMb5s
 ODzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781756130; x=1782360930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T+ZFcB7hmPMQ0d58EGVQ3yeZwBQzynsJic03YTjk5bk=;
 b=iNCwrfg4t+Fa7b1YM7nFcpceER6VswsmWUw+9z9BRAIH6oZ8CuoQcbmRfAoKDeO7u4
 AGQVFe6V0Wi0Efpqbd0tKGn1LXkjG3S0aVUHU1DigfkNDVLSCUpMj/Nl9AEMuSQcc4kl
 Xnr91bLmPbW072GsL+2Kl4C/jP9EbxPXha/LppMD32oERFxuVocjFEBkK9Z0TXPJD6lD
 QnlvKXT8h/mfzH0rWxsSssxFf9MyMfFEJa+vNAoapoPo1MCdta1bqjjKb9e4o8RpByVh
 m4cAhkTqihuTVKW1YrxiiiPJTvjuAhsQV4kKUBxB56sh7UWdsgmJjurSAq9e+lKZoIkA
 WiDw==
X-Gm-Message-State: AOJu0YzbQC5CSDXoj+i77aOvSFK2NcuC06Qg87vtntotf4+OMZ9zRuac
 zHOlbZhI1vzOeObZOYQfzKfW409yI9+VbkwPJiZT+TFx/2XEFIQzsnYtkUJayxA+40JX+51597u
 bQabk
X-Gm-Gg: AfdE7cmFTokCR8VbLq5CRwQCALQ6X0gP9FXgyuqSuDeQXjcK7Ydp0IjxY/o4i+Tv6kO
 CuM0aRVKCIy5JINvSrgn+a5hOlvSVDZBYT6+hE1o9B2KSqPfQZi1LLm3P/ar3fSuwvDZ+vGQ4mX
 PZyQ5cxoz8cIKbWt2miITR+Y2GVtZs21rJPdvLdq8iDouoRIUhWv/gUjdQh4aCTfhwFfKOtJaFQ
 JLdl/lzxoGLzzMc5LYpzoMIgaQJ5TZ7YJsfHeAgGojVNYPTCFYmHtDF/mH0txbcjT6Yy5b/JevA
 gSV0ir6cYYToWFsUTsAkYtHuMZXTWh0hdSa8GNbw3Y7Lrj+wOrtAJaNezyJ1PgHkNA56RRx6FgC
 zmqvJw9ZiAzJlVHsaHXtLuITsS8oL4QrhbDjVp2ctfGpFKJzZFdyTB0Gc3NyG5lS8ZMCNLSi+au
 2LWP5HGjTR+j7FLGfuG9H52qozn9MFpuvTcwjn1JpmXAFdgJEY3w==
X-Received: by 2002:a17:902:f641:b0:2c0:f807:56b2 with SMTP id
 d9443c01a7336-2c6e52c975emr20462325ad.34.1781756129565; 
 Wed, 17 Jun 2026 21:15:29 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c42f2e535csm173905935ad.6.2026.06.17.21.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 21:15:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/10] target/arm: Implement FDOT (multiple and indexed vector)
Date: Wed, 17 Jun 2026 21:15:15 -0700
Message-ID: <20260618041517.573469-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618041517.573469-1-richard.henderson@linaro.org>
References: <20260618041517.573469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
 target/arm/tcg/translate-sme.c | 4 ++++
 target/arm/tcg/sme.decode      | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 467b44e832..a9adaa02bd 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1161,6 +1161,10 @@ TRANS_FEAT(FMLALL_nx_b, aa64_sme_f8f32, do_azz_acc_fp8,
            a->n, 4, a->rv, a->off, a->zn, a->zm,
            a->idx << 2, 0, false, gen_helper_gvec_fmla_idx_sb)
 
+TRANS_FEAT(FDOT_nx_b, aa64_sme_f8f32, do_azz_acc_fp8,
+           a->n, 1, a->rv, a->off, a->zn, a->zm,
+           a->idx, 0, false, gen_helper_gvec_fdot_idx_sb)
+
 static bool do_fdot(DisasContext *s, arg_azz_n *a, bool multi)
 {
     return do_azz_acc_fp(s, a->n, 1, a->rv, a->off, a->zn, a->zm, 1, 0,
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 04dd0e6df0..7324ccddac 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -781,6 +781,9 @@ FMLALL_nx_b     11000001 0100 .... . .. ... ..... 000 ..    @azx_1x1_i4_o2
 FMLALL_nx_b     11000001 1001 .... 0 .. 0.. ....1 00.. .    @azx_2x1_i4_o1
 FMLALL_nx_b     11000001 0001 .... 1 .. 0.. ...10 00.. .    @azx_4x1_i4_o1
 
+FDOT_nx_b       11000001 0101 .... 0 .. 0.. ....1 11 ...    @azx_2x1_i2_o3
+FDOT_nx_b       11000001 0101 .... 1 .. 0.. ...00 01 ...    @azx_4x1_i2_o3
+
 ### SME2 Add / Sub array accumulators
 
 ADD_aaz_s       11000001 101 000000 .. 111 ....0 10 ...     @az_2x2_o3
-- 
2.43.0



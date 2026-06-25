Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88574CDB47C
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 01:53:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcZGE-0004rJ-7s; Wed, 24 Jun 2026 21:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZGC-0004pq-Kp
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:08 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZGB-0008Sa-4D
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:08 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-37df6d9ec2dso130989a91.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 18:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782352325; x=1782957125; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uSEX6M+LuR7LcEv9aIVh0aQwDBcJsbG3KYJ9CrbzF90=;
 b=ao3TEACu0+RQbdbwhHLlsBiga6AvUhH6PZQXWtU+AZsjxoufYX7OJjTU//AbLcW0ak
 2C/zXq8GNPdPNSmP9YokyIikW0in5cJIi3cYBpJ7oQgdbuPVptjy2C/+yclWj2AvWBEX
 qfND5BhQigh0SkktrIeyc6NYP0HolSBMyyNWoLxXI/HRVek15xFEcFBML7zp+QaMIAes
 l+1MEf+jx2FnLhVHtmEa/Htonr6/QBAXgOaIcRPXWrW0rGnLZ54V2t1iEExX/naPP+SL
 uYck8Jc80h4n1q1tnvas9gY3gF73j8Vfe57GN3NH+H6WAZXhVPhQJ2ylrgbksqzEwB/W
 PgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782352325; x=1782957125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uSEX6M+LuR7LcEv9aIVh0aQwDBcJsbG3KYJ9CrbzF90=;
 b=IdDZOIiWSpIGXJPXXCVQ36lVqL6Hi4BFk01lxDmSOZ1Ep+siHe+XrGsFdR0cGechjt
 /EOENQCvRx0p2jQDscloXCntHtXiPxisnxb2M55InnBcBAeIMXoKOGrGQFKl+WSYohao
 oZsN+5Qu8DMNJZNeEpLBP+9gNjx+fktWzjewVEWTacmDdRQCwASkfHTvjiyZ0uXaKkpH
 Y30A+ZyH95TyQDiPX+oyEqOfP7Dio58S3+1lJUiS/orzhrZnAF6Xv1iZc+fkWMpGzFFc
 kDV2ClZlwSx+PoEC0JV9n37AZeAjVp4D5UMdf16dkQyzzV1VIbLXMn1lpwQFwFs5uq3z
 HE5w==
X-Gm-Message-State: AOJu0YwLfqGc8Xh6t+kn0dGB55uKrDTkEdd8Ak9OdK++FNQgU0hF9VU/
 nJRQr6V/BKc21IRWLbsSf5GoQhYuRZLF/D4J4JH7q0I7SKPWSEXsERyOTbdNZxuF2nKpQuMaiLY
 dFibt
X-Gm-Gg: AfdE7cl4hMKYemdIIG8VhX/RPYxXacsEAntdmnouAF6Cfwhz9SfXOSCUUOpWOl1//ej
 M3SXzvJ+mlSgoD9EbJ7GMRPkQ9s4FwDyGX1nFNzd/Ol3k/R9mI64ThOr4YvlmaZruxOdp7a3G3L
 vdcWtlXI/dqvA9FDXdBuZVNkrefSc4jGAvZDg9Dd7r2xmxfGtzI76ywGd8TTNn33RNYiOvZCkQ9
 vZpW/sPPdrRJCi7u6trO8mVmaSMimywJvH2Ki12VgihBg05mdBQ0gpTiFmNJqakJf32+/0v4/mV
 dE/kB/FLyhAztvHN214FgEW4ZTu9jmEX6FXtLTdVPYDVRIFfwSuQvMHDZk6bIuT37lx8Tr/E3C0
 NB5at0W66Lfj9z5cmYufBzuXRWWMehGWWyTKitZr/SqEKaRqT32e0r41hAqfQjgfOrdHSp00mhP
 khI4WLx6P4oHW2P2iOXZFvLityaLpm6ovH1lpnXMNyjitrb4uYpw==
X-Received: by 2002:a17:902:e943:b0:2bc:f1ef:2e64 with SMTP id
 d9443c01a7336-2c7fc69d8d7mr7197905ad.12.1782352325510; 
 Wed, 24 Jun 2026 18:52:05 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f5ac8908sm9060635ad.8.2026.06.24.18.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 18:52:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/10] target/arm: Implement DOT (multiple and indexed,
 FP8 to FP16)
Date: Wed, 24 Jun 2026 18:51:54 -0700
Message-ID: <20260625015159.719300-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625015159.719300-1-richard.henderson@linaro.org>
References: <20260625015159.719300-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
index 3174b10c30..197274d00e 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1178,6 +1178,10 @@ TRANS_FEAT(FDOT_nx_b, aa64_sme_f8f32, do_azz_acc_fp8,
            a->n, 1, a->rv, a->off, a->zn, a->zm,
            a->idx, 0, false, gen_helper_gvec_fdot_idx_sb)
 
+TRANS_FEAT(FDOT_nx_hb, aa64_sme_f8f16, do_azz_acc_fp8,
+           a->n, 1, a->rv, a->off, a->zn, a->zm,
+           a->idx, 0, false, gen_helper_gvec_fdot_idx_hb)
+
 static bool do_fdot(DisasContext *s, arg_azz_n *a, bool multi)
 {
     return do_azz_acc_fp(s, a->n, 1, a->rv, a->off, a->zn, a->zm, 1, 0,
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index fbf5f3720d..1dd3b7c8b2 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -810,6 +810,9 @@ FMLAL_nx_hb     11000001 1100 .... . .. 0.. ..... 0. ...    @azx_1x1_i4_o3x2
 FMLAL_nx_hb     11000001 1001 .... 0 .. 1.. ....1 1.. ..    @azx_2x2_i4_o3x2
 FMLAL_nx_hb     11000001 1001 .... 1 .. 1.. ...01 0.. ..    @azx_4x4_i4_o3x2
 
+FDOT_nx_hb      11000001 1101 .... 0 .. 0.. ....1 0. ...    @azx_2x1_i3_o3
+FDOT_nx_hb      11000001 0001 .... 1 .. 1.. ...10 0. ...    @azx_4x1_i3_o3
+
 %idx2_10_3      10:1 3:1
 @azx_4x2_i2_o3  ........ .... zm:4 . .. ... .... ... off:3 \
                 &azx_n n=4 rv=%mova_rv zn=%zn_ax2 idx=%idx2_10_3
-- 
2.43.0



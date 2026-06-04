Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150ACCD6E6E
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:51:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHoA-0006hh-Eo; Thu, 04 Jun 2026 19:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo8-0006dc-EU
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:04 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo4-0007sF-Ui
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:04 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2bf3781ca51so13838195ad.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616939; x=1781221739; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9F9kbLi16+GGnW73s9vC4HTWyng7AeCqWcgF5pO53eI=;
 b=KVuJ6FYMliMf9rLXaKJUyyz9k+FoXW3zZzZHpD5viwjdeCNTqnuBv1qu9eSyuIlx3f
 2dxQJe+80sszr5Qn/BG421Oq08XYw9D0VwhnZlt3b5CvCgt+lQx4AOHK+jMU+OmndUVW
 MItzq8OaJX3914pl1YbGkmECmnXmX52Lx4SG3/+kUO0+rfX9HX5ZJnbuoOiUxQGkqAKK
 TYivQFDUFgNO34qmwOJcnLf4doBhbUuxsBzM4zoqGAHm5jHy4te3jt3F/3+FF9gpbkbf
 vlIdZC8OdXCmzHHhRYrk7BYladTeB3enxiQ0qx82lGsuvlb1Yv0QZOmbxoyRoonq20gp
 U21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616939; x=1781221739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9F9kbLi16+GGnW73s9vC4HTWyng7AeCqWcgF5pO53eI=;
 b=IqehqmetAXIfOauLYrpo/zL9laP+40A0HOaes+npQb79kWwILuYxcH2DpU+Hd68d/5
 VW70eQgyDtE0oTGmjLZr/eY9XKqUhCn1m1OW+xmS4V0osm02Ou7HrHj0VEz4+6ot3xN2
 JfuUzoHsqFGPg0rHtoseHXt6OP7pudD5IAwHQ8k9Cfx4V/WKbtpf+vZrI92llwnS8Zaf
 KcAxIUD1Gu88siebbmbqQaq0x77sVzAmkflg5vnRqIt7wtvJV3z6WKA5beF6lGcEZbTu
 ixXOTBWopicmLTQtH8++mTZ2uKn+2QlOjALAXOddvD2zkzGpR1kd42FpTcPdZQNatfkU
 9EJg==
X-Gm-Message-State: AOJu0YxgMZJxMH/4rcfRVN1p9Gs7Y8fHk4T7ulaOE8+TZ2frH8vKpgo+
 nd/TJpa9/8QcziBKo4TAQJcH3J5R3XcBh3qUfL/FobrF6+PsCfdHBeLzAxp7LiJGfqQ=
X-Gm-Gg: Acq92OE9SMop3Bm4gRUL/LHuSof6gRCR7OzngyzUZBeBfwNHswI8I8T0V/vgH+5Faah
 /acguBOcs61woBpOSM4MjKZu9xJORRfFUUIn2FO/BEHRVYgO4SuMSUHFzt7zI81DgaxbQO9a52w
 JiZTKLA8Tr8SDxxLyJmNwumWC/uS/o8Yf6Kidqx2i2tO353s5TBQicDT9FivdGKBspac2QF/SQf
 UiqYk4JsZs0RlHdt1XhWPwTFbaOXRMg83nCSVTeyy0oVvrTsDtfrAitxTqS/elXmh8sbp4oSltt
 oqA6/53ySwW/HRC1a1WJTOJe22nrq0L/BJExEjPRbkh3tXs7i8E9EZtOMYWhqnetRrYta4KFzdE
 dkSwady3cPkpXddu1Ax8tMCGjEejll16JnQJFaM9lRyT6j+LxM/Kh3bsCf9HNpIj927MhN0pIq+
 lF8VIUVPJYIVPBPaH6nTvD3NsXXdDKMM363IOKCzQ=
X-Received: by 2002:a17:902:da86:b0:2c0:f807:56b6 with SMTP id
 d9443c01a7336-2c1e7b3578cmr6726935ad.4.1780616939307; 
 Thu, 04 Jun 2026 16:48:59 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:48:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/25] target/arm: Implement SVE reverse within elements
 (zeroing)
Date: Thu,  4 Jun 2026 16:48:34 -0700
Message-ID: <20260604234852.573178-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
References: <20260604234852.573178-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

This includes REVB, REVH, REVW, RBIT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 7 +++++++
 target/arm/tcg/sve.decode      | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 2e138f9ac0..c3903d8fcc 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -836,6 +836,7 @@ static gen_helper_gvec_3 * const sve_rbit_fns[4] = {
     gen_helper_sve_rbit_s, gen_helper_sve_rbit_d,
 };
 TRANS_FEAT(RBIT_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_rbit_fns[a->esz], a, 0)
+TRANS_FEAT(RBIT_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz, sve_rbit_fns[a->esz], a, 1)
 
 static gen_helper_gvec_3 * const sve2p1_orqv_fns[4] = {
     gen_helper_sve2p1_orqv_b, gen_helper_sve2p1_orqv_h,
@@ -3070,15 +3071,21 @@ static gen_helper_gvec_3 * const revb_fns[4] = {
 };
 TRANS_FEAT(REVB_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz,
            revb_fns[a->esz], a, 0)
+TRANS_FEAT(REVB_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           revb_fns[a->esz], a, 1)
 
 static gen_helper_gvec_3 * const revh_fns[4] = {
     NULL, NULL, gen_helper_sve_revh_s, gen_helper_sve_revh_d,
 };
 TRANS_FEAT(REVH_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz,
            revh_fns[a->esz], a, 0)
+TRANS_FEAT(REVH_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           revh_fns[a->esz], a, 1)
 
 TRANS_FEAT(REVW_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz,
            a->esz == 3 ? gen_helper_sve_revw_d : NULL, a, 0)
+TRANS_FEAT(REVW_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           a->esz == 3 ? gen_helper_sve_revw_d : NULL, a, 1)
 
 TRANS_FEAT(REVD_m, aa64_sme_or_sve2p1, gen_gvec_ool_arg_zpz,
            gen_helper_sme_revd_q, a, 0)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index e79b5e84c1..867ae2916e 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -730,6 +730,11 @@ REVW_m          00000101 .. 1001 10 100 ... ..... .....         @rd_pg_rn
 RBIT_m          00000101 .. 1001 11 100 ... ..... .....         @rd_pg_rn
 REVD_m          00000101 00 1011 10 100 ... ..... .....         @rd_pg_rn_e0
 
+REVB_z          00000101 .. 1001 00 101 ... ..... .....         @rd_pg_rn
+REVH_z          00000101 .. 1001 01 101 ... ..... .....         @rd_pg_rn
+REVW_z          00000101 .. 1001 10 101 ... ..... .....         @rd_pg_rn
+RBIT_z          00000101 .. 1001 11 101 ... ..... .....         @rd_pg_rn
+
 # SVE vector splice (predicated, destructive)
 SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
 
-- 
2.43.0



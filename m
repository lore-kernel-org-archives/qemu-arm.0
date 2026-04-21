Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07128EA71A4
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:19:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Sx-00014j-Gh; Tue, 21 Apr 2026 01:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3SC-00005G-IV
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:30 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3SA-0006vy-DK
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:19 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2b788a98557so1544035ad.2
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748516; x=1777353316; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89Ve9V43x0EDfFcuX4z32PJFwEIHKLJcoTkwxamYsNA=;
 b=B/1iBtlIFSQPMqfaDjEoLT4eTkkoqX3y/MmjFhuXbsML/5dosIPrwFMMU8bZvO4deY
 cx4dGLvW/1hIGJynFsjaHlBhRllIpScSSC1EXvRZ685RH5AaUg4v6NsWIyv/xrxgTrH7
 fFqkcSJjhGFdxUeyLDQWsFrXbxYLweL7HhOQESiOXxoZZW57g5eWkVckZZLfxlCc78Zz
 wovaEHjbV7iBSz9NFbbZDl6Xpj/VIj6p1T8lFazT8JVU8NtX88RWe8TWE4ahLXvU4dya
 TAEiyi4g2vle8xkQRyf105eoCh3RN016MFoKd4yTxroTft9k31z5Gna73PJk7i2ki/LB
 ogKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748516; x=1777353316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=89Ve9V43x0EDfFcuX4z32PJFwEIHKLJcoTkwxamYsNA=;
 b=jarIz1qNf4WxqvmuHGdKK1krohLZ0xXpXY96uBWDyAtSEfK+8m55k1x2mfMoj3T885
 bV98i0tbtVacLvKp2rVAb+e8OdMVcC2YFGBHHbPcMytLWDYdzWNiKJShr7PnBh6aaia0
 QxQg77roAfFmLubTSSA3Y7jYHF3v1+7hxoqdGWNxuD6l6BEuHqereReJ5DEARgoYWc7J
 LOi+OstPlGVbV3HckBeM/JjsEGOciPGnoSNeSkq152zJMljPHhLbgk3Bcui9pXkn9x5q
 n57aEOq0KEp2W83GEgw6AltF44eQWjzq4kLGvoiNRUtcciqbEpyviQQwJ96ilVL4MCJM
 zgpg==
X-Gm-Message-State: AOJu0YwxLzHkJhISDvfv6WHudFKvf2iJhjmwkRYFUUXdxeKEdFfH9lzT
 9JPcZaj6jZ5AlPAlhCGRfpWM/BtjkUlcB2X+oG3rrseXnj6XEUWB/IZpFFyFCCYoN6c=
X-Gm-Gg: AeBDievq8FTgxk4E45FEDeNBuwkT9jCR+AitZRIOyUKjaKngEHu53ZOIIwLkoVB4dVR
 kzJ1wrl9QloOQ1ga/CFzImb8IvZFNgZEfy13d9yvOVJKRdNbq241P/PZOEISZU3eGz4A9SYcQAz
 akb9K1Q8Dfw9iTnJL+L5g94Vd04+Mb8ZFa1L6GwMQ/GkG/RAZ79GlQpDhoBeEcRxctKxsIQMogQ
 wBJOfsgYFEx2cU9l0vrh8zWeqNchzSVGIv/CpIj1iIvuc3IHwPhCvFC3Y06iGilde1InNHaXiVS
 WcfywkVZfumPsHJXn8LlsYQ/k1ph7LreAz1U4mWoZjWNyxEjOQmP4Q2pG1Wa70wDzt36VTjprVl
 3nBUnmSVPj+/d/kzhvIRD4BUb/HE5yj6vTIHO7lmAVscH/o9s9ee63WT0VAlChUMgfpAeSZmHj4
 UVgGDC5JYb0SYqNeI0spsnAWpjt9eXpVwKz0z83vIwfgpevi1Ph4o=
X-Received: by 2002:a17:903:166e:b0:2b0:a957:304 with SMTP id
 d9443c01a7336-2b5f9e85b42mr178905355ad.6.1776748515180; 
 Mon, 20 Apr 2026 22:15:15 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:15:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 35/37] target/arm: Implement FCVT (FP16 to FP8) for SME
Date: Tue, 21 Apr 2026 15:13:44 +1000
Message-ID: <20260421051346.41106-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
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
 target/arm/tcg/translate-sme.c | 16 ++++++++++++++++
 target/arm/tcg/sme.decode      |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 29d116a57a..b112f16cd7 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1555,6 +1555,22 @@ TRANS_FEAT(BF2CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvt_hb, 1)
 TRANS_FEAT(BF1CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvtl_hb, 0)
 TRANS_FEAT(BF2CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvtl_hb, 1)
 
+static bool trans_FCVT_bh(DisasContext *s, arg_zz_n *a)
+{
+    if (!dc_isar_feature(aa64_sme2_f8cvt, s)) {
+        return false;
+    }
+    if (fpmr_access_check(s) && sme_sm_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->zd),
+                           vec_full_reg_offset(s, a->zn),
+                           vec_full_reg_offset(s, a->zn + 1),
+                           tcg_env, svl, svl,
+                           FPST_ZA << 2, gen_helper_gvec_fcvt_bh);
+    }
+    return true;
+}
+
 static bool do_zipuzp_4(DisasContext *s, arg_zz_e *a,
                         gen_helper_gvec_2 * const fn[5])
 {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index d6192eb59d..a02bcc0e22 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -863,6 +863,8 @@ BF2CVT          11000001 111 00110 111000 ..... ....0       @zz_2x1
 BF1CVTL         11000001 011 00110 111000 ..... ....1       @zz_2x1
 BF2CVTL         11000001 111 00110 111000 ..... ....1       @zz_2x1
 
+FCVT_bh         11000001 001 00100 111000 ....0 .....       @zz_1x2
+
 ZIP_4           11000001 esz:2 1 10110 111000 ...00 ... 00   \
                 &zz_e zd=%zd_ax4 zn=%zn_ax4
 ZIP_4           11000001 001     10111 111000 ...00 ... 00   \
-- 
2.43.0



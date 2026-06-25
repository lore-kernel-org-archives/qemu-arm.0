Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D720CDE00B
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 22:35:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcseq-0004Yf-Sm; Thu, 25 Jun 2026 18:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcsed-0004Vq-RL
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:34:40 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcseZ-0002Ki-Ff
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:34:38 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-c891d27b10eso216995a12.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 15:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782426730; x=1783031530; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OX1DXUHDs3wRzE3fBNAvapThfwP0ojuzDB2f/jYyfIY=;
 b=NxqvBJKLsZN+OicgwP4s1mWY6Apk13mxEEqwKTxXS1AHJ2GNAj4tClNLHAiWhOhp0f
 74mQyRZUgv7YChEqlxnBuwx0CyaueEfHWHjCdgGAGjCpgmrKrY1p+VGvxbxhEdgKQvIo
 rWXR8KntkhxMfTK4WlbVM6KviK3CW7TG1qRSMhIQ89Ccw9Mg/8QGhJ7+ncZjULNbaDWv
 JlE1la1TtH+DrXlJnOSbuTJKZukoLXD+TJfSaC6Oxd1olmujt05GLrlBQrPHCL3bnDQJ
 gAgl0E2kAGAku3UundkUyzt9PtGXyfH1wPc0BuIWS3I0guOwGlPGKoaPwaSYK28J2Bko
 /iLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782426730; x=1783031530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OX1DXUHDs3wRzE3fBNAvapThfwP0ojuzDB2f/jYyfIY=;
 b=Pi8Iw3qA37bGpEUiKK1zgg4ush2Qdf30aFub3CxGBDqMPpvgDK/brFE+uOtakErvpD
 OXJ08OhwnkbKaLBCuWFCODlkLYs1INcqwZEWwPPf3+XqZ7E/UAKzP2jutIE9OI494QHo
 OqrlijyUdrlmDWXXmTKLZfZC9uy4N6UZQy+oEfCesg83K5L3I8tFc9ZY9mEeTE1tOk93
 t0qEA85IHRYC7xgvmo2JnO2hT+ck6uopxpYc/+PEEGNo4sd1epvN/44Zdxo+/qGAy/6a
 pnPC7gCR5FDf9f+aRbXuhEuxDZe/jOSrLr+xJ+NN4U3ueJPx3GyDamOMPCwN96Ncjaxb
 tvEg==
X-Gm-Message-State: AOJu0YyhhxB+pn0xuLktts9OQksvqY7nwOkLMAmgcNIdEbjWetzT0MUa
 OptC4HEv8pHx5rBqa2UnztltU8m2nN4+gp1Mq1G79ErL2qvFVE8lvtjPDVBJI2nGLYPacrmklun
 +Ld9p
X-Gm-Gg: AfdE7cm6CU0kBviRDpz26Z6GWSE3qHQAnpwJ54BfQAe8vSua4BBzxFL6drwKLXiTvMs
 rf/w0mQ89Lu38sCdM8HNxW0H20ZFZ8jT+0kyr5gWTsDATd6pv9mXPxBZDN9mmAkSAtjoF0b9/Tk
 kL/D3Z5r+uFkLk9j/slxie3hTC85DlOflQl30YBOC4fUkGso93RbIjO39fhFdKkoxlGhlIfOGaG
 VRTnH81MjGgPE08Ny6esZrHhSx8ro6uXe3oVuWi51k/xLN4tr3xwjhQFJDxMChRi+v3GpWX5Wdo
 e6udXQnAQxSbPpLdZ7LyqeMLWsbczyxpoeIEZu86FhoITl8Ej/lRc/AvlSWK5eOQYdgtPEjBcsU
 m+UNLxaSVuy3vr3jlcQMWwk7kQl39g7YpniH4e4jud3vBm/khi3QtUOBEWWMuv/NRxJ8WjCcu8D
 VS7UKJ2D/MFcdTLbF0gDjuFPsx+n6JDPRl9H81/uWZs7rJ5sL8iA==
X-Received: by 2002:a05:6a20:7fa1:b0:3b4:b259:6965 with SMTP id
 adf61e73a8af0-3bd4acd3453mr5015384637.11.1782426729580; 
 Thu, 25 Jun 2026 15:32:09 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845a412e5e9sm5450139b3a.54.2026.06.25.15.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 15:32:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 11/15] target/arm: Implement SUMOP4[AS]
Date: Thu, 25 Jun 2026 15:31:56 -0700
Message-ID: <20260625223200.763198-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625223200.763198-1-richard.henderson@linaro.org>
References: <20260625223200.763198-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
 target/arm/tcg/helper-sme-defs.h | 5 +++++
 target/arm/tcg/sme_helper.c      | 5 +++++
 target/arm/tcg/translate-sme.c   | 5 +++++
 target/arm/tcg/sme.decode        | 3 +++
 4 files changed, 18 insertions(+)

diff --git a/target/arm/tcg/helper-sme-defs.h b/target/arm/tcg/helper-sme-defs.h
index 070a1a2c1d..3da40d9f33 100644
--- a/target/arm/tcg/helper-sme-defs.h
+++ b/target/arm/tcg/helper-sme-defs.h
@@ -386,3 +386,8 @@ DEF_HELPER_FLAGS_4(sme_smop4a_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_smop4s_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_smop4a_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_smop4s_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sme_sumop4a_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_sumop4s_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_sumop4a_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_sumop4s_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 11d9d509ec..5a9e3b8398 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -2972,4 +2972,9 @@ IMOP4_4WAY(smop4s_sb, -, int32_t, int8_t, int8_t)
 IMOP4_4WAY(smop4a_dh, +, int64_t, int16_t, int16_t)
 IMOP4_4WAY(smop4s_dh, -, int64_t, int16_t, int16_t)
 
+IMOP4_4WAY(sumop4a_sb, +, int32_t, int8_t, uint8_t)
+IMOP4_4WAY(sumop4s_sb, -, int32_t, int8_t, uint8_t)
+IMOP4_4WAY(sumop4a_dh, +, int64_t, int16_t, uint16_t)
+IMOP4_4WAY(sumop4s_dh, -, int64_t, int16_t, uint16_t)
+
 #undef IMOP4_4WAY
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 6f3806f4de..fce07b2565 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -2114,3 +2114,8 @@ TRANS_FEAT(SMOP4_sb, aa64_sme_mop4, do_mop4_int, a, MO_32,
            a->s ? gen_helper_sme_smop4s_sb : gen_helper_sme_smop4a_sb)
 TRANS_FEAT(SMOP4_dh, aa64_sme_mop4_i16i64, do_mop4_int, a, MO_64,
            a->s ? gen_helper_sme_smop4s_dh : gen_helper_sme_smop4a_dh)
+
+TRANS_FEAT(SUMOP4_sb, aa64_sme_mop4, do_mop4_int, a, MO_32,
+           a->s ? gen_helper_sme_sumop4s_sb : gen_helper_sme_sumop4a_sb)
+TRANS_FEAT(SUMOP4_dh, aa64_sme_mop4_i16i64, do_mop4_int, a, MO_64,
+           a->s ? gen_helper_sme_sumop4s_dh : gen_helper_sme_sumop4a_dh)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 6fdf79c7b6..e3ba15bad8 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1120,3 +1120,6 @@ FMOP4A_hb       1000 0000 001. ...0 0000 00.. ..00 100.         @mop4_o1_s0
 SMOP4_sh        1000 0000 000. ...0 1000 00.. ..0. 10..         @mop4_o2
 SMOP4_sb        1000 0000 000. ...0 1000 00.. ..0. 00..         @mop4_o2
 SMOP4_dh        1010 0000 110. ...0 0000 00.. ..0. 1...         @mop4_o3
+
+SUMOP4_sb       1000 0000 001. ...0 1000 00.. ..0. 00..         @mop4_o2
+SUMOP4_dh       1010 0000 111. ...0 0000 00.. ..0. 1...         @mop4_o3
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E8BC87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:13:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwRC-0008Vz-T0; Sun, 27 Jul 2025 04:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPT-0002HU-Nz
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:08 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPR-0004mF-OS
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:07 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-b34a6d0c9a3so4332750a12.3
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603624; x=1754208424; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTtFiV0an9RhLFd9ouBN3Y+ST0hrHevuMmYKg7N5y/k=;
 b=EyOggIoiXbM3OrEa6s7UDiRFLefGumhfPweuO/h2zW0oj3WGi3RllEjHhcw2gPinDs
 +UbQz5V+Kq5O4g3pmrNhoAi4fLBqRUlH8M7JjtB4mukocD0refusi6zAvXiqWsT1rNGh
 y6DqqeyULTSCiHMfxzwhO/6K78kz/TKnE1I/6bTpyOPxl4f2eTEolymffxBJN9Lhgjpd
 //0pP98MZ94nKE3JDq4WLNZ8PQxk6Hf6S6GjwUlyr/MwMnr0dScfni8rLZAFL3oSNoON
 gv13fULJ+FOZRxuXBnejwqjNHtqA5e6/3up5M+qGxOfSbRA81QfnftRZx/4KPDIiq0DZ
 Yr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603624; x=1754208424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTtFiV0an9RhLFd9ouBN3Y+ST0hrHevuMmYKg7N5y/k=;
 b=sHvgPwu2jzV+Beupal1M31fvK3BkU2g4ACfVdZAdjgalSC+nGN949z4SxgjuUSvU+k
 v3Pcc8SCHpUEJrwM2iY3S2lEBByDAgQ4cMr3fJWZF4ggpnd+YHQ17tVPpUj1jPnGmc+P
 goquTsHAv8QSE08ejs8u7rzTfVo5lkRLisSszPwd+e7uGwsG2o8m0LAYPhVds1EbNTT7
 h5sU/fL/YKciCCPyYw4KXtxzEJWY1EDNa72jNpEsMj7HYGrZaCF7AgUZrJkXUdYrdGwC
 Z63XotkWEZbYvVuLO4EUI5rf5uBuh+9BQiN9BeBa38Sv/Xo4M6pPcxzYd8C/n2iRK4PL
 s0aw==
X-Gm-Message-State: AOJu0Yyt+infmdPYDGSUYSQRCYv3fkHDhEJGpvjWb4aG2ATsVxm9HJGO
 VCh5LJ6GOQBkYOsplGGe6gQh8sQvXzlIxXiIcC3rPTYlw7BXih4NTsDCZCmA/sdvKF0=
X-Gm-Gg: ASbGncuwhsaVPBune+lRo2fP3iMt2dos6Zz+wdEM1m8wiqWDeEFvsAAD75eMHf53Tuu
 APHhpXUZUp8i47Y4Q8qg7AGCa3yf4lsS5BnObu6Zc42tAQtAdV3S0FDJivTHCqQq4ANod8NHujK
 qKMNgdHi538XfjYQlJRW3SUxvQIDmDzseUMuPSDQQOHAhQsEdorors5szuloBzvpLnbmSa10Omd
 Yq8pm+FJRDcsp8yTtO9mDUePmvnvtThCfTyGPyOSPbEE3KR1JGmQASeywiG3Rhmg+fGmNyDOcCV
 oWWgehi1IQecePB1rzsJ3oSbcxzXDhjsFUzc0eRGMhiDSYdXMYyYpEOJTUH+CB4cGd54zwBkVAO
 wRvBgFXw+T9IOisKV2mNHTZezK502wqdFrcmGmle63E2UNaU8PB6xtqMafgUAMh/zNmzWe2omu3
 BW6iodQM02WE0p33VuHxTO
X-Google-Smtp-Source: AGHT+IE6vX4jo34NmC7DNBiNa7fLgG0kAJ8oMwYLk+ZYdX+g5pw5YJKKxaizdXQ1juFMo+pt4JPpVw==
X-Received: by 2002:a17:903:1b05:b0:234:b743:c7a4 with SMTP id
 d9443c01a7336-23fb30e42a3mr127818165ad.38.1753603624225; 
 Sun, 27 Jul 2025 01:07:04 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 55/82] target/arm: Implement GCSB
Date: Sat, 26 Jul 2025 22:02:27 -1000
Message-ID: <20250727080254.83840-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
 target/arm/tcg/translate-a64.c | 8 ++++++++
 target/arm/tcg/a64.decode      | 1 +
 2 files changed, 9 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e0548f7180..45ff7bb0b2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2072,6 +2072,14 @@ static bool trans_ESB(DisasContext *s, arg_ESB *a)
     return true;
 }
 
+static bool trans_GCSB(DisasContext *s, arg_GCSB *a)
+{
+    if (dc_isar_feature(aa64_gcs, s)) {
+        tcg_gen_mb(TCG_BAR_SC | TCG_MO_ALL);
+    }
+    return true;
+}
+
 static bool trans_PACIAZ(DisasContext *s, arg_PACIAZ *a)
 {
     if (s->pauth_active) {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index d034d96b37..e8b0ef07eb 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -238,6 +238,7 @@ ERETA           1101011 0100 11111 00001 m:1 11111 11111 &reta  # ERETAA, ERETAB
     AUTIA1716   1101 0101 0000 0011 0010 0001 100 11111
     AUTIB1716   1101 0101 0000 0011 0010 0001 110 11111
     ESB         1101 0101 0000 0011 0010 0010 000 11111
+    GCSB        1101 0101 0000 0011 0010 0010 011 11111
     PACIAZ      1101 0101 0000 0011 0010 0011 000 11111
     PACIASP     1101 0101 0000 0011 0010 0011 001 11111
     PACIBZ      1101 0101 0000 0011 0010 0011 010 11111
-- 
2.43.0



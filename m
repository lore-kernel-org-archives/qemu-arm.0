Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF89FCCD184
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:16:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jLW-0007UZ-Cs; Fri, 03 Oct 2025 13:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jKI-00053x-PA
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:12:17 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jJt-0007iw-Jj
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:12:14 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7811a5ec5b6so2834515b3a.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511504; x=1760116304; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RgapaYKJCYI8THelUZOsiqX66vR02pQghFFIRA5mWDg=;
 b=HzA9vCUBN2D3ItP2FuXMqbLmh8nK43idsplrC8tGVgVMgL/57cQQhEC3wrlgPto0p1
 BTlkhljEPnKQ6bPWPCfNCXOPbMSNB82/7ruDzzkIz/5sFUsmC6wGO4ZgPFZZ1ssQktCo
 q3aMF+N0yMFcMx58U7ctRyCuL1iCwd8iieYaAtErfP0iMEw8vxTmS1sQ0HrdH6YjPchz
 TFy1zVfVIUuTOL9jAKdtztEJDF4M2dr1gyJZLjyRwANc5nR98mw1/097PA0Xx3JfUi3w
 J2LFW6kua+8nyswIt9/tjXsWM4dl7AcSoefj93e9ptAMF4Fi6KBIcErkQsqFLmxPc4yC
 N4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511504; x=1760116304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RgapaYKJCYI8THelUZOsiqX66vR02pQghFFIRA5mWDg=;
 b=BQwR6SOo6LmbTWDiljCkQaAxZS1b4Epplof8IAaqxv+rA8NAb7CDk8YXkV0o9TbBNC
 oe2Aed683+EIB3AoYdTfvAjzzVvCJZLmIPGek4fKA+exUtViDXIaeT5VesBASnbRR5t3
 pAKjXSlQ0I2NKmlIY5VXI2mYqGcDqdajfA9Ds/kP75+xRzos6ihAN5y6snXhDCcwX9Z9
 BNMfQ9ybTsHrGdYwQUmAXPZNZN/GNTdCv35/FOyFHs939vlG5VD8CM+eg2/Lsbvsds28
 vBh3AuxJV6YDFdW+/Ve2b/zeSHE28sya6wvFKfHAvnxF/+bSf/m54nuFdr4jb9CHrgiz
 /uLw==
X-Gm-Message-State: AOJu0YwOuU7NNCRsKlZP2kJv5qsQzJ2XMF6M5QFRPGX45cHnA57sRUON
 T2CIX5ST91RKGj9q6rtveo83jv5hPwKgHXAyIUlrpM7uAdq6LMe1aAYHBgXiad7/1OyrIzgLtIC
 NRj+81os=
X-Gm-Gg: ASbGncsiHGBz9USra6KkATPHmsPBUzb3L2QFU8lkEkydkV8zq1HWxXOQjL7JZ7aJLTd
 cdvYm8+CARW73GVnWEXtktkdEBrjzyVLnbVWfJs9L8uLFbipUXyjM2UxG6o6dFSad/ADKWEA48a
 tuhS91jLZORVkm/TZGDE/4461lzVdwMIy7LFDM/O+PkTQ8dnHu6ya2cYRwYQ1uCQNZW+Ofv0g9P
 njAiV+XZgFVtihVHmZCWuuhEGpJRr44bBH9dwYTvBlSzDZyMs1r28/3lYsftRrsUtpPYOI64GPL
 m2A8mIiZLHwLGuswdaHg9cbX5SzADyg7A2Q9TEyUL4+ime5ki1enEWJY98jeQMFB/YDlp7+QmEd
 PgTLExH550HfXN5xng1pgpwhtXTxdFJslkjRsKTVmXQlRkGpF7UVEn5WD
X-Google-Smtp-Source: AGHT+IGNMouz126EfZrFZHYQ9ECoVerxcHLDa8IZN7C0eBHvVpYyehNmb9eq5pwl6vA+EHOGQIUtlQ==
X-Received: by 2002:a05:6a21:33a1:b0:2f3:3e1b:de66 with SMTP id
 adf61e73a8af0-32b61b4cf04mr5552191637.7.1759511504121; 
 Fri, 03 Oct 2025 10:11:44 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:11:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 47/73] target/arm: Implement GCSB
Date: Fri,  3 Oct 2025 10:07:34 -0700
Message-ID: <20251003170800.997167-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 8 ++++++++
 target/arm/tcg/a64.decode      | 1 +
 2 files changed, 9 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b72aa968cd..38a1f51ed5 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2080,6 +2080,14 @@ static bool trans_ESB(DisasContext *s, arg_ESB *a)
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
index 2ae73f443a..01b1b3e38b 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -248,6 +248,7 @@ ERETA           1101011 0100 11111 00001 m:1 11111 11111 &reta  # ERETAA, ERETAB
     AUTIA1716   1101 0101 0000 0011 0010 0001 100 11111
     AUTIB1716   1101 0101 0000 0011 0010 0001 110 11111
     ESB         1101 0101 0000 0011 0010 0010 000 11111
+    GCSB        1101 0101 0000 0011 0010 0010 011 11111
     PACIAZ      1101 0101 0000 0011 0010 0011 000 11111
     PACIASP     1101 0101 0000 0011 0010 0011 001 11111
     PACIBZ      1101 0101 0000 0011 0010 0011 010 11111
-- 
2.43.0



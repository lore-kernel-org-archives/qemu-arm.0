Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2124CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:11:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cD1-00010E-JZ; Wed, 08 Oct 2025 18:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCe-0000BY-PK
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:10 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCK-0007Mt-Is
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:07 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-78af743c232so275385b3a.1
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960786; x=1760565586; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RgapaYKJCYI8THelUZOsiqX66vR02pQghFFIRA5mWDg=;
 b=GW0X7MZW1oi+o1DiiGVx9EN+RJj8sIw1nMijPOO+d6eCQkk091d9zr54Tveo0aHsMs
 WIYx6Kdx88LrEVEv++izOvW0yznzYpjyvDXR6se2I91P91bCqSN4a6hxkT9lBSkDELyb
 ZybmfxevZH3CkJq0TMQmaK5w636o4RB/ZU9p+hBEQHW2cjMFov9MhhLe7yRKYrUGQpf6
 SFzJUyxiqjRTC4NjgLmzfEJtqXi5MRX4qm5pxBJIclMsqQvwxY6qtPiX26Q/EfqyeNlQ
 EdNOcJD8jqAtOs9aGWYJxwCFuck/MKQmjmggqMOtsF9qO1JMf5rf6Sco44oJ6zaOFGbv
 YUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960786; x=1760565586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RgapaYKJCYI8THelUZOsiqX66vR02pQghFFIRA5mWDg=;
 b=jjtu716Gn9bPWdFyajRjtSjfAJn36Bf5ZvNSn6Vlof+pPkitwjfZnS6sVrZaauzUSs
 Dc+S2GtOuWpEP7VGLXvQkqSM+TQBl2eH/n99j+yRBYWnoUEMsSII43/7TWxPoj2IIoWp
 QhAr8M+XnM57ILbYIo7MIN5ksUYjg7dbHGsRXfb0xWjfA4NsE6uWiY28LMzzws6Nu8x3
 Vs2LEdtDz/NDQHOcfm9dgHY9693yU9wVBfjCE3CiCIBojsG2KuvQEM5g5zMW+N3X5ieu
 Od5w9VaJ4HJ5MWf+edAJ7UaY47kdubZQe+sYRkySRlkOQrI7rMFMV2eFwVSX6uhvSail
 40+g==
X-Gm-Message-State: AOJu0YyRV1oZoyIQElvPRkW2aeVI9Ld4KnfO6gU0yElZx/zV4Xdhf/8O
 GVKZZNsnfwcusyZPB/T7nLv8DG75aqMESncFNT7zqsr70K/tv6NqVOFCDxmuEnUKUlMZiHygpod
 T6ya7vnI=
X-Gm-Gg: ASbGncsdiZtptM4F/GDK1CE9LGm4akn+/eJVDScpeX0OEOO1CJrt04x0QEnTQptqc3g
 /cljxlBitUEm5IEW8DyePdV8D0mUnA+zSmH/6GN3TjgFusLM5KfqdGQ0DLs/QwycGeSJ7a0qZN8
 0JteCZlUTu1+/5G1vQuPvgiZkmpcOvRc1yXYWVyrYIb9AL35Ryn+L+mBTjZDePQFe3P8ooUsqxK
 uGnfHd2+cpYJMrypZXRI7LSl13+0dcWwi98rrOjBzI+Neb3hUwOXLyjL7V+oNbNyIUC9e9KK1Kc
 coDhYt3vBkkgfp6OL/XQQpCzvnMkgQUsis1+OpCua33zTggKGqAjXe0MmO3bf0/tb0z0y/UbkMq
 bQoR+aG5n7Q0BAFozDPIWo6niF+fUBUIkJXbr+5N604eNvafhdxMSt6jj
X-Google-Smtp-Source: AGHT+IGr9pJXJ7DRFUgrvSMpKbB+wHWn78PCwactkuSkOYrFWKhIt5CMqYw/s3bDk4N99nY/9WPs4Q==
X-Received: by 2002:a05:6a00:3926:b0:781:1e08:4459 with SMTP id
 d2e1a72fcca58-7938714695bmr7429591b3a.18.1759960785422; 
 Wed, 08 Oct 2025 14:59:45 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.14.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:59:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 47/73] target/arm: Implement GCSB
Date: Wed,  8 Oct 2025 14:55:47 -0700
Message-ID: <20251008215613.300150-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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



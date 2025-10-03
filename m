Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54A9CAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:35:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jKI-000539-GF; Fri, 03 Oct 2025 13:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jIa-0002jC-Ax
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:31 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGo-0006K6-V9
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:24 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-28e7cd6dbc0so29626915ad.0
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511311; x=1760116111; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7NeQIoj99iAZfd/3KOk94OKjFk/f2JYnnMqlRYW8/c8=;
 b=bH90aQDeDY93zRJ8ZadELizZFJzL1ZsaNcCyJ5yrd665w/hHZEAnl5ijyaTmUUW4iF
 qxU/MujV1wrXjt/xQOwtiQgSKrWgZ26MCjyV79cig3eiqk0t+POfDYd0wug3Zfwyg1um
 51qSa1lT/Paq6WRFP+I3CSI66FWsj6Chi3z9BMk0cMvgBCTCwFlkTx7pUC1UsF+tkilF
 WkGrcJx4ajlot6JtwIekcYhKatXw7rZ3TPQCdRtKlKsiLF7cgze2PR0R5z7kOCa/DeVh
 dKqofd4bEYLh/vvIRDtcgFF7cRkojobW2nIfxxYOUNATfYMgJaMUcdNwXWdddaql/Cj8
 IjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511311; x=1760116111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7NeQIoj99iAZfd/3KOk94OKjFk/f2JYnnMqlRYW8/c8=;
 b=m9XHVuodKxP5y1HHMBSEcQDR3p9x94H3LPI7GZXo9vEaQkTq75kFf0aUjMTkpzaOp2
 HvwWD6UC87lDEUhlPwyatYz82pV0nHX6UeO8zLhYQWfDRmGWb9j0nYbbiKkrU4elPhc7
 x0RxTz87adCRr3ounhGAZD0ZdlWgQ0Ep19anZA11nOdd8p9R87eG0j9TBT+IPZ4lP9Oj
 YGEkheoKaajwEGNA2Jx4w+IdBxZtmSy5YLxEK3JxvG0XSIc8h+CrwwrIvQDQmnDW1qTp
 e2jPHEpyw7voTVLLyNMtWYaKIjFhSmSJaWnm+OH1fS9LDpOdJ2mwyDzOnwZicjDwCk3+
 nZ3w==
X-Gm-Message-State: AOJu0YyHWnKr9jyTWCN1WmiDn+EFg5e7o83Cp1h8ybe0TOV1KQ9iVbKc
 friizgCkp85cmMomnPleZkuJEhm9Ay3nO+SHy80DArhq0kZXO6d8XMh8tKfFrdi8heCa9tRfwx/
 qTX7ibCA=
X-Gm-Gg: ASbGncuGRg/Xj8voR2+h0nxtW0KWAiLDfkY3lgC3o3zKkDm3G/brI2k1XFuzotv7RyZ
 g0qHDuBTZs0UqOxa/TM9J3Zb28Ui/WJf4yEc62aJCKIYvES83JMoZ+s8rilA3KEz3ybntPFiqzj
 hzQlzLC3Bhx/MiRqBtmBIhyM2lDbW/iiDdBf7R+LeSeSCQAJePmGxYrg7cpLCGRCCx9XvCFfFkw
 pv1NyO7ZVdgaIkoWdQI6RPVH6vyojzvTejfRTbveMtvxmrdLsP1uYvqYTM/hiG56QLKCkLPqzY7
 pENGFFcHX0fEkCwB5K+KPSTzsQ+W/LiIXeHysl8xrweoxVSJmzco6iYAuVZHs1WWS2tic35A+wU
 hxhNnrT80UjKOmVOTGrYzJov5jduaEQy0lQvRBoaVle56h/l8zntKrL8e
X-Google-Smtp-Source: AGHT+IHRtoswGqRf+lnn4HzY6xnnB9qvwZdn70hhyclPjclmq2pMzI7g22vTpPPXZ3Vni2VmyqwcJA==
X-Received: by 2002:a17:902:f64a:b0:277:3488:787e with SMTP id
 d9443c01a7336-28e9a565773mr53433615ad.12.1759511310719; 
 Fri, 03 Oct 2025 10:08:30 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 33/73] target/arm: Implement FEAT_CHK
Date: Fri,  3 Oct 2025 10:07:20 -0700
Message-ID: <20251003170800.997167-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

This feature contains only the CHKFEAT instruction.  It has
no ID enable, being back-allocated into the hint nop space.

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 14 ++++++++++++++
 docs/system/arm/emulation.rst  |  1 +
 target/arm/tcg/a64.decode      |  1 +
 3 files changed, 16 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 693eab1c01..78b2881a15 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2124,6 +2124,20 @@ static bool trans_AUTIBSP(DisasContext *s, arg_AUTIBSP *a)
     return true;
 }
 
+static bool trans_CHKFEAT(DisasContext *s, arg_CHKFEAT *a)
+{
+    uint64_t feat_en = 0;
+
+    if (s->gcs_en) {
+        feat_en |= 1 << 0;
+    }
+    if (feat_en) {
+        TCGv_i64 x16 = cpu_reg(s, 16);
+        tcg_gen_andi_i64(x16, x16, ~feat_en);
+    }
+    return true;
+}
+
 static bool trans_CLREX(DisasContext *s, arg_CLREX *a)
 {
     tcg_gen_movi_i64(cpu_exclusive_addr, -1);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 94a6192fa9..4b07af9eac 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -28,6 +28,7 @@ the following architecture extensions:
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
 - FEAT_CCIDX (Extended cache index)
+- FEAT_CHK (Check Feature Status)
 - FEAT_CMOW (Control for cache maintenance permission)
 - FEAT_CRC32 (CRC32 instructions)
 - FEAT_Crypto (Cryptographic Extension)
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 55ff6c504f..8283a9c83d 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -256,6 +256,7 @@ ERETA           1101011 0100 11111 00001 m:1 11111 11111 &reta  # ERETAA, ERETAB
     AUTIASP     1101 0101 0000 0011 0010 0011 101 11111
     AUTIBZ      1101 0101 0000 0011 0010 0011 110 11111
     AUTIBSP     1101 0101 0000 0011 0010 0011 111 11111
+    CHKFEAT     1101 0101 0000 0011 0010 0101 000 11111
   ]
   # The canonical NOP has CRm == op2 == 0, but all of the space
   # that isn't specifically allocated to an instruction must NOP
-- 
2.43.0



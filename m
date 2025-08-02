Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA198C87FDA
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:48:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLpO-00083s-D3; Sat, 02 Aug 2025 19:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLmf-0003DP-2k
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:37:02 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLmd-0005nP-EX
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:37:00 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-741b1fe0d48so61550a34.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177818; x=1754782618; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=17nAzkO3yEHAvK6PxJmaLfoSw+fDYNwVzEXoZ0CbSlE=;
 b=MP+EdUn3FiwqRuFPcIt9vfzqoI/1OLofvtnDwxuF+/d+g1MH+MLXqFC0lEIAUS/1DW
 O2d0X40iO73GduSV7wCARsRGQbSxi59u8f2+vcr4rwt5e9yd/nzBZiHaa6qcBX/pJ68D
 f9cF3kSr65cEp2xbUX7S6tn+J89B+r1sLFgb+smFd1DM8G7JQ2cyuYpy9MO/pTOwCKmy
 GjRBcgb+sslfSLxUGBxh6IFfCGXnPVoX6zokD7wliGrQ3I1vuKvyQy8d3xAa2A6LOAwr
 x0+AZ7rgU2Q9pxTmSae38jsIxXDZIkrzFZYBs+oRFAwmakGqpyeUEbGIKbM9bAyAT1dq
 RAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177818; x=1754782618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=17nAzkO3yEHAvK6PxJmaLfoSw+fDYNwVzEXoZ0CbSlE=;
 b=GZEiJTqZk4EVt3TgQDEh3jlY0PN3IsuVBzHLFnh/UfAMAMR1r6BkM658Ims65EaEzp
 CR3yvV3WaOudc4eO8UG+aTLHYCZtaVWxhKkzZ3lbQLiUSRohun7RQskrYZuy/MA5l8nT
 nZixc3RamuOu8AuqvhxnGGtuAsmAumKhAXZ+113psUpwwhGx9Bf7rCJp8shkALLG6bTJ
 t2ugI+X6cmxVsGDgESANBGo+g6ykmbKEdO2N4XfK2RanFZFL3JUHjdi6iBEZlCIUIo02
 uRKOwsSOBunfTxSlgnEOcnWuOvv88xniSxH/AhyS31IXdAghcxckVzn111h/vInTKV/P
 Hu+Q==
X-Gm-Message-State: AOJu0YzAetEpnMaXebzs6olI/BAfPOxerVa4Rul79aRoxQvcnXaeryoD
 VewnfhrfWdW5WcY2ruy1rT/oA329ecC5ntWr6kpkCcQGTTurMhXMbnJTN/jGT1qkaEjH5TfxJQB
 9PYR7eBQ=
X-Gm-Gg: ASbGncvo+O0SDHVJgjyPszoOq70mdQQRpKepVC1dSmaSAyOGiAR/T6vGVP9R+Mv1dsH
 KyA/SA1m9Gy7ZzFaHYaLOmk16ZO15SGYffFdrUFebU/vOSUJWnZlQh6EGakfgv38bVBuyCCFp9Z
 KhhDevgy4yPpLLNCFejv5+ZZlWvrpSqijBU3XzlMP6foJf/C/5E8PFy2y5m/5X+N3fMOo/34pDb
 nr9/sPLGzdthX4xKzM77EfTlubt81bF/GJ60BcXia99agN0ZGYow4wL06p41sKXx97av5mdZMEG
 TgJyML+Zhuixd5dxZBMaa/VGQqfUNTFV3YH+QQXvswicgsAg0LQmu0VnncQe4ULH+KiOuc2/xqF
 nfR6p1vOlpTVLeOGwBCwFD82eBmNN80wouPh1MQ84fDPAmvG/cMGz
X-Google-Smtp-Source: AGHT+IGNEoZQRBSkKLRdE+bqDlOwx7EMMpp1hV1yn3I20OGToewTUSmXvTjn8nwD5qqaHCPTjubGZQ==
X-Received: by 2002:a05:6830:4489:b0:741:b197:514b with SMTP id
 46e09a7af769-741b197596fmr191017a34.6.1754177818256; 
 Sat, 02 Aug 2025 16:36:58 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:36:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 49/85] target/arm: Implement FEAT_CHK
Date: Sun,  3 Aug 2025 09:29:17 +1000
Message-ID: <20250802232953.413294-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
index 7831b3dab3..34d22cac8a 100644
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
index 6ebf9c9ce9..b894aced89 100644
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
index 8c798cde2b..4315ed8dab 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -246,6 +246,7 @@ ERETA           1101011 0100 11111 00001 m:1 11111 11111 &reta  # ERETAA, ERETAB
     AUTIASP     1101 0101 0000 0011 0010 0011 101 11111
     AUTIBZ      1101 0101 0000 0011 0010 0011 110 11111
     AUTIBSP     1101 0101 0000 0011 0010 0011 111 11111
+    CHKFEAT     1101 0101 0000 0011 0010 0101 000 11111
   ]
   # The canonical NOP has CRm == op2 == 0, but all of the space
   # that isn't specifically allocated to an instruction must NOP
-- 
2.43.0



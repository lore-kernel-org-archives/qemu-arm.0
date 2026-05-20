Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03904CD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:23:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkZ7-0001SB-4w; Wed, 20 May 2026 13:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkYy-0001Lh-PP
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkYv-0001uJ-Mk
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:32 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-365eecc5885so4770484a91.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297508; x=1779902308; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eFuftV4ssvx9bSSs5jnFr2ka5o9L8dvlbwyKZe1RxvE=;
 b=kj8+x92AyOKbSJX2QXiHlCpo+7K5tO4XuM8Wtgzf4W1/6HBcR+wCoWrxJ++Ii9n/WN
 oSQXUDmXw7kQOcNrN7E+W/+GKxu30bp5MwXE6JCens5gAdIb7MLC5pMvgW4WG60Zz9nK
 cgIZ7GdrdKYe8uDT4qmj7ZzPnmNX8O3lPezvRSiZTNJQF7VCbsRcgh64KRu76HDMp8S6
 A/nSvKEEZRirO/ghuWzBOU+F12MDsHJBtWHFptEwu2NdDXupaBgatnHzlr9aXGE9YftD
 dLQb0dlZLbfmkhvedNDgUpZZo6RZAFBtwJDebVxRkYZaPxXdNokvIQxx7uVdV0YRAJ4D
 ftlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297508; x=1779902308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eFuftV4ssvx9bSSs5jnFr2ka5o9L8dvlbwyKZe1RxvE=;
 b=clSxZYiLlkhsdj0NFeeOmmOBStgizk+Sdw/f5cuSHo8gxA65mqPVghQ1Uz7Ivgj3cs
 kjeUF54HQcwpK6W0Ge9sjsP0HxR5NO+OQOMwSjAYYDGTpddsIH/afWRN+4FJjoW6Fo5x
 9QNP9ppqBeof9DIkK4BXOIUGPts6n09j1bmOhUaVPXGfI2sCBx6zjm8hOw7tJJwuW7v/
 Eu208Rq1D01o5NGj/Lh25NzMWzO8juAmSVuyaH05fsvf62jpvLxuVFYKfn4wALvaDinZ
 QTWMWptFiLI+P97iwHgDxFqf8gyQrP7lVfcfN5/MxZIrwK7YPebyXPsJTG2I2cciHTdv
 BcDA==
X-Gm-Message-State: AOJu0YzAJKMypn1JKPnHhxN0eA8ZupKC+1J/MGEnwam+yJUDeFF6Ur/V
 12YFkEbFy1KW303EPzePNnE+WdvX45q+Rnw1f9c34X96cRwe8CVLlkn90ecp/EFQnmw=
X-Gm-Gg: Acq92OHqdOorv3ucmNFy385ldyRf8UBpFVpKtG1DL22/elWePTDlZ09kAh3bh8ZTvhn
 /LhTzNGkYGgYg8253VRlOLDTqy5fmLB79P+4dtsWfDOYm3dWLD+FHfxgisZYPCSG6f+q0j7OMRT
 KtcMexNihNQYDDIY89o51Roiy2+RNb1nTTMTJAu7mT060qfQMMdUMtyK7G/rKjKoAGdj4Xz7aT8
 UQqvdQXbGYcfw2jzKF2x8/9P3KrwgYSYnnNvlowbhu3UAZAWb7Ecp3jlXwQPkRXWT4pzNuUXYRS
 O3zJ4VGO18cr9dcnW29f0qautok42i8tCP1TnfRGAmzQ1521tuUtfn0OHXT/byIknH+YdOji5tt
 Nt8lj3jnY9PQmHVjUoGhp+ao12lmVB9OpQhW4LB3fqn1XnraaRhXa1W3Xar7g1xWXuv+jp/Yh+d
 2sIGBk4YZgoGIduamG8ItfKCW6ZwBL
X-Received: by 2002:a17:90b:5385:b0:369:de03:29c8 with SMTP id
 98e67ed59e1d1-369de033084mr12519454a91.23.1779297508269; 
 Wed, 20 May 2026 10:18:28 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 09/30] target/alpha: Remove CONFIG_SOFTFLOAT_INLINE
Date: Wed, 20 May 2026 10:17:59 -0700
Message-ID: <20260520171820.848839-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Don't peek into float_status internals.
Fix the helper calls that were missing an argument.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index d2d1467a81..c66e3f9c14 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -34,7 +34,6 @@
 #undef  HELPER_H
 
 #undef ALPHA_DEBUG_DISAS
-#define CONFIG_SOFTFLOAT_INLINE
 
 #ifdef ALPHA_DEBUG_DISAS
 #  define LOG_DISAS(...) qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__)
@@ -578,15 +577,7 @@ static void gen_qual_roundmode(DisasContext *ctx, int fn11)
         break;
     }
 
-#if defined(CONFIG_SOFTFLOAT_INLINE)
-    /* ??? The "fpu/softfloat.h" interface is to call set_float_rounding_mode.
-       With CONFIG_SOFTFLOAT that expands to an out-of-line call that just
-       sets the one field.  */
-    tcg_gen_st8_i32(tmp, tcg_env,
-                    offsetof(CPUAlphaState, fp_status.float_rounding_mode));
-#else
-    gen_helper_setroundmode(tmp);
-#endif
+    gen_helper_setroundmode(tcg_env, tmp);
 }
 
 static void gen_qual_flushzero(DisasContext *ctx, int fn11)
@@ -609,12 +600,7 @@ static void gen_qual_flushzero(DisasContext *ctx, int fn11)
         tcg_gen_movi_i32(tmp, 1);
     }
 
-#if defined(CONFIG_SOFTFLOAT_INLINE)
-    tcg_gen_st8_i32(tmp, tcg_env,
-                    offsetof(CPUAlphaState, fp_status.flush_to_zero));
-#else
-    gen_helper_setflushzero(tmp);
-#endif
+    gen_helper_setflushzero(tcg_env, tmp);
 }
 
 static TCGv_i64 gen_ieee_input(DisasContext *ctx, int reg, int fn11, int is_cmp)
-- 
2.43.0



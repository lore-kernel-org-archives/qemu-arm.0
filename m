Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A73CD6E49
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 19:54:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT3Gl-0005a4-Ka; Fri, 29 May 2026 15:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3Gd-00055F-6b
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:15 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3Gb-0005bl-Hk
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:14 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7e634c4b74dso4711273a34.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 12:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780084391; x=1780689191; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uG643tu811i2RyupvUx8FjabEhHNQ3DPT6SS/v3k6L4=;
 b=shF0ZCjMF/RUPYZWlRTSU3loOArDiXc6+cKdxmQJGhjCnhd8YaGKV1rlLmXGHXOD8d
 IPgIMzIFGyuv6SBDbXleff7H6reCkX1KqUPKtqA7GQxGzIIwtwpK/ZE2ry8vQyZBYdkU
 P1wiZGa3JQWDdMvTOj9hssehT7F0jAbQgSS4bUfDOFbCehD9x8NrmK1CNva8Za56STuz
 D5y1EuKJM9H/1jGyc/vcbSnvCqbffV0PCZdG1lnC6RXy6aTOGB7qdstT5HJQLWFg/I9c
 QgORIIyOtC7A3GEneogkMGnSZuS90cou8nZgU5m8oaciXjuGCJ7YQCZw3n+ZDJ2ur7WR
 aWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084391; x=1780689191;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uG643tu811i2RyupvUx8FjabEhHNQ3DPT6SS/v3k6L4=;
 b=tXp7YR2qFYT2wd1ioc7DdVpVzhszzZmbLcgWupMFa2jo+H4n2WUQEoz/k5PGeSIjdJ
 isP9UmyWLIy6DJfsRTRHdNWlgk2wnNPgbLuNCzK7eNdz0oIUuDoAOgXz1pT8CcFq0M4G
 jpmJ35ykY0v8q+8xyHZwb8qsLsN/PaXMKgRaxfRXu37mXBpOicLmRR1NZ6oeGZB3vQFK
 8BgvF4kfmfio8xRbLMU2glnK+ZEofool9xYd27JcXbkVdpkcJPZwzyI5buk18HBotJU4
 CFJWD+l8yE98q5lBqYpCFiWQUE2wuDNKW3yNpI3oqwEBOCaJbzbGGyEbejmsKFl8pp9z
 4cSQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/fNccz5d0uFsdhlY1KW7yYKF68EvU7zhgQHCwsVBdfynmYjjKPXvoBBQYi7ZVanzQjJApwyWjlww==@nongnu.org
X-Gm-Message-State: AOJu0YxfcQ11Jk88K4f6ZJC+LNkcEMTsXW2gYQVwBk+bJv34IJVXvu+W
 3lZ25iepq3+Wq0Ghp/AwQxCF7gp9gM4W5fcJ6gih/vl2an0uYWWi5o1D7bHwNGcO
X-Gm-Gg: Acq92OHP4eDGlCmScRV07Jdx3wXDmtJv7BHjPytwyOXL2xph2LbJxZt3lXMDKFlk7H1
 hVtWmLF4Hs9PCPgB+LbnK2BTnCmOD0kJt08raH09ChejE/6FwflXBA0PHgxAokIz38lTO9xgCNn
 o7PZN9lhmUAv1kYMwTmaaPAhF7ixpfo0zXh+F7fHqcRRWHcGN/F2qfd2ezckMFMrmec1XcoYdPf
 Fi3TBLa/PeGcoejSSacQ3CpjdKKfGF4Pvm2o0Yim6gAZ2yiMAs26PEIRE/JvS7LBzmiqRlAL7Pt
 b3nlD5gcq+FxZ1eALxHVJmQjfMTmZZgi0wgB0+P5kJ6QPn+/8lMHvz5zazPXYxk2mUQmYD+kgZF
 PhVfxKP4Zl2DFPQI3yoLeD3ashbRLuLsPLHXLgTXW4qWJ3qm5viRi0Hbf6fbbg70POa5QA0Fj1l
 mL6HSpkpbW4hMwXkX2nwLgamwSlgkPa34MeUTC2y0FJKI=
X-Received: by 2002:a05:6820:810b:b0:696:637e:4831 with SMTP id
 006d021491bc7-69e104ac67cmr405920eaf.25.1780084391501; 
 Fri, 29 May 2026 12:53:11 -0700 (PDT)
Received: from [10.21.163.79] ([146.74.94.63])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69e06587eecsm1626692eaf.0.2026.05.29.12.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 12:53:11 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Fri, 29 May 2026 12:52:52 -0700
Subject: [PATCH v7 12/15] target/arm: tag is not a part of PAuth with MTX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-feat-mte4-v7-12-ccbd3c14eb3c@gmail.com>
References: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
In-Reply-To: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780084373; l=3172;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=YfgMyLN2bJKpX8wpLh8+0FfCnvekaoE0/S1YuNxPG7U=;
 b=A0P85TCMGJcble0rXA/UVw0J9v0XNAgIB9CJRTe5hezbtzui5iHWCnLSag53AJFD1y8BjFZkm
 8rKfAwhSV0oDa/P6/mT9a6JN2d8zxMaL8DR0/MUbqTMTo0X5O/vq5lC
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=brookmangabriel@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

As described in the section on MTX, tag bits should not be used to store
or compute the PAC when MTX is set. See also Authenticate(),
InsertPAC(), and Strip().

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h        | 12 +++++++++++-
 target/arm/tcg/pauth_helper.c | 18 +++++++++++++++++-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index d8f68270a1..359b495bbe 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1830,7 +1830,17 @@ static inline uint64_t pauth_ptr_mask(ARMVAParameters param)
     int bot_pac_bit = 64 - param.tsz;
     int top_pac_bit = 64 - 8 * param.tbi;
 
-    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
+    uint64_t mask = MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
+
+    /*
+     * If mtx is enabled, second nibble is not part of PAC. See
+     * InsertPAC().
+     */
+    if (param.mtx) {
+        mask &= ~MAKE_64BIT_MASK(56, 4);
+    }
+
+    return mask;
 }
 
 /* Add the cpreg definitions for debug related system registers */
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 67c0d59d9e..3d83ca4c3c 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -342,9 +342,16 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     }
 
     /* Build a pointer with known good extension bits.  */
-    top_bit = 64 - 8 * param.tbi;
+    top_bit = 64 - 8 * (param.tbi || param.mtx);
     bot_bit = 64 - param.tsz;
     ext_ptr = deposit64(ptr, bot_bit, top_bit - bot_bit, ext);
+    /*
+     * If mtx is active but not tbi, then the top 4 bits are replaced with the
+     * ext bit, while leaving bits 56-59 alone. See InsertPAC().
+     */
+    if (param.mtx && !param.tbi) {
+        ext_ptr = deposit64(ext_ptr, 60, 4, ext);
+    }
 
     pac = pauth_computepac(env, ext_ptr, modifier, *key);
 
@@ -377,6 +384,11 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     if (param.tbi) {
         ptr &= ~MAKE_64BIT_MASK(bot_bit, 55 - bot_bit + 1);
         pac &= MAKE_64BIT_MASK(bot_bit, 54 - bot_bit + 1);
+    } else if (param.mtx) {
+        ptr &= ~(MAKE_64BIT_MASK(60, 4) |
+                 MAKE_64BIT_MASK(bot_bit, 55 - bot_bit + 1));
+        pac &= MAKE_64BIT_MASK(60, 4) |
+               MAKE_64BIT_MASK(bot_bit, 54 - bot_bit + 1);
     } else {
         ptr &= MAKE_64BIT_MASK(0, bot_bit);
         pac &= ~(MAKE_64BIT_MASK(55, 1) | MAKE_64BIT_MASK(0, bot_bit));
@@ -424,6 +436,10 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     cmp_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit);
     cmp_mask &= ~MAKE_64BIT_MASK(55, 1);
 
+    if (param.mtx) {
+        cmp_mask &= ~MAKE_64BIT_MASK(56, 4);
+    }
+
     if (pauth_feature >= PauthFeat_2) {
         ARMPauthFeature fault_feature =
             is_combined ? PauthFeat_FPACCOMBINED : PauthFeat_FPAC;

-- 
2.54.0



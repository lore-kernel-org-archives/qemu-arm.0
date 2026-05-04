Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D31CD342F
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 15:52:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJva1-00012U-1h; Mon, 04 May 2026 11:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZx-00010y-PU
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:29 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZv-0006FQ-KB
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:28 -0400
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-50e5dbd8e0eso45988351cf.1
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 08:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777909886; x=1778514686; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KsGoT0ZY/Rv32gk7xNMn1j9Shl8qcLertbKSdgPbnPQ=;
 b=ZzuGG8ZDueG/nOzu4oiFxMeOz/814xHu/advCcwzfGjN7n6wexJW3RbA5O1AvIJGUn
 e4gcHZis2eB3qUV+wSUasFCVtIfcxiVktD9q2Ld7GVLdE1xPX2ahywL6ccThoOgEhBMr
 KeFMvCp7Pz0R9LvA68CJheqhT2kkbm+Wz3dCf6HAR2HmNDKTFnNsAK+JeG3CjzTz5VsG
 u1SmSK32oWinJpGikYcVQ0oS1JOw/f3W4M6xGAzsYTdf0kWgbcyEYtFUO5jH+q6Jf/IN
 WAbJCsOiKzHft2CmVJ92SvEdovM9Eb2bdvQDB6B52G98T7WA3dkOI0g7c2/Jx8qKSYgw
 0DHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777909886; x=1778514686;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KsGoT0ZY/Rv32gk7xNMn1j9Shl8qcLertbKSdgPbnPQ=;
 b=axWirxqC+CNs2B+52V2miORW4ubRrTeAEmDW89vNiRO7cRYV3cRDgN6zEw7RRhGvRj
 DfE8eVjDCSkadYKe8LUlZwiSPINVybRyBuwsJxNnezItseVpIU1vh0ekWBHnkrGj7grY
 lMK+o6heLHSLLiRYwTAjqfGTxM2i1ALH0785NLYjJxvChuEv78tsSs35qWzWvKCOcbmm
 kRUfNKu1dkMe7e4Jbx6CmFy/l/+LCR3OBJG8cLVEIJ1spbqlvQzNeVR+LQUYLCGoIy8R
 Bn8ZWFjQoFYjJFkcXTWn6vg8RyVYLQlFzkC5OUps9YWgVxOG9dXTh/gKyR4lDpR+W3MV
 7J0w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+QbMBTum3OJKhPdXXwNdyqzqdrij4maSYXtM9llUeweGvPBrhL47o9YTS6M4kB2u4o+HKVAyViNw==@nongnu.org
X-Gm-Message-State: AOJu0Yz1y1qWv99Lqf7XB9dGaBDvfG76RNQe4Du7rNbYNq1bUYkF9/AC
 33KcjYrlKsrbiYMvWA4Sw23YgqHZpvTjvoj0NjWqzQ5MAvTUBU2Zj/ty
X-Gm-Gg: AeBDies1l7nITwoT8hl8e+TATIF9dkyrEet1n7cNJ0BOGZwkwfTzAVxhvou+V8Q5gYa
 uMmogsXIAjNcOMgVICMyb/8mt6pn8X6KzWjnGKMU8H8W1WfrVMP3ETnPKOCcUH9/W/93wb20RWl
 zDWX552zNIiPTQyPOc/D7Nj3mJUa+Cee08DRPfwYhws1tIjLf8+8friOW7qe82mzgXoFVFNjsR6
 ij2QMVxw1CALO9CInehgov2h/FmxOQnR93sGoQyeFV7frbZ0PZX9ps9GH84K/awBhEkrtFSYHBp
 GO/z1x/BxVmqFY+aC8TZVMCQv4ZIJKkLcXCx3OdYnPPmzWk2W13KYnFp4KC0d19QZdokPa5T3DX
 zc5rRMQ5G86X55aB7/KhYQSOKs7rt7uAmebZS5kbACW6gWbdI2SK0ZGydEZARDR9SEVV9v4mk7K
 iRFhhZ5R8rfxE/6PTN5ZfEHOY4WwyeSOJE03Pd7/sn4LbglJ0obkQ=
X-Received: by 2002:ac8:7dce:0:b0:50b:1adf:89ba with SMTP id
 d75a77b69052e-5104bf74fd1mr150008201cf.40.1777909886538; 
 Mon, 04 May 2026 08:51:26 -0700 (PDT)
Received: from [192.168.1.164] ([2600:1009:a021:c665:5296:905f:3e4a:eb90])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51040931552sm99599011cf.12.2026.05.04.08.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 08:51:25 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 04 May 2026 11:50:45 -0400
Subject: [PATCH v5 12/15] target/arm: tag is not a part of PAuth with MTX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-feat-mte4-v5-12-232a648e63c6@gmail.com>
References: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
In-Reply-To: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777909867; l=3109;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=i7naSFKtsdz7oJ/mLAV3eXUKurGnggfA0UJX9vwXyVE=;
 b=beRiuMoGUh2trILB0UOertQUMc/zy6fknjcq7gSUZHgKun0WCnuuWwBVfNhaJW7+EirEeH2lY
 1/4idKjmpHAD3FtHMGyqprB+YkcsbXSUDzwf8gwybtQgDXPwEG13OfQ
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
---
 target/arm/internals.h        | 12 +++++++++++-
 target/arm/tcg/pauth_helper.c | 18 +++++++++++++++++-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index d313d36603..31b7e1c85e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1809,7 +1809,17 @@ static inline uint64_t pauth_ptr_mask(ARMVAParameters param)
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



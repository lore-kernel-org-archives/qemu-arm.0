Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F253CD5BAB
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:20:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkZF-0001as-W9; Wed, 20 May 2026 13:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ8-0001TS-JC
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:42 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ3-0001yZ-3L
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:42 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-36643b96b99so4823917a91.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297516; x=1779902316; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2TQZHGKVgc2bDrawkrfHaeofSO+VDdLDbwQhXEPuBw=;
 b=Hka0hQj2x7QktpB3K7gwYBg7OFJw8WzFkKwQ2Whcs9seU/5GWeyEW6whi+5m3yHHLv
 uKQiiUN5kM5J5xJvT/F2NJsJGrChOagrr8hsvldZEqmwTChPsqf7+9l0x/3aXCSyKm9p
 4oOLYLr4RgbxcadOL3SNz8IGp8gja/BIwP5195znQ0sX68pB6ekwRuF9vYftGmXMB4iQ
 UppM9DJkrhwf/Br3py99uY1wQ4V1xqaJUZQ8zPGvOJEFtR/5NebnqWALU799O/J3aGBU
 Ut2WiKnxiCQw7tqc3YukXw2CLTwYjVt5GhClQ6ovkv/j9cM/lHV90+CQwZe9gyoykoMV
 EUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297516; x=1779902316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W2TQZHGKVgc2bDrawkrfHaeofSO+VDdLDbwQhXEPuBw=;
 b=AsEgaqkNgoKrvg+BD6NOIpKVrohJ/wkfPazALAk2CkImRbsP21/c7eph2C9KsMtPpd
 aU0xqum3D3PU3/0maXvpVRc4O8YFIzcHeKm6dEq8XiHULTACsx4hoAmwwW7fpdVblOkf
 dlB3rZrx/ronIOGKad8KMmVP75VyJrA6WAgB5bmpMaLILg73w7WUpbxmsY5m93ImyaGW
 VQgz/GAAM5vsMdvJF33JQpUeJD+0uf6QOhaXRW5z8YRm1ZIMC8Srtl0JK0AbJ9LDYYvg
 1OZnCfib911BarwuUtD+y82QNTg2P3LSgzzH9KcodDIKV/EDrYk+Ciuvh7JWv+YAlN2R
 PySw==
X-Gm-Message-State: AOJu0Ywl8jOp2Z7buMh5oCHDbBo7ros5gcUUgh4W8mA7Roo5xL1ukOsM
 2i8LQ2gtGTcDusfL+a+XJ3p6g8fj00kFvTbsnZJw2/rVGEcqOIjolaqfxAjW+wZA6iGlU/AeCKz
 jGJJwe/8=
X-Gm-Gg: Acq92OF7b5cDBaZgPn42BaFIqg2xvF46sCIXEyCICLE73w+nUVtxx91o+lapzImd/Ol
 KzWDgLaEeBVaItKYS0qoSUgypd92D36/y1GvzkzDfsjmvQuTFPKkvsCAFvbeU/5dzzM4ndxwcTa
 q6Zf2gibYTycZSCXhnrmoHC42K0cx2baPV9JFhmkLCnnAIDCWO8Zb7kEzInDWPOvSBLHtI3ceto
 xOQwqRev3NQHcjED0jyl4sOJML0H2MvPsYALaHQNxkub5BJN3EiBZZCMUubzRxznkk3yXMpQEcP
 NWZNZnUnrsCR1BxvmiG0hrAuP7F0HMrxKHCHB3YG7EKFBZD3UjoOyGop0BDzxxnh9byPazlsLlB
 pwsTcju79HiilCnHdllDzSCEr+Z1Kl43MxEcIcQ16yAz2Y+QqO7qlXyENu6rNWOUHDNs8E29a+1
 FO/sgnZlq1US47SW4pHwmB5HvsVP6EpeSehbgAPhk=
X-Received: by 2002:a17:90b:560b:b0:369:f48a:f245 with SMTP id
 98e67ed59e1d1-369f48af48emr9846534a91.4.1779297515713; 
 Wed, 20 May 2026 10:18:35 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 19/30] fpu: Use get_float_infzeronan_rule in
 partsN_pick_nan_muladd
Date: Wed, 20 May 2026 10:18:09 -0700
Message-ID: <20260520171820.848839-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Deduplicate the uses to a local variable.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-parts.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 7781e16122..1e92251761 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -122,14 +122,14 @@ static FloatPartsN partsN(pick_nan_muladd)(const FloatPartsN *a,
 {
     bool infzero = (ab_mask == float_cmask_infzero);
     bool have_snan = (abc_mask & float_cmask_snan);
+    FloatInfZeroNaNRule izn_rule = get_float_infzeronan_rule(s);
     const FloatPartsN *ret;
 
     if (unlikely(have_snan)) {
         float_raise(float_flag_invalid | float_flag_invalid_snan, s);
     }
 
-    if (infzero &&
-        !(s->float_infzeronan_rule & float_infzeronan_suppress_invalid)) {
+    if (infzero && !(izn_rule & float_infzeronan_suppress_invalid)) {
         /* This is (0 * inf) + NaN or (inf * 0) + NaN */
         float_raise(float_flag_invalid | float_flag_invalid_imz, s);
     }
@@ -147,7 +147,7 @@ static FloatPartsN partsN(pick_nan_muladd)(const FloatPartsN *a,
          * Inf * 0 + NaN -- some implementations return the
          * default NaN here, and some return the input NaN.
          */
-        switch (s->float_infzeronan_rule & ~float_infzeronan_suppress_invalid) {
+        switch (izn_rule & ~float_infzeronan_suppress_invalid) {
         case float_infzeronan_dnan_never:
             break;
         case float_infzeronan_dnan_always:
-- 
2.43.0



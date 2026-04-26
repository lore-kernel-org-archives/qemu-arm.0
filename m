Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D774FF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:48:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzit-0006xu-Am; Sun, 26 Apr 2026 09:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzil-0006tS-A2
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:28 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzih-0008JO-9a
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:25 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2b2589c26e3so87795435ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210822; x=1777815622; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9KAbrnKtdB2obY97v0/ml9qt9upYXt9w/FfYgYu/A0Y=;
 b=UdJJGtWA2UHep/T01rHJHUfx602TN0eQvhNyv6uKYiAMMveN3E+I7XHSlY2nktnPvY
 T/zw0B8R1EHmz5ehZhigBfQYtTKdwB6HRaDt3wi2hf5lHXxWUDQTldKYj9f6eti/wCqg
 CnziWP6Yr8maO+aFbTCt258eYZiOuGjn+JMczUPQS6/8o1jYu5sPIc8BDJp/gW1M8mEd
 r/umj8dU4G5p6z2Nb2zXzN3EDdbnd2YkqZH+lhfq6IBMviyQ1XVVR2S2BVMCke76jE1+
 HQF3QKN2jilok/Qb6dsKpMjOPyJYy5H+1YJlasbGvVQWl8L/sbKLwQR/1JXY4vTeU84f
 71gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210822; x=1777815622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9KAbrnKtdB2obY97v0/ml9qt9upYXt9w/FfYgYu/A0Y=;
 b=BBrA2nsGrhvoVILQ595LKIxkilEUqy3R81P9mAGLk40iOJQykvm4e863I4JKFFgCat
 LZJQ4mqemTKqQKAu726orXs1iqbI32eUfx2jtf7wJ4MEUqiMq/oJYDharv4zkz68Ni8x
 nIogkat4VuT4dpbXJ2lH8uq1Wf247uq54Bbjx7j1WzjjB30g46DHptSUk6p7LEVzeLgK
 yuiTf4gTE90ydTqQEGi/ofdAW2ebREEPjs4y90uR7lmNb90Rwf/s/BFRFQZAVIADXuJa
 h5a05wWynA7JdXS9xWV+N5Q9Hf442AVLmctvE115dy8Ne/48wkAArSMXa3u3f9NuP2pk
 n5tQ==
X-Gm-Message-State: AOJu0Ywqi12xSSPvHyPPcp89gn0VpMEMV/IFCt1dLX6yos2jW8hUKcPu
 cKFk3+EQG8h0kjvEispnzxjz5v136mUdLCHpsi/FnGmel0Uf65nQ/Rz3AJ9Kni7l8Z4=
X-Gm-Gg: AeBDiev1jpGBngc2woA8VCNa9pjdfa+t+qf94L82C2txRCkFkFBvtPUBoVGADXyZ4T/
 bENlvCdZPYXOesZESmKfC4J4Eqnp5G0n9uNP0xUBEhLKUyyK52R48p0bn7uT6fHQUgHgLgIhR1M
 OkcdRmztcSpfzgTBF7lY2JhXzXLoF8XaaT70daPsF9FvXyrjxT13yCJ3VNHmpeqmQo4+qIDXSL8
 DQEhKMihxvoStOvSjNlXBnSASM3RPeQ51SeUCw2RLwVhEsxjGMJ0xmY13xwqD0AsuAZoTQExN1i
 xktQiZ/sr1bLi0xgvHraqxxXCmhnEdux9n69c6VrR12iDXOMIecuRD0ss24vQBGGYO5kek8/rAk
 Q69Wx5SRf6y+QS7Zy5PGlvBvVRxyxkZxPHkpiHVGN3FJKJ5LvFNbZsg85waKx2wt08tqkZCB/zz
 H3pIf0IEI9yZ18XPBTn1vo+LS7ChbWJ2bBFK8Adcyq
X-Received: by 2002:a17:903:328b:b0:2b2:4bf9:1766 with SMTP id
 d9443c01a7336-2b5f9fe5d26mr312490405ad.33.1777210821683; 
 Sun, 26 Apr 2026 06:40:21 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:40:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 05/84] fpu: Drop parts_silence_nan
Date: Sun, 26 Apr 2026 23:38:42 +1000
Message-ID: <20260426134002.865628-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Use parts{64,128}_silence_nan at each call site.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 12 +++++-------
 fpu/softfloat-parts.c.inc |  6 +++---
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 76c1d4e38a..571b5f09f3 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -779,8 +779,6 @@ static float128 QEMU_FLATTEN float128_pack_raw(const FloatParts128 *p)
                   FloatParts128 *: parts128_##NAME, \
                   FloatParts256 *: parts256_##NAME)
 
-#define parts_silence_nan(P, S)    PARTS_GENERIC_64_128(silence_nan, P)(P, S)
-
 static void parts64_return_nan(FloatParts64 *a, float_status *s);
 static void parts128_return_nan(FloatParts128 *a, float_status *s);
 
@@ -5034,7 +5032,7 @@ float16 float16_silence_nan(float16 a, float_status *status)
 
     float16_unpack_raw(&p, a);
     p.frac <<= float16_params.frac_shift;
-    parts_silence_nan(&p, status);
+    parts64_silence_nan(&p, status);
     p.frac >>= float16_params.frac_shift;
     return float16_pack_raw(&p);
 }
@@ -5045,7 +5043,7 @@ float32 float32_silence_nan(float32 a, float_status *status)
 
     float32_unpack_raw(&p, a);
     p.frac <<= float32_params.frac_shift;
-    parts_silence_nan(&p, status);
+    parts64_silence_nan(&p, status);
     p.frac >>= float32_params.frac_shift;
     return float32_pack_raw(&p);
 }
@@ -5056,7 +5054,7 @@ float64 float64_silence_nan(float64 a, float_status *status)
 
     float64_unpack_raw(&p, a);
     p.frac <<= float64_params.frac_shift;
-    parts_silence_nan(&p, status);
+    parts64_silence_nan(&p, status);
     p.frac >>= float64_params.frac_shift;
     return float64_pack_raw(&p);
 }
@@ -5067,7 +5065,7 @@ bfloat16 bfloat16_silence_nan(bfloat16 a, float_status *status)
 
     bfloat16_unpack_raw(&p, a);
     p.frac <<= bfloat16_params.frac_shift;
-    parts_silence_nan(&p, status);
+    parts64_silence_nan(&p, status);
     p.frac >>= bfloat16_params.frac_shift;
     return bfloat16_pack_raw(&p);
 }
@@ -5078,7 +5076,7 @@ float128 float128_silence_nan(float128 a, float_status *status)
 
     float128_unpack_raw(&p, a);
     frac_shl(&p, float128_params.frac_shift);
-    parts_silence_nan(&p, status);
+    parts128_silence_nan(&p, status);
     frac_shr(&p, float128_params.frac_shift);
     return float128_pack_raw(&p);
 }
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 37ce731101..0d4a63fbff 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -23,7 +23,7 @@ static void partsN(return_nan)(FloatPartsN *a, float_status *s)
         if (s->default_nan_mode) {
             partsN(default_nan)(a, s);
         } else {
-            parts_silence_nan(a, s);
+            partsN(silence_nan)(a, s);
         }
         break;
     case float_class_qnan:
@@ -109,7 +109,7 @@ static FloatPartsN *partsN(pick_nan)(FloatPartsN *a, FloatPartsN *b,
     }
 
     if (is_snan(ret->cls)) {
-        parts_silence_nan(ret, s);
+        partsN(silence_nan)(ret, s);
     }
     return ret;
 }
@@ -179,7 +179,7 @@ static FloatPartsN *partsN(pick_nan_muladd)(FloatPartsN *a, FloatPartsN *b,
     }
 
     if (is_snan(ret->cls)) {
-        parts_silence_nan(ret, s);
+        partsN(silence_nan)(ret, s);
     }
     return ret;
 
-- 
2.43.0



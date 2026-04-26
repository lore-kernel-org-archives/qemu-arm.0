Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64049FF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:51:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzpH-0006z8-Qt; Sun, 26 Apr 2026 09:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznv-0005ru-KX
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:49 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznr-0001R1-5Y
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:46 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-36146ae9dd4so7704578a91.3
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211140; x=1777815940; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ITXVWTswHK0ITcm+gabq4ujW8XFmcTy1jBekq3ZfSNY=;
 b=vHZTGL+digeFM3tEYqXhI9LY/6eqyVwsM59CKQRQoONwMQ7AP0VUQqdZxTXgEPDPY1
 ME9bDy63Xxx94FKss2hTcxasiZV0scYRE9I5FDKdoMiCbJBzHO6rDDFrcbz3zCM++V9M
 wpWVMjUMnBEbZjFrv8IqXQ9hO+zobQIIJ1vWRCagpkOsuwIhrWOCZd3bIRifWux0+6Jq
 xE9fPYjJxuJ50gtCVkDLmcdfGqIgOSfLco7ex1nuDSrmFtduoeRVjzIwxJqVjUqD9rAZ
 h4NBVObU1LuYDoUpiWboCNew1AvH5ytaKJalXaqe2XOqUObPeNIEDVpVp3W4GWKveH9Z
 D1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211140; x=1777815940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ITXVWTswHK0ITcm+gabq4ujW8XFmcTy1jBekq3ZfSNY=;
 b=sseZKM5TGJ5HRSEa1rHp9K98nXLfRYstnyPQ8VZRJYiNisIlDgyEYKoS+oaa/YwCkY
 aGEFSEwQDsEOcc21HHhxtHIQ7nc6Odk3oBj6K/Ypv0Y1wKfTskS2TwvC2M0OWgKGcxmf
 RONRRsJXFLqoysCPAE8dHG/uziMDA6TxSur7Tdn+/tn/cGKm+Z1A74EhvJ4rbaro4zxn
 K8GZMQBhqGNixP6TiQwv8HjTz7XXXb7dnLRZ9qLKN3mzjx/DMYSzGTR7435mb5CEyhlb
 8W8XZbAT5im7v4MxwctnBWkTlf01lzbFKxNclgZ9ypuKBJDsfNxkg4oS1p7L1qk8QvYc
 M0jw==
X-Gm-Message-State: AOJu0YyPkY2Eq/j9z7HQosgNx2Ld69Vgm8SXyejojeWHM0xW1YE+dFcz
 lzd/BS7i8Iti0EZAoIlrfnhFV2ZEdHHkKvikZnI8eNr8lr6bMtONb122WA7fuY2K7G0=
X-Gm-Gg: AeBDiesxFh/17j4dA1coTlOG4VZ350f5Fcj0kxaaGxC3vm9E7RuSz2+JXkeFlxbnasP
 xNo8hhi1LNj4IG2Kah9s0Sw0a5UfID47nJmmWh1OwQb2CVyGDLm3fwP14WcAi0jVk1LQ4jBQxnC
 R19nOKeZc/0FlYXBGqGIXk1f6slsOs3ABh3kzum+Ushpr0veo9suk45hZikZNwtHz7TqYIftd47
 +cm9ry3jOtggBZRqPP98ZhklApUhkbp5ITWN/8P4F6K95abChUQqYjUhtMq0EPwc+fuaZMqG2K3
 rjTISJb2L2EuTJWMtDNjcppjp0FteJnLeLVAEyldwDPMMVO0MfmIo0AdJtwi8+xM5LznSIVroL3
 gaaaW/VyfrT4FUrXW4amQLQ+Wfx5WDneBlj6rfjCB08os9CyN4BVzKsiuDgZiKGTaKMd1frN4qF
 fXvmvZ3iq/vSVX+/0zIUk9H6QNoCTp4tWaxy8V2b2U
X-Received: by 2002:a17:903:3c24:b0:2b7:a3bf:b2a0 with SMTP id
 d9443c01a7336-2b7a3bfb415mr161832115ad.5.1777211140195; 
 Sun, 26 Apr 2026 06:45:40 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:45:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 55/84] fpu: Mark unpack_raw64 QEMU_ALWAYS_INLINE
Date: Sun, 26 Apr 2026 23:39:32 +1000
Message-ID: <20260426134002.865628-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

This is almost always used with a constant FloatFmt,
so inlining pulls the constants into the shifts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 302612fe42..63697ab3db 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -633,7 +633,8 @@ static const FloatFmt floatx80_params[3] = {
 };
 
 /* Unpack a float to parts, but do not canonicalize.  */
-static FloatParts64 unpack_raw64(const FloatFmt *fmt, uint64_t raw)
+static inline QEMU_ALWAYS_INLINE
+FloatParts64 unpack_raw64(const FloatFmt *fmt, uint64_t raw)
 {
     const int f_size = fmt->frac_size;
     const int e_size = fmt->exp_size;
-- 
2.43.0



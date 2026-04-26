Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CED2FF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:51:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzpa-0008TO-Vx; Sun, 26 Apr 2026 09:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzo8-0005uV-U4
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:03 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznv-0001Rm-Fk
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:49 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-3590042fa8eso7175567a91.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211143; x=1777815943; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=naCDYMEynTNqx6TFzJKNSAiBh0vvryTyWBIKKZOB+4U=;
 b=RSEwYdXw0E+K97rtUu3Ud9GFV8R/KkrKWm1oqQTWg5AIHbNAyB8YQ+VRpdsvHR34SA
 +DYE2UN3gVeM7uuhu7xA6FA4XyDKSEu1RgIW9yRCDTS7jnasqBOw8IdiKHDhLXXQ1Dsw
 O7/1zzAWXNTOT/8Dif47JgytWFRekjdIZo2H6TlnI6rA3mKTI850fJuY7MOzn1MBnszq
 tMCjywZSWiCF8R9PddCfIRtfIPs4lKmjc7PyFlL5HbmPD11E3TlL7Qct2QwL9haZNxVQ
 uJKQR072957jkk9cK4LbkAIMpiSosAeLKTn0P4P1yCTLYnyXdsf9AHJikgc0EW30IrRm
 MgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211143; x=1777815943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=naCDYMEynTNqx6TFzJKNSAiBh0vvryTyWBIKKZOB+4U=;
 b=ofrTZSuNZx4mZyAUyhJ5CVJFCdHWalyyN/HOL6lTR5wQaKjxJF1+nCng/0po2cYzSs
 dA3yrsbdsVezQFnZnHF/bCojmSgACb08dR01LxzM6r0Ptq2Eqbl1z7TWCYhO0Zu+rQdD
 e4M2bGbXqJtnVhlzRUxIqKtPkF6mHsFUL8ZrtV0XH+366+WDL2uy6ujF2kcfFMywUxIF
 K35WVekL7qQgbLMecWhBOnpkdX2fB7XKz2L8fQy5VKMoQEL5qgb900Oc7FRMA6uIhjnC
 J6GbUWgOpZhQTZUP7E6LxypuAMPvbbxwRwJpl/rK/vKTvA32LojsjBXCr1wReISrzuv6
 sQrQ==
X-Gm-Message-State: AOJu0Yx+A8fMnZ1fOecBKqZDxgsCJ8zfB8cml8duA5wTEDk4ebedUi6A
 K6WWlaPneb6jQlDopujJksV5CrVgnX08qffjqqVt8VjvB9OhB8h1Y5cFOK5K6IvEaO5uj/RFtxq
 3SKEiFOQ=
X-Gm-Gg: AeBDiesim4AEIizh61DXfkVgt4d2Ae5PuThWqVj6PKHrn2drEy34UZQyScUYy1gVslE
 N3cf/PNxo2j+TIyjk9qCFOCv7CQ7sN9U+9JHD83sp7nwByKaNrL3lvn5hy7ZYmGE2UDXXeISc/t
 Z1IoKTQLE1ZL3CbGybBBU0KMPsRkGc6L+XPcT5No477KEeULPqnr/FNJ9BExTbDA8Muz3unkoU3
 NcJFksK2yEBsZTQ/ARcfUVxkaadiTX/x8HfeW8qbi2smyHgKtsYRUVmSY2TuivaXfst5yE4+Pcl
 ky9+KkSBhAzsnEJA/lDCS0736BeY8lBbG7fiKgGPU/qv1mVDiWPF/rw+8swEwGDhWY8MY2kCUXg
 tLJY/cRr4qwNtJeEB6DOzE0ntWOoVL3FzL1V95YUIFKTo8OOjYwog1qoZ9/Y53wQ7uEdZ5wzLxS
 WAZcv6mMpeqkVeaz3P0hMNtNjgBxjNks7QgG0j/gZH
X-Received: by 2002:a17:90b:4b49:b0:35d:9560:3f09 with SMTP id
 98e67ed59e1d1-361404b8efbmr39132299a91.24.1777211143094; 
 Sun, 26 Apr 2026 06:45:43 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:45:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 56/84] fpu: Mark pack_raw64 QEMU_ALWAYS_INLINE
Date: Sun, 26 Apr 2026 23:39:33 +1000
Message-ID: <20260426134002.865628-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
index 63697ab3db..8c4263bfe6 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -662,7 +662,8 @@ static FloatParts128 float128_unpack_raw(float128 f)
 }
 
 /* Pack a float from parts, but do not canonicalize.  */
-static uint64_t pack_raw64(const FloatParts64 *p, const FloatFmt *fmt)
+static inline uint64_t QEMU_ALWAYS_INLINE
+pack_raw64(const FloatParts64 *p, const FloatFmt *fmt)
 {
     const int f_size = fmt->frac_size;
     const int e_size = fmt->exp_size;
-- 
2.43.0



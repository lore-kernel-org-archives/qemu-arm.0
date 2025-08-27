Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEE8CA0FED
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:23:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4ja-0005j8-6J; Tue, 26 Aug 2025 21:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hl-0001b3-3J
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:12:02 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4ha-0000GO-2S
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:58 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-77201f3d389so1001135b3a.2
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257108; x=1756861908; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EAlJuQ7umZPgZ8d9w9IJxtJ1nYI4tOr6crCLs15bTxQ=;
 b=cwfon6RR3Tbgb44niFr5ZMJdkSzBZ25PIMQ4+p4/OwhgIVjQC5HLKJphfKEYSloO9H
 AgKqequRgHfRD8tb5rHIZgUlDThdr4XoMvqr6ZKH0UsMz19DXju3UxXbtaTMegxxOQ3/
 mUJ99i8ETV4mdMMRTDlYNoBG18IzeBR54g4J8kaiIvfj3h+Mjsk1tIw+sZATA4/cneH0
 Z3ij7p0PJuYaVWauOQVCBeHP+QZkWYLKcFdi7SW2Mc1L6pX2SbRTubPik314RS7zm8LT
 XMD/Nu6v9wNZEkyK6PwRZcQgZO6JlQE2mr3TwpfXWHQtjIam/Hk9SNIvMjpTVSLtY2NB
 bDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257108; x=1756861908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EAlJuQ7umZPgZ8d9w9IJxtJ1nYI4tOr6crCLs15bTxQ=;
 b=EW2lOYUu+ge21F9DFGAs6XQ8AbhbIQBNGlsH9gW7+WqFmJxGcc665Xr3lioexrdgQ+
 cA0b5kFQmcRcAG8pK+jYn2kYXV9sbtxmJ4xwOzwBXzD+c7lvqwfEXjwcPndbxHSnckzX
 dSXDegYM4C6DN5feUg63Du6w+ulYtqD0bRm8+DdYKwFzYIEEWour2RgTif0IMnF3oq43
 8Q0YAQ7iuTA7i2iNhBVz/p2btY42+FyDkx6Y9uIJbkUZ2Pbb9vhjndmSbWLRs6/6DXzF
 ECY5eJPmpb296QYZXRT1ZnCLpwE2/qOiWFvERadM90Gi3/AfTgMtswTD2JuUVYtdEQhQ
 LUBA==
X-Gm-Message-State: AOJu0YxSqZkLMiYdYu5/bHAyP1Y97dKb54GZZo13GzwVDicimz7h+mlA
 mKBxXPMLRJ1QnLtKICb9+0nZx+3lDRhozu6Cy1lfVF6CW6m/OXxAPzanWX/Gp/qE3g7yF8LkcfW
 sxQJxQIg=
X-Gm-Gg: ASbGncsK2aNZKYg86qZULIPqCbdXNpAxkIuLyuzql5U4fXD5RU67QpDmQ3IuoRELpQR
 wzVfMpR0y9S5J1SQIXMZjEA1SHXN76b1Ypll/kNmxKsR76rL62MdEbynUTOX35cDE6ZMiLhBouE
 9TktMylvogFChdSm66IRombngLfoMvKaLfKI/yJun5rhAk4g3eUbo6/oUrFx97IzIPnr7OoaN/v
 L2FNIcdUxSKd8hhWuxFbpC2vXQrfqMsBTe4IHz9Cf2hIKGHIQ5W6lJF4TxeDpxa88GhTQd8KA9I
 0Cw1tIVLejAIrRnjySRaZ4DrONu9eAk3SX90YEbkcRWDw9jX6gNK6Gl6jDaZbFs5rAnuUG4H7s3
 YZVT1gPHdvRW7hLRxRd+3I1AfFk2xUppuMHkb
X-Google-Smtp-Source: AGHT+IFGPXbvstPDAZ/vjeoAnKKRWixgFQA5cRSsggDoL755/mC+3ErSJJ7zTGg6vdJM1sMZvzLa+Q==
X-Received: by 2002:a05:6a00:13a6:b0:771:e4c6:10cc with SMTP id
 d2e1a72fcca58-771e4c6143bmr13477411b3a.6.1756257108275; 
 Tue, 26 Aug 2025 18:11:48 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 52/61] include/qemu/compiler: Introduce HOST_ENDIAN_FIELDS
Date: Wed, 27 Aug 2025 11:04:43 +1000
Message-ID: <20250827010453.4059782-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/compiler.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 1c2b673c05..4b9a8ff419 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -9,6 +9,17 @@
 
 #define HOST_BIG_ENDIAN (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
 
+/*
+ * Place two fields, LO, HI, in the order that corresponds to
+ * the host-endian ordering.  To be used when the pair will be
+ * visible through a union with a larger type.
+ */
+#if HOST_BIG_ENDIAN
+#define HOST_ENDIAN_FIELDS(LO, HI)  HI, LO
+#else
+#define HOST_ENDIAN_FIELDS(LO, HI)  LO, HI
+#endif
+
 /* HOST_LONG_BITS is the size of a native pointer in bits. */
 #define HOST_LONG_BITS (__SIZEOF_POINTER__ * 8)
 
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A94DCCD185
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 13:46:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7DQH-0002uG-PG; Fri, 10 Oct 2025 09:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DPw-0002f4-MP
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:44:23 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DP3-0008DE-EU
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:44:20 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46e491a5b96so11497175e9.2
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 06:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760103798; x=1760708598; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fQ1xy8T+SXo1JHTBucWTk/aOP1Ac+xvM/ygDmheTPxE=;
 b=m5w//XjQlm2YmAwHdnjSLtZZfmwSjmFXltxEjVwfgPnIQT6t1sSdvSd0153IH4PbQZ
 p+pgGHBwvTHT191v2USp9WK78d/ObrCRCoGc34LXVSOn2ukW4BRhe+0ORKRmxYOxy60Q
 kdAFjCsICKQFjLqsCLY7E6wQQtTCnkGOjwrhH09CCIZkSirHQiU3ttRz+Ax5li4eXJ+i
 jLHtPvBqCvFrkYGTqBo7KDkPh/yVYWUSwq78cI1TW/dZPRQP4ZBrzq4a7FdW8vNUwT2H
 0WWxix/q0b1e9zaZhOq7mvg+zNdX7RWiZTP3X+OtLMIH+eQrKf8ZGCb057un/SUeWkt2
 ih9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103798; x=1760708598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fQ1xy8T+SXo1JHTBucWTk/aOP1Ac+xvM/ygDmheTPxE=;
 b=bCXn/JxeDRo9gRjWRfSrLb9+QwPFgy4b32kOdz9lqjhHp/C7DXolKYOckCO6dooUY4
 qi4h96k5U8aBgsBfZ3sBI792nplIPERDyH8ThiqGz5cLlxBOusA7QQmsmiimYt70Z/mD
 yo0ubb9InGHiSGZNJjLQhd29Bsriv7uKYGB8qxq/Rful9z7FUlAk0iLvVQqkBquP9ymR
 U6km0aFNb9tNHE2/Dx/1cGlX+TZN+Hm/eeAx9B10fi2DhZCOe9moFKr4Ng+0N8yR8vzn
 9vINWi/Cx52bgqhapOYXUXT7hFjBrw+Du8NfFvkWiVSZXTz7B1xUNPFUhvryP0YvASUB
 53sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTxMjdumhV0dLhlRxgoQIDFSdFr1jrE46fHMd3vD3t8HFewOBKvF0lO6mAJF/EIm9oEVxS+kgs0w==@nongnu.org
X-Gm-Message-State: AOJu0YzeGs20+w21FVifVO1ulqS6jdHK4KnrlX02PpP4TC2d1ZbK89y3
 r6CGA/idYoH818UFBeAHUjCay1da7gaoU21dYwnBpBoAt3KVlvApgdAIV415nJDINI4=
X-Gm-Gg: ASbGncvkveh1S6SloJiY0ZOA89vFyv4w1km3WKgYhdNtPaoK3OjsVCiZaJMhRTMHekG
 8960WmEDgqBuItQqv09t29D8QPWT45YP74jZQfCF7wHy9BRx3ffCyZ88Gbo/1y/XwahkIyvCJCJ
 wU//Jk971sWipTDhJCpBfX46KbLSzttPPyN4JrJFMRmE3hxPW4sTH8Mh6//SW3VZDPiarnVr7sn
 TAbZLXNnzRNfuza0iz7b4EJruOCQv7IgeiBrcVCbcMBQX0e+QKiDjkhsxAsG5nVQPUyzEIDVpRr
 3/ghnTplYQCRSov9mLKYpjrA3cophQlnwzPwv42zm4zwnAQ3k3UXEPUpnjhVsIWNQcr/FkWayQi
 U+n/zwGO1fvTO4wIhf45m1EiXOQYpHMmMk0wehJYZLZGs2mHR5Su5bANVN4UZf9hvY+ovBuFZle
 RGvUMApB3X7Q4l3jIDZgfqA+HHj7Dj7w==
X-Google-Smtp-Source: AGHT+IFIPOzsMbnQa1BO9UiaMqXHUl6fRwbyBMETY9o6Uiq0UhksFIKSO4ECCTsdlFGZdCkYMwb9Ag==
X-Received: by 2002:a05:600c:a43:b0:46f:b32e:5094 with SMTP id
 5b1f17b1804b1-46fb32e50fcmr47908965e9.32.1760103797977; 
 Fri, 10 Oct 2025 06:43:17 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482ba41sm49073145e9.4.2025.10.10.06.43.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 06:43:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 09/16] target/alpha: Replace HOST_BIG_ENDIAN #ifdef with
 runtime if() check
Date: Fri, 10 Oct 2025 15:42:18 +0200
Message-ID: <20251010134226.72221-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010134226.72221-1-philmd@linaro.org>
References: <20251010134226.72221-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Replace compile-time #ifdef with a runtime check to ensure all code
paths are built and tested. This reduces build-time configuration
complexity and improves maintainability.

No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/alpha/translate.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index a492520075e..b93cbe3b61f 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -235,11 +235,12 @@ static TCGv dest_fpr(DisasContext *ctx, unsigned reg)
 static int get_flag_ofs(unsigned shift)
 {
     int ofs = offsetof(CPUAlphaState, flags);
-#if HOST_BIG_ENDIAN
-    ofs += 3 - (shift / 8);
-#else
-    ofs += shift / 8;
-#endif
+
+    if (HOST_BIG_ENDIAN) {
+        ofs += 3 - (shift / 8);
+    } else {
+        ofs += shift / 8;
+    }
     return ofs;
 }
 
-- 
2.51.0



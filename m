Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B189C5CFC1
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 20:40:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvL8i-0008FQ-6V; Sat, 15 Aug 2026 16:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8e-00089f-2a
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:37:56 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8c-0008M5-Eh
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:37:55 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-38101f85591so2947420a91.1
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 13:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826271; x=1787431071; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=huYYxmonle9nqEQnUjnQGUQR5AICjj+SiFqAyTmaqDk=;
 b=ciNBTV24uJDwZWxz1yv8WN83AK60mqsIV8znpuvg+5m9hHhcBkXan1xXG3Ort1ozuR
 ASz7UMZ4ghS6pvMJrtlQ9FtF2Llvq+gSBy2kGwJKI/KgRusMpyqagCpYCGumt0XAmr0M
 Ifbtxeu5U2Qvsv94mmDzi+DyTU9KVQtgGpVqHICIkowaCDg++jfXuqd0ZDqvolzEdrNx
 2iAogrqUteTHD2O5gvg/MAhCQrLLky0LkJ1ay/IOg4XSEdxQ1bR5BCQmauz5kvNgZAMZ
 xrdP/R3DoP3DZ6/7oi8gJ6ZYBjGfQuOcAEp6sqw3tt30m96wuL9fcCC1ZkJPF+rhuhFR
 02Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826271; x=1787431071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=huYYxmonle9nqEQnUjnQGUQR5AICjj+SiFqAyTmaqDk=;
 b=pZ/j0+8M9difqbxTzNEqO/maQ949T9657MLsoYE1VoHKubmetz472PWj/Lv97fJ1UM
 bwAjnhQ+wM9hXkS86zFD+c2pL66uXH2as4TjNiDCRvbBiNBC6ML786bVF1M2P/imZnL8
 F37f62s/0UP1dB6vdrgGY+PMCWPW7mGyQSjNWAfWyxCVuc3MXrsOI8MoZCxhQvIlyAqV
 0YpOHO9PRX81g3dLKgLXbzCvmcss3+ii+fWtWHY1Xmjt61VM9fpuueWzF2jc5mwtR6he
 29j5jGiWlphXh48yolaQz0IfkkYh1SXIy63gzZlNHofpQNPBiK1mirHOAsoyVAgYbjsh
 hzeQ==
X-Gm-Message-State: AOJu0YynWcjIREiCKLCxWL08NBLfE0aO1sTVQy63M6+4Is79c5y+FqNF
 BXUwEeDp2tidpAJDrlmgwSu6LVUIQ1JJGHlpfYhfzANSGzWABhiqPzvjNEHVG4jpBgs=
X-Gm-Gg: AR+sD107TNJdrZUNaU5ihJdkUGcaMdDrLkT7N34RRCR7ZFaIeFz7z4aM5/6rYmwBBcM
 QjwTWMUJCOtUXcYGbKCtNRvLycBsBEOnNKkr+f06O8Xz1k28cJG9uGSvwtFiPnISGWAQNy8Tsq1
 ae+kfFFa8+gZoWqi3exg8mGAs3KYbXe1uQ+OnmmXZjsAKaOAav56yMZMOmX5FZSvvibyco2O3z5
 SdCQRl5BiHZIXRPCGnwGqAe1oMH8kwpCVPBiSBZS6FNKNgL11RO5q+TeRHmeK1wK6a5mgrhiy5P
 rRlM/RvTCi1qyRF+HIhkAhR6zu30D21CHCFusSFtmlOkqa0werfaFI4oBFPI1+YYwsJ/QwsEZsA
 vZHqHwTAYcAAS0u+7gZo+zdh7imkCWd+xsVxQFpnFmJHgDqUzxCtgy/LIlmxO5dMDrZURHJPpX0
 udm0N0Akh0QztijZ/MXJp5/q34sy4/spxBoDkPYfaaK3AlUzDupwl/pxeX7mbz3HAwkWNS9LBna
 dhLRJqNbzkRn6q4y0YP
X-Received: by 2002:a17:90b:2e87:b0:38e:6d55:b1a6 with SMTP id
 98e67ed59e1d1-3933af038ccmr12391331a91.3.1786826271518; 
 Sat, 15 Aug 2026 13:37:51 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 15/18] target/riscv: Use boolean logic in
 pmp_hart_has_privs
Date: Sat, 15 Aug 2026 13:37:27 -0700
Message-ID: <20260815203730.1468365-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

While addition with bool variables isn't wrong, as they promote
to int, it's odd.  Use normal boolean operators instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/pmp.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index 5ea0e5b6c3..fc035c95cf 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -413,16 +413,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
         s = pmp_is_in_range(env, i, addr);
         e = pmp_is_in_range(env, i, addr + pmp_size - 1);
 
-        /* partially inside */
-        if ((s + e) == 1) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "pmp violation - access is partially inside\n");
-            *allowed_privs = 0;
-            return false;
-        }
-
         /* fully inside */
-        if (s + e == 2) {
+        if (s && e) {
             /*
              * If the PMP entry is not off and the address is in range,
              * do the priv check
@@ -517,6 +509,14 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
              */
             return (privs & *allowed_privs) == privs;
         }
+
+        /* partially inside */
+        if (s || e) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "pmp violation - access is partially inside\n");
+            *allowed_privs = 0;
+            return false;
+        }
     }
 
     /* No rule matched */
-- 
2.43.0



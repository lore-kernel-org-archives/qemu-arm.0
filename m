Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3686605lfa;
        Mon, 7 Jun 2021 10:14:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVyC/rpX6UpfhSm60lf50TVt6mHJr3iJmISCqrJlTjs5SuVtzCtxS7Vqu+5NQvNKAcaa9e
X-Received: by 2002:ab0:484b:: with SMTP id c11mr855638uad.100.1623086056551;
        Mon, 07 Jun 2021 10:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623086056; cv=none;
        d=google.com; s=arc-20160816;
        b=ppru6lQeNc/L56gJaFIver8AuyBppvjvX7ep8sbWxYlWwaPvjA2E4stn2f0qAkiiAA
         ZGyvIHRGouBB3xHkhVco/JUYT8MpAQ3nfgCMH2M2XvGbH5NnICCJabS80SEfnOCzFixV
         K+e2bJtJANpirzJkET3nyq2jN1NxzINiefoQqu/ghjELm6R3d8mgV2nT2QnHYbwcdttE
         DWSeru8e/RSNkY9ango3AACdIvQLc+8JN/138pNn8lzI4qTtUN+TW2EKHtaFMzptD1yi
         /5qFMp/BYEfxCPpx5sdRatqlVy40tzOkmDPMQBmSf+1W6EXggHFdQ2VVGTHkO1y5j+Jm
         5kBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8Vw8HCdQuc72QNtYY1HMST7xyxh7hPAptN30nR4g61U=;
        b=VV9o6Fu/aPXQ4DIbBYtravDWYJasbATmNV2N5jghK+TMyVP+ydKvREjkELJXQQ/b4x
         /vIAPAWUsqHpy7Wju/iwp15OzLxqh9B5kjpOOhIw6C9UgdqgVQm5M0QEHOj6jdYDopzz
         f9LrFbASVZZrDHKBwEFwVP9utkaOPpTJgqc1w37VnIbPnz0rH41msTErhlSTWydKu3yH
         +BIWBdkCgNfN7z1cqIlsMN1pjEOeGutwiciCccjv21+70tvevOQ6SZL+FfIAQr7xZHAF
         +b6snWXPPk8WG3voDFMBpXxjfx8RCJurVVSWynA2aUoWBYa8bto2uA5HnkqcaYFt6xfu
         Ol0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wnrZ6aVy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si1384508vst.213.2021.06.07.10.14.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:14:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wnrZ6aVy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIpL-0007fj-S2
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaa-0007Xs-1m
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:01 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaD-0007wS-IS
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:58 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a11so16558638wrt.13
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Vw8HCdQuc72QNtYY1HMST7xyxh7hPAptN30nR4g61U=;
 b=wnrZ6aVy4zPhteDx0VrTiqe1YlYNzPQpHwQB4hFa4mDgqHEB63JRYpd72ahDzJl+BG
 lSNpIVLyQDCr1HEHl6d7o0VQ9evodMFL0w0mfFxVJ10LEO1c9RfyENbQnAMhg89aszRf
 bz3/BanB5AXuAOrAr+cbnLl5QArtGhdi01+MLbRWzMdx2Cl8YP/AzKRoYHm7bFmrxo1s
 IjLjXF3LOTzVfHTh5FfN9vAZRejkwB4SoMeKQEOHNo9q5obIpJjdEgfWTwM3EBuDCop4
 1AZH+RQ4ruMqejZS2YVAODSXlOx5pGl8Yq5A6SIZGZr2kr4eFYtlWT6FaXUtBS6/g3hS
 4mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Vw8HCdQuc72QNtYY1HMST7xyxh7hPAptN30nR4g61U=;
 b=ZgZ4kl8KIN3SLew2SKf35dUUDAEPa4nMalrqeq/409BgOmuxoZf4MSCMVUVfmis7QH
 nvmECDZ8eQmCPse4ewS3NPpAOR5WZkW1wtOBv5gBJeoXAQ3BSCICXJngrrYitrQA8ecx
 z5WZIKlefeKT6hQpQJ/BluQKNvrVPWsII3iTAlB3qHUkYxTQUJDVH2F9YihmcPC1f4Um
 kJJ5MD0eqFNKCKUyj3o+2jnwDGHtdiYslKEulei0wBEzcrDRCRQeTlUTUhHalD7jJZDF
 s5Tl7kpiUE3d4oDjAyD1SpZnwvJDuCNoDveTuBVO7Xl/tPpPPgmwcldkBNL1LUBbL8D7
 ELkA==
X-Gm-Message-State: AOAM5304vqZhq5KuxrLe+GVjucnttV6YOnG8d8B465Ixp3Y2Vazng8X9
 I1nzJMhhV8ErMLAU6nj/wUmgxQ==
X-Received: by 2002:a5d:5243:: with SMTP id k3mr18358046wrc.19.1623085116139; 
 Mon, 07 Jun 2021 09:58:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/55] bitops.h: Provide hswap32(), hswap64(),
 wswap64() swapping operations
Date: Mon,  7 Jun 2021 17:57:41 +0100
Message-Id: <20210607165821.9892-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BvXmXwpZq5lG

Currently the ARM SVE helper code defines locally some utility
functions for swapping 16-bit halfwords within 32-bit or 64-bit
values and for swapping 32-bit words within 64-bit values,
parallel to the byte-swapping bswap16/32/64 functions.

We want these also for the ARM MVE code, and they're potentially
generally useful for other targets, so move them to bitops.h.
(We don't put them in bswap.h with the bswap* functions because
they are implemented in terms of the rotate operations also
defined in bitops.h, and including bitops.h from bswap.h seems
better avoided.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/bitops.h   | 29 +++++++++++++++++++++++++++++
 target/arm/sve_helper.c | 20 --------------------
 2 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index a72f69fea85..03213ce952c 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -291,6 +291,35 @@ static inline uint64_t ror64(uint64_t word, unsigned int shift)
     return (word >> shift) | (word << ((64 - shift) & 63));
 }
 
+/**
+ * hswap32 - swap 16-bit halfwords within a 32-bit value
+ * @h: value to swap
+ */
+static inline uint32_t hswap32(uint32_t h)
+{
+    return rol32(h, 16);
+}
+
+/**
+ * hswap64 - swap 16-bit halfwords within a 64-bit value
+ * @h: value to swap
+ */
+static inline uint64_t hswap64(uint64_t h)
+{
+    uint64_t m = 0x0000ffff0000ffffull;
+    h = rol64(h, 32);
+    return ((h & m) << 16) | ((h >> 16) & m);
+}
+
+/**
+ * wswap64 - swap 32-bit words within a 64-bit value
+ * @h: value to swap
+ */
+static inline uint64_t wswap64(uint64_t h)
+{
+    return rol64(h, 32);
+}
+
 /**
  * extract32:
  * @value: the value to extract the bit field from
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 46a957b6fb0..15aa0a74982 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -247,26 +247,6 @@ static inline uint64_t expand_pred_s(uint8_t byte)
     return word[byte & 0x11];
 }
 
-/* Swap 16-bit words within a 32-bit word.  */
-static inline uint32_t hswap32(uint32_t h)
-{
-    return rol32(h, 16);
-}
-
-/* Swap 16-bit words within a 64-bit word.  */
-static inline uint64_t hswap64(uint64_t h)
-{
-    uint64_t m = 0x0000ffff0000ffffull;
-    h = rol64(h, 32);
-    return ((h & m) << 16) | ((h >> 16) & m);
-}
-
-/* Swap 32-bit words within a 64-bit word.  */
-static inline uint64_t wswap64(uint64_t h)
-{
-    return rol64(h, 32);
-}
-
 #define LOGICAL_PPPP(NAME, FUNC) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)  \
 {                                                                         \
-- 
2.20.1


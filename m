Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2066091lff;
        Mon, 14 Jun 2021 08:19:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxZIwHcuBujHKCnQsNjXHcickGA3JSgJxAGBY8Ap0PzwwPpLFyvxIN0P9A+3th6p72sUss
X-Received: by 2002:adf:ea49:: with SMTP id j9mr19429730wrn.366.1623683970188;
        Mon, 14 Jun 2021 08:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623683970; cv=none;
        d=google.com; s=arc-20160816;
        b=b2YJdalTwKZlNIV1uN3ZewdeLXdMbfFlDP8qag6wgujZEljinjOv+HteS2Z2PHkUHV
         9efGIJYFURBouT5F7nOcvCd5hWgez0oa4y9hguSVgigB8+2vUMrvLHwwlp/GjvtB//sp
         +1id5uEjZp71ioa1wRqYdh8vvDjtfkJpY2EhBQGV6gzfzV9LM+iObdL170u4B8mYT68R
         vFSGON/nOD7Fh2G0ONaNlynciCa6y46/NwFt9NkvLpeMjt5fliFIY59HH/2EpCyHrJ2H
         4YpPl/9+26qo586ICYRE04yzy4k/+PyryOJ6rBq8ed4eTTIdkAm0QsSGU+Ast39UM9tJ
         OV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7wu6UFnEHhsNr8f+nzfFofEjuSaGsLV/HyDj4dgtPTg=;
        b=Xl34nlK8FOFGSamQdtOa5ibKzk1H5JZiyLOQhFQeNMwOY9f5jZdYwiG4UsIa6oKxMB
         JFXYNlhPVR+B2zo+e6I5+tt4S7WS3NQJA86/iPiyL8uv6RY4jADxxHiur3aJs+FFL3U7
         IKpeDJdEnY9ry8SvueEO977cSd5Y/Ha5md0euPpSRx74HMWcQr4JMP2hNK+2I0bMBYI2
         G1YHx05BQWmY/1JK0dHfZLyYP4hO7/+2AwrgsX8l5JP+92IlFB3lM57X/zOfPAKLcMXQ
         FKqyYlbdoK28GAZ+FFGR0k9wt4ejyh2vIGRXcHfc01PhRZV1HsXAvEtil0NgJw+6sn9F
         mr2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H9MKhV8O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10si23093973wmg.194.2021.06.14.08.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:19:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H9MKhV8O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoN7-0002bp-7v
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEV-0000pa-TH
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:36 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEM-0000Io-T8
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:35 -0400
Received: by mail-wr1-x435.google.com with SMTP id f2so14931031wri.11
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7wu6UFnEHhsNr8f+nzfFofEjuSaGsLV/HyDj4dgtPTg=;
 b=H9MKhV8OWRYZKMVlJlX2MXOie7jgB0nDHVjCgU5eNGrjzwVnuT/6XE5fjuJ+xZtolR
 XidRkpjGQVx9Qsxsd0p8sRTjb0YUNqQ0rzv2Cr6Hd8O4hce+VuuDC6npK7t1rLuNlODq
 HeZzaiYT7pHvBpSDtTs0KZGxJiUbFZOJ4GYvQK2jGOjTHxbCfGucdzD0diL0hV3HoBoM
 l4E/wEnPcMY2u/+sZoPq6Gd8uCL1iEWQ+9c6g0cAID6Gnci9Z4rs32CJVH5nJJEYmqq9
 rprmVTNGdx0JQMkiX/7oEgECugIOmXj1NOemOVYIhOxRlqVkQ8mbeJzeXXAay5ojIrCS
 gfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7wu6UFnEHhsNr8f+nzfFofEjuSaGsLV/HyDj4dgtPTg=;
 b=F5JEmlR8h0o4or7fgFT+/QbROkvP7I37gLsP4IwhV43gfYuN2YN2g1xP+95ORuUl4t
 /YhT/HY1nqQq+7zq2lMw58UZ7hib2j7JUA5qsBjGF1QaWIE90y7rWShZYotTUgMFvyxS
 OWAGgnj22cmDttVkQCxr9f8HFsyzavkgh2db2vB3n1CXBmFer6nOt5Oqm0YbeozEguCT
 +W84jV+XE3qGOLfcBM4Dd8I0AyFJQaidR+EKv1g7rF90Sv+DB8vYG1S0ALDM81Vq469r
 xsjchp0lnvGCz/0tsGRKSfmgXCjd4R2olga9hAYXHVz1Jakvuz2IhQQWrEKKeBPiuIF4
 6uzg==
X-Gm-Message-State: AOAM5311ZJwsCoyX8z7+mupqUw0pLlxdBSK+WJ7XnMFDqKoTQFG0lDfp
 5f4smF24WbOlW1MiGeH/2R4uFIPFwq8SPg==
X-Received: by 2002:a5d:6147:: with SMTP id y7mr19308802wrt.418.1623683424540; 
 Mon, 14 Jun 2021 08:10:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 16/57] bitops.h: Provide hswap32(), hswap64(),
 wswap64() swapping operations
Date: Mon, 14 Jun 2021 16:09:26 +0100
Message-Id: <20210614151007.4545-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e4YTM8bRKxSR

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 321098e2651..dab5f1d1cda 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -152,26 +152,6 @@ static inline uint64_t expand_pred_s(uint8_t byte)
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


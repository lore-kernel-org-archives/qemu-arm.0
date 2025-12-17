Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A926D65C56
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 14:33:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVsaW-0001xj-GI; Wed, 17 Dec 2025 09:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsa0-0001cr-0T
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:32:45 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsZs-000772-Rc
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:32:34 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-477632b0621so39688045e9.2
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 06:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765981951; x=1766586751; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KntzN84E4rzQNF1VjNRRJJcnloDQTOOHWlgvhj9Q7tw=;
 b=VWkuVG6WKOP0u0MG2u5MISu6YYeCGVYrI3RCuYc3g1IYScwMVMpsQ742MasKzgItbH
 A+EAAJ6BYoK1RVf3VD9xxDHvA9whGzJG/XxznZGOwLLklFQHr9yQqTXlrUDZ+u5AH+KN
 WWewDqscsJK2fDgrK/K+DK44V+yL35bUpSKmTdwcYierTdy6uznFDRSUYD9ZuJopCPgO
 Y4qsoFmH4XE5WKYUK2iRgLdQJfZoTPia8AYiV7UyKpjxx6WzaPCpUH6wIxT5xUNU1ZYa
 U9R3/KIzZaeFbTcBUIO3fRZ3w4GKGkBUIFA6bM3PO5Loy+WUkylqACXRZFnYYpUwXF5N
 YJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765981951; x=1766586751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KntzN84E4rzQNF1VjNRRJJcnloDQTOOHWlgvhj9Q7tw=;
 b=A8B6Omxja85l4pGM4Z6VqvmTg8CR6xMa1RKBex/mi4W2hZBaFCC/DHy1dnrrXan1b7
 5l39IyaSM8l74ht7Nl6FBAigfAA5nn2Zc7PNKIsUsHAqAvrtfoOzdoylg1A6+b82hXSg
 a11rxlrgnjPBWXBDPjXLX4WqxBHJw6jdaKSHfw2OE+kH3Eq3TuMn0qsCrTyEw75v7n+0
 vydq0/5hy0CruPc5rlQyucx3lUodHQNfypI4vwuqZqZbfhkAsMGb8ypx/MfnKiShRv2K
 Ux2Pjj6aue4OBXq0c96Iou6N+fS32xP/XmLaU3ERZJFe7dDLDv9zpff2/NeshWrBzouv
 e+hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOaNQwHg5JyRjQpKLilKYqbZwVFJcW0b/4b8rog2T+IB3UhIJGUSJBE66H+YG6ClcsxHWFW+GPyw==@nongnu.org
X-Gm-Message-State: AOJu0YzLZIxceWwHROI2U00RcMFTC/wI8eI5rnn8hffAbbWbDF9mxh5l
 JckqLLiiQ6/Pyz1Mh+VgQ/ypxXnAlVeqDTd8Kfurzx7Q12uxoCxG5Z25VZ9GFNTOaSw=
X-Gm-Gg: AY/fxX4zmBob2I38O5u1fADMTaNFKBuBPQEHQS0yyXAub6Ty0zQ6Sj8drc52yGu08ig
 WZfJWH0H8Y64w7eRN5fGORXlitob+U0kJ9d1MqpidqCqJd9ZW++yYcR2ToVRzA06Xc/qO3bgylN
 SWiwyXPwZxbNQkFPT3s1PS7rU2lhaKn4lPfGMNAoO+P0ZjwgRD9oD/vnzm9z1me4+xikLhSP2Rc
 Bk+oyyD1uVF+mdLv4B9j+KfQDK/Hhqz3m9FBmc3XNOFKaaOAPKSsJyUyx0bfIGujsuudXdg7Yc7
 epfE2MJShp/gR2bPUBUmCUeJNKA7l7U/Mo4vEvNHqyxHxppVs3lUsiHdWMxQhtLj/1jATn+FxJb
 EfQom5N8XOAz5/Sp9qOGZe5Spf0grVxm0AgW3jwPkvYiTkd04QBcNb2Tpt6snseBMs4Gh97Z6ZI
 1fg2wfoVaZBqn0UORDPkYdP4/gUMivVbyd+aw7UvsgQDsUKelZwkM1MClnLZKc
X-Google-Smtp-Source: AGHT+IHrmxo58cjk+Ja06ElhCpkbSBp2FLjbJkIVoKszjZU6CJuvhE8j6Kof7/fmcIJtOA46T/2vyw==
X-Received: by 2002:a05:600c:4e09:b0:477:9976:9e1a with SMTP id
 5b1f17b1804b1-47a8f89bc6cmr199436695e9.6.1765981951134; 
 Wed, 17 Dec 2025 06:32:31 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bdc1d991fsm43795515e9.5.2025.12.17.06.32.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Dec 2025 06:32:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@kernel.org>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 05/14] system/physmem: Inline and remove leul_to_cpu()
Date: Wed, 17 Dec 2025 15:31:41 +0100
Message-ID: <20251217143150.94463-6-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217143150.94463-1-philmd@linaro.org>
References: <20251217143150.94463-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

leul_to_cpu() is only used within physmem.c: inline it
and remove.
Since @bitmap is of 'unsigned long' type, use its size
with ldn_le_p() instead of using HOST_LONG_BITS.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/bswap.h | 11 -----------
 system/physmem.c     |  5 +++--
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 39ba64046a6..65a1b3634f4 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -375,17 +375,6 @@ static inline void stq_be_p(void *ptr, uint64_t v)
     stq_he_p(ptr, be_bswap(v, 64));
 }
 
-static inline unsigned long leul_to_cpu(unsigned long v)
-{
-#if HOST_LONG_BITS == 32
-    return le_bswap(v, 32);
-#elif HOST_LONG_BITS == 64
-    return le_bswap(v, 64);
-#else
-# error Unknown sizeof long
-#endif
-}
-
 /* Store v to p as a sz byte value in host order */
 #define DO_STN_LDN_P(END) \
     static inline void stn_## END ## _p(void *ptr, int sz, uint64_t v)  \
diff --git a/system/physmem.c b/system/physmem.c
index c9869e4049f..1292f49095f 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -1254,7 +1254,8 @@ uint64_t physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
 
             for (k = 0; k < nr; k++) {
                 if (bitmap[k]) {
-                    unsigned long temp = leul_to_cpu(bitmap[k]);
+                    unsigned long temp = ldn_le_p(&bitmap[k],
+                                                  sizeof(bitmap[k]));
 
                     nbits = ctpopl(temp);
                     qatomic_or(&blocks[DIRTY_MEMORY_VGA][idx][offset], temp);
@@ -1301,7 +1302,7 @@ uint64_t physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
          */
         for (i = 0; i < len; i++) {
             if (bitmap[i] != 0) {
-                c = leul_to_cpu(bitmap[i]);
+                c = ldn_le_p(&bitmap[i], sizeof(bitmap[i]));
                 nbits = ctpopl(c);
                 if (unlikely(global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE)) {
                     total_dirty_pages += nbits;
-- 
2.52.0



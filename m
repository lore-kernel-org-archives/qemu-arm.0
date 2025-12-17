Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0611BD65C59
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 14:34:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVsb3-000383-EQ; Wed, 17 Dec 2025 09:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsb2-0002yi-5v
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:33:44 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsb0-0007XJ-1l
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:33:43 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477b5e0323bso3942725e9.0
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 06:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765982020; x=1766586820; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hw1yIVI7Fe2b/MFRMttYe0v8MoYDRmNEX3bk78jaHXE=;
 b=CkgU2my3sFwFCmgO4FfFQQ01w7kA7XLxoa3Zst3hYbFt8n/c5V7yZc79ZTozVEoRo9
 zZaXIMjm0OrY42bMA4TqqGW8scfloBletIESrNor20Pw1fWXGRUbVJBRWy5bCpddbUsJ
 MbjJdVA6DLhlF3C+3pIkx4q8NF9uASW/809b6MVXPxFBz8ileP6Rrl3irnawx8sdbi0m
 SiuwBZVsXs0/ftw/C9+T1lUmdZFaQCzuJf1BKH8cvSNYDlo8wQS0VFlWFQBXdabfhtxm
 mKz6V6+h9Sf+aquCuH1YWiPzIzY4yUqoNlpS5/Kk5MKQHWuvnXb2cJgKNwTxc6B/QqFx
 KZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765982020; x=1766586820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hw1yIVI7Fe2b/MFRMttYe0v8MoYDRmNEX3bk78jaHXE=;
 b=Tmgt0P+MkoKtdT5ozxq6IjbQRK3O0x1L3MqeoBBYTDE3gM7khL/3YIvf2h6G+Q16Rj
 fkIjbSGhA9nnpek7fNygVgVsE7hbiFDdd5Nr20K7R7IGR+euCZjesz6w3pWIAC9sCIer
 ijKBIVSir+RIczZr62Kcul81olYigMvksI+boSny2284DY9G57i8ZS082oXR9p2o14Td
 WP+UEbROqGo/aFgdaAzK+SV0CFia+xpPLNdMYd/l08mp2pvSOAz0gKkrpHQAIRZ+2HwT
 KdyP1DTmLakiYLKBLo7q3oAVflzCunGlAjEPZaCizSX3s5KjsHgsSM/+pXxUSGoShhMY
 t1Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXziQhPfCmqwQndCQrPcW/8I00Jey5ltHSLNwxk/2pG87ot41KLZP5XpOoo+jUQjvFWWFo62ACpDg==@nongnu.org
X-Gm-Message-State: AOJu0YwR6gw8BsBEOJSupqFJkhxjb2MilP6JOTywSvxdbPRP/c+Jr+55
 8c0O9SxbiVIsdk6yJMJu9dRvxbH71Tn0eillBWxpR9x47mlMdzdDiuYYXZu2K+1kVR8=
X-Gm-Gg: AY/fxX5ptOZ+jpdeJYVsQPBoqYKCNIvTqZJdxtybRr8KXWasE6SDQRw0JnDfWoVRcvQ
 o4iRtIIrzFrgdL3r0suQrEJPhcCUS12BhLMeXH6/7d8SOUUK61jakCDPQvRCA3BKHzLwFjZZ1H8
 ETFiLfHB163ItHwzzjkkm6Yi0NY6RTcyLkkQTPG9saaVasmFgWAsgQIBssHQuF/n309fVVlbDkW
 1wMVswZRl9Vsu8njD9r5K5euzslMugfBYsPCPQpQPKt8W4lfT7LZP4j8Wp3ZLw4PV4GbQuKDoOU
 GvjFmtK8zess+z0SaBXP72A8D6kbSe8Lu2D4wWfjYge4Au90b8CX+rglQrn6eJCXfinHg92zEmx
 bPqQJsprZgRv9yiUBr7c9beQx8qcbqod/NJ1sjiBXLnUScDAvGP6ov1ozSIhXswmF1xfQBrynoD
 phNLVyd5BOxySYLqTDr4y5tkoRnc8y0z7anMHruFoax8QnRn8VQaqPUbINXrd9
X-Google-Smtp-Source: AGHT+IFTRmhLCWL5HUIOCsnG2fw+BtwoGKxqtqDZUh4rn48UcNyYBTSdMWLpzSeYPavUYAquibmLbg==
X-Received: by 2002:a05:600c:64cf:b0:479:255f:8805 with SMTP id
 5b1f17b1804b1-47a8f094212mr166712095e9.4.1765982020332; 
 Wed, 17 Dec 2025 06:33:40 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd932a3e5sm30579265e9.0.2025.12.17.06.33.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Dec 2025 06:33:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@kernel.org>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 14/14] system/memory: Sort methods in memory_ldst.c.inc file
Date: Wed, 17 Dec 2025 15:31:50 +0100
Message-ID: <20251217143150.94463-15-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217143150.94463-1-philmd@linaro.org>
References: <20251217143150.94463-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

For clarity, sort methods by access size (B, W, L, Q).
Fix coding style. Only code movement, no logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/memory_ldst.c.inc | 86 ++++++++++++++++++++++++----------------
 1 file changed, 52 insertions(+), 34 deletions(-)

diff --git a/system/memory_ldst.c.inc b/system/memory_ldst.c.inc
index 6387bb9d332..5a979ea6ac3 100644
--- a/system/memory_ldst.c.inc
+++ b/system/memory_ldst.c.inc
@@ -63,37 +63,46 @@ uint64_t glue(address_space_ldm_internal, SUFFIX)(ARG1_DECL, MemOp mop,
     return val;
 }
 
-/* warning: addr must be aligned */
-static inline uint32_t glue(address_space_ldl_internal, SUFFIX)(ARG1_DECL,
-    MemOp mop, hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
-{
-    return glue(address_space_ldm_internal, SUFFIX)(ARG1, mop | MO_32, addr,
-                                                    attrs, result);
-}
-
-/* warning: addr must be aligned */
-static inline uint64_t glue(address_space_ldq_internal, SUFFIX)(ARG1_DECL,
-    MemOp mop, hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
-{
-    return glue(address_space_ldm_internal, SUFFIX)(ARG1, mop | MO_64, addr,
-                                                    attrs, result);
-}
-
-uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
-    hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
+uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL, hwaddr addr,
+                                         MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_ldm_internal, SUFFIX)(ARG1, MO_8, addr,
                                                     attrs, result);
 }
 
 /* warning: addr must be aligned */
-static inline uint16_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
-    MemOp mop, hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
+static inline
+uint16_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL, MemOp mop,
+                                                   hwaddr addr,
+                                                   MemTxAttrs attrs,
+                                                   MemTxResult *result)
 {
     return glue(address_space_ldm_internal, SUFFIX)(ARG1, mop | MO_16, addr,
                                                     attrs, result);
 }
 
+/* warning: addr must be aligned */
+static inline
+uint32_t glue(address_space_ldl_internal, SUFFIX)(ARG1_DECL, MemOp mop,
+                                                  hwaddr addr,
+                                                  MemTxAttrs attrs,
+                                                  MemTxResult *result)
+{
+    return glue(address_space_ldm_internal, SUFFIX)(ARG1, mop | MO_32, addr,
+                                                    attrs, result);
+}
+
+/* warning: addr must be aligned */
+static inline
+uint64_t glue(address_space_ldq_internal, SUFFIX)(ARG1_DECL, MemOp mop,
+                                                  hwaddr addr,
+                                                  MemTxAttrs attrs,
+                                                  MemTxResult *result)
+{
+    return glue(address_space_ldm_internal, SUFFIX)(ARG1, mop | MO_64, addr,
+                                                    attrs, result);
+}
+
 static inline
 void glue(address_space_stm_internal, SUFFIX)(ARG1_DECL, MemOp mop,
                                               hwaddr addr, uint64_t val,
@@ -133,31 +142,40 @@ void glue(address_space_stm_internal, SUFFIX)(ARG1_DECL, MemOp mop,
     RCU_READ_UNLOCK();
 }
 
-/* warning: addr must be aligned */
-static inline void glue(address_space_stl_internal, SUFFIX)(ARG1_DECL,
-    MemOp mop, hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
-{
-    glue(address_space_stm_internal, SUFFIX)(ARG1, mop | MO_32, addr, val,
-                                             attrs, result);
-}
-
-void glue(address_space_stb, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint8_t val, MemTxAttrs attrs, MemTxResult *result)
+void glue(address_space_stb, SUFFIX)(ARG1_DECL, hwaddr addr, uint8_t val,
+                                     MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stm_internal, SUFFIX)(ARG1, MO_8, addr, val,
                                              attrs, result);
 }
 
 /* warning: addr must be aligned */
-static inline void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL,
-    MemOp mop, hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
+static inline
+void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL, MemOp mop,
+                                              hwaddr addr, uint16_t val,
+                                              MemTxAttrs attrs,
+                                              MemTxResult *result)
 {
     glue(address_space_stm_internal, SUFFIX)(ARG1, mop | MO_16, addr, val,
                                              attrs, result);
 }
 
-static inline void glue(address_space_stq_internal, SUFFIX)(ARG1_DECL,
-    MemOp mop, hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result)
+/* warning: addr must be aligned */
+static inline
+void glue(address_space_stl_internal, SUFFIX)(ARG1_DECL, MemOp mop,
+                                              hwaddr addr, uint32_t val,
+                                              MemTxAttrs attrs,
+                                              MemTxResult *result)
+{
+    glue(address_space_stm_internal, SUFFIX)(ARG1, mop | MO_32, addr, val,
+                                             attrs, result);
+}
+
+static inline
+void glue(address_space_stq_internal, SUFFIX)(ARG1_DECL, MemOp mop,
+                                              hwaddr addr, uint64_t val,
+                                              MemTxAttrs attrs,
+                                              MemTxResult *result)
 {
     glue(address_space_stm_internal, SUFFIX)(ARG1, mop | MO_64, addr, val,
                                              attrs, result);
-- 
2.52.0



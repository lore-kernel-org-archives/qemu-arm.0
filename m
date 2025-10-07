Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B01CCA471
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 02:40:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5xcd-0005jN-Vn; Mon, 06 Oct 2025 22:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5xcc-0005j0-90
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 22:40:14 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5xca-0002EZ-AN
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 22:40:14 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e542196c7so37184185e9.0
 for <qemu-arm@nongnu.org>; Mon, 06 Oct 2025 19:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759804810; x=1760409610; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qElDuI84uOuLTQODOzfQj3jtdiNn9iH8YI/AfQgyboo=;
 b=gDuQOtr/eP93iT8OqtwotPCkjIU7d1JLaUA2NikJLq/0ZPxnfJgNNGtTcpCsW4dqYO
 ehpNaImIIK/PSsddRR+gXnWPxrcbMF2oYFgK4roMk4qmLYvoKjPLjc7SRlf7jvv1XO9h
 0fcOBUonsIBFL0Cut2lzTxfaXTGwgScuNz37rFRF5hR9/1BJfr1/URVRmeZkD7D/rePx
 T0Igpsha1XnkAT0s3GbBcn/mJnkXM7hSMB+ug/QG+WXPxRrwhQJ8QiZxikjXIp7jcaG/
 LmZguGddgiJFVjpfkZMSUMUA5lB4VSQzg1BD0IdIaZM2a7/UQd9uIk/aiGJtujOdGC7c
 SQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759804810; x=1760409610;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qElDuI84uOuLTQODOzfQj3jtdiNn9iH8YI/AfQgyboo=;
 b=J6OSDcye68Ra/5kvOlPH0LwaedJc/uqtNGxqk6y3RsOYku9XVvQ8F3HSMm8wQaLMr+
 ZbTIcSo0RpEpFDpiDfPAcYkXwtr9Zylkd3LOF2m0W/15ys8gn60OWD+VtMiPS8Z27+5+
 ps8/rN8skSOLvsgRAY9mG7QCZ0gdqKKcealLiW9mq4HnCU6HUK7lEwEcxlmPOKToYfAz
 DmLqxZ+wFxjY0Q0KaQmUn7v0IUQAleTOEt76E6Xmh9pOMRz8O1kDCM4Hf8uVkuMIXSU2
 UF8cz63BkSxgBG11xvBdCwDh4eQkx3zuer+3dC4s3EWrFoVFwFqUCChbdAMFh0P1iXVp
 v8bg==
X-Gm-Message-State: AOJu0YzsOpRebSzab+ZlYwI9Aceue9Rlnid8SCnoAU5PUMxd/BVmV7+d
 l9sBTxhSIYqEFgmhM3GwyG8K2302Nhc9iD7waYjCnChvjGsav90ukpODoMTKmAMNvxs=
X-Gm-Gg: ASbGncsnwFVf7P5IOSMCCa/fTSX00nkn3jQKQu+CLd3BuF74Kt1qbHkYelZx2CXeK7A
 cL4T7DJHTxtYynJEnZPYdxfAAD367aMRxuFeDE7ds88W2EWW49DKbKc8BCvwPwTl+ubSKgdp02u
 uRDwAKQ+DQ1ak1WIutX1/obyfljlnPv6N4TvYv9gyTPTSS78d/fxraI5INgzVkaleTMJFez7Hy/
 UP8yti5Gp6pNw/UUJucgKX2P0h70jgCE6sA86ptHU+CTBUo/bI0Gz+Xa77vnQxYjYO8PQz58X7R
 VGRag2Pg0rF+jzLcZHoEV3kAYaubvn07gDiW2SQhdgOip4JFwwXizGpCByFlm4wHxAhNSZDwdim
 +TQglTYcuo8puwvTjP2De4Mu8JDgumL0GER/Ql0kCSsDYuHvAu0vgGlyb3kYoeC1fbeX4rlCweK
 C44L5z4vGnkoh/JzrfQfrFAnyN
X-Google-Smtp-Source: AGHT+IETuJoYEB3RVIv5MPzFSc86jB9aNzI81UFV85w8Xs36q86VUly6X43hMrEyumu7vjD0/dK7rg==
X-Received: by 2002:a05:600c:8592:b0:45b:92a6:63e3 with SMTP id
 5b1f17b1804b1-46fa29e1c70mr6876435e9.9.1759804810240; 
 Mon, 06 Oct 2025 19:40:10 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f0853sm23628091f8f.50.2025.10.06.19.40.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Oct 2025 19:40:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jackson Donaldson <jcksn@duck.com>,
 Jackson Donaldson <jackson88044@gmail.com>
Subject: [PATCH] hw/misc/max78000_gcr: Do not ignore address_space_write()
 errors
Date: Tue,  7 Oct 2025 04:40:06 +0200
Message-ID: <20251007024006.43166-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Convert max78000_gcr_ops[] to take MemTxAttrs and return MemTxResult,
allowing the write() path to return error on failure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Jackson Donaldson <jcksn@duck.com>
Cc: Jackson Donaldson <jackson88044@gmail.com>
---
 hw/misc/max78000_gcr.c | 95 +++++++++++++++++++++++++++---------------
 1 file changed, 61 insertions(+), 34 deletions(-)

diff --git a/hw/misc/max78000_gcr.c b/hw/misc/max78000_gcr.c
index fbbc92cca32..2d1d46cc26d 100644
--- a/hw/misc/max78000_gcr.c
+++ b/hw/misc/max78000_gcr.c
@@ -44,80 +44,106 @@ static void max78000_gcr_reset_hold(Object *obj, ResetType type)
     s->eccaddr = 0;
 }
 
-static uint64_t max78000_gcr_read(void *opaque, hwaddr addr,
-                                     unsigned int size)
+static MemTxResult max78000_gcr_read(void *opaque, hwaddr addr,
+                                     uint64_t *pdata, unsigned size,
+                                     MemTxAttrs attrs)
 {
     Max78000GcrState *s = opaque;
+    uint64_t r;
 
     switch (addr) {
     case SYSCTRL:
-        return s->sysctrl;
+        r = s->sysctrl;
+        break;
 
     case RST0:
-        return s->rst0;
+        r = s->rst0;
+        break;
 
     case CLKCTRL:
-        return s->clkctrl;
+        r = s->clkctrl;
+        break;
 
     case PM:
-        return s->pm;
+        r = s->pm;
+        break;
 
     case PCLKDIV:
-        return s->pclkdiv;
+        r = s->pclkdiv;
+        break;
 
     case PCLKDIS0:
-        return s->pclkdis0;
+        r = s->pclkdis0;
+        break;
 
     case MEMCTRL:
-        return s->memctrl;
+        r = s->memctrl;
+        break;
 
     case MEMZ:
-        return s->memz;
+        r = s->memz;
+        break;
 
     case SYSST:
-        return s->sysst;
+        r = s->sysst;
+        break;
 
     case RST1:
-        return s->rst1;
+        r = s->rst1;
+        break;
 
     case PCKDIS1:
-        return s->pckdis1;
+        r = s->pckdis1;
+        break;
 
     case EVENTEN:
-        return s->eventen;
+        r = s->eventen;
+        break;
 
     case REVISION:
-        return s->revision;
+        r = s->revision;
+        break;
 
     case SYSIE:
-        return s->sysie;
+        r = s->sysie;
+        break;
 
     case ECCERR:
-        return s->eccerr;
+        r = s->eccerr;
+        break;
 
     case ECCED:
-        return s->ecced;
+        r = s->ecced;
+        break;
 
     case ECCIE:
-        return s->eccie;
+        r = s->eccie;
+        break;
 
     case ECCADDR:
-        return s->eccaddr;
+        r = s->eccaddr;
+        break;
 
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"
             HWADDR_PRIx "\n", __func__, addr);
-        return 0;
-
+        r = 0;
+        break;
     }
+    *pdata = r;
+
+    return MEMTX_OK;
 }
 
-static void max78000_gcr_write(void *opaque, hwaddr addr,
-                       uint64_t val64, unsigned int size)
+static MemTxResult max78000_gcr_write(void *opaque, hwaddr addr,
+                                      uint64_t val64, unsigned size,
+                                      MemTxAttrs attrs)
 {
     Max78000GcrState *s = opaque;
     uint32_t val = val64;
     uint8_t zero[0xc000] = {0};
+    MemTxResult res = MEMTX_OK;
+
     switch (addr) {
     case SYSCTRL:
         /* Checksum calculations always pass immediately */
@@ -190,20 +216,20 @@ static void max78000_gcr_write(void *opaque, hwaddr addr,
 
     case MEMZ:
         if (val & ram0) {
-            address_space_write(&s->sram_as, SYSRAM0_START,
-                                MEMTXATTRS_UNSPECIFIED, zero, 0x8000);
+            res |= address_space_write(&s->sram_as, SYSRAM0_START,
+                                       attrs, zero, 0x8000);
         }
         if (val & ram1) {
-            address_space_write(&s->sram_as, SYSRAM1_START,
-                                MEMTXATTRS_UNSPECIFIED, zero, 0x8000);
+            res |= address_space_write(&s->sram_as, SYSRAM1_START,
+                                       attrs, zero, 0x8000);
         }
         if (val & ram2) {
-            address_space_write(&s->sram_as, SYSRAM2_START,
-                                MEMTXATTRS_UNSPECIFIED, zero, 0xC000);
+            res |= address_space_write(&s->sram_as, SYSRAM2_START,
+                                       attrs, zero, 0xC000);
         }
         if (val & ram3) {
-            address_space_write(&s->sram_as, SYSRAM3_START,
-                                MEMTXATTRS_UNSPECIFIED, zero, 0x4000);
+            res |= address_space_write(&s->sram_as, SYSRAM3_START,
+                                       attrs, zero, 0x4000);
         }
         break;
 
@@ -254,6 +280,7 @@ static void max78000_gcr_write(void *opaque, hwaddr addr,
         break;
 
     }
+    return res;
 }
 
 static const Property max78000_gcr_properties[] = {
@@ -272,8 +299,8 @@ static const Property max78000_gcr_properties[] = {
 };
 
 static const MemoryRegionOps max78000_gcr_ops = {
-    .read = max78000_gcr_read,
-    .write = max78000_gcr_write,
+    .read_with_attrs = max78000_gcr_read,
+    .write_with_attrs = max78000_gcr_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid.min_access_size = 4,
     .valid.max_access_size = 4,
-- 
2.51.0



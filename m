Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937E8606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xQh4cCdR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKHEm-0006nI-Uv; Fri, 23 Oct 2026 11:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKHEf-0006mH-4W
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 11:31:14 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKHEc-0005kR-9d
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 11:31:11 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a2167bd087so5343715e9.3
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 08:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792769468; x=1793374268; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YOZVdxlp9UHy/TXer17e1bouf9xS+Zoyxtb5H0jr77c=;
 b=xQh4cCdRE8ZrwKLpU+C6MfG/xdH2tIS3VUOOdOYei22wf6biWDzPQNrHl8oAvz8BTj
 2khphOcTHxKhC0MSZylrkfBEL0b+OpuguXOOaR6tC1dh4LZud+FVTxyBNf5LqXN1byYk
 n9dMGJAKMdCNiVtmeQXeHqbYQoMAXqJTTiWVaHI6ZSwSjjoP7twiDTm54eZaJ5XNLA84
 Gft7XsmOZmJD0j/dtvAFV+GSSDs39p5tpuHbOgLoL1eN/6NG8fP0AL6Sytck6Db4YdGX
 eaWD7NCByyf8GQFLyIau4XAH0ghdH5Fk4aQDF0g4pT45le1NJX+rcAzNLfGbL6SHjauf
 I2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792769468; x=1793374268;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YOZVdxlp9UHy/TXer17e1bouf9xS+Zoyxtb5H0jr77c=;
 b=k2y3DMOo2ovFmUXZ8pg/slVSZUokem1fSW2Tc39EtPUvxuTY9AyP5uz5ld1/AADqpW
 bzmjT+yiNmTYhQRQGXrstYRKrbeVTcjgC1lSssj+5sQ7ScEPsDUK/gJMwsKvK7fQJ2JA
 6uWTX46swN93W0ipCsqfSJEwihKTXzA2CYGvv2OohnYaTokKTv/yL5qK9ayndY/XlatT
 fzfeownSSs8ZRzL/6M7JGNQIBekdjTr6Ynb6XWfb4x4hPBODkWQRWQvONhGKiaQwJGml
 LmmmVssfDA7UkGF4Ja3YbXFPSSt53Q1hokqeNvVSwCMEupz9Gcdu5GXICSUXZxWczCqJ
 EJ8A==
X-Gm-Message-State: AFq9FYLSU0wairOiIYN4qkrvy4GOMNZijzY5AQFSGsU/IOg8L7iFPXTC
 o3Zs4T5d8lhJSQ8QxJ2NMRvCTSM1fA25+5I4GZpVuAkIvuFAwPS2wyLn0htPKCwhhmJlXC7naQP
 oX8cD/dU=
X-Gm-Gg: AYBFou1dTwSo7ohXe+yD1DE0xa99fmTgvxcstZKxA8mt7/E/JxrHlSHI/vbuI9sxrWz
 w5AtgCSboPgSXw46NBBgK67vZIGc9jdeSg1AF4dTRHl3tSjg/EB+OLiDENiA749LztHDv2VmRyy
 KQ20bNoNCxPbXhL09C4AyX1DYOpmVgRtMgdbUgUtGTjXNG1Lp9NQ1CO7GJzQZEnSsV/l+0MzKT1
 xaCyLtem1nVwqa4mAbpJTfN+a/vBTuvplKfWzJDAdgWUlgdn0qcmgBwDe+L8D4gIc+ll9rSRkrs
 jvtMSYPAd29r/CEl4n09wv6nS2LXJIeJyfL48IwVFKJZfLwH84CGGOxn/kDkBj8OPKYMQ6+HMOJ
 sHsFnUwTAPnMvfqmb8EvFvnpKAAb8XKfe2p1eMiuzSRfK6DeaFEEvUOeeQU9cuUtOgb8o+C4GMv
 9k9MZczvslCdmp9JMgDmIj0TarX66sxN3ww49HkRRa2uiWTTjFy/zQx4Eb1FYtHwDulqfnrgXXe
 YXmUoB8d5DglWuNM5szpTqvAY2tTLsDtVDtz0fYT9/z5vstVweVGUr/2s95TEI+n73lN1PKsQwI
 ePrRsUySq/HiTrBj9ANr2jn28+UaUAOIraBad8qV4ttfcFHl0xs76m4vR0jDmg8f4e2PXXYkhRe
 AHKIuEg==
X-Received: by 2002:a05:600c:8a1a:20b0:4a2:1e1:d55 with SMTP id
 5b1f17b1804b1-4a211cd5ee3mr32242605e9.28.1792769468442; 
 Fri, 23 Oct 2026 08:31:08 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a2b066685dsm10842475e9.15.2026.10.23.08.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 08:31:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Wang <jasowangio@gmail.com>
Subject: [PATCH] hw/net/cadence_gem: Check guest-provided queue numbers in
 screening registers
Date: Fri, 23 Oct 2026 16:31:06 +0100
Message-ID: <20261023153106.1710228-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Cadence GEM allows the guest to program "screening registers"
which control which queue received network data should be sent to.
The field for the queue number in these registers is 4 bits, but the
device might not actually have that many queues.  We weren't checking
this, which meant the guest could program a value that caused us to
index off the end of various arrays.

Check against num_priority_queues, and treat out-of-range values
as if the screen didn't match (i.e. go to queue 0). (This is a
best guess at reasonable behaviour since I don't have access to
a datasheet for this device.)

Cc: qemu-stable@nongnu.org
Fixes: e8e4994313b7 ("cadence_gem: Add support for screening")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4363
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/cadence_gem.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 39e3620ef5b..9a94b3b8ca4 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -854,6 +854,7 @@ static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr,
     uint32_t reg;
     bool matched, mismatched;
     int i, j;
+    int queue = 0; /* default to queue 0 if no match */
 
     for (i = 0; i < s->num_type1_screeners; i++) {
         reg = s->regs[R_SCREENING_TYPE1_REG0 + i];
@@ -881,7 +882,8 @@ static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr,
         }
 
         if (matched && !mismatched) {
-            return FIELD_EX32(reg, SCREENING_TYPE1_REG0, QUEUE_NUM);
+            queue = FIELD_EX32(reg, SCREENING_TYPE1_REG0, QUEUE_NUM);
+            goto out;
         }
     }
 
@@ -974,12 +976,23 @@ static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr,
         }
 
         if (matched && !mismatched) {
-            return FIELD_EX32(reg, SCREENING_TYPE2_REG0, QUEUE_NUM);
+            queue = FIELD_EX32(reg, SCREENING_TYPE2_REG0, QUEUE_NUM);
+            break;
         }
     }
 
-    /* We made it here, assume it's queue 0 */
-    return 0;
+out:
+    if (queue >= s->num_priority_queues) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Screening register selected out of range queue %d\n",
+                      queue);
+        /*
+         * This is a best guess at reasonable behaviour in the absence
+         * of a datasheet to confirm it.
+         */
+        queue = 0;
+    }
+    return queue;
 }
 
 static uint32_t gem_get_queue_base_addr(CadenceGEMState *s, bool tx, int q)
-- 
2.43.0



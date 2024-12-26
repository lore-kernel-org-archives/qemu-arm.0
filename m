Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5601855njk;
        Thu, 26 Dec 2024 00:28:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUx7SZC1IGIVJp3+lE3VPI9QTzlaVqD/lu5cbG/iVNFC+c3wg7mnkk2QCCPReCVpkOHnl7VPKSwlBqhGg==@linaro.org
X-Google-Smtp-Source: AGHT+IEEvGhA4HhZMJ4723itt1a4k51CZnmPAR4g+slT0ecDwJrKoQhUoGMrpyd2QUunY2pIS2oe
X-Received: by 2002:a05:620a:2491:b0:7a8:554:c368 with SMTP id af79cd13be357-7b9aa91f144mr4536742085a.6.1735201725009;
        Thu, 26 Dec 2024 00:28:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735201724; cv=none;
        d=google.com; s=arc-20240605;
        b=lD23sKJCDwdv8AOt9G1aEdJwKvDX3BX5XCeEZNdBfrCzAC5/vg27N8jtxveA1eaVZR
         7fkzvewGKnCjsez1jyaEoE0zg8QNyi6WVMpwmPI9rVCSN93s8J6YpjwPD3yb2Tm0NQTW
         tXq1heg4zY51/ZD9q3uWvG1Wg8NH/0U4txmD6DKYA4/KtH77J3sUGHBIIVX6w9wVq/dX
         f64arrkCsM+fX1SiDetpDTLY91tZzPBltnN9Ys74HdXKgFDsSYEWyYrysTT9d9qUohxG
         kq0uQN/TlkusJAnH/84JVvv/8VCGhXNn7iSUtCznwgLwiZWKE7nfu8cfdhzEdhkQqqNg
         nOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=VvRWJc9sthcySpDtWp0rsZQlL3SZjKq9uWDFTrlLObQ=;
        fh=zQw0TdQBr8rv2LTOrUFbz1N9p/ZaOM9ZCfRVkwpoz98=;
        b=QANg9vy2TkYcwsb7H2/lFaO3PVkLHpKrWoc3EYL23xBJYO5TZTuBTa5ht1UzNDQ+ZT
         yOCfh2f0u9hGqyKlDCoztBYOzLkfYYztiPqv5LsSLCHKLy6k81RpuCACVMll98n18PXB
         Qw4xtNbegK/Uq/um9QqJnHYPJQggZxLYaSb+n0vznDNsZLuUY4QQhyxWdFDE4y9B+Y/F
         BHx7zrhcmfmcmBtgbxRd3DPWQOHf5aDiW4adpoHwk9cSRQkAKs+eFzh5TaBjWmGB57XY
         TcFAr5eVHr532viRrJThBIee+hiv4OeOF/P1pzxO8oCA6F6peWtfNCABlMyPBgTr2UDg
         CdLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TVoki9lG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ec02f6esi184043461cf.662.2024.12.26.00.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 00:28:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TVoki9lG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tQjEY-0004Bm-Vl; Thu, 26 Dec 2024 03:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3tBNtZwgKCtEJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1tQjEW-00043p-Ob
 for qemu-devel@nongnu.org; Thu, 26 Dec 2024 03:28:40 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3tBNtZwgKCtEJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1tQjEV-0001Da-6N
 for qemu-devel@nongnu.org; Thu, 26 Dec 2024 03:28:40 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2ee3206466aso8005534a91.1
 for <qemu-devel@nongnu.org>; Thu, 26 Dec 2024 00:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735201717; x=1735806517; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=VvRWJc9sthcySpDtWp0rsZQlL3SZjKq9uWDFTrlLObQ=;
 b=TVoki9lG4yfVKsd0JqX3lbq/K18fnqdYBGjHw06xDXPFBIm6JvY7V1Ri2r3XxthkJf
 Be0OsTpzXly6Vsx9MAmf8ot4z5Wz/Yf4NU8wBcitJGn6l01rhAAiPG8QsPMjFoh73msX
 evHME2hnEnyAMRGG1Ry5a8iXlQbOHCpdzsawvvCzTPmY92QtgJN2P4mgmOr4VY7pWfYK
 KO6Nr8DxDX0gh218LsAh5985vWW1XLlIBF7rSG21HXFz+m5Xb/QJLOFA2NSkqOsKhYo1
 AoEB2BrT/q5eFgnHscIfDzUt7xT9WRcX2WE7lr7PVDM6NuLk5vejGvrFszRcV99TbWhi
 T8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735201717; x=1735806517;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VvRWJc9sthcySpDtWp0rsZQlL3SZjKq9uWDFTrlLObQ=;
 b=IjDhMKDeNz5B38pWAATy06flsBLLakza8ow8h7/8GODOQoKfBzGZOepYbZeZD3yZF+
 KTQEplGtv+MzaTwZMkSyy6E5J+OJFVsNhxtAhWBROh0A+YAtUaxC+hjNXkUcF2NdouPV
 SYhua2wfIjAI9CSk4aOZo6oaDWPO+Wu9gF162QGBfadaNRJVfCLLhaO+79O8oycgeuVF
 SrcESYXjSu83SW6ZA8mdVB/a47eJBi+3UOHdof5mWDBE3pNbQC9S/lSKzMovGU6JAcIn
 waw1FUl1llhxKYQqhqyOHvwQcFuHo1K1+hHc3TZW56PsgLGmAj+hXW5ZNi9fFH6/FzH+
 h+ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmLVw/eMDSMCDqtteyJLcIp6TTBYeYE1/FtA/OUW81SHfgkVzsq6srrQMCnIg7yH+AU/svlF/0NIzU@nongnu.org
X-Gm-Message-State: AOJu0YzUF8h+5e2Nzc9tXN4QBZ9UmUY5xL3PQfOpTNVRg6R30Xw3ZyT+
 wSBNtQaQ3bXR4AsGX50hG77WWySUNwqa1XQQnFRhkKeRj5GJkhAZbQw4Jsm3gjRu56A4rZQgIFB
 hGP6drzO3Cw==
X-Received: from pjbnb13.prod.google.com ([2002:a17:90b:35cd:b0:2ef:d283:5089])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:c2c4:b0:2ee:463d:8e8d with SMTP id
 98e67ed59e1d1-2f4437bf735mr40289577a91.14.1735201716837; 
 Thu, 26 Dec 2024 00:28:36 -0800 (PST)
Date: Thu, 26 Dec 2024 08:27:52 +0000
In-Reply-To: <20241226082800.2887689-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226082800.2887689-10-wuhaotsh@google.com>
Subject: [PATCH v2 09/17] hw/misc: Store DRAM size in NPCM8XX GCR Module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3tBNtZwgKCtEJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QBiND9NwBQgO

NPCM8XX boot block stores the DRAM size in SCRPAD_B register in GCR
module. Since we don't simulate a detailed memory controller, we
need to store this information directly similar to the NPCM7XX's
INCTR3 register.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm_gcr.c         | 24 ++++++++++++++++++++++++
 include/hw/misc/npcm_gcr.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
index 52d0fa07ea..a4c9643119 100644
--- a/hw/misc/npcm_gcr.c
+++ b/hw/misc/npcm_gcr.c
@@ -279,6 +279,19 @@ static void npcm7xx_gcr_enter_reset(Object *obj, ResetType type)
     s->regs[NPCM7XX_GCR_INTCR3] = s->reset_intcr3;
 }
 
+static void npcm8xx_gcr_enter_reset(Object *obj, ResetType type)
+{
+    NPCMGCRState *s = NPCM_GCR(obj);
+    NPCMGCRClass *c = NPCM_GCR_GET_CLASS(obj);
+
+    memcpy(s->regs, c->cold_reset_values, c->nr_regs * sizeof(uint32_t));
+    /* These 3 registers are at the same location in both 7xx and 8xx. */
+    s->regs[NPCM8XX_GCR_PWRON] = s->reset_pwron;
+    s->regs[NPCM8XX_GCR_MDLR] = s->reset_mdlr;
+    s->regs[NPCM8XX_GCR_INTCR3] = s->reset_intcr3;
+    s->regs[NPCM8XX_GCR_SCRPAD_B] = s->reset_scrpad_b;
+}
+
 static void npcm_gcr_realize(DeviceState *dev, Error **errp)
 {
     ERRP_GUARD();
@@ -322,6 +335,14 @@ static void npcm_gcr_realize(DeviceState *dev, Error **errp)
      * https://github.com/Nuvoton-Israel/u-boot/blob/2aef993bd2aafeb5408dbaad0f3ce099ee40c4aa/board/nuvoton/poleg/poleg.c#L244
      */
     s->reset_intcr3 |= ctz64(dram_size / NPCM7XX_GCR_MIN_DRAM_SIZE) << 8;
+
+    /*
+     * The boot block starting from 0.0.6 for NPCM8xx SoCs stores the DRAM size
+     * in the SCRPAD2 registers. We need to set this field correctly since
+     * the initialization is skipped as we mentioned above.
+     * https://github.com/Nuvoton-Israel/u-boot/blob/npcm8mnx-v2019.01_tmp/board/nuvoton/arbel/arbel.c#L737
+     */
+    s->reset_scrpad_b = dram_size;
 }
 
 static void npcm_gcr_init(Object *obj)
@@ -371,18 +392,21 @@ static void npcm7xx_gcr_class_init(ObjectClass *klass, void *data)
 
     c->nr_regs = NPCM7XX_GCR_NR_REGS;
     c->cold_reset_values = npcm7xx_cold_reset_values;
+    rc->phases.enter = npcm7xx_gcr_enter_reset;
 }
 
 static void npcm8xx_gcr_class_init(ObjectClass *klass, void *data)
 {
     NPCMGCRClass *c = NPCM_GCR_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     QEMU_BUILD_BUG_ON(NPCM8XX_GCR_REGS_END > NPCM_GCR_MAX_NR_REGS);
     QEMU_BUILD_BUG_ON(NPCM8XX_GCR_REGS_END != NPCM8XX_GCR_NR_REGS);
     dc->desc = "NPCM8xx System Global Control Registers";
     c->nr_regs = NPCM8XX_GCR_NR_REGS;
     c->cold_reset_values = npcm8xx_cold_reset_values;
+    rc->phases.enter = npcm8xx_gcr_enter_reset;
 }
 
 static const TypeInfo npcm_gcr_info[] = {
diff --git a/include/hw/misc/npcm_gcr.h b/include/hw/misc/npcm_gcr.h
index 9ac76ca9ab..d81bb9afb2 100644
--- a/include/hw/misc/npcm_gcr.h
+++ b/include/hw/misc/npcm_gcr.h
@@ -68,6 +68,7 @@ typedef struct NPCMGCRState {
     uint32_t reset_pwron;
     uint32_t reset_mdlr;
     uint32_t reset_intcr3;
+    uint32_t reset_scrpad_b;
 } NPCMGCRState;
 
 typedef struct NPCMGCRClass {
-- 
2.47.1.613.gc27f4b7a9f-goog


Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp287074lfu;
        Tue, 5 Apr 2022 15:42:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSmejnaqDYMzUk5hzJ5sL/GIa6HL6GpmtPrcnqoIJ3FSHtrzf/85hUwJV/VU4Ymef5Pn+m
X-Received: by 2002:a05:622a:138f:b0:2eb:876e:17c6 with SMTP id o15-20020a05622a138f00b002eb876e17c6mr5133010qtk.218.1649198520505;
        Tue, 05 Apr 2022 15:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649198520; cv=none;
        d=google.com; s=arc-20160816;
        b=P2rxWgRvagia8h5JQnUekKjraTj7+gpfJGOCmRMYyQYSF987ypS7zuUO9HFlWx0HIa
         ogekaOehQvM+ELmOERXSN8vfwKK4X9BvqeDCOKecF6IXkE1jFYALDydDgzkoGrF4SjeU
         5BTCQq3a9aZU/+HFY4Fmz2TG7WS5k2hdpM1u1xEqWwJJum5+jocrDXZU4bEkZmqtjpPP
         H1kokUH1LOLT2HPovyL2Fg8Ptc4Zh/F7iA3T7zDNfvgXGxgNwwditBDSsX9i2fbNoLzM
         FOkDc/8jwbTzaLytZEqEy2u4tOKJZUSVWzT1FsHZ0PfWU1VzT4cWUXiokakTr3eqEeVX
         4qCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=VxwmBM2Jxa6Tnjbl3o/I1tQQg4+PrdKCGkpSgbDHqsk=;
        b=Wi1q+brliJCGzhlpKNOcMd2RimJV89kcUJT4VK9rLqUSu6dSeolk48h6bCW19izrQ/
         lqoJivFw/c5gRMdYwjhmM8PwdxO7gNpTyyGgeaQmpV8hwpe3Ty/1wgULVrqcK5tvhntN
         uNw9eKLcQaOMVWmHNxJNP0HCBnFDgSI4mLtRmDSUxsJh8LdhzW8sryDLapmzx44Vu1es
         hxIZoAz13cIqOV730Xk0ThY7tFSNR8GIzKpQ36TyvSUAUY07gIC4uyt27LiLWSCkxQaL
         Nt1vVRI+9Z+DbqsrB40v1vVpkV4H5uxI+TeVmWGJZwolg6Dx4wH0rRK57BIF1SNHG8k5
         mC5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=JoR4Ew6E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020ac85ece000000b002e1fbf3be46si4936392qtx.55.2022.04.05.15.42.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Apr 2022 15:42:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=JoR4Ew6E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:34312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbrs7-0002fe-WE
	for alex.bennee@linaro.org; Tue, 05 Apr 2022 18:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <30MRMYggKCKUbZMFTYXMLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--wuhaotsh.bounces.google.com>)
 id 1nbroX-0004Hp-RJ
 for qemu-arm@nongnu.org; Tue, 05 Apr 2022 18:38:17 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:51800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <30MRMYggKCKUbZMFTYXMLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--wuhaotsh.bounces.google.com>)
 id 1nbroS-00032E-Gd
 for qemu-arm@nongnu.org; Tue, 05 Apr 2022 18:38:16 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 z12-20020a17090a398c00b001ca59a66aa1so399701pjb.1
 for <qemu-arm@nongnu.org>; Tue, 05 Apr 2022 15:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=VxwmBM2Jxa6Tnjbl3o/I1tQQg4+PrdKCGkpSgbDHqsk=;
 b=JoR4Ew6ESkqF4bHPg2soCncHMr58TgHtH+qUTXx0HNfm4oBkcJf+Z9CgpDM3iMtAJA
 bI9kwN45brnff4gHSpWqBkX77uCM7t/Dl1NABKKkbFBjPifm2r1LrzLr5wfMSopAkIbf
 pO4jnxErb2acCg8zwKw8cPZ075Uku72Pf7SzoH8zBM7j15b7N5NWZiT9liI6/g0lUi+r
 3+DB8mKa0YHBCSPDwGKM43w9H8Xxq5tXNw5mH1v1+84dqngWPECH6+7GV9wbq0g2cgZk
 1L/jQv4DGdT7dNMoqvFxy8Rir+cyBbn2XxK/a85NXP0s/VgKzl0pEH4qC1w7l8EgfOlB
 L9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=VxwmBM2Jxa6Tnjbl3o/I1tQQg4+PrdKCGkpSgbDHqsk=;
 b=O8NlmYEsDzDHMh6D7THqq7RlCOdxxJbEUXjgt4eLchjsf5zzvZBnAEfrMloLw4kqDU
 b76PwTKFddCZ0tVnW7pJw42rPpNTkSQnkUsQnuw7FgtireL/wa8d+w1Di/PsR04/Lar2
 00TtR1lfELK5bcAOvW3ml1HOQQ7MY1HCwKWFoxfIlpS6PMNOknW4RsONbDVStEmX/3Il
 rsDqxmm75Y06BcGaaydoszoS5AYkyhlwBhoMhxZZzUKO6ZIH+rKcU5FcehjM6xjNpRti
 TPE4bGVpDtAPOvQd3XwZVGLxB9v1JSvxDxheQhDe7ZwnMkAFl+naomL3vzqwNxIIdmRe
 Z9hw==
X-Gm-Message-State: AOAM531leTo/N3XDCyLjqduRT78i8Y2A8BysZj5iWDGYFu05JmXGEtYv
 w6GlOnQCX8AE0Ql0GJmiTNUJvEU/bZ5i/w==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:903:40c7:b0:156:8b56:5fa1 with SMTP
 id t7-20020a17090340c700b001568b565fa1mr5638624pld.108.1649198288206; Tue, 05
 Apr 2022 15:38:08 -0700 (PDT)
Date: Tue,  5 Apr 2022 15:36:36 -0700
In-Reply-To: <20220405223640.2595730-1-wuhaotsh@google.com>
Message-Id: <20220405223640.2595730-8-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH for-7.1 07/11] hw/misc: Support 8-bytes memop in NPCM GCR
 module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=30MRMYggKCKUbZMFTYXMLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tLWvZwYBqBTS

The NPCM8xx GCR device can be accessed with 64-bit memory operations.
This patch supports that.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/misc/npcm_gcr.c   | 98 +++++++++++++++++++++++++++++++++-----------
 hw/misc/trace-events |  4 +-
 2 files changed, 77 insertions(+), 25 deletions(-)

diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
index 14c298602a..aa81db23d7 100644
--- a/hw/misc/npcm_gcr.c
+++ b/hw/misc/npcm_gcr.c
@@ -201,6 +201,7 @@ static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
     uint32_t reg = offset / sizeof(uint32_t);
     NPCMGCRState *s = opaque;
     NPCMGCRClass *c = NPCM_GCR_GET_CLASS(s);
+    uint64_t value;
 
     if (reg >= c->nr_regs) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -209,9 +210,23 @@ static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
         return 0;
     }
 
-    trace_npcm_gcr_read(offset, s->regs[reg]);
+    switch (size) {
+    case 4:
+        value = s->regs[reg];
+        break;
+
+    case 8:
+        value = s->regs[reg] + (((uint64_t)s->regs[reg + 1]) << 32);
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
 
-    return s->regs[reg];
+    if (s->regs[reg] != 0) {
+        trace_npcm_gcr_read(offset, value);
+    }
+    return value;
 }
 
 static void npcm_gcr_write(void *opaque, hwaddr offset,
@@ -222,7 +237,7 @@ static void npcm_gcr_write(void *opaque, hwaddr offset,
     NPCMGCRClass *c = NPCM_GCR_GET_CLASS(s);
     uint32_t value = v;
 
-    trace_npcm_gcr_write(offset, value);
+    trace_npcm_gcr_write(offset, v);
 
     if (reg >= c->nr_regs) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -231,29 +246,65 @@ static void npcm_gcr_write(void *opaque, hwaddr offset,
         return;
     }
 
-    switch (reg) {
-    case NPCM7XX_GCR_PDID:
-    case NPCM7XX_GCR_PWRON:
-    case NPCM7XX_GCR_INTSR:
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n",
-                      __func__, offset);
-        return;
-
-    case NPCM7XX_GCR_RESSR:
-    case NPCM7XX_GCR_CP2BST:
-        /* Write 1 to clear */
-        value = s->regs[reg] & ~value;
+    switch (size) {
+    case 4:
+        switch (reg) {
+        case NPCM7XX_GCR_PDID:
+        case NPCM7XX_GCR_PWRON:
+        case NPCM7XX_GCR_INTSR:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n",
+                          __func__, offset);
+            return;
+
+        case NPCM7XX_GCR_RESSR:
+        case NPCM7XX_GCR_CP2BST:
+            /* Write 1 to clear */
+            value = s->regs[reg] & ~value;
+            break;
+
+        case NPCM7XX_GCR_RLOCKR1:
+        case NPCM7XX_GCR_MDLR:
+            /* Write 1 to set */
+            value |= s->regs[reg];
+            break;
+        };
+        s->regs[reg] = value;
         break;
 
-    case NPCM7XX_GCR_RLOCKR1:
-    case NPCM7XX_GCR_MDLR:
-        /* Write 1 to set */
-        value |= s->regs[reg];
+    case 8:
+        s->regs[reg] = value;
+        s->regs[reg + 1] = v >> 32;
         break;
-    };
 
-    s->regs[reg] = value;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static bool npcm_gcr_check_mem_op(void *opaque, hwaddr offset,
+                                  unsigned size, bool is_write,
+                                  MemTxAttrs attrs)
+{
+    NPCMGCRClass *c = NPCM_GCR_GET_CLASS(opaque);
+
+    if (offset >= c->nr_regs * sizeof(uint32_t)) {
+        return false;
+    }
+
+    switch (size) {
+    case 4:
+        return true;
+    case 8:
+        if (offset >= NPCM8XX_GCR_SCRPAD_00 * sizeof(uint32_t) &&
+            offset < (NPCM8XX_GCR_NR_REGS - 1) * sizeof(uint32_t)) {
+            return true;
+        } else {
+            return false;
+        }
+    default:
+        return false;
+    }
 }
 
 static const struct MemoryRegionOps npcm_gcr_ops = {
@@ -262,7 +313,8 @@ static const struct MemoryRegionOps npcm_gcr_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid      = {
         .min_access_size        = 4,
-        .max_access_size        = 4,
+        .max_access_size        = 8,
+        .accepts                = npcm_gcr_check_mem_op,
         .unaligned              = false,
     },
 };
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 02650acfff..2ffec963e7 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -103,8 +103,8 @@ npcm_clk_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " value:
 npcm_clk_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
 
 # npcm_gcr.c
-npcm_gcr_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
-npcm_gcr_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
+npcm_gcr_read(uint64_t offset, uint64_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx64
+npcm_gcr_write(uint64_t offset, uint64_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx64
 
 # npcm7xx_mft.c
 npcm7xx_mft_read(const char *name, uint64_t offset, uint16_t value) "%s: offset: 0x%04" PRIx64 " value: 0x%04" PRIx16
-- 
2.35.1.1094.g7c7d902a7c-goog


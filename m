Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1333591ejc;
        Fri, 13 Oct 2023 00:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6u/HHM5OYNgg3RmOhRaQhyLs/b3Tk5kYF11GJDqQ2Qme/vdNfCfrbR1RWyuwwchN4mTHp
X-Received: by 2002:a05:6214:dc9:b0:66d:178e:36d3 with SMTP id 9-20020a0562140dc900b0066d178e36d3mr5707578qvt.53.1697183956740;
        Fri, 13 Oct 2023 00:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183956; cv=none;
        d=google.com; s=arc-20160816;
        b=CtHVDOG2JiZlWhrI4g+lLwz+l3dbfeqxjowPhdWFv7bEJSKDsmjsblHpD+EW9GSW8h
         j+xK/rYZ4LCOANSJBdwr30fHTfyL3sVDd+SIp/vkaNBIrdPiaDRx/+5CGg4EhWEeAcaz
         QnFjjpBkdQSWdC9a5tPFQ+XKXAGn2oxj+YP26fEuEiwuUZsLKQVGwAlk94pIL3l0L/X7
         Na5OPaK5VY8BoAKm3bPWc160FTnoIWZ5YWLJTPakrrxuZ+dDpdVEgkCx5WeV2/Olg5cR
         eIyVf0PnxVYaeGPIWsg/LvMaJPm4Wtu7oNv/LMNotn3oix6+4mE2yCsh/UF17QkYy/vU
         QNjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dE8XNy6rmEb7aulR3k0RbYvqKHn1hSxS8SLgpa+KKwg=;
        fh=Q0jO3R00X7xpJj88jh+KBXHogKGd67mDrPl+0FGDx9Q=;
        b=eeCHyGIN421xTjn14ewBZPPGIcsZW6zvh8JRWha6jDtojUhSBLEcfqlKRFgB2L2PpO
         WeeJUpBF4+H6StZIr8yr0FU2NM1WBocMsk5tyXFmNLKft0BZOLCi8N87ON3U4Yw/rIVI
         77g4nHDGAQdYHxXvCquj161Y4PXaesbMSOvrYgzGfticcPDsY9plEFy5hDEuGfcFjIP4
         I9b7mDH8VegBX1a3MQcMTo4cV+5AaiNQ0zlwnnS/w1J+sCNKwOqhCQa6VjxnfzIJNLhk
         ce7H/U9/XywqCcSKNEEplyVdzLzXe7IGDmBRf4iuwPFPqYC+upv9g97UJFBTEi3vgu0J
         ZqDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q/BnV+Q9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12-20020a0ceb0c000000b0065b034d681asi796316qvp.528.2023.10.13.00.59.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:59:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q/BnV+Q9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCzH-0004zj-1G; Fri, 13 Oct 2023 03:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCyA-0002BU-01
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:52:27 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxq-0005Kt-0C
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:52:25 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32d834ec222so1726668f8f.0
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183523; x=1697788323; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dE8XNy6rmEb7aulR3k0RbYvqKHn1hSxS8SLgpa+KKwg=;
 b=q/BnV+Q9SywYRrAdwoYICf68ppQ8E9b6DyIaRCKnTsJGSjcFtjAnVQWWu6UaU27hI6
 LXtLWxuJLxpOi5QtN7P6W2cCtZI1uoVW3ITZVKDF5MGrcEgd63YYsT0z4jI1ilWqsOYp
 LR5NJ581JuVMoNoR8P2M0ViPzC76JxqVDvwDJ7HC+DCSGFClgkTK94RVfJpSGK3n9eTA
 3m3mR+0ZSrsbaEZFx1StBjvT1rECVkOLNaEVRqOEjgTMBCtDu3duVl+DnyVu5tpjVV6n
 tCwrYOOiBVb/fVDdThdboK3oUlT4d9SVYJ0RiT1Q5uxu5be/kVFV6Kaczp1CE8LQiQbZ
 vk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183523; x=1697788323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dE8XNy6rmEb7aulR3k0RbYvqKHn1hSxS8SLgpa+KKwg=;
 b=L/jqNUzdhg7Alx3H0kO4WHQMwd6qpjcdVShVO0wDNGiv7LIgF0A2jjEbJsgEd3NCOj
 U5CKxy7a9sXy/8zhVFkaz6HFOblWhHPwzK0lwJSpjsq4QUXYXExmdu6gvDg/rnF8/ngE
 2ZQopDuyZpDDzzc+3/VXoZHiiI7mn3FEpzhbdB1dW6TJi508hMXmLDbcY++pk/0c40zW
 RBFxDJSMOcy9ybkciHAF/RoIVmbNF3ncPHPF3aHTNa/X6qfSEmNZq8mxlR+b4w5Emj60
 DaEtVL6SS0LJX9/0h7zvw7yU34CB3MyQK7FKyLxIBj72F2vtHetLBZo0IpveexP0qhfC
 8ELQ==
X-Gm-Message-State: AOJu0YwZrN3IGYWuAiJUwX9bvoRvDmTXh8zblWKw/HxnAVa2VM2ckYpJ
 T8YAzzCBaW826LkBk7ntOJ8FTA==
X-Received: by 2002:a5d:5b1b:0:b0:329:6e92:8d73 with SMTP id
 bx27-20020a5d5b1b000000b003296e928d73mr20177928wrb.67.1697183523437; 
 Fri, 13 Oct 2023 00:52:03 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:52:02 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [RFC PATCH 55/78] hw/display: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:48:17 +0300
Message-Id: <7c8de3cb19cf335ec462500041fd9f12dc9f0c0a.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qyQbNP1pV75r

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/display/cg3.c        | 2 +-
 hw/display/cirrus_vga.c | 2 +-
 hw/display/tcx.c        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index 2e9656ae1c..53eb9831b2 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -199,65 +199,65 @@ static uint64_t cg3_reg_read(void *opaque, hwaddr addr, unsigned size)
 static void cg3_reg_write(void *opaque, hwaddr addr, uint64_t val,
                           unsigned size)
 {
     CG3State *s = opaque;
     uint8_t regval;
     int i;
 
     trace_cg3_write(addr, val, size);
     switch (addr) {
     case CG3_REG_BT458_ADDR:
         s->dac_index = val;
         s->dac_state = 0;
         break;
     case CG3_REG_BT458_COLMAP:
         /* This register can be written to as either a long word or a byte */
         if (size == 1) {
             val <<= 24;
         }
 
         for (i = 0; i < size; i++) {
             regval = val >> 24;
 
             switch (s->dac_state) {
             case 0:
                 s->r[s->dac_index] = regval;
                 s->dac_state++;
                 break;
             case 1:
                 s->g[s->dac_index] = regval;
                 s->dac_state++;
                 break;
             case 2:
                 s->b[s->dac_index] = regval;
                 /* Index autoincrement */
                 s->dac_index = (s->dac_index + 1) & 0xff;
-                /* fall through */
+                fallthrough;
             default:
                 s->dac_state = 0;
                 break;
             }
             val <<= 8;
         }
         s->full_update = 1;
         break;
     case CG3_REG_FBC_CTRL:
         s->regs[0] = val;
         break;
     case CG3_REG_FBC_STATUS:
         if (s->regs[1] & CG3_SR_PENDING_INT) {
             /* clear interrupt */
             s->regs[1] &= ~CG3_SR_PENDING_INT;
             qemu_irq_lower(s->irq);
         }
         break;
     case CG3_REG_FBC_CURSTART ... CG3_REG_SIZE - 1:
         s->regs[addr - 0x10] = val;
         break;
     default:
         qemu_log_mask(LOG_UNIMP,
                   "cg3: Unimplemented register write "
                   "reg 0x%" HWADDR_PRIx " size 0x%x value 0x%" PRIx64 "\n",
                   addr, size, val);
         break;
     }
 }
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index b80f98b6c4..f1513a084c 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -1319,97 +1319,97 @@ static int cirrus_vga_read_sr(CirrusVGAState * s)
 static void cirrus_vga_write_sr(CirrusVGAState * s, uint32_t val)
 {
     switch (s->vga.sr_index) {
     case 0x00:                  // Standard VGA
     case 0x01:                  // Standard VGA
     case 0x02:                  // Standard VGA
     case 0x03:                  // Standard VGA
     case 0x04:                  // Standard VGA
         s->vga.sr[s->vga.sr_index] = val & sr_mask[s->vga.sr_index];
         if (s->vga.sr_index == 1)
             s->vga.update_retrace_info(&s->vga);
         break;
     case 0x06:                  // Unlock Cirrus extensions
         val &= 0x17;
         if (val == 0x12) {
             s->vga.sr[s->vga.sr_index] = 0x12;
         } else {
             s->vga.sr[s->vga.sr_index] = 0x0f;
         }
         break;
     case 0x10:
     case 0x30:
     case 0x50:
     case 0x70:                  // Graphics Cursor X
     case 0x90:
     case 0xb0:
     case 0xd0:
     case 0xf0:                  // Graphics Cursor X
         s->vga.sr[0x10] = val;
         s->vga.hw_cursor_x = (val << 3) | (s->vga.sr_index >> 5);
         break;
     case 0x11:
     case 0x31:
     case 0x51:
     case 0x71:                  // Graphics Cursor Y
     case 0x91:
     case 0xb1:
     case 0xd1:
     case 0xf1:                  // Graphics Cursor Y
         s->vga.sr[0x11] = val;
         s->vga.hw_cursor_y = (val << 3) | (s->vga.sr_index >> 5);
         break;
     case 0x07:                  // Extended Sequencer Mode
         cirrus_update_memory_access(s);
-        /* fall through */
+        fallthrough;
     case 0x08:                  // EEPROM Control
     case 0x09:                  // Scratch Register 0
     case 0x0a:                  // Scratch Register 1
     case 0x0b:                  // VCLK 0
     case 0x0c:                  // VCLK 1
     case 0x0d:                  // VCLK 2
     case 0x0e:                  // VCLK 3
     case 0x0f:                  // DRAM Control
     case 0x13:                  // Graphics Cursor Pattern Address
     case 0x14:                  // Scratch Register 2
     case 0x15:                  // Scratch Register 3
     case 0x16:                  // Performance Tuning Register
     case 0x18:                  // Signature Generator Control
     case 0x19:                  // Signature Generator Result
     case 0x1a:                  // Signature Generator Result
     case 0x1b:                  // VCLK 0 Denominator & Post
     case 0x1c:                  // VCLK 1 Denominator & Post
     case 0x1d:                  // VCLK 2 Denominator & Post
     case 0x1e:                  // VCLK 3 Denominator & Post
     case 0x1f:                  // BIOS Write Enable and MCLK select
         s->vga.sr[s->vga.sr_index] = val;
 #ifdef DEBUG_CIRRUS
         printf("cirrus: handled outport sr_index %02x, sr_value %02x\n",
                s->vga.sr_index, val);
 #endif
         break;
     case 0x12:                  // Graphics Cursor Attribute
         s->vga.sr[0x12] = val;
         s->vga.force_shadow = !!(val & CIRRUS_CURSOR_SHOW);
 #ifdef DEBUG_CIRRUS
         printf("cirrus: cursor ctl SR12=%02x (force shadow: %d)\n",
                val, s->vga.force_shadow);
 #endif
         break;
     case 0x17:                  // Configuration Readback and Extended Control
         s->vga.sr[s->vga.sr_index] = (s->vga.sr[s->vga.sr_index] & 0x38)
                                    | (val & 0xc7);
         cirrus_update_memory_access(s);
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "cirrus: outport sr_index 0x%02x, sr_value 0x%02x\n",
                       s->vga.sr_index, val);
         break;
     }
 }
 
 /***************************************
  *
  *  I/O access at 0x3c6
  *
  ***************************************/
diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index 1b27b64f6d..e21450d726 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -381,26 +381,26 @@ static void tcx_reset(DeviceState *d)
 static uint64_t tcx_dac_readl(void *opaque, hwaddr addr,
                               unsigned size)
 {
     TCXState *s = opaque;
     uint32_t val = 0;
 
     switch (s->dac_state) {
     case 0:
         val = s->r[s->dac_index] << 24;
         s->dac_state++;
         break;
     case 1:
         val = s->g[s->dac_index] << 24;
         s->dac_state++;
         break;
     case 2:
         val = s->b[s->dac_index] << 24;
         s->dac_index = (s->dac_index + 1) & 0xff; /* Index autoincrement */
-        /* fall through */
+        fallthrough;
     default:
         s->dac_state = 0;
         break;
     }
 
     return val;
 }
@@ -408,43 +408,43 @@ static uint64_t tcx_dac_readl(void *opaque, hwaddr addr,
 static void tcx_dac_writel(void *opaque, hwaddr addr, uint64_t val,
                            unsigned size)
 {
     TCXState *s = opaque;
     unsigned index;
 
     switch (addr) {
     case 0: /* Address */
         s->dac_index = val >> 24;
         s->dac_state = 0;
         break;
     case 4:  /* Pixel colours */
     case 12: /* Overlay (cursor) colours */
         if (addr & 8) {
             index = (s->dac_index & 3) + 256;
         } else {
             index = s->dac_index;
         }
         switch (s->dac_state) {
         case 0:
             s->r[index] = val >> 24;
             update_palette_entries(s, index, index + 1);
             s->dac_state++;
             break;
         case 1:
             s->g[index] = val >> 24;
             update_palette_entries(s, index, index + 1);
             s->dac_state++;
             break;
         case 2:
             s->b[index] = val >> 24;
             update_palette_entries(s, index, index + 1);
             s->dac_index = (s->dac_index + 1) & 0xff; /* Index autoincrement */
-            /* fall through */
+            fallthrough;
         default:
             s->dac_state = 0;
             break;
         }
         break;
     default: /* Control registers */
         break;
     }
 }
-- 
2.39.2


Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1334263ejc;
        Fri, 13 Oct 2023 01:00:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvxGVjiENEnKWb3tNkqCu3q5oNB7uLFhnNXgbeZBFGieLDM4AhyoFXYLRBLUwK3g/cCiNg
X-Received: by 2002:a05:620a:2802:b0:776:f8b5:c4c with SMTP id f2-20020a05620a280200b00776f8b50c4cmr26328399qkp.20.1697184034158;
        Fri, 13 Oct 2023 01:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697184034; cv=none;
        d=google.com; s=arc-20160816;
        b=WsYkbVqrGpbhGISs7TthHdzUSYTUEv3sdyklcPfJBq21up8xqy4A9Qx7v19B4g2Qai
         hyXM5s2H8IBo/KjZGTpG4LkUSt8AGmNWGDvUzz+nptgFS1a/gCxk4HmUKAMp1EjL9FqO
         Vl/ZJu0U63jSMp6swoCYpjioCtGxNaOnsdV1OxnhgBi2QKUoRVtZ8iuz1Mc0HGHUu15i
         yFPWeYDuCFITqJryVG+k2HRin+Fra8EhuDbkQ6SAzyxMvI7DiW78MgB3Hsoxf9ONfPib
         +Eus/SPACQNMeCIk/5qPdKYDJiY9wHR7U0WMXUz2IhT8VYrW7TGn7w+0DD9vap+qq0L3
         5U1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IHHNv9a7p6HwYLVLm/9xkBe05lXBtnT5aw37gy92uds=;
        fh=bAPy1wDhiXj0nUQScGdi/MSmTliI7/IZx8YckmjBhRY=;
        b=bsAXydDkBg14xOXypRuJpbCfydNUyY8A0m7l/5P15UkvLus0dFfmeVgLNasDZbXAwi
         3deKmnC3fqubZ7aGnyA0/mD7X8eXdSwPhSbiLVw83XshTACi/hIHne6PIiflgXCFb+pI
         BViEkmcZI9boNBkEh/wAygvfyxVNt7g9vUAFtiI5ghik8Pm5tBhsSsr0nD0PIvdHS+WQ
         IE1dyu9GvLfk/RBwm/G95kxR2upXkiD19X99LShgplGrIZiEtZqrKvQfBi389/2JfX86
         Akhv+Sv3mxF/qPDfb03hRwuPD9P9terX/bHa9TtPV9p7RdpaF6C5PAhLYBnuY2N0fAMV
         Oikw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zYvynB0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv19-20020a05620a1b9300b00775d0319908si813360qkb.16.2023.10.13.01.00.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:00:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zYvynB0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrD3z-0008W0-S9; Fri, 13 Oct 2023 03:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrD3x-0008KU-NX
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:58:25 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrD3u-0006oU-Ue
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:58:25 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40566f89f6eso21725475e9.3
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183901; x=1697788701; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IHHNv9a7p6HwYLVLm/9xkBe05lXBtnT5aw37gy92uds=;
 b=zYvynB0D76u6kjTeBKAGoCryi4fD4cnYqSsHT1g83daA7gISn4StOVE9i89e8LGwvx
 HBxF3rDqaalh9dz3nr0V89QfOLxdDBvH5zV/o3CU2qZXCN/J+o5gYEFQBCNuKliZ96cm
 +BT+Aa18mVqUtVuyh97F1zJJCtJnUCQO40yYgmwxSkLAakpVrtOJdMPXrTlp16qNrhNk
 5p32OvNwAOZ/o7vHrV4tkGXj1bcQoNr7HwxYoxgKqnMPZCmzFg1CDvVqbD5zLeTe1K25
 c/bcSpz69/zt9JWo9tEIoZ2fTu1a+InhNAjTLIbk+kli7jZlYtbdghLzPtqtIF83Ahqd
 NAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183901; x=1697788701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IHHNv9a7p6HwYLVLm/9xkBe05lXBtnT5aw37gy92uds=;
 b=Kqi9howNZ3iV1x4Rcz2cDKqd216JuVQRi3r8KV1rSFpEYfBSDiFO/UweNWKK6ZD3IR
 tgFq6o6Oaqtan0RkBbydl/W3rvwxF4kkdORKwogdzg6EAu6gW6mbmLHYa3COGx/SkQlI
 iMCXyD1GsLZ2y+q99hT0aeEnAXq8NvoBRAGcYU4VRYiDZKL9+PQeCC2UKR1MVYWVjriz
 IUVwpx7exRCRR1tnj0FahGaniLEk81f/0FpnLmBRPoZvfI6vJaLWMJovZVDnJq8qd9Qm
 wZVnMQUM0ctydMZSOxcKGn2s88MNH5KKQtaJR8Y9aPdfEjJDweBjrV/EWj0ylCCCzP5m
 /oqg==
X-Gm-Message-State: AOJu0Yx/unjARpGrexsWHYNZbj+xcFfaQfkg/nS4tH2QZCVsvnjz/KmS
 RB3GVlknyCtIu453CTYqv2WHaQ==
X-Received: by 2002:a05:600c:220b:b0:406:7029:c4f2 with SMTP id
 z11-20020a05600c220b00b004067029c4f2mr22545778wml.26.1697183901610; 
 Fri, 13 Oct 2023 00:58:21 -0700 (PDT)
Received: from localhost.localdomain (adsl-26.37.6.0.tellas.gr. [37.6.0.26])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a05600c224a00b003fe23b10fdfsm1798183wmm.36.2023.10.13.00.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:58:21 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm@nongnu.org (open list:STM32F205)
Subject: [RFC PATCH v2 13/78] hw/adc: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:56:40 +0300
Message-Id: <5bd9400e01587cac991c16c51ce0f89982f3d529.1697183699.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183699.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183699.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WIKQNrRsiCPR

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/adc/aspeed_adc.c | 12 ++++++------
 hw/adc/zynq-xadc.c  |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
index 0d29663129..f9f5f7bb17 100644
--- a/hw/adc/aspeed_adc.c
+++ b/hw/adc/aspeed_adc.c
@@ -107,59 +107,59 @@ static uint32_t read_channel_sample(AspeedADCEngineState *s, int reg)
 static uint64_t aspeed_adc_engine_read(void *opaque, hwaddr addr,
                                        unsigned int size)
 {
     AspeedADCEngineState *s = ASPEED_ADC_ENGINE(opaque);
     int reg = TO_REG(addr);
     uint32_t value = 0;
 
     switch (reg) {
     case BOUNDS_CHANNEL_8 ... BOUNDS_CHANNEL_15:
         if (s->nr_channels <= 8) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: engine[%u]: "
                           "bounds register %u invalid, only 0...7 valid\n",
                           __func__, s->engine_id, reg - BOUNDS_CHANNEL_0);
             break;
         }
-        /* fallthrough */
+        fallthrough;
     case HYSTERESIS_CHANNEL_8 ... HYSTERESIS_CHANNEL_15:
         if (s->nr_channels <= 8) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: engine[%u]: "
                           "hysteresis register %u invalid, only 0...7 valid\n",
                           __func__, s->engine_id, reg - HYSTERESIS_CHANNEL_0);
             break;
         }
-        /* fallthrough */
+        fallthrough;
     case BOUNDS_CHANNEL_0 ... BOUNDS_CHANNEL_7:
     case HYSTERESIS_CHANNEL_0 ... HYSTERESIS_CHANNEL_7:
     case ENGINE_CONTROL:
     case INTERRUPT_CONTROL:
     case VGA_DETECT_CONTROL:
     case CLOCK_CONTROL:
     case INTERRUPT_SOURCE:
     case COMPENSATING_AND_TRIMMING:
         value = s->regs[reg];
         break;
     case DATA_CHANNEL_9_AND_8 ... DATA_CHANNEL_15_AND_14:
         if (s->nr_channels <= 8) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: engine[%u]: "
                           "data register %u invalid, only 0...3 valid\n",
                           __func__, s->engine_id, reg - DATA_CHANNEL_1_AND_0);
             break;
         }
-        /* fallthrough */
+        fallthrough;
     case DATA_CHANNEL_1_AND_0 ... DATA_CHANNEL_7_AND_6:
         value = read_channel_sample(s, reg);
         /* Allow 16-bit reads of the data registers */
         if (addr & 0x2) {
             assert(size == 2);
             value >>= 16;
         }
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "%s: engine[%u]: 0x%" HWADDR_PRIx "\n",
                       __func__, s->engine_id, addr);
         break;
     }
 
     trace_aspeed_adc_engine_read(s->engine_id, addr, value);
     return value;
 }
@@ -167,69 +167,69 @@ static uint64_t aspeed_adc_engine_read(void *opaque, hwaddr addr,
 static void aspeed_adc_engine_write(void *opaque, hwaddr addr, uint64_t value,
                                     unsigned int size)
 {
     AspeedADCEngineState *s = ASPEED_ADC_ENGINE(opaque);
     int reg = TO_REG(addr);
     uint32_t init = 0;
 
     trace_aspeed_adc_engine_write(s->engine_id, addr, value);
 
     switch (reg) {
     case ENGINE_CONTROL:
         init = !!(value & ASPEED_ADC_ENGINE_EN);
         init *= ASPEED_ADC_ENGINE_INIT;
 
         value &= ~ASPEED_ADC_ENGINE_INIT;
         value |= init;
 
         value &= ~ASPEED_ADC_ENGINE_AUTO_COMP;
         break;
     case INTERRUPT_CONTROL:
     case VGA_DETECT_CONTROL:
     case CLOCK_CONTROL:
         break;
     case DATA_CHANNEL_9_AND_8 ... DATA_CHANNEL_15_AND_14:
         if (s->nr_channels <= 8) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: engine[%u]: "
                           "data register %u invalid, only 0...3 valid\n",
                           __func__, s->engine_id, reg - DATA_CHANNEL_1_AND_0);
             return;
         }
-        /* fallthrough */
+        fallthrough;
     case BOUNDS_CHANNEL_8 ... BOUNDS_CHANNEL_15:
         if (s->nr_channels <= 8) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: engine[%u]: "
                           "bounds register %u invalid, only 0...7 valid\n",
                           __func__, s->engine_id, reg - BOUNDS_CHANNEL_0);
             return;
         }
-        /* fallthrough */
+        fallthrough;
     case DATA_CHANNEL_1_AND_0 ... DATA_CHANNEL_7_AND_6:
     case BOUNDS_CHANNEL_0 ... BOUNDS_CHANNEL_7:
         value &= ASPEED_ADC_LH_MASK;
         break;
     case HYSTERESIS_CHANNEL_8 ... HYSTERESIS_CHANNEL_15:
         if (s->nr_channels <= 8) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: engine[%u]: "
                           "hysteresis register %u invalid, only 0...7 valid\n",
                           __func__, s->engine_id, reg - HYSTERESIS_CHANNEL_0);
             return;
         }
-        /* fallthrough */
+        fallthrough;
     case HYSTERESIS_CHANNEL_0 ... HYSTERESIS_CHANNEL_7:
         value &= (ASPEED_ADC_HYST_EN | ASPEED_ADC_LH_MASK);
         break;
     case INTERRUPT_SOURCE:
         value &= 0xffff;
         break;
     case COMPENSATING_AND_TRIMMING:
         value &= 0xf;
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "%s: engine[%u]: "
                       "0x%" HWADDR_PRIx " 0x%" PRIx64 "\n",
                       __func__, s->engine_id, addr, value);
         break;
     }
 
     s->regs[reg] = value;
 }
diff --git a/hw/adc/zynq-xadc.c b/hw/adc/zynq-xadc.c
index 032e19cbd0..a74de3a4fd 100644
--- a/hw/adc/zynq-xadc.c
+++ b/hw/adc/zynq-xadc.c
@@ -189,61 +189,61 @@ static uint64_t zynq_xadc_read(void *opaque, hwaddr offset, unsigned size)
 static void zynq_xadc_write(void *opaque, hwaddr offset, uint64_t val,
                             unsigned size)
 {
     ZynqXADCState *s = (ZynqXADCState *)opaque;
     int reg = offset / 4;
     int xadc_reg;
     int xadc_cmd;
     int xadc_data;
 
     if (!zynq_xadc_check_offset(reg, false)) {
         qemu_log_mask(LOG_GUEST_ERROR, "zynq_xadc: Invalid write access "
                       "to addr %" HWADDR_PRIx "\n", offset);
         return;
     }
 
     switch (reg) {
     case CFG:
         s->regs[CFG] = val;
         break;
     case INT_STS:
         s->regs[INT_STS] &= ~val;
         break;
     case INT_MASK:
         s->regs[INT_MASK] = val & INT_ALL;
         break;
     case CMDFIFO:
         xadc_cmd  = extract32(val, 26,  4);
         xadc_reg  = extract32(val, 16, 10);
         xadc_data = extract32(val,  0, 16);
 
         if (s->regs[MCTL] & MCTL_RESET) {
             qemu_log_mask(LOG_GUEST_ERROR, "zynq_xadc: Sending command "
                           "while comm channel held in reset: %" PRIx32 "\n",
                           (uint32_t) val);
             break;
         }
 
         if (xadc_reg >= ZYNQ_XADC_NUM_ADC_REGS && xadc_cmd != CMD_NOP) {
             qemu_log_mask(LOG_GUEST_ERROR, "read/write op to invalid xadc "
                           "reg 0x%x\n", xadc_reg);
             break;
         }
 
         switch (xadc_cmd) {
         case CMD_READ:
             xadc_push_dfifo(s, s->xadc_regs[xadc_reg]);
             break;
         case CMD_WRITE:
             s->xadc_regs[xadc_reg] = xadc_data;
-            /* fallthrough */
+            fallthrough;
         case CMD_NOP:
             xadc_push_dfifo(s, 0);
             break;
         }
         break;
     case MCTL:
         s->regs[MCTL] = val & 0x00fffeff;
         break;
     }
     zynq_xadc_update_ints(s);
 }
-- 
2.39.2


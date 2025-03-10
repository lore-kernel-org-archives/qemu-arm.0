Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp842277njc;
        Sun, 9 Mar 2025 17:07:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYKu+GObINT894X2M4I9QsNN1ndk8RHABvGW5tW/Pq6w7HZMQsjPcygGCWxNpYkmEhBqGhTboZNujtXA==@linaro.org
X-Google-Smtp-Source: AGHT+IGvSUBn6I/NNs5h3/OitVnxDfgbcuILVIYvxVjGlbo7Xiwn4M4UicBwM2Rs1B6dLlcy1zOu
X-Received: by 2002:a05:622a:c7:b0:476:76bc:cfc4 with SMTP id d75a77b69052e-47676bce157mr87571171cf.21.1741565237398;
        Sun, 09 Mar 2025 17:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741565237; cv=none;
        d=google.com; s=arc-20240605;
        b=dbODuHI76Qs80opIGwwiD7hdSNa9RCtcmqKNOnGFhZG2THMFfmgF7NlRr1x/b2lai9
         LISL6AoGhdg20C62IuLDSFRzqJjiLDuf3l9+alR7HMLTyikEUhnMYkycVfQ+hyafI/zB
         heXbBFbHizE9nvKMfm8FU1ok/D3fDELfYPkMvn7sISy3THf1zfvQdAiJs3I1hiF0nofe
         MU1wMfiTs0RoZWvmBnyjrXBW37omQfjXtf43mLwHSGb8UqGpSlaDUNYG6obkaoHRhPr2
         V674z8YuT+xhArqRRKS4o/4EEetPjc7HxP2qBOCYImqTlD78nJtkpB5gbG3AYOlEm5++
         R8zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vtO10CroBFmuxTQ9PueWoinPmmKwM9K54hdlvVGKzAE=;
        fh=U4b/Remv/jSq9oj2ZY8MTXJ6/fMqL5iqbIT4bTH4XfI=;
        b=UD3q/R7qyZ9eke3hmvsGoN0MPu2BJur8K+OEnxWeJTpGSH7YFKLnx4FCZrnF5i6mBD
         VbDzMyLzl8iLFpmw+cRl7dF0yAKyQjg+wE7AGNVDEwegDWUk4UNVyDnLPwioTQXK5jMj
         9qeTQ2cRMbpCfYL798cQDM1SfYHXPp4R7xN7WlmBSt9dp0L+811cpJDI678hO/Cv9fTi
         D50OHWVTauDUyoZmjhGcifGG6uOU3FODVxgcBeJIFRDYlGxHjhCyp/xzvLpkYg/AeZZX
         eMk8ZHStSA485nWZaleR9jRccz2f/Q6mKwD8rF/A9Ma2X/NeOeLEM5nKXTiOfStYQ7h0
         va0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BCNszlUo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db5b499si78389061cf.615.2025.03.09.17.07.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 17:07:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BCNszlUo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trQfa-00022O-NU; Sun, 09 Mar 2025 20:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQfX-00020d-60
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:06:55 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQfT-0007MH-U8
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:06:54 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43948021a45so31329805e9.1
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 17:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741565210; x=1742170010; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vtO10CroBFmuxTQ9PueWoinPmmKwM9K54hdlvVGKzAE=;
 b=BCNszlUosgkoC0FflU7TUIVgnJwJEjU70ZlfSChey97FnYKWjbcnJp9hHIL7ob7nCj
 i3IIeLieE4oX0uMr/tR6xKqrxucI0mHWiptKlx2P4SoAa6aYa+DW3CJYgAU7fkwRGrwq
 TThsrhVIgN69nP4V6ibRomM4QQPJodZptrrHN5oaD+vLuDft+xl3cQGvtltjLPWJD/8D
 4FJZbDIFhefL9f9wkJ1IwcGJ2YQUi1CRkh0vxOcEJWfpHxpaeAy/WI/c9wfyKkATciTa
 kir5AylEdZqfTzw81u3jKHDTMX7FfbAryDFpHZsuFph6C5zx2frdD/YwGMfN0X0Glnu0
 240w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741565210; x=1742170010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vtO10CroBFmuxTQ9PueWoinPmmKwM9K54hdlvVGKzAE=;
 b=J8hg7JTZyU8Jmf50wP3hr8wMaDhGS7+PKlN5eAbYDo3CgV0zSxUu5PbixLlcrSncpc
 FLQEX9ImUawbNcyeGfBxdnSdSmdwFsFPEm/WRuzTIaMwWnUCr0iDyyR2VCVKsnF8fWKa
 HrewBl1ffqNP+LtVtItDQRXm1+gfQk0EEBk1m8xKaulORJtN9luUm1TFXItFkni6G9fv
 26tmaN9YSO+XoAvICcNkf+AFMv58SbAlU2YCZTmTdBhEYTYr7yqszS26ycR96TGTLjs0
 4e+f6UdkDY3JYar41ijR1aJyCOnNYhmgUd2Tw6J5Qg4lw/bzT7c3arFuYJrsHX5uumbB
 Hs2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLvu6WTh/nGPFUKmhusJavU3J2yftZIHuIldfAtR10ZYHyfXXxCn+ll/ZfGWgR1DOFadCXB0bQ/w==@nongnu.org
X-Gm-Message-State: AOJu0Yys31eP8jQ0RXaZ68wxhk/GPSdBwTRVl2FwizKLbBN/1omtngjP
 T9I4ViYcSAAsGc8uEIJMGRKBISGPYFn3fC4WhWUN+H3hRLNDK3K6E8h3GD3qjOI=
X-Gm-Gg: ASbGncsbtfG6TEreM2J7GTx4TvM9QEmJwmCUuBQ1/Mz3XUpkVvA8QXjMQ5eWfyvqsDW
 2/CxoGkRs9mKwe1FJjh3PmTT10xmx8mJvw/fuIaYeT09Z5YvDU2skWTwMKzgtHUBmKwglSZfTFH
 msk3Q5v0/7t2v9OTiPr1C9THbrEeg24e3Px8WOB8ugf9rSB3lZqKzjCeIC3w9F/r+7QrP8n+6ls
 jlqywVAlC8WY/HwmBPlAx1l4T6HIl2mV6KD+IxfIYChTKrB+CEap9Jwk35XRzmA3AOYYWlw0g/s
 gsRNZuGZIw6p8hl/i3tJsdLhWs+2Ge4cXdQTwAX/TeoSLZVjWIqXra0WCAdMmOYEaBxBSza3gd+
 a8Ur+saG87I/Yc3jblQo=
X-Received: by 2002:a05:600c:3ba1:b0:43c:fbbf:7bf1 with SMTP id
 5b1f17b1804b1-43cfbbf7eb2mr1844265e9.30.1741565210286; 
 Sun, 09 Mar 2025 17:06:50 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfad7sm13082199f8f.26.2025.03.09.17.06.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 09 Mar 2025 17:06:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v5 05/14] hw/sd/sdhci: Include 'pending-insert-quirk' property
 in quirk bitmask
Date: Mon, 10 Mar 2025 01:06:11 +0100
Message-ID: <20250310000620.70120-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310000620.70120-1-philmd@linaro.org>
References: <20250310000620.70120-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: r0zR8hJOfk0O

Import Linux's SDHCI_QUIRK_RESTORE_IRQS_AFTER_RESET quirk definition.

Replace 'pending_insert_quirk' boolean (originally introduce in commit
0a7ac9f9e72 "sdhci: quirk property for card insert interrupt status
on Raspberry Pi") by a bit in quirk bitmask.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sdhci.h | 5 ++++-
 hw/sd/sdhci.c         | 8 ++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index d2e4f0f0050..2e6e719df7b 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -34,6 +34,8 @@
  * SD/MMC host controller state
  *
  * QEMU interface:
+ *  + QOM property "pending-insert-quirk" re-enables pending "card inserted"
+ *    IRQ after reset (used by the Raspberry Pi controllers).
  *  + QOM property "wp-inverted-quirk" inverts the Write Protect pin
  *    polarity (by default the polarity is active low for detecting SD
  *    card to be protected).
@@ -101,7 +103,6 @@ struct SDHCIState {
     /* RO Host Controller Version Register always reads as 0x2401 */
 
     /* Configurable properties */
-    bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
     uint32_t quirks;
     uint8_t endianness;
     uint8_t sd_spec_version;
@@ -118,6 +119,8 @@ enum {
     SDHCI_QUIRK_NO_BUSY_IRQ                     = 14,
     /* Controller reports inverted write-protect state */
     SDHCI_QUIRK_INVERTED_WRITE_PROTECT          = 16,
+    /* Controller losing signal/interrupt enable states after reset */
+    SDHCI_QUIRK_RESTORE_IRQS_AFTER_RESET        = 19,
 };
 
 #define TYPE_PCI_SDHCI "sdhci-pci"
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 19c600d5bfc..d1b1b187874 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -320,7 +320,7 @@ static void sdhci_poweron_reset(DeviceState *dev)
 
     sdhci_reset(s);
 
-    if (s->pending_insert_quirk) {
+    if (s->quirks & BIT(SDHCI_QUIRK_RESTORE_IRQS_AFTER_RESET)) {
         s->pending_insert_state = true;
     }
 }
@@ -1307,7 +1307,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
          * appears when first enabled after power on
          */
         if ((s->norintstsen & SDHC_NISEN_INSERT) && s->pending_insert_state) {
-            assert(s->pending_insert_quirk);
+            assert(s->quirks & BIT(SDHCI_QUIRK_RESTORE_IRQS_AFTER_RESET));
             s->norintsts |= SDHC_NIS_INSERT;
             s->pending_insert_state = false;
         }
@@ -1557,8 +1557,8 @@ static const Property sdhci_sysbus_properties[] = {
     DEFINE_SDHCI_COMMON_PROPERTIES(SDHCIState),
     DEFINE_PROP_BIT("wp-inverted-quirk", SDHCIState, quirks,
                     SDHCI_QUIRK_INVERTED_WRITE_PROTECT, false),
-    DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_quirk,
-                     false),
+    DEFINE_PROP_BIT("pending-insert-quirk", SDHCIState, quirks,
+                    SDHCI_QUIRK_RESTORE_IRQS_AFTER_RESET, false),
     DEFINE_PROP_LINK("dma", SDHCIState,
                      dma_mr, TYPE_MEMORY_REGION, MemoryRegion *),
 };
-- 
2.47.1


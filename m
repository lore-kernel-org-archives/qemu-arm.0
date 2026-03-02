Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED480EB3637
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 22:04:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxBMF-0000Q2-6X; Mon, 02 Mar 2026 17:03:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxBMC-0000Oc-8b
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 17:03:16 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxBMA-00019E-QH
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 17:03:16 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-439b9b190easo825829f8f.2
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 14:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772488993; x=1773093793; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kQcKbngO5gEYvP1cyAmsSZ3twrSC/3ssI8QyeEW5Z+s=;
 b=f5UpQ64KkxTS3PqQBfsxxvU41aUqbF56X9+iFjmxYUIX+EssXK/j5DpusnJWY7WVUb
 DUFFlc5Bkb8tFrnmX99my6y5+36p0uJq+7KLX/KsRQWfaBWw9qs30su9M3IGYXEFUuzV
 kEEcYHy0coRQO+TCrHRCdG+35QT74xt8IDhS4aj//jZfdMRT97yN5dJm9zvvGx/TIxes
 +jfTdL4ZDmFPZCMS8Sb8xy+NdoJpXDd25+yJyDPefOf6QW9fRD3LoE5EZU1s2Dn8Zvjp
 Jlq0iUuRURCmEkpuKTCWNgDNZLppDSARMNDQmm+iaEC3h7WrGhhOzQv0tqpkqFVpWdCy
 VItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772488993; x=1773093793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kQcKbngO5gEYvP1cyAmsSZ3twrSC/3ssI8QyeEW5Z+s=;
 b=ooHtJtQ0z6njsYn6WpycOpYNJ+JxQ3JYaAaJJfLSO/JWGgsohWkPfR5+aX1/p0zwxI
 Z5dGeCCG7djhtr34XRkBKYOoRVAmd+xwMr9FqlExgtObzOSbbNRCm4pXjJ3OxZeNRNtl
 5tFrSOwmr+odftrVhqtblNH1OIlY4uUXJ045o3/V8E24dKDR8E3PCFl8uvqtju56hyEo
 uPE4GLMA7jNAqgti/8jsojIKW6fCc6raDcUST/nSQitt6igSPELmrQ6QU3DFBfIJ8QHw
 kcooQ7GUET3gD8NB4PNPUImFxNJOf5YT8HExBIotDBE5cjo3p44u7saEBXzjOblCybBh
 xUtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKdS4XHhuvjLKF+WQtbJb3w1ncryismecKk2NbEJMo0C7QCsE96JQNeepQ+qBACxZqw5OHtUGsqg==@nongnu.org
X-Gm-Message-State: AOJu0YxU7Ksaj29jLJP32OgaIQa1mpTZJFhIgeM2xZG8ydlyQgGh7ZS0
 mRFLzbT0h+t+3u4cvV79ZmhrS6Tcd8rpQqi99ZA071JHlTChS/G3RA1w
X-Gm-Gg: ATEYQzy2YludSGYYrdw9y9sywJWcKHRhlWl3vFUiC8HHUpNtWsTEeWLM8yRA/g4Ivqg
 Q2hiBkZc/lgBxIUzAJA0EQi9iibU8kYNSGQMPDSQSJHDtnRoKCt1AHYIMfqGiQ7lBPk31+if+0I
 b4191jXXYbPWAJ29avoL8TFkyxAobqJb/xWrczBK/5jYPEJxVbpd+wtYEyGTmC/fUJwTMhXneVB
 yGq9KYFnG/fluWli7esdoATa5MW4aMBmMGaoI2LHCVRr2ppQS1CbLG7nNkoO9qZ4XKOx00N06DN
 aTUnrBMYs2T6aXy7c1DNsPkykesKktp4VUrYTxgRBdMRtwg3rh7ImZf9ORtMNB5l3I9Fs8BYbHR
 5xDQdXRndJF7EFt1K/CDEl8+BBaP5n4Hl0fIdDQds6G0w79RArxYbjF1ibf1bxKlaugsguuOwTW
 ftj0iucupWbal/50fr02ljcne+hK2AC4XfphQ3Z+0cm0jFJsFG3mospHVAQoXAIQ7Su77CsBmPO
 n5vB6D4NwEGzJev/ByfQ+dqPfnUlqKmOEcuexI0NymAQ0A=
X-Received: by 2002:a5d:588c:0:b0:439:bfaa:ed9d with SMTP id
 ffacd0b85a97d-439bfaaf06dmr1154446f8f.58.1772488993199; 
 Mon, 02 Mar 2026 14:03:13 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2e0b-4800-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2e0b:4800:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c765c38sm29308102f8f.31.2026.03.02.14.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 14:03:12 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 08/12] hw/char/serial: Avoid implicit conversion when tracing
Date: Mon,  2 Mar 2026 23:02:50 +0100
Message-ID: <20260302220254.1166849-9-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302220254.1166849-1-shentey@gmail.com>
References: <20260302220254.1166849-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 64 bit targets, the MemoryRegion API passes an address and a value as
uint64_t, so use that for tracing. Keep the uint8_t for reading since
this is what the device model produces. On targets with less than 64
bits, uint64_t is wide enough to avoid narrowing.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/char/trace-events | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/char/trace-events b/hw/char/trace-events
index 9e74be2c14..a3fcc77287 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -5,8 +5,8 @@ parallel_ioport_read(const char *desc, uint16_t addr, uint8_t value) "read [%s]
 parallel_ioport_write(const char *desc, uint16_t addr, uint8_t value) "write [%s] addr 0x%02x val 0x%02x"
 
 # serial.c
-serial_read(uint16_t addr, uint8_t value) "read addr 0x%02x val 0x%02x"
-serial_write(uint16_t addr, uint8_t value) "write addr 0x%02x val 0x%02x"
+serial_read(uint64_t addr, uint8_t value) "[0x%02" PRIx64 "] -> 0x%02" PRIx8
+serial_write(uint64_t addr, uint64_t value) "[0x%02" PRIx64 "] <- 0x%02" PRIx64
 serial_update_parameters(uint64_t baudrate, char parity, int data_bits, int stop_bits) "baudrate=%"PRIu64" parity='%c' data=%d stop=%d"
 
 # virtio-serial-bus.c
-- 
2.53.0



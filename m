Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1587774njc;
        Sun, 3 Nov 2024 06:36:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUJ1K/0ihHabu32vvchmfGy+Mrms4UQaiYrLZ8VbUK2Tw3ZlUyqYWDOvT6570XJTBacFZRDdeRlOvoV9A==@linaro.org
X-Google-Smtp-Source: AGHT+IFYxIgAByUHM98qgcwh5hUkrmhGKxCjm4xUEgYA5mpv0h7EWWAMxo/dRwHeVhZSUM+7TZzL
X-Received: by 2002:a05:622a:1a13:b0:45f:885:fd37 with SMTP id d75a77b69052e-462ab22c531mr190039971cf.12.1730644578327;
        Sun, 03 Nov 2024 06:36:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730644578; cv=none;
        d=google.com; s=arc-20240605;
        b=h+9asgg4630GEPs0EMPFoTiwgdSYKdeyX4X0BtNeniPOEbGEr3I1RAIOAKxDxW2u5T
         8pqBCh4KmmW09S4jCMTJ2RGGYrwB0mG5VniVmuWb8CqkbSNyckDncLKl6Cx9C7vPbArx
         kPRyi5RkUACVfCGPrAEqwN0ZX4zJxWRXFURAsgl1j9KOZFCvRziKwyiVPXfeDeeajVIX
         kngAozGNtiJPzMe1nj/oP69wPSATxiLd80c8pDWGqt4V5Gn2NrNkzmzfmUasz7JMZWh3
         VtZvqUM4+g0W7x3o8ZarXv0TdiAejVCEYwOUELXNNro/qY5QPw4/RT529hpDG+Ziory7
         f6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fPt9Z7KYXI4DBocHxmfd6avL+IjBwj9070TCXrToHt8=;
        fh=BR85JsC/eNOxKkp/GrUE48R/V1mhIs8C5zgnNqXvFVM=;
        b=ikshZjDQN6PiYWG5YWuzAKB8hVuA/vZW0JW3uEYSkP7dGi6PFildVhsLIChC3lI+h/
         6HuzoM3NU60PTWmSJkyAndRSUWdIbjhTm9mz2n+QGXZP9PRGx25ymif5sBNq5etT25JQ
         5lxIvBLMuvaaH3QVQs374LkFLWRZoSkpdHUUw3UqE/rdm2KnYQtYoRrmXH6I2fHyIQdQ
         DQnTNBINlEah9bVJGagurq4bBE2RvPcaCeLNWcSYsFct3iu524Yktp8xwsfBsFr8CxFZ
         N/5q0GkkPg9hpw3qNLkwtkHpruNfAiWDFtrNBE2V6pww3MOFffD00EAF5vrW9edTrF0H
         QKTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=CZMQLACj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad1b0fb7si82993311cf.247.2024.11.03.06.36.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Nov 2024 06:36:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=CZMQLACj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7bgT-0000Pn-71; Sun, 03 Nov 2024 09:34:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1t7bgR-0000Ol-Sm; Sun, 03 Nov 2024 09:34:27 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1t7bgQ-0001vr-AD; Sun, 03 Nov 2024 09:34:27 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c937b5169cso5433519a12.1; 
 Sun, 03 Nov 2024 06:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730644464; x=1731249264; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fPt9Z7KYXI4DBocHxmfd6avL+IjBwj9070TCXrToHt8=;
 b=CZMQLACjamOj37fHPcvwC+s/L0ci2DCVBjBKyn8uNhTfId03XjOsetr3lqLlkPCNzE
 //++433A42DWYDu/5+qEyd3HNpoylEOlfi+UP8UiQNZAJoS6rXuCbb9iTYMUJEAjwwrX
 g8FCvTiW4/9/FOkyk4TFdPDkLU2ZihveLQYOXRrN7Ngvx7tdFCB5BfFULRs1RRukKjym
 TRy2P2Q2tRxMrSyAl2xlYgK+ZGo4p/CyxgM2uVQfA2qjSCwtGEWRfMog/ymzCnbLAhkX
 FPJe44HICySjrepfqtruEE1iy7RSKwX8tMEzVDtpj923NhfA9RXXGM8KBONvbHa+pOxh
 AveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730644464; x=1731249264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fPt9Z7KYXI4DBocHxmfd6avL+IjBwj9070TCXrToHt8=;
 b=wxDPfilzEsrFyqIm+5w/R2BynvH8nT8AV1ahgaKPDrjyp/rC4Z3LF8fonWSI1L3SFq
 +goQl9QDzaBngAovsGJMh245PJkCd0oDpMPcgNtd1Exn+HpdOk/w3oOnJBE/ITceT4SS
 /HL0x6+zZ0acyR/kuPER9TMHA+DK3xsBSAxijEd+MWjq6VAfesnAPigVW0bYuio7du3R
 ZdiBJ9820tzJzomhafyeMqN40A7wPHMUD/pRCQsHh2MG9dT2jhO0fET4Qy2EVXEwPXi7
 W1J2Lm0EagWaWC+Wcn5KumPuA3bVc41e58g1Mf4xQ7IoOrZC5hPVIclQtPJIKAypVTc/
 jTnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT6b6hgxgajqyZDX4JFV77jKnDNBRy0MZoXe/mmACzBcZXkW0hxGkLVHIes5xTOhIfXFYYkmrJlA==@nongnu.org,
 AJvYcCVVgcmikvv51f/sKqMcUCn5o10n2r2zb5xOY69eZDmAEu3WlNYMC4bv9eTNuX0OIxNtH812zvCbnasWNoFP@nongnu.org
X-Gm-Message-State: AOJu0Yyu6w1sDrG21J2Ywa1vYHVeNwwzF4O/IYlcCsCSTzDovzXUbFpk
 yV6JWgQE+sw4y4ai3KI8tyGUpCAB8YvWoik7pkkTKEaKTXYfvx+1NlnhCw==
X-Received: by 2002:a05:6402:2811:b0:5c9:3f1:e5cd with SMTP id
 4fb4d7f45d1cf-5ceb8b49f3fmr9232940a12.0.1730644463696; 
 Sun, 03 Nov 2024 06:34:23 -0800 (PST)
Received: from archlinux.. (pd9ed7f6d.dip0.t-ipconnect.de. [217.237.127.109])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac74c667sm3350723a12.20.2024.11.03.06.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Nov 2024 06:34:22 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 1/4] hw/rtc/ds1338: Trace send and receive operations
Date: Sun,  3 Nov 2024 15:33:27 +0100
Message-ID: <20241103143330.123596-2-shentey@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103143330.123596-1-shentey@gmail.com>
References: <20241103143330.123596-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9skh6uZ6ml+z

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/rtc/ds1338.c     | 6 ++++++
 hw/rtc/trace-events | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index a5fe221418..929a92f7bd 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -17,6 +17,7 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 #include "sysemu/rtc.h"
+#include "trace.h"
 
 /* Size of NVRAM including both the user-accessible area and the
  * secondary register area.
@@ -126,6 +127,9 @@ static uint8_t ds1338_recv(I2CSlave *i2c)
     uint8_t res;
 
     res  = s->nvram[s->ptr];
+
+    trace_ds1338_recv(s->ptr, res);
+
     inc_regptr(s);
     return res;
 }
@@ -134,6 +138,8 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
 {
     DS1338State *s = DS1338(i2c);
 
+    trace_ds1338_send(s->ptr, data);
+
     if (s->addr_byte) {
         s->ptr = data & (NVRAM_SIZE - 1);
         s->addr_byte = false;
diff --git a/hw/rtc/trace-events b/hw/rtc/trace-events
index ebb311a5b0..8012afe102 100644
--- a/hw/rtc/trace-events
+++ b/hw/rtc/trace-events
@@ -22,6 +22,10 @@ pl031_set_alarm(uint32_t ticks) "alarm set for %u ticks"
 aspeed_rtc_read(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
 aspeed_rtc_write(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
 
+# ds1338.c
+ds1338_recv(uint32_t addr, uint8_t value) "[0x%" PRIx32 "] -> 0x%02" PRIx8
+ds1338_send(uint32_t addr, uint8_t value) "[0x%" PRIx32 "] <- 0x%02" PRIx8
+
 # m48t59.c
 m48txx_nvram_io_read(uint64_t addr, uint64_t value) "io read addr:0x%04" PRIx64 " value:0x%02" PRIx64
 m48txx_nvram_io_write(uint64_t addr, uint64_t value) "io write addr:0x%04" PRIx64 " value:0x%02" PRIx64
-- 
2.47.0


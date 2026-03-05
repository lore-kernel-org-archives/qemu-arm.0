Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0D8F513E5
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:11:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyGt3-0001Cq-5k; Thu, 05 Mar 2026 17:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsu-000126-0Z
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:33 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGss-0002Fr-Hx
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:31 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso73578075e9.3
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772748568; x=1773353368; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TykOcg42N3v23e/MxBmcDCzlMjizZHJY8EyEUhsuAq4=;
 b=e0ldzxZnCme52frgyph/bGunUu4MMnvc9J0N5+R3QuuWNeZ+tojt/OEGhM2P/4jl7f
 v1FGV6oO7pFtZuiK53MuRLXG+qdwymsDCunJIpxhGRQ+D6Pm9ALMV3842w2Z5l0KEpr8
 OIClau/PWNsRH5CjVyF85efGxFylvU/P+/Lb/Y0r33HEGcQmuy8k6J9WPxJFUzMKTuxL
 TREOgxwQJu7O1Pp1Usyi3tcO7M056gR4z+dGq+1YJkXL1RhGkwd4dTVNM/Q70VYsjiub
 CjADtCAdyfOU3orcjVd+QVQXLx1FccjQokVnNoMuRTPdRdQqyhE1f0/48H55nzfFlDjS
 IYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772748568; x=1773353368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TykOcg42N3v23e/MxBmcDCzlMjizZHJY8EyEUhsuAq4=;
 b=DBEy+E9S7L1qU+LO2kOCpZrs9yUwSATHFvl3HHgrUR2yhSC3OwG4eluMT05rs/U/Gh
 RHQiVr9vT4lAlgfXqe4j08LKSe4Zvq1/rA5ycNgaJyV8K3TroNTZutyrOi9QuGkw5Ubq
 o2ERFlEUwyFXQv6Va5rA6SzmP6VzXWRhlzjFHYutN1RyosQLXmcNuVq1GkRIiOlbeyEr
 GEgtTvj28lD5ZagBB5THrik/LuNrSrTKRrqhF3MyqrExhlcR8GrWJ76m1WI404KckiCC
 LXoLkzmJOEaZq+GRqXikCs5X365vQiZdnMmy+VJFDPG3RYsj3J3VCwDgY2dDPqUYzU4k
 IOOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe3Eks5c7HMIBhS56r0bV355xRcl+7Qzft7zc76Ux90mSUlOX76GfJ/LQMpJoBDolSjr4/H3ly+Q==@nongnu.org
X-Gm-Message-State: AOJu0Yxf+4njU/jT8Rj8plSMCsSOS9V3rvvjAKQzt60lXwV6pCRB+TfX
 Jy3CjU8kQwoFZ7QqL+9x/S7oN7g11H9k0wLaUZWOXd4U/eKVkAJgk+HU
X-Gm-Gg: ATEYQzxwkGrphjeOzxB7l3HKGVhaKLt+zmUbfcZGJUSNJuS06RtY5Io9+T/WYicQOL3
 BC++DTl3fHE3APIbKnJtCmrdIrnqjqFDM/pozmRntKMDJrvnsGvEDtyZ8A9AnBjmtoVIlXgPo+5
 uOgU6x5dptx3RoueCoD2dryy6CrZJgVZm9whCyxxD4DnYLfBJTJ5sSIbpQQrcaytVpkcvMAmJO8
 o136fMezcpjPeHfwJL/5p5t5YztK4PIy50UhwRqcv3XFXUTtPgV2c9pZkjx97KEHFrk5jMn83jn
 F+6glZXeR+kEZggsL7WJo37+EJg6OwO+XzWebuCsBma2Lrw0TjFDiaVqWMVGmIBLQMR7u7gJp07
 OztmFwIYul6QbG6ri2ESrhonF+euaX+iol3ubHq0qpWhq4Lo6V+LJ9E8e4taDvyRyR/4sIsnsRY
 vCYiDxkTEoBLNF6IG0MquI1HG0s73JRZSoATbZh5mv6cqy2Tz+ffM7V6pxFxct1wK1OVXcKe/R6
 LXxpUH6NJ/6II7usgHwIHMuZ0xpkeOomPCevM3z5UNuB3o=
X-Received: by 2002:a05:600c:6388:b0:47a:7fd0:9eea with SMTP id
 5b1f17b1804b1-4852359313emr16847145e9.3.1772748567966; 
 Thu, 05 Mar 2026 14:09:27 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2989-c400-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2989:c400:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fa87e56sm67419615e9.0.2026.03.05.14.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 14:09:27 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Helge Deller <deller@gmx.de>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 07/14] hw/char/serial: Reuse fifo8_num_used()
Date: Thu,  5 Mar 2026 23:09:04 +0100
Message-ID: <20260305220911.131508-8-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305220911.131508-1-shentey@gmail.com>
References: <20260305220911.131508-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Avoids accessing private fields of struct Fifo8. Now, TYPE_SERIAL only
accesses struct Fifo8 through its methods.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/serial.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 20f68fd2f8..2c558cb9fc 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -128,7 +128,7 @@ static void serial_update_irq(SerialState *s)
         tmp_iir = UART_IIR_CTI;
     } else if ((s->ier & UART_IER_RDI) && (s->lsr & UART_LSR_DR) &&
                (!(s->fcr & UART_FCR_FE) ||
-                s->recv_fifo.num >= s->recv_fifo_itl)) {
+                fifo8_num_used(&s->recv_fifo) >= s->recv_fifo_itl)) {
         tmp_iir = UART_IIR_RDI;
     } else if ((s->ier & UART_IER_THRI) && s->thr_ipending) {
         tmp_iir = UART_IIR_THRI;
@@ -563,8 +563,8 @@ static int serial_can_receive(SerialState *s)
              * the guest has a chance to respond, effectively overriding the ITL
              * that the guest has set.
              */
-            return (s->recv_fifo.num <= s->recv_fifo_itl) ?
-                        s->recv_fifo_itl - s->recv_fifo.num : 1;
+            return (fifo8_num_used(&s->recv_fifo) <= s->recv_fifo_itl) ?
+                        s->recv_fifo_itl - fifo8_num_used(&s->recv_fifo) : 1;
         } else {
             return 0;
         }
-- 
2.53.0



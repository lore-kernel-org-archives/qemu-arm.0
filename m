Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp125948njx;
        Wed, 23 Oct 2024 23:37:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgR+Urfcyx7BqsP4bolaQfiHI/WQtv2RWPaO3uHkUauYsz7LS+TpF9l5o+JAW+RKfA8RHdlnFZXfPDoQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEiANqfErHakGH72EBgIpb4rTqW7bZpcHyQj/qvh1QwmNHSuuQLwmx8mhdZDRW2isEy2ord
X-Received: by 2002:a05:622a:30e:b0:458:5716:fbd8 with SMTP id d75a77b69052e-461258d1372mr7969451cf.32.1729751842882;
        Wed, 23 Oct 2024 23:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729751842; cv=none;
        d=google.com; s=arc-20240605;
        b=VFqAyuvOE6E2c5wBId1+rOz+0BXJcLs3YKTY5Gj3VY2cS51MXVZDEC1jYccTbXA81F
         3xktphJaPXTjfQJTiwZLt0BkLgArMY2Ni0udpNN50Ra8ekUsgg4pQlUOCARPgvA9YGvQ
         ETxjxzJj8YoQbAF43bKrEdpVAqvfxXRt9kknmS/o00W5xu3DE/OS/BnJWWSROwGrCGck
         aFB+IB3oBUHe/0raKf4bvj48qwHcyMOIZe4jl84i3Quo9tkekvfZVm26DYz4CObl9fSI
         /02e+apgc0gClzzlZLQ/Mr6ztk2OPgISOoHN0GL8pwpRJ9PfgIaaNAuI6crIWmMcTWYJ
         xzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UIIYfufyTERSoZd9MuCU42vmPHNhXvgS1c4cRAcBpFE=;
        fh=hN8x/mp5bhODFKKG9bDA6kZrPH2cqMo41pgTdBRlk1k=;
        b=XWAHMu5sSei4gMUf2xtu4ae+9Q7El89ziU9dTzbt5I2M3Rt1g7YZ4Mh2OfmMgnA4it
         2/94JngrwtOFRVS6J/jlpw1CLBqDfnSK9EOhsYyeawjh7cNfkf6FCoZAnTdUtAx4H9DD
         mZRCxKewtFI/tCKQVUXMFSvJsXffG0mtin6K5G7JbCKm8X0TOl4zyb0oiBY4Bsly0zY3
         nQvfK0tYWhv5US9IykkhiYsqPOpufwlM2fX8OJHUYB6bflluF1ogIm2PJ8E+51UB0IqB
         UUr5uMkhLGl6ZGRdxnjZwrOjEzfBckfwNyOigZji6LRHDzJmQBOhb8V/8GagqVKXsFK+
         m7Zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fPMI9uR4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3d0ec0csi15297811cf.445.2024.10.23.23.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2024 23:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fPMI9uR4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t3rRa-0002EO-8h; Thu, 24 Oct 2024 02:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t3rRY-0002DX-0x
 for qemu-devel@nongnu.org; Thu, 24 Oct 2024 02:35:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t3rRW-0003Pi-9H
 for qemu-devel@nongnu.org; Thu, 24 Oct 2024 02:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729751733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UIIYfufyTERSoZd9MuCU42vmPHNhXvgS1c4cRAcBpFE=;
 b=fPMI9uR4NwPS+kh/1wuXXZEmDjSe4fl+y0dy//Z5wrdabTiZ+uFfNzyFkT+cJpSnddC6z0
 LXU8hUkhJQK5a1SHwSaS2ugeo7xRsu5TEfewyPsqVJ16IEvE1qFNPuIGN6XeYUMtkc/sHE
 x9Cu9Azt6ry3D2SiUntJ+a0HkFW8vWM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-436-sD6tjFqnO7mxwF133ISZtQ-1; Thu,
 24 Oct 2024 02:35:29 -0400
X-MC-Unique: sD6tjFqnO7mxwF133ISZtQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4578B1955D94; Thu, 24 Oct 2024 06:35:27 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.9])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6CAAF1956056; Thu, 24 Oct 2024 06:35:25 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PULL 04/17] hw/gpio/aspeed: Fix clear incorrect interrupt status for
 GPIO index mode
Date: Thu, 24 Oct 2024 08:34:54 +0200
Message-ID: <20241024063507.1585765-5-clg@redhat.com>
In-Reply-To: <20241024063507.1585765-1-clg@redhat.com>
References: <20241024063507.1585765-1-clg@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.263,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: IWeIUVQqR6H3

From: Jamin Lin <jamin_lin@aspeedtech.com>

The interrupt status field is W1C, where a set bit on read indicates an
interrupt is pending. If the bit extracted from data is set it should
clear the corresponding bit in reg_value. However, if the extracted
bit is clear then the value of the corresponding bit in reg_value
should be unchanged.

SHARED_FIELD_EX32() extracts the interrupt status bit from the write
(data). reg_value is set to the set's interrupt status, which means
that for any pin with an interrupt pending, the corresponding bit is
set. The deposit32() call updates the bit at pin_idx in the
reg_value, using the value extracted from the write (data).

The result is that if multiple interrupt status bits
were pending and the write was acknowledging specific one bit,
then the all interrupt status bits will be cleared.
However, it is index mode and should only clear the corresponding bit.

For example, say we have an interrupt pending for GPIOA0, where the
following statements are true:

   set->int_status == 0b01
   s->pending == 1

Before it is acknowledged, an interrupt becomes pending for GPIOA1:

   set->int_status == 0b11
   s->pending == 2

A write is issued to acknowledge the interrupt for GPIOA0. This causes
the following sequence:

   reg_value == 0b11
   pending == 2
   s->pending == 0
   set->int_status == 0b00

It should only clear bit 0 in index mode and the correct result
should be as following.

   set->int_status == 0b11
   s->pending == 2

   pending == 1
   s->pending == 1
   set->int_status == 0b10

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Suggested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 hw/gpio/aspeed_gpio.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 8725606aecae..16c18ea2f743 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -641,7 +641,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
     uint32_t pin_idx = reg_idx_number % ASPEED_GPIOS_PER_SET;
     uint32_t group_idx = pin_idx / GPIOS_PER_GROUP;
     uint32_t reg_value = 0;
-    uint32_t cleared;
+    uint32_t pending = 0;
 
     set = &s->sets[set_idx];
     props = &agc->props[set_idx];
@@ -703,16 +703,23 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
                               FIELD_EX32(data, GPIO_INDEX_REG, INT_SENS_2));
         set->int_sens_2 = update_value_control_source(set, set->int_sens_2,
                                                       reg_value);
-        /* set interrupt status */
-        reg_value = set->int_status;
-        reg_value = deposit32(reg_value, pin_idx, 1,
-                              FIELD_EX32(data, GPIO_INDEX_REG, INT_STATUS));
-        cleared = ctpop32(reg_value & set->int_status);
-        if (s->pending && cleared) {
-            assert(s->pending >= cleared);
-            s->pending -= cleared;
+        /* interrupt status */
+        if (FIELD_EX32(data, GPIO_INDEX_REG, INT_STATUS)) {
+            /* pending is either 1 or 0 for a 1-bit field */
+            pending = extract32(set->int_status, pin_idx, 1);
+
+            assert(s->pending >= pending);
+
+            /* No change to s->pending if pending is 0 */
+            s->pending -= pending;
+
+            /*
+             * The write acknowledged the interrupt regardless of whether it
+             * was pending or not. The post-condition is that it mustn't be
+             * pending. Unconditionally clear the status bit.
+             */
+            set->int_status = deposit32(set->int_status, pin_idx, 1, 0);
         }
-        set->int_status &= ~reg_value;
         break;
     case gpio_reg_idx_debounce:
         reg_value = set->debounce_1;
-- 
2.47.0


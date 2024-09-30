Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1101530njc;
        Mon, 30 Sep 2024 01:54:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzU/aDhT1UTLZMTM6xkyX4f6tplMF/AWUCd673SGMMOSs062fBRC7tsBphi1U5j0JXKXpH6It2RzcmBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFcvI6J0PzOoY4H6wjETHI96CTD0q9MUQYGlU4yWSSDDRFUYxi3F3PNy9UOQT2yFMpuOC1o
X-Received: by 2002:a05:622a:11cf:b0:458:3766:964c with SMTP id d75a77b69052e-45c9f21b019mr176208171cf.30.1727686466171;
        Mon, 30 Sep 2024 01:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727686466; cv=none;
        d=google.com; s=arc-20240605;
        b=ChwimIHanw8WTCndHotRLTkwwvRz7fl4AE4VwPgvmfxLhgdL9EbGiArqEA0acgj0Ce
         +0CpCrci5RbLmYSJF7ue9yWEyIdmT1WD2pihHyA1M/JVdGh/lYuwE0HeckOXj0fsHRQW
         APxhc+WkU8NX33yS4iAz+VR1QSaZBzXJXvxpm3s89qTipcJhsSFkHwXVoYMtegqc30Tc
         VKWmAEZ7ptviOWM0lkz+kjfWQMQUxZI/uNNgmjJGirHkaQdRCV7IZ4Gok5zBJHT35j8P
         oVDhE5DC7FbvFVEOINNLTuE+nNHKARYibF5gClpPZ1ZJhYvIO8MgU+PBM1NvH9F6rX+r
         aYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Cuelhesp2EJkf6+kUOINt1uwensPR6dAhjz7egcQUKc=;
        fh=bfdvnURtAD34fQ77QeZnvwdM4/zSvHk1Doa+KIkv0v8=;
        b=GzuMtKSNTXKzGsjoQ3gywR5lYnIMp9ums/3d8yLWW9fSQ4euICFrI0TB/+9c0d3bJP
         zKujuywQtzHV9M5IYl4cGcMR+3aNPSrcDjQQ4sl4Ko0w4RN52ZUkz6prS/K4Ul6JzbQV
         NZHRVPwBUXPlbuyJtrvudU5RIDsrLPb2cqHdzbDq/843DDh9mo/yK4+uTOAOXaFRA2eX
         My++DdLVQufPGiV5OCZlIgqYxoftY6oRkkYcS4iWRr2TCaH4wFzEpUehr5w0n/zku+oL
         Kexo6fgYWGxK9bVIuoClAi2Na4nuRobc2r6RoNp4y32srnoncKBHy4isGOnfBday7wkb
         mF1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f375b6csi76943501cf.625.2024.09.30.01.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 01:54:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1svC9l-0005IW-Kf; Mon, 30 Sep 2024 04:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svC9N-0003Q9-E9; Mon, 30 Sep 2024 04:53:03 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svC9L-00025U-L5; Mon, 30 Sep 2024 04:53:01 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 30 Sep
 2024 16:52:40 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 30 Sep 2024 16:52:40 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v6 4/8] hw/gpio/aspeed: Fix clear incorrect interrupt status
 for GPIO index mode
Date: Mon, 30 Sep 2024 16:52:35 +0800
Message-ID: <20240930085239.3089901-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240930085239.3089901-1-jamin_lin@aspeedtech.com>
References: <20240930085239.3089901-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8RU3ZRNrSJDa

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
index 8725606aec..16c18ea2f7 100644
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
2.34.1


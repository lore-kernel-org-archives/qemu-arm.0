Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp190914njc;
        Fri, 27 Sep 2024 01:36:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4vpmhcLf4+gHwgwSSE0kZaWglJRP8Sut4UOAIrcrXiRJa1k4V4DKK7qmfQ42dCZpRwMBFUMgdnrJNRg==@linaro.org
X-Google-Smtp-Source: AGHT+IFs9Rh/GN+m3M//oYT2k4EgNUQxx+ZhPQYkCPLE3WCNafH5ohajAT5Ez3EXS6ntt1eV25sL
X-Received: by 2002:a05:620a:c52:b0:7a9:b7c7:ad4c with SMTP id af79cd13be357-7ae3798b9efmr419157585a.58.1727426163030;
        Fri, 27 Sep 2024 01:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727426163; cv=none;
        d=google.com; s=arc-20240605;
        b=YAZWhWHxDXfre/9ZN+xmLQJWUWcziMoON+t4ajCMOblWDckxAPUfEJw7VKlNmbxzyb
         7HysEnmXuukz9/6MUNhzAbvLofmiSUvHO+D+dx9jksrVE0xSk5r71ekdjRSAC3wmPmGH
         5y2JqbFVBekYu/vPCkVGpaG7CgyadACmPHNtzQneoa9jHzSSyYPoFqNrJji/VRBJ1Icd
         j8OE2oXb2TcBnwGe60t6yzVYBEKirfNIi5t4BsgqxijAp9pjpdUKKT1ofBtY9Pci1c7i
         Cwxs6m3huzQUDtVa93CbIx772Evbmcda04gvS9/ac0hBUWU0vOuTVnSpq+WKERUps4vt
         4rng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Cuelhesp2EJkf6+kUOINt1uwensPR6dAhjz7egcQUKc=;
        fh=bfdvnURtAD34fQ77QeZnvwdM4/zSvHk1Doa+KIkv0v8=;
        b=EfSeyNkxdqJkVZxjiL4+u+YBoYlWDJK5YBuYGyxeiLiCvo0muDetg9tjwF1fdWZhK7
         /3aGHO9aTuO3YBma5lJfLHmr9mlOvsLyOp3KhG69hqvcCt58POvpCMTwzMbl5T059VS4
         GzLAvn69Cf0M1T4RdRhs2Qj1dJBopr1ayxoIHQnboFAV1idPhqAv2ki5J6eR+EmKIOnw
         DGW1e0mcopp0BCx4RMfAUTDCyKl7rxu/0o+rR2tD+p5OR4FgrJjjeVRtyt3qpga674RZ
         7vqUV747CVvdpMGU0+7gUnUcQeF0rBs2SFkH2jYBX5mHihvR2/zWIkXMSqS4s4aXyfgG
         PODQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae377d032dsi169714085a.71.2024.09.27.01.36.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2024 01:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1su6Qq-0007GV-DV; Fri, 27 Sep 2024 04:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1su6QZ-00076b-Ea; Fri, 27 Sep 2024 04:34:18 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1su6QV-0003ff-Jm; Fri, 27 Sep 2024 04:34:14 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 27 Sep
 2024 16:33:52 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 27 Sep 2024 16:33:52 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v5 4/7] hw/gpio/aspeed: Fix clear incorrect interrupt status
 for GPIO index mode
Date: Fri, 27 Sep 2024 16:33:48 +0800
Message-ID: <20240927083351.2637798-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927083351.2637798-1-jamin_lin@aspeedtech.com>
References: <20240927083351.2637798-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Um8dmqZosGhE

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


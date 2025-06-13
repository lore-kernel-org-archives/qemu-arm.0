Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2681453njc;
        Thu, 12 Jun 2025 17:08:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVp8Mq0xaQDTc9IaiWNPaQwRjF+b0wZFuDzNWvTmU5GwN/gWDcq3FCoyqMP8Q/YOQbjVe9PPc+PTR+EHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHqbu/yS9I1UmQGqxOs5Ps3KqT1me12OzZhoJ4X0eRaxaZX0ZTqKRpBzJWjffy/AQF+p6Hd
X-Received: by 2002:a05:620a:2b8f:b0:7c7:b5e9:6428 with SMTP id af79cd13be357-7d3bc3aeddbmr200488585a.22.1749773284947;
        Thu, 12 Jun 2025 17:08:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749773284; cv=none;
        d=google.com; s=arc-20240605;
        b=fh4CF8q+1QAg2UZ6RxHs1K7XbRM+KM6p3Qks1CyvWexxxxQvRnw7cBFn07U2lXTs3y
         OYCxNysf2hC04JuFAjRztJOpQ4VcNALMXM1x2WyLarREKhJgx1HzZ1keRL1gVbkMqWAh
         2giIeIBMj8jyiVQYK+vufQt9h9hZFCpkT1M3Ep5/Eb9JG9SD1d9VVzBFNlszELGqzpsy
         A8kIovSHQNb3I9eNiF7Xm925I++UB5miaUHeJ0sVjd4Dop9rE/+H9rYhMG7tob3pl2Nh
         yLmCWWUAfY9GAfZdmspkkjt7FgiK3p2r4z0bd0bawsV5YDdqulGUqQR/r24VOMzS+NDL
         xV9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=OIZH2xkbqf0VU2m6tXJnpYTNb7RaFWBkaYVW+cq3n6g=;
        fh=D6MTD9vNI7A2cu7t+GwgPMYSnYi6xe9OwZWykVmJ98c=;
        b=bL+xnfGYyD3r4KbCmYjCMCGnDJEkc9cSxrljLqkvdlYh7QakykIZ3vcfiO5NIOGMYn
         Q2SvsS4TQj5THZqY9NNJrPccAQ8bg3fhAKvilPLEUgdt6tGy19w50TM1UfZl946PGB0S
         8SH7ICejS/4ouj7QgRSjaswGYqwJJrB7hyxpjuTy3nwLsC/2Cb2XBGb0iGue+qaNcU3A
         L/H9gpk90Ac+nDte8Vr0zF602SYDsnIjYx+kVldkkZoqYBjJwN2cwGtajKcnB7cpjYPo
         kzteStsXLHKQa8XbToooH1gpmLsRn5pudLYd/4Tsw7RU3pEGankqpCURVf+HUKQR1+5G
         x2Eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=dnxTVhVn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f44fd5si180505085a.601.2025.06.12.17.08.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 17:08:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=dnxTVhVn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPrwp-0008NP-Gg; Thu, 12 Jun 2025 20:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3EGtLaAcKCF0FJHGJ8DBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--komlodi.bounces.google.com>)
 id 1uPruV-0005t1-Hl
 for qemu-arm@nongnu.org; Thu, 12 Jun 2025 20:04:47 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3EGtLaAcKCF0FJHGJ8DBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--komlodi.bounces.google.com>)
 id 1uPruM-0000bF-Au
 for qemu-arm@nongnu.org; Thu, 12 Jun 2025 20:04:37 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-2354ba59eb6so22928585ad.1
 for <qemu-arm@nongnu.org>; Thu, 12 Jun 2025 17:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749773072; x=1750377872; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=OIZH2xkbqf0VU2m6tXJnpYTNb7RaFWBkaYVW+cq3n6g=;
 b=dnxTVhVntuJWK4JAjyE85IQnDZEheEM52MWq6HCHqtT5oGTzV+YnAp3x1zn41P1crR
 idptzk+YaPi2j1kJwvLm4+45lkJCIHUhd9xlGjFVK4qjwSlhgMQyS5i/7svDKUhj3oJj
 jXUPgLk/3k/Fo9e6F4BqnUnrcNRdcz8TjJlz2eGPcEWDXgteR8sAoUErl/tHcCKOql07
 Lwj5e8JZxEbzw+TAUPRJCQDfUiyIcDJlcaWmhhbx+OcEb7V4UUqSxc8+B9ceIg8i1Jfo
 /xmOVAOFBMh+a27uc+wvoVugFjv8pTrfQ8qt/ljuA2bARIFHYdusVXR60lOvN92wucSb
 gkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749773072; x=1750377872;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OIZH2xkbqf0VU2m6tXJnpYTNb7RaFWBkaYVW+cq3n6g=;
 b=uuAdB+gB6Yzl6erl1qNSvJFrEj+gsznfhQoebSa4pMjmrV4oq7H38W2/Rnxc+W2zLZ
 KNY/v8c9TOGgbiACEdi5vvxZi8oCMJTXvX0wlKIubkhKp9sdwRZTilAGoPNxQSnwi8XK
 zuJhHey6Gj3lLiDgAQM0WVppFTsax4ofovyR2rp0+pNwFR5a9JaaAXcB4hee80RvRLmi
 bng/TfmfyL+eqt3GyZtm7/UwN3U/UkyCZ0IFWnUCL8sqE/3/W058sBGDcGeoVJYHeXEV
 qy0Tgt8+qibCMbXzXU0o6vs0sM6vYKEw4SLrQ+2u+ykxeTPTnqlc3cr43dRCxkUNYku6
 qbaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCH+y3shFvIg4pN9x8msk5KEbgAgPfO0QeZyBfdR/d+SDaXWSyNZVnJkKKRVzewIaWKWTVfoA7kw==@nongnu.org
X-Gm-Message-State: AOJu0Yznhidur+Q59En5Eaclx9zpstMspZLhxSsy0TiYpnXhFUO3LCK8
 6dFha2YcYZ99/MEPh92IZsxCD2cr4yPDVMJsIOdvLbGpYZN8AYQj3iGX+fjLxEwFNBgjFCJECU2
 WagmroaRk0g==
X-Received: from pge22.prod.google.com ([2002:a05:6a02:2d16:b0:b2f:795e:379a])
 (user=komlodi job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:be03:b0:235:27b6:a891
 with SMTP id d9443c01a7336-2365da079a2mr10352165ad.28.1749773072319; Thu, 12
 Jun 2025 17:04:32 -0700 (PDT)
Date: Fri, 13 Jun 2025 00:04:06 +0000
In-Reply-To: <20250613000411.1516521-1-komlodi@google.com>
Mime-Version: 1.0
References: <20250613000411.1516521-1-komlodi@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250613000411.1516521-15-komlodi@google.com>
Subject: [PATCH 14/19] hw/i3c/dw-i3c: Add ctrl MMIO handling
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, clg@kaod.org, 
 peter.maydell@linaro.org, steven_lee@aspeedtech.com, leetroy@gmail.com, 
 jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, joel@jms.id.au, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3EGtLaAcKCF0FJHGJ8DBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--komlodi.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uqD8wmTh01LO

Adds functionality to the CTRL register.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/i3c/dw-i3c.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/i3c/dw-i3c.c b/hw/i3c/dw-i3c.c
index c5af331ac4..61845c909f 100644
--- a/hw/i3c/dw-i3c.c
+++ b/hw/i3c/dw-i3c.c
@@ -361,6 +361,8 @@ static const uint32_t dw_i3c_ro[DW_I3C_NR_REGS] = {
     [R_SLAVE_CONFIG]                = 0xffffffff,
 };
 
+static void dw_i3c_cmd_queue_execute(DWI3C *s);
+
 static inline bool dw_i3c_has_hdr_ts(DWI3C *s)
 {
     return ARRAY_FIELD_EX32(s->regs, HW_CAPABILITY, HDR_TS);
@@ -520,6 +522,36 @@ static int dw_i3c_recv_data(DWI3C *s, bool is_i2c, uint8_t *data,
     return ret;
 }
 
+static void dw_i3c_ctrl_w(DWI3C *s, uint32_t val)
+{
+    /*
+     * If the user is setting I3C_RESUME, the controller was halted.
+     * Try and resume execution and leave the bit cleared.
+     */
+    if (FIELD_EX32(val, DEVICE_CTRL, I3C_RESUME)) {
+        dw_i3c_cmd_queue_execute(s);
+        val = FIELD_DP32(val, DEVICE_CTRL, I3C_RESUME, 0);
+    }
+    /*
+     * I3C_ABORT being set sends an I3C STOP. It's cleared when the STOP is
+     * sent.
+     */
+    if (FIELD_EX32(val, DEVICE_CTRL, I3C_ABORT)) {
+        dw_i3c_end_transfer(s, /*is_i2c=*/true);
+        dw_i3c_end_transfer(s, /*is_i2c=*/false);
+        val = FIELD_DP32(val, DEVICE_CTRL, I3C_ABORT, 0);
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, TRANSFER_ABORT, 1);
+        dw_i3c_update_irq(s);
+    }
+    /* Update present state. */
+    ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_ST_STATUS,
+                     DW_I3C_TRANSFER_STATE_IDLE);
+    ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_STATUS,
+                     DW_I3C_TRANSFER_STATUS_IDLE);
+
+    s->regs[R_DEVICE_CTRL] = val;
+}
+
 static inline bool dw_i3c_target_is_i2c(DWI3C *s, uint16_t offset)
 {
     /* / sizeof(uint32_t) because we're indexing into our 32-bit reg array. */
@@ -1592,6 +1624,9 @@ static void dw_i3c_write(void *opaque, hwaddr offset, uint64_t value,
                       "] = 0x%08" PRIx64 "\n",
                       __func__, offset, value);
         break;
+    case R_DEVICE_CTRL:
+        dw_i3c_ctrl_w(s, val32);
+        break;
     case R_RX_TX_DATA_PORT:
         dw_i3c_push_tx(s, val32);
         break;
-- 
2.50.0.rc1.591.g9c95f17f64-goog


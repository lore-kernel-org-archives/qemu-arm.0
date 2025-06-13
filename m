Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2681516njc;
        Thu, 12 Jun 2025 17:08:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdnmyd6Pb9n33HUMPZ9o+QCHCUeEFWLxB5gOZ0tLGVyKZTZitWZVEiQUCjwgcOEMoWSp3jYhF19D32ig==@linaro.org
X-Google-Smtp-Source: AGHT+IHe1y1HC0Je2JGAvy3hKWZ9wLDNk6EHrTsui2ILo446Z//DZbxB5DxNn+aECWgcGt3pp+zg
X-Received: by 2002:a05:622a:5912:b0:4a4:39a6:93c4 with SMTP id d75a77b69052e-4a72fed93famr22034631cf.21.1749773271897;
        Thu, 12 Jun 2025 17:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749773271; cv=none;
        d=google.com; s=arc-20240605;
        b=eFrWltWUgV0R0D1cpuKa4tk7cHCfD4wIv2N247tG9wDQBSj1S32wvS66TWeUKUWzrA
         uStPm2AhEb4NcJhqnxPBjlvEP2xxTMJhIdtwTzeJlqm8J4PfwWI+3iMzTbkoGzabyJXW
         u6vMLuFJPNoGiljhRXBimEENw6oYzHoHFqX6mEd9tt6Pjnqfc2fEi0QIxuZeb4wLK29X
         /H1VNJRHkuE+yorY0jeaeFZd60Due7NB6v2RXFewmZ1Pjj61zXdAcGolmiIOQNUFWJ2S
         SDwiSxHg4DiH4CFOjBpNT/HriekBrQ9NRQM0Vr843SnfKG5HorDJQvfxxymqhFHAKU6G
         70bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=DyCoNnGqjybs2atj+VUDFeC2YSxcleyR8BFixP1/Qu4=;
        fh=jmB336zVDilutUuU09TXLNZ6TFwRas8MQn/v9+Y+T0w=;
        b=XWuPMIYCX5T67npc9MuiZHClLCWpUalWmP9H0nYA4xem4DqjLT2mDY5JCw2yVMKf+h
         3iQ1nvVjSKnk92K9vnIxEC/ZCv+oeLUUeXmccfROVKMgWA2iACdDFW6L2V87RWqQRFol
         owzcjMNUwNvDAJLZbKMBq0h7AhrVVDq+xZPqyqiukNeiWHtfV/6ukPqPwjZO8XRz0G8F
         eFv3SlGqZ/KtOox4uwi6Kvgd6sQ5BjXorPMkbwxKLwZdBzjqEqmah93yvKWflvA79Cfw
         ggyaC/AgzdPqsICDCvR4sVmsEmVCKLTHJoOYKM021Zl4GQkWNNF7meAUv55Xc4uvxPsD
         ELQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=J5PXfWF6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f40d79si178650285a.584.2025.06.12.17.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 17:07:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=J5PXfWF6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPrxM-0001RX-8O; Thu, 12 Jun 2025 20:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3EWtLaAcKCl4GKIHK9ECKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--komlodi.bounces.google.com>)
 id 1uPruV-0005t3-UD
 for qemu-devel@nongnu.org; Thu, 12 Jun 2025 20:04:47 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3EWtLaAcKCl4GKIHK9ECKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--komlodi.bounces.google.com>)
 id 1uPruN-0000bZ-I2
 for qemu-devel@nongnu.org; Thu, 12 Jun 2025 20:04:40 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-6c8f99fef10so1618108a12.3
 for <qemu-devel@nongnu.org>; Thu, 12 Jun 2025 17:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749773074; x=1750377874; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=DyCoNnGqjybs2atj+VUDFeC2YSxcleyR8BFixP1/Qu4=;
 b=J5PXfWF6Q0DbIIaNhIFwgx5tIcL4ct37bRm5ZYcMkKpuB3nBe8xKHO6I0z9hJbV5lb
 vmnUbikXq0a5x+S0QbI9YNP9MaBNwsiM+e3QUhFM2Uhdvgs6YlRLcG81o3VCYNeUS+7z
 CBW0se16UlSOApA1FXlbhXp5A4hXgr1e741+eKKf6CYWWZ6UftqUBrPKquuy9DyP3KY/
 8YTRF3MhzkH+tjtanFIr4dPMSGTobH2qvDYFvhN+rjUV9c8+rSAAyjsndr85zK+PyubF
 +uHrySZBhVWY4ihgwpQcZJarwLmRnPD80D3M1Yp7OisEgynIQjM/DT1+FtUY9MpUp5Ho
 YBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749773074; x=1750377874;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DyCoNnGqjybs2atj+VUDFeC2YSxcleyR8BFixP1/Qu4=;
 b=hnPzDkv08zWcwKlcN2daV8rV9F9Nj0dZMmSq1F8QNsPyFjA/jAiZKf87gMajGqCPHN
 dbgdB5s+J7aj6uAWKox5c6EjJhpUyg76dnxMCW552DzO0H5Cm5n9KB+dBskgIvbimb8g
 JKDIwmlzGR7jfWrzKMEOtPRnGPaSQUT/bpSqxgKUhlxEY/8L8zLlNWkPYeM4IpU0RzZZ
 U/TG8toHrMDciXouFg7crT7Tq7qTQV7sy9ztXfS6flMi0mF6WOxgAQaxu0pSf+c2hL5N
 Th6+XLBfBsGq/ew8eyQRNYPUNrwV48OLQR65O35er7mMVdOjlR2v33mOzIM3ItTQYsQI
 QtjQ==
X-Gm-Message-State: AOJu0Yys5mxEY5NTtm12T4qdNfZqDdh9Ttw1XmrdtA7FaU5nSjiM1/rp
 311T3tN0ql5UjvN+FrBXH8Mp1xkU/e5caMPlfQEk9XsbWK3jrdJuY3tgR1isBjGutMBkscVBu5z
 XZ5Z2lPJI9I5TVAnzCPHgxcNcH+ZHNoP1WO9iyoa5tceXucUFftVNYlOYX9kLrzCu6MG3gazBJR
 Jp0kyDXhfmg8PYMCCckbRGWFGOcd8pSWHmmKrRi7bv
X-Received: from pgbda7.prod.google.com ([2002:a05:6a02:2387:b0:b2c:4fcd:fe1b])
 (user=komlodi job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:9148:b0:21f:512c:ba2c
 with SMTP id adf61e73a8af0-21facec450emr1402302637.34.1749773073827; Thu, 12
 Jun 2025 17:04:33 -0700 (PDT)
Date: Fri, 13 Jun 2025 00:04:07 +0000
In-Reply-To: <20250613000411.1516521-1-komlodi@google.com>
Mime-Version: 1.0
References: <20250613000411.1516521-1-komlodi@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250613000411.1516521-16-komlodi@google.com>
Subject: [PATCH 15/19] hw/i3c/dw-i3c: Add controller resets
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, clg@kaod.org, 
 peter.maydell@linaro.org, steven_lee@aspeedtech.com, leetroy@gmail.com, 
 jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, joel@jms.id.au, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3EWtLaAcKCl4GKIHK9ECKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--komlodi.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 4r5UMqhTg9sI

Adds behavior to the device reset register.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Stephen Longfield <slongfield@google.com>
---
 hw/i3c/dw-i3c.c     | 117 ++++++++++++++++++++++++++++++++++++++++++++
 hw/i3c/trace-events |   1 +
 2 files changed, 118 insertions(+)

diff --git a/hw/i3c/dw-i3c.c b/hw/i3c/dw-i3c.c
index 61845c909f..fff3a3591f 100644
--- a/hw/i3c/dw-i3c.c
+++ b/hw/i3c/dw-i3c.c
@@ -877,6 +877,122 @@ static void dw_i3c_intr_force_w(DWI3C *s, uint32_t val)
     dw_i3c_update_irq(s);
 }
 
+static void dw_i3c_cmd_queue_reset(DWI3C *s)
+{
+    fifo32_reset(&s->cmd_queue);
+
+    ARRAY_FIELD_DP32(s->regs, QUEUE_STATUS_LEVEL, CMD_QUEUE_EMPTY_LOC,
+                     fifo32_num_free(&s->cmd_queue));
+    uint8_t empty_threshold = ARRAY_FIELD_EX32(s->regs, QUEUE_THLD_CTRL,
+                                               CMD_BUF_EMPTY_THLD);
+    if (fifo32_num_free(&s->cmd_queue) >= empty_threshold) {
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, CMD_QUEUE_RDY, 1);
+        dw_i3c_update_irq(s);
+    };
+}
+
+static void dw_i3c_resp_queue_reset(DWI3C *s)
+{
+    fifo32_reset(&s->resp_queue);
+
+    ARRAY_FIELD_DP32(s->regs, QUEUE_STATUS_LEVEL, RESP_BUF_BLR,
+                     fifo32_num_used(&s->resp_queue));
+    /*
+     * This interrupt will always be cleared because the threshold is a minimum
+     * of 1 and the queue size is 0.
+     */
+    ARRAY_FIELD_DP32(s->regs, INTR_STATUS, RESP_RDY, 0);
+    dw_i3c_update_irq(s);
+}
+
+static void dw_i3c_ibi_queue_reset(DWI3C *s)
+{
+    fifo32_reset(&s->ibi_queue);
+
+    ARRAY_FIELD_DP32(s->regs, QUEUE_STATUS_LEVEL, IBI_BUF_BLR,
+                     fifo32_num_used(&s->resp_queue));
+    /*
+     * This interrupt will always be cleared because the threshold is a minimum
+     * of 1 and the queue size is 0.
+     */
+    ARRAY_FIELD_DP32(s->regs, INTR_STATUS, IBI_THLD, 0);
+    dw_i3c_update_irq(s);
+}
+
+static void dw_i3c_tx_queue_reset(DWI3C *s)
+{
+    fifo32_reset(&s->tx_queue);
+
+    ARRAY_FIELD_DP32(s->regs, DATA_BUFFER_STATUS_LEVEL, TX_BUF_EMPTY_LOC,
+                     fifo32_num_free(&s->tx_queue));
+    /* TX buf is empty, so this interrupt will always be set. */
+    ARRAY_FIELD_DP32(s->regs, INTR_STATUS, TX_THLD, 1);
+    dw_i3c_update_irq(s);
+}
+
+static void dw_i3c_rx_queue_reset(DWI3C *s)
+{
+    fifo32_reset(&s->rx_queue);
+
+    ARRAY_FIELD_DP32(s->regs, DATA_BUFFER_STATUS_LEVEL, RX_BUF_BLR,
+                     fifo32_num_used(&s->resp_queue));
+    /*
+     * This interrupt will always be cleared because the threshold is a minimum
+     * of 1 and the queue size is 0.
+     */
+    ARRAY_FIELD_DP32(s->regs, INTR_STATUS, RX_THLD, 0);
+    dw_i3c_update_irq(s);
+}
+
+static void dw_i3c_reset(DeviceState *dev)
+{
+    DWI3C *s = DW_I3C(dev);
+    trace_dw_i3c_reset(s->cfg.id);
+
+    memcpy(s->regs, dw_i3c_resets, sizeof(s->regs));
+    /*
+     * The user config for these may differ from our resets array, set them
+     * manually.
+     */
+    ARRAY_FIELD_DP32(s->regs, DEVICE_ADDR_TABLE_POINTER, ADDR,
+                     s->cfg.dev_addr_table_pointer);
+    ARRAY_FIELD_DP32(s->regs, DEVICE_ADDR_TABLE_POINTER, DEPTH,
+                     s->cfg.dev_addr_table_depth);
+    ARRAY_FIELD_DP32(s->regs, DEV_CHAR_TABLE_POINTER,
+                     P_DEV_CHAR_TABLE_START_ADDR,
+                     s->cfg.dev_char_table_pointer);
+    ARRAY_FIELD_DP32(s->regs, DEV_CHAR_TABLE_POINTER, DEV_CHAR_TABLE_DEPTH,
+                     s->cfg.dev_char_table_depth);
+
+    dw_i3c_cmd_queue_reset(s);
+    dw_i3c_resp_queue_reset(s);
+    dw_i3c_ibi_queue_reset(s);
+    dw_i3c_tx_queue_reset(s);
+    dw_i3c_rx_queue_reset(s);
+}
+
+static void dw_i3c_reset_ctrl_w(DWI3C *s, uint32_t val)
+{
+    if (FIELD_EX32(val, RESET_CTRL, CORE_RESET)) {
+        dw_i3c_reset(DEVICE(s));
+    }
+    if (FIELD_EX32(val, RESET_CTRL, CMD_QUEUE_RESET)) {
+        dw_i3c_cmd_queue_reset(s);
+    }
+    if (FIELD_EX32(val, RESET_CTRL, RESP_QUEUE_RESET)) {
+        dw_i3c_resp_queue_reset(s);
+    }
+    if (FIELD_EX32(val, RESET_CTRL, TX_BUF_RESET)) {
+        dw_i3c_tx_queue_reset(s);
+    }
+    if (FIELD_EX32(val, RESET_CTRL, RX_BUF_RESET)) {
+        dw_i3c_rx_queue_reset(s);
+    }
+    if (FIELD_EX32(val, RESET_CTRL, IBI_QUEUE_RESET)) {
+        dw_i3c_ibi_queue_reset(s);
+    }
+}
+
 static uint32_t dw_i3c_pop_rx(DWI3C *s)
 {
     if (fifo32_is_empty(&s->rx_queue)) {
@@ -1634,6 +1750,7 @@ static void dw_i3c_write(void *opaque, hwaddr offset, uint64_t value,
         dw_i3c_cmd_queue_port_w(s, val32);
         break;
     case R_RESET_CTRL:
+        dw_i3c_reset_ctrl_w(s, val32);
         break;
     case R_INTR_STATUS:
         dw_i3c_intr_status_w(s, val32);
diff --git a/hw/i3c/trace-events b/hw/i3c/trace-events
index a262fcce39..39f33d9a50 100644
--- a/hw/i3c/trace-events
+++ b/hw/i3c/trace-events
@@ -11,6 +11,7 @@ dw_i3c_send(uint32_t deviceid, uint32_t num_bytes) "I3C Dev[%u] send %" PRId32 "
 dw_i3c_recv_data(uint32_t deviceid, uint32_t num_bytes) "I3C Dev[%u] recv %" PRId32 " bytes from bus"
 dw_i3c_ibi_recv(uint32_t deviceid, uint8_t ibi_byte) "I3C Dev[%u] recv IBI byte 0x%" PRIx8
 dw_i3c_ibi_handle(uint32_t deviceid, uint8_t addr, bool rnw) "I3C Dev[%u] handle IBI from address 0x%" PRIx8 " RnW=%d"
+dw_i3c_reset(uint32_t deviceid) "I3C Dev[%u] reset"
 dw_i3c_pop_rx(uint32_t deviceid, uint32_t data) "I3C Dev[%u] pop 0x%" PRIx32 " from RX FIFO"
 dw_i3c_resp_queue_push(uint32_t deviceid, uint32_t data) "I3C Dev[%u] push 0x%" PRIx32 " to response queue"
 dw_i3c_push_tx(uint32_t deviceid, uint32_t data) "I3C Dev[%u] push 0x%" PRIx32 " to TX FIFO"
-- 
2.50.0.rc1.591.g9c95f17f64-goog


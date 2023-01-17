Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2784940ejc;
        Tue, 17 Jan 2023 14:07:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsqhlkIZQmNPX8ijcvRF1iN4PdrQeqfE3bKle9mhDJd1HWbay4gMONEPmspIC9WtXhCx6r5
X-Received: by 2002:a05:6102:3d3:b0:3cc:77d5:4bc0 with SMTP id n19-20020a05610203d300b003cc77d54bc0mr2353606vsq.33.1673993226532;
        Tue, 17 Jan 2023 14:07:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673993226; cv=none;
        d=google.com; s=arc-20160816;
        b=dPLpyYVAYVXsGpCc7oGUEmvwxnqOf1Y4PpisI/7ryG2kds3bRNaQctz9FVDsaSEOH+
         VerS4GrFH4o6J/edWQKXilU+k+5PSe3H+SC5Ue8D39I+3X+wRs869aC6UcIngyjf/8rj
         lqpJcQVE35BBVP0FUbBdtn7T3HoXpElGkHZT3uWMFrR6vFnuxn0xsrR6lH9GaP5V1+XU
         YSzaAESVH7i5GYPlGVmyx6otOGzfXmhMWuiLTe4np+LTyA3TjMO3Jlw9Hyz4a27ecXcq
         9Aum9gH5cvzJ0HrYNajXBpGpuEO3U2vegerRKHCE4w07DGialPWddLIkQgcLdL6vid8r
         mAhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=9TKsC6maeKp1zioEdXA9ySTOmT+xAgkJ3WU17vpuzeo=;
        b=Gzyg3sBNNm2+yYZq9t02QEk01k4Kkybt3gEnvc2798hMzVX4hfFKAYYuYYIU6t5aen
         uIfj2mUc1Z5qKojezMvn7abl+YeU4KdotPEwOlCuFL8S/AiIlpGvP5OzSql0rcU4Or2G
         L7yfvfhEm+tMk9EEYoz1Qe++yOnp6hc2+DHIMHiAgbRr4M1tNNgiWA0LbZCJpESc6QZ/
         xVM6zQ8Lx8M0j0RDgtUefGAp564OEMbgTN8v8eAOK/t8K0TUUvHvp8bIZ9uk1RDEuvWQ
         yZe/Y+i+p361f9Zg3MQV2tY2ecfBL71rFgSwdAGjCtE8ZtoHeo5RE8IiAFulEQSIkFWA
         6u+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=pEMhK14x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6-20020a67c286000000b003d3c513cb72si2267455vsj.353.2023.01.17.14.07.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 14:07:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=pEMhK14x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHu5Q-0003ev-LA; Tue, 17 Jan 2023 17:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHu5K-0003d4-Be; Tue, 17 Jan 2023 17:05:40 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHu5H-0006sY-1R; Tue, 17 Jan 2023 17:05:37 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id E7C0420E09E5;
 Tue, 17 Jan 2023 14:05:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E7C0420E09E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673993133;
 bh=9TKsC6maeKp1zioEdXA9ySTOmT+xAgkJ3WU17vpuzeo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pEMhK14xP8LBx4sIozuD4Ek44Qc5tNjiR2g0KQSEMUSEiOJoHnnkpik8qJ7kXRVZS
 33N8ai23b4CwC25o9zVTf21lrfde9RS2zPor0f9+3/vpW2x7HcmVM0byQ6vYBUxS/F
 D2qrk5mrQpWCBMVJguiVL4knBLsbTOVqu7N1nlb8=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 3/4] hw/char/pl011: better handling of FIFO flags on LCR
 reset
Date: Tue, 17 Jan 2023 23:05:22 +0100
Message-Id: <20230117220523.20911-4-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
References: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: P+Y8bwG3md92

Current FIFO handling code does not reset RXFE/RXFF flags when guest
resets FIFO by writing to UARTLCR register, although internal FIFO state
is reset to 0 read count. Actual guest-visible flag update will happen
only on next data read or write attempt. As a result of that any guest
that expects RXFE flag to be set (and RXFF to be cleared) after resetting
FIFO will never see that happen.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
---
 hw/char/pl011.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 404d52a3b8..3184949d69 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -87,6 +87,13 @@ static inline unsigned pl011_get_fifo_depth(PL011State *s)
     return s->lcr & 0x10 ? PL011_FIFO_DEPTH : 1;
 }
 
+static inline void pl011_reset_pipe(PL011State *s)
+{
+    s->read_count = 0;
+    s->read_pos = 0;
+    s->flags = PL011_FLAG_RXFE | PL011_FLAG_TXFE;
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
@@ -234,8 +241,7 @@ static void pl011_write(void *opaque, hwaddr offset,
     case 11: /* UARTLCR_H */
         /* Reset the FIFO state on FIFO enable or disable */
         if ((s->lcr ^ value) & 0x10) {
-            s->read_count = 0;
-            s->read_pos = 0;
+            pl011_reset_pipe(s);
         }
         if ((s->lcr ^ value) & 0x1) {
             int break_enable = value & 0x1;
@@ -421,12 +427,10 @@ static void pl011_reset(DeviceState *dev)
     s->ilpr = 0;
     s->ibrd = 0;
     s->fbrd = 0;
-    s->read_pos = 0;
-    s->read_count = 0;
     s->read_trigger = 1;
     s->ifl = 0x12;
     s->cr = 0x300;
-    s->flags = 0x90;
+    pl011_reset_pipe(s);
 
     for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
         qemu_irq_lower(s->irq[i]);
-- 
2.34.1


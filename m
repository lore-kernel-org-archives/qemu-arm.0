Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1912199ejh;
        Tue, 9 Apr 2024 06:39:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpjbGMzyjdickzSogk+Dho52CZU8PWb2TKR0dPCW2d7bA3i/0uih4pVDv5j8vd6fpDoq4CliaKQaOKy1dVFMHJbjOqTrVd
X-Google-Smtp-Source: AGHT+IH/ZB2xu/lKgIpVRnEWrvHDrz/ihbpRTbreFTRldRvtR+Q5ZsT3zW6Nn+J6gR6qc1wsALsY
X-Received: by 2002:ad4:5ce2:0:b0:69b:2066:fc58 with SMTP id iv2-20020ad45ce2000000b0069b2066fc58mr5757025qvb.57.1712669999372;
        Tue, 09 Apr 2024 06:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712669999; cv=none;
        d=google.com; s=arc-20160816;
        b=O5kcj3zSnzuwhjfr+vYfbmsAh7/YBhp9gN2fnROzDFeTCQrIF0NUYrPSiwCad5htW/
         N3ksJihty4gwLNpCOeAEfoxqivs3rI3Hm9HBAz8YGUR6ohnXelMXTlF/d3d4IVqKgh0O
         nY4V+iSsaYRDu+8ifl3/sJIiceXhViYOZdMIwxlGMgoCGRRrrw8/lYCQTriVjmfNDBhI
         LSNe5YlZQNojzqQAGODwQNbb0Gzy8x6A2mZ1vr7v+LKAZsYVsghVtCKnFb2oY8lT6dN4
         4rb8n9NxiX8lvkJ8ewMM6vX1MklqXzxY3JcqcwAT62/btouTL0AJxHY/8QXmvHNZ5F0o
         91Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=C1Zw+CVRCq/SOI5cLQNhCw7GlRbzROScTIFOWQl3mYw=;
        fh=6gLBnp13xOcbkEH6vXUGD+YCYLLzPHXjHPGTVJ+vjIo=;
        b=xf0SXlwZC3rR3jcu269g4tAKqxGvJIad8MLVyWIY/1496LdbvifOHQa21If/Qc7U5W
         TNQtAbEWcglriX68Mm218CMPq9CrC3JfPjTsTmN7x8eh3rjH2/b296esGA53DnB/+tzs
         zpHxKj7TWPTDHjR1gZzzTXy430xx/ROJAp5s9+04uKzgkyl3qct8IO+CSCUf2a9/nE16
         zwGd0+TiAp+6uVElVYFbLFFwMQ1mFUPkMFcYOPCYfGfpvaRob2N5k2uAZ4vZXDSGDBSd
         kN4sLLkARU6Z2XdCtEoN0KOsqwylC11Tl3TzklDcQ7jnxJT1YheKZvS3oDNoh56FK2+/
         C9OQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QDLRDwUt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a0cfd92000000b0069b2a0fce8esi1339168qvr.595.2024.04.09.06.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2024 06:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QDLRDwUt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruBhB-00077K-4F; Tue, 09 Apr 2024 09:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruBgr-0006YC-G0
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:39:11 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruBgm-0008JJ-6a
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:39:09 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4168a5d7564so10812365e9.3
 for <qemu-arm@nongnu.org>; Tue, 09 Apr 2024 06:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712669943; x=1713274743; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1Zw+CVRCq/SOI5cLQNhCw7GlRbzROScTIFOWQl3mYw=;
 b=QDLRDwUt9F260+tAmYNolfScg60li8Hg55PKVdG0mGNsqfJdsCZ3EhL2EzRWmqJq2M
 R1lY3Z9ufDqcdj5Wa+ff64cqsDay+cmmHubcElOvq8UpXVOIAKxrRQ4VLIqR/Yy57F6n
 +OH+QVZUUDBcmTTjCeM3Rvy+kI9GXfnjOvnIEUonWKCn6Knu2sroQL4bvu3ijZbnfxyz
 7uXtkkSVoxX94M/+EMLtWyI7ETpb5JdLxU1CgaVyNLMypuUJ1Li8fnEjFvyjL6uCFLz6
 SP9g/kU5AzptsVKOGVyR5vO/CTmLek7e6Z9hkZqJGjr5SuY8A2ukznHdNdy6V5CsRtEC
 KtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712669943; x=1713274743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C1Zw+CVRCq/SOI5cLQNhCw7GlRbzROScTIFOWQl3mYw=;
 b=HslBw62oN4KP8iwbX98Pfgedt0ZR9oyIhN/whFUmzAYRmoVfu5WedZjmhPNSCPy+L0
 IJW7k7iYfZjd4d1E4XiXrM/SaQ5/STjeXi2x1ZzFBvYRAFCIzMPMMLsoNIk999UHLpOA
 Jbk+QDj8mqq9v0Ub3PoDcwgVS5FpNRUlQqVuYHaO3mgpCdEqOJjsI+xwf26zX0EwNYAK
 YqVQj8mhWhRb3cuHcVqAnezZYNNmW+jVFyU/tTpQQ4bx+hwaTYe164LWv3kfqPYJKkM6
 D3I7N1KFuuD9zewJz6+gBuqckaSc0gjFMKTIpFv3LWXL7CkvTZIcDv9zhlHqDUsj/6A3
 S2WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJIJsRhlOcwNc2BCogrrTeENUO+Gid6g6WnO122+emWLSw/6fldFy45rGdR4kTM5FZIt/2wbmI7EMNjNe0ZwfgaPpj
X-Gm-Message-State: AOJu0Yw2MbC/wy1cuh171q1mSPg67OkRJDcNNrYaAeKd3AeqdUKnWLnr
 6XYG5NvH5gyjo/x7QOJOaC5DdUK45xkciuYlXDf72U+2uztCkA2fxJJosEHbKh6s+yyq52e9/1x
 b
X-Received: by 2002:adf:e847:0:b0:343:dd56:b941 with SMTP id
 d7-20020adfe847000000b00343dd56b941mr8105877wrn.52.1712669942881; 
 Tue, 09 Apr 2024 06:39:02 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.160.134])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a5d5187000000b003434c764f01sm11479350wrv.107.2024.04.09.06.39.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Apr 2024 06:39:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Chuhong Yuan <hslester96@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH-for-9.1 v2 11/11] hw/net/lan9118: Rename rx_fifo_size ->
 rx_fifo_wordcount
Date: Tue,  9 Apr 2024 15:38:00 +0200
Message-ID: <20240409133801.23503-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240409133801.23503-1-philmd@linaro.org>
References: <20240409133801.23503-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DzDDaz8alWRk

rx_fifo_size is a word count, rename it to avoid confusion.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/lan9118.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index 56cc52d450..3db6bae908 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -263,7 +263,7 @@ struct lan9118_state {
     int32_t rx_status_fifo_used;
     int32_t rx_status_fifo_head;
     uint32_t rx_status_fifo[RX_STATUS_FIFO_BYTES / 4];
-    int32_t rx_fifo_size;
+    int32_t rx_fifo_wordcount;
     int32_t rx_fifo_used;
     int32_t rx_fifo_head;
     uint32_t rx_fifo[RX_DATA_FIFO_BYTES / 4];
@@ -335,7 +335,7 @@ static const VMStateDescription vmstate_lan9118 = {
         VMSTATE_UINT32_ARRAY(rx_status_fifo, lan9118_state,
                              RX_STATUS_FIFO_BYTES / 4),
         VMSTATE_UNUSED(896 * 4 - RX_STATUS_FIFO_BYTES),
-        VMSTATE_INT32(rx_fifo_size, lan9118_state),
+        VMSTATE_INT32(rx_fifo_wordcount, lan9118_state),
         VMSTATE_INT32(rx_fifo_used, lan9118_state),
         VMSTATE_INT32(rx_fifo_head, lan9118_state),
         VMSTATE_UINT32_ARRAY(rx_fifo, lan9118_state,
@@ -462,7 +462,7 @@ static void lan9118_reset(DeviceState *d)
     s->txp->fifo_used = 0;
     s->tx_fifo_bytes = TX_DATA_FIFO_BYTES;
     s->tx_status_fifo_used = 0;
-    s->rx_fifo_size = RX_DATA_FIFO_BYTES / 4;
+    s->rx_fifo_wordcount = RX_DATA_FIFO_BYTES / 4;
     s->rx_fifo_used = 0;
     s->rx_status_fifo_wordcount = RX_STATUS_FIFO_BYTES / 4;
     s->rx_status_fifo_used = 0;
@@ -504,8 +504,9 @@ static void rx_fifo_push(lan9118_state *s, uint32_t val)
 {
     int fifo_pos;
     fifo_pos = s->rx_fifo_head + s->rx_fifo_used;
-    if (fifo_pos >= s->rx_fifo_size)
-      fifo_pos -= s->rx_fifo_size;
+    if (fifo_pos >= s->rx_fifo_wordcount) {
+      fifo_pos -= s->rx_fifo_wordcount;
+    }
     s->rx_fifo[fifo_pos] = val;
     s->rx_fifo_used++;
 }
@@ -584,7 +585,7 @@ static ssize_t lan9118_receive(NetClientState *nc, const uint8_t *buf,
     fifo_len = (size + n + 3) >> 2;
     /* Add a word for the CRC.  */
     fifo_len++;
-    if (s->rx_fifo_size - s->rx_fifo_used < fifo_len) {
+    if (s->rx_fifo_wordcount - s->rx_fifo_used < fifo_len) {
         return -1;
     }
 
@@ -672,8 +673,8 @@ static uint32_t rx_fifo_pop(lan9118_state *s)
     } else if (s->rxp_size > 0) {
         s->rxp_size--;
         val = s->rx_fifo[s->rx_fifo_head++];
-        if (s->rx_fifo_head >= s->rx_fifo_size) {
-            s->rx_fifo_head -= s->rx_fifo_size;
+        if (s->rx_fifo_head >= s->rx_fifo_wordcount) {
+            s->rx_fifo_head -= s->rx_fifo_wordcount;
         }
         s->rx_fifo_used--;
     } else if (s->rxp_pad > 0) {
@@ -1135,8 +1136,8 @@ static void lan9118_writel(void *opaque, hwaddr offset,
                 s->rxp_offset = 0;
             }
             s->rx_fifo_head += s->rxp_size;
-            if (s->rx_fifo_head >= s->rx_fifo_size) {
-                s->rx_fifo_head -= s->rx_fifo_size;
+            if (s->rx_fifo_head >= s->rx_fifo_wordcount) {
+                s->rx_fifo_head -= s->rx_fifo_wordcount;
             }
         }
         break;
-- 
2.41.0


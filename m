Received: by 10.223.159.74 with SMTP id f10csp6411620wrg;
        Thu, 14 Dec 2017 06:58:55 -0800 (PST)
X-Google-Smtp-Source: ACJfBot+L2eXCr1JVsNFAsxvc+/LKlfbruWp7eRTSAht1XW75/JssphmCUF2Fw3KStPOPu2651xS
X-Received: by 10.37.191.134 with SMTP id l6mr4381538ybk.525.1513263535486;
        Thu, 14 Dec 2017 06:58:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513263535; cv=none;
        d=google.com; s=arc-20160816;
        b=tB0toMSg0ylVRQQZ7t5/+H7BH0fUGOozOem+lz5dNkqOZtsfDuVIMCRaNEXenRo8XH
         5+hxTjMOnNR0Lkk46wwwgDz9vbq0opvLrxi1pWeTqGfQA8fV1zWZ0tuOfFZtAFy/ETGB
         t0l7/sc+S12eensTCj0j+Lyd5pqiSR6KWQZCG09HeJf1HQHuO9UYmhIOB4MLlEsjdMgv
         Ql0EJB2FYscWN90hQiLYLmd7vPr7N5pPhjMBp+yNq6OVkssMggxbMPLpkXzQWDHHdMHI
         zUTEmvnuuzUwgwF6IdcfuXwt/tEi6GkM8k2aHPY+xbBhQBmIOShgynH4ECmDbvqcNuEf
         qRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=E08NgLB+iZxe+FQ8+m6OK1RQdn04+8BR1I1ixtM1hXU=;
        b=LkcxGmJDKK9iRT6QI4xrhXa8e5OcW1onMJNfOQwj5YyOHQac/Rp3sX8qTARL2DPtPD
         ZiguV4gyblQLaFeSIbt4K+26g41mNMEUU4lQg3az0LlIVhCu4xX6nDS++lona35s1F0m
         PbX8yuPitQ90RIwunCmRjdKTn9uEJ2M615OmVzAQX68R9j83c2g2Aum2mhYB3DAX1+XT
         uaPrnFjiFTsv6KScZySBoYKRrFGKU7odzCXV9iZlr8kpCu2ynH0g+VMASQO6qWBqhnvh
         CIDyETseoo3ShjHyHK3+Ta1BsedhR1ptWH+3mTelon+QcpGQ5OvYc7RGGKI/9dv6BEQi
         Qagw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lLCRpikG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 128si838244ybw.612.2017.12.14.06.58.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:58:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lLCRpikG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePUyM-0005up-SG
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:58:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUtA-0001TH-AT
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUt8-0000Th-74
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:32 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:46612)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUt8-0000Sd-0k; Thu, 14 Dec 2017 09:53:30 -0500
Received: by mail-pg0-x244.google.com with SMTP id b11so3542002pgu.13;
	Thu, 14 Dec 2017 06:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=E08NgLB+iZxe+FQ8+m6OK1RQdn04+8BR1I1ixtM1hXU=;
	b=lLCRpikG97b3gKaCARhwPrgytRxH5OCNzTyNiClaEm6wmkp6SJ6tlfIBNYugXDZC26
	oL9LzS/34137/UxAFw4wdc+yencF/fkfNQz/q8R/BhYdFRQ/xcQkxNyjwCmAEemtJx4U
	osdTVCp/S/FcC+zmf2XQhmdkApy9vguqUNUehFAZC7vwRa2ieSwNCU7VUSDrvUFXhZ17
	WvDn+AwtIJChIpZhjg6Fm/C9jLt6qzvBOuYhv1KxUCy3tqIXm3zvddL/R6TKW6d6uA4C
	LdOe7IFlq74lchv8XcU4KtsnZ2AeSjKOYzW+87lbLETB/DxAVTuXMFszAFNiVucpdbgD
	XGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=E08NgLB+iZxe+FQ8+m6OK1RQdn04+8BR1I1ixtM1hXU=;
	b=Q4hfvFB5HNizNOA2v7oFGs8gx2hAnuHKDmCpK2Q28RbhHNmJ22qDZJgJWlgcgOXEfl
	y3PDemXU81cEGcpnziDC5z16km/r0BNXq0KfywiCYVuaKPn2FQIjr8He2y/+Ex2lXTJ/
	Z/9x2GXf5Hjd1MtFLXwLz5xUtrgR1a4VHzRBbt72mKabrw5rJ2HxwkhwwV2nkbEGwQ7Y
	jIQ0aW22+BYrYRgwlB1y5LCRzSxjQ7u32jvT/h0H2u3T2jaXOeO0QCClm5UYUsvlTUsq
	JqDNvJBuf8bM5aeTa8G55h5p9m2Tn+o7AXxY8ywalmQ0bYtLH8+BzB/Z6v/b6HpSi+ZB
	8Ylw==
X-Gm-Message-State: AKGB3mI3VqDNVU/HkmYIl4zkODifk9eVoIHYy56QOTJeTQOTaDM00TRr
	x9O67yAKXEjDcGLqsHFVlZnxFiEv
X-Received: by 10.99.107.197 with SMTP id g188mr8701983pgc.295.1513263208628; 
	Thu, 14 Dec 2017 06:53:28 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id e7sm8757439pfj.44.2017.12.14.06.53.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 06:53:28 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Thu, 14 Dec 2017 06:52:47 -0800
Message-Id: <20171214145255.31545-8-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171214145255.31545-1-andrew.smirnov@gmail.com>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH v2 07/15] imx_fec: Emulate SHIFT16 in ENETx_RACC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uvUtZ9ryG1c2

Needed to support latest Linux kernel driver which relies on that
functionality.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c         | 23 +++++++++++++++++++++++
 include/hw/net/imx_fec.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 6feda18742..825c879a28 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1037,6 +1037,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
     uint8_t *crc_ptr;
     unsigned int buf_len;
     size_t size = len;
+    bool shift16 = s->regs[ENET_RACC] & ENET_RACC_SHIFT16;
 
     FEC_PRINTF("len %d\n", (int)size);
 
@@ -1051,6 +1052,10 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
     crc = cpu_to_be32(crc32(~0, buf, size));
     crc_ptr = (uint8_t *) &crc;
 
+    if (shift16) {
+        size += 2;
+    }
+
     /* Huge frames are truncted.  */
     if (size > s->regs[ENET_FTRL]) {
         size = s->regs[ENET_FTRL];
@@ -1087,6 +1092,24 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
             buf_len += size - 4;
         }
         buf_addr = bd.data;
+
+        if (shift16) {
+            /*
+             * If SHIFT16 bit of ENETx_RACC register is set we need to
+             * align the payload to 4-byte boundary.
+             */
+            const uint8_t zeros[2] = { 0 };
+
+            dma_memory_write(&address_space_memory, buf_addr,
+                             zeros, sizeof(zeros));
+
+            buf_addr += sizeof(zeros);
+            buf_len  -= sizeof(zeros);
+
+            /* We only do this once per Ethernet frame */
+            shift16 = false;
+        }
+
         dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
         buf += buf_len;
         if (size < 4) {
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index a390d704a6..af0840a0fa 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -170,6 +170,8 @@
 #define ENET_TWFR_TFWR_LENGTH  (6)
 #define ENET_TWFR_STRFWD       (1 << 8)
 
+#define ENET_RACC_SHIFT16      BIT(7)
+
 /* Buffer Descriptor.  */
 typedef struct {
     uint16_t length;
-- 
2.14.3


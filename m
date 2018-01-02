Received: by 10.223.134.117 with SMTP id 50csp11156830wrw;
        Tue, 2 Jan 2018 11:37:28 -0800 (PST)
X-Google-Smtp-Source: ACJfBosHHY5FvMahuAlXUAuCeObMFkZnK6AGF7OYiLvbcxBvf2MtaIc2gifw9bYYUivEOd5UklgP
X-Received: by 10.37.220.73 with SMTP id y70mr20750745ybe.496.1514921848660;
        Tue, 02 Jan 2018 11:37:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514921848; cv=none;
        d=google.com; s=arc-20160816;
        b=ALkP8iUsENIvthkc1wwy16f/J6EG7+BO66Bp0sRGO8Avl7zyJBRPBX/kvWicnRlZfb
         KAksmXVW9wV4lLs1Q9/IaLht2Pr3+POfpG7y7DF97ZNOwifqtyOPYZqUcoROMPMQY+U8
         D+cwtxT13AquJBYj2giltpzMooz6y28OiJ6YR5cee/dMSKeGnfBiUfqYEiZcJqMCftie
         DsZvm0iGLTb80sJa1HVsUqcdUnYENj66z2iAkWr30ADZ2EwWE0TUH5zoQySt+G9pyPqH
         GZqQF3qV1HvrKKnWRwtnGFOEgXWWmntr592XIlc3CLbJnBC9fGHZZgO9WHkN5OSqRGFE
         VGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=E08NgLB+iZxe+FQ8+m6OK1RQdn04+8BR1I1ixtM1hXU=;
        b=EPx8Dg5oAKo0WADipn9+adHnTBliO/mwBjo6zbGsecZsFUE9NlZiRkVuRkA8x4PmXO
         JrehzCLivUpI47eQMkznL4mHhQIAGEcVF9Ihg7tDdqAnzaIPpgU1vDqjhtH4hMJ8tdcJ
         PdB5UPPIgYGvwy3iBTC3vpvvOC4w+owkm26Ypq8zrQhD+jIN9e50lY7Ul6i+PyBDhd+B
         Vz+rJZ8jd3wF7CDMD4YPnfJS8NyRJrCVTkuCwHv6eKwim/Stno2/oPohFf21KxEJeWz+
         ahw/IGy5FdEOP09SOU6hI1i/3PfGBmSXD+6/Woq9+D/blK7dHvHzeFGlMDVWOBmWUpuH
         NYWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uMTPABtX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v1si8466494ywd.737.2018.01.02.11.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 11:37:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uMTPABtX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWSNM-0003ks-3L
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 14:37:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMd-0003Gx-QY
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMc-0000MA-Lx
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:43 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:37964)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eWSMc-0000LJ-EY; Tue, 02 Jan 2018 14:36:42 -0500
Received: by mail-pg0-x243.google.com with SMTP id t67so2960602pgc.5;
	Tue, 02 Jan 2018 11:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=E08NgLB+iZxe+FQ8+m6OK1RQdn04+8BR1I1ixtM1hXU=;
	b=uMTPABtXcvoTcA3nmFonEgNk0CbaxGmlmni9VXcxvTIuwjLN5F1Jwu9l41xVYwO5VJ
	uXnUKRBRLmx+KmNV7SXHKKrJW7Z2dvSfSnnCzIJXQqsHLzk4BpJvSy8qxeJNzK4rQtH2
	mInNRoXfm7W4R8TJCJP1+aLpAEGy6NJgXTeBv8clpboeVudswKFp4dI3Xwvgou9Bkwxg
	jp4rrjm0sAjPZmSWGzQzKQi4kanup/lbnivtTm3RbDMkSSnUPvooGssfcmGlN5a/Hhrb
	xTMh8SD+edi7ClH0K1YFMpn+WwsKPyMR3SQ/iUYCjmFlb4IGzZlc18EVrQFEvIuhPwYJ
	rGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=E08NgLB+iZxe+FQ8+m6OK1RQdn04+8BR1I1ixtM1hXU=;
	b=HSA0UvQw4IjsOIDykPt8JO5T3byyIlcCVezeI8B5Z2U8SRjxoRBb64B+xBU+OiPO3I
	9aoRAoVAo8CE4QGT9xyiMZsQEM04sBv90I4NoXarFLqjcV192k9DDgOOw+TwdxdZyfB3
	SutGi73bBcrnnH7s7euHulBXHQBn8MQsxcPTu8aF7FPO6eYL1Un2ToJJO40AJumMUqq+
	2AgcntSlIt0dpmgNBsOsfKf/mShYjtg3i1VPEbprbXqEB2ed2LOKAgdvtODL69qmhhno
	1LsllC8ZUxkGVjBAhQJBGhVjx3bttGX11MFFeuKld6lJ85UXqmAoLULd8eWoAxnruU4R
	IZUg==
X-Gm-Message-State: AKGB3mLxjm4lC9dquIROTUzlN13787du4DCSVW0lKEFTTMEFK8pCLUwT
	fkz2Mzd808VePE0l7+lwX6xJ5dzjlJs=
X-Received: by 10.98.153.221 with SMTP id t90mr46107541pfk.210.1514921801180; 
	Tue, 02 Jan 2018 11:36:41 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	g9sm97905951pfk.0.2018.01.02.11.36.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jan 2018 11:36:40 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  2 Jan 2018 11:36:18 -0800
Message-Id: <20180102193622.27215-8-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180102193622.27215-1-andrew.smirnov@gmail.com>
References: <20180102193622.27215-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH v3 07/11] imx_fec: Emulate SHIFT16 in ENETx_RACC
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
X-TUID: vm2PESPsnFZd

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


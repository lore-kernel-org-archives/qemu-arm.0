Received: by 10.223.150.237 with SMTP id u100csp2787718wrb;
        Mon, 6 Nov 2017 07:53:38 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QK1wannefJVLQZqy7YKMpLCJJ6wCU0p6JivX+gcN+/bJOIWJ/MRjNZRpVYD8InurAluet0
X-Received: by 10.129.132.202 with SMTP id u193mr10598175ywf.396.1509983618014;
        Mon, 06 Nov 2017 07:53:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983618; cv=none;
        d=google.com; s=arc-20160816;
        b=Wkc+NUbDYRojaNk8bc0FJ9ITAMs3pm3xnjziMp2iSpw/8+k7ORTrKAesWjP8c8oVnN
         GzIMieIg/uu1O5IoDbyY1oRZMe/c1C0iOSmjsSXs63SJ8TYIeWgMa0NDSEAePyq2rRSL
         IORctwQTtRlM8p2xJCdAJlBEATYI3Ci0BLh9WZD7bkCTSUEficiYfN2UJwD8jTC13U1W
         ZtmVqFA/dWg26j9IIXrD/FrVbKQiLIQiLqwIZeVGbz2Zcxj98aiKnWJ5tW3nao5u7rUw
         G29gjdIFORFwNKR5+dxJGkMf/EK0OlZmFHr57VZQGMixx2Awp07Q28bAKELwIr4c6FGB
         +LuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ruckcZDVpN8FIIpwJLiMbExU+jDwytNG9ssxU4sSrPQ=;
        b=DvxhiDrWZ6d/INwl8ozAbu9xArYyAf3FbhSBK8lQcutt/IZz9LrQCbmc7rTnh4g0Ir
         7Q03X5myDlFpz/aFzTD+t5IUZVgpaRt2NT9GiUyXkEon3yCqrJI2iYT0M2LQ2IFV80zS
         8ELspITPZHbpIMS3s7XZi8BBjZ9FPFvu5aWKH5JkBnhaVHOHMNWwhbVJDnVyBQbDiLdF
         g7p9cP7/WdTftE3WuPqMvB1ptgGnbKN1b6evNjeOXtSvF3CCRBHDWaKFminP0WbOrkpz
         6wxmJp/x/7adZS4ZziWgDd/pr2BRgth4RNjcT8y/iqs17ksdNiZA/BpN+WEaSLXTSYCQ
         AZOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BXq6fMKy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x129si2778307ybc.770.2017.11.06.07.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:53:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BXq6fMKy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjiT-0002rc-9d
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:53:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdf-00075q-SK
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdb-0000PT-SN
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:39 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:50404)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdb-0000Oh-MU; Mon, 06 Nov 2017 10:48:35 -0500
Received: by mail-pf0-x243.google.com with SMTP id b6so8016564pfh.7;
	Mon, 06 Nov 2017 07:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ruckcZDVpN8FIIpwJLiMbExU+jDwytNG9ssxU4sSrPQ=;
	b=BXq6fMKyMdw0Vg3o43mQ8wG+bCE3+eYFkXq2i0XwiOFWG3hhzOpuWzuLtQ4NTNe5X5
	l7xZh2uoGelKHhdD5wybYRKLo89dlai8RMYBP8zNwQhMUC5E7y8lMX5+GTBFqLwLav26
	MXhBa0hZLmg4N+uQR8+nPBF4NQ4BgI64TyxK8tk1NucQGvlxfD7qsCDTu/rbOsjpYtQc
	uqRNWuoDuACbyPwlHW/sR+41C8zRE2BA9CeuON0xAB6pHXz+qRCF1Ljsrrpolczm0Z6P
	XbU43B7UujlKafBTrXxr5PpKRModIMEAkSNm5LRgaHN7ubq+L2GUjAsTFKsOGL3p1HRe
	2DPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ruckcZDVpN8FIIpwJLiMbExU+jDwytNG9ssxU4sSrPQ=;
	b=sF/VH77Uk6EISpVzlsGwkmb4fJVu3tlBp2lg9Vpa2IB6q6Z+CGRhC0LOnlJmxhXoww
	LHMJLAT97aQVAA17m9CQapuytLDo+gKmytYE9T7OxySSNBzwy9zCo9p7xo8Jsgtm3cSQ
	SYkxr4sMpnF0DrNLRcPbMbygeV0dwql795q54b0cyggCOkERoszXQdrhvb08J5w8b3Sr
	u9kEtrkMovpS5CB0v4qx12mHhG3kOIUlxc4wl0j4cPI3XVn19CtW/ASt6DZbv58ZxXDE
	95OrrjAlcCE4Smt9UM8xv6UBm0d5gZv0pQvdIV1e+o9NswsBFxNluRVAg6TVfPYgFXr+
	Ff5A==
X-Gm-Message-State: AMCzsaUdbZ4hRlYX77tP1TVzKVEh/tYgnoUZgWPLB3Q7oJoo9OMEqKM3
	Y3k3+4ckoZGmcWg/7qZVi6iQ+ZSOSEw=
X-Received: by 10.99.95.203 with SMTP id t194mr15383689pgb.318.1509983314427; 
	Mon, 06 Nov 2017 07:48:34 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:33 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:47:49 -0800
Message-Id: <20171106154813.19936-7-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v3 06/30] imx_fec: Emulate SHIFT16 in ENETx_RACC
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
X-TUID: e/5nQ9cMpWTQ

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
index 18de508e8c..131e7fd734 100644
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
index 0fcc4f0c71..e482d1c13b 100644
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
2.13.6


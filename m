Received: by 10.223.172.38 with SMTP id v35csp4137568wrc;
        Mon, 18 Sep 2017 12:52:17 -0700 (PDT)
X-Received: by 10.200.9.61 with SMTP id t58mr53926579qth.317.1505764337243;
        Mon, 18 Sep 2017 12:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764337; cv=none;
        d=google.com; s=arc-20160816;
        b=mfltpGZ6ywt+YsonkDkC2s6bwDnM0mSA2mhvSlcqscMvM6Yuk9jXV6MdlhaFpdPY5E
         CVheou+9FVzMgOQDoach5aPYA6cS4SDV3/nwoj9DmufxTCNvgXtN9XgUnspghdWXQtAK
         taXyJPK44Cj4AMbjOQ2bJFAB827LOu3PcqQlGLAofwetXXDZtiSatO4cfN8JCv/O7PKu
         5StpX7uJR1gwsmjIO1wMaYwAT42fmrJlD/yolpzONusep6wyawQVTbT+lkQZUuy5My5J
         KseM10ywJQrp2yNxZb5olKLd8LxH9ui/OyHd5djEc5Glsw7qVr3+syJkbbwNNgyo1mII
         Wdiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=gosmns9ewTlxveN5Eu1UJHKyNHtlDRa4EATGzSoL4Do=;
        b=ywxco57i4ztZEp84gwIjxCVpxl/vr5x0XJzt3goJBI2Mjo0HTmxa84UkufrR/Udayg
         CSJJdKl4+w6ecjZmTOvdo/B1/kR3rmm12kmB9emuL+TyGeyURBQCHtx/fewcll5zvLvA
         LfQWwmBK0aVSJQMSp/IPqgW6U6id+Nxtyn95rUEkqWB8tOoeWY9foQmO2g8gcLfRLtzC
         2SlFO05AyuiiK/E1+rVpYbYy+kzvOzFZjP1ezbkjQNlqDcF3dD41Cdu540AmsqL5m1jF
         En4+XmmRKo/2Dio0dTL4onkwCg/hfPZT5/S5MseOV+wYgp8oq4fkEoDPbXhoODKpRrNr
         UMeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ak+/3gYS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p14si1675727qkh.279.2017.09.18.12.52.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:52:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ak+/3gYS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du25W-0007PA-Sd
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:52:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24s-0006mi-3v
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24r-0006HM-7e
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:34 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:34992)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du24r-0006Gs-1T; Mon, 18 Sep 2017 15:51:33 -0400
Received: by mail-pg0-x241.google.com with SMTP id j16so775197pga.2;
	Mon, 18 Sep 2017 12:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gosmns9ewTlxveN5Eu1UJHKyNHtlDRa4EATGzSoL4Do=;
	b=Ak+/3gYS5Hi/JBHz/t2OZcadyj1fGAo1yHscBfyCu+TpbomGTu2wg7EVlanoixcYyc
	W9OzKggA1fHgQZR5QBp0ZoqvPJJN1MU9j1GsB9lF+wNQzyDvpTM9yvXVORpULLAUQIH+
	gQGtOhVqFOzV2zEh33tW+ZQ5ZlG8BVFWC0KXBNstOSYtdOO+YB4yTHhM3cOP7l9saNUm
	bPWgelT1B3IQrIuT9nEMee7t7m4wE7jf+EzCrxVlL1N7fh6sp+7Q4y46HK63GCFL9Np1
	kdZR+zL6HDPF5ZnbgU0jotfUGd1sTlWtnJQoBPUoehYyDO7JG3kg+dW2LjUau4/dNRSX
	nslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gosmns9ewTlxveN5Eu1UJHKyNHtlDRa4EATGzSoL4Do=;
	b=q/nq7rJl+/qnBltduBbMdVWxryVSsggwPqfmCZ4AThnOzlcE8TbNxOxrs+NLrZ45iL
	45B3/s/MdLwrO0K7j9Hw8YrjRKROP7p2RoZTjY9hvmqfeXLihFiudJrgWpKZPe/xtyKs
	3z5q2ojPTbeE5INRv5EYak9oAKqivTaPkIS5xWgCLJlhyOvUQ+iLxSa4uvClNilPvUWO
	MfR+wOwFjrih7jzzG3vZtfk1cSGUCB06BanSsbAuSw5hSmgYeO/wlb2f4CsGefEplnSk
	XH4ZLcpHttxIge1JQFwW3Fa2/wJiYVfHK7EQsjMLYKOy0Z59Qf+ldIclbb1+58WDxW7/
	zedQ==
X-Gm-Message-State: AHPjjUggZLlgx0cOBfi+iyaw0IDk37zqs6MHVO62aV9tnq+OhzTBgZEH
	akTrp3iMgvJduYe1vk8=
X-Google-Smtp-Source: ADKCNb5zgtJorYeSnDmcyNQoXvc0jzRlTJM3+lqwjno2BXj8kx7Lk9EJae4kuMnJrOglqGK1JYADIA==
X-Received: by 10.84.129.193 with SMTP id b59mr36779462plb.88.1505764291848;
	Mon, 18 Sep 2017 12:51:31 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:31 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:50:50 -0700
Message-Id: <20170918195100.17593-8-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH 07/17] imx_fec: Emulate SHIFT16 in ENETx_RACC
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A8V6I+peT793

Needed to support latest Linux kernel driver which relies on that
functionality.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c         | 23 +++++++++++++++++++++++
 include/hw/net/imx_fec.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 8a77136d38..bd62d7a75f 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1037,6 +1037,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
     uint32_t buf_addr;
     unsigned int buf_len;
     size_t size = len;
+    bool shift16 = s->regs[ENET_RACC] & ENET_RACC_SHIFT16;
 
     FEC_PRINTF("len %d\n", (int)size);
 
@@ -1049,6 +1050,10 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
     /* 4 bytes for the CRC.  */
     size += 4;
 
+    if (shift16) {
+        size += 2;
+    }
+
     /* Huge frames are truncted.  */
     if (size > s->regs[ENET_FTRL]) {
         size = s->regs[ENET_FTRL];
@@ -1085,6 +1090,24 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
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
+            shift16 = false; /* We only do this once per Ethernet
+                              * frame */
+        }
+
         dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
         buf += buf_len;
         if (size < 4) {
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index 4bc8f03ec2..20a6aa98b4 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -169,6 +169,8 @@
 #define ENET_TWFR_TFWR_LENGTH  (6)
 #define ENET_TWFR_STRFWD       (1 << 8)
 
+#define ENET_RACC_SHIFT16	BIT(7)
+
 /* Buffer Descriptor.  */
 typedef struct {
     uint16_t length;
-- 
2.13.5


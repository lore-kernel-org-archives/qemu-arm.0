Received: by 10.223.161.27 with SMTP id o27csp1209774wro;
        Tue, 24 Oct 2017 19:29:33 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QVR++9HdBU7VDD00dVCbteNWipICWwdbI7kFzemBRQ87zV1u1HK3Aio79bymGFoJ5JD37U
X-Received: by 10.37.212.143 with SMTP id m137mr452702ybf.184.1508898573200;
        Tue, 24 Oct 2017 19:29:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508898573; cv=none;
        d=google.com; s=arc-20160816;
        b=r9DLghMIOcylTdWR2LxcC0D8mZh3XL+qRW32RocMZJHVYUz88UJ9ni4Glws3cTc37D
         LVL0rPb6WCeNB/PdlXypD+eypKnAt4B3sHb5P5uvG+rr57EiJEyKUQPaaIliAiROZfn6
         3EGPDX/g5gfNJsa+XMQOz2PQH5sIe4E5kDYjGd4L2YKtWzleml3uFxndL2KfFi9jnnSF
         k4Tii+7PViphijbD4ulIrf+h7l5n1Iq2hq/1VhaLYc3sWJwYeakQIIVM/sIFe4RbZwGz
         frc1cUh2Nn+W5zBnPV2+aN7u1g6oC/eObYCMxky33iMCSakZPGdaIGI865qiaaId28ys
         AjEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=X1R6BR3c2quFfhE8WTfL1T5OX3rKqyjuMf6ZDBBUE4Q=;
        b=jW4pysZvBDQa+LcRgp8WxekJEv2IkHPu694eDEkST4+wcGejhJ1PY976PaBMKlsQrJ
         RsTqBw7GlKccnLfab9Z1y54HNWyCVML2+hZFmzgkcPvo9tpqhIj94qwuoljE0TgEIR3F
         K4DLNUWXalENoS8RfwDYultdkliUCvnXnIcpI4P2cZL0oaIxbM0+R8zX+bzEgAbejCbb
         WMyYKwPN4vma464yib16vpn0S7ACxjcUAe7m4ZgenTlUHwQWD1evye6awFuQq4+hh9eT
         Utz2ZijpDYLUHPg/a0va5Pfi8rt3s9fKaLnpwbNLYOBtw/QWThwC9EgXNdflCI4M8DGD
         k2aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l2NGtsJb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c71si256182ybh.565.2017.10.24.19.29.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Oct 2017 19:29:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l2NGtsJb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46242 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7BRk-0006Hw-LN
	for alex.bennee@linaro.org; Tue, 24 Oct 2017 22:29:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e7BRb-0006HJ-BI
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 22:29:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e7BRa-0007FK-Gh
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 22:29:23 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:52654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1e7BRW-0007CB-5p; Tue, 24 Oct 2017 22:29:18 -0400
Received: by mail-pf0-x241.google.com with SMTP id e64so21104552pfk.9;
	Tue, 24 Oct 2017 19:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=X1R6BR3c2quFfhE8WTfL1T5OX3rKqyjuMf6ZDBBUE4Q=;
	b=l2NGtsJbQcnOxDiDGsaQ9/O+gkERzm4cZiVf3eWzA1WVrzq8bZwyFq6otZ9BxbUiA1
	LLDWzhE6sVyFZdof9kzmT6pJLeTs6F+66Afa4EpKHaEEVbTfUu3cpD90vNxYp+5UmbcV
	cr2AOL6A6AVgV/6GhEZNqwzXa3MDN/yK39ufbw+h4wodWFYXVY2ExT7eBGn+nRNx95Fx
	5Uk41cFWNt0vW5VJ3oqDzwz4ii/HxaaJUgk+vjrOBTlbsfDQwnuYQ+tdBo7f2OGjzmbZ
	/9N1gP2zomsDT0jGLz5c5dN5hhOGfDT0xhdGRr2tMl0SNG354Ln+3idmSJx45ZvMHGTy
	ne/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X1R6BR3c2quFfhE8WTfL1T5OX3rKqyjuMf6ZDBBUE4Q=;
	b=GffQMZFEn9AZGV9IDGwiTy/48R6QmuZJ+mLIjM/ZYA3DFbwVrCPdDLEhFeMZaDLcyr
	eZ59MJJ7P+vXQHqS9YP2PNZLyIjMx7y+QC0BgF8bjspK7KmgNvRABbGHW9WyRUvqTUbl
	wjSyQ/FZgLl2XXzsCTBslBzZJo7D4LJ21K+34d4z2Bfp38kCzcOOU1C/gIZUc8rjnDNq
	UQeTWQJZW5hOyjP2Q2TybGBN3jdFE3yrt9iFhxuTmqRMp8NKDl2sQb87BXQg6zzmHaEf
	3YdnpEDJQsYXCugI3/+i6ZUAHor6MHRhYPSIIMPogmQaU2OKMLRpYNSTxLdDIEFyelS4
	DxYQ==
X-Gm-Message-State: AMCzsaVCzMpkVfwnwPcxRzFKaZz1vy/jlhS/0m78eBU+jznh2BGSQC4D
	X/FsLN5G7aHMKXNB6PmrdAo7EA==
X-Received: by 10.84.131.1 with SMTP id 1mr529204pld.120.1508898556666;
	Tue, 24 Oct 2017 19:29:16 -0700 (PDT)
Received: from localhost.localdomain ([183.82.194.3])
	by smtp.gmail.com with ESMTPSA id
	x4sm2326142pfx.124.2017.10.24.19.29.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Oct 2017 19:29:16 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 25 Oct 2017 07:59:04 +0530
Message-Id: <1508898544-10307-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [Qemu devel V4 PATCH] msf2: Remove dead code reported by
 Coverity
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, alistair23@gmail.com,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	darren.kenny@oracle.com, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j7077DpAgqwQ

Fixed incorrect frame size mask, validated maximum frame
size in spi_write and removed dead code.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
v4:
	changed %d to %u while logging frame size error.
v3:
	Added comment that [31:6] bits are reserved in R_SPI_DFSIZE
	register and logged incorrect value too in guest error(suggested
	by Darren).
v2:
	else if -> else in set_fifodepth
	log guest error when frame size is more than 32

 hw/ssi/mss-spi.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
index 5a8e308..d60daba 100644
--- a/hw/ssi/mss-spi.c
+++ b/hw/ssi/mss-spi.c
@@ -76,9 +76,10 @@
 #define C_BIGFIFO            (1 << 29)
 #define C_RESET              (1 << 31)
 
-#define FRAMESZ_MASK         0x1F
+#define FRAMESZ_MASK         0x3F
 #define FMCOUNT_MASK         0x00FFFF00
 #define FMCOUNT_SHIFT        8
+#define FRAMESZ_MAX          32
 
 static void txfifo_reset(MSSSpiState *s)
 {
@@ -104,10 +105,8 @@ static void set_fifodepth(MSSSpiState *s)
         s->fifo_depth = 32;
     } else if (size <= 16) {
         s->fifo_depth = 16;
-    } else if (size <= 32) {
-        s->fifo_depth = 8;
     } else {
-        s->fifo_depth = 4;
+        s->fifo_depth = 8;
     }
 }
 
@@ -301,6 +300,17 @@ static void spi_write(void *opaque, hwaddr addr,
         if (s->enabled) {
             break;
         }
+        /*
+         * [31:6] bits are reserved bits and for future use.
+         * [5:0] are for frame size. Only [5:0] bits are validated
+         * during write, [31:6] bits are untouched.
+         */
+        if ((value & FRAMESZ_MASK) > FRAMESZ_MAX) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Incorrect size %u provided."
+                         "Maximum frame size is %u\n",
+                         __func__, value & FRAMESZ_MASK, FRAMESZ_MAX);
+            break;
+        }
         s->regs[R_SPI_DFSIZE] = value;
         break;
 
-- 
2.5.0


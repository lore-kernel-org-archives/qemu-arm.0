Received: by 10.223.197.9 with SMTP id q9csp9693318wrf;
        Sun, 22 Oct 2017 07:01:04 -0700 (PDT)
X-Received: by 10.200.43.252 with SMTP id n57mr15434320qtn.141.1508680864504;
        Sun, 22 Oct 2017 07:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508680864; cv=none;
        d=google.com; s=arc-20160816;
        b=ZazzWEcZFxLnjGu7Fd5OdYRPP8JNty78zBcHOXy7umea4Hr/lF+VHSQOjGuf68hoTp
         3SpLW8TMa90Tj5U9uMaEpgQ0K+KP3jVm4T9kZLNleZ7lMEjgdOtk8z8xV7nldUDVaRMb
         x+LsY1QzzOgG94cvXsojyvg9TWCzt7zs4517XWcN/i/ycI1QVGUVh77zilT+5D0bI6w9
         pF/VlsT53pMgbRsIHvcIILd+ixpsq0BTnEcXKkIINQ6hnaDQBJWxMzaEm7bF3kmLfE2P
         4WdWaApidXVH7FUjJu4L3IrKEhfCnWMYagBN7l//0cka25Ty2Phkc4Z1lO0EpJkZlzRh
         bUwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=8cPop0IAYaRSzCmskltmb0oaTPzGwMod+kzjOI2nlrs=;
        b=HYd0ycp+q9TFJqZjbiZC27skaRhQhKiDIrto0+lsvSnrXFYeZdOeyRzZwAd5J9D24n
         5TUeMZf/EC0ZPoOtvBOVxbHyU9t5o8Tk4mMQX+sP4n1sfxY1H0ee1sXWJl4bjcrpa0RQ
         Af+k/ynnYIqJyekX+KRb7J823DTFKEkE2KUiIslpyNbpwJFpFsFy9RusmcnGKtuTAC4i
         UGxb7zSGCnfWvBOuscCZ0BT3VZqZDbW9ipkyNKRO35Ls9DHk8/ybh5MVUv505Q4r0CN8
         6wocE9AR9eyM3Mabht4B08LLtPSinZ6qmJgsGEpI0wVr1WL1FofALUzW9Jj9yJQGMgnd
         dw+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f7Z2v/vr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q26si3388619qtb.126.2017.10.22.07.01.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 Oct 2017 07:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f7Z2v/vr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32955 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6GoI-0005Jh-8v
	for alex.bennee@linaro.org; Sun, 22 Oct 2017 10:01:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e6Go8-0005I2-1U
	for qemu-arm@nongnu.org; Sun, 22 Oct 2017 10:00:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e6Go7-0002bn-C7
	for qemu-arm@nongnu.org; Sun, 22 Oct 2017 10:00:52 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:55155)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1e6Go2-0002ac-Vl; Sun, 22 Oct 2017 10:00:47 -0400
Received: by mail-pf0-x244.google.com with SMTP id n89so15236928pfk.11;
	Sun, 22 Oct 2017 07:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8cPop0IAYaRSzCmskltmb0oaTPzGwMod+kzjOI2nlrs=;
	b=f7Z2v/vrATyY54x6OzgG98ogyKj0yd6Y+bmBzqCjrxMVZqfnc98CVnnUPsSLwNywCQ
	mNibZYCqUtAPf3hbVNLIK/kqnlHwryM3u+8dVB5On3mxRz83wUwhJE52SRWnIad2s/gP
	t+zvXnAEqssUTwzwGQOhmOjXd3rezifABxtRwJikw4RJUDc/rkZ3Fznc8V7121ugNbG1
	/RD+np4PHwzTC/ArR6znBrGfRAU45N7HKYCp9xsPulSkNKU/T9Y3Z2ql7c6YWf28jdNA
	L5LyKOgq53RI6OMwxM1WS7+SEXI1vli7aRNDSoXoQILE285g+BzIFRsRRwpTMBHzC8VB
	OFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8cPop0IAYaRSzCmskltmb0oaTPzGwMod+kzjOI2nlrs=;
	b=QnU7ogUWBwifXmo3TT+YUehcm0PS4iKxWCLzz9i7XrixLuqnDtbcrV7IUPSmyFMNoc
	OJfM6SFnUrXVW4SmMaqAU+Bp6dwnDzF47DXc6D0926xungFHjhdlZD52xsgdELoaL5T5
	YKliHbsWgkYL00GD3oBwBBf+m6d6Xsu51TnHahR3XQCOHCi17HPq3BUqq+M3J5wu12Hd
	sHBqtRCeF/sEleWFaS+7fJAWXk8LjcR2+5gYLxstvIh3xDWsb7K/dCMk07+UoKjvNx86
	HPvWY4me6O2wguClT1S80+HGOJFbNratzxOyPeEfmSkbTO9eWY6705mtQyZr5p+Qapq/
	JxkA==
X-Gm-Message-State: AMCzsaU7hK9DwR8Ofvj4/CpF5PTqHwq4bsDk8YioZ097yBiqosnXjsKP
	SggJLaFYSeVG05j1hORoI/IgLA==
X-Google-Smtp-Source: ABhQp+SEJoIPQ/beHt9IbTYbfMB9XKCopgd7fEFSX/3fSMvQIBiTp/XYW3hEOWHJfT05sXe5vByXnQ==
X-Received: by 10.98.80.21 with SMTP id e21mr10278913pfb.208.1508678896542;
	Sun, 22 Oct 2017 06:28:16 -0700 (PDT)
Received: from localhost.localdomain ([183.82.194.3])
	by smtp.gmail.com with ESMTPSA id q2sm7117171pgp.81.2017.10.22.06.28.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 22 Oct 2017 06:28:15 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sun, 22 Oct 2017 18:58:02 +0530
Message-Id: <1508678882-4327-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [Qemu devel v3 PATCH] msf2: Remove dead code reported by
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
X-TUID: 2m6UlsuM/cIx

Fixed incorrect frame size mask, validated maximum frame
size in spi_write and removed dead code.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
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
index 5a8e308..e1b6227 100644
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
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Incorrect size %d provided."
+                         "Maximum frame size is %d\n",
+                         __func__, value & FRAMESZ_MASK, FRAMESZ_MAX);
+            break;
+        }
         s->regs[R_SPI_DFSIZE] = value;
         break;
 
-- 
2.5.0


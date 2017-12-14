Received: by 10.223.159.74 with SMTP id f10csp6410330wrg;
        Thu, 14 Dec 2017 06:57:38 -0800 (PST)
X-Google-Smtp-Source: ACJfBot/uwH3IwsDTrnJlR5T1WxwW7XVCXQtQTTQCikC9SfKMivLcPkhWQX567+KbfwFjElHJOm6
X-Received: by 10.129.107.139 with SMTP id g133mr4472260ywc.512.1513263458047;
        Thu, 14 Dec 2017 06:57:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513263458; cv=none;
        d=google.com; s=arc-20160816;
        b=B4XS5Xsb2E2DJQ8RL9+P4SkhHIcUBRHglvLCOBvrq/IFMOLqXkwjdeaCuEn7xY7k49
         AzF/FMw63Znvo5fY/mbEkay8RG6UGs7NA/jDXd7lHX2xmndKlKdrqR2kan6HqD5tKCsr
         nCfCaUS4lXeYa3Ne05qlNw95TmUNcThkLF9H5pZ1Z0NTJOnMIaQcyhw+xxUykyMlQ7F3
         0LiphJ24mgwdgpiQTFuF08B5gzq8EgZ9vxTKYkUfnFrzlUDIMZkqWR8rOVfyoSbRHxhF
         XdipSzaFuxqtyF5jpwuq8dftc+b0rCt7xGdLNJdz0QG8agcQFyMDdum2lH+CIDY3Yfhy
         xzWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Q/p6xPc86L3+l6gZYYE2RbnwLFyAMnE8fAGCcar+YBw=;
        b=CORLjOQakm5tYl1o8QaLSX2eDTgTygehjX22l0+H66usXICZLQbMGGZMpKUEbwB4Oi
         YTOyAFJ03i4qZR4iKgRkcc0CPc8lOzsgdd2vijzu3CO2IkCz/hDmR8GFid9j68MyPdfU
         ufoLh95PsElGo8CoS/z5ejCnXkibEQ/Ve+PR8V0ceFXX0pE95DsR1/Vkklx+YPrwYwYO
         LY/0giT8kwn1ScFX/LgyrgJfhnuRn0McLQlAN+f3Ak2//FGEyDks4xzjL7V7jglLw3AF
         SjGkyuJ0t2BcC9m5A6D+ywLQfieE5L+GYjJDEWoqtxQLY1HbxnAkpLI0K46+1ezeQk3v
         t4oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vOjUKsk8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g8si885656ybj.827.2017.12.14.06.57.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:57:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vOjUKsk8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePUx7-0004hm-FR
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:57:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUtJ-0001c9-PD
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUtH-0000mp-Mk
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:41 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:33437)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUtH-0000la-F1; Thu, 14 Dec 2017 09:53:39 -0500
Received: by mail-pg0-x241.google.com with SMTP id g7so3565067pgs.0;
	Thu, 14 Dec 2017 06:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Q/p6xPc86L3+l6gZYYE2RbnwLFyAMnE8fAGCcar+YBw=;
	b=vOjUKsk8MrgUZ2SXsJIwnoaHVDzwOqKYt7/Hx91JLDWHEw/4aBFy4pIS+IUsNWOnE9
	/lVrprk0RRkyq225Cwz8BaAX82h7fryMly/U1oDF9cDK4iPOYJXKTid0jMphKZNa0lum
	GuC9F0v4kTRvZFAlKj7dmwpVJ6Qr3ZXJ/puCUmjNkXJ4UjDq2pafoftJs1iKIoy0pqhJ
	RBsrmwrqNpVdI0DXfSnyczLLmTzwBY7osmWS1iJwycXSaxQK1nWl8xOlJHY3yc3HbFNG
	xKgGJvLDrGIZI8OMKk4IwBgyb7pVL9jW0scobLia05Qw7XBNlFoLNZPD2Vx0C8r80qBJ
	ceWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Q/p6xPc86L3+l6gZYYE2RbnwLFyAMnE8fAGCcar+YBw=;
	b=oppqq3mz+ZUjMml/EjGBd5FTfI9iwD7HwrLHghGZ4gIqvpH/hCounFSwPUCAqTUGav
	JHmFnzq/cfFO1o22GpP8kfWS2o7YFE+FTgL3HchaXw2KWdIfM19GT92Jc2J2O/XKjoAY
	sDcqaJQFfUuI4YLssjkkxwZ62pn4lC7mX3BzUjUalEGMp874W/FIK1LMbb0j9QqOABaq
	xyIlvf4gsO+ctDQZ17rxvaXud5WoSPzONib/IAPe6oTRAhXXQ9MvcWReOmk0eKUTeBvQ
	CHNvQEZ4Q+JwHUVuy99nca1grHfiH7UDcGuSn6D3Krud9XfeFTmcq8YL+AT3Y7fp+WXF
	iquA==
X-Gm-Message-State: AKGB3mJnWrstTmYX1C+BB4eMpZaGFqfz7VTavZFynoq+GWLiD6Bprt3E
	4ask6coXeD8k1GWvVURlzxVHvwty
X-Received: by 10.98.166.148 with SMTP id r20mr9776838pfl.80.1513263218183;
	Thu, 14 Dec 2017 06:53:38 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id e7sm8757439pfj.44.2017.12.14.06.53.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 06:53:37 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Thu, 14 Dec 2017 06:52:54 -0800
Message-Id: <20171214145255.31545-15-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171214145255.31545-1-andrew.smirnov@gmail.com>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v2 14/15] sd: Check for READ_MULTIPLE_BLOCK size
 limit violation first
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
X-TUID: K3nSUWJh2gs3

Check for READ_MULTIPLE_BLOCK size limit violation first as opposed to
doing at the end of the command handler. Consider the following
scenario:

Emulated host driver is trying to read last byte of the last sector
via CMD18/ADMA, so what would happen is the following:

1. "ret" is filled with desired byte and "sd->data_offset" is
   incremented to 512 by

	    ret = sd->data[sd->data_offset ++];

2. sd->data_offset >= io_len becomes true, so

            sd->data_start += io_len;

   moves "sd->data_start" past valid data boundaries.

3. as a result "sd->data_start + io_len > sd->size" check becomes true
   and sd->card_status is marked with ADDRESS_ERROR, telling emulated
   host that the last CMD18 read failed, despite nothing bad/illegal
   happening.

To avoid having this false positive, move out-of-bounds check to
happen before BLK_READ_BLOCK(), so this way it will only trigger if
illegal read is truly about to happen.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/sd/sd.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index ba47bff4db..ce4ef17be3 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1797,8 +1797,17 @@ uint8_t sd_read_data(SDState *sd)
         break;
 
     case 18:	/* CMD18:  READ_MULTIPLE_BLOCK */
-        if (sd->data_offset == 0)
+        if (sd->data_offset == 0) {
+            if (sd->data_start + io_len > sd->size) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "%s: Trying to read past card's capacity\n",
+                              __func__);
+                sd->card_status |= ADDRESS_ERROR;
+                return 0x00;
+            }
+
             BLK_READ_BLOCK(sd->data_start, io_len);
+        }
         ret = sd->data[sd->data_offset ++];
 
         if (sd->data_offset >= io_len) {
@@ -1812,11 +1821,6 @@ uint8_t sd_read_data(SDState *sd)
                     break;
                 }
             }
-
-            if (sd->data_start + io_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
-                break;
-            }
         }
         break;
 
-- 
2.14.3


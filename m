Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2306703wrq;
        Thu, 21 Jun 2018 11:05:30 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKv9is4yOECGNoQCx1M2YdG8yn7yfy4XMxapeCWSIOlqPv5AaiO8vsGabYv65ra3K+OZ8ai
X-Received: by 2002:aed:3766:: with SMTP id i93-v6mr24699602qtb.277.1529604330500;
        Thu, 21 Jun 2018 11:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529604330; cv=none;
        d=google.com; s=arc-20160816;
        b=Hkwi5h7ABtaof4CnXl+yrF4ajittdtce5feS/N6mRMTBkt7YRDg2yyaDhWYjb5SlDj
         tEqmJqvGO8sxJ8UKn1k5xt2bqHH98pCSq/fQAtQ9nVC+qxpN1bLciE8Q6wAVappjyLFZ
         E4wH4u35Xv8iFHPPJ6amD+K328LeRF+9gzkrBFqjTfS6XsjyTaCKK8gH8kuC5HH1e+zM
         OsKF1HlPAYb8S0gIXinlPti0iFPQ8naJBBYhPnn0SziKa5S2XWqQ9kHReH+El+i+nQVY
         +YBKod8/WpNzzpBUyEsa4E9LWteQq2wNDGccJqEq1ODsvmofied93Gi6VFnvgMa5kTSb
         JBIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=5wFXK/Bo0FmCAyfAQjAU8aog0F/qXtyqX/hHJsEafOw=;
        b=QkxzNDei1jL8CvecUE9SPwJcz4Iwi6tgS0X9FW8IngnRK6vCJFvwh0ViO/IGLF7moA
         kLE97xQI4JhRXStnHBmbnPeLbCqimiI4py/+LG6O/No9S0OtRVZEXz1G8WCKLlXRURv7
         uCjj/0B9H1+9cfv21y7ZDcOsAMeRSUekQ6On+G92vUyWwE6sf1iJB1IQ2Gt6/bFa+1jX
         jAxEDCE/p8pn2hc0BbouGj3t54rEwSPAjpp1vnBoHlmKcao20WFR59GwkWp8LUWsa04j
         r/KVHLmhEHtRmjWGRWzD1PWAuIzt4tbWrbfXmT7z69tswEvbGndozqwwrMNKHAXVXV4M
         MSow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Upqi53/+";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r62-v6si1504094qkd.14.2018.06.21.11.05.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 11:05:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Upqi53/+";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fW3xa-0001pM-20
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 14:05:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v2-0000ZA-6V
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 14:02:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v1-0006WM-Fq
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 14:02:52 -0400
Received: from mail-qk0-x232.google.com ([2607:f8b0:400d:c09::232]:37057)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v1-0006W6-BX; Thu, 21 Jun 2018 14:02:51 -0400
Received: by mail-qk0-x232.google.com with SMTP id j12-v6so2259641qkk.4;
	Thu, 21 Jun 2018 11:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5wFXK/Bo0FmCAyfAQjAU8aog0F/qXtyqX/hHJsEafOw=;
	b=Upqi53/+8AiYAVAxebGqwb1y9gKf+dgkSBBtqpWqsYLv5GyZX9uC3hUr0G2WPihaM6
	y2DTEvPkGdgJjW+B7lSz970umH67goRpUv9foaJMNH1imLNyYRb9b0F5+UVJVBY+9/CR
	iDW+R2OSbMd7leGKiREbVioADZH12EpbkkcGjtFUaY7GOHs0n8elpxxVh1CHi263/Ifz
	n0TRPQnyoXu7doSz6jXsbfkb/QOIe+9Jk51BLH48VJTj7xhc8drxUutixuqdcx7v18gs
	ilvXgGSx4ryHH3hlIJueYspa0PKEs0WFLCs8DeGM1WFfcGpgDDmL0qDz9v41wqdwQoMu
	HrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=5wFXK/Bo0FmCAyfAQjAU8aog0F/qXtyqX/hHJsEafOw=;
	b=FlWNMmoIu0/WL6MapkbCLHuH/PBK4EqiLJphiNtuP+DNicB03kse4sjfwFd9gvl9rf
	8vyvyYt+fze9bf5kIxCmU27qZdaDOymh3ZFmKOE++41FoK2ZlvWholxhiUGu/+81ONUY
	da5d+hITFZzikafqjnr0x3zKtfuMUh51KVkR9ZfcVkWqJfqmAFFPv+Q641wXKmjwRmA6
	PNIRFuuMFNGDNPJPR9Y0zs2I0mfnafPwuiJzLCTb4LYqvQn+Ngf387lj9oJy9L2mNbml
	1FtDVEabmllQsdQMZ0Hi6r71zKUH4NgUPfhxQ5KUREdwARTfwrOzO8/8gcEv1NCPJRG3
	i1SQ==
X-Gm-Message-State: APt69E0Prkz4b1d0pdNRe9AcUeL7vEZV0RVOiBKlKFz3jNu7gOqsZjyE
	6N/s/OO3X4RipXSpGEHVFaU=
X-Received: by 2002:a37:1f08:: with SMTP id
	f8-v6mr22409913qkf.304.1529604170527; 
	Thu, 21 Jun 2018 11:02:50 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:02:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jun 2018 15:02:18 -0300
Message-Id: <20180621180224.8312-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::232
Subject: [Qemu-devel] [PATCH 05/11] hw/ssi/omap_spi: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-trivial@nongnu.org,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kYSp7ytNMQMU

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/omap_spi.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c
index 34163e5646..f278a55160 100644
--- a/hw/ssi/omap_spi.c
+++ b/hw/ssi/omap_spi.c
@@ -20,6 +20,7 @@
  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "hw/arm/omap.h"
 
@@ -294,11 +295,15 @@ static void omap_mcspi_write(void *opaque, hwaddr addr,
     case 0x2c:	/* MCSPI_CHCONF */
         if ((value ^ s->ch[ch].config) & (3 << 14))	/* DMAR | DMAW */
             omap_mcspi_dmarequest_update(s->ch + ch);
-        if (((value >> 12) & 3) == 3)			/* TRM */
-            fprintf(stderr, "%s: invalid TRM value (3)\n", __func__);
-        if (((value >> 7) & 0x1f) < 3)			/* WL */
-            fprintf(stderr, "%s: invalid WL value (%" PRIx64 ")\n",
-                            __func__, (value >> 7) & 0x1f);
+        if (((value >> 12) & 3) == 3) { /* TRM */
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid TRM value (3)\n",
+                          __func__);
+        }
+        if (((value >> 7) & 0x1f) < 3) { /* WL */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid WL value (%" PRIx64 ")\n",
+                          __func__, (value >> 7) & 0x1f);
+        }
         s->ch[ch].config = value & 0x7fffff;
         break;
 
-- 
2.18.0.rc2


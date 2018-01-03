Received: by 10.223.134.117 with SMTP id 50csp12452821wrw;
        Wed, 3 Jan 2018 14:42:45 -0800 (PST)
X-Google-Smtp-Source: ACJfBou1MMmbILiptqyc3LCNaWOrjkUCTjA6FOuB44zcAreqP74Ndpftnt4DHFX8f0GdRG+gUIbr
X-Received: by 10.37.45.3 with SMTP id t3mr2689960ybt.143.1515019365846;
        Wed, 03 Jan 2018 14:42:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515019365; cv=none;
        d=google.com; s=arc-20160816;
        b=dT002XJ9b7QTa5GnHsYOR6w/MKtCNGHpDapSojiTg03DmpcdR89UAHGt/ma/pWoL2c
         05+TnYRuYC8au8v0bNc+vNLQW8ZUGls1nvChlCBMolO1BzSDh0Ov7a9C+/YtcCaP1SlJ
         44P4M0Hu6Rdvgd78UXjdNBMkJM47ZFYECZ3n5A5f/z/R2oJA+PwNkNwDoWOQjnzRcbs+
         y7z0cRZwvoSzeGwCw4bWaz2rTJM9theUZe6sYaSUvCKaNWKjdVwEhuayxlxrit372weA
         nJCOYrDOnL3gRrh0PQsyBCSrp95HSjB4FXS1abpSVZsclc2I6b0vqYGU02Uu7GfnAP7j
         DYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ZJq1D+6X52CnnyC1bfI/X/6oJwh8LSIHrDElxC0RtR0=;
        b=DaBG3XpBME6Zqc5k4JJ+NKeb9YU8PkSGoAgWhEQEMeckUFb8fQ3dwukCLRqmnaYD8C
         qJsBgKfKk9zYUruPe8GqrlHS0TyRk56ft3UIiN/6wj0UUxHBr/STW7MQRh6G0zdOYfsY
         ZaNaftZ4qkoA2HnH9OxAnONtGhcImenNaeBvasLLsOK06u4FuU2XgERlBlm39wX1jrXG
         zn4Ogc4jPianxa0b3VH9JHAWIiVfArf2fo25DiBlLZvDSjeEF2GBxCIthJdrLkn3afuP
         TEiJNHLxkP95+5QE10E3jzkmmTMbGNc80FkR/FHDIXl0YaL6rejzLAmkQAs7F4x/unEn
         X2kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f1hke0B/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2si416893ybp.268.2018.01.03.14.42.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 14:42:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f1hke0B/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWrkD-0005FJ-9t
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 17:42:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWrjm-0005E3-Ed
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 17:42:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWrjl-0002Ji-Lm
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 17:42:18 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:38070)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWrjl-0002JI-Hy; Wed, 03 Jan 2018 17:42:17 -0500
Received: by mail-qk0-x244.google.com with SMTP id l19so3470775qke.5;
	Wed, 03 Jan 2018 14:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZJq1D+6X52CnnyC1bfI/X/6oJwh8LSIHrDElxC0RtR0=;
	b=f1hke0B/e9zYirnhNQooO/EibY332z7emEpBOEsdImd2vpNgRjh8FWKnz+Dij0o14v
	2Ffsri+xe8wKSBRIO8zrFjYQey4UcFqMKHycM3bw7F0RLoveLuhrLLHvSQGaHevE+1Jz
	nQ82NUw/a7z3IBkJPYakY7+M1PHM6zpYzaGcy717vJ983FtVZbfLI+FzZv8OQqAWGOOE
	BaKrcKJ3U+mzp+XL5crGBeF2pn+RV+fmNB2/v8jvSlzBJtM7lIl2HbEDh7eWrJicXWth
	gKjh/hNhvV6IgktwjehtVKgv1TuIeJNfZQugdU4ymMfYMKuFGItl/ntJmtod1+sr7s6x
	KexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ZJq1D+6X52CnnyC1bfI/X/6oJwh8LSIHrDElxC0RtR0=;
	b=V4utluxs1cL250/KR4mZy+MEm2fqIq/p2lGQit+ra3SoaYWGffbNTp4fk8zUEN+YNS
	SLTtyQu8YemZrwcdETC5fUBUF4KCK0G01oZ7qWiRvvVV/Egb4UCcBxSeZe77mG1pQsmG
	bgc2HytnSiQMIVnEo+OLCH2UTPb6CmhGcqInGOXaes+y73F1t790MryfrAGiAcXpGLYq
	24AalyJ8UUw66qTpmiBs72xb2r6j7zqHx2wKGWLNJb2WN40gmMwfTp1G083FmuOsU6/0
	42ymaSbpukO/qXyAxZ0cStdpQmUxHy1ZkaUettlS1pNsPGPt9DTqEVwK16X8l/lXQlbP
	s4zQ==
X-Gm-Message-State: AKGB3mLgSFg3x27CG0wDXH022/0OkJU8LhHKxyPpqDtfAhPA0fXSmhzv
	6QEKztrbubnwD4MAAh29lYs=
X-Received: by 10.55.4.130 with SMTP id 124mr3549257qke.330.1515019336992;
	Wed, 03 Jan 2018 14:42:16 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	f13sm1325127qke.47.2018.01.03.14.42.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 14:42:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>
Date: Wed,  3 Jan 2018 19:42:07 -0300
Message-Id: <20180103224208.30291-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180103224208.30291-1-f4bug@amsat.org>
References: <20180103224208.30291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH v2 1/2] hw/timer/pxa2xx_timer: replace
 hw_error() -> qemu_log_mask()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0QGz/UKpEHQS

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/timer/pxa2xx_timer.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index 68ba5a70b3..a489bf5159 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -13,6 +13,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/arm/pxa.h"
 #include "hw/sysbus.h"
+#include "qemu/log.h"
 
 #define OSMR0	0x00
 #define OSMR1	0x04
@@ -252,8 +253,14 @@ static uint64_t pxa2xx_timer_read(void *opaque, hwaddr offset,
     case OSNR:
         return s->snapshot;
     default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: unknown register 0x%02" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
     badreg:
-        hw_error("pxa2xx_timer_read: Bad offset " REG_FMT "\n", offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: incorrect register 0x%02" HWADDR_PRIx "\n",
+                      __func__, offset);
     }
 
     return 0;
@@ -377,8 +384,14 @@ static void pxa2xx_timer_write(void *opaque, hwaddr offset,
         }
         break;
     default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: unknown register 0x%02" HWADDR_PRIx " "
+                      "(value 0x%08" PRIx64 ")\n",  __func__, offset, value);
+        break;
     badreg:
-        hw_error("pxa2xx_timer_write: Bad offset " REG_FMT "\n", offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: incorrect register 0x%02" HWADDR_PRIx " "
+                      "(value 0x%08" PRIx64 ")\n", __func__, offset, value);
     }
 }
 
-- 
2.15.1


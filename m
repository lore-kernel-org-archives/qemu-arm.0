Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2404890wrq;
        Thu, 7 Jun 2018 11:07:39 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKALraw0xR/qKfV/vuUyRuGSDOdRtW/H3qSLLeDboW6etjQiPag/O7KX185hWWcywNM+QwK
X-Received: by 2002:a37:9e89:: with SMTP id h131-v6mr2375204qke.269.1528394859083;
        Thu, 07 Jun 2018 11:07:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528394859; cv=none;
        d=google.com; s=arc-20160816;
        b=ldZQ8xzOUXtTMHvNx1/OHl3dX7JiGlOjRKZvNQ6sd/mYYa6pwE6DOOrYWmuAnUA7YT
         OXPw09rNJYSVd+HcgFYp+I1HlpJX1UGJFBaUoR9UTHxtsbDg2/xoSJh7ogT+PxZY1dYQ
         Sj7OWcxd8Jo84RupDeJ/Kf+gTcQszSWt+Y5Usq3Dk8E6hAC3qbZKb2JSOyByFtJPfVQi
         Aibg8PhHIzr78plWQd0mpONnDTIUSLraPDvQ+IHNj7gwOmD6eVVKtw4oZVfTRjppQe7i
         1ilZuyLytti3YBuP5gjI7ZI4pXgPY8K2DtwP4OcNP8z7YnvQgDeZaJeIpEn/d5kH9sGd
         Ix1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=aR0TzY61TBen/2Yts4FTsgJ7yooXG4cIjBrvhGHVywY=;
        b=bYPnWmzDKZH9AyIEFEka4fwoJooTKXwpZ0yzeggi5+JA7UZbxEu1Iex6x15S2T769C
         b+V+M/T2tyPR8iSRdQW2qct0ai0KWNEdvYjyVKf+BdfPx0ArFeyUey+MZJQR+DAJo2vq
         nbySUogd6LCjMuHwQtkeE/mUZPncEcmb+XXXrwvRApXy8A6+Jm456wyYGi2u+VzZfikz
         oofKkyFpYZTWRxthL9FsrZ86lzK+xXMaCG2SapiwbaJzXhid6CUMWehSgS8uHOI+r4sN
         mZ8gJDUiCgi9P5HOlu5BFLcqIXIBN7mEX7ERPQZcVIykeQpOEQH9EhyPHLeO0NK/Jd9i
         Sojw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qT8IJyGA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l14-v6si15239672qvh.195.2018.06.07.11.07.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 11:07:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qT8IJyGA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQzJy-00027B-Gk
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 14:07:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJO-00023g-Nh
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 14:07:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJL-0004Q5-Hr
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 14:07:02 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38896)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJL-0004Pg-DB; Thu, 07 Jun 2018 14:06:59 -0400
Received: by mail-qt0-x242.google.com with SMTP id x34-v6so10792330qtk.5;
	Thu, 07 Jun 2018 11:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aR0TzY61TBen/2Yts4FTsgJ7yooXG4cIjBrvhGHVywY=;
	b=qT8IJyGAXz9+TOQuEXjuRs0dcBpzef1Cf4l2fCM70an2NS1Q2LD4fUuub/NnlV1+Go
	G5Q/FVpZAm57PzcOb5jcHnxSKB0+baxIk2ylh1HQ9VzwKjkyNrD3vIwgzSOoKgnHw4c1
	Uvt3cAPiBQf5Pd/5uZi8MaodQaej/37BT/HM9Ykmem6leL8wsCj4ivXi/oxcym/R+LaB
	lo6ndbYVusEjny2yUGb+GTXFxzpCUQbmFL17gqnDOHA9MTEj3i9ptzzS0IFfG1BTQ7U0
	ioLOlj8L6S++I7vF8O3dgHSPg+FXZQeH1Q2//BvkYa/uU2dW4nyt42WLv5hwOWR+M9aM
	J3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=aR0TzY61TBen/2Yts4FTsgJ7yooXG4cIjBrvhGHVywY=;
	b=mpseXGQWXcPnHsiYLgkPUMDfc5pwf6DK//rBpPxJPGGNu4bx4zUjAvWVikjO791XbK
	Uannkz3/jvgF/bACxcNBRWU1SXjPnvdTPAEYVvztOoFr41M1fpR0vNgFxt/r9WgQchXw
	bOl3zlIv68tsYJkEnCU6pFQBBdQIOAi5RXwQOrRMVeif8pdOwSnByHOjUAGRI4NimAqf
	fqOy2cp4liXFkShWlnbqT8e3llW3xkSGN4+Jm4xaaXi4PBXOUH901fC0pzR5LvxVA/97
	73r1Wq1UZzvmxNR1qhrT9A48wN40mLKmpMQxfpJJ6gRXUsOn3MasG7adPMDBnCamUGyu
	TONA==
X-Gm-Message-State: APt69E3PLyDzHsYzhnJ/BguVDxnUh6CNr6AQl0MTwgE8MU2NL7BzR/hL
	S9huOb6XO+x8addNwSuWFYc=
X-Received: by 2002:ac8:2a46:: with SMTP id
	l6-v6mr2923606qtl.118.1528394818885; 
	Thu, 07 Jun 2018 11:06:58 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s15-v6sm26838414qtc.81.2018.06.07.11.06.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 11:06:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  7 Jun 2018 15:06:37 -0300
Message-Id: <20180607180641.874-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180607180641.874-1-f4bug@amsat.org>
References: <20180607180641.874-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v2 3/7] sdcard: Add a 'spec_version' property,
 default to Spec v2.00
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8nKCuBn4to7/

As of this commit, the Spec v1 is not working, and all controllers
expect the cards to be conformant to Spec v2.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/sd/sd.h |  5 +++++
 hw/sd/sd.c         | 23 ++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 9bdb3c9285..7c6ad3c8f1 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -54,6 +54,11 @@
 #define APP_CMD			(1 << 5)
 #define AKE_SEQ_ERROR		(1 << 3)
 
+enum SDPhySpecificationVersion {
+    SD_PHY_SPECv1_10_VERS     = 1,
+    SD_PHY_SPECv2_00_VERS     = 2,
+};
+
 typedef enum {
     SD_VOLTAGE_0_4V     = 400,  /* currently not supported */
     SD_VOLTAGE_1_8V     = 1800,
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 80e70dd93e..1ae085de69 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1,9 +1,10 @@
 /*
  * SD Memory Card emulation as defined in the "SD Memory Card Physical
- * layer specification, Version 1.10."
+ * layer specification, Version 2.00."
  *
  * Copyright (c) 2006 Andrzej Zaborowski  <balrog@zabor.org>
  * Copyright (c) 2007 CodeSourcery
+ * Copyright (c) 2018 Philippe Mathieu-Daudé <f4bug@amsat.org>
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions
@@ -91,6 +92,7 @@ struct SDState {
     uint8_t sd_status[64];
 
     /* Configurable properties */
+    uint8_t spec_version;
     BlockBackend *blk;
     bool spi;
 
@@ -310,8 +312,12 @@ static void sd_ocr_powerup(void *opaque)
 
 static void sd_set_scr(SDState *sd)
 {
-    sd->scr[0] = (0 << 4)       /* SCR structure version 1.0 */
-                 | 1;           /* Spec Version 1.10 */
+    sd->scr[0] = 0 << 4;        /* SCR structure version 1.0 */
+    if (sd->spec_version == SD_PHY_SPECv1_10_VERS) {
+        sd->scr[0] |= 1;        /* Spec Version 1.10 */
+    } else {
+        sd->scr[0] |= 2;        /* Spec Version 2.00 */
+    }
     sd->scr[1] = (2 << 4)       /* SDSC Card (Security Version 1.01) */
                  | 0b0101;      /* 1-bit or 4-bit width bus modes */
     sd->scr[2] = 0x00;          /* Extended Security is not supported. */
@@ -2058,6 +2064,15 @@ static void sd_realize(DeviceState *dev, Error **errp)
 
     sd->proto_name = sd->spi ? "SPI" : "SD";
 
+    switch (sd->spec_version) {
+    case SD_PHY_SPECv1_10_VERS
+     ... SD_PHY_SPECv2_00_VERS:
+        break;
+    default:
+        error_setg(errp, "Invalid SD card Spec version: %u", sd->spec_version);
+        return;
+    }
+
     if (sd->blk && blk_is_read_only(sd->blk)) {
         error_setg(errp, "Cannot use read-only drive as SD card");
         return;
@@ -2074,6 +2089,8 @@ static void sd_realize(DeviceState *dev, Error **errp)
 }
 
 static Property sd_properties[] = {
+    DEFINE_PROP_UINT8("spec_version", SDState,
+                      spec_version, SD_PHY_SPECv2_00_VERS),
     DEFINE_PROP_DRIVE("drive", SDState, blk),
     /* We do not model the chip select pin, so allow the board to select
      * whether card should be in SSI or MMC/SD mode.  It is also up to the
-- 
2.17.1


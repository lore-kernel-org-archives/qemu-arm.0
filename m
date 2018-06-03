Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2140508wre;
        Sat, 2 Jun 2018 17:14:43 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJePfB8fmYlN62MjNXnjCDVids/anRh/4AU0K7FdxMLr2yB4GnFqoWXzeFc4J9TuY/zIF+P
X-Received: by 2002:ac8:1798:: with SMTP id o24-v6mr16648533qtj.72.1527984883699;
        Sat, 02 Jun 2018 17:14:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527984883; cv=none;
        d=google.com; s=arc-20160816;
        b=el8nAgvS5acaf0q+fDfBXcGZrFpC3ABKHnC+v5lTZhOD/RBUwfBmBqkXWwoP2k6X6/
         AWRvFIMAh6K4hKmL5WJ0AlUcUBw53eIQ/MsCfmio9nv8WV2QFb3T3JfwB3FhqlJFw65u
         95BaWfjeMpoLba9AVbUzs6FCZDbbL2i4qHTNk88DXPU65wdLYBidICb1lN64IRBlPRIn
         unSwgFDBda1uLkR6a/GM2RTdy8A7euhpoCs0J0T14Sh9s4aj9tymrJQE//Ut4CZ7q05K
         zR2wLr9Py/o58yEiNvb3YiFpTQzGZPuqDarW9fQOsUq1NCsSx5EhjNESnrB4PEG4Hx++
         MmfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=HqxMyMutU5IjG39a5/VDAMgaCxZPQ4m2y4UZtXqHVEI=;
        b=iiNijI8UuL0kc/hgJxz5Jv8h/11wOE5a1n+y7IhN4+sroNlOhJi+nhFBUSXTaduQb9
         HsoU7LlcAsh/3gTnwZkkswbAzVwkPq/w0mKgh6r39QeOffLgH9e0qAr+JmyEht6XAlvl
         +l6+em5OqipVrIv1FtHx4d7JWYcGArQeDyJRDLnEhegrXFJ7IUj4lDvT0yUIFFfh96fH
         ZQLFsQfHqj1EeCvU+l8v5sZB68rzJigfFr/Evsj70P9PIMqWAicyqRfmGaVCMnnnqKTm
         8WiO9ONdsARe8ji8RT9SieqlT19HKfd4QuFrSEwc+QClV2S5jf2BKjSIwLTUGNt/GlOn
         GMbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G/TaAnHg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w66-v6si2357045qkb.343.2018.06.02.17.14.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jun 2018 17:14:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G/TaAnHg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33148 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPGfT-000865-6I
	for alex.bennee@linaro.org; Sat, 02 Jun 2018 20:14:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZl-0003s5-GX
	for qemu-devel@nongnu.org; Sat, 02 Jun 2018 20:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZk-0002w3-FM
	for qemu-devel@nongnu.org; Sat, 02 Jun 2018 20:08:49 -0400
Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e]:38730)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZk-0002vx-AK; Sat, 02 Jun 2018 20:08:48 -0400
Received: by mail-qt0-x22e.google.com with SMTP id x34-v6so23398247qtk.5;
	Sat, 02 Jun 2018 17:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HqxMyMutU5IjG39a5/VDAMgaCxZPQ4m2y4UZtXqHVEI=;
	b=G/TaAnHgIHDmWXbDrsRzVx5+doICs7fzljFOrFcw/B5J8vPbKS5/3qk/RZ6jwLqt41
	GXWHpBqzkGskvYOdA/CZQWR87VA/vx1fluuHhyQSsbuJE6uXWFzwWzSeBdZm2OXdPPDl
	Qa3P9PLLhu+6XIRu8eXCaxvi8IydiGFI9WLSGZPb4+gyVEL33uE67z8k5OMqVcscj/J5
	q6qQeLuR+l/Hgsi+N3qEjMIsspP6JUkDLgAERUBqUiXlhfEVkY3EPwbdmiapZU8pHhc+
	mSIMI0by/jdnhN4E38zxiif4ObegR5+HjMiQlXoi2oVtEgJkXt2Qm8rdqOxiKKYhQ9EH
	mXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=HqxMyMutU5IjG39a5/VDAMgaCxZPQ4m2y4UZtXqHVEI=;
	b=r1JpvebB9WrIKTGdWRBfGIZqIj7Pk7BFL2qi9tMRE2Sl8sdL+H3ocVFwYx9cL2Cyp9
	+n8ohioNzfo91u2/CXGFJF+Ch/Li+ddM36Ko2T89fwsFI9x641eiwwPB8EnAWn3yOsqM
	wsb1tHzT7Lw6IaRT3xhI79is5e1D3771roN4Kg9Oem/YtARGlcJ8mh6QfAi0MY9ONR6c
	CPChtnA71/C9qzXN93cEjZgdX7NT4EjV7bEzhO86zEp8mF2fF+M5DWtOF3t3wS3Lcizj
	Gex+YYgqnS8qnKcHw2pI/S5bfNClYwGUvP2W77IvQhrz+xdsjpQGT7Y2TvRqjgrlESDl
	CWDA==
X-Gm-Message-State: APt69E10Heom1JmplvzCvxhCPl9TCrnRraN+Wcrt0RYI49BrS+qWAycC
	dcAK2aRYc3VbMWt+C6NiXmg=
X-Received: by 2002:ac8:35d7:: with SMTP id
	l23-v6mr15175125qtb.241.1527984527841; 
	Sat, 02 Jun 2018 17:08:47 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	17-v6sm10610894qkg.97.2018.06.02.17.08.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 17:08:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sat,  2 Jun 2018 21:08:23 -0300
Message-Id: <20180603000827.30872-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180603000827.30872-1-f4bug@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22e
Subject: [Qemu-devel] [PATCH 4/8] sdcard: Set Spec v2.00 as default
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
X-TUID: qCXKQbY6Nm67

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sd.h |  1 +
 hw/sd/sd.c         | 13 +++++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 49f22b0b89..7c6ad3c8f1 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -56,6 +56,7 @@
 
 enum SDPhySpecificationVersion {
     SD_PHY_SPECv1_10_VERS     = 1,
+    SD_PHY_SPECv2_00_VERS     = 2,
 };
 
 typedef enum {
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 5ddd211114..81f178b36e 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -311,8 +311,12 @@ static void sd_ocr_powerup(void *opaque)
 
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
@@ -2060,7 +2064,8 @@ static void sd_realize(DeviceState *dev, Error **errp)
     sd->proto_name = sd->spi ? "SPI" : "SD";
 
     switch (sd->spec_version) {
-    case SD_PHY_SPECv1_10_VERS:
+    case SD_PHY_SPECv1_10_VERS
+     ... SD_PHY_SPECv2_00_VERS:
         break;
     default:
         error_setg(errp, "Invalid SD card Spec version: %u", sd->spec_version);
@@ -2084,7 +2089,7 @@ static void sd_realize(DeviceState *dev, Error **errp)
 
 static Property sd_properties[] = {
     DEFINE_PROP_UINT8("spec_version", SDState,
-                      spec_version, SD_PHY_SPECv1_10_VERS),
+                      spec_version, SD_PHY_SPECv2_00_VERS),
     DEFINE_PROP_DRIVE("drive", SDState, blk),
     /* We do not model the chip select pin, so allow the board to select
      * whether card should be in SSI or MMC/SD mode.  It is also up to the
-- 
2.17.1


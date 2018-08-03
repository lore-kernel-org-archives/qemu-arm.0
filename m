Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp157110wru;
        Fri, 3 Aug 2018 07:48:06 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcqGI+BC4i6w9VkAOgZUFaSQiO38JlyK1PIcU9pMFCy4VEZjx5aq7lLq+yAhoObPnnavk0l
X-Received: by 2002:a37:6301:: with SMTP id x1-v6mr3887104qkb.403.1533307686310;
        Fri, 03 Aug 2018 07:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533307686; cv=none;
        d=google.com; s=arc-20160816;
        b=f7udQMOW2+K7w/cJLHw4xYtOJdMtclbAijVq4Ww4Uw414Tmjocylw5DIF8FJLiggl9
         Lj3i27zLANcq+gf0leFuEfCpLPXlpmimrqC6ZqMkQdI5NfxuUPY8LCNuo0P2ugk8vwxF
         WhPx+hCsYtq0dg05pu+cPbGJ6SH6yqS+hcfb/4DDb/tHu9ZCORdcRmTiI+59EOGwNRf9
         A5M8jM4qu1+lMaKWW8RmqzmHl8cVAW0YLOZ6owNMMRYoZqCx9nOjxvQUrX8ynMqljMTs
         QGsTAWyPvO9cJ+ZZaiLWJmDIxseSNlWFLIJ0JNw7kEcmsDfYFU3TCIRrnHU/aduq+rKW
         iDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=TLK+LFjBLdHf8MKEjd8qAqTu5JyGfvw8CILoBZnb+Xo=;
        b=j0H7b9emLMv+KvtBg8iUYriJ200QN5uxTFZEXiDTmSGVxsSXdh4+V2XGKOMtAg7i2J
         bjcEoxz3BLuUaGLh/2pw+QubqlPgt5BPuZHkiFuxm3Z4f9k4g78W4oPGqDSwEqH7Ikiy
         q+loWajSb85QPjEIcOgrfPOdrr1Y68wiqst7EYEDHP1HI43l6oU1CBC2SkW8DBmg4fYR
         dfwc4N5X22NDhylJZiVU91s8+pSes8cbpkmJmQ9WVIo9Md6iFtmoZGnZaU/fKLBB5/gG
         z7GgPyZUs07HAZACgC/2Fx94e4lCUXA7rcMWmI3Qhw81K6TD9EJk1eEdk0A/USs5Wvaw
         vVQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n11-v6si2121736qvo.33.2018.08.03.07.48.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 07:48:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51724 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flbN7-0002wp-Qz
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 10:48:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1flbMd-0002hr-Q7
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 10:47:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1flbMc-0007e1-TL
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 10:47:35 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:32966 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1flbMc-0007da-N7; Fri, 03 Aug 2018 10:47:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28BA6818A6B9;
	Fri,  3 Aug 2018 14:47:34 +0000 (UTC)
Received: from localhost (ovpn-117-231.ams2.redhat.com [10.36.117.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FC0A215670D;
	Fri,  3 Aug 2018 14:47:33 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Fri,  3 Aug 2018 15:47:18 +0100
Message-Id: <20180803144721.17036-4-stefanha@redhat.com>
In-Reply-To: <20180803144721.17036-1-stefanha@redhat.com>
References: <20180803144721.17036-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 03 Aug 2018 14:47:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 03 Aug 2018 14:47:34 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 3/6] loader: extract rom_free() function
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, Su Hang <suhang16@mails.ucas.ac.cn>,
	ilg@livius.net, Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nYmx2pe3y2OO

The next patch will need to free a rom.  There is already code to do
this in rom_add_file().

Note that rom_add_file() uses:

  rom = g_malloc0(sizeof(*rom));
  ...
  if (rom->fw_dir) {
      g_free(rom->fw_dir);
      g_free(rom->fw_file);
  }

The conditional is unnecessary since g_free(NULL) is a no-op.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/core/loader.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index bbb6e65bb5..0c72e7c05a 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -847,6 +847,17 @@ struct Rom {
 static FWCfgState *fw_cfg;
 static QTAILQ_HEAD(, Rom) roms = QTAILQ_HEAD_INITIALIZER(roms);
 
+/* rom->data must be heap-allocated (do not use with rom_add_elf_program()) */
+static void rom_free(Rom *rom)
+{
+    g_free(rom->data);
+    g_free(rom->path);
+    g_free(rom->name);
+    g_free(rom->fw_dir);
+    g_free(rom->fw_file);
+    g_free(rom);
+}
+
 static inline bool rom_order_compare(Rom *rom, Rom *item)
 {
     return ((uintptr_t)(void *)rom->as > (uintptr_t)(void *)item->as) ||
@@ -995,15 +1006,7 @@ err:
     if (fd != -1)
         close(fd);
 
-    g_free(rom->data);
-    g_free(rom->path);
-    g_free(rom->name);
-    if (fw_dir) {
-        g_free(rom->fw_dir);
-        g_free(rom->fw_file);
-    }
-    g_free(rom);
-
+    rom_free(rom);
     return -1;
 }
 
-- 
2.17.1


Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1696287wru;
        Thu, 27 Jun 2019 13:31:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyhzQvCcpCnMU4nbK+YoSnBtoGZ6tTKGI/IrtZCor+yv1tbpQxcZHlk3j+nKRrMtTUhAmXx
X-Received: by 2002:a37:5802:: with SMTP id m2mr5165095qkb.494.1561667468418;
        Thu, 27 Jun 2019 13:31:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667468; cv=none;
        d=google.com; s=arc-20160816;
        b=HrrLF7NYLpRnw7Dhl0KZpSVILXsd+4hpvvOQv9TRHDKVRI+lbnAiVHCryNNwDMkPrj
         k6godLofwmondUYqoQQwuYgoyewbFGOwgtDPUL4pXhNmyn2+3RXU9/aMFqw0Me6TpPkY
         xIBykNr0vFbRh30VpLfpA3iwgfxJdQgxhnNZLZQbAiMDtKzE6yP9yvvsIWSaaCa2VYOJ
         sO5cTPvAglFsXfnn+oigOAkMrZHOZIUYZX97nt0l898Ue6WZ31ogPxteOJGdkylaZX3C
         gShiQ5peHI6leR1kVMnShlMOoYhMYlkbAcVpDfGFR1Tzu38Pg2XXJGrMWpezazsXHDzQ
         qmjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=VKjpz8GWlWqLDGe+OFhX2vMF+PbTnc2v4kGCc3cYIes=;
        b=uFtsAgqzjiyuhlMJ62/O92DNkny7RcIUR8y+i/qudzQjU9MltR7++TPcvZJAgd7TXj
         Jc3VdBp7oGETpKgw93WUkrFI8o5bR/DDV71NA36rY/sgK/VUmlJYtBtdyJZgyeG3nmI7
         GWnn0BsAYszDtTNjqcQvlB517eD41FOWU6UNBAodHaK7/z2nUJFkG9k1sJ2jMuRG1B8W
         9o4s3AuIDFyL2m9IttxXkwg88TRXPnPlpzux6oQDoMngTVVMv2Ai65eLqVtqomCSg9md
         iI3DIK22TnbGEh5snu0KWsOvnL4WOQVCxzcH1N+uMW5+9YQG5e1UGo8HC229O7llxOAe
         j2FA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h21si141132qkg.332.2019.06.27.13.31.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:31:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7209330BB54B;
	Thu, 27 Jun 2019 20:31:07 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01734600CC;
	Thu, 27 Jun 2019 20:30:57 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	qemu-devel@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
	qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 27/28] hw/block/pflash_cfi02: Document commands
Date: Thu, 27 Jun 2019 22:27:18 +0200
Message-Id: <20190627202719.17739-28-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 27 Jun 2019 20:31:07 +0000 (UTC)
X-TUID: uPu/OCo5ZvLC

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index e9519cbae8..db9dc7d8fb 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -327,7 +327,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
         pfl->wcycle = 0;
         pfl->cmd = 0;
         /* fall through to the read code */
-    case 0x80:
+    case 0x80: /* Erase (unlock) */
         /* We accept reads during second unlock sequence... */
     case 0x00:
         if (pflash_erase_suspend_mode(pfl) &&
@@ -342,8 +342,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
         /* Flash area read */
         ret = pflash_data_read(pfl, offset, width);
         break;
-    case 0x90:
-        /* flash ID read */
+    case 0x90: /* flash ID read */
         switch (boff) {
         case 0x00:
         case 0x01:
@@ -364,11 +363,11 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
         }
         DPRINTF("%s: ID " TARGET_FMT_plx " %" PRIx64 "\n", __func__, boff, ret);
         break;
-    case 0x10:
-    case 0x30:
+    case 0x10: /* Chip Erase */
+    case 0x30: /* Sector Erase */
         /* Toggle bit 2 during erase, but not program. */
         toggle_dq2(pfl);
-    case 0xA0:
+    case 0xA0: /* Program */
         /* Toggle bit 6 */
         toggle_dq6(pfl);
         /* Status register read */
@@ -470,7 +469,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             return;
         }
         /* Handle erase resume in erase suspend mode, otherwise reset. */
-        if (cmd == 0x30) {
+        if (cmd == 0x30) { /* Erase Resume */
             if (pflash_erase_suspend_mode(pfl)) {
                 /* Resume the erase. */
                 timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
@@ -485,7 +484,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             goto reset_flash;
         }
         /* Ignore erase suspend. */
-        if (cmd == 0xB0) {
+        if (cmd == 0xB0) { /* Erase Suspend */
             return;
         }
         if (boff != pfl->unlock_addr0 || cmd != 0xAA) {
@@ -516,9 +515,9 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
         case 0x20:
             pfl->bypass = 1;
             goto do_bypass;
-        case 0x80:
-        case 0x90:
-        case 0xA0:
+        case 0x80: /* Erase */
+        case 0x90: /* Autoselect */
+        case 0xA0: /* Program */
             pfl->cmd = cmd;
             DPRINTF("%s: starting command %02x\n", __func__, cmd);
             break;
@@ -529,10 +528,10 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
         break;
     case 3:
         switch (pfl->cmd) {
-        case 0x80:
+        case 0x80: /* Erase */
             /* We need another unlock sequence */
             goto check_unlock0;
-        case 0xA0:
+        case 0xA0: /* Program */
             if (pflash_erase_suspend_mode(pfl) &&
                 pflash_sector_is_erasing(pfl, offset)) {
                 /* Ignore writes to erasing sectors. */
@@ -562,7 +561,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             if (pfl->bypass)
                 goto do_bypass;
             goto reset_flash;
-        case 0x90:
+        case 0x90: /* Autoselect */
             if (pfl->bypass && cmd == 0x00) {
                 /* Unlock bypass reset */
                 goto reset_flash;
@@ -585,11 +584,11 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
         }
     case 4:
         switch (pfl->cmd) {
-        case 0xA0:
+        case 0xA0: /* Program */
             /* Ignore writes while flash data write is occurring */
             /* As we suppose write is immediate, this should never happen */
             return;
-        case 0x80:
+        case 0x80: /* Erase */
             goto check_unlock1;
         default:
             /* Should never happen */
@@ -604,7 +603,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             goto reset_flash;
         }
         switch (cmd) {
-        case 0x10:
+        case 0x10: /* Chip Erase */
             if (boff != pfl->unlock_addr0) {
                 DPRINTF("%s: chip erase: invalid address " TARGET_FMT_plx "\n",
                         __func__, offset);
@@ -621,8 +620,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                       (1ULL << pfl->cfi_table[0x22]) * SCALE_MS);
             break;
-        case 0x30:
-            /* Sector erase */
+        case 0x30: /* Sector erase */
             pflash_sector_erase(pfl, offset);
             break;
         default:
@@ -633,10 +631,10 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
         break;
     case 6:
         switch (pfl->cmd) {
-        case 0x10:
+        case 0x10: /* Chip Erase */
             /* Ignore writes during chip erase */
             return;
-        case 0x30:
+        case 0x30: /* Sector erase */
             if (cmd == 0xB0) {
                 /*
                  * If erase suspend happens during the erase timeout (so DQ3 is
-- 
2.20.1

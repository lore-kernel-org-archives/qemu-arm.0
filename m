Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1695634wru;
        Thu, 27 Jun 2019 13:30:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzVPhnEHgW4w971VBrl4rGeXJd9Se2meouFKa7zINkZx4oph4/GxSyfLOVgrMCeFOSXSlPw
X-Received: by 2002:a0c:d604:: with SMTP id c4mr4872646qvj.27.1561667425583;
        Thu, 27 Jun 2019 13:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667425; cv=none;
        d=google.com; s=arc-20160816;
        b=NhlxylEHqdH0ugQUln/Q6Hq18E9zXl+2CDQlW8REJCtlWDKzMhPaawzSl79gjX6bws
         cQUeCcuZ5UYqFdqH7u2j9DjqVEnRiReEFMwkK5YEz7s74NlKA/57hUCoo8MjVsVwPhm4
         qRVJ71T008pBjli+Zw1ET2ZaWOaYqGAg2ZfNGupr1n8E3MfQ9EjGygeKtQ1m2iUTgxK4
         rKLN4mYZPD/XzoByEv/1KCc611uDq4+brgcEdBsmMO8Re+0rClNBIToJgWAzsfDuTmKh
         hmh9AIyAwtpeh/ESHYxj0k0gu2uIUr5vj43zCKJ6ulvhc2KrPeXDTAefgRsESSkNd0UR
         rt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=H2Q3bwczf4uFfoycsx7DQPrmngNquEbfw3JFd4HBzM8=;
        b=b8yQK/7kINT9YdL8tsB7zQzpMuuZ28+y7Wmw2/zzKgHnZOmMXwGKiM0grRN3ONgkjW
         7C1s8RdLLRD4sawsL30SZj0Yw2e3vhOZBNaAZFxIJuZe16ayQQzeMx0e+dtViUnzNGDQ
         lER64n5tkZVTRJkqa7+9t7+mNEKS5jUJiSxAGKgBRt6jmjW9kY4ce6ntm++zYGa7RKtH
         L84YWc8MOCfBmXyZpSjbd8F3jmG2Zi/IqtbNnRm7aYmk0QWnXux5CWlV3mmMIAe61Ufj
         3WWkZYVKdbaWdOEe466k4YUmDp032sTcV6wJZPXnFG4b02jkB8NUtTAT5d5ebZ4f/kXj
         OnOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id w2si147056qkf.216.2019.06.27.13.30.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:30:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AF77C057F4B;
	Thu, 27 Jun 2019 20:30:24 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8629D600CC;
	Thu, 27 Jun 2019 20:30:14 +0000 (UTC)
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
Subject: [PATCH v5 21/28] hw/block/pflash_cfi02: Fix CFI in autoselect mode
Date: Thu, 27 Jun 2019 22:27:12 +0200
Message-Id: <20190627202719.17739-22-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 27 Jun 2019 20:30:24 +0000 (UTC)
X-TUID: tvMFIKLqiVdp

From: Stephen Checkoway <stephen.checkoway@oberlin.edu>

After a flash device enters CFI mode from autoselect mode, the reset
command returns the device to autoselect mode. An additional reset
command is necessary to return to read array mode.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190426162624.55977-7-stephen.checkoway@oberlin.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c   | 22 ++++++++++++++++++----
 tests/pflash-cfi02-test.c | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 08b2bc83cb..13f76fa71d 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -66,6 +66,7 @@ do {                                                       \
 /* Special write cycles for CFI queries. */
 enum {
     WCYCLE_CFI              = 7,
+    WCYCLE_AUTOSELECT_CFI   = 8,
 };
 
 struct PFlashCFI02 {
@@ -311,6 +312,12 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
     cmd = value;
     if (pfl->cmd != 0xA0) {
         if (cmd == 0xF0) {
+            if (pfl->wcycle == WCYCLE_AUTOSELECT_CFI) {
+                /* Return to autoselect mode. */
+                pfl->wcycle = 3;
+                pfl->cmd = 0x90;
+                return;
+            }
             goto reset_flash;
         }
     }
@@ -333,7 +340,6 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
         /* We're in read mode */
     check_unlock0:
         if (boff == 0x55 && cmd == 0x98) {
-        enter_CFI_mode:
             /* Enter CFI query mode */
             pfl->wcycle = WCYCLE_CFI;
             pfl->cmd = 0x98;
@@ -410,9 +416,16 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
                 /* Unlock bypass reset */
                 goto reset_flash;
             }
-            /* We can enter CFI query mode from autoselect mode */
-            if (boff == 0x55 && cmd == 0x98)
-                goto enter_CFI_mode;
+            /*
+             * We can enter CFI query mode from autoselect mode, but we must
+             * return to autoselect mode after a reset.
+             */
+            if (boff == 0x55 && cmd == 0x98) {
+                /* Enter autoselect CFI query mode */
+                pfl->wcycle = WCYCLE_AUTOSELECT_CFI;
+                pfl->cmd = 0x98;
+                return;
+            }
             /* No break here */
         default:
             DPRINTF("%s: invalid write for command %02x\n",
@@ -493,6 +506,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
         break;
     /* Special values for CFI queries */
     case WCYCLE_CFI:
+    case WCYCLE_AUTOSELECT_CFI:
         DPRINTF("%s: invalid write in CFI query mode\n", __func__);
         goto reset_flash;
     default:
diff --git a/tests/pflash-cfi02-test.c b/tests/pflash-cfi02-test.c
index 1659eaebce..00e2261742 100644
--- a/tests/pflash-cfi02-test.c
+++ b/tests/pflash-cfi02-test.c
@@ -407,6 +407,42 @@ static void test_geometry(const void *opaque)
     qtest_quit(qtest);
 }
 
+/*
+ * Test that
+ * 1. enter autoselect mode;
+ * 2. enter CFI mode; and then
+ * 3. exit CFI mode
+ * leaves the flash device in autoselect mode.
+ */
+static void test_cfi_in_autoselect(const void *opaque)
+{
+    const FlashConfig *config = opaque;
+    QTestState *qtest;
+    qtest = qtest_initf("-M musicpal,accel=qtest"
+                        " -drive if=pflash,file=%s,format=raw,copy-on-read",
+                        image_path);
+    FlashConfig explicit_config = expand_config_defaults(config);
+    explicit_config.qtest = qtest;
+    const FlashConfig *c = &explicit_config;
+
+    /* 1. Enter autoselect. */
+    unlock(c);
+    flash_cmd(c, UNLOCK0_ADDR, AUTOSELECT_CMD);
+    g_assert_cmpint(flash_query(c, FLASH_ADDR(0)), ==, replicate(c, 0xBF));
+
+    /* 2. Enter CFI. */
+    flash_cmd(c, CFI_ADDR, CFI_CMD);
+    g_assert_cmpint(flash_query(c, FLASH_ADDR(0x10)), ==, replicate(c, 'Q'));
+    g_assert_cmpint(flash_query(c, FLASH_ADDR(0x11)), ==, replicate(c, 'R'));
+    g_assert_cmpint(flash_query(c, FLASH_ADDR(0x12)), ==, replicate(c, 'Y'));
+
+    /* 3. Exit CFI. */
+    reset(c);
+    g_assert_cmpint(flash_query(c, FLASH_ADDR(0)), ==, replicate(c, 0xBF));
+
+    qtest_quit(qtest);
+}
+
 static void cleanup(void *opaque)
 {
     unlink(image_path);
@@ -474,6 +510,9 @@ int main(int argc, char **argv)
         qtest_add_data_func(path, config, test_geometry);
         g_free(path);
     }
+
+    qtest_add_data_func("pflash-cfi02/cfi-in-autoselect", &configuration[0],
+                        test_cfi_in_autoselect);
     int result = g_test_run();
     cleanup(NULL);
     return result;
-- 
2.20.1

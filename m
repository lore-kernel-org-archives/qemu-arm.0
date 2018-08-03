Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp157457wru;
        Fri, 3 Aug 2018 07:48:24 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdAdGaB2Jw8BT4m+jzu0rlu9nUXC58IIQ/ZK7lDAl2KT4p/tdglPyNnAxOv0v4vUSK8yPbJ
X-Received: by 2002:a37:1fdf:: with SMTP id n92-v6mr4067789qkh.333.1533307704705;
        Fri, 03 Aug 2018 07:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533307704; cv=none;
        d=google.com; s=arc-20160816;
        b=kzLOPK/ANaJ3xUNFobRMt8V7EKaw/ewkvYrZavfiQbpmbZ528++lqk6fQJLElq2PtM
         vi09QuRTSiccXFftJoFuj+1HxCaYny2FDktPK+6R/UJEk+Xha1EZVtJbZhN+O9yyEPXC
         FzUQzj9tdz4voBjBvtjVUMrz8yV0Ro0luk04LdooSbXeP1aqhhA19ny+VF/XqwuKaTHU
         lX/U5qGMNZJhMRHi3Tix/GPIioVesgyj6DRqJNzVR+uWTFNA6Trnb0+EBtcfMqNMgNNQ
         1fuoYViWDhESUX7M77/SX+RMBXME4ifKPjAMVCw1QF06+3TeHKwOAc0PGCpdIcALzFQ8
         ebQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=DZ+vWvUdTY3sJ0Kx3YzlP70QEUQfoqM8l+YOjc8NiLg=;
        b=SAKNJs/ZHh2AXBVc8rpnTUDzwfDQBgSd/6jnXqpOQA9dSHYgOm94zvmDWGmQIjSGaM
         mXLl6J0OOG7Bh6XK3NM0jkBbCyBMWPr0qAVvgMA1leZUCoH/S69UxGLI5N/Tr/o72AR3
         nobW8HZ/ES6jnt4flnpwCpkD0jHb9OKYEU+ad4O6Sk+9zSh4vFMBo+fR6vbW4YU9MSdU
         tOtXHcCigrgPZD9A3tiVngwAgq63/+5GdgvEyy83zeHX0Ns0XeJs6jMW3OCK1bak4yFX
         nW5GKrq7UqAlJ59dq6fdfldCU/mEYcEyXwcGjgxxWmPBElRtRahmV3MTZMV4xGrP5gKO
         cfhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s187-v6si5089153qkb.15.2018.08.03.07.48.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 07:48:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flbNQ-0002qb-7F
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 10:48:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1flbMm-0002mj-H8
	for qemu-devel@nongnu.org; Fri, 03 Aug 2018 10:47:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1flbMi-0007hq-Hu
	for qemu-devel@nongnu.org; Fri, 03 Aug 2018 10:47:44 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35874 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1flbMe-0007f1-Bd; Fri, 03 Aug 2018 10:47:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B23117A7EF;
	Fri,  3 Aug 2018 14:47:35 +0000 (UTC)
Received: from localhost (ovpn-117-231.ams2.redhat.com [10.36.117.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 602571C72C;
	Fri,  3 Aug 2018 14:47:35 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Fri,  3 Aug 2018 15:47:19 +0100
Message-Id: <20180803144721.17036-5-stefanha@redhat.com>
In-Reply-To: <20180803144721.17036-1-stefanha@redhat.com>
References: <20180803144721.17036-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 03 Aug 2018 14:47:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 03 Aug 2018 14:47:35 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v4 4/6] loader: add rom transaction API
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, Su Hang <suhang16@mails.ucas.ac.cn>,
	ilg@livius.net, Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H2RnhXwgyTRy

Image file loaders may add a series of roms.  If an error occurs partway
through loading there is no easy way to drop previously added roms.

This patch adds a transaction mechanism that works like this:

  rom_transaction_begin();
  ...call rom_add_*()...
  rom_transaction_end(ok);

If ok is false then roms added in this transaction are dropped.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/loader.h | 19 +++++++++++++++++++
 hw/core/loader.c    | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index e98b84b8f9..5235f119a3 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -225,6 +225,25 @@ int rom_check_and_register_reset(void);
 void rom_set_fw(FWCfgState *f);
 void rom_set_order_override(int order);
 void rom_reset_order_override(void);
+
+/**
+ * rom_transaction_begin:
+ *
+ * Call this before of a series of rom_add_*() calls.  Call
+ * rom_transaction_end() afterwards to commit or abort.  These functions are
+ * useful for undoing a series of rom_add_*() calls if image file loading fails
+ * partway through.
+ */
+void rom_transaction_begin(void);
+
+/**
+ * rom_transaction_end:
+ * @commit: true to commit added roms, false to drop added roms
+ *
+ * Call this after a series of rom_add_*() calls.  See rom_transaction_begin().
+ */
+void rom_transaction_end(bool commit);
+
 int rom_copy(uint8_t *dest, hwaddr addr, size_t size);
 void *rom_ptr(hwaddr addr, size_t size);
 void hmp_info_roms(Monitor *mon, const QDict *qdict);
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 0c72e7c05a..612420b870 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -840,6 +840,8 @@ struct Rom {
     char *fw_dir;
     char *fw_file;
 
+    bool committed;
+
     hwaddr addr;
     QTAILQ_ENTRY(Rom) next;
 };
@@ -877,6 +879,8 @@ static void rom_insert(Rom *rom)
         rom->as = &address_space_memory;
     }
 
+    rom->committed = false;
+
     /* List is ordered by load address in the same address space */
     QTAILQ_FOREACH(item, &roms, next) {
         if (rom_order_compare(rom, item)) {
@@ -1168,6 +1172,34 @@ void rom_reset_order_override(void)
     fw_cfg_reset_order_override(fw_cfg);
 }
 
+void rom_transaction_begin(void)
+{
+    Rom *rom;
+
+    /* Ignore ROMs added without the transaction API */
+    QTAILQ_FOREACH(rom, &roms, next) {
+        rom->committed = true;
+    }
+}
+
+void rom_transaction_end(bool commit)
+{
+    Rom *rom;
+    Rom *tmp;
+
+    QTAILQ_FOREACH_SAFE(rom, &roms, next, tmp) {
+        if (rom->committed) {
+            continue;
+        }
+        if (commit) {
+            rom->committed = true;
+        } else {
+            QTAILQ_REMOVE(&roms, rom, next);
+            rom_free(rom);
+        }
+    }
+}
+
 static Rom *find_rom(hwaddr addr, size_t size)
 {
     Rom *rom;
-- 
2.17.1


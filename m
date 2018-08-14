Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4352809wru;
        Tue, 14 Aug 2018 10:57:35 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyORukmxEf/8kqsdw4Qrrrmc+LUbqa/rOIYmr2/zcRsgsEUzSmkSoMcfh1ypl5ck5i2nP6y
X-Received: by 2002:a0c:b39a:: with SMTP id t26-v6mr19427803qve.206.1534269455527;
        Tue, 14 Aug 2018 10:57:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534269455; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5OVsC7nBR8RhPlPTuZ9Ga1ly/xID8XPLWsi00DcW7SyLwpkre6l0jW76Bj4RxW5PK
         llUOHZ/6w5MgDa1jQJWIXVaL1YkE68ZERaVT4N2l2FZG1REk5f5Fm3CaQcWp/eFPTMin
         dR9WvN/W4bFckbxUJfGdac4fxTBzQdrDmJj7C2S/eQhypDiR7vN/PqJqWTlkqhuVIhCp
         ZsCIv92gMyeobDpUAikNfT53wBVfcJPLaAa5W2CrFrYoG8TBXJ5yOA2IJa+CGBK+DKJe
         WwX+8qfFl/Wp2YnWVi8lndVAAQKDim6YacCQBeDeY71Xw9a6GbV8q/KH6OrvqOHyhEfv
         cMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=DZ+vWvUdTY3sJ0Kx3YzlP70QEUQfoqM8l+YOjc8NiLg=;
        b=mEC3u87i5WbYMfIAN2oFwKm6JllVVOwnIjsVvHI9U7Xa+h1Gu+YAqbdqArZ63lYaVE
         eeV4rmHVFRWGpIi9Hdwi7mF9Qv7OfXd4U/qYMo6ZTBIaWDZHkoi3oby2Is2Ct6L4C7Ya
         SHBdb2TAL91J3qJ1+WX3sEV5BCk9EsUHg67QIQpld5CAGx0XJswKnNih+aoKo+Sshafy
         u10i/R5M1U+HZw9yxsRtLW57JYKxAy/2sdl67eA7X/cPGqpPWBlRUHZP0LLRKQ5NQkEy
         NrHIVUVUb9i5ohFvfJ61LS/eaI2LfrGrl7oo1+hIWP4Cf5LmhHrKjkXoPeYjYnnvhbgU
         ScUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t34-v6si3308574qth.151.2018.08.14.10.57.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 10:57:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45405 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpdZW-0005sa-Vs
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 13:57:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpdRS-0000gB-NW
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 13:49:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpdRD-0004hd-MN
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 13:49:14 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49082 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fpdRD-0004hW-Fw; Tue, 14 Aug 2018 13:48:59 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E8A081663CC;
	Tue, 14 Aug 2018 16:30:01 +0000 (UTC)
Received: from localhost (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF2832026D7E;
	Tue, 14 Aug 2018 16:30:00 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 14 Aug 2018 17:27:37 +0100
Message-Id: <20180814162739.11814-5-stefanha@redhat.com>
In-Reply-To: <20180814162739.11814-1-stefanha@redhat.com>
References: <20180814162739.11814-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 14 Aug 2018 16:30:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 14 Aug 2018 16:30:01 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v6 4/6] loader: add rom transaction API
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
	joel@jms.id.au, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5f5d4XApz/43

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


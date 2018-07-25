Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp465414wru;
        Wed, 25 Jul 2018 02:00:46 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfo9SXKA39ZEl73P7kn5ayPMEwoKIyt77uK3Ibbi800ENNeEW2uWBHZL3bFIqHBvZX6TgoM
X-Received: by 2002:a37:7b45:: with SMTP id w66-v6mr16145585qkc.39.1532509246066;
        Wed, 25 Jul 2018 02:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532509246; cv=none;
        d=google.com; s=arc-20160816;
        b=GYAq0ISwgF3VJO2IIIIHlP0m2bg/ekbdIXHWoFgaA7nLHJIp9tdKlNXWica2pKagNk
         SNbZmOHv6peXam7zGyNMEHpBoBbtD5TcXBp2HXKhua8wHOjM98QRD0BA2yhX7XjHG0uj
         p2Og1VrUjFQQUu/FATYv2+YkZFUoCWbXjiFLty3B4O3aTNwGsAy5JC5iCduK8sB9t/bc
         3+D77yFcMs59TS4RZVVmleZGlAfh/OeNRvRVR/Zws574G4ZZ5rbWRGpt8rkWen+xrL6X
         1sFWos4y+lDCUrXKt8S2wlI3NYK5k/JTqGZtO/A92pUZKmbniQVjVQKEHG588Ua3ChXN
         nKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=+ntjTFn7glmKCglhTpNnlkbBx5hN3Zkz9YXTiRG17KA=;
        b=U6cPSBpXMtF1DBiwNhmF7fxLYvGRUeFTctAU0PA2iJUBm2EI9Zhho4PF2yI4Ny/zut
         aJBfiJKk1htlr6UopFUFGUmtUVjjfSGwZ3hwXmSYPROhaUwz32iPmGjbBHmwuLEmmZbk
         Zp8qnq4ZbHEAb1vBPunP07f/NAyxtxEHkg5XSTMjnlk+jYSZSOmR2eR+1I+c7lj+ocqZ
         vnTQ2QxvOc/Hv4xRa7V5OcvqzqU3iNBMy1Vwy0AsrggODsAgk947pj7QJFyiKvTjxYyu
         0iCeNnY8LeCGRkz13iezOJOSM5n60yIlo95V7/Cu/luhb7cTvjyN+OVk75Hkgpf3QsAe
         oxVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188-v6si8309648qka.330.2018.07.25.02.00.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 02:00:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiFf3-0000Nd-Fo
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 05:00:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fiFeP-0008Bz-Md
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 05:00:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fiFeM-0002EG-Pm
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 05:00:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41920 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fiFeM-0002Di-JV; Wed, 25 Jul 2018 05:00:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E07D68801;
	Wed, 25 Jul 2018 09:00:01 +0000 (UTC)
Received: from localhost (ovpn-117-157.ams2.redhat.com [10.36.117.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83A3D7C2F;
	Wed, 25 Jul 2018 08:59:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Jul 2018 09:59:42 +0100
Message-Id: <20180725085944.11856-6-stefanha@redhat.com>
In-Reply-To: <20180725085944.11856-1-stefanha@redhat.com>
References: <20180725085944.11856-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 25 Jul 2018 09:00:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 25 Jul 2018 09:00:01 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 5/7] loader: add rom transaction API
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
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zoSLSrD/Eze4

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
 hw/core/loader.c    | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

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
index bbb6e65bb5..182abcce28 100644
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
@@ -866,6 +868,8 @@ static void rom_insert(Rom *rom)
         rom->as = &address_space_memory;
     }
 
+    rom->committed = false;
+
     /* List is ordered by load address in the same address space */
     QTAILQ_FOREACH(item, &roms, next) {
         if (rom_order_compare(rom, item)) {
@@ -1165,6 +1169,39 @@ void rom_reset_order_override(void)
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
+            g_free(rom->data);
+            g_free(rom->path);
+            g_free(rom->name);
+            g_free(rom->fw_dir);
+            g_free(rom->fw_file);
+            g_free(rom);
+        }
+    }
+}
+
 static Rom *find_rom(hwaddr addr, size_t size)
 {
     Rom *rom;
-- 
2.17.1


Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4205778lfk;
        Thu, 27 Jan 2022 08:18:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbkJ4jrLzVxX0ApBgeo5UPJQdLubUINKLX4890xoI4ajMk/HzkgeG0Cn5HiF2D2wNgph8p
X-Received: by 2002:a05:6214:410d:: with SMTP id kc13mr4122030qvb.71.1643300331871;
        Thu, 27 Jan 2022 08:18:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643300331; cv=none;
        d=google.com; s=arc-20160816;
        b=f431/GoEgZXGIBoQDuKmlmHJhpMSwRfEtEV6I837uos7NdOFpLMoobZtHQs7rIKXs1
         ll9lDlQavUjlQWn+D6jkQmi0PYe+XgEk2+zNHY03xp6Jalfp5E3KWFjhwSedDYJVKOHG
         gh/RxZe4QsKBpBl1qqswe/i25eehLc+7YMr8APTSTZyCmsPtULMmVYbvxs31/yFKT7jA
         sooGEIfkh7V9DczRJv4zU/in+i6yokHHUXtM4W0LqmrQkLnyxIPpp6L3Y6Fvr5C+Q4xk
         TwNSPE/uu9n4UR1quxpNNEXgoG96TjfLSbF1qbkMCtlYWLHDnCTN5yEOp8EzJVtsO2ku
         IyEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7qKHJ+kz44DX+SXjXAxR04KqrnALWnZetuh9UunKmNQ=;
        b=rLRBqFh5PW5mcOdBy3ElfkGd5bVJRJBXssLPX+PMlygPGztGJb0GgkNHaxD2UZAxq/
         c8EpCufMhfyHK93+9a+eRKbxTW5rJrCYT0X4EhioFe+b66DZP5euL540dvvZE7qj1otQ
         1cxq91dN29SRYzjIhZasWvgUTOT8Beq0nRuq4toKrUqNY6xLD7gg6rfK47JmgzpNhdNq
         qf6UyhJkBAzEgGaSA9eRgFoVGH9BwM8TFMqi7QIF9rskjQIFlLNcxwNJ93+bJrIMR5EZ
         PHqDdetSnly4BZlqCE3eUSvZ6xypAAaAbnK/fOzl3xfbfIiLWvNku4yp/VwFtbMKzkyE
         rEaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hcv2EVaw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15si1459344qvh.357.2022.01.27.08.18.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 08:18:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hcv2EVaw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD7U2-0004e5-UG
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 11:18:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Yu-0005Ft-RW
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:19:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6Yr-0003mc-7x
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qKHJ+kz44DX+SXjXAxR04KqrnALWnZetuh9UunKmNQ=;
 b=hcv2EVawQDN9WC900CQ+etbT+CEc1wzMw9MqNDmQeh9sf1RjT584uJtCmdTnjgEOgHI6bq
 iVqO5tBDjfGKrvgXAmYFmCyFNjNxuZqbNmZz69JXkaoFRPzQrBhlKGEk5oh0TRm1fFf27f
 Q3WHt7trdJwCpApNZJO37ZT/l7rTWZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-hCs7x92MMHK3VNM153gs5g-1; Thu, 27 Jan 2022 10:19:41 -0500
X-MC-Unique: hCs7x92MMHK3VNM153gs5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9638119251A0;
 Thu, 27 Jan 2022 15:19:38 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2EEF70D2D;
 Thu, 27 Jan 2022 15:19:02 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/38] migration: Tally pre-copy,
 downtime and post-copy bytes independently
Date: Thu, 27 Jan 2022 16:05:43 +0100
Message-Id: <20220127150548.20595-34-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
References: <20220127150548.20595-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 54e5ieLUM+TC

From: David Edmondson <david.edmondson@oracle.com>

Provide information on the number of bytes copied in the pre-copy,
downtime and post-copy phases of migration.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 qapi/migration.json   | 13 ++++++++++++-
 migration/migration.c |  3 +++
 migration/ram.c       |  7 +++++++
 monitor/hmp-cmds.c    | 12 ++++++++++++
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index bbfd48cf0b..5975a0e104 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -46,6 +46,15 @@
 # @pages-per-second: the number of memory pages transferred per second
 #                    (Since 4.0)
 #
+# @precopy-bytes: The number of bytes sent in the pre-copy phase
+#                 (since 7.0).
+#
+# @downtime-bytes: The number of bytes sent while the guest is paused
+#                  (since 7.0).
+#
+# @postcopy-bytes: The number of bytes sent during the post-copy phase
+#                  (since 7.0).
+#
 # Since: 0.14
 ##
 { 'struct': 'MigrationStats',
@@ -54,7 +63,9 @@
            'normal-bytes': 'int', 'dirty-pages-rate' : 'int',
            'mbps' : 'number', 'dirty-sync-count' : 'int',
            'postcopy-requests' : 'int', 'page-size' : 'int',
-           'multifd-bytes' : 'uint64', 'pages-per-second' : 'uint64' } }
+           'multifd-bytes' : 'uint64', 'pages-per-second' : 'uint64',
+           'precopy-bytes' : 'uint64', 'downtime-bytes' : 'uint64',
+           'postcopy-bytes' : 'uint64' } }
 
 ##
 # @XBZRLECacheStats:
diff --git a/migration/migration.c b/migration/migration.c
index 771f3e2bec..bcc385b94b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1014,6 +1014,9 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->page_size = page_size;
     info->ram->multifd_bytes = ram_counters.multifd_bytes;
     info->ram->pages_per_second = s->pages_per_second;
+    info->ram->precopy_bytes = ram_counters.precopy_bytes;
+    info->ram->downtime_bytes = ram_counters.downtime_bytes;
+    info->ram->postcopy_bytes = ram_counters.postcopy_bytes;
 
     if (migrate_use_xbzrle()) {
         info->has_xbzrle_cache = true;
diff --git a/migration/ram.c b/migration/ram.c
index 619a1d9a6b..ca879c744f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -389,6 +389,13 @@ MigrationStats ram_counters;
 
 static void ram_transferred_add(uint64_t bytes)
 {
+    if (runstate_is_running()) {
+        ram_counters.precopy_bytes += bytes;
+    } else if (migration_in_postcopy()) {
+        ram_counters.postcopy_bytes += bytes;
+    } else {
+        ram_counters.downtime_bytes += bytes;
+    }
     ram_counters.transferred += bytes;
 }
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2669156b28..8c384dc1b2 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -293,6 +293,18 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
             monitor_printf(mon, "postcopy request count: %" PRIu64 "\n",
                            info->ram->postcopy_requests);
         }
+        if (info->ram->precopy_bytes) {
+            monitor_printf(mon, "precopy ram: %" PRIu64 " kbytes\n",
+                           info->ram->precopy_bytes >> 10);
+        }
+        if (info->ram->downtime_bytes) {
+            monitor_printf(mon, "downtime ram: %" PRIu64 " kbytes\n",
+                           info->ram->downtime_bytes >> 10);
+        }
+        if (info->ram->postcopy_bytes) {
+            monitor_printf(mon, "postcopy ram: %" PRIu64 " kbytes\n",
+                           info->ram->postcopy_bytes >> 10);
+        }
     }
 
     if (info->has_disk) {
-- 
2.34.1


Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4223765lfk;
        Thu, 27 Jan 2022 08:47:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnJSqCC+hKWFKRIHw5Niy9PM0wX1pcA4UbicdS4c35DDH0FWmhJd/+egBlI1FLRRMkcN8p
X-Received: by 2002:a05:6638:60f:: with SMTP id g15mr2310453jar.200.1643302030126;
        Thu, 27 Jan 2022 08:47:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643302030; cv=none;
        d=google.com; s=arc-20160816;
        b=zuc7Bna5rh4O5E6tyP+z6+iMOb4FvMZHh1hREQcXgY9TrjIq26NmIEHMW+8YQlvHuu
         +/qM53wd02SGA1lYo9Fe6/HM71gqSnYncBNB49AAmsmFCJDQl5u0gZ796KCJ07H3Ux/g
         aLnZOazzEERCmaCDLogIco/QWCsPUXtv1F2niEJsFh5Zy9CY1fHVPXEw2Cg91s9U6LW2
         9h5sawS0Wu3c2wbIJkHcjE1d/HmSxYJw2Pphi99O0CF3ps/eED04Kda0C4y9y8X9oiSO
         FXnc6JkHEPT4jBxLmJsHfp79vbcYfrwAIhcOxGjWUXqEBQg3GH+sFcWQCaHSoibUJBWm
         yuqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wq2DgU0T8TiyoW+AeqpkEASJI3l+VWw2yOgyjpGNPwo=;
        b=Tdc26+3tSQXrWwJ1qHeJj0Vy1bKXGlGxoi31HrNcYknWiMbzaXVWqs0pC0a3Cj9ZBh
         fikVDSbx9wTdx5GADmfFVCl2IJyw5RL2/gZvbk9+pZZYffzNSc+W9EeTGi3FMxUdZqSl
         BoTUIeqAj3r4Efx0Uj5HFHUbJlebu/7xdzgBmhgEZymc6gUaiYbWvwRJETh4fhPDUp0n
         0IDW4WYx02/3jAjzn1PtRFikqEBaqg5HZOj7d488AofqudsW3L5qLNBE8Nwzr4toBDem
         r3pYo/RwImgWwiMZJ6RFMic83PsWXAEBUSmsx6TA3x9jIk8LZFND2/GccP7oThebgSCq
         p0Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hNUw4YRE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si2343451ios.91.2022.01.27.08.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 08:47:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hNUw4YRE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD7vR-0000ni-1q
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 11:47:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6bL-0008PF-Gn
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:22:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6bJ-0004Ne-LG
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:22:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wq2DgU0T8TiyoW+AeqpkEASJI3l+VWw2yOgyjpGNPwo=;
 b=hNUw4YRE7BfN5iGKervKBdJ1Pxh8pgWovFgPdVnDq0PqqvnQhVpqG7+yK5FVNvRCJCs0dc
 4kpU17iMSE+ApCRsszc0Yt6Phy+Ct2MCfwqjFovT6hDkZzGE+vCm+GvYV9ZQB5xuNDzgE7
 kN0lHIOUqLVpM51Tyb5WGdP6l3n0dsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-Od9umRfTMvSEE8XdlFWZ4Q-1; Thu, 27 Jan 2022 10:22:14 -0500
X-MC-Unique: Od9umRfTMvSEE8XdlFWZ4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AD2D8144E2;
 Thu, 27 Jan 2022 15:22:08 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AEF170D46;
 Thu, 27 Jan 2022 15:22:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/38] migration: Move temp page setup and cleanup into
 separate functions
Date: Thu, 27 Jan 2022 16:05:48 +0100
Message-Id: <20220127150548.20595-39-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
References: <20220127150548.20595-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: em5a3ZtUh+yF

From: Peter Xu <peterx@redhat.com>

Temp pages will need to grow if we want to have multiple channels for postcopy,
because each channel will need its own temp page to cache huge page data.

Before doing that, cleanup the related code.  No functional change intended.

Since at it, touch up the errno handling a little bit on the setup side.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/postcopy-ram.c | 82 +++++++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 31 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 2176ed68a5..e662dd05cc 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -523,6 +523,19 @@ int postcopy_ram_incoming_init(MigrationIncomingState *mis)
     return 0;
 }
 
+static void postcopy_temp_pages_cleanup(MigrationIncomingState *mis)
+{
+    if (mis->postcopy_tmp_page) {
+        munmap(mis->postcopy_tmp_page, mis->largest_page_size);
+        mis->postcopy_tmp_page = NULL;
+    }
+
+    if (mis->postcopy_tmp_zero_page) {
+        munmap(mis->postcopy_tmp_zero_page, mis->largest_page_size);
+        mis->postcopy_tmp_zero_page = NULL;
+    }
+}
+
 /*
  * At the end of a migration where postcopy_ram_incoming_init was called.
  */
@@ -564,14 +577,8 @@ int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
         }
     }
 
-    if (mis->postcopy_tmp_page) {
-        munmap(mis->postcopy_tmp_page, mis->largest_page_size);
-        mis->postcopy_tmp_page = NULL;
-    }
-    if (mis->postcopy_tmp_zero_page) {
-        munmap(mis->postcopy_tmp_zero_page, mis->largest_page_size);
-        mis->postcopy_tmp_zero_page = NULL;
-    }
+    postcopy_temp_pages_cleanup(mis);
+
     trace_postcopy_ram_incoming_cleanup_blocktime(
             get_postcopy_total_blocktime());
 
@@ -1082,6 +1089,40 @@ retry:
     return NULL;
 }
 
+static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
+{
+    int err;
+
+    mis->postcopy_tmp_page = mmap(NULL, mis->largest_page_size,
+                                  PROT_READ | PROT_WRITE,
+                                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    if (mis->postcopy_tmp_page == MAP_FAILED) {
+        err = errno;
+        mis->postcopy_tmp_page = NULL;
+        error_report("%s: Failed to map postcopy_tmp_page %s",
+                     __func__, strerror(err));
+        return -err;
+    }
+
+    /*
+     * Map large zero page when kernel can't use UFFDIO_ZEROPAGE for hugepages
+     */
+    mis->postcopy_tmp_zero_page = mmap(NULL, mis->largest_page_size,
+                                       PROT_READ | PROT_WRITE,
+                                       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    if (mis->postcopy_tmp_zero_page == MAP_FAILED) {
+        err = errno;
+        mis->postcopy_tmp_zero_page = NULL;
+        error_report("%s: Failed to map large zero page %s",
+                     __func__, strerror(err));
+        return -err;
+    }
+
+    memset(mis->postcopy_tmp_zero_page, '\0', mis->largest_page_size);
+
+    return 0;
+}
+
 int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
     /* Open the fd for the kernel to give us userfaults */
@@ -1122,32 +1163,11 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
         return -1;
     }
 
-    mis->postcopy_tmp_page = mmap(NULL, mis->largest_page_size,
-                                  PROT_READ | PROT_WRITE, MAP_PRIVATE |
-                                  MAP_ANONYMOUS, -1, 0);
-    if (mis->postcopy_tmp_page == MAP_FAILED) {
-        mis->postcopy_tmp_page = NULL;
-        error_report("%s: Failed to map postcopy_tmp_page %s",
-                     __func__, strerror(errno));
+    if (postcopy_temp_pages_setup(mis)) {
+        /* Error dumped in the sub-function */
         return -1;
     }
 
-    /*
-     * Map large zero page when kernel can't use UFFDIO_ZEROPAGE for hugepages
-     */
-    mis->postcopy_tmp_zero_page = mmap(NULL, mis->largest_page_size,
-                                       PROT_READ | PROT_WRITE,
-                                       MAP_PRIVATE | MAP_ANONYMOUS,
-                                       -1, 0);
-    if (mis->postcopy_tmp_zero_page == MAP_FAILED) {
-        int e = errno;
-        mis->postcopy_tmp_zero_page = NULL;
-        error_report("%s: Failed to map large zero page %s",
-                     __func__, strerror(e));
-        return -e;
-    }
-    memset(mis->postcopy_tmp_zero_page, '\0', mis->largest_page_size);
-
     trace_postcopy_ram_enable_notify();
 
     return 0;
-- 
2.34.1


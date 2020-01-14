Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5273865lff;
        Tue, 14 Jan 2020 01:34:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqyTTdwqibV/YHT/eBrsQI7FpN9Z/9r1qtw1AblF9LupSqb5YyC45HkIrGa7KuDow5Gae2sI
X-Received: by 2002:a0c:edc2:: with SMTP id i2mr20070631qvr.62.1578994448174;
        Tue, 14 Jan 2020 01:34:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578994448; cv=none;
        d=google.com; s=arc-20160816;
        b=sIh7uE+YmQ/GnqAvY0CIy52foqAmhb6OsCK6uReatyWJIJIeVau9sn2NE3gar6Hz/5
         mxOmd8QgseiuzBraN3+Fh+4QruLPj8NlOGmaCepHuULKojBUkqoHQfAvFcdddCGVZ9in
         On7dwBSyoVcA+MoPqkFsbfwNjOOTTKOFGcVUoVQAP9Ud5La4P8iCQHkuwcN1dSdTmaPy
         MM5AQFkJp9S4hFE73ClsB7IM7AOTYqJjjzcUhNNG/DL/yoSZxHgDf4qRr/cBBYm19dGE
         yOXyin7CZ++5h3rQvJXNwqBTGhHdZRRWAv1cXphC0NjO0FQJ8gncpXA51GaA/P9IKsjD
         NG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1X5yO7SYwJyW5YJ1Ti/f3xeheBlw3XFdVPw3SMbN8dw=;
        b=h/0YG/9QJBbYRyU4kWr5Tq/aJWiaGxXbxWExoUq8GzfnONiqdUbeBkZ2OWfU+ewQk8
         Z+RiklVP6fEZuPnjf09KwgzkOHOS/vlOdTBDnGmN1zWpLG/nsZDE2JAPaNRTJaOUwK0K
         qiPje+tzT6yG5XJIMG3+MGfHxprq8pTPLMr+1AztX+kvmP6uxfGVrN1x8dm5ZdOhOQCu
         PAmUPKwDduUXttLjC1eiv0XtKAD2HrwchXyEigL1FNmxt9UR/vzu7Zd8lOC3ReLOXS3e
         2N2eDLH9RWi1dljRsYrZLRCCUsN3dtPB/hE9lN1v/UHJJ6XOpmoUhZglmI6LQeIuT61a
         M1Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="GFh/uk01";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z41si7655464qtb.134.2020.01.14.01.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 01:34:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="GFh/uk01";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irIaM-0005XC-Rc
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 04:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57365)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irITb-0005SK-Av
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:27:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irITa-0006RN-0x
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:27:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45789
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irITZ-0006R0-TX
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1X5yO7SYwJyW5YJ1Ti/f3xeheBlw3XFdVPw3SMbN8dw=;
 b=GFh/uk01OY5cb4cPbThB9Xyywf84WcGlJUI1tr9c2qbA/8p7XUDAmsITgTWkXJ3LH0Yysn
 BfeSHqR6u7rauGyKou7BLt1D2oD/MqcC/YGcxFuVJgR0cW7pshA5IKn94rEYQUpqNvz/X2
 plicxTsXKP7hiC/bE9rwUTTNUQFjrIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-L3ND0_gYOp6ftbKX6R9esg-1; Tue, 14 Jan 2020 04:27:03 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05055800A02;
 Tue, 14 Jan 2020 09:27:02 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DB29384;
 Tue, 14 Jan 2020 09:26:57 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/29] ram.c: remove unneeded labels
Date: Tue, 14 Jan 2020 10:25:44 +0100
Message-Id: <20200114092606.1761-8-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
References: <20200114092606.1761-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: L3ND0_gYOp6ftbKX6R9esg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BJFbYReRJFDV

From: Daniel Henrique Barboza <danielhb413@gmail.com>

ram_save_queue_pages() has an 'err' label that can be replaced by
'return -1' instead.

Same thing with ram_discard_range(), and in this case we can also
get rid of the 'ret' variable and return either '-1' on error
or the result of ram_block_discard_range().

CC: Juan Quintela <quintela@redhat.com>
CC: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index f946282adb..17cd8d524b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2459,7 +2459,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr=
_t start, ram_addr_t len)
              * it's the 1st request.
              */
             error_report("ram_save_queue_pages no previous block");
-            goto err;
+            return -1;
         }
     } else {
         ramblock =3D qemu_ram_block_by_name(rbname);
@@ -2467,7 +2467,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr=
_t start, ram_addr_t len)
         if (!ramblock) {
             /* We shouldn't be asked for a non-existent RAMBlock */
             error_report("ram_save_queue_pages no block '%s'", rbname);
-            goto err;
+            return -1;
         }
         rs->last_req_rb =3D ramblock;
     }
@@ -2476,7 +2476,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr=
_t start, ram_addr_t len)
         error_report("%s request overrun start=3D" RAM_ADDR_FMT " len=3D"
                      RAM_ADDR_FMT " blocklen=3D" RAM_ADDR_FMT,
                      __func__, start, len, ramblock->used_length);
-        goto err;
+        return -1;
     }
=20
     struct RAMSrcPageRequest *new_entry =3D
@@ -2492,9 +2492,6 @@ int ram_save_queue_pages(const char *rbname, ram_addr=
_t start, ram_addr_t len)
     qemu_mutex_unlock(&rs->src_page_req_mutex);
=20
     return 0;
-
-err:
-    return -1;
 }
=20
 static bool save_page_use_compression(RAMState *rs)
@@ -3097,8 +3094,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *=
ms)
  */
 int ram_discard_range(const char *rbname, uint64_t start, size_t length)
 {
-    int ret =3D -1;
-
     trace_ram_discard_range(rbname, start, length);
=20
     RCU_READ_LOCK_GUARD();
@@ -3106,7 +3101,7 @@ int ram_discard_range(const char *rbname, uint64_t st=
art, size_t length)
=20
     if (!rb) {
         error_report("ram_discard_range: Failed to find block '%s'", rbnam=
e);
-        goto err;
+        return -1;
     }
=20
     /*
@@ -3118,10 +3113,7 @@ int ram_discard_range(const char *rbname, uint64_t s=
tart, size_t length)
                      length >> qemu_target_page_bits());
     }
=20
-    ret =3D ram_block_discard_range(rb, start, length);
-
-err:
-    return ret;
+    return ram_block_discard_range(rb, start, length);
 }
=20
 /*
--=20
2.24.1


Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp991733lff;
        Fri, 10 Jan 2020 09:39:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqyE5qr0kh7tT9XMl7gpAf5LfgxNG8Jc0e2DX/fEFKNC2BgqAcZhXkgmAnvrg0B7LQ8Jt/LD
X-Received: by 2002:aa7:c751:: with SMTP id c17mr4728480eds.293.1578677970741;
        Fri, 10 Jan 2020 09:39:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578677970; cv=none;
        d=google.com; s=arc-20160816;
        b=FpYZCnXAWHPLrjkCVVMK6xc6dOp6qs94HErX3q++8Pg4fy27kJuT0Y8EkkDmqLb2vR
         vXp5YIHVtYMOjZTp41UR4kyTaB2b1sfghUJzrVjeb3/8cSgdzlFfmDfsnww+X6YxwaOO
         b0QlhlIY1vms6kXEqBjvaK88YxPKdkKndBHrqsn8G7ot6raPR00SOAbV2luChuPbZ9a0
         U5d4H2NKTl4sG7sV9tLy2W2cfij2dSbK4u8F8SashTsogRExqCF6fot/4fBhwbs8G3xL
         Hml8FpUbaarFVc9cj7DGjPIbOqFfRxIY7PK/W0VVlo5m0TMPaFnwtySGVAvLfJp8YNIJ
         ULXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mnI/sbCMOcA0SZwWKL8BtRU3qflUGbMDQizc7NKUMq8=;
        b=tDq3tpBqt1R9ge5yNBPHasDM3CZD96wz7nBNNaBWiPNIjr9yzbq3QVGAlh1gY8/U9K
         kn7UKqeXctLBVN5OjT+DyFA+8likd/SLi9i606sFjEzO4gRUAE86DE6YoPP5HfF26FIS
         +kS3fdmlnYijNhSmGPHYeUw3OLpQMFD9IPCHJv9gFIjjOiOOIIhNaWh3lIXyO6LUKqFe
         TfKM14E6GSZg++nNetlqdTCV2LQK9+YBNJ2qLoRRk4h//a01qgl9SAmWEOfFiYmUmHXn
         Ms8S8fZZu8P+dGChjMPSJbHrkczFkRieKbVUYGMRmYJQW41Y3T1qk1h3DEKh+Kvrr7ze
         5jZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PGPPSsw2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si1775640ejq.412.2020.01.10.09.39.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 09:39:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PGPPSsw2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipyFt-0003IL-By
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 12:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipy9s-0003lk-3t
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:33:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipy9q-0001fp-RP
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:33:15 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37249
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipy9q-0001el-NT
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:33:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578677594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mnI/sbCMOcA0SZwWKL8BtRU3qflUGbMDQizc7NKUMq8=;
 b=PGPPSsw2/NmKNnfd78LyyvOnl3G8WjXGYYRFEzCOKNGqAFml4ENTXedDsglz01Q49B8Zz5
 1z5gOggUMpOsu2H5KUn2zaoo7hLmRPxNmp82naV2IbvITNN9/0C5PnhKdgAFPD5UZo1Jxr
 loAlh1FxE92gQlHhfqYjYKcmmp7rBOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-rC9xlEHPMdCqfN11ClQ1tg-1; Fri, 10 Jan 2020 12:33:12 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0BC21800D71;
 Fri, 10 Jan 2020 17:33:10 +0000 (UTC)
Received: from secure.mitica (ovpn-116-240.ams2.redhat.com [10.36.116.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A298B19C4F;
 Fri, 10 Jan 2020 17:33:03 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/28] ram.c: remove unneeded labels
Date: Fri, 10 Jan 2020 18:31:53 +0100
Message-Id: <20200110173215.3865-7-quintela@redhat.com>
In-Reply-To: <20200110173215.3865-1-quintela@redhat.com>
References: <20200110173215.3865-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: rC9xlEHPMdCqfN11ClQ1tg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: of5pZ4XjxT2s

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
index 6e678dbd2e..733aee61e3 100644
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


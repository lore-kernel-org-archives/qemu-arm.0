Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5396064lff;
        Tue, 14 Jan 2020 03:43:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqxmaoXmUfFCgagO2HV+2kkAeyS3qrbsYV6kMdv+2DuAas4gypWZwdhxx+RLfSoV10tnO2wf
X-Received: by 2002:a17:906:7d17:: with SMTP id u23mr22458810ejo.318.1579002180429;
        Tue, 14 Jan 2020 03:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579002180; cv=none;
        d=google.com; s=arc-20160816;
        b=o1uo/Lma0AyMmC+uUrrch6O5QDXzgjLH9ukfHTN4L2VRd0nsyQPs1kc08YRAl6Wr2T
         pODlpFWAN+4yKq4B2E77SXKh5VCV75XTxF/a1SSY/VO9AepiPMWo4qDm8bHad136XKbW
         HR/h65EE3bq74j4EhWrWUBltxW1b9qBups8YsAXL0Mp9zHs91qcMIILLQeCqSkpdiLmX
         2MdB2Hqr28/cg0TU7Zeqi6fbSgs99jfQTt5gJQhfW59NKkaIERA99URT8lPEFN5jvkcD
         /ecW+INnaqhH3E7tA7yM3jVXOWHB1YRi5Epvd7srJYaWhSKVBGz6ouujdzdoIOMjZOyw
         Whdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1X5yO7SYwJyW5YJ1Ti/f3xeheBlw3XFdVPw3SMbN8dw=;
        b=w1IbgeECKubsp8DsBREAL9Jk59WNES5S+B2GDLWb8wl8roA0GaQTXYIaaAl8pJQ2pb
         KjdV00xhzNGV0WFXMuCNnJvwBVrYZefiVVR6vGVtgT1pIYPdlB+GAmM2f+Tm3iWHkW/V
         5FtJbFSDRpFWiUht/dG6GUIuJSlkDh7crLMWF15fIEBwdGEM/RWt1bD5qtsA9NegBaic
         3HGWr5nboonNj+oIvVc2lMHAKBrWjfXdxKMaSxiWIa5UN8hb6ZwgQLwYn2ZACCbyJI0n
         SWO7BvN9zMmbNLFlnXblZSA5NdTxuwrk1EHBbgzOWDV5T4NmlXNjBvBFr3vt+ednbiE/
         iGig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SpcuTk2v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ly24si9836862ejb.42.2020.01.14.03.43.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:43:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SpcuTk2v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKb4-0007mh-R4
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKYn-0005GU-FH
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:40:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKYi-0002yS-RM
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:40:37 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:32167
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKYi-0002y4-Nk
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579002032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1X5yO7SYwJyW5YJ1Ti/f3xeheBlw3XFdVPw3SMbN8dw=;
 b=SpcuTk2vJkZtWMynS/GwGS/ETdNomsF4DmFBlYrzAi+FbuArHFiL+iH1eeCyZkMaSTcckk
 p99OvXG9yXb8lNiyzTc0WKLf35UQCGMRfgdME4hHe3vOPAz41NMF1HBPDZBiD15yFZJAmb
 jgCPAH2gPvjvVwXsMwmSq+ruFLk0xJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-H6fCyE4cObKkJbtCXGEghg-1; Tue, 14 Jan 2020 06:40:28 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4BB51800D48;
 Tue, 14 Jan 2020 11:40:26 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BBE05DA32;
 Tue, 14 Jan 2020 11:40:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/30] ram.c: remove unneeded labels
Date: Tue, 14 Jan 2020 12:39:03 +0100
Message-Id: <20200114113926.3556-8-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: H6fCyE4cObKkJbtCXGEghg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sz51fI+PEBcG

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


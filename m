Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5471521lff;
        Tue, 14 Jan 2020 04:58:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqykfW92v3WdqFZcSImEY2z+hQEoxXwO7VB5CPl93UCxgqk3m/SZk86/2d2OE4ui5X9ilp2F
X-Received: by 2002:a05:620a:6db:: with SMTP id 27mr21032627qky.453.1579006688236;
        Tue, 14 Jan 2020 04:58:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579006688; cv=none;
        d=google.com; s=arc-20160816;
        b=nSuDLfbmjl9+wjqjdeihp3zyDr4D6eysb17MoQ2n0AKtVlMb+F2+nE1ZDj8Dxv6nJo
         gKLcoLwRW0sFT+POqlL4+5awhmqIR3bY7F/ovcBRFFcPruIw+S8Ci9H+ny0p3vdHaabz
         v4MZ1yPOSH/VHpHB6DHiCTXZcqcqujnRBHOpKMyB1j3zN6znCunEgkhzQqR1/LVRNi3C
         mBo/4A4nTTfo0Zxr661e+Gl1RZKlzZAV5CPY3poU+At3rsfC5KYLvmH1y1l8FscnDdI0
         GNlwoq9iOGhTavXjuyJjD6I6aNGHfRI4HDy47w5GDCJsbyErCVlJO8epehfAL8ZSL2bs
         sAQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bIen48VEgN5ricZM78g+5CpDXy/43yfUT0QPLJh3txA=;
        b=NgUI1U2lKvk5XiFqE89HGraSW8w1dQDwAleR5HeDOPsn5eEdpt33EJKOkNaUJtBGLv
         nDAggXtP8DjzcJXXAKM4HoBKbIYNxuyAY1plW9KuQMLICrwu3TZ427zrKEnJ9bYZlkOc
         UuwwxycamPvQ8MlU4sormrfp5hJCJS1Pl21vN4bNAET21J2II42Jlp5XC7o2JY+JuxDT
         IOZOoWNelzBcJp2f6v/FYwP0at2QR3yGCXbQNH3ZVyGrmIy0S6NVlR9EFJ4TZ0OMpYJP
         +VfU3RApousPsyug/p+E3/QHN6aBQND6TMGpNoN2lkg/6yVGDvtK/nPGspieNtr8Csf9
         wi1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dsJ4wAN3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e29si8527268qka.97.2020.01.14.04.58.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 04:58:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dsJ4wAN3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irLln-00063e-9N
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 07:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irLiH-00023j-DQ
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:54:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irLiD-0001ak-Ct
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:54:29 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20957
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irLiD-0001aa-9F
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579006464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bIen48VEgN5ricZM78g+5CpDXy/43yfUT0QPLJh3txA=;
 b=dsJ4wAN3KBOgvrlTKrFDNGy5/69eQNkkG+6zfBdImqN9fKvsX1oFU62cWNwwzPGAoL9YcU
 kcwjmMCGnrQPoEyaDdc36rgnyDTcqUvGSftowYi98OURFkw1aRfMLOVZJoLgpsNZTryvq8
 1Axmhbuoei1oIHIyEX0UCE6bnHJo6J8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141--GQXRzP1PRK-4_Xq5DoynQ-1; Tue, 14 Jan 2020 07:54:21 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6D39800A02;
 Tue, 14 Jan 2020 12:54:18 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04F745D9E5;
 Tue, 14 Jan 2020 12:54:11 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/30] ram.c: remove unneeded labels
Date: Tue, 14 Jan 2020 13:52:32 +0100
Message-Id: <20200114125254.4515-9-quintela@redhat.com>
In-Reply-To: <20200114125254.4515-1-quintela@redhat.com>
References: <20200114125254.4515-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: -GQXRzP1PRK-4_Xq5DoynQ-1
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MWYuaxx/XIK+

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
index 39e7b922ff..825f47f517 100644
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


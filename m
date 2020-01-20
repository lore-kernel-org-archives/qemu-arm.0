Received: by 2002:a0c:cd0f:0:0:0:0:0 with SMTP id b15csp2737058qvm;
        Mon, 20 Jan 2020 02:49:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwr5FG7r03SJMswHscC8TaVu7YdL6B66M0liavhHYW1F1yV6Cpr7awGvrVjshiF6C28c6NH
X-Received: by 2002:a17:906:648a:: with SMTP id e10mr19628478ejm.265.1579517384113;
        Mon, 20 Jan 2020 02:49:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579517384; cv=none;
        d=google.com; s=arc-20160816;
        b=yAd4CBouFpgSOOz/Zt3EO+5/1xQ7ommjOUcdW8QwZ0tXXftiXWn/EwCljNqbZncW1D
         IgX/Oc+Yl9XKUYIpn1mIelzD5soFUr3Yz5rr1rkzWaPQfAcLCt20kJC5mRsZqxBqV2CI
         OCp+bleYmZm7mz447WEQQDQ17pI+MCsB480//mUnvCS6tVAa6PP2zE0q0EvsVahVH6bR
         rC9BDrtj2x020L+dLPvD5zpBrrskJsd1FXske2+8ti4xlgTHF+S8p8COoVkT6cphPp8v
         kvuV3R9PGzQ3kRhdQA0OCe3wxzKDc3ALElyXdUiPYYSEVhQHGbi4FecxTeq8FVGB9N98
         AK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vDvHDxz9hAL4AO2gd4dbSYpFgNTjSG2GxTAeEZIJRq0=;
        b=Oe+BRiR/uCWmlT3PzFvSbKFhhxsAHEGHapNxxi85ZNxnQUl8h+IOnqjDRaytjzAew4
         AjJMdDBLLagYekAAvXb8zO4Va5a5vHFAq6Du2zMk2fuko7sStxS2SbkhYTD/2yXlVPqm
         jID9b5CLpiG5u1MlRxbplBFnN6zebdNOAePwB5PMoAX1gu/NkVjF5UHSVWY53GOm8hOB
         +HxuzeIIWWftirQOsX9j8W3HYNn6nCZgI81wzuoQmpNUnBDc6gAiCEiBJ700+SITRElS
         OdQdagcGSHFqB+uSmtPmBYHQbTaQ5IKkql2NISpvMgFQqPxaxzXQ4eTbf6VbV+esCgVd
         7D3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OA7uc2xK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14si21079299edq.471.2020.01.20.02.49.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 02:49:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OA7uc2xK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itUco-0006st-Fy
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 05:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37872)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itUPy-0006Q7-Jg
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:36:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itUPu-0002jh-RZ
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:36:26 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52902
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itUPu-0002jL-ON
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:36:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDvHDxz9hAL4AO2gd4dbSYpFgNTjSG2GxTAeEZIJRq0=;
 b=OA7uc2xKQ7gJmm/9XO2RVaBL0zOntBufOSHb6xmq2ZfRMxpCKWK+8EdGn3rjdl5LKBzYlN
 pNwmUnYRrc81cv6qGrNVE9F9/mTZQ7CEGV/G0xPa7WFMMVpOBdvr/zuKqjWs9w1mw1GYCj
 jZrpB/EKhTGJ2mFHpUuOh7XEiKTPUb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-ghxPd0-2NzOZVB1BHy2vjw-1; Mon, 20 Jan 2020 05:36:18 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7D8C2F61;
 Mon, 20 Jan 2020 10:36:16 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A0431BC6D;
 Mon, 20 Jan 2020 10:36:12 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/29] migration/postcopy: count target page number to decide
 the place_needed
Date: Mon, 20 Jan 2020 11:33:27 +0100
Message-Id: <20200120103340.25118-17-quintela@redhat.com>
In-Reply-To: <20200120103340.25118-1-quintela@redhat.com>
References: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: ghxPd0-2NzOZVB1BHy2vjw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TF5DWAqfJRGO

From: Wei Yang <richardw.yang@linux.intel.com>

In postcopy, it requires to place whole host page instead of target
page.

Currently, it relies on the page offset to decide whether this is the
last target page. We also can count the target page number during the
iteration. When the number of target page equals
(host page size / target page size), this means it is the last target
page in the host page.

This is a preparation for non-ordered target page transmission.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index c13b44b4d9..8ebaea255e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4052,6 +4052,7 @@ static int ram_load_postcopy(QEMUFile *f)
     void *postcopy_host_page =3D mis->postcopy_tmp_page;
     void *last_host =3D NULL;
     bool all_zero =3D false;
+    int target_pages =3D 0;
=20
     while (!ret && !(flags & RAM_SAVE_FLAG_EOS)) {
         ram_addr_t addr;
@@ -4086,6 +4087,7 @@ static int ram_load_postcopy(QEMUFile *f)
                 ret =3D -EINVAL;
                 break;
             }
+            target_pages++;
             matches_target_page_size =3D block->page_size =3D=3D TARGET_PA=
GE_SIZE;
             /*
              * Postcopy requires that we place whole host pages atomically=
;
@@ -4117,8 +4119,10 @@ static int ram_load_postcopy(QEMUFile *f)
              * If it's the last part of a host page then we place the host
              * page
              */
-            place_needed =3D (((uintptr_t)host + TARGET_PAGE_SIZE) &
-                                     (block->page_size - 1)) =3D=3D 0;
+            if (target_pages =3D=3D (block->page_size / TARGET_PAGE_SIZE))=
 {
+                place_needed =3D true;
+                target_pages =3D 0;
+            }
             place_source =3D postcopy_host_page;
         }
         last_host =3D host;
--=20
2.24.1


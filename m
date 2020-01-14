Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5280908lff;
        Tue, 14 Jan 2020 01:41:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqySKoG+BfkKJmFRmNf7PADB9Ud/97Nu6fqV8kCuiEBkXHdV74Yze84+kz5eQG2PFgFSDQF7
X-Received: by 2002:a50:ed11:: with SMTP id j17mr4112386eds.38.1578994913445;
        Tue, 14 Jan 2020 01:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578994913; cv=none;
        d=google.com; s=arc-20160816;
        b=rHLcEuK2GRFejwDDPvYSP6Zqo/AJZwGoM2JKkpDY5pZx9KR0UMf6KPyxj+fuUTsxin
         KUUGfnp4cnDv1+6gcNRiAQZdT8lQ6JFOdH6zrHU7/MJGuV882szv70XZ5wbUSL5KbUvI
         YLQdrSyYmosbcYEEAofJkZqjQi4/et7/h7grUSAk6ldg1w3fUQ86R5x6rHw1kNksw7kv
         gYSCzrwDUtFN3bL7Vjulk1b3LxCt7woKZKG1VmsOZjavYZGplUUDwIO3yqmaw8Hjx6P5
         W213e5j13iZWCdxbvOHcJ2/k8VUETRIoQYa8FNClGutC1qVXFqs4rn14QyGELOClPRbk
         x0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vDvHDxz9hAL4AO2gd4dbSYpFgNTjSG2GxTAeEZIJRq0=;
        b=JTybG4OMwqizDOnM5Nah7ifYJwWmYB1tCq/DrHfK76EpMZaQrwirrMT02ha/CNchQ8
         NtkOoCEjt6+Pft8iOloA5BGoXDMsSBDp3b/DDxMzf1nU5FAjgkbKaYoe0ZwiKqetMeJr
         lZsWF4WIkV43kN9nB6M9IC65fi3T6rxerIHYi4KofLi8gsxwNb/2VavhCp4IPhcKX1sX
         sLpjAXMxZaggyLJWkbMpp58YoILqiKo9xIkOVCXd4krP4DkmF52rIvQoq/VVAloySTKi
         LpesS4c83fCBMP3kdWCBdlRjU1UqqsTLMpZ9CI0FTjMSPJjl6gPVqJClHF4SkoahWK8Y
         QkWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dc1HxBcD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si8898417edq.10.2020.01.14.01.41.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 01:41:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dc1HxBcD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irIhs-0007pD-2K
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 04:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57882)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irIUz-0007V9-Vl
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:28:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irIUy-0006kE-NK
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:28:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56544
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irIUy-0006js-KF
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:28:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDvHDxz9hAL4AO2gd4dbSYpFgNTjSG2GxTAeEZIJRq0=;
 b=Dc1HxBcDij8ZBt1KPHARIyfX4jjS46I9CS60gKbF6+nBVh+6/QBoZpqn3BqopmkNRvPd6K
 LsrVuVhYF/f+wrHDU48vlz5W1Ka/Jguu0tQQ+2G5bjP1ZLidSAKrr26E/uA/Ay23Mk2ITB
 ba1KPOEVNw+xEIUbCMZ55mI4pxiCc1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-kGEM5DgNNVuxl78Qq2SNEw-1; Tue, 14 Jan 2020 04:28:25 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0586B1951260;
 Tue, 14 Jan 2020 09:28:24 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1BC726182;
 Tue, 14 Jan 2020 09:28:14 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/29] migration/postcopy: count target page number to decide
 the place_needed
Date: Tue, 14 Jan 2020 10:25:54 +0100
Message-Id: <20200114092606.1761-18-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
References: <20200114092606.1761-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: kGEM5DgNNVuxl78Qq2SNEw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: npALmYFb+1Mg

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


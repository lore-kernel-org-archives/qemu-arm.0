Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5501717lff;
        Tue, 14 Jan 2020 05:23:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXW6qzRp/+wM3dHRHtcI261RGufPnH6DfEK2T4jG7SH2n2ulcQR+Dk39aePjYSBAwq+MaV
X-Received: by 2002:a37:ae07:: with SMTP id x7mr21420392qke.28.1579008201373;
        Tue, 14 Jan 2020 05:23:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579008201; cv=none;
        d=google.com; s=arc-20160816;
        b=Uv6kKVK0SDLBKtP3MTH911uj67s0Brm58O/oMuBeMnBwm+kjUpRQjrnOyRBvlX6ZLS
         kYTKxWmaufGHm34kLXDuERNX2OePsD8wcTBzZn0dxc+K5VlH2KtKvjBLTY3mXS11AxWy
         mLDmG039+E458P8TazlPPNh+cwoFBCByt3rW1XaKDExe5HIt4sAX7eA+9zfWvBpbf9tL
         gw/DkFplxHCU+m1akM+XOyG7VIo3UKFGbwcoRrzt6lfTHhPL7EeoMgxZrlDE6f5uDSoh
         TrFNIziZkfou9gKjOqdVRzewN9BQGgOZslu8DwYk/VPih8ONK2ghDh+xNjSrESdoUssw
         7Agw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WKNiJnjAFJa2vhNGxGRB9XZG1JZ0UkZB55Yk7BZwoSE=;
        b=o05fkIcEy6dywLcXOw8N2lSMPQRqurZEX78CQVxlHbkiQekxaku2032fSJZgZeoC37
         tbv1/un8S/588c1Iysn0we+GPKhtPyqdvEvOkragu65tb/dp5lzH6/eNOqw7OmTfZB3y
         DN/XFrjmIEPj7aV0XNhK18061nYnl1VaIb1o19/PpGXR2Biw+iqvBdMgp/PeuwjJWNa7
         x7N/CEO1zMeQNxNaYc7QPqxfltN1MJ3Ej1Xc9wJ70agj74chvIU6e4AfmONPsuix1PP2
         UQTIID1skmSZ5HVVPd4VKlvRGwJN0eCw+AD2BAGxrvDnp+M4VEXFspbcGZ6XrBVBSjdU
         tKwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TDUylQMH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21si7762897qtj.96.2020.01.14.05.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 05:23:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TDUylQMH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irMAC-0005KM-HC
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 08:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41630)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irLk2-0003sn-6j
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:56:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irLjy-0002Cq-FW
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:56:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23167
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irLjv-0002CU-F9
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579006571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WKNiJnjAFJa2vhNGxGRB9XZG1JZ0UkZB55Yk7BZwoSE=;
 b=TDUylQMHJLcEHDBtBH11iMbmbHUTOFW2d1jlt2uGxIGlhKuvp1BDoh4EBj8Kxb91Cd/y9q
 /xNm174O/CjzvIafh3a87imgFEwzWyIBmv0DJUC9PdLCW4Tg7e9+PK5hPYJRspOoKV2u9+
 5ncJaPvGpppGY1XGyCS52MRUdsYXWlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-Ktts2onxOGG8-Gr9j2VFlw-1; Tue, 14 Jan 2020 07:56:09 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E01C107ACCC;
 Tue, 14 Jan 2020 12:56:07 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 853E55D9E5;
 Tue, 14 Jan 2020 12:55:54 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/30] migration/multifd: clean pages after filling packet
Date: Tue, 14 Jan 2020 13:52:46 +0100
Message-Id: <20200114125254.4515-23-quintela@redhat.com>
In-Reply-To: <20200114125254.4515-1-quintela@redhat.com>
References: <20200114125254.4515-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Ktts2onxOGG8-Gr9j2VFlw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nBRlbm6od0L3

From: Wei Yang <richardw.yang@linux.intel.com>

This is a preparation for the next patch:

    not use multifd during postcopy.

Without enabling postcopy, everything looks good. While after enabling
postcopy, migration may fail even not use multifd during postcopy. The
reason is the pages is not properly cleared and *old* target page will
continue to be transferred.

After clean pages, migration succeeds.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index fd1155f735..561961ef24 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -955,10 +955,10 @@ static int multifd_send_pages(RAMState *rs)
         }
         qemu_mutex_unlock(&p->mutex);
     }
-    p->pages->used =3D 0;
+    assert(!p->pages->used);
+    assert(!p->pages->block);
=20
     p->packet_num =3D multifd_send_state->packet_num++;
-    p->pages->block =3D NULL;
     multifd_send_state->pages =3D p->pages;
     p->pages =3D pages;
     transferred =3D ((uint64_t) pages->used) * TARGET_PAGE_SIZE + p->packe=
t_len;
@@ -1154,6 +1154,8 @@ static void *multifd_send_thread(void *opaque)
             p->flags =3D 0;
             p->num_packets++;
             p->num_pages +=3D used;
+            p->pages->used =3D 0;
+            p->pages->block =3D NULL;
             qemu_mutex_unlock(&p->mutex);
=20
             trace_multifd_send(p->id, packet_num, used, flags,
--=20
2.24.1


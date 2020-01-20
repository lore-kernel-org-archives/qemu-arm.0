Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp63260lfp;
        Mon, 20 Jan 2020 03:06:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqzI7vMA2t2Jo8WJYVfIquBqI17JTWSImOhxUQ9M1lMf4aHzQOqR2NnOr7TuaZONXz9dC8xw
X-Received: by 2002:a37:b402:: with SMTP id d2mr49054258qkf.195.1579518394587;
        Mon, 20 Jan 2020 03:06:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579518394; cv=none;
        d=google.com; s=arc-20160816;
        b=X/cg9ETf27BRp2/Sn4ZEdmUIzOjIANiRXwZC53nSZJc6/6Yih4vhd1KenLgqZPPQwC
         /LQtE08gSGujPRGsJS+6ZWvZyQCGtX2Ay7aCKXPKF04hQa7vWETKfPc1/MNCEvRIMZkx
         W23Vogjx5xoyZfzQkz0mMVwx+pFm086iUISed3GQnAgdJeFh6yvrY7cNWf+UoXtyLBKZ
         48HuOkW4UflQJp/2LBqrbC0fOx6N6cVyzotGUD1l39ReIvhOshO8JFb74OUwR+RGE73D
         3rpnSZwXlDmIR5nO82vnhAqHHJE10oVH8kAJ1DhdWeNjIhj7G9yunXpnKRB3uIptvA1Z
         WFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2kN2SVoPx8AG8bWLkP/5pV/dMcwghV+OE39B65cCmDk=;
        b=RYIe7TD9c2y0HUyMg6oQU0p2bQlZmLHO2LVwa02Vj0R2pF8Vgfv0vArxDIUTq4Jnm4
         CW7860hdTTm1SaDa/h5RBmqTJNWFNKbLV899sm7ujMZiJN6FMSumrwRTukg2WcUWWq0k
         LQ8ISdDYPVD4YoQxKt159VV9eMqXAcdgVLHhzM7tP6JcsWg/bd5wtbGju5i2U7JQihZU
         kVlYSG3aOSNXTs0qNgbwmRFrvunOxiVpe3lnNMeh7jWy93XAP0VLmrjZECSoHgJFM6Oq
         A7+B26XRppJM9YPp63VUeXUfRCh2Q6eltxKb7qUtYTlz/LyST+GkcuGy4wTk+bcQRTtX
         lfvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WYqlJuS9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si20672250qkg.62.2020.01.20.03.06.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 03:06:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WYqlJuS9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itUt7-0004WS-E6
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 06:06:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38425)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itURU-0000Ln-9M
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:38:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itURS-0003RV-6f
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:38:00 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33313
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itURS-0003RP-2s
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2kN2SVoPx8AG8bWLkP/5pV/dMcwghV+OE39B65cCmDk=;
 b=WYqlJuS9nOKhjOKtl17jc2njHNgWyYn4eiiExLkOdlDk2GRBkwlRWjh6TdpoHS48QXGpw4
 wiafM9CpWP+5OTdcrmsOe2CiG4kjJDuTepTCiwFk1ws4W8Vtwrm312FKdFemFAE7TT2x8t
 f/KF7pG8O3bo8Gn9MBXdUJ+i5ABOtVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-QQxRjkBYMYGjylSTTr0h_g-1; Mon, 20 Jan 2020 05:37:56 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1FE88C2F20;
 Mon, 20 Jan 2020 10:37:54 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2C971BC6D;
 Mon, 20 Jan 2020 10:37:42 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/29] multifd: Be consistent about using uint64_t
Date: Mon, 20 Jan 2020 11:33:40 +0100
Message-Id: <20200120103340.25118-30-quintela@redhat.com>
In-Reply-To: <20200120103340.25118-1-quintela@redhat.com>
References: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: QQxRjkBYMYGjylSTTr0h_g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uV1m6rOs2rn2

We transmit ram_addr_t always as uint64_t.  Be consistent in its
use (on 64bit system, it is always uint64_t problem is 32bits).

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index d0940387d1..d2208b5534 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -803,7 +803,10 @@ static void multifd_send_fill_packet(MultiFDSendParams=
 *p)
     }
=20
     for (i =3D 0; i < p->pages->used; i++) {
-        packet->offset[i] =3D cpu_to_be64(p->pages->offset[i]);
+        /* there are architectures where ram_addr_t is 32 bit */
+        uint64_t temp =3D p->pages->offset[i];
+
+        packet->offset[i] =3D cpu_to_be64(temp);
     }
 }
=20
@@ -877,10 +880,10 @@ static int multifd_recv_unfill_packet(MultiFDRecvPara=
ms *p, Error **errp)
     }
=20
     for (i =3D 0; i < p->pages->used; i++) {
-        ram_addr_t offset =3D be64_to_cpu(packet->offset[i]);
+        uint64_t offset =3D be64_to_cpu(packet->offset[i]);
=20
         if (offset > (block->used_length - TARGET_PAGE_SIZE)) {
-            error_setg(errp, "multifd: offset too long " RAM_ADDR_FMT
+            error_setg(errp, "multifd: offset too long %" PRIu64
                        " (max " RAM_ADDR_FMT ")",
                        offset, block->max_length);
             return -1;
@@ -1267,7 +1270,7 @@ int multifd_save_setup(void)
         p->id =3D i;
         p->pages =3D multifd_pages_init(page_count);
         p->packet_len =3D sizeof(MultiFDPacket_t)
-                      + sizeof(ram_addr_t) * page_count;
+                      + sizeof(uint64_t) * page_count;
         p->packet =3D g_malloc0(p->packet_len);
         p->packet->magic =3D cpu_to_be32(MULTIFD_MAGIC);
         p->packet->version =3D cpu_to_be32(MULTIFD_VERSION);
@@ -1484,7 +1487,7 @@ int multifd_load_setup(void)
         p->id =3D i;
         p->pages =3D multifd_pages_init(page_count);
         p->packet_len =3D sizeof(MultiFDPacket_t)
-                      + sizeof(ram_addr_t) * page_count;
+                      + sizeof(uint64_t) * page_count;
         p->packet =3D g_malloc0(p->packet_len);
         p->name =3D g_strdup_printf("multifdrecv_%d", i);
     }
--=20
2.24.1


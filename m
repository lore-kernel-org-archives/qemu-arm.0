Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5397608lff;
        Tue, 14 Jan 2020 03:44:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqzMrqRmcfzKb4ZxgJMnceGOi8zgejov9ct/QAktmIEQQBrMcjihpfofSnQbS8OwCdzPQEbI
X-Received: by 2002:ac8:4693:: with SMTP id g19mr3209506qto.295.1579002281466;
        Tue, 14 Jan 2020 03:44:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579002281; cv=none;
        d=google.com; s=arc-20160816;
        b=bMq5sZDWI/c8m+7BGxg9hs/3/cm3Z7Ns5IIaXEkQ1oamx+M/k3nabAtRe7Kv6+EqzA
         yPnRg9ASBlJHh7+LS0oYXZBP7Vuxrk+HzkdMma4AXHJXAJPOt3EnLnaR/AQs67KcGTvJ
         Milpk9GEL2xqaYcVIgQfk4Z5QGCB03y3me1uRnebnUTIis7Ovpx/4a4ZF+EHh7rT7p7R
         3d/ELlk8kd5P9UUhNzluODrsCW4w0LdrAomWbZys3/2pZ8DQ+YXX+vAxwwVx767SKO2D
         0xkR0SY8wp46xfD+9udCQ2kMyyPY415ddvBjET0rmiEsFmaXF1foYXoVwhen8Dow0ziq
         2TAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IK9e0vaf6oFJwdDH1Z3FkKjQHviZuSu3zT8Gr5xF4kk=;
        b=l9IvUKJMPakG3qUrjAiEe1pf2/BNs+7WcYRU7+BODyXWxhVf4lMIh6UalsJujO0BJx
         WtICm2KF0TTz9WQhJdaNK66+ayfgkEPbNHhSDU3YUbojLFL1N/7bH7Jo8FOTq4n0xx6z
         bRGigW78cyKauBlZX5NzoH5+k+uEhWwBhYt2+W0ub+u1oxmHf11vjB2IvsRIB51t+1N+
         aR2o5ICquxohT+S011bBHacTHIDyfG9g9CnROFoFRtKfcbUtxtbQihCAtyxZgAsPNoVE
         RZh9AaQDlF2BSwdv5eIBIg9rihf48O5DYXJCQIjic8tgt8Xo0uOxx3FVo6Oo5FXWtVjr
         6O2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FjtERB+4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si8111819qkc.69.2020.01.14.03.44.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:44:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FjtERB+4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKci-0002XV-Fh
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55807)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKZE-0005sE-9y
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:41:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKZA-0003H5-QM
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:41:04 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29784
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKZA-0003Gr-Lt
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579002060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IK9e0vaf6oFJwdDH1Z3FkKjQHviZuSu3zT8Gr5xF4kk=;
 b=FjtERB+4TfpmDU2VpQR7ZK3sLX/VvfNmE5VA/hvWvIpHaXeR6vIraVFES/c/mzJlz8TZHA
 plq9ndxPdIj5Yfh1O4wXlAkM+91Vn30nG4DD5fJD7zseyhPq8krMmL98z+cIZTj4ZHTcjs
 rSD+rR8mewkDqzXxeYmcqziXrreSRqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-JLSpdVRbNZKVl40--ochrQ-1; Tue, 14 Jan 2020 06:40:58 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2209100551B;
 Tue, 14 Jan 2020 11:40:55 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 895545DA70;
 Tue, 14 Jan 2020 11:40:46 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/30] migration: Fix the re-run check of the migrate-incoming
 command
Date: Tue, 14 Jan 2020 12:39:06 +0100
Message-Id: <20200114113926.3556-11-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: JLSpdVRbNZKVl40--ochrQ-1
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yury Kotov <yury-kotov@yandex-team.ru>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ht0BHjZAtah7

From: Yury Kotov <yury-kotov@yandex-team.ru>

The current check sets an error but doesn't fail the command.
This may cause a problem if new connection attempt by the same URI
affects the first connection.

Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/migration/migration.c b/migration/migration.c
index f79d0bf89a..e55edee606 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1784,6 +1784,7 @@ void qmp_migrate_incoming(const char *uri, Error **er=
rp)
     }
     if (!once) {
         error_setg(errp, "The incoming migration has already been started"=
);
+        return;
     }
=20
     qemu_start_incoming_migration(uri, &local_err);
--=20
2.24.1


Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5470555lff;
        Tue, 14 Jan 2020 04:57:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqzBfKbpzaCeyMOtompXDAKtEsLmZcDprznMEAn++l/lnrAN5Mb1sPldhbh+mf6cKCB0GYmb
X-Received: by 2002:a17:906:680b:: with SMTP id k11mr22783845ejr.0.1579006620801;
        Tue, 14 Jan 2020 04:57:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579006620; cv=none;
        d=google.com; s=arc-20160816;
        b=GmyOq5wQydnstYjHmsmkNKBwcKXr4nMbRFcRmSSLodmcrRTmlO4YydbBuhTpS+J621
         Kj0gmtcCiG12L590oCsTN7SZiOpSTXApymgUxv/EDqpqkFdGWjmz0ufIfQsDKeNojw7y
         EJM4lcZOPjba+3g190wHbJThDNBMnoC8f1GVgCmTRW2ewPwigbeqIHNeUBehwf3k3S+W
         de2lRGBiYAg+Q3BYn7vQlcq7kzLln//d2FbPtdNAlxj89r/Ae7sQul9Wcd1OYEXomF13
         9xcpM3pihokSFQkYCe8LrKFCZiSjKh2GMGgEeRlIxi+aulXNJ5PGhBUQeu8xOKHE9H7p
         OJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IK9e0vaf6oFJwdDH1Z3FkKjQHviZuSu3zT8Gr5xF4kk=;
        b=CXjVszVzzznV1kdzHhIyy+CqWeqPU5ibI2o3nuUZuQSte41dcE8CZJZPK0QdB7bnl/
         MH44XvCCueBz7w9lE3wsaTvv2hYNiKh5Zw5/KMboNpQgym+6SmthemcPkSTpNsmmmzQs
         YGPaYrEI08cq9EkZn/ltUnrznLbSoPVDVOUKg0CCposGqBBAX4xMELIV7m4pO7MMCd0J
         B9BqfYPSjWTOjlj6i/DJrqEMFrUYQ8RzR1jkd1lGAjJYY7aJECRbWgkOfA4l+Ki94fUN
         DkgnmtRWAB8V2kd5PdeNhzkqrPKESGMKOFo6d6h+a4ufYAe/5Gbz7kw6GbcE5SCoMWAb
         QMYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NjupBErH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si10164127edl.174.2020.01.14.04.57.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 04:57:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NjupBErH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irLkh-0004Iy-6m
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 07:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41002)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irLie-0002V4-EU
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:54:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irLic-0001gk-Qm
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:54:52 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34937
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irLic-0001g5-Bi
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579006486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IK9e0vaf6oFJwdDH1Z3FkKjQHviZuSu3zT8Gr5xF4kk=;
 b=NjupBErHhL8iLKd6/W7iELNE7Xnu/UXD3d/azhXswCIYaGQDpU6VpUD2Kg2cyUSWztJr8f
 Ygwgfl3GGrkIYn7L+Ymy5VOv+iDgPXdch3zP58EtD3aVVPRPwIfCIBGozVibbtA4NvBxur
 59OagYu+Wr/sZnCYx+n6yRpU4i50ej0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-HeT-VFWWPm6jTKxaZw-e-w-1; Tue, 14 Jan 2020 07:54:45 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0345800A02;
 Tue, 14 Jan 2020 12:54:43 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73E4C5D9E5;
 Tue, 14 Jan 2020 12:54:36 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/30] migration: Fix the re-run check of the migrate-incoming
 command
Date: Tue, 14 Jan 2020 13:52:35 +0100
Message-Id: <20200114125254.4515-12-quintela@redhat.com>
In-Reply-To: <20200114125254.4515-1-quintela@redhat.com>
References: <20200114125254.4515-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: HeT-VFWWPm6jTKxaZw-e-w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-TUID: PESjXCksCwFf

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


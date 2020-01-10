Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp998070lff;
        Fri, 10 Jan 2020 09:45:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqydbPwb7onNhbdlTHUc5qZf6k8HXgE0djzrzae0Vb1c21tbsVdB/01kw7M2Cxs24gIcIKCt
X-Received: by 2002:a0c:fac7:: with SMTP id p7mr3965770qvo.46.1578678354724;
        Fri, 10 Jan 2020 09:45:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578678354; cv=none;
        d=google.com; s=arc-20160816;
        b=PIJza6/8j0t/VOy81Un7TmWiwvE5ZNO/5saWcxb1vEP4FIDPV8x4FeGFgDpBKZ4c9y
         Yoy4LbGXfeHJv/1u27FfeOkRLtVA6TbIUUTSuM2c4bKa0OWYooD+HP1mWT9Gsdjzl7/V
         It7hbjTTgeof/b9zX6eCnf1hJaRFlBS/j6O40ajgKYLb3pRn8Ww2wgQhtyicCPRdfGaX
         YvBHjcA6OquqA3TrdCg7ZOH8uYIJkxkslNYMDpSYgD+LeAgFX0+BQ0Z1ZNdGEv6WwOXQ
         X4kUTOnGE6jMKdWNUNplcqkiBJiHdcGZPt5B/9+S53NmDYR7UmPSk4JBOHE6jxB8XW27
         INrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IK9e0vaf6oFJwdDH1Z3FkKjQHviZuSu3zT8Gr5xF4kk=;
        b=ECcb/ZjnzcTo2K2VDv6o0Qg4Hrpqoy1amkvj4W650J/5nSSdU+7DX98LpgtBP8W1Hd
         1aH4xKCX1iXhjsx9DJTC16RsQZfSr34URUli23vpN/StWo2wwkF+3oSfcXyx9Hh+O6IU
         euCKhBdD2i0lQWiYb+1uM/Cedh2N+leIXbIbhLZ2B394ftgPQLXtTn4nmSo3x9a4heqk
         dm4mAwynGYPwWe3yIPmWi4XHp1j2WcrSdHky/ERDQS/df5jHMUHQ40s4XohnvEHmPGXv
         v5Mkfx+3Nc3IqZ8lsx+DgFmWP7JsU0JSKHp8vu70WK2SPdHhvbvw1GCCok1KpTHS2kqQ
         MqFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XpvbLD8o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si1627012qkm.91.2020.01.10.09.45.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 09:45:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XpvbLD8o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipyM5-0003Zk-K4
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 12:45:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipyAh-0004qI-Oh
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 12:34:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipyAg-0003j6-LP
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 12:34:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22487
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipyAg-0003hK-GM
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 12:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578677646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IK9e0vaf6oFJwdDH1Z3FkKjQHviZuSu3zT8Gr5xF4kk=;
 b=XpvbLD8oCwHGgAWNRe+4aOkn+Ndz6uBb5cTfHTFg0xH2FY7S9gEKYYyYa/gjeJxDBt+m+m
 MkXtfAhtTcSOrAoGpWhzp/JFfEu6Gafjj6wzCOiHKlkRDkFCdox2GFZ1d58vidPOmBawz9
 fL2IHiISLIS791lXhaldmI8VqsiccNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-N9qKbkM6P3-YkKeEKJdSYg-1; Fri, 10 Jan 2020 12:34:04 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D8731800D6B;
 Fri, 10 Jan 2020 17:33:46 +0000 (UTC)
Received: from secure.mitica (ovpn-116-240.ams2.redhat.com [10.36.116.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B55A419C4F;
 Fri, 10 Jan 2020 17:33:38 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/28] migration: Fix the re-run check of the migrate-incoming
 command
Date: Fri, 10 Jan 2020 18:31:57 +0100
Message-Id: <20200110173215.3865-11-quintela@redhat.com>
In-Reply-To: <20200110173215.3865-1-quintela@redhat.com>
References: <20200110173215.3865-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: N9qKbkM6P3-YkKeEKJdSYg-1
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yury Kotov <yury-kotov@yandex-team.ru>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WL3kACWNH90H

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


Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5283423lff;
        Tue, 14 Jan 2020 01:44:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqyUmr2uf4mn1Mgiq2/u8JSW3pFPzn9jyk48J2coTfOxDhGsUjt2YrP0k+4gapfOzmpIJprM
X-Received: by 2002:ac8:4306:: with SMTP id z6mr2756511qtm.178.1578995098619;
        Tue, 14 Jan 2020 01:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578995098; cv=none;
        d=google.com; s=arc-20160816;
        b=JytAhEVT9uh5DhyEcsHNQlBv9k1fIERbJ4sQj7T6qhxcqJHyAbKd7k2OXUq+xB2HY+
         mYbSPDVWCxLVF9fo4glLJj4M47eFoJdShTIPfcjTzpA56ROPPJxo502tq2WaeZeaz5lc
         oKRZyddiXdBIZen6gkvzs01rfIy3HwtCrP89eRpWt5pIRjAew/xXgASZoewMhEIXPIXb
         3z7P5uRIoKSza+5AV1a3Hre+5azTWjwE+RFEy0waqim7iXfEsvR6txMBxN4olbdMS23+
         efSGEzv9LvwItggUHRffoYfHPsAy7GJjorPvlJrOBi+bOisfPgNI4hlWrC5BvPg6H3Uo
         aCxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3VZqz3zUF2Y1jQsm5V0KLQ63Ic05gunHzewXnrdXRG4=;
        b=ebAas5BBj0RiMh1v0J8RamQCgG8HDwABCEZMT/NjYHX6l+YxZZt7bFf117Ae4nXQJN
         68gnny9zb8qzCBdz1vM/HZq9D+cRheWmr2Dx3MtIlkH4H++IoxMK/Uv7nAHnA5mcprJ6
         1SjwZdsAZmWT/PDmMpp/2RMUiLuZdU33u5Pfe/Y7LK1G5w07ChZy9CRMEY8lj+U5XBQt
         A3aE3UKcLnLySYwJoK8vI7zQF0dSOm1sfTTSVIqStgdAKwcYaQ3Yw5BU9qSXWxN2hIa0
         248OGwv0Jv+gnP98B5VuFMrJxa9zjF3nKV6ZXI5GF5sCFgYTa4l+JpAOXX638np7+5o6
         co3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hr0NR95d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z41si7665614qtb.134.2020.01.14.01.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 01:44:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hr0NR95d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irIkr-0003AW-9l
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 04:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57889)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irIV0-0007W9-Ka
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:28:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irIUz-0006kM-1g
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:28:34 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42788
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irIUy-0006k1-UC
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:28:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3VZqz3zUF2Y1jQsm5V0KLQ63Ic05gunHzewXnrdXRG4=;
 b=Hr0NR95df6VJHVktnLEFJtRPghEkVeT7oFaJmf2owuJjk8VjDJVvDRakEYbse9u6olR4Ki
 l6xtPa9G5qGoYuU8p3ggxOLOPe6LMRUTIgQbrrVZKNd4+126NOs+KBzGOO7Je9ivFexMEC
 rb1aPv1+6stv1A5dFf9whWhgNRocP1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-xZY-SYq6MEeu_rXygy7ngw-1; Tue, 14 Jan 2020 04:28:30 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4F2910054E3;
 Tue, 14 Jan 2020 09:28:28 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59E13384;
 Tue, 14 Jan 2020 09:28:24 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/29] migration/postcopy: set all_zero to true on the first
 target page
Date: Tue, 14 Jan 2020 10:25:55 +0100
Message-Id: <20200114092606.1761-19-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
References: <20200114092606.1761-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: xZY-SYq6MEeu_rXygy7ngw-1
X-Mimecast-Spam-Score: 0
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
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y6xzmbVx0Z2D

From: Wei Yang <richardw.yang@linux.intel.com>

For the first target page, all_zero is set to true for this round check.

After target_pages introduced, we could leverage this variable instead
of checking the address offset.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 8ebaea255e..460abfa2c3 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4102,7 +4102,7 @@ static int ram_load_postcopy(QEMUFile *f)
             page_buffer =3D postcopy_host_page +
                           ((uintptr_t)host & (block->page_size - 1));
             /* If all TP are zero then we can optimise the place */
-            if (!((uintptr_t)host & (block->page_size - 1))) {
+            if (target_pages =3D=3D 1) {
                 all_zero =3D true;
             } else {
                 /* not the 1st TP within the HP */
--=20
2.24.1


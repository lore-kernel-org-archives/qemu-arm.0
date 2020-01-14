Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5280034lff;
        Tue, 14 Jan 2020 01:40:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqy1LO6dv4Zoebr3EFMczZcNIMPaPw19fBiTFaRpg73EqSAk6GfRlNg5y2nPENYx7Ym+y2tO
X-Received: by 2002:aa7:c946:: with SMTP id h6mr22869898edt.186.1578994854800;
        Tue, 14 Jan 2020 01:40:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578994854; cv=none;
        d=google.com; s=arc-20160816;
        b=dZpHyJwkVk3XzkmO0/fgpjJ8/B7p0+KEr5y/OegjPBjnpBEo/ozVYWWbdq2XQv2L3h
         84gBjxavYPK1+ie1rvII5TQbpy6K/PtuCqCLNdhYPQEW3uoEfk5rEiZkQ21UfocFwVVd
         OxNFw3ihMlfrJR1hNX4KSG0T7USJBY7r0L6kX69NZb8qp5rMClWjmINMbUFgAMALco7K
         ZXXUKs3qcZnR2PiK/Eklk0TLWMWgTThQtHhHZJz4M2awymdn1zmrH9xhx7rNDA7gsysl
         /e5vvMtI9klP8mZ21U4NpcGM6jua50s4ATZ14WKMTwjIcP3baf9syjDZNab/cpcqLFN5
         dVOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2p0QKCeBS4+LZOVYBokhIHTSESXgTmLYzL/BOFYcXF4=;
        b=WdzpT+zZqcWK4UJxCyolUGAQSVuMOLgr/coWYBG124+4uDrpLkqkX538rFZcAvSyJr
         TbHImwXCxWk9O++UM4k3rJWQTUHhP2OQuvrrqBVV5H5aqryk/W+Z/BqiOHn6lStgnYOk
         MpOI5m7lqkr3x4s2JBXLbSIaeEHaXCQc4CDYGn91+lQ/WwzdYNww0zqOFrGJAPbSAydA
         4jelib/rZMFgTNaip9gns172CPYFiy9tEMjcA0NCNM9rzG1NeyRJT+c/FdXSijhb3zBj
         FHG3MFv0duwva30Jw4EZRSe7aWwxWIBH4ODNU2OZ2oQDRpzUTGO1yS5wubW09HXmXe5l
         /qxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F3WLBqrY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w21si10049960edi.201.2020.01.14.01.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 01:40:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F3WLBqrY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irIgv-0006Xl-DI
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 04:40:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irIUJ-0006Np-Aq
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:27:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irIUI-0006Z4-5I
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:27:51 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48545
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irIUG-0006Ya-9n
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2p0QKCeBS4+LZOVYBokhIHTSESXgTmLYzL/BOFYcXF4=;
 b=F3WLBqrYk5m+8ySvy16xSS9O11/gJV0uJckkKbHyUT54g5RoM/GUB+/Wk5r/7lg9hAMYd1
 DrkuERF2NSGlrElXWNLXzE+v/KSaj653rJzCODYaX4R6Bf6Jhx8Hj/GHJDTp1buGOPBjOk
 tnPn4q02o8CbjRVNEJnqbT5MFkOAo+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78--P1DntjqOB-9a_hfc6i3vg-1; Tue, 14 Jan 2020 04:27:45 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 299361951264;
 Tue, 14 Jan 2020 09:27:43 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB61D384;
 Tue, 14 Jan 2020 09:27:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/29] misc: use QEMU_IS_ALIGNED
Date: Tue, 14 Jan 2020 10:25:48 +0100
Message-Id: <20200114092606.1761-12-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
References: <20200114092606.1761-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: -P1DntjqOB-9a_hfc6i3vg-1
X-Mimecast-Spam-Score: 0
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GlUQubP8iexy

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 exec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index d4b769d0d4..1feda49ca1 100644
--- a/exec.c
+++ b/exec.c
@@ -3895,7 +3895,7 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t st=
art, size_t length)
=20
     uint8_t *host_startaddr =3D rb->host + start;
=20
-    if ((uintptr_t)host_startaddr & (rb->page_size - 1)) {
+    if (!QEMU_PTR_IS_ALIGNED(host_startaddr, rb->page_size)) {
         error_report("ram_block_discard_range: Unaligned start address: %p=
",
                      host_startaddr);
         goto err;
@@ -3903,7 +3903,7 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t st=
art, size_t length)
=20
     if ((start + length) <=3D rb->used_length) {
         bool need_madvise, need_fallocate;
-        if (length & (rb->page_size - 1)) {
+        if (!QEMU_IS_ALIGNED(length, rb->page_size)) {
             error_report("ram_block_discard_range: Unaligned length: %zx",
                          length);
             goto err;
--=20
2.24.1


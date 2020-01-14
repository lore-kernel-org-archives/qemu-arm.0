Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5274675lff;
        Tue, 14 Jan 2020 01:34:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUoo9M3iwwUz6QWDyCPpa+ulMDy+sIAqCMM6rvKuiSvAvEGd2TbMSLPnyLE9uCkFewPPSD
X-Received: by 2002:ad4:4e6b:: with SMTP id ec11mr19756005qvb.149.1578994498099;
        Tue, 14 Jan 2020 01:34:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578994498; cv=none;
        d=google.com; s=arc-20160816;
        b=Us7PWCtqeKqU1gHfnx7oAJnw/5cUGSNV81PItIJnSADRvhln7JKElgm0N7iuFINgZz
         uzuhG25JA4YfVX6g4j+9637aEwgN7ZuYQoUemr6WsWxqh0+ksmqzhGdPTpZ3P1qcksWU
         8hmPrHrNSwwaabzax+qNh6ryZFwICawckI+Jhj8QLpJfHD9R0qVHnLdXfZVoHwlDPgUW
         aSC6DxXWssg739p5HUrU9J8Irjml0Xn0QebuYtU9/c2H0upQqZbWzAyjGEiTV52AZtpS
         /KiTKWOPMS5S/qpb8yUyM0nMryIVdZr/jT+SOnJG91dd1hhqkpzpzpQYmeGIIH1jRqVb
         ua9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iprvAOa2cyTKcfIq8nOi5Ry3fqn5kNfZVkcEZq0n1vM=;
        b=wmdwllwrihtVDrjnTesiX0zRTZLhrTJwlf4cgmR+kA595KvSUHcQ1mPZxwuOinnDYQ
         Q8jj7ONys+GNFOFwOIx+i6+nc1i2BJnx4n62vVTV/OqP7memYguMfPZXDcymPijb+Zcs
         g68ALiUCor4+ae7+BQb1ANZVc9uQoHNQw0ZCMnSlnif+rK7QKYZMTJmv2Ohkr3Gw01VP
         0XKE5rq/V0/gB5rw2yaVucBhCH4vxounRlohKn/ZgJrXWQtkofhQinfEf6EpqKUqR3O1
         ieGsuJxrI8Ug+nfoExUeZ+zJB06pqDVYwT/8zOokeHMF+sXPcvVFuziaiIASgXNxtBBn
         d1Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X0KYsakZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 126si8531610qkl.66.2020.01.14.01.34.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 01:34:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X0KYsakZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irIbA-0006ck-Sy
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 04:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58057)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irIVN-00089Z-De
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:28:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irIVM-0006pP-CF
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:28:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47255
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irIVM-0006p7-7r
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:28:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iprvAOa2cyTKcfIq8nOi5Ry3fqn5kNfZVkcEZq0n1vM=;
 b=X0KYsakZwchULPZue3jPz0elNa+HVVR68FOIcrOHRqMHx8xdIUVsrix/GvcPWBsMp6DHal
 H4ylBlAC8/2BIUezWr6bsiFIELtiGA5F+M2geJRZ4Ee3dx8+yWjVG/lH1aabIbvi4WtB7n
 215x7oqgzGfjd79IHRBLUvnr4c0Vw48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-I8sLKwc7PRq2V-ig7jqMFw-1; Tue, 14 Jan 2020 04:28:54 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDFE6800D41;
 Tue, 14 Jan 2020 09:28:52 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EE2D384;
 Tue, 14 Jan 2020 09:28:48 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/29] migration/multifd: not use multifd during postcopy
Date: Tue, 14 Jan 2020 10:25:59 +0100
Message-Id: <20200114092606.1761-23-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
References: <20200114092606.1761-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: I8sLKwc7PRq2V-ig7jqMFw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dr3MBzMtiMVi

From: Wei Yang <richardw.yang@linux.intel.com>

We don't support multifd during postcopy, but user still could enable
both multifd and postcopy. This leads to migration failure.

Skip multifd during postcopy.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index a05448c0c9..d4f33a4f2f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2587,10 +2587,13 @@ static int ram_save_target_page(RAMState *rs, PageS=
earchStatus *pss,
     }
=20
     /*
-     * do not use multifd for compression as the first page in the new
-     * block should be posted out before sending the compressed page
+     * Do not use multifd for:
+     * 1. Compression as the first page in the new block should be posted =
out
+     *    before sending the compressed page
+     * 2. In postcopy as one whole host page should be placed
      */
-    if (!save_page_use_compression(rs) && migrate_use_multifd()) {
+    if (!save_page_use_compression(rs) && migrate_use_multifd()
+        && !migration_in_postcopy()) {
         return ram_save_multifd_page(rs, block, offset);
     }
=20
--=20
2.24.1


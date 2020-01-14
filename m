Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5272944lff;
        Tue, 14 Jan 2020 01:33:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqyIGpD79WBulOSURjk/xenvNypO+C8L48OioJmbK9MpNQ5kJk/KASs9EK0bKeh5rJoLKH84
X-Received: by 2002:a37:6704:: with SMTP id b4mr20998976qkc.32.1578994391015;
        Tue, 14 Jan 2020 01:33:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578994391; cv=none;
        d=google.com; s=arc-20160816;
        b=f4RTGtdv1NmHSU/4YA9SIMSU0IMN4j8ZPXO005Qfp5O7DHLV9kFWM3OLt24c0g/OcW
         vUTTVQA8yw0aoYTccS1ugEarHSAvV0JGRTYhNlzZ8oMN99u0kc51cSBG+uGV9U9vSAd5
         GVvF/w3qxXBU/tlpBGmrQpOkDPLg2WezmRvL1ChbVyEwYAeWrUAlMhSnbULd7qdY/Fae
         zcDwSml2kjgAd0wVrCIw2IzWm+V+6lQcGk9nZE1A6r2E6HH7mHdotFpNpt2DlaXyzW0B
         VegLpUnYOkcOXRLcmantsckI+86oEYIPa7iUyX/IK+X7fVX6mnCC+vzhVM38GCYwCdcT
         CepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BrX1W4PqQfRCqbcGSErGINbVpX+XYhnN1Q3v/xMRPg4=;
        b=uTVAVFBAddyyTMG0H49siDsO4BouT+sz8vIFwXGFBXpX0vX3lp0cdxhc4ZLnR4x6fG
         Sl0KWKAbiR/DB/2C5biJYe1e0whaN6ZSBg1eFTY72JAJFDRI+iTd0ST0WZ/OpjtITk0O
         lOFa7Lg6Xa0EtOnapBzgMmjJecj3jJO1H5h/R4kTMmfGE5gUYZM49LXAJ4WYI5VKzW4B
         vMVQpndSQgDCvx02qWqUHeH/oswHLK1MMbkFfyVmEYHKioVgY3PMCTh2d0ccC2plLl2G
         tJOcTBKVYc7U5UEJNmQNl4s5rvTHI9Xkr+fcHx5ggBhC4E9CENzPzM0Xfj8Vntn2vFp6
         axMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e0MqUZED;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21si7920908qte.121.2020.01.14.01.33.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 01:33:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e0MqUZED;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irIZR-0004ec-He
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 04:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57276)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irITP-00058s-L0
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:26:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irITO-0006Nc-93
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:26:55 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49576
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irITO-0006NH-5Q
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:26:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrX1W4PqQfRCqbcGSErGINbVpX+XYhnN1Q3v/xMRPg4=;
 b=e0MqUZEDSMF+Dj70TwiEMzvLdj016cZssPqaJFDR88awp7nWRGXBPystIbrovutD/axMvx
 PqyBKaxHIY9kQMjj7O8/G6tpCh3LMvU8ma1SImn+Ns9X6yJP/Q15pNIYfjqASwvwTIlUeG
 HNEYNSMRQUfsu0i5wS0tX13GqU/A0ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-erusUVLcOjG_Ld3aIiWqmA-1; Tue, 14 Jan 2020 04:26:49 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E5F3801E7B;
 Tue, 14 Jan 2020 09:26:48 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB08A384;
 Tue, 14 Jan 2020 09:26:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/29] migration-test: ppc64: fix FORTH test program
Date: Tue, 14 Jan 2020 10:25:42 +0100
Message-Id: <20200114092606.1761-6-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
References: <20200114092606.1761-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: erusUVLcOjG_Ld3aIiWqmA-1
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VYCDsmsHs7Rz

From: Laurent Vivier <lvivier@redhat.com>

Commit e51e711b1bef has moved the initialization of start_address and
end_address after the definition of the command line argument,
where the nvramrc is initialized, and thus the loop is between 0 and 0
rather than 1 MiB and 100 MiB.

It doesn't affect the result of the test if all the tests are run in
sequence because the two first tests don't run the loop, so the
values are correctly initialized when we actually need them.

But it hangs when we ask to run only one test, for instance:

    QTEST_QEMU_BINARY=3Dppc64-softmmu/qemu-system-ppc64 \
    tests/migration-test -m=3Dquick -p /ppc64/migration/validate_uuid_error

Fixes: e51e711b1bef ("tests/migration: Add migration-test header file")
Cc: wei@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/migration-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index b0580dd541..26e2e77289 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -517,14 +517,14 @@ static int test_migrate_start(QTestState **from, QTes=
tState **to,
     } else if (strcmp(arch, "ppc64") =3D=3D 0) {
         machine_opts =3D "vsmt=3D8";
         memory_size =3D "256M";
+        start_address =3D PPC_TEST_MEM_START;
+        end_address =3D PPC_TEST_MEM_END;
         arch_source =3D g_strdup_printf("-nodefaults "
                                       "-prom-env 'use-nvramrc?=3Dtrue' -pr=
om-env "
                                       "'nvramrc=3Dhex .\" _\" begin %x %x =
"
                                       "do i c@ 1 + i c! 1000 +loop .\" B\"=
 0 "
                                       "until'", end_address, start_address=
);
         arch_target =3D g_strdup("");
-        start_address =3D PPC_TEST_MEM_START;
-        end_address =3D PPC_TEST_MEM_END;
     } else if (strcmp(arch, "aarch64") =3D=3D 0) {
         init_bootfile(bootpath, aarch64_kernel, sizeof(aarch64_kernel));
         machine_opts =3D "virt,gic-version=3Dmax";
--=20
2.24.1


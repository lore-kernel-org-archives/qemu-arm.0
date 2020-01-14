Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5469205lff;
        Tue, 14 Jan 2020 04:55:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfjHRCdGD34X/TFvqnGGYqd3EuYstxVQygtXc0q9yti0R8Ym9MdUcGIevW8vlXJztjXe37
X-Received: by 2002:ad4:40c7:: with SMTP id x7mr16923723qvp.176.1579006517537;
        Tue, 14 Jan 2020 04:55:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579006517; cv=none;
        d=google.com; s=arc-20160816;
        b=PnX04pBKq/F1lpNpSCfwiwGCuzf8svDoNvmom0N0X52u7mcYJUC40YpnM+PHJ81Eoa
         Y1QLyHwSXuT0h2kwR10XuRyDGteK8tJSrVYE2XdOK1Yt49DAycGdHuqxGYpzVHFTtnXw
         4b9Vier65d3yquyjQOuPTYG+HR9p+MSKlf14yJz800KsNMSwmXsp8QUuZ0gQsudL5PWd
         4XmsdDKGW2U0FMB9Rdq4i3gVoh9eqGvJOZ9uspCrIQsvm0sHvNAw+yjlJbANO62djkoi
         OHEdCZqEMbs5MPJG3UjfbU+3efAYLC+F5zZSdZ+ypnctMUV8yXsTjOUqs+6fhENeY3ma
         dRpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BrX1W4PqQfRCqbcGSErGINbVpX+XYhnN1Q3v/xMRPg4=;
        b=RAjTDIpsWMyO7Cv6AYdLC/aZsrz96M4qFcfFNQfUfa6MIs7En7SXnw/z8lwi2SJ/03
         Z6HP9jbW1UMS31JF7vpINS9IDz4MZ8venfSF3PXg8taWNg+pe0KUmnRXptjpZICl4IoR
         tXnghHy75TCAa+UmEMyjgIBuEpk/R8+43xpkar5EmHxt8SnPbUoBPXiKy81pzPowJ2vA
         qHvHtqQUN4XU5bEDJyO38Trv+UznpUkY2aboOLviu153yGicbSkr/pn8+v3fLJyEv+7Z
         /5r3ejQimsp9ADYMmV3xrj2TyjDHz4dRTK6sY5RHCMJwFyErknkFd7bV2PthRFYi+tHw
         s+Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bYzbLCIy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w37si8239303qtb.170.2020.01.14.04.55.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 04:55:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bYzbLCIy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irLj2-0002X2-FP
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 07:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40757)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irLi0-0001ax-Vb
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:54:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irLhw-0001Xa-AB
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:54:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50813
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irLhw-0001XO-74
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:54:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579006447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrX1W4PqQfRCqbcGSErGINbVpX+XYhnN1Q3v/xMRPg4=;
 b=bYzbLCIyXH1UC3yJVRF5KE6qHwPjvXZiYpwmZt/rxTGpkjXGHLXpYwwrTGJo0uVYRMqjj9
 v59VIKxi+LOPe2u4joQC+y5j/2DVj6WUCUBvkpjULo5qvE0IDiGmO5yeEFSESE5gav/OOv
 Lgr7VcLU0w26c8Ffm3Qz0hjv1neuYlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-hHF51gW1OHyAWdDl-MgE8Q-1; Tue, 14 Jan 2020 07:54:06 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95DB5189CD13;
 Tue, 14 Jan 2020 12:54:04 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE94E5D9E5;
 Tue, 14 Jan 2020 12:53:57 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/30] migration-test: ppc64: fix FORTH test program
Date: Tue, 14 Jan 2020 13:52:30 +0100
Message-Id: <20200114125254.4515-7-quintela@redhat.com>
In-Reply-To: <20200114125254.4515-1-quintela@redhat.com>
References: <20200114125254.4515-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: hHF51gW1OHyAWdDl-MgE8Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sAfRdK/YCebO

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


Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5395330lff;
        Tue, 14 Jan 2020 03:42:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwqBQVa4wItr7OO6gARrBzE1mvD/snyF9ZHwVh/F+VLhYsSGeulPwm7oJS2k0hzvforLsnK
X-Received: by 2002:a17:907:43ef:: with SMTP id ol23mr416765ejb.348.1579002134959;
        Tue, 14 Jan 2020 03:42:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579002134; cv=none;
        d=google.com; s=arc-20160816;
        b=M4d0V/0czpPE1FgJmYm87glRgpWpWUpTiWekjbQ9xqDw6uTu6mXYx4Io6acCaeBvuB
         XACNXu4jpDmdTtGYK/1/ZcIotLE5UyUE/c7hZGi0mrB/RaT8eI6AvEA4BFryFzSIdmkH
         GGVvwG5n9ToiwQHgjK5+hJ+tZWkhQIalAlvUVnH9O7zULc3xf0gE008Nk96mrhagANCx
         7/QJuz4BBjdAwAp8oeN7axa1CLRV4bOAZCQY45Kl8DH0pVdJNELCfF3Nib7kr6Hq3jnu
         BqyYNfYPme6yTEGZsROZz8uRanvn51CgsPS80JqXLLV2y1fIKbBwqCnk/CS9D/Uchfur
         k+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OFbuBsfI2hdknoUqcqxf7Pz5nXpd3viWe9nVgMcqFyk=;
        b=wYM+GSPjhJZCauTLce59S2e9f21ovIAfB/7nlepbJ5B4EpJP+bH48we36DCNeHXHL+
         biMVYUGiwm4LZvfTPVnDzBfAC8FK1LCs3KXnrZBcZKKgz1V0oW8Ct6jBR/1uWVlU60RM
         Y/Jwj0Hy/UuJxrJ4J7o0bHwwoDonCfhwDEknb5ZqnS0t0hanCpHlzYhdr18qMxDe+Egh
         2v1xU2GvAiKMjXsaNx7/lVZY81WJFwa1EcvomYQNBS2EPVgRp6r4bgHtMO6UFglvpmxJ
         PQ4S1v19aOYNGmdROt5EXohmlTdutojZuIvNGPWM7BI5fYM8w2mRjPh7/pfumlnlxEwN
         cNvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cLhfpvEf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20si9636285edq.182.2020.01.14.03.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:42:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cLhfpvEf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKaL-0006ey-BU
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55331)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKY6-000466-O3
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:39:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKY2-0002lQ-Kf
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:39:54 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52512
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKY2-0002l0-H1
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579001990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OFbuBsfI2hdknoUqcqxf7Pz5nXpd3viWe9nVgMcqFyk=;
 b=cLhfpvEfFWhb/A4i0Zs9m3KHEd8/95sEpvlEy8OOsjky7TD6Os4638iWZwHLtwMwP0pLIk
 gUXwoeg+3LEkS0Jcr0Et9urXfp+3yCRzkvUUyzixmj9lQdkca3h78qU1kLADF8eYLyIcZs
 eN/8/LONZ2+Ah4L+l+rQXbwxGw56ueU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-0x25_Fk0PYORQ6TPJefq2g-1; Tue, 14 Jan 2020 06:39:48 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 229371005502;
 Tue, 14 Jan 2020 11:39:47 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F9B55DA70;
 Tue, 14 Jan 2020 11:39:42 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/30] migration-test: Add migration multifd test
Date: Tue, 14 Jan 2020 12:38:58 +0100
Message-Id: <20200114113926.3556-3-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 0x25_Fk0PYORQ6TPJefq2g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: slC0ejqM/7nv

We set multifd-channels.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Wei Yang <richardw.yang@linux.intel.com>
---
 tests/qtest/migration-test.c | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 53afec4395..fb70214f44 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1202,6 +1202,61 @@ static void test_migrate_auto_converge(void)
     test_migrate_end(from, to, true);
 }
=20
+static void test_multifd_tcp(void)
+{
+    MigrateStart *args =3D migrate_start_new();
+    QTestState *from, *to;
+    QDict *rsp;
+    char *uri;
+
+    if (test_migrate_start(&from, &to, "defer", args)) {
+        return;
+    }
+
+    /*
+     * We want to pick a speed slow enough that the test completes
+     * quickly, but that it doesn't complete precopy even on a slow
+     * machine, so also set the downtime.
+     */
+    /* 1 ms should make it not converge*/
+    migrate_set_parameter_int(from, "downtime-limit", 1);
+    /* 1GB/s */
+    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
+
+    migrate_set_parameter_int(from, "multifd-channels", 16);
+    migrate_set_parameter_int(to, "multifd-channels", 16);
+
+    migrate_set_capability(from, "multifd", "true");
+    migrate_set_capability(to, "multifd", "true");
+
+    /* Start incoming migration from the 1st socket */
+    rsp =3D wait_command(to, "{ 'execute': 'migrate-incoming',"
+                           "  'arguments': { 'uri': 'tcp:127.0.0.1:0' }}")=
;
+    qobject_unref(rsp);
+
+    /* Wait for the first serial output from the source */
+    wait_for_serial("src_serial");
+
+    uri =3D migrate_get_socket_address(to, "socket-address");
+
+    migrate_qmp(from, uri, "{}");
+
+    wait_for_migration_pass(from);
+
+    /* 300ms it should converge */
+    migrate_set_parameter_int(from, "downtime-limit", 300);
+
+    if (!got_stop) {
+        qtest_qmp_eventwait(from, "STOP");
+    }
+    qtest_qmp_eventwait(to, "RESUME");
+
+    wait_for_serial("dest_serial");
+    wait_for_migration_complete(from);
+    test_migrate_end(from, to, true);
+    free(uri);
+}
+
 int main(int argc, char **argv)
 {
     char template[] =3D "/tmp/migration-test-XXXXXX";
@@ -1266,6 +1321,7 @@ int main(int argc, char **argv)
                    test_validate_uuid_dst_not_set);
=20
     qtest_add_func("/migration/auto_converge", test_migrate_auto_converge)=
;
+    qtest_add_func("/migration/multifd/tcp", test_multifd_tcp);
=20
     ret =3D g_test_run();
=20
--=20
2.24.1


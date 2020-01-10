Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp984789lff;
        Fri, 10 Jan 2020 09:33:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqxW5goE1Wd6mwjfRABG6uoigfcrttpK5JnF8MwxeWmvEjBi+zOtktsDvtD4735+qcIPCsmP
X-Received: by 2002:aa7:c507:: with SMTP id o7mr4676046edq.282.1578677586643;
        Fri, 10 Jan 2020 09:33:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578677586; cv=none;
        d=google.com; s=arc-20160816;
        b=EQobKVxjcnwXeJ+Qdq1RIt9jYkCBXj0wkO5UH16m5aQcngV9XXOsB/LOiq1hsUnfMs
         8Y7RPk9MP+fZe0asMP/2GVwJzXfA2624ySBVEV6V5Vh/0VEeSbsUitQglvuIcLpEZ3s6
         oR5EShe9L06HKEdiAOJQ12Z90ZkLoEo1eon1/rICYNZvMzjB7ch5Ewr8b72E/ptAvWU/
         L6zQlTs6489JvZ4jlMUmorkCV0YM9D121MOBFIy94uiDA18GvcHMHCQjED07JSNPDEyQ
         IckbdXjtAw5x2vAnfQ247JiN1BTMTZD6gg+by/lQQmH0gDj3k2poHXT/P+fZMu7Iq9qU
         JDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6q+bFL2mRnnlYQePE3rwAd8P4c5ap15wWC2cumpM8d8=;
        b=O52DAja4Z43iuQv6HJplFu8i2cQudr80/prpZKooF2VyQiCNhQd19AaDArYLa115zo
         dX9e1h6kytcUpSEOWi9D+pa911l5THTmWEgnrZ5v3V6j/7hGfbIohH3JoirSfKCANjvb
         z68KgBJwRcA87RIFr392w1/42xnSRA+AIDdGZOtVCKyGfAJ8M3HRsHTIkSJwe2aTad4+
         3f8zruK9QJ1mlr65AzX9jXj+3aealbErjvgGniQ9UMS6a7lxb7cVLwDbx21psiSK8+R1
         XHTxUFIS/fczyYRG6Fm0BstmzwCP/33WQwElfnqQDddrEhKM9oLMrF33wWVYEUcLn79Z
         a3PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EEcEigcM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15si1774213ejc.289.2020.01.10.09.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 09:33:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EEcEigcM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipy9g-0003IQ-NE
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 12:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43805)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipy9G-0002wX-72
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:32:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipy9E-0007nV-0A
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:32:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27217
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipy9D-0007lU-Rg
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578677555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6q+bFL2mRnnlYQePE3rwAd8P4c5ap15wWC2cumpM8d8=;
 b=EEcEigcMRQ9S3icDG8KnmehL49wKqCmWYQvq3mPDzWAFFxYGXzEoNL63sFGyoa4n3Wgg0g
 ah4g/4r0UgEux/R3QO3RJ1DSm4e4h+JztYbQIkbsJbHzEdM4i/9HsIUv9Tc6VaJV+wgCQ8
 +x/i3bPcVhE3HXGELIZVuL3wraysXZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-s7pzEnzFPdC-Z0BPIVmDtQ-1; Fri, 10 Jan 2020 12:32:34 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44640477;
 Fri, 10 Jan 2020 17:32:32 +0000 (UTC)
Received: from secure.mitica (ovpn-116-240.ams2.redhat.com [10.36.116.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D30419C58;
 Fri, 10 Jan 2020 17:32:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/28] migration-test: Add migration multifd test
Date: Fri, 10 Jan 2020 18:31:48 +0100
Message-Id: <20200110173215.3865-2-quintela@redhat.com>
In-Reply-To: <20200110173215.3865-1-quintela@redhat.com>
References: <20200110173215.3865-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: s7pzEnzFPdC-Z0BPIVmDtQ-1
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: brq1CiJpJGOf

We set multifd-channels.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Wei Yang <richardw.yang@linux.intel.com>
---
 tests/migration-test.c | 56 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/migration-test.c b/tests/migration-test.c
index 53afec4395..fb70214f44 100644
--- a/tests/migration-test.c
+++ b/tests/migration-test.c
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


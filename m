Received: by 2002:a0c:cd0f:0:0:0:0:0 with SMTP id b15csp2729353qvm;
        Mon, 20 Jan 2020 02:39:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqzrQkJf1hoL79ovd+tRNmSn3TPM/gI4LratBl+r2KC5c4cAqRAEBgSiMrMtXLcTqo3aoUoc
X-Received: by 2002:ae9:c011:: with SMTP id u17mr45286181qkk.480.1579516799005;
        Mon, 20 Jan 2020 02:39:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579516799; cv=none;
        d=google.com; s=arc-20160816;
        b=g6xKqH20bljLtYA6h8cW/p28nLs7eZJGEy2u3H+yJbHPx0gbnM8mYFR+dH6AvYJfGf
         NLymIBZzHMe/EGP5PuXHr1JKLBOL4GDwST4eNHgj2ugsbZ4gxpMnYEhGc/rgHqnqTT8T
         CUyjTyG5t/NnVFJP6vaHa7H2QVYJAz6okzNLveceRolxUhOy4JW+X/yrIAmzXmb2qJRD
         l3gOgmXnSogmDdvx8BIliSA50vtJjSx5iR80bAivBfnc2bqXSJu2WquiiiBvf8xml9BV
         STuQkSr9gs4C7rQiRIVV1z2Ze7Fq0ICOZ3QbrOCrci5EknGiWLCS0LjXEjNUTC6yjE9Z
         Qjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=N7eHhu4RVnwR1GixjRbyFk9CcEmDhA6fspUldHGTnnA=;
        b=XndmgGN15Rf+Ebojz2zODhTc++VEucfTZX5+fstZQzj4D1f3uYRjveEbIL/BMsG5Y7
         CxnEgbhx4Cv6rmcGNSyen3k+3q7O2LyH6odiBz5xUv2pIZh+G0FprKAW7SPosR0eF10y
         e2BVLK1M/C9c1nnPqH6SHKIWdFuII1goaXvNmjZrEyoo96uMs7Hyp4UeEhlWTexlSvrK
         13UIVMqsRe3QEzePHgQZyVUEG94yti9Sb5sT9mCZINyBtjHzWmTgQZUNJlbYjF8hqebE
         jCQ9Wl1cEF7fFj1Dv3QalNDC7d+gsUdlfsdMakkSgNqhFFRNdJ/nf5vY4/vX6+xgdAgT
         FvSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CKO2L4pR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si18989017qto.344.2020.01.20.02.39.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 02:39:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CKO2L4pR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itUTN-00038f-Vl
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 05:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37113)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itUNy-0004Aa-DU
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:34:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itUNw-0001WY-5N
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:34:22 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27121
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itUNw-0001W8-0t
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N7eHhu4RVnwR1GixjRbyFk9CcEmDhA6fspUldHGTnnA=;
 b=CKO2L4pRFqJrgwt+Qm9Oc25wIuvswow+QGAsTzEgFYtxOywdsWJx0jSScdUUWwSqLbKRv9
 N7Ms9bkFv8bNRteRmHMj/lTV3AvYjoJ7qBhWUp3SnsC2fUdbTAAZZt4K4rQ3Fd2bFWCXb0
 wXFuQQEvYnAzWvZ8vdZsVIY4K5M5j/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-EypwoyvDP2GvG02f2TrOTg-1; Mon, 20 Jan 2020 05:34:18 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AFABDBA3;
 Mon, 20 Jan 2020 10:34:16 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48E6D1BC6D;
 Mon, 20 Jan 2020 10:34:12 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/29] migration-test: introduce functions to handle string
 parameters
Date: Mon, 20 Jan 2020 11:33:15 +0100
Message-Id: <20200120103340.25118-5-quintela@redhat.com>
In-Reply-To: <20200120103340.25118-1-quintela@redhat.com>
References: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: EypwoyvDP2GvG02f2TrOTg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tu4eL41JPn1E

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/migration-test.c | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 81f65602de..26e2e77289 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -356,6 +356,43 @@ static void migrate_set_parameter_int(QTestState *who,=
 const char *parameter,
     migrate_check_parameter_int(who, parameter, value);
 }
=20
+static char *migrate_get_parameter_str(QTestState *who,
+                                       const char *parameter)
+{
+    QDict *rsp;
+    char *result;
+
+    rsp =3D wait_command(who, "{ 'execute': 'query-migrate-parameters' }")=
;
+    result =3D g_strdup(qdict_get_str(rsp, parameter));
+    qobject_unref(rsp);
+    return result;
+}
+
+static void migrate_check_parameter_str(QTestState *who, const char *param=
eter,
+                                        const char *value)
+{
+    char *result;
+
+    result =3D migrate_get_parameter_str(who, parameter);
+    g_assert_cmpstr(result, =3D=3D, value);
+    g_free(result);
+}
+
+__attribute__((unused))
+static void migrate_set_parameter_str(QTestState *who, const char *paramet=
er,
+                                      const char *value)
+{
+    QDict *rsp;
+
+    rsp =3D qtest_qmp(who,
+                    "{ 'execute': 'migrate-set-parameters',"
+                    "'arguments': { %s: %s } }",
+                    parameter, value);
+    g_assert(qdict_haskey(rsp, "return"));
+    qobject_unref(rsp);
+    migrate_check_parameter_str(who, parameter, value);
+}
+
 static void migrate_pause(QTestState *who)
 {
     QDict *rsp;
--=20
2.24.1


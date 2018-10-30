Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4889744wro;
        Mon, 29 Oct 2018 17:20:11 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fNe6HGxgXGWS+dUGDgCC7ck6Uqv+rf40rT9gwu/8iz4oG9bWgzTmGcc7RYhqr0gAyj5zKo
X-Received: by 2002:a0c:ade7:: with SMTP id x36mr15107023qvc.218.1540858811719;
        Mon, 29 Oct 2018 17:20:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540858811; cv=none;
        d=google.com; s=arc-20160816;
        b=032uuustPMypkx7t7ahdThW1rBdwQ6JTxq1a/NaWhywRs98n+PKIb2PDajuRUVKJA9
         Z9OjSpj8MNmP5jDgjbqigCukeiGnJQtD5IY3OelApmIaR08WUglymCdLZlu47ahviumB
         ORng3gFp9roIliYAmORdDlA/jE88uYxZba9O4AuV962jFYf+aFQw5Y9xpVTcvIEUUwpX
         WqjKvKvlqPHz9wqcYTHuAUmym8YS0pjl+Cz9XzQ/YjhcSqk2iFvdwCFsM+SRv+0xSnwS
         jq8yPE7EKF8y08ERGPQHOxNr4rbikb4sYojpaUP2izCG4L6Vu4LyhMG6MJ1n3LPci9a7
         db6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=8t4qbVwqp/MB4/eIS1rqFVPkfwqMQOKFk8BHoiJKKOs=;
        b=ve1BY0U+RdJhNzyExQWa2o5EIzdU+TWSgIPUNxWL8b79+BN/RQWpBg47JvPwBR/sJm
         9LnK+pMMu/9Bj6u5/tUsN7W2iqHea1I2K9HxHqlK6/OBNR6FRqyGu0oqOUx86c/dc0+t
         Q10YCPM/gz+Ow0rhtor4RJi3EJ7PdbyVylmyGu4Di4hpLhn38VKC6YaTrydkNBe8QFr3
         91sqKXSJRvlokyYgQs2Al4apnlQaqdICBWDr3Pe99yDeN9zty3l3luQqJz+onDV4h+3G
         bh/7FSkqQW0EJSTKc3b4kpU3zet6YT4uTiCnM23iJiHXku2tkL1Mx4DS5HKd+YYAXr9P
         E8CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u135si847082qka.242.2018.10.29.17.20.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 17:20:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHHlT-0006Ss-36
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 20:20:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHHkZ-0005zz-LI
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 20:19:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHHkV-00071g-Jx
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 20:19:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36410)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gHHkV-00071T-8v; Mon, 29 Oct 2018 20:19:11 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 87C3085550;
	Tue, 30 Oct 2018 00:19:10 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-38.brq.redhat.com [10.40.204.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0897560BE1;
	Tue, 30 Oct 2018 00:18:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Oct 2018 01:18:40 +0100
Message-Id: <20181030001841.1658-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 30 Oct 2018 00:19:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] tests/bios-tables-test: Sanitize test verbose
 output
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ocogRGXVksic

Fix the extraneous extra blank lines in the test output when running with=
 V=3D1.

Before:

    TEST: tests/bios-tables-test... (pid=3D25678)
      /i386/acpi/piix4:
    Looking for expected file 'tests/acpi-test-data/pc/DSDT'

    Using expected file 'tests/acpi-test-data/pc/DSDT'

    Looking for expected file 'tests/acpi-test-data/pc/FACP'

    Using expected file 'tests/acpi-test-data/pc/FACP'

    Looking for expected file 'tests/acpi-test-data/pc/APIC'

    Using expected file 'tests/acpi-test-data/pc/APIC'

    Looking for expected file 'tests/acpi-test-data/pc/HPET'

    Using expected file 'tests/acpi-test-data/pc/HPET'
    OK

After:

    TEST: tests/bios-tables-test... (pid=3D667)
      /i386/acpi/piix4:
    Looking for expected file 'tests/acpi-test-data/pc/DSDT'
    Using expected file 'tests/acpi-test-data/pc/DSDT'
    Looking for expected file 'tests/acpi-test-data/pc/FACP'
    Using expected file 'tests/acpi-test-data/pc/FACP'
    Looking for expected file 'tests/acpi-test-data/pc/APIC'
    Using expected file 'tests/acpi-test-data/pc/APIC'
    Looking for expected file 'tests/acpi-test-data/pc/HPET'
    Using expected file 'tests/acpi-test-data/pc/HPET'
    OK

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/bios-tables-test.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 4e24930c4b..02dd48de0d 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -371,6 +371,9 @@ static GArray *load_expected_aml(test_data *data)
     gboolean ret;
=20
     GArray *exp_tables =3D g_array_new(false, true, sizeof(AcpiSdtTable)=
);
+    if (getenv("V")) {
+        fputc('\n', stderr);
+    }
     for (i =3D 0; i < data->tables->len; ++i) {
         AcpiSdtTable exp_sdt;
         gchar *aml_file =3D NULL;
@@ -385,7 +388,7 @@ try_again:
         aml_file =3D g_strdup_printf("%s/%s/%.4s%s", data_dir, data->mac=
hine,
                                    (gchar *)&sdt->header.signature, ext)=
;
         if (getenv("V")) {
-            fprintf(stderr, "\nLooking for expected file '%s'\n", aml_fi=
le);
+            fprintf(stderr, "Looking for expected file '%s'\n", aml_file=
);
         }
         if (g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
             exp_sdt.aml_file =3D aml_file;
@@ -397,7 +400,7 @@ try_again:
         }
         g_assert(exp_sdt.aml_file);
         if (getenv("V")) {
-            fprintf(stderr, "\nUsing expected file '%s'\n", aml_file);
+            fprintf(stderr, "Using expected file '%s'\n", aml_file);
         }
         ret =3D g_file_get_contents(aml_file, &exp_sdt.aml,
                                   &exp_sdt.aml_len, &error);
--=20
2.17.2


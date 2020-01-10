Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp795242lff;
        Fri, 10 Jan 2020 06:55:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqzx2SRIkH0xywHfJlwRwnaqvbaPjTzeIt9qI790Ym1sITfSjqtpc4OKH226zC2ZPPB3Hk0a
X-Received: by 2002:a9d:5f13:: with SMTP id f19mr3049213oti.180.1578668137975;
        Fri, 10 Jan 2020 06:55:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578668137; cv=none;
        d=google.com; s=arc-20160816;
        b=GBOj6lepMg6ERKQiO3mdahaoI/SvZC8fgbkRytyE0uPQvIjuQcZka1acYF0Q05j66q
         n3xVswdqop8AoD9zSoS+FZGb8dU+di/PJSex372grsZU0RHg3i7+bTmCl7pnISOpvh5d
         f86T9bKXcQOBvmjtZSmJW6tqNac1SLU+gK48WTJKXoC5B9L8AOglByjOVJtqXF53M24e
         PHxjt5g+RmdtByn2Fy14TDvlGw1fpzoyRNRpNLVGJICKGEhZctqppmxPb7PcnHVRMsZv
         j2xBotYrgl8xVjZ0PrCfqCvpUZdcJ+H4DfNg5dO0Z5zV/E87tk77V/6FkmXQ7AQF8H6e
         c70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=zF7fowIzQfdh49LNbLzBDFVCiRf9n/Gerf/OzX8S1GQ=;
        b=s588d1W+uCU8arstE6NRSGoLVSYlDQGQ+duHXjhVq5w2sx4ggyKsMjWrI1pzgZ0LIB
         93ibrGphi8JwBGDFk0pgngP25H9niaelna0KoUdkTLExSDVK+gYbc53WsCkfS8c9FeXG
         HXyVpjI8cfWkHvpgKOFQSPI6hVgphE9J7C1f1gfnQf80boaEZouWE3F9egs9f9yig07i
         F1ED0+B6+9cOvzlnEI8f2ALk7GKGsuP9ZqsG1fIikuJQL557C7LQtyedlM4meA46HYkO
         Qs3umeNiX7ylxVBtpytIRFmPbwhW2XM030z4B9mzzQIlGmXQI+c90ph3byCAgfrOioXV
         sffw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BvjzlCAV;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id n6si1558887otf.246.2020.01.10.06.55.37;
        Fri, 10 Jan 2020 06:55:37 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BvjzlCAV;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728473AbgAJOzg (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 10 Jan 2020 09:55:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49168 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728445AbgAJOzg (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Jan 2020 09:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578668134;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zF7fowIzQfdh49LNbLzBDFVCiRf9n/Gerf/OzX8S1GQ=;
        b=BvjzlCAVd7IkjGHvlp0qLwRmHmCYO/dKNDS9VKh+kgAV8keb0FirOc061+P7k86LLQ90qv
        4HAuPp/xHsTkA9DkDR4WccB2sE40tzwDvEjSiujNCMTKM/zB0lq0xbed2Qzq6GuURtptp1
        CO0fdKG3QPvFdr/ElvgRovvdU8QoCiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-wpRgzfHKM1yF0u2giuJ9zg-1; Fri, 10 Jan 2020 09:55:33 -0500
X-MC-Unique: wpRgzfHKM1yF0u2giuJ9zg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 092E11083E84;
        Fri, 10 Jan 2020 14:55:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-108.ams2.redhat.com [10.36.117.108])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 22B837C3EB;
        Fri, 10 Jan 2020 14:55:28 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v2 15/16] arm/arm64: ITS: migration tests
Date:   Fri, 10 Jan 2020 15:54:11 +0100
Message-Id: <20200110145412.14937-16-eric.auger@redhat.com>
In-Reply-To: <20200110145412.14937-1-eric.auger@redhat.com>
References: <20200110145412.14937-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ikgH+O4sRR4A

This test maps LPIs (populates the device table, the collection table,
interrupt translation tables, configuration table), migrates and make
sure the translation is correct on the destination.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 arm/gic.c                | 55 +++++++++++++++++++++++++++++++++++++---
 arm/unittests.cfg        |  7 +++++
 lib/arm/asm/gic-v3-its.h |  2 ++
 lib/arm/gic-v3-its.c     | 22 ++++++++++++++++
 4 files changed, 82 insertions(+), 4 deletions(-)

diff --git a/arm/gic.c b/arm/gic.c
index 7f701a1..bf4b5ba 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -641,13 +641,19 @@ static int its_prerequisites(int nb_cpus)
 	return 0;
 }
=20
-static void test_its_trigger(void)
+/*
+ * Setup the configuration for those mappings:
+ * dev_id=3D2 event=3D20 -> vcpu 3, intid=3D8195
+ * dev_id=3D7 event=3D255 -> vcpu 2, intid=3D8196
+ * LPIs ready to hit
+ */
+static int its_setup1(void)
 {
 	struct its_collection *col3, *col2;
 	struct its_device *dev2, *dev7;
=20
 	if (its_prerequisites(4))
-		return;
+		return -1;
=20
 	dev2 =3D its_create_device(2 /* dev id */, 8 /* nb_ites */);
 	dev7 =3D its_create_device(7 /* dev id */, 8 /* nb_ites */);
@@ -661,8 +667,6 @@ static void test_its_trigger(void)
 	its_send_invall(col2);
 	its_send_invall(col3);
=20
-	report_prefix_push("int");
-
 	its_send_mapd(dev2, true);
 	its_send_mapd(dev7, true);
=20
@@ -673,6 +677,23 @@ static void test_its_trigger(void)
 		       20 /* event id */, col3);
 	its_send_mapti(dev7, 8196 /* lpi id */,
 		       255 /* event id */, col2);
+	return 0;
+}
+
+static void test_its_trigger(void)
+{
+	struct its_collection *col3, *col2;
+	struct its_device *dev2, *dev7;
+
+	if (its_setup1())
+		return;
+
+	col3 =3D its_get_collection(3);
+	col2 =3D its_get_collection(2);
+	dev2 =3D its_get_device(2);
+	dev7 =3D its_get_device(7);
+
+	report_prefix_push("int");
=20
 	lpi_stats_expect(3, 8195);
 	its_send_int(dev2, 20);
@@ -721,6 +742,28 @@ static void test_its_trigger(void)
 	check_lpi_stats();
 }
=20
+static void test_its_migration(void)
+{
+	struct its_device *dev2, *dev7;
+
+	if (its_setup1())
+		return;
+
+	dev2 =3D its_get_device(2);
+	dev7 =3D its_get_device(7);
+
+	puts("Now migrate the VM, then press a key to continue...\n");
+	(void)getchar();
+	report(true, "Migration complete");
+
+	lpi_stats_expect(3, 8195);
+	its_send_int(dev2, 20);
+	check_lpi_stats();
+
+	lpi_stats_expect(2, 8196);
+	its_send_int(dev7, 255);
+	check_lpi_stats();
+}
=20
 int main(int argc, char **argv)
 {
@@ -756,6 +799,10 @@ int main(int argc, char **argv)
 		report_prefix_push(argv[1]);
 		test_its_trigger();
 		report_prefix_pop();
+	} else if (!strcmp(argv[1], "its-migration")) {
+		report_prefix_push(argv[1]);
+		test_its_migration();
+		report_prefix_pop();
 	} else if (strcmp(argv[1], "its-introspection") =3D=3D 0) {
 		report_prefix_push(argv[1]);
 		test_its_introspection();
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index 80a1d27..29e2efc 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -140,6 +140,13 @@ smp =3D $MAX_SMP
 extra_params =3D -machine gic-version=3D3 -append 'its-trigger'
 groups =3D its
=20
+[its-migration]
+file =3D gic.flat
+smp =3D $MAX_SMP
+accel =3D kvm
+extra_params =3D -machine gic-version=3D3 -append 'its-migration'
+groups =3D its migration
+
 # Test PSCI emulation
 [psci]
 file =3D psci.flat
diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
index 7d6f8fd..7838a11 100644
--- a/lib/arm/asm/gic-v3-its.h
+++ b/lib/arm/asm/gic-v3-its.h
@@ -166,6 +166,8 @@ extern void its_send_invall(struct its_collection *co=
l);
 extern void its_send_movi(struct its_device *dev,
 			  struct its_collection *col, u32 id);
 extern void its_send_sync(struct its_collection *col);
+extern struct its_device *its_get_device(u32 id);
+extern struct its_collection *its_get_collection(u32 id);
=20
 #define ITS_FLAGS_CMDQ_NEEDS_FLUSHING           (1ULL << 0)
 #define ITS_FLAGS_WORKAROUND_CAVIUM_22375       (1ULL << 1)
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
index 88c08ee..315aedb 100644
--- a/lib/arm/gic-v3-its.c
+++ b/lib/arm/gic-v3-its.c
@@ -303,3 +303,25 @@ struct its_collection *its_create_collection(u32 col=
_id, u32 pe)
 	its_data.nr_collections++;
 	return new;
 }
+
+struct its_device *its_get_device(u32 id)
+{
+	int i;
+
+	for (i =3D 0; i < GITS_MAX_DEVICES; i++) {
+		if (its_data.devices[i].device_id =3D=3D id)
+			return &its_data.devices[i];
+	}
+	return NULL;
+}
+
+struct its_collection *its_get_collection(u32 id)
+{
+	int i;
+
+	for (i =3D 0; i < GITS_MAX_COLLECTIONS; i++) {
+		if (its_data.collections[i].col_id =3D=3D id)
+			return &its_data.collections[i];
+	}
+	return NULL;
+}
--=20
2.20.1

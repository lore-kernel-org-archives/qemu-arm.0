Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3845343wrh;
        Tue, 7 May 2019 09:48:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1QkrIwkC65HeYfAsWSCACirfr4oioBXoffYhuEJaNWxxrE3Sy6au4CCygNFBRihDVSvn9
X-Received: by 2002:a7b:c411:: with SMTP id k17mr21838186wmi.68.1557247705232;
        Tue, 07 May 2019 09:48:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557247705; cv=none;
        d=google.com; s=arc-20160816;
        b=UQim5xqnaG0lADlC8hpZFEBbqRNgYOtjdDxFOZom2/EQFrbpoZ98pgMfLoGxJkm7Fa
         XXtNR8erBA4pICz4G545y5nptQZFbqZea0l4d2qD8cHMVXSY0+KikFMvDXyLFVs0cc4A
         oWTZOcj/fq3Ntplxn4AXr7+iQM2puxbV1ijQOYJeBLtPH8+jmE+A/6pMGMxAD4TQctnr
         WeZmfzNM0Kt5CspGf26wty8W2v9+8TsYF7rnG+Bg8A/pQxRHWqIaKDbQjWY2YhgAZH1a
         veffDvhcTJ7gyQhOK+Mpnfa37rJbdb0mhoUzjMNGewlyaKg8AzrVsFSMSwG29L4vTTh/
         9HHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=PESXrcem7W2GKQsggvpLW6kmiq6pTgsb7Kza3cVrd74=;
        b=mSL9Qo1KeuVF1O4NZr+FanwJ02/23MnOTKIIY7AkrFOsE9ssn30ZsMTwUMVoHD9qL8
         GkW7vPBAceqJ6V2JJZ6u6NGKfv6g9iPSSEbjxjxd08nwXHeXa3c/24U8FBwr35aCza8D
         fa/GqX0/GIzkHlcNDAdOOtupH0ePo+nrSuHXDvsfR787pzd5KQANYni+z+DjxL9u+ix5
         bYGj89RgygwPrHnD8M2C9SytJbDdJ1GQ4VZrunladl1wDIfPFL7prQu8tt/P9OwzDYtX
         F/6M17cJ9uz/pcKEFcMts1/CrEgtAsUb9JrnU9aKERGGiRdFrEbbE+sGvvknEziEp66v
         eQFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18si9973281wrw.339.2019.05.07.09.48.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 09:48:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50013 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO3GS-0004m5-Cq
	for alex.bennee@linaro.org; Tue, 07 May 2019 12:48:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO374-0004S6-Ix
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:38:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO373-0005W3-55
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:38:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:30748)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hO372-0005UU-U5; Tue, 07 May 2019 12:38:41 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8387D30B96D1;
	Tue,  7 May 2019 16:38:37 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B896C8166;
	Tue,  7 May 2019 16:37:59 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Date: Tue,  7 May 2019 18:34:14 +0200
Message-Id: <20190507163416.24647-15-philmd@redhat.com>
In-Reply-To: <20190507163416.24647-1-philmd@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 07 May 2019 16:38:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 14/16] hw/microblaze/zynqmp: Use
 object_initialize_child for correct ref. counting
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Paul Burton <pburton@wavecomp.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Joel Stanley <joel@jms.id.au>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-ppc@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M3I33hSwWAzz

As explained in commit aff39be0ed97:

  Both functions, object_initialize() and object_property_add_child()
  increase the reference counter of the new object, so one of the
  references has to be dropped afterwards to get the reference
  counting right. Otherwise the child object will not be properly
  cleaned up when the parent gets destroyed.
  Thus let's use now object_initialize_child() instead to get the
  reference counting here right.

This patch was generated using the following Coccinelle script
(with a bit of manual fix-up for overly long lines):

 @use_object_initialize_child@
 expression parent_obj;
 expression child_ptr;
 expression child_name;
 expression child_type;
 expression child_size;
 expression errp;
 @@
 (
 -   object_initialize(child_ptr, child_size, child_type);
 +   object_initialize_child(parent_obj, child_name,  child_ptr, child_si=
ze,
 +                           child_type, &error_abort, NULL);
     ... when !=3D parent_obj
 -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr),=
 NULL);
     ...
?-   object_unref(OBJECT(child_ptr));
 |
 -   object_initialize(child_ptr, child_size, child_type);
 +   object_initialize_child(parent_obj, child_name,  child_ptr, child_si=
ze,
 +                            child_type, errp, NULL);
     ... when !=3D parent_obj
 -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr),=
 errp);
     ...
?-   object_unref(OBJECT(child_ptr));
 )

While the object_initialize() function doesn't take an
'Error *errp' argument, the object_initialize_child() does.
Since this code is used when a machine is created (and is not
yet running), we deliberately choose to use the &error_abort
argument instead of ignoring errors if an object creation failed.

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Inspired-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/microblaze/xlnx-zynqmp-pmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-=
pmu.c
index 0948b1fd5f2..df6c0048aa6 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -176,9 +176,9 @@ static void xlnx_zynqmp_pmu_init(MachineState *machin=
e)
                                 pmu_ram);
=20
     /* Create the PMU device */
-    object_initialize(pmu, sizeof(XlnxZynqMPPMUSoCState), TYPE_XLNX_ZYNQ=
MP_PMU_SOC);
-    object_property_add_child(OBJECT(machine), "pmu", OBJECT(pmu),
-                              &error_abort);
+    object_initialize_child(OBJECT(machine), "pmu", pmu,
+                            sizeof(XlnxZynqMPPMUSoCState),
+                            TYPE_XLNX_ZYNQMP_PMU_SOC, &error_abort, NULL=
);
     object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal=
);
=20
     /* Load the kernel */
--=20
2.20.1


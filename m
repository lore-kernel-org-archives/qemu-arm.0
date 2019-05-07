Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3832420wrh;
        Tue, 7 May 2019 09:35:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqym3UVDzyNFdfR18a5sgCDXE297W4TCPH/NYSVQ//B7vQcQ4FqXAKLTu2rds3sJBT/A71a8
X-Received: by 2002:a1c:c18c:: with SMTP id r134mr11088123wmf.124.1557246910103;
        Tue, 07 May 2019 09:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557246910; cv=none;
        d=google.com; s=arc-20160816;
        b=JvMHtcH5W6c+5w+13GDCgKNG2H8BEcnJ8yrPOt+Gu/OijAZMWpcrw0NlhtZprdsDEk
         Ji0IciZr8w+OEm/E6wcNO64JWQvT/OWaPrc/TG052FQn6R5bKOCnXfmahw2OEC060MMu
         oEpkeSVhMDETmQZnfSLVWY6H6ht8BTJRVD8TfRU+SWvoGniHUunILiKw1d4ZJpbfTkKA
         BM3dsMKvOfBCfAXwVOOIX6hBmWL2qnjuDGP3hZMZqIAJwlSEOens45iCeTNqMm8/E6bn
         i6uTHGQbS+j7fgHDquxjtc5QO0r66NWIOwXzzb5h4yJK/feSBUmHZ0kdLPJ0cWd9g8cq
         mRjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=kI/IoPNAy72PEbuZBR7o29nPL37Ye3aYNww1jKoOLtA=;
        b=Pr21xczbUQCHq2mqik0LI5YqQEUK4GZdxryoQT0JfKHvOlnplNUk38RUcFSrQ3vbi1
         n1YNUIh45WODirvpkkdoJWhl0Uf+v5VYaFlA3GsGEGw4kahEITdBZU7oO6+cFZhHu4xF
         rz5bNab+uGt1snmLhBBrAw3zHD6cYI8fNj8tzPaiLlmtF2ESNFJ9n+seYV14bI3lzZj7
         IwEyMYZtCKKGZhwzeHznVHLn+d3hn4Rk/+lArftgnDi21nZDKssRYWVPaPEkf4/8jcCr
         WFDadCVl4Lpw5+lqTn2lim65igeVFsmP+3H7Enky0XaifOidLNvf6WVMeLiP40jZypmq
         kkXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si2087547wrn.408.2019.05.07.09.35.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 09:35:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO33d-0008Te-3B
	for alex.bennee@linaro.org; Tue, 07 May 2019 12:35:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO33K-0008SR-0I
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:34:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO33I-0000eL-AF
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:34:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47008)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hO33I-0000cj-2T; Tue, 07 May 2019 12:34:48 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 71700806A6;
	Tue,  7 May 2019 16:34:46 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 071EA8163;
	Tue,  7 May 2019 16:34:37 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Date: Tue,  7 May 2019 18:34:01 +0200
Message-Id: <20190507163416.24647-2-philmd@redhat.com>
In-Reply-To: <20190507163416.24647-1-philmd@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 07 May 2019 16:34:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 01/16] hw/ppc/pnv: Use object_initialize_child
 for correct reference counting
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
X-TUID: 4EhJj/1OlhTD

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
 hw/ppc/pnv.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index dfb4ea5742c..31aa20ee25d 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -994,14 +994,12 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9, =
Error **errp)
         PnvCore *pnv_core =3D PNV_CORE(chip->cores + (i * 4) * typesize)=
;
         int core_id =3D CPU_CORE(pnv_core)->core_id;
=20
-        object_initialize(eq, sizeof(*eq), TYPE_PNV_QUAD);
         snprintf(eq_name, sizeof(eq_name), "eq[%d]", core_id);
+        object_initialize_child(OBJECT(chip), eq_name, eq, sizeof(*eq),
+                                TYPE_PNV_QUAD, &error_fatal, NULL);
=20
-        object_property_add_child(OBJECT(chip), eq_name, OBJECT(eq),
-                                  &error_fatal);
         object_property_set_int(OBJECT(eq), core_id, "id", &error_fatal)=
;
         object_property_set_bool(OBJECT(eq), true, "realized", &error_fa=
tal);
-        object_unref(OBJECT(eq));
=20
         pnv_xscom_add_subregion(chip, PNV9_XSCOM_EQ_BASE(eq->id),
                                 &eq->xscom_regs);
@@ -1165,10 +1163,9 @@ static void pnv_chip_core_realize(PnvChip *chip, E=
rror **errp)
             continue;
         }
=20
-        object_initialize(pnv_core, typesize, typename);
         snprintf(core_name, sizeof(core_name), "core[%d]", core_hwid);
-        object_property_add_child(OBJECT(chip), core_name, OBJECT(pnv_co=
re),
-                                  &error_fatal);
+        object_initialize_child(OBJECT(chip), core_name, pnv_core, types=
ize,
+                                typename, &error_fatal, NULL);
         object_property_set_int(OBJECT(pnv_core), smp_threads, "nr-threa=
ds",
                                 &error_fatal);
         object_property_set_int(OBJECT(pnv_core), core_hwid,
@@ -1180,7 +1177,6 @@ static void pnv_chip_core_realize(PnvChip *chip, Er=
ror **errp)
                                        OBJECT(chip), &error_fatal);
         object_property_set_bool(OBJECT(pnv_core), true, "realized",
                                  &error_fatal);
-        object_unref(OBJECT(pnv_core));
=20
         /* Each core has an XSCOM MMIO region */
         if (!pnv_chip_is_power9(chip)) {
--=20
2.20.1


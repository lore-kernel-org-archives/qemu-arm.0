Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2648854lft;
        Mon, 27 Jun 2022 13:11:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s311xsenxjPKFuofNLQgBc40KPJnHMWB3kWZOoAbeHwAoQTneMjJMo09cFCEmai1rXGOGJ
X-Received: by 2002:a37:a884:0:b0:6ae:e67a:beec with SMTP id r126-20020a37a884000000b006aee67abeecmr9266586qke.401.1656360703525;
        Mon, 27 Jun 2022 13:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656360703; cv=none;
        d=google.com; s=arc-20160816;
        b=EbzY37wnEYipmdFwfPpT2FqZEg1zEhdRIGmr7/8Q3s/HsRrcq3rmLE0zxnibFz37eN
         mq0QHNAUQph9cDKOpBNrxlsqEn6bo5dQbZFsWA1gN48eZBIkPxVd0DZsFuHl4PmUG5ZH
         Hfs+Ud/H2DNfUnK/FGmKjUJCkD7jwKtvERMhLGu6zrPwFWKe2mtRPEB9QtzHUiYMQwFS
         gAn/tTWSSuyNoTW+mUdGfAqIhvyqxKJGOXRfoOqKSWOthkFHf49GQPH+3qvpX7/dldPU
         V+FmMz4OjuCyFd99huQJIm6DNcrAsyAbDBcNEd/rJmYLKvhi6CGRAXwDOjxS+69WBh1N
         4gtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yGoG37WHEeFwrsuK9OehoBxcXBgyYYBQC2YgIx+abWQ=;
        b=fEwA8gbvs9OX0KPq7aDecKYRY7maxgLkh/2MRPkkR3ePmoN08Wbi8UzEA3fbHTgJGP
         vvdiWguH3krXJIcK6aTr0qsrSKOBcuELlVtbWRYRUIEQGPlWKdVHfrjGdL3sUdNSFGMW
         wrguWc+lQmFL4ceJ/uXUzL9uMsDaemhlNXzknqi1FF/flyPOUAa2P97+r6l1ok5PZZbc
         vM4vV4JjbNaeqjDKjHENgUuP3tnzFqDUlfeK/WHjW56YsQvjFH6ucZ81lX8udSojv420
         2zFpvrep7tdPLbgOJexebWkHIU83a5OdyUq6A0NDBcW6OdGSZlrnxIDeoON4OGfA/jVL
         fyKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=FHy+tXtQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a26-20020ac8435a000000b003180c541626si3697481qtn.729.2022.06.27.13.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 13:11:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=FHy+tXtQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:48240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5v5D-0000kU-0f
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 16:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upg-0004rd-Mp
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 15:55:40 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:64772
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upd-0000gW-EO
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 15:55:40 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1Qq2015417
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 12:55:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=yGoG37WHEeFwrsuK9OehoBxcXBgyYYBQC2YgIx+abWQ=;
 b=FHy+tXtQu2obIC+0mh+QkILaIcPrQ0St+o01sIx4q+AvH3BkbHFg3/gNBQTJrMdruV6y
 g+ewRVSSEBYdqdIV/3ipGO9qIHZ0rF9WAPFYgOv8B2uBTLLOLyrYFQpcEL2pnOYRsKvM
 kj3IwXqUa/yTqZyb/Z9TH5KDu7Mq9DEMknU= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net (PPS) with ESMTPS id 3gwwv756tr-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 12:55:36 -0700
Received: from twshared18443.03.prn6.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:11d::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 12:55:35 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id F043D8D206F3; Mon, 27 Jun 2022 12:55:07 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <zhdaniel@fb.com>, <clg@kaod.org>, <qemu-devel@nongnu.org>, 
 <qemu-arm@nongnu.org>, <komlodi@google.com>, <titusr@google.com>,
 <andrew@aj.id.au>, <joel@jms.id.au>
Subject: [PATCH 10/14] pmbus: Add read-only IC_DEVICE_ID support
Date: Mon, 27 Jun 2022 12:55:02 -0700
Message-ID: <20220627195506.403715-11-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627195506.403715-1-pdel@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: H2gdcRYBlaMS0T7nI3iywNBJ7KtfaT3a
X-Proofpoint-ORIG-GUID: H2gdcRYBlaMS0T7nI3iywNBJ7KtfaT3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=71779173e5=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fu0zsyiPlK51

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/pmbus_device.c            |  5 +++++
 hw/sensor/isl_pmbus_vr.c         | 30 ++++++++++++++++++++++++++++++
 include/hw/i2c/pmbus_device.h    |  1 +
 include/hw/sensor/isl_pmbus_vr.h |  1 +
 4 files changed, 37 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index efddc36fd9..82131fff85 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -984,6 +984,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         }
         break;
=20
+    case PMBUS_IC_DEVICE_ID:
+        pmbus_send(pmdev, pmdev->pages[index].ic_device_id,
+                   sizeof(pmdev->pages[index].ic_device_id));
+        break;
+
     case PMBUS_CLEAR_FAULTS:              /* Send Byte */
     case PMBUS_PAGE_PLUS_WRITE:           /* Block Write-only */
     case PMBUS_STORE_DEFAULT_ALL:         /* Send Byte */
diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
index e11e028884..b0d2f49e9d 100644
--- a/hw/sensor/isl_pmbus_vr.c
+++ b/hw/sensor/isl_pmbus_vr.c
@@ -218,6 +218,27 @@ static void isl_pmbus_vr_class_init(ObjectClass *kla=
ss, void *data,
     k->device_num_pages =3D pages;
 }
=20
+static void isl69259_init(Object *obj)
+{
+    static const uint8_t ic_device_id[] =3D {0x04, 0x00, 0x81, 0xD2, 0x4=
9};
+    PMBusDevice *pmdev =3D PMBUS_DEVICE(obj);
+    int i;
+
+    raa22xx_init(obj);
+    for (i =3D 0; i < pmdev->num_pages; i++) {
+        memcpy(pmdev->pages[i].ic_device_id, ic_device_id, sizeof(ic_dev=
ice_id));
+    }
+}
+
+static void isl69259_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    dc->desc =3D "Renesas ISL69259 Digital Multiphase Voltage Regulator"=
;
+    rc->phases.exit =3D isl_pmbus_vr_exit_reset;
+    isl_pmbus_vr_class_init(klass, data, 2);
+}
+
 static void isl69260_class_init(ObjectClass *klass, void *data)
 {
     ResettableClass *rc =3D RESETTABLE_CLASS(klass);
@@ -245,6 +266,14 @@ static void raa229004_class_init(ObjectClass *klass,=
 void *data)
     isl_pmbus_vr_class_init(klass, data, 2);
 }
=20
+static const TypeInfo isl69259_info =3D {
+    .name =3D TYPE_ISL69259,
+    .parent =3D TYPE_PMBUS_DEVICE,
+    .instance_size =3D sizeof(ISLState),
+    .instance_init =3D isl69259_init,
+    .class_init =3D isl69259_class_init,
+};
+
 static const TypeInfo isl69260_info =3D {
     .name =3D TYPE_ISL69260,
     .parent =3D TYPE_PMBUS_DEVICE,
@@ -271,6 +300,7 @@ static const TypeInfo raa228000_info =3D {
=20
 static void isl_pmbus_vr_register_types(void)
 {
+    type_register_static(&isl69259_info);
     type_register_static(&isl69260_info);
     type_register_static(&raa228000_info);
     type_register_static(&raa229004_info);
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.=
h
index 0f4d6b3fad..aed7809841 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -407,6 +407,7 @@ typedef struct PMBusPage {
     uint16_t mfr_max_temp_1;           /* R/W word */
     uint16_t mfr_max_temp_2;           /* R/W word */
     uint16_t mfr_max_temp_3;           /* R/W word */
+    uint8_t ic_device_id[16];          /* Read-Only block-read */
 } PMBusPage;
=20
 /* State */
diff --git a/include/hw/sensor/isl_pmbus_vr.h b/include/hw/sensor/isl_pmb=
us_vr.h
index 3e47ff7e48..d501b3bc82 100644
--- a/include/hw/sensor/isl_pmbus_vr.h
+++ b/include/hw/sensor/isl_pmbus_vr.h
@@ -12,6 +12,7 @@
 #include "hw/i2c/pmbus_device.h"
 #include "qom/object.h"
=20
+#define TYPE_ISL69259   "isl69259"
 #define TYPE_ISL69260   "isl69260"
 #define TYPE_RAA228000  "raa228000"
 #define TYPE_RAA229004  "raa229004"
--=20
2.30.2


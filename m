Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1065159wrt;
        Tue, 20 Nov 2018 13:27:02 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UsuK5ZWXLyBeAnkKED8rsB2CX29ksAj6bHmmpzUC9aXvG0qNp+g8UEZheFpvm5KF7SH/Hv
X-Received: by 2002:a25:4c46:: with SMTP id z67-v6mr3649854yba.395.1542749222247;
        Tue, 20 Nov 2018 13:27:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542749222; cv=none;
        d=google.com; s=arc-20160816;
        b=GFOYsva0IjXdd3XicmUcL0hDv1ma+QezlaSyEUuw0QzkhbdjKGWNkl6E6jTnpDay6Z
         6b/P5LNfqLKdR99Xjh6GqGEhqPQ2z2igNXP4iqK3TaP3rSdNAAl53ye8BATnj76G2vlP
         iyTQI1+dipDaa8AD7NY2FopEzb4yNOKNqwZjJy9elVCT0/7lFDBHw4xv0R3VFxy7KTCf
         bEmYbPIlnyBAHb20RE00631L7S2g5VIgZNmxCCuyBcBGSkHkjpbWtH4bMknOmmRUfcBY
         9KXhpgXeY2BQsxT+JD4a6aaVs2EfnGOclnwWBva4gQMyWcKLfcTVVlkPuu1SJL9ICLbe
         0noA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=e0xljn+F6NO02pjuqj3+I2jXSlzmoVez31Juu+hYRRk=;
        b=QMfgK9jm8wKTO7+zblAR8YxaMwyt3xVA1KzdW0EXfM3biuqRfe14G0ZETGqTMcyGBp
         j5vWNi3m+R5uHDShSfJSlOSdaubsD3EhA0sbzxI0kc3SDeHKhQPl0T2mfmLNfuIJiD+B
         eRY7qTuTY4P0ngZcyWqaeULiuWRf9xO01BRvA8rjyHX8xKOVKb6jtst1j4XngPIQPMtA
         simidmGKKSKHuz7lRFQf3zqU2QhbYWWY+T+QRz42PjZKGINp+PHKAs3YK/5i/Yt3LULe
         53tTLeCvTJ9yDobJj3lml01qYBZtE1mQ3MWsGP/gEncayU+lgRYkvyoJOYzG7ZDE7bKy
         WO8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=jU+tB3kT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d185si10126231ywb.95.2018.11.20.13.27.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 13:27:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=jU+tB3kT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:35998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPDXx-00005r-Id
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 16:27:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXd-0008Sy-Dj
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXX-0005CT-Qw
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:41 -0500
Received: from mail-eopbgr800101.outbound.protection.outlook.com
	([40.107.80.101]:32800
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gPDXX-00057j-6l; Tue, 20 Nov 2018 16:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=e0xljn+F6NO02pjuqj3+I2jXSlzmoVez31Juu+hYRRk=;
	b=jU+tB3kTEud0+Cm8FxChWjOft3GiuaPeYJSezI5+XNtrogP2+4EqMrXU5A/+o8rQinoXQOIrzq6HLk0L6mddrpt8J+AetwiVtyEsBfhVtcxP64LAgTdwMALG7luvmsNvXar5jd8DECx8d5ZzZtPW3qoC4gATEMGFX13fo9Uhspw=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5228.prod.exchangelabs.com (20.177.219.205) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.23; Tue, 20 Nov 2018 21:26:32 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.048;
	Tue, 20 Nov 2018 21:26:32 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v8 01/13] migration: Add post_save function to
	VMStateDescription
Thread-Index: AQHUgRe03ofRNZIVCEK615y8LUjj7w==
Date: Tue, 20 Nov 2018 21:26:32 +0000
Message-ID: <20181120212553.8480-2-aaron@os.amperecomputing.com>
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181120212553.8480-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR04CA0037.namprd04.prod.outlook.com
	(2603:10b6:903:c6::23) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.155]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5228;
	6:ThsJUFnSf1CCHRAJz/6qxUDzpr8PPHFgtJMBiWUl0e4JEK15QI1x6zEZyHoeth6TwpCzTO6CnMI2LvkqGhMWJEAaRfBG1pdOAacrJitxMmhZdDYx4BPqAv17V7jpxCwrx0ib1G9A4rFeljBhcazhYV2UhpjSR1ztEsmZYh63V1onJWpQgvbuBJXagkYSA0tT3pcSRzv8XOyTTC9g68+dFXPjRy+ZnyVDI4C3cMvvui7oQ5GW0mo5acvhpxSODu3TPiTiCsN3EzYjiKI4ZXyiyP5Kz/mP7FVkTbYXRufIfBbz6EC+9Wy+h9x90aVBhfnp9lDlcsa6u9yTRxCOa5HhbDSpd0eip0PBt7BBwpqNt7eYs+h3PvWH/DVtQC4Krp/yCNm6NnCuf7AEcewaWPh+g31iJZ1GDjoOhX2DHjlUoZ0A16CA7mQgjtmBK/YqngBHj5nJc+HmiSS9Q8++3N/QJw==;
	5:rQlvJKm9kTSbCo+rG/BvERV+4/ZzAriLhE4HcrkE4wMW4gc0QOYaBgr2nUuK1XqMvafBDOXtEcNtDXY3Pp6xO3SrfRwxANS45el6hFmOMlfsP0dkCqxqqjrxEIA2humjxzDupcZQhYKaaPeaGp13If4dwABwwGwOm3zC6GB74tQ=;
	7:Q9NsDWhreZouJriR6dtyVvv0xRVTaQanbDyEBISFXVxZe2hNWth9lQvL/kfYdgaWxiIJt/lw+ZCLfb+U/2wee7RTgf1R+B+12UR9qa5DNhdMgJu1txpZY/UXmxPmv+LQ7S8Jo0uHr5sJ2rsfr9r3Aw==
x-ms-office365-filtering-correlation-id: 8ef34d4b-2f27-4dbe-d080-08d64f2ed73f
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5228; 
x-ms-traffictypediagnostic: DM6PR01MB5228:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-microsoft-antispam-prvs: <DM6PR01MB5228C3A7BE1EFFE7EC96EBAF8AD90@DM6PR01MB5228.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231442)(944501410)(52105112)(10201501046)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5228; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5228; 
x-forefront-prvs: 08626BE3A5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(39840400004)(366004)(396003)(136003)(189003)(199004)(305945005)(4326008)(39060400002)(71200400001)(7736002)(71190400001)(2906002)(6436002)(7416002)(14454004)(3846002)(6116002)(14444005)(256004)(1076002)(86362001)(316002)(11346002)(6486002)(446003)(2616005)(53936002)(5660300001)(486006)(110136005)(6512007)(54906003)(476003)(478600001)(186003)(2501003)(66066001)(26005)(97736004)(25786009)(76176011)(68736007)(6506007)(106356001)(99286004)(105586002)(8936002)(386003)(81166006)(102836004)(81156014)(52116002)(8676002)(2900100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5228;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: vPO4Lr7Y+SSzMAkVq//MsSgObPuLpZHdf9O99T3WYuXsnh056cNgj5o5b2M6PI7T1jiab9XD0gm5Nkf+F5lVNwcQy3bx7/Exe3XejqIPh6aOHQXC0XRA9siZHbjNW0rRA2LwH/+NR26u5TQvSIZFWvrnDqUYrDEEjfk+zZIVzWm9fqNd7bEE373+RCDy+kN4hvV0+1YD44y7ivSTT4Y7d/rGSxSwDriyajseZk1N/9mFo7zFOuFJC+rnF9okLoLPUK+ardkXf+ZLbVlGDvTaUTLh/TuzG+cD3HmpakRGwV+eR52kescgAxRVn2aDBTPRPU+riye0lQnAkX0YPnX9qB0bbs3n6k28quKqwQL6b1s=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef34d4b-2f27-4dbe-d080-08d64f2ed73f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2018 21:26:32.1002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5228
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.80.101
Subject: [Qemu-arm] [PATCH v8 01/13] migration: Add post_save function to
 VMStateDescription
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
	Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SeQX7iMbEfBk

In some cases it may be helpful to modify state before saving it for
migration, and then modify the state back after it has been saved. The
existing pre_save function provides half of this functionality. This
patch adds a post_save function to provide the second half.

Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/devel/migration.rst    |  9 +++++++--
 include/migration/vmstate.h |  1 +
 migration/vmstate.c         | 13 ++++++++++++-
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index e7658ab050..220059679a 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -419,8 +419,13 @@ The functions to do that are inside a vmstate definiti=
on, and are called:
=20
   This function is called before we save the state of one device.
=20
-Example: You can look at hpet.c, that uses the three function to
-massage the state that is transferred.
+- ``int (*post_save)(void *opaque);``
+
+  This function is called after we save the state of one device
+  (even upon failure, unless the call to pre_save returned an error).
+
+Example: You can look at hpet.c, that uses the first three functions
+to massage the state that is transferred.
=20
 The ``VMSTATE_WITH_TMP`` macro may be useful when the migration
 data doesn't match the stored device data well; it allows an
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 2b501d0466..9355d83056 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -185,6 +185,7 @@ struct VMStateDescription {
     int (*pre_load)(void *opaque);
     int (*post_load)(void *opaque, int version_id);
     int (*pre_save)(void *opaque);
+    int (*post_save)(void *opaque);
     bool (*needed)(void *opaque);
     VMStateField *fields;
     const VMStateDescription **subsections;
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 0bc240a317..c15d75260a 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -387,6 +387,9 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDesc=
ription *vmsd,
                 if (ret) {
                     error_report("Save of field %s/%s failed",
                                  vmsd->name, field->name);
+                    if (vmsd->post_save) {
+                        vmsd->post_save(opaque);
+                    }
                     return ret;
                 }
=20
@@ -412,7 +415,15 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDes=
cription *vmsd,
         json_end_array(vmdesc);
     }
=20
-    return vmstate_subsection_save(f, vmsd, opaque, vmdesc);
+    ret =3D vmstate_subsection_save(f, vmsd, opaque, vmdesc);
+
+    if (vmsd->post_save) {
+        int ps_ret =3D vmsd->post_save(opaque);
+        if (!ret) {
+            ret =3D ps_ret;
+        }
+    }
+    return ret;
 }
=20
 static const VMStateDescription *
--=20
2.19.1

